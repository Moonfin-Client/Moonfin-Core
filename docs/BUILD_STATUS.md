# Moonfin Books build status

Snapshot: 28 September 2026. This table describes **Moonfin Books fork artifacts**, not upstream Moonfin's general platform support. No native package in this table is claimed to have passed target-device testing or been published to a store.

| Target | Current evidence | Next validation |
| --- | --- | --- |
| Web / PWA | Books web build deployed and exercised with Jellyfin 12.1; the screenshots in this repository show that finished web UI. | Build the public plugin from a pinned app commit and verify it in a separate installation. |
| Android phones and tablets | Renamed APK built; a local copy was signed with the owner's stable release key. Package signature and `Moonfin Books` label were verified. | Install and test on physical devices; prepare an approved distribution channel. |
| Android TV / Google TV / Fire TV | TV build jobs are configured; CI validation is pending. No Moonfin Books TV package is claimed. | Build the TV flavor and test remote navigation on target devices. |
| iOS | Renamed unsigned IPA built. | Sign with an Apple identity and provision a device before installation testing. |
| tvOS / Apple TV | Build job is configured; CI validation is pending. No Moonfin Books tvOS package is claimed. | Build, sign, provision, and test on Apple TV. |
| macOS, Intel and Apple Silicon | Ad hoc build is in progress; no completed or tested Moonfin Books package is claimed here. | Verify the produced DMG, both intended architectures, installation, and runtime behavior. |
| Windows x64 | Unsigned installer built successfully; Moonfin Books installer/product labels verified. Device installation is pending. | Verify installer identity, install/uninstall, and app behavior on Windows. |
| Windows ARM64 | Build job is configured; CI validation is pending. No Moonfin Books ARM64 installer is claimed. | Build and test on an ARM64 Windows device. |
| Linux x64 and ARM64 | Both architecture jobs and six package formats are configured; CI validation is pending. No Moonfin Books Linux package is claimed. | Build each architecture and test install, launch, and playback dependencies. |

The shared Flutter Books page includes responsive layouts and TV input handling in source. A source-level path is not native screenshot or device proof. The only included Books screenshots are [desktop web](screenshots/books-search-desktop.png) and [narrow web](screenshots/books-search-narrow.png).

## Source and CI entry points

- [`.github/workflows/books-build.yml`](../.github/workflows/books-build.yml) defines Books tests and jobs for Android mobile/TV, iOS, tvOS, macOS, Windows x64/ARM64, Linux x64/ARM64, and web, plus an Android emulator startup check. It stores temporary CI artifacts; it does not create a public release or ship to a store.
- The client Books page is [`lib/ui/screens/books/books_requests_screen.dart`](../lib/ui/screens/books/books_requests_screen.dart); its Jellyfin API client is [`lib/data/repositories/books_repository.dart`](../lib/data/repositories/books_repository.dart).
- Web packaging is driven by [Moonbase Books' plugin workflow](https://github.com/ZepiGit/Moonbase-Books/blob/master/.github/workflows/books-plugin.yml), which must use a pinned Moonfin Books commit.
- Custom-build update checks are disabled by `MOONFIN_CUSTOM_BUILD=true`, so upstream release assets are not offered as replacements for this fork.

Use a matching [Moonbase Books server build](https://github.com/ZepiGit/Moonbase-Books) for Books requests. Official Moonfin packages do not gain the Books page when only the server is upgraded. Books requests on Emby are not yet supported, even though upstream Moonfin supports Emby for other features.
