# Privacy Policy

**Moonfin**
Last updated: March 30, 2026

## Overview

Moonfin is a third-party client application for Jellyfin media servers. Moonfin does not operate any servers, collect user data, or track usage. All media data stays between your device and your self-hosted Jellyfin server.

## Data Collection

### Data We Do NOT Collect

- We do not collect personal information
- We do not track your usage or behavior
- We do not serve advertisements
- We do not share any data with third parties
- We do not use analytics services (e.g., Google Analytics, Firebase)

### Data Stored Locally on Your Device

Moonfin stores the following data locally on your device only:

- **Server addresses** — The URLs of Jellyfin servers you connect to
- **Authentication tokens** — Used to maintain your session with your Jellyfin server
- **User preferences** — Display, playback, and customization settings
- **Cached images** — Temporarily cached artwork for performance

This data never leaves your device except when communicating directly with your Jellyfin server.

### Crash Reports (Optional)

Moonfin can send crash reports to **your own Jellyfin server** when the app encounters an error. This feature:

- Is **opt-in** and can be disabled in Settings > Telemetry
- Sends crash data **only to your own server**, never to us or any third party
- May include: stack traces, app version, device model, operating system version, and optionally system logs
- Does not include personal information, media content, or browsing history

### Network Communication

Moonfin communicates only with:

- **Your Jellyfin server(s)** — To stream media, authenticate, and sync settings
- **Your Seerr server** (if configured) — To browse and request media
- **GitHub API** (libre/sideloaded builds only) — To check for app updates

Moonfin supports cleartext (HTTP) connections because many self-hosted Jellyfin servers run on local networks without HTTPS. No data is sent to any Moonfin-operated servers.

### Voice Search

Moonfin may request microphone access for voice search functionality on supported platforms. Audio is processed by the device's speech recognizer and is not recorded, stored, or transmitted by Moonfin.

## Data Security

All sensitive data (authentication tokens, server credentials) is stored in the app's private storage on your device, protected by platform security mechanisms and app sandboxing where available. Moonfin supports HTTPS connections to your servers for encrypted communication.

## Children's Privacy

Moonfin is not directed at children under the age of 13. We do not knowingly collect any information from children.

## Third-Party Services

Moonfin does not integrate with any third-party analytics, advertising, or tracking services. The only external services Moonfin communicates with are the servers you explicitly configure (Jellyfin, Seerr).

## Changes to This Policy

We may update this privacy policy from time to time. Changes will be posted to this page with an updated revision date.

## Contact

If you have questions about this privacy policy, you can open an issue on our GitHub repository:
https://github.com/Moonfin-Client/Moonfin-Core/issues

## Open Source

Moonfin is open-source software. You can review the complete source code to verify our privacy practices:
https://github.com/Moonfin-Client/Moonfin-Core
