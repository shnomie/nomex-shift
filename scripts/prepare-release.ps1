param(
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    [string]$InstallerPath = 'release-assets\NomexShift-Setup.exe',
    [switch]$RequireSigned,
    [switch]$CreateDraft
)

$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$resolvedInstaller = (Resolve-Path -LiteralPath (Join-Path $repositoryRoot $InstallerPath)).Path
$expectedName = 'NomexShift-Setup.exe'
if ([System.IO.Path]::GetFileName($resolvedInstaller) -ne $expectedName) { throw "Installer must be named exactly $expectedName" }

$bytes = [System.IO.File]::ReadAllBytes($resolvedInstaller)
if ($bytes.Length -lt 102400 -or $bytes[0] -ne 0x4D -or $bytes[1] -ne 0x5A) { throw 'Installer is not a plausible Windows PE executable.' }

$signature = Get-AuthenticodeSignature -LiteralPath $resolvedInstaller
Write-Host "Authenticode status: $($signature.Status)"
if ($RequireSigned -and $signature.Status -ne 'Valid') { throw "A valid Authenticode signature is required; found $($signature.Status)." }

$fileVersion = (Get-Item -LiteralPath $resolvedInstaller).VersionInfo.ProductVersion
if ($fileVersion -and -not $fileVersion.StartsWith($Version, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Installer product version '$fileVersion' does not match release version '$Version'."
}

$stage = Join-Path $repositoryRoot 'release-assets'
$hash = (Get-FileHash -LiteralPath $resolvedInstaller -Algorithm SHA256).Hash.ToLowerInvariant()
$checksum = Join-Path $stage 'SHA256SUMS.txt'
[System.IO.File]::WriteAllText($checksum, "$hash  $expectedName`n", [System.Text.UTF8Encoding]::new($false))
$notes = Join-Path $stage 'RELEASE_NOTES.md'
if (-not (Test-Path -LiteralPath $notes)) {
    $template = Get-Content -LiteralPath (Join-Path $repositoryRoot '.github\RELEASE_TEMPLATE.md') -Raw -Encoding utf8
    $template = $template.Replace('vX.Y.Z', "v$Version")
    [System.IO.File]::WriteAllText($notes, $template, [System.Text.UTF8Encoding]::new($false))
    Write-Host 'Created release-assets\RELEASE_NOTES.md. Review and edit it before creating the draft.'
} else {
    $existingNotes = Get-Content -LiteralPath $notes -Raw -Encoding utf8
    if ($existingNotes -notmatch [regex]::Escape("v$Version")) {
        throw "Existing release notes do not reference v$Version. Remove release-assets\RELEASE_NOTES.md and run preparation again."
    }
    Write-Host 'Preserved the existing release notes.'
}
Write-Host "Prepared v$Version"
Write-Host "SHA-256: $hash"

if ($CreateDraft) {
    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'GitHub CLI is required to create the draft release.' }
    gh auth status | Out-Host
    if ($LASTEXITCODE -ne 0) { throw 'Authenticate GitHub CLI with: gh auth login -h github.com' }
    gh release view "v$Version" *> $null
    if ($LASTEXITCODE -eq 0) { throw "Release v$Version already exists." }
    gh release create "v$Version" $resolvedInstaller $checksum --draft --title "Nomex Shift v$Version" --notes-file $notes
    if ($LASTEXITCODE -ne 0) { throw 'GitHub draft release creation failed.' }
    Write-Host "Created draft release v$Version."
}
