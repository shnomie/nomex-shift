# Nomex Shift vX.Y.Z

## Highlights

- Describe the most important user-visible improvement.

## Changes

### Added

- None.

### Changed

- None.

### Fixed

- None.

## Safety and compatibility

- Intended platform: Windows 10 and Windows 11, 64-bit.
- State which clean Windows configurations were actually tested.
- Nomex Shift does not hide a public IP address, replace a VPN, or guarantee anonymity.
- Note adapter or driver limitations discovered during qualification.

## Known issues

- None known. Replace this only after completing release qualification.

## Download

Download `NomexShift-Setup.exe` and `SHA256SUMS.txt` from the Assets section below. Do not use mirrors or renamed installers.

## Verify

```powershell
(Get-FileHash .\NomexShift-Setup.exe -Algorithm SHA256).Hash
Get-Content .\SHA256SUMS.txt
```

The values must match exactly. State the Authenticode signing status accurately.

## Support

- Support: see `SUPPORT.md` in the repository
- Troubleshooting: `docs/TROUBLESHOOTING.md`
- Security reports: `SECURITY.md`
