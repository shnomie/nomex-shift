$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$required = @(
    'README.md', 'LICENSE.md', 'SECURITY.md', 'SUPPORT.md', 'CONTRIBUTING.md', 'CHANGELOG.md',
    '.gitignore', '.github\repository-config.yml', '.github\RELEASE_TEMPLATE.md',
    '.github\ISSUE_TEMPLATE\bug_report.yml', '.github\ISSUE_TEMPLATE\feature_request.yml',
    '.github\workflows\publish-release.yml', '.github\workflows\validate-repository.yml',
    'docs\CONFIGURATION.md', 'docs\PUBLISHING.md', 'docs\REPOSITORY_SETUP.md', 'release-assets\README.md',
    'legal\EULA.md', 'legal\PRIVACY_POLICY.md', 'legal\DISCLAIMER.md', 'legal\THIRD_PARTY_NOTICES.md',
    'assets\nomex-shift-banner.png', 'assets\nomex-rocket-n.png',
    'screenshots\home.png', 'screenshots\spoofer.png', 'screenshots\premium.png'
)
foreach ($relative in $required) {
    if (-not (Test-Path -LiteralPath (Join-Path $repositoryRoot $relative))) { throw "Missing required public file: $relative" }
}

$forbiddenExtensions = '.exe','.msi','.msix','.pfx','.p12','.key','.pem','.sqlite','.db','.cs','.xaml','.csproj','.rs','.ts','.tsx','.py'
$forbidden = Get-ChildItem -LiteralPath $repositoryRoot -Recurse -File -Force |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        $_.FullName -notmatch '[\\/]release-assets[\\/]' -and
        $forbiddenExtensions -contains $_.Extension.ToLowerInvariant()
    }
if ($forbidden) { throw "Forbidden public files found:`n$($forbidden.FullName -join "`n")" }

$textFiles = Get-ChildItem -LiteralPath $repositoryRoot -Recurse -File -Force |
    Where-Object { $_.Extension -in '.md','.yml','.yaml','.ps1','.txt' }
$secretPatterns = 'BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY','discord(?:app)?\.[\w-]{20,}\.[\w-]{20,}','gh[pousr]_[A-Za-z0-9_]{30,}','AKIA[0-9A-Z]{16}'
foreach ($file in $textFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding utf8
    foreach ($pattern in $secretPatterns) {
        if ($content -match $pattern) { throw "Possible secret in $($file.FullName)" }
    }
}

$config = Get-Content -LiteralPath (Join-Path $repositoryRoot '.github\repository-config.yml') -Raw
if ($config -match '(?m)^owner:\s*OWNER\s*$|(?m)^repository:\s*REPOSITORY\s*$') { throw 'Set repository owner/name in .github/repository-config.yml.' }

$unresolved = Select-String -Path (Join-Path $repositoryRoot 'README.md') -Pattern '\{\{[A-Z_]+\}\}'
if ($unresolved) { throw 'README contains unresolved generated tokens.' }
$unresolvedIssueConfig = Select-String -Path (Join-Path $repositoryRoot '.github\ISSUE_TEMPLATE\config.yml') -Pattern '\{\{[A-Z_]+\}\}'
if ($unresolvedIssueConfig) { throw 'Issue navigation contains unresolved generated tokens.' }

$obsoletePattern = 'https://(?:postback\.)?' + 'nomexbot\.lol'
$obsoleteDomains = Select-String -Path $textFiles.FullName -Pattern $obsoletePattern
if ($obsoleteDomains) { throw 'An unverified Nomex web URL remains in the public repository. Use configured GitHub destinations until the service is live.' }

$brokenLinks = @()
foreach ($file in $textFiles | Where-Object { $_.Extension -eq '.md' -and $_.FullName -notmatch '[\\/]templates[\\/]' }) {
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding utf8
    foreach ($match in [regex]::Matches($content, '!?(?:\[[^\]]*\])\(([^)]+)\)')) {
        $target = $match.Groups[1].Value.Trim().Trim('<','>')
        if ($target -match '^(?:https?://|mailto:|#)' -or $target -match '(?:^|/)releases/(?:latest|tag/)' -or [string]::IsNullOrWhiteSpace($target)) { continue }
        $relative = [Uri]::UnescapeDataString(($target -split '#', 2)[0])
        if ([string]::IsNullOrWhiteSpace($relative)) { continue }
        $resolved = Join-Path $file.DirectoryName $relative
        if (-not (Test-Path -LiteralPath $resolved)) { $brokenLinks += "$($file.FullName): $target" }
    }
}
if ($brokenLinks) { throw "Broken local Markdown links:`n$($brokenLinks -join "`n")" }

$trackedBinaries = git -C $repositoryRoot ls-files -- '*.exe' '*.msi' '*.msix' '*.pfx' '*.p12' '*.pem' '*.key'
if ($LASTEXITCODE -ne 0) { throw 'Unable to inspect tracked files with Git.' }
if ($trackedBinaries) { throw "Forbidden binary or credential material is tracked:`n$($trackedBinaries -join "`n")" }

Write-Host 'Public repository validation passed: release-only files, required documentation, and basic secret checks are clean.'
