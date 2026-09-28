# Moonfin Books build status

Snapshot: **28 September 2026**. All platform build jobs and the Linux correction run succeeded. [Preview 1 downloads](https://github.com/ZepiGit/Moonfin-Books/releases/tag/v2.6.0-books.1) contain 24 package files plus checksums and source provenance. This table distinguishes build evidence from actual runtime checks. No store publication or testing on every physical device is claimed.

| Target | Build and package evidence | Runtime evidence / remaining limits |
| --- | --- | --- |
| Web / PWA | Built and included in the published Moonbase Books 2.3.1.100 ZIP. | Deployed with Jellyfin 12.1; 17 live API checks and a regular-user Books search/edition flow passed without an external browser. No real download was ordered. |
| Android phones/tablets | Release-signed APK and AAB built; APK certificate, application ID, label and ARM32/ARM64/x64 code verified. | The exact APK passed first launch in an Android 15 emulator. Server login, native Android Books requests and physical-device playback are not verified. |
| Android TV / Google TV / Fire TV | Stable and beta APK/AAB builds succeeded; release certificates and separate package IDs verified. Both APKs include ARM32, ARM64 and x64. | TV input has shared Flutter unit tests; remote navigation and playback still require target-device checks. |
| iOS | Unsigned IPA built, ZIP integrity and `art.tiedemann.moonfin.ios` / Moonfin Books display name verified. Minimum iOS 16. | Requires Apple signing and provisioning; not directly installable as downloaded. |
| tvOS / Apple TV | Unsigned IPA built; app and Top Shelf extension identities verified. Minimum tvOS 17. | Requires signing and provisioning for both bundles; Apple TV runtime remains untested. |
| Windows x64 / ARM64 | Both installer jobs succeeded on their native runner architectures; downloaded PE files contain Moonfin Books product metadata. | Unsigned installers. Installation, uninstall and runtime on physical Windows devices remain unverified. |
| macOS Intel / Apple Silicon | Universal, ad hoc DMG built; downloaded bundle ID, name and Intel/Apple Silicon executable slices verified. Requires macOS 14. | Unnotarized; installation and runtime on a physical Mac remain untested. |
| Linux x64 / ARM64 | All twelve corrected packages built and downloaded; actual ELF architecture, launcher identity, DEB dependencies and Snap command verified. x64 requires glibc 2.38+, ARM64 glibc 2.35+. | The fresh x64 tar package passed native Books search/edition selection under Ubuntu 24.04/Xvfb and created separate preferences while preserving three legacy-folder sentinels. Other package installation flows and ARM64 runtime remain untested. |

## Sources and CI

- [Full platform run 36405721870](https://github.com/ZepiGit/Moonfin-Books/actions/runs/36405721870): source `feb9f17c1b8764b6fa42ced0b1a706a4207e7d4f`. All 13 jobs succeeded, including the signed-APK emulator check.
- [Linux correction run 36410259129](https://github.com/ZepiGit/Moonfin-Books/actions/runs/36410259129): source `157648c05a20fd36d68d14026b8bcb5e1c9d7936`. The real executable is `art.tiedemann.moonfin.linux.bin`, keeping `path_provider_linux` fallback data paths separate even without development libraries. Regression tests and x64/ARM64 packaging succeeded. Only these corrected Linux packages are distributed.
- [Published Moonbase Books Preview 1](https://github.com/ZepiGit/Moonbase-Books/releases/tag/v2.3.1.100-books.1): plugin source `4e041ca3562480a91e46897f160d3f3e681f7048`, embedded web source `feb9f17c1b8764b6fa42ced0b1a706a4207e7d4f`; [plugin run 36405823673](https://github.com/ZepiGit/Moonbase-Books/actions/runs/36405823673) succeeded. That exact ZIP is deployed and accepted.

The public release includes `SHA256SUMS` and `SOURCE_REVISIONS.txt` with source and CI provenance for each platform. All 26 uploaded assets were checked against GitHub's SHA-256 digests and byte sizes. Temporary CI artifacts expire and are not the download channel for end users.

## Scope of verification

Seventeen shared Flutter Books tests, the custom-build update guard, desktop database separation and credential-storage separation passed. The plugin also passed its backend checks and 17 live API checks. The documented native Linux flow used the fresh CI tar package and an existing regular QA session in isolated app storage; it did not test the login screen or submit a download. Physical-device playback and a real download/import cycle are outside the completed checks.

The [native Linux Books screenshot](screenshots/books-search-linux-native.png) shows the corrected CI tar package under Xvfb. The [desktop](screenshots/books-search-desktop.png) and [narrow](screenshots/books-search-narrow.png) Books screenshots show the released **web** build. The [Android first-launch screenshot](screenshots/android-first-launch.png) shows the exact release-signed mobile APK in the CI emulator; it is not a screenshot of Android Books requests.

Custom-build upstream update offers are disabled. Native fork users sign in again because app data and credentials are separate. Non-Windows `moonfin://` handler coexistence and platform signing limits are explained in the [installation guide](INSTALL.md). Books requires the matching Jellyfin plugin; official native Moonfin apps retain their normal functions but do not gain the Books tab.
