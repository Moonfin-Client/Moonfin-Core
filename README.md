<h1 align="center">Moonfin</h1>
<h3 align="center">Premium Jellyfin & Emby client for mobile, tablet, desktop, TV, and web</h3>

---
<p align="center">
  <img width="1920" height="1080" alt="moonfin_1920x1080" src="https://github.com/user-attachments/assets/b1d9c7d8-f113-457d-ab5c-1600bbd0600a" />
</p>


[![License](https://img.shields.io/github/license/Moonfin-Client/Moonfin-Core.svg)](LICENSE)
[![Release](https://img.shields.io/github/v/release/Moonfin-Client/Moonfin-Core)](https://github.com/Moonfin-Client/Moonfin-Core/releases)
[![Github Downloads](https://img.shields.io/github/downloads/Moonfin-Client/Moonfin-Core/total?label=Downloads)](https://github.com/Moonfin-Client/Moonfin-Core/releases) 
[![Google Play Downloads](https://playbadges.pavi2410.com/badge/downloads?id=org.moonfin.androidtv&pretty)](https://play.google.com/store/apps/details?id=org.moonfin.androidtv)
[![BuyMeACoffee](https://raw.githubusercontent.com/pachadotdev/buymeacoffee-badges/main/bmc-yellow.svg)](https://www.buymeacoffee.com/moonfin)
[![Discord](https://img.shields.io/badge/Discord-Join%20Us-5865F2?logo=discord&logoColor=white)](https://discord.gg/moonfin)

> **[← Back to main Moonfin project](https://github.com/Moonfin-Client)**

Moonfin is a cross-platform media client built with Flutter, designed for Jellyfin and Emby users who want a modern, customizable experience across mobile, tablet, desktop, TV, and web. A single shared codebase powers phones and tablets, Windows, macOS, and Linux, Android TV and Apple TV, the browser, and experimental Samsung TV (Tizen).

## Supported Servers

| Server | Minimum Version | Status |
|--------|------------------|--------|
| Jellyfin | 10.8.0+ | Full support |
| Emby | 4.8.0.0+ | Full support |

## Platform Support

| Platform | Minimum Version | Status |
|----------|------------------|--------|
| **Android** | 6.0 (API 23) | Full support |
| **Android TV / Google TV** | Android 6.0 (API 23) | Full support |
| **iOS** | 16.0 | Full support |
| **Apple TV (tvOS)** | 17.0 | Full support |
| **macOS** | 14.0 (Sonoma) | Full support |
| **Windows** | 10 (x64 and ARM64) | Full support |
| **Linux** | GTK 3+, CMake 3.13+ | Full support (Wayland only) |
| **Web** | Modern browsers (installable PWA) | Full support |
| **Tizen (Samsung TV)** | Tizen 6.0+ | Experimental |

> Android TV and Apple TV ship from this same codebase with a TV-tuned interface and D-pad navigation, each on its own native backend. Web runs as an installable PWA through the Moonbase server plugin. Tizen is experimental and has real limitations, listed on the [Installation](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Installation) page.

## Features

- **One codebase, every screen** spanning phones, tablets, desktop, Android TV, Apple TV, web, and Samsung TV, with navigation tuned for touch, pointer, and remote.
- **Broad playback support** through AetherEngine on iOS, Apple TV, and macOS, native Media3 or libmpv on Android and Android TV, libmpv on Windows and Linux, and the browser's own player on web, covering AV1, HEVC, Dolby Vision, Dolby Atmos, HDR10+, and bitstream audio passthrough. See [Playback and Codecs](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Playback-and-Codecs).
- **Offline downloads** in original or server-transcoded quality, with automatic folder organization and offline subtitles. See [Downloads](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Downloads).
- **Ebooks and audiobooks** with EPUB, MOBI, AZW/AZW3, PDF, and comic archive reading, plus M4B audiobooks with chapter navigation.
- **Retro games** browsed and played in-app from a server game library, with native libretro playback, gamepad support, and synced save states. See [Retro Games](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Retro-Games).
- **Multi-server unified library** that merges content from several Jellyfin and Emby servers into one browsable, searchable UI.
- **Featured media bar** with Classic, Bookshelf, Gallery, and Banner layouts, and optional in-bar trailer previews.
- **Themes and Theme Store** with a built-in editor and server-side sync.
- **Integrated admin panel** for settings, users, libraries, logs, devices, and analytics without leaving the client.
- **Discovery with Seerr** for trending, popular, and upcoming rows, with request status overlays.
- **Live TV and DVR** with an EPG-style guide and recording management.
- **Cinema Mode and segment skipping** for pre-rolls, intros, credits, and SponsorBlock.
- **Casting and remote control** over Google Cast, DLNA, and AirPlay, plus control of other Jellyfin devices on your network.
- **SyncPlay** for synchronized group watching.
- **Ratings from MDBList and TMDB**, home row customization, parental controls with PIN, and in-app update checks.

The full list is on the [Features](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Features) wiki page.

## Screenshots

<img width="48%" height="1200" alt="Tablet and desktop screenshot 1" src="https://github.com/user-attachments/assets/3ff05968-655f-42c7-a9ff-55b08529356c" />
<img width="48%" height="1200" alt="Tablet and desktop screenshot 2" src="https://github.com/user-attachments/assets/70263c7b-24de-410d-a24f-d8bd1b08f1c6" />
<img width="23%" height="2244" alt="Phone screenshot 1" src="https://github.com/user-attachments/assets/8bcc0483-a650-43e3-91fb-b9d3b4c57440" />
<img width="23%" height="2244" alt="Phone screenshot 2" src="https://github.com/user-attachments/assets/1813ac6b-546e-4796-b4a8-15fe006d4c9e" />

More in the [Screenshots](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Screenshots) gallery.

## Installation

Download platform artifacts from the [Releases page](https://github.com/Moonfin-Client/Moonfin-Core/releases).

| Platform | File |
|---|---|
| Android / Android TV | `Moonfin_Android_v<version>.apk` |
| iOS | `Moonfin_iOS_v<version>.ipa` |
| Windows (x64 and ARM64) | `Moonfin_Windows_v<version>.exe` |
| macOS | `Moonfin_macOS_v<version>.dmg` |
| Linux x64 | `Moonfin_Linux_v<version>.<ext>` (AppImage, deb, rpm, snap, flatpak, tarball) |
| Linux ARM64 | `Moonfin_LinuxARM64_v<version>.<ext>` (same formats) |
| Web | Served as a PWA by the [Moonbase](https://github.com/Moonfin-Client/Plugin) server plugin |

On Arch Linux, install from the AUR with `yay -S moonfin` (or `paru`, `pamac build`).

Per-platform notes and the Tizen toolchain setup are on [Installation](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Installation).

## Building

Flutter stable 3.41+ and Dart 3.11+ are the only prerequisites.

```bash
git clone https://github.com/Moonfin-Client/Moonfin-Core.git
cd Moonfin-Core
flutter pub get
```

The per-platform build commands are on [Building from Source](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Building-from-Source).

## Documentation

The deeper reference material lives in the [Wiki](https://github.com/Moonfin-Client/Moonfin-Core/wiki):

| Page | What it covers |
|------|----------------|
| [Features](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Features) | The full feature list, section by section |
| [Playback and Codecs](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Playback-and-Codecs) | The backend per platform, the codec table, HDR, and audio passthrough |
| [Downloads](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Downloads) | Original and transcoded downloads, quality presets, and storage paths |
| [Retro Games](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Retro-Games) | Playing server game libraries in-app, cores, controllers, and save states |
| [Installation](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Installation) | Which release file to pick, the AUR package, and the Tizen toolchain |
| [User Guide](https://github.com/Moonfin-Client/Moonfin-Core/wiki/User-Guide) | Keyboard shortcuts, subtitle downloads, and remote device control |
| [Custom mpv Configuration](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Custom-mpv-Configuration) | Tuning playback with your own `mpv.conf`, allowed options, and SVP on Windows |
| [Building from Source](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Building-from-Source) | Toolchain versions, quick start, and per-platform build commands |
| [Development](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Development) | Developer notes, contributing guidelines, and the pull request process |

## Contributing

Contributions are welcome. Check the existing issues first, discuss major feature changes before implementing them, match the existing code style, run `flutter analyze`, and test on at least one target platform. Keep pull requests focused and include context, screenshots or logs where useful.

See [Development](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Development) for the full guidelines and the pull request process.

## Help translate Moonfin [here](https://translate.moonfin.io/engage/moonfin-core/)

<a href="https://translate.moonfin.io/engage/moonfin-core/">
  <img
    src="https://translate.moonfin.io/widgets/moonfin-core/-/multi-auto.svg"
    alt="Moonfin Core translation status by language"
  />
</a>

## Support and Community

- **Issues**: [GitHub Issues](https://github.com/Moonfin-Client/Moonfin-Core/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Moonfin-Client/Moonfin-Core/discussions)
- **Discord**: [Discord](https://discord.gg/moonfin)
- **Upstream Jellyfin**: [jellyfin.org](https://jellyfin.org)

## Credits

Moonfin is built on the work of:
- **[Jellyfin Project](https://jellyfin.org)**
- **Jellyfin client contributors**
- **Moonfin contributors**
- **[MakD](https://github.com/MakD)** - Original Jellyfin-Media-Bar concept that inspired our featured media bar
- **[MediaLyze](https://github.com/frederikemmer/MediaLyze)** The Admin analytics UI was inspired by this open-source project 

## License

Moonfin is free software. You can redistribute it and modify it under the terms
of the GNU General Public License as published by the Free Software Foundation,
either version 2 of the License or, at your option, any later version. See
[LICENSE](LICENSE) for the version 2 text.

---

<p align="center">
  <strong>Moonfin</strong> is an independent project and is not affiliated with the Jellyfin or Emby projects.<br>
  <a href="https://github.com/Moonfin-Client">← Back to main Moonfin project</a>
</p>
