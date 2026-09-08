<!-- Generated from templates/README.template.md and .github/repository-config.yml. -->
<p align="center"><img src="assets/nomex-shift-banner.png" alt="Nomex Shift" width="100%"></p>

<p align="center">
  <img src="https://img.shields.io/github/v/release/shnomie/nomex-shift?display_name=tag&sort=semver&style=flat-square&color=1683ff&label=release" alt="Latest release">
  <img src="https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-1683ff?style=flat-square" alt="Windows 10 and 11">
  <img src="https://img.shields.io/github/downloads/shnomie/nomex-shift/total?style=flat-square&color=1683ff&label=downloads" alt="GitHub release downloads">
  <img src="https://img.shields.io/github/actions/workflow/status/shnomie/nomex-shift/validate-repository.yml?style=flat-square&label=release%20validation" alt="Release validation">
  <img src="https://img.shields.io/badge/license-Proprietary-ffffff?style=flat-square&labelColor=05070c" alt="Proprietary license">
</p>

<h1 align="center">Nomex Shift</h1>
<p align="center"><strong>A compact Windows utility for inspecting, changing, and safely restoring the MAC address presented by a network adapter on the local network.</strong></p>

<p align="center">
  <a href="https://github.com/shnomie/nomex-shift/releases/latest/download/NomexShift-Setup.exe"><img src="https://img.shields.io/badge/DOWNLOAD%20NOMEX%20SHIFT-WINDOWS%20INSTALLER-1683ff?style=for-the-badge&logo=windows&logoColor=white" alt="Download Nomex Shift"></a>
</p>

> **Download Shift only from this repository's Releases page or another link published by Nomex.** Never run rehosted, renamed, or modified installers.

## What Shift does

Nomex Shift gives Windows users a focused interface for local adapter identity management. It discovers adapters, validates locally administered unicast addresses, creates recovery snapshots before changes, restarts adapters through Windows, and provides Restore Original and Emergency Restore paths.

- Adapter discovery and compatibility details
- Generate, validate, apply, and restore local MAC-address overrides
- Safety snapshots, rollback, crash recovery, and Safe Mode
- Profiles, history, diagnostics, IPv4/IPv6 and adapter utilities
- Stable and Beta update channels with SHA-256 and signed-metadata verification
- Optional Nomex Premium features described below

Shift does **not** hide your public IP address, replace a VPN, guarantee anonymity, defeat tracking, bypass restrictions, or work with every adapter or driver. Address changes may briefly interrupt connectivity.

## Screenshots

| Home | Spoofer |
|---|---|
| ![Nomex Shift Home](screenshots/home.png) | ![Nomex Shift Spoofer](screenshots/spoofer.png) |

![Nomex Shift Premium](screenshots/premium.png)

## System requirements

- Windows 10 or Windows 11, 64-bit
- x64 processor
- Administrator approval when Windows requires it for adapter changes
- A network adapter and driver that permit address overrides
- Internet access only for licensing, product configuration, vendor-index updates, support, and application updates

The current public product version is **2.3.0**. Nomex Shift is designed for Windows 10 and Windows 11 x64; adapter support still depends on the hardware and driver.

## Install

1. Open the [latest release](https://github.com/shnomie/nomex-shift/releases/latest).
2. Download **`NomexShift-Setup.exe`** and **`SHA256SUMS.txt`**.
3. [Verify the SHA-256 checksum](docs/VERIFY_DOWNLOAD.md).
4. Run the installer, review the publisher information and legal terms, and approve elevation only if Windows requests it.
5. Launch Nomex Shift from the Start menu and complete first-run setup.

If Windows reports an unknown publisher, stop unless the release notes explicitly identify the build as unsigned and you independently verified its checksum. Production releases should be Authenticode signed.

## Nomex Premium

Core inspection, address change/restore, recovery, and diagnostics remain available locally. Premium is a server-validated entitlement that can enable advanced generation, profiles, identity slots, privacy sessions, startup automation, network memory, Nomex Guard, audit features, encrypted configuration backup, and personalization. Availability is controlled by the installed version and active entitlement.

"Lifetime" means the supported lifetime of the applicable Nomex product or service, not the purchaser's lifetime or guaranteed permanent availability. See [Premium terms](legal/PREMIUM_TERMS.md).

## Safety

- Use Shift only on devices and networks you own or are authorized to administer.
- Preserve recovery information before modifying an adapter.
- Use **Restore Original**, **Emergency Restore**, or **Safe Mode** if connectivity does not recover.
- Do not use Shift for unauthorized access, impersonation, ban evasion, fraud, or access-control circumvention.
- Read the [Disclaimer](legal/DISCLAIMER.md) and [Acceptable Use Policy](legal/ACCEPTABLE_USE_POLICY.md).

## Updates

Shift can check the Nomex service for signed Stable or Beta release metadata. Downloaded updates are accepted only after integrity and release-signature verification. GitHub Releases remains the permanent public archive. See [Update policy](docs/UPDATES.md).

## Verify a download

Every release includes `SHA256SUMS.txt`. In PowerShell:

```powershell
(Get-FileHash .\NomexShift-Setup.exe -Algorithm SHA256).Hash
Get-Content .\SHA256SUMS.txt
```

The values must match exactly. A checksum detects accidental or malicious file changes; it is not a substitute for a valid Authenticode signature or a trusted download source.

## Version history

See [CHANGELOG.md](CHANGELOG.md) for product history and the [Releases page](https://github.com/shnomie/nomex-shift/releases) for installers, checksums, release notes, and known issues.

## FAQ and troubleshooting

- [Frequently asked questions](docs/FAQ.md)
- [Installation guide](docs/INSTALLATION.md)
- [Troubleshooting and recovery](docs/TROUBLESHOOTING.md)
- [Download verification](docs/VERIFY_DOWNLOAD.md)

## Support and Discord

Use [official Nomex support](https://github.com/shnomie/nomex-shift/issues/new/choose), the in-app support page, or join the [official Nomex Discord](https://discord.gg/DcrzfkRTKK). Review and redact diagnostic reports before sending them. Never post license keys, passwords, tokens, recovery material, or signing credentials.

## Legal

Nomex Shift is proprietary software licensed, not sold. Users may not modify, repurpose, redistribute, rehost, resell, reverse engineer, sublicense, or create derivative versions except where applicable law prohibits a restriction or a third-party license grants broader rights.

[License notice](LICENSE.md) · [EULA](legal/EULA.md) · [Privacy](legal/PRIVACY_POLICY.md) · [Disclaimer](legal/DISCLAIMER.md) · [Third-party notices](legal/THIRD_PARTY_NOTICES.md) · [Security](SECURITY.md)

This public repository contains release information, documentation, screenshots, checksums, and release automation only. The application source code, backend, credentials, signing material, and private configuration are not published here.

---

<p align="center"><img src="assets/nomex-rocket-n.png" alt="Nomex rocket-shaped N" width="72"><br><a href="https://github.com/shnomie/nomex-shift">Nomex home</a> · <a href="https://github.com/shnomie/nomex-shift/tree/main/legal">Legal index</a><br><sub>© 2026 Nomex. Original Nomex materials are proprietary.</sub></p>
