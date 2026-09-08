# Nomex Privacy Policy

**Version:** 1.1  
**Effective date:** September 7, 2026  
**Operator:** Nomex Development ("Nomex")

Nomex Development is the online project operator that publishes Nomex. This policy covers Nomex Shift, Nomex Desktop, the website/API, Discord bot, licensing and update services, Admin Panel, marketplace, reseller tools, and support system. The Data Flow appendix provides feature-level details.

## Information processed

### Shift local data

Shift stores settings, profiles, address history, adapter preferences and addresses, identity slots, network aliases, recovery/session state, snapshots, updates, and a DPAPI-protected license cache under the current Windows account. History retention is user-selectable. Other local records remain until cleared, deleted, or removed with the application where supported. Shift does not automatically upload them.

Optional diagnostic reports contain application and Windows versions, architecture, administrator/safe-mode state, and adapter compatibility details. Complete MAC addresses are excluded unless the user expressly includes them. The user previews and saves the report locally and decides whether to send it.

### Licensing, updates, and downloads

License redemption sends the entered key, a one-way identifier derived from Windows MachineGuid, and device name to the Nomex API. Nomex stores a keyed key hash, masked suffix, product/tier, entitlement state, protected device identifier and label, activation and status times, limits, expiry, and audit events. Complete new keys are returned once and are not intentionally logged. Short-lived entitlement and download tokens support validation and downloads.

Shift requests signed product configuration and update metadata. Servers and Cloudflare necessarily process connection data such as IP address, time, requested path, and protocol information. Application rate-limit IP buckets are transient. Shift contains no advertising analytics or automatic crash-reporting SDK in this version.

### Account, Discord, generator, and vault data

Discord sign-in processes Discord ID, display information, avatar reference, guild membership/roles, OAuth state, and Nomex session data. Temporary Discord access tokens are used for identity lookup and revoked. Nomex stores signed-session metadata and hashed rotating refresh credentials. Discord independently processes interactions, bot messages, DMs, and channel activity.

Nomex may store entitlement and credit ledgers, delivery records, cooldowns, statistics, NID/profile fields, badges, cosmetics, notifications, announcements, abuse signals, trades, reseller activity, staff notes, and administrative audits. Generated or saved inventory may contain usernames, passwords, tags, notes, delivery state, and ownership identifiers. Production server inventory uses configured AES-256-GCM encryption when its encryption key is present. Nomex Desktop can store selected credentials in Windows Credential Manager and submit them to the official Roblox login page only when the user starts Auto Sign-In. Roblox then processes them under its own policy.

### Purchases, support, and administration

Marketplace records may include order/invoice ID, product/tier, Discord/customer/reseller ID, amount, currency, payment address/reference, exchange-rate source, blockchain transaction and confirmation state, fulfillment/refund status, receipt, and timestamps. BTC/LTC checkout uses operator-configured watch-only Electrum infrastructure and Coinbase or Kraken price data. Cryptocurrency transfers are public blockchain records outside Nomex's control.

Support stores the user ID, ticket content, optional approved diagnostics, replies, assignment, status, priority, internal notes, and timestamps. Administration records staff identity/role, request/session metadata, actions, affected records, reasons, timestamps, integrity hashes, MFA state, trusted-device state, and failed attempts.

The current installer sends no installer telemetry. The legal website uses no advertising cookies or third-party analytics in the inspected implementation. Cloudflare or the host may process ordinary connection and security logs.

## Purposes and required data

Nomex processes data to provide requested features, authenticate users, deliver products, enforce entitlements and device limits, secure accounts, prevent abuse, operate updates/downloads, restore local settings, provide support, maintain transaction and audit records, and comply with law. Refusing data required by a selected feature may prevent sign-in, licensing, purchase, support, or updating. Diagnostics and complete-address inclusion are optional.

## Data Nomex does not intentionally collect

Shift is not designed to collect browsing history, personal files, network passwords, unrelated device information, payment private keys, or seed phrases. Complete license keys, passwords, session cookies, and bearer tokens are filtered from application logs and diagnostics. Credentials deliberately placed in the vault are the exception and serve only vault, delivery, or user-requested Auto Sign-In functions. Do not put secrets in free-text support fields.

## Recipients and service providers

Information may be processed by Nomex's current server host, Cloudflare for reverse proxy/tunnel and security delivery, Discord for identity and bot features, LootLabs when verification is selected, operator-controlled Electrum infrastructure and the relevant public blockchain for payments, Coinbase or Kraken for public price quotes, Roblox for user-requested Auto Sign-In, authorized support personnel, professional advisers, and authorities where legally required. Provider identity can change as infrastructure changes; material new data uses will receive updated notice before collection where required.

## Retention

Nomex uses event-based retention matching the current implementation:

- Shift local history follows the selected on-exit, 24-hour, seven-day, custom, or keep-until-cleared setting; other local files remain until the user clears or deletes them.
- Temporary recovery state is removed after completion where implemented. Sessions expire or remain until sign-out, revocation, or account reset.
- In-memory rate-limit records last only for their configured request window.
- Server account, license, delivery, support, order, reseller, security, and audit records currently remain until the user or an authorized administrator deletes the applicable record, the account/service is retired, or Nomex determines they are no longer needed, subject to technical dependencies and legal, tax, fraud, dispute, and security obligations.
- Immutable ledgers and audit records may remain for the operational life of the service because they protect ownership, prevent duplicate redemption, and document administrative actions.
- Backups and infrastructure-provider logs may persist temporarily after primary deletion under provider rotation and legal requirements.
- Public blockchain data cannot be deleted by Nomex.

Nomex will not retain personal data merely because it might become useful. A verified request can seek deletion or correction, although some transaction, security, anti-fraud, entitlement, or legal records may need to remain.

## Security

The implementation uses HTTPS, signed tokens, hashed keys and device identifiers, DPAPI, Windows Credential Manager, configurable encrypted server storage, redaction, rate limits, administrator MFA, role checks, signed updates/configuration, and integrity-linked audits. Access is limited by operational role. No system is completely secure.

## Choices and privacy rights

Users can disable automatic updates, decline diagnostics, omit complete addresses, clear local history, deactivate a supported Shift device, delete local files, sign out, and use account/support controls. Requests to access, correct, delete, restrict, object, or obtain a portable copy should be submitted through the process in [`SUPPORT.md`](../SUPPORT.md) or the in-app support system. Identity verification may be required. Rights vary by location; mandatory rights and regulator access are not waived.

## Legal disclosures and international processing

Nomex may disclose information as reasonably necessary to comply with law, protect users or services, investigate abuse, or exercise legal rights. Relevant data may transfer during a merger, financing, reorganization, or sale subject to applicable notice and law. Nomex and its providers operate online and may process data in the United States and other countries where their infrastructure operates. Where law requires a transfer safeguard, Nomex will rely on the provider's lawful transfer mechanism or will stop the affected transfer.

## Children

Nomex online services and purchasing features are for users aged 18 or older. Nomex does not knowingly collect personal information from children. Parental permission does not override law or third-party platform rules. Report suspected child data through official support so it can be reviewed and deleted where appropriate.

## Changes and contact

Material changes receive a new policy version/effective date and renewed acceptance where required. Nomex will not use previously collected information for a materially incompatible new purpose without the notice or consent required by law.

Operator: Nomex Development  
Privacy, security, and legal requests: see [`SUPPORT.md`](../SUPPORT.md)  
Policy index: see the [`legal`](./) directory
