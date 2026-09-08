# GitHub Repository Setup

The public repository is `shnomie/nomex-shift`. Apply these settings when maintaining the release channel.

Repository identity, product version, links, installer name, and the status-badge workflow are maintained in one place. See [`CONFIGURATION.md`](CONFIGURATION.md).

## General

- Visibility: **Public**
- Default branch: **main**
- Description: `Official releases and documentation for Nomex Shift.`
- Website: use the value in `.github/repository-config.yml`; keep the GitHub repository URL until a verified Nomex product page is live
- Topics: `nomex`, `nomex-shift`, `windows`, `network-adapter`, `desktop-utility`
- Enable Issues
- Disable Wiki unless Nomex intends to maintain a second documentation source
- Disable Discussions unless an actively moderated community is planned
- Disable merge commits if documentation pull requests should use a linear history

## Actions

- Actions permissions: **Allow actions created by GitHub and verified creators** or explicitly allow `actions/checkout`
- Workflow permissions: **Read repository contents** by default
- Enable **Allow GitHub Actions to create and approve pull requests** only if a future workflow genuinely requires it; the release workflow does not

The release workflow declares `contents: write` only for its release job and uses GitHub's temporary `GITHUB_TOKEN`. No personal token or Discord token is required.

## Branch protection

Protect `main` with:

- require a pull request before merging when more than one maintainer is available;
- require the public-repository validation check;
- require conversation resolution;
- block force pushes and branch deletion;
- require signed commits only if all maintainers have a working signing process.

Do not claim protections are enabled until GitHub shows them as active.

## Security

- Enable Secret scanning and Push protection when GitHub offers them for the repository.
- Enable private vulnerability reporting.
- Set the security policy to `SECURITY.md`.
- Never add Actions secrets for Discord, the Nomex backend, databases, or the update private key.
- If Authenticode signing is later automated, store certificate material/passwords only as encrypted Actions secrets or use a dedicated cloud signing service. Do not expose secrets to pull-request workflows.

## Releases

- Create releases from semantic-version tags such as `v2.3.0`.
- Use the exact title `Nomex Shift v2.3.0`.
- Upload installers to Releases, never the Git tree.
- Keep `NomexShift-Setup.exe` and `SHA256SUMS.txt` on every release.
- Mark only the intended production release as Latest.
