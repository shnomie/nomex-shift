$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$configPath = Join-Path $repositoryRoot '.github\repository-config.yml'
$templatePath = Join-Path $repositoryRoot 'templates\README.template.md'
$outputPath = Join-Path $repositoryRoot 'README.md'
$issueTemplatePath = Join-Path $repositoryRoot 'templates\issue-config.template.yml'
$issueOutputPath = Join-Path $repositoryRoot '.github\ISSUE_TEMPLATE\config.yml'

$config = @{}
foreach ($line in Get-Content -LiteralPath $configPath -Encoding utf8) {
    if ($line -match '^([a-z_]+):\s*(.*)$') {
        $value = $Matches[2].Trim().Trim('"').Trim("'")
        $config[$Matches[1]] = $value
    }
}

$required = 'owner','repository','company','product','current_version','installer_name','support_url','legal_url','discord_url','website_url','minimum_windows','release_workflow'
foreach ($name in $required) {
    if (-not $config.ContainsKey($name) -or [string]::IsNullOrWhiteSpace($config[$name])) { throw "Missing configuration value: $name" }
}

$readme = Get-Content -LiteralPath $templatePath -Raw -Encoding utf8
$values = @{
    OWNER = $config.owner
    REPOSITORY = $config.repository
    COMPANY = $config.company
    PRODUCT = $config.product
    VERSION = $config.current_version
    INSTALLER = $config.installer_name
    SUPPORT_URL = $config.support_url
    LEGAL_URL = $config.legal_url
    DISCORD_URL = $config.discord_url
    WEBSITE_URL = $config.website_url
    WINDOWS = $config.minimum_windows
    WORKFLOW = $config.release_workflow
}
foreach ($entry in $values.GetEnumerator()) { $readme = $readme.Replace("{{$($entry.Key)}}", $entry.Value) }
if ($readme -match '\{\{[A-Z_]+\}\}') { throw 'README rendering left an unresolved token.' }
[System.IO.File]::WriteAllText($outputPath, $readme, [System.Text.UTF8Encoding]::new($false))

$issueConfig = Get-Content -LiteralPath $issueTemplatePath -Raw -Encoding utf8
foreach ($entry in $values.GetEnumerator()) { $issueConfig = $issueConfig.Replace("{{$($entry.Key)}}", $entry.Value) }
if ($issueConfig -match '\{\{[A-Z_]+\}\}') { throw 'Issue configuration rendering left an unresolved token.' }
[System.IO.File]::WriteAllText($issueOutputPath, $issueConfig, [System.Text.UTF8Encoding]::new($false))

Write-Host 'Rendered README.md and issue navigation from the repository configuration.'
