param(
    [string]$Folder = ".",
    [switch]$Fix,
    [switch]$Verbose,
    [switch]$FailOnError
)

function Write-Log {
    if($Verbose){
        Write-Host ($args -join " ")
    }
}

function Escape-DoubleQuotes([string]$text){
    return $text -replace '"', '\\"'
}

function Get-FrontmatterMatch([string]$content){
    return [regex]::Match($content, '(?s)^---\s*\r?\n(.*?)\r?\n---')
}

$hasConvertFromYaml = $null -ne (Get-Command ConvertFrom-Yaml -ErrorAction SilentlyContinue)

$errors = @()
$candidates = Get-ChildItem -Path $Folder -Recurse -File -Include "*.md"

if($candidates.Count -eq 0){
    Write-Host "No markdown files found to validate in $Folder"
    exit 0
}

foreach($file in $candidates){
    $path = $file.FullName
    $content = Get-Content -Path $path -Raw

    # Ignore non-skill markdown files that do not start with YAML frontmatter.
    if($content -notmatch '(?s)^---\s*\r?\n'){
        Write-Log "Skipping (no frontmatter): $path"
        continue
    }

    $frontmatter = Get-FrontmatterMatch $content
    if(-not $frontmatter.Success){
        $errors += "[MISSING YAML] $path"
        continue
    }

    $yamlBody = $frontmatter.Groups[1].Value
    if($yamlBody -match "`t"){
        $errors += "[YAML TAB INDENTATION] $path"
    }
    $nameLine = [regex]::Match($yamlBody, '(?m)^\s*name\s*:\s*(.+)$')
    $descLine = [regex]::Match($yamlBody, '(?m)^\s*description\s*:\s*(.*)$')

    if(-not $nameLine.Success){ $errors += "[MISSING NAME] $path" }
    if(-not $descLine.Success){ $errors += "[MISSING DESCRIPTION] $path" }

    $updated = $false

    if($descLine.Success){
        $descValue = $descLine.Groups[1].Value.Trim()
        $isQuoted = ($descValue.StartsWith('"') -and $descValue.EndsWith('"')) -or ($descValue.StartsWith("'") -and $descValue.EndsWith("'"))

        if($descValue -notmatch '(?i)use for:'){
            if($Fix){
                $base = if($isQuoted){ $descValue.Trim('"').Trim("'") } else { $descValue }
                $safe = Escape-DoubleQuotes ($base + " Use for: (add when to use this skill in your project).")
                $newDesc = 'description: "' + $safe + '"'
                $yamlBody = [regex]::Replace($yamlBody, '(?m)^\s*description\s*:\s*.*$', $newDesc)
                $updated = $true
                Write-Log "Added Use for clause in $path"
            } else {
                $errors += "[MISSING Use for:] $path"
            }
        } elseif((-not $isQuoted) -and ($descValue -match ':[ ]')){
            if($Fix){
                $safe = Escape-DoubleQuotes $descValue
                $newDesc = 'description: "' + $safe + '"'
                $yamlBody = [regex]::Replace($yamlBody, '(?m)^\s*description\s*:\s*.*$', $newDesc)
                $updated = $true
                Write-Log "Quoted description for YAML safety in $path"
            } else {
                $errors += "[UNQUOTED DESCRIPTION WITH COLON] $path"
            }
        }
    }

    if($updated){
        $newContent = [regex]::Replace($content, '(?s)^---\s*\r?\n.*?\r?\n---', "---`n$yamlBody`n---")
        Set-Content -Path $path -Value $newContent -Encoding utf8
        $content = $newContent
    }

    $frontmatterAfter = Get-FrontmatterMatch $content
    if(-not $frontmatterAfter.Success){
        $errors += "[PARSE FAIL] $path"
        continue
    }

    if($hasConvertFromYaml){
        try {
            $parsed = ConvertFrom-Yaml $frontmatterAfter.Groups[1].Value
            if(-not $parsed.name){ $errors += "[MISSING NAME VALUE] $path" }
            if(-not $parsed.description){ $errors += "[MISSING DESCRIPTION VALUE] $path" }
            if($parsed.description -and ([string]$parsed.description -notmatch '(?i)use for:')){
                $errors += "[MISSING Use for: VALUE] $path"
            }
        } catch {
            $errors += "[INVALID YAML] $path - $($_.Exception.Message)"
        }
    } else {
        # Fallback mode: strict regex checks above are used when ConvertFrom-Yaml is unavailable.
    }
}

if($errors.Count -gt 0){
    Write-Host "Metadata issues found (run with -Fix to auto-fix some):"
    $errors | Sort-Object | ForEach-Object { Write-Host " - $_" }
    if($FailOnError){
        throw "Skill metadata validation failed with $($errors.Count) issue(s)."
    }
} else {
    Write-Host "No metadata issues found. All checked markdown skill files have valid YAML frontmatter with name, description, and a Use for clause."
}
