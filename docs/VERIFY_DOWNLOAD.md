# Verify a Nomex Shift Download

Verification helps detect a damaged or replaced installer. It does not make an unofficial mirror trustworthy.

## SHA-256

Place `NomexShift-Setup.exe` and `SHA256SUMS.txt` in the same directory, open PowerShell there, and run:

```powershell
$actual = (Get-FileHash .\NomexShift-Setup.exe -Algorithm SHA256).Hash.ToLowerInvariant()
$expected = ((Get-Content .\SHA256SUMS.txt -Raw) -split '\s+')[0].ToLowerInvariant()
if ($actual -ne $expected) { throw 'Checksum mismatch. Do not run this installer.' }
"Verified: $actual"
```

## Authenticode

```powershell
Get-AuthenticodeSignature .\NomexShift-Setup.exe |
  Select-Object Status, StatusMessage, SignerCertificate
```

For a release advertised as signed, `Status` must be `Valid`, and the signer must match the publisher identified in that release. If either check fails, do not run the file.

## Official source

The permanent latest-download URL follows this form:

```text
https://github.com/shnomie/nomex-shift/releases/latest/download/NomexShift-Setup.exe
```

Repository-wide links and badges are controlled by `.github/repository-config.yml` and rendered with `scripts/render-readme.ps1`.
