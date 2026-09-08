# Repository Configuration

`.github/repository-config.yml` is the single configuration area for repository identity, product metadata, README links, badges, and the permanent installer filename.

Edit these values there:

- GitHub owner and repository name
- company and product name
- current public version
- installer filename
- website, support, legal, and optional Discord destinations
- supported Windows label
- workflow used by the status badge

After any edit, regenerate the README:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/render-readme.ps1
```

Commit the configuration, generated `README.md`, and generated `.github/ISSUE_TEMPLATE/config.yml` together. The validation workflow fails if generated files are out of date.

Relative links inside policy and support documents intentionally remain relative; they move with the repository and require no owner or domain replacement. Until a Nomex web endpoint is confirmed live, the configured website, support, and legal destinations point to this GitHub repository. Leave `discord_url` empty until an official invite is ready. Do not insert an example invite or a private staff link.
