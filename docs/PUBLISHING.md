# Publishing a Release

## Version integrity

The Git tag, release title, installer product version, application About version, and update metadata must describe the same version.

This repository currently documents Nomex Shift 2.3.0. Its first truthful public tag is therefore `v2.3.0`. If Nomex deliberately wants the first public release to be `v1.0.0`, rebuild the private application and installer with product version `1.0.0` first. Do not label the existing 2.3.0 binary as 1.0.0.

## Local preparation

1. Finish the private production build, run the self-tests, and verify the installer on the intended Windows versions.
2. Authenticode-sign the production installer when a signing certificate is available.
3. Copy it to `release-assets/NomexShift-Setup.exe`.
4. Run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/prepare-release.ps1 `
  -Version 2.3.0 `
  -InstallerPath release-assets/NomexShift-Setup.exe
```

1. Complete `release-assets/RELEASE_NOTES.md`; remove template statements that are not factual.
1. Authenticate GitHub CLI with `gh auth login -h github.com`.
1. Create the draft:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/prepare-release.ps1 `
  -Version 2.3.0 `
  -InstallerPath release-assets/NomexShift-Setup.exe `
  -CreateDraft
```

## GitHub validation and publication

1. Open **Actions**.
2. Select **Validate and publish Nomex Shift release**.
3. Select **Run workflow**.
4. Enter `v2.3.0`.
5. Keep **Require a valid Authenticode signature** enabled for a signed production release.
6. Initially leave **Publish** disabled and inspect the successful validation summary.
7. Run it again with **Publish** enabled.

The workflow verifies a semantic tag, exact filename, Windows PE header, matching file version when available, optional Authenticode signature, and SHA-256. It uploads the generated checksum and makes the permanent latest URL:

`https://github.com/shnomie/nomex-shift/releases/latest/download/NomexShift-Setup.exe`
