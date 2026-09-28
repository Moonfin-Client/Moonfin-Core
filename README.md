# Moonfin Books

Moonfin Books is a fork of [Moonfin-Client/Moonfin-Core](https://github.com/Moonfin-Client/Moonfin-Core). It adds a Books request page to Moonfin's Flutter client. Users search for ebooks or audiobooks, choose a release, submit it, and see their own download status inside the app. The page uses the current Jellyfin sign-in and the user's configured server URL; it does not ask for a second Shelfmark login.

This feature requires the matching Jellyfin plugin from [Moonbase Books](https://github.com/ZepiGit/Moonbase-Books). The Books entry appears when plugin settings sync is enabled and its authenticated `Ping` response reports `booksEnabled: true`.

**Compatibility:** Official native Moonfin apps can still connect to a Jellyfin server running Moonbase Books and use their existing Moonbase features. They do not acquire the new Books tab from a server update; install a native Moonfin Books fork app for that tab. The plugin serves the Books-enabled web app at `/Moonfin/Web/`, so its web users receive the page through the server. The Books request API currently requires Jellyfin; upstream Moonfin's other Emby features do not make this Books feature available on Emby.

```mermaid
flowchart LR
    U[Moonfin Books client] -->|Existing Jellyfin session| J[Jellyfin + Moonbase Books]
    J -->|Private authenticated proxy| S[Shelfmark]
    S --> P[Configured Prowlarr indexers]
    S --> D[Configured download client]
    D --> I[Shelfmark import destination]
    I --> L[Jellyfin book and audiobook libraries]
```

Moonbase Books exposes only its Books `Status`, `Search`, `Releases`, `Download`, and `Active` operations to authenticated Jellyfin users. Release lookups use short polling requests. Release IDs returned to the app are opaque, time limited, and bound to the signed-in user. Status and active downloads are filtered to that user. The available release source is currently Shelfmark's Prowlarr adapter; operators choose their own indexers, download client, and import destinations in Shelfmark.

## Web screenshots

These are captures of the **finished web build**, including a responsive narrow browser view. They are not evidence of a native Android, iOS, desktop, or TV build.

| Desktop web | Narrow responsive web |
| --- | --- |
| ![Books search in the finished desktop web build](docs/screenshots/books-search-desktop.png) | ![Books search in the finished narrow web build](docs/screenshots/books-search-narrow.png) |

## Get started

1. Ask your server administrator to follow [Moonbase Books server setup](https://github.com/ZepiGit/Moonbase-Books/blob/master/docs/SERVER_SETUP.md). End users only install a client and sign in; they do not configure Shelfmark, indexers, or downloader credentials.
2. Check [build status](docs/BUILD_STATUS.md). After a package passes validation and is published, obtain it from [Moonfin Books Releases](https://github.com/ZepiGit/Moonfin-Books/releases), verify the published checksum, and follow the [platform installation guide](docs/INSTALL.md). A CI artifact or configured build job is not a public release.
3. Open Moonfin Books, enter your existing Jellyfin server URL, and sign in with your Jellyfin account. Open **Books** to search ebooks or audiobooks. If the entry is absent, the administrator should check the matching plugin and its Books/Settings Sync settings.

The fork is intended to use separate app and installer identities so it can coexist with official Moonfin. Its local settings and downloads are separate; sign in again and do not assume local data is migrated. Web users open the plugin-served `/Moonfin/Web/` URL and do not install a native package.

## Platform status

See [Build status](docs/BUILD_STATUS.md) for the current package and signing evidence. The fork targets the upstream platform set: Android mobile and TV/Fire TV, iOS, tvOS, macOS, Windows x64/ARM64, Linux x64/ARM64, and web. A target in the source tree does not mean a Moonfin Books package has passed device testing or been published.

The initial Books backend version `2.3.1.0` was tested with Jellyfin `12.1` and Shelfmark `1.3.15`. A source-compatible Books packaging revision `2.3.1.100` is planned; treat it as a preview until its build and installation checks finish. Other server combinations need their own checks.

## Build from source

The client source is in this repository. Flutter `3.47.2` is used by the Books CI workflow; each native target also requires its upstream platform toolchain. Start with:

```sh
flutter pub get
flutter test test/books
```

The native and web jobs, including TV and both desktop architectures, are in [`.github/workflows/books-build.yml`](.github/workflows/books-build.yml). A separately verified local Android package uses the owner's stable private release key. The Android CI jobs now require private GitHub Actions signing secrets to use that key; package validation is pending. Previous debug-signed CI intermediates are not release packages. The iOS/tvOS outputs need Apple signing and provisioning before device installation. CI does not publish a release or upload to a store. Web assets for the plugin are built by the pinned app-source step in [Moonbase Books' plugin workflow](https://github.com/ZepiGit/Moonbase-Books/blob/master/.github/workflows/books-plugin.yml).

## License and upstream

Moonfin Books is based on [Moonfin-Client/Moonfin-Core](https://github.com/Moonfin-Client/Moonfin-Core) and retains its GNU GPL version 2 or later license and upstream notices. See [LICENSE](LICENSE) and the preserved [upstream README](README.upstream.md). This fork and its artifacts are separate from official Moonfin store releases.
