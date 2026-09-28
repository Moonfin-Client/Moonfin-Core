# Moonfin Books

Moonfin Books is a fork of [Moonfin-Client/Moonfin-Core](https://github.com/Moonfin-Client/Moonfin-Core). It adds a Books request page to Moonfin's Flutter client. Users search for ebooks or audiobooks, choose a release, submit it, and see their own download status inside the app. The page uses the current Jellyfin sign-in and the user's configured server URL; it does not ask for a second Shelfmark login.

This feature requires the matching Jellyfin plugin from [Moonbase Books](https://github.com/ZepiGit/Moonbase-Books). The Books entry appears when plugin settings sync is enabled and its authenticated `Ping` response reports `booksEnabled: true`. Existing native Moonfin installations need a Moonfin Books build to receive the page. The web app is delivered by the plugin at `/Moonfin/Web/`.

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

## Platform status

See [Build status](docs/BUILD_STATUS.md) for the current package and signing evidence. The fork targets the upstream platform set: Android mobile and TV/Fire TV, iOS, tvOS, macOS, Windows x64/ARM64, Linux x64/ARM64, and web. A target in the source tree does not mean a Moonfin Books package has passed device testing or been published.

The Books backend version `2.3.1.0` has been tested with Jellyfin `12.1` and Shelfmark `1.3.15`; other server combinations need their own checks. Upstream Moonfin supports Emby for other features, but **Books requests in this fork are Jellyfin-only** at present.

## Build from source

The client source is in this repository. Flutter `3.47.2` is used by the Books CI workflow; each native target also requires its upstream platform toolchain. Start with:

```sh
flutter pub get
flutter test test/books
```

The native and web build jobs, including TV and both desktop architectures, with their exact build flags are in [`.github/workflows/books-build.yml`](.github/workflows/books-build.yml). Its Android APK is a CI intermediate; the separately verified local Android package uses a stable private release signature. The iOS IPA is unsigned and requires Apple signing and device provisioning. The workflow does not publish a release or upload to an app store. Web assets for the plugin are built by the pinned app-source step in [Moonbase Books' plugin workflow](https://github.com/ZepiGit/Moonbase-Books/blob/master/.github/workflows/books-plugin.yml).

## License and upstream

Moonfin Books is based on [Moonfin-Client/Moonfin-Core](https://github.com/Moonfin-Client/Moonfin-Core) and retains its GNU GPL version 2 or later license and upstream notices. See [LICENSE](LICENSE) and the preserved [upstream README](README.upstream.md). This fork and its artifacts are separate from official Moonfin store releases.
