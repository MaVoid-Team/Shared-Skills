param(
    [Parameter(Mandatory=$true)]
    [string]$RepoUrl,

    [string]$RepoSubpath = "",
    [string]$DestSkillsDir = "Agent-Skills/Imported-Skills",
    [string]$TempCloneDir = ".skill-import-tmp",
    [switch]$ForceClone,
    [switch]$VerboseOutput
)

function Write-Log { if($VerboseOutput){ Write-Host "$($args -join ' ')" } }

# 1) Clone or update repo
if(Test-Path $TempCloneDir -PathType Container){
    if($ForceClone){ Remove-Item -Recurse -Force $TempCloneDir }
}

if(-not (Test-Path $TempCloneDir -PathType Container)){
    Write-Log "Cloning $RepoUrl into $TempCloneDir"
    git clone $RepoUrl $TempCloneDir
} else {
    Write-Log "Updating existing clone in $TempCloneDir"
    Push-Location $TempCloneDir
    git pull
    Pop-Location
}

# 2) Determine source skill folder
$sourceRoot = if([string]::IsNullOrWhiteSpace($RepoSubpath)){ $TempCloneDir } else { Join-Path $TempCloneDir $RepoSubpath }
if(-not (Test-Path $sourceRoot -PathType Container)){
    throw "Source path not found: $sourceRoot"
}

# 3) Copy markdown skill files
New-Item -ItemType Directory -Path $DestSkillsDir -Force | Out-Null
$mdFiles = Get-ChildItem -Path $sourceRoot -Filter "*.md" -File -Recurse
Write-Log "Found $($mdFiles.Count) markdown files under $sourceRoot"

foreach($md in $mdFiles){
    $destPath = Join-Path $DestSkillsDir $md.Name
    Copy-Item -Path $md.FullName -Destination $destPath -Force
}

# 4) Normalize/validate metadata
.
"$PSScriptRoot/validate_skill_metadata.ps1" -Folder $DestSkillsDir -Fix -Verbose:$VerboseOutput

# 5) Generate .skill packages
$skillPackDir = Join-Path $DestSkillsDir "manus-skill-packages"
Remove-Item -Recurse -Force $skillPackDir -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $skillPackDir | Out-Null

Add-Type -AssemblyName System.IO.Compression.FileSystem

foreach($md in Get-ChildItem -Path $DestSkillsDir -Filter "*.md"){
    $skillName = $md.BaseName
    $tmp = Join-Path $env:TEMP "skill-pack-$($skillName)"
    Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Path $tmp | Out-Null
    $skillRoot = Join-Path $tmp $skillName
    New-Item -ItemType Directory -Path $skillRoot | Out-Null
    Copy-Item -Path $md.FullName -Destination (Join-Path $skillRoot "SKILL.md") -Force

    $outZip = Join-Path $skillPackDir ($skillName + ".skill")
    if(Test-Path $outZip){ Remove-Item $outZip -Force }
    [System.IO.Compression.ZipFile]::CreateFromDirectory($tmp, $outZip)
    Write-Log "Created $outZip"
    Remove-Item -Recurse -Force $tmp
}

Write-Host "Skill import complete. .skill packages are in: $skillPackDir"
