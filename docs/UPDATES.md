# Updates and Release Channels

Nomex Shift supports Stable and Beta update channels. Stable is intended for ordinary use. Beta may contain newer changes with less field testing.

The application requests signed product configuration and release metadata from the Nomex service. Before launching a downloaded update, Shift checks its SHA-256 digest and release signature against the public verification key bundled with the application.

GitHub Releases provides the public release archive. Each release should contain:

- the exact asset `NomexShift-Setup.exe`;
- `SHA256SUMS.txt`;
- release notes and known issues;
- the matching semantic-version tag; and
- accurate signing status.

Updates, support, and compatibility are not guaranteed indefinitely. Download only from official Nomex sources.
