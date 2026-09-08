# Local Release Staging

This directory is a temporary local workspace. Installers and checksums here are ignored by Git and must be uploaded to GitHub Releases, not committed.

## Required file

Place the finished Windows installer here with this exact name:

```text
release-assets/NomexShift-Setup.exe
```

Do not substitute the portable application executable, an MSI renamed to `.exe`, a debug build, or an unsigned file presented as signed. The installer must install the production Nomex Shift application and report the same product version as the release tag.

## Optional local files

- `RELEASE_NOTES.md` — completed notes generated from `.github/RELEASE_TEMPLATE.md`
- `SHA256SUMS.txt` — generated automatically; do not type the hash manually
- additional screenshots reviewed for public disclosure
- a public signature or certificate chain, only when the release process intentionally distributes it

Never place signing private keys, PFX/P12 files, certificate passwords, API tokens, `.env` files, databases, logs, account inventory, or private configuration here.

## Prepare and create a draft

```powershell
powershell -ExecutionPolicy Bypass -File scripts/prepare-release.ps1 `
  -Version 2.3.0 `
  -InstallerPath release-assets/NomexShift-Setup.exe
```

Review the generated checksum and release notes. After authenticating GitHub CLI, create the draft:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/prepare-release.ps1 `
  -Version 2.3.0 `
  -InstallerPath release-assets/NomexShift-Setup.exe `
  -CreateDraft
```

Then run **Actions → Validate and publish Nomex Shift release → Run workflow** with tag `v2.3.0`. The workflow downloads the asset from the draft, independently verifies it, calculates `SHA256SUMS.txt`, uploads the checksum, and publishes the release when requested.
