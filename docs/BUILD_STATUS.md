# Moonfin Books build status

Snapshot: 28 September 2026. This table describes **Moonfin Books fork artifacts**, not upstream Moonfin's general platform support. No native package in this table is claimed to have passed target-device testing or been published to a store.

| Target | Current evidence | Next validation |
| --- | --- | --- |
| Web / PWA | Books web build deployed and exercised with Jellyfin 12.1; the screenshots in this repository show that finished web UI. | Public plugin 2.3.1.100 ZIP deployed and accepted with 17 live API checks and a regular-user web search/release flow. |
| Android phones and tablets | Renamed APK built; a local copy was signed with the owner's stable release key. Package signature and `Moonfin Books` label were verified. | Install and test on physical devices; prepare an approved distribution channel. |
| Android TV / Google TV / Fire TV | TV build jobs are configured; CI validation is pending. No Moonfin Books TV package is claimed. | Build the TV flavor and test remote navigation on target devices. |
| iOS | Renamed unsigned IPA built. | Sign with an Apple identity and provision a device before installation testing. |
| tvOS / Apple TV | Unsigned tvOS IPA built from `feb9f17c` and verified, including the separate app and Top Shelf bundle IDs. | Build, sign, provision, and test on Apple TV. |
| macOS, Intel and Apple Silicon | Earlier ad hoc universal DMG built; bundle ID, app name and Intel/Apple Silicon executables verified. Updated identity checks are rebuilding. | Verify the produced DMG, both intended architectures, installation, and runtime behavior. |
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

## Earlier preview provenance

The first four successful platform packages were built by [run 36398630697](https://github.com/ZepiGit/Moonfin-FireTV32/actions/runs/36398630697) from upstream `7933dd9ac0ecd9f34ce7c1129272bc280bc782bb` plus overlay commit `848c92da09489bfb970c3bbc280613b075940bdc`. They are earlier validation evidence, not binaries built from this repository's current main branch and not the planned public release assets.

The expanded first source build used this repository's `f22d305159be9160a9a9a484a2d2e13714539853`. Seventeen Books tests, web compilation and unsigned tvOS packaging passed. Publication review found packaging and app-data isolation fixes; final release packages are being rebuilt with those fixes and stable Android signing. Release notes will identify the exact source commit and build run for distributed assets.

## Verified public plugin release

[Moonbase Books Preview 1](https://github.com/ZepiGit/Moonbase-Books/releases/tag/v2.3.1.100-books.1) is published: plugin source `4e041ca3562480a91e46897f160d3f3e681f7048`, embedded app source `feb9f17c1b8764b6fa42ced0b1a706a4207e7d4f`, successful CI run `36405823673`. That exact ZIP is deployed and its authenticated API and browser Books flow passed acceptance. Both screenshots now show this released build. Native client release preparation continues in app run `36405721870`.
