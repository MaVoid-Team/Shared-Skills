param(
    [string]$Folder = ".",
    [switch]$Fix,
    [switch]$Verbose
)

function Write-Log { if($Verbose){ Write-Host $args } }

$errors = @()

Get-ChildItem -Path $Folder -Recurse -Filter SKILL.md -File | ForEach-Object {
    $path = $_.FullName
    $content = Get-Content -Path $path -Raw
    if($content -notmatch '(?s)^---.*?---'){
        $errors += "[MISSING YAML] $path"
        return
    }

    $yamlMatch = [regex]::Match($content, '(?s)^(---\s*\r?\n)(.*?)(\r?\n---)')
    if(-not $yamlMatch.Success){
        $errors += "[PARSE FAIL] $path"
        return
    }

    $yaml = $yamlMatch.Groups[2].Value -split "\r?\n"
    $hasName = $false
    $hasDescription = $false
    $descLineIndex = -1
    for($i=0; $i -lt $yaml.Length; $i++){
        $line = $yaml[$i]
        if($line -match '^[ ]*name[ ]*:'){ $hasName = $true }
        if($line -match '^[ ]*description[ ]*:(.*)$'){
            $hasDescription = $true
            $descLineIndex = $i
        }
    }

    if(-not $hasName){ $errors += "[MISSING NAME] $path" }
    if(-not $hasDescription){ $errors += "[MISSING DESCRIPTION] $path" }

    if($hasDescription){
        $descLine = $yaml[$descLineIndex]
        if($descLine -notmatch '(?i)use for:'){
            $errors += "[MISSING Use for:] $path"
            if($Fix){
                $line = $descLine -replace '^(\s*description\s*:\s*)(.*)$', '$1$2 Use for: (add when to use this skill in your project).'
                $yaml[$descLineIndex] = $line
                # reconstruct content
                $newYaml = $yaml -join "`n"
                $newContent = "---`n$newYaml`n---" + $content.Substring($yamlMatch.Length)
                Set-Content -Path $path -Value $newContent -Encoding UTF8
                Write-Log "Fixed Use for clause in $path"
            }
        }
    }
}

if($errors.Count -gt 0){
    Write-Host "Metadata issues found (run with -Fix to auto-fix some):"
    $errors | Sort-Object | ForEach-Object { Write-Host " - $_" }
} else {
    Write-Host "No metadata issues found. All SKILL.md files have name, description, and a Use for clause." 
}
