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

Moonfin is a media client for Jellyfin and Emby servers, built with Flutter. One shared codebase powers phones and tablets, Windows, macOS, and Linux, Android TV, Fire TV, and Apple TV, and the browser. It's made for people who want a modern, customizable experience on every screen they own.

## Where to get it

| Platform            | Download                                                                                                                                                                                                                                                                                       |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Android Mobile / TV | [![Google Play](https://img.shields.io/badge/Google%20Play-grey?logo=Google+Play\&label=)](https://play.google.com/store/apps/details?id=org.moonfin.androidtv)                                                                                                                                |
| Fire TV             | [![Amazon Appstore](https://img.shields.io/badge/Amazon%20Appstore-FF9900?logo=amazon\&logoColor=white)](https://www.amazon.com/Moonfin/dp/B0H76BG3DW)                                                                                                                                         |
| iOS                 | [![App Store](https://img.shields.io/badge/App_Store-0D96F6?logo=app-store\&logoColor=white)](https://apps.apple.com/app/moonfin/id6761283970)                                                                                                                                                 |
| Linux               | [![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux\&logoColor=fff)](https://aur.archlinux.org/packages/moonfin-bin)<br>[![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux\&logoColor=black)](https://github.com/Moonfin-Client/Moonfin-Core/releases) |
| macOS               | [![App Store](https://img.shields.io/badge/App_Store-0D96F6?logo=app-store\&logoColor=white)](https://apps.apple.com/app/moonfin/id6761283970)<br>[![Homebrew](https://img.shields.io/badge/Homebrew-FBB040?logo=homebrew\&logoColor=fff)](https://formulae.brew.sh/cask/moonfin)              |
| tvOS                | [![App Store](https://img.shields.io/badge/App_Store-0D96F6?logo=app-store\&logoColor=white)](https://apps.apple.com/app/moonfin/id6761283970)                                                                                                                                                 |
| Windows             | [![Release](https://img.shields.io/github/v/release/Moonfin-Client/Moonfin-Core?label=Release\&logo=github\&logoColor=white)](https://github.com/Moonfin-Client/Moonfin-Core/releases)                                                                                                         |

## Supported Servers

| Server | Minimum Version | Status |
|--------|------------------|--------|
| Jellyfin | 10.8.0+ | Full support |
| Emby | 4.8.0.0+ | Full support |

## Platform Support

| Platform | Minimum Version | Status |
|----------|------------------|--------|
| **Android** | 7.0 (API 24) | Full support |
| **Android TV / Google TV** | Android 7.0 (API 24) | Full support |
| **Fire TV** | Fire OS 6 | Full support |
| **iOS** | 16.0 | Full support |
| **Apple TV (tvOS)** | 17.0 | Full support |
| **macOS** | 14.0 (Sonoma) | Full support |
| **Windows** | 10 (x64 and ARM64) | Full support |
| **Linux** | GTK 3+, CMake 3.13+ | Full support (Wayland only) |
| **Web** | Modern browsers (installable PWA) | Full support |

> Android TV, Fire TV, and Apple TV ship from this same codebase with a TV-tuned interface and D-pad navigation. Fire TV runs the same native backend as Android TV. Web runs as an installable PWA through the Moonbase server plugin.

## Features

- **One codebase, every screen.** Phones, tablets, desktop, Android TV, Apple TV, and web, with navigation tuned for touch, pointer, and remote.
- **Playback that just works.** Wide codec support including AV1, HEVC, Dolby Vision, Dolby Atmos, HDR10+, and audio passthrough. Dolby Vision Profile 7 direct plays on Apple and Android TV, converted in real time instead of transcoded. See [Playback and Codecs](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Playback-and-Codecs).
- **Offline downloads** in original or smaller server-transcoded quality, with automatic folder organization and offline subtitles. See [Downloads](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Downloads).
- **Ebooks and audiobooks.** Read EPUB, MOBI, AZW/AZW3, PDF, and comic archives. Play M4B audiobooks with chapter navigation.
- **Retro games** browsed and played in-app from a server game library, with gamepad support and save states that sync between devices. See [Retro Games](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Retro-Games).
- **Multi-server unified library** that merges several Jellyfin and Emby servers into one browsable, searchable UI.
- **A setup wizard on first run** that asks how you want the app to look, with live previews built from your own artwork.
- **Featured media bar** with six layouts, plus optional in-bar trailer previews.
- **Themes and a Theme Store** with a built-in editor, server-side sync, and an OLED mode for true blacks.
- **An integrated admin panel** for settings, users, libraries, logs, devices, and analytics, plus a messages window for notes from your server admin.
- **Discovery with Seerr** built into the details screen, with trending, popular, and upcoming rows and request status overlays.
- **Live TV and DVR** with a program guide and recording management.
- **Trickplay scrubbing** as a single thumbnail, a filmstrip, or full screen, on both Jellyfin and Emby.
- **Cinema Mode and segment skipping** for pre-rolls, intros, credits, and SponsorBlock.
- **Casting and remote control** over Google Cast, DLNA, and AirPlay, plus control of other Jellyfin devices on your network.
- **SyncPlay** for synchronized group watching.
- **Personal ratings** as a like, five stars, or a score out of ten, usable to sort or filter a library.
- **Ratings from MDBList and TMDB**, home row customization, parental controls with PIN, and in-app update checks.

The full list is on the [Features](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Features) wiki page.

## Screenshots

<img width="48%" height="1200" alt="Tablet and desktop screenshot 1" src="https://github.com/user-attachments/assets/3ff05968-655f-42c7-a9ff-55b08529356c" />
<img width="48%" height="1200" alt="Tablet and desktop screenshot 2" src="https://github.com/user-attachments/assets/70263c7b-24de-410d-a24f-d8bd1b08f1c6" />
<img width="23%" height="2244" alt="Phone screenshot 1" src="https://github.com/user-attachments/assets/8bcc0483-a650-43e3-91fb-b9d3b4c57440" />
<img width="23%" height="2244" alt="Phone screenshot 2" src="https://github.com/user-attachments/assets/1813ac6b-546e-4796-b4a8-15fe006d4c9e" />

More in the [Screenshots](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Screenshots) gallery.

## Installation

The store links above are the easy route. To install a file yourself, download it from the [Releases page](https://github.com/Moonfin-Client/Moonfin-Core/releases) and pick the one for your device:

| Platform | File |
|---|---|
| Android (phones and tablets) | `Moonfin_Android_v<version>.apk` |
| Android TV / Google TV / Fire TV | `Moonfin_AndroidTV_v<version>.apk` |
| iOS | `Moonfin_iOS_v<version>_unsigned.ipa` (for self-signing) |
| Apple TV | `Moonfin_tvOS_v<version>_unsigned.ipa` (for self-signing) |
| Windows x64 | `Moonfin_Windows_v<version>.exe` |
| Windows ARM64 | `Moonfin_WindowsARM64_v<version>.exe` |
| macOS | `Moonfin_macOS_v<version>.dmg` |
| Linux x64 | `Moonfin_Linux_v<version>.<ext>` (AppImage, deb, rpm, snap, flatpak, tarball) |
| Linux ARM64 | `Moonfin_LinuxARM64_v<version>.<ext>` (same formats) |
| Web | Served as a PWA by the [Moonbase](https://github.com/Moonfin-Client/Plugin) server plugin, no download needed |

On Arch Linux, install from the AUR with `yay -S moonfin` (or `paru`, `pamac build`).

Per-platform notes are on [Installation](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Installation).

## Building

Flutter stable 3.47+ and Dart 3.13+ are the only prerequisites.

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
| [Installation](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Installation) | Which release file to pick, and the AUR package |
| [User Guide](https://github.com/Moonfin-Client/Moonfin-Core/wiki/User-Guide) | Keyboard shortcuts, subtitle downloads, and remote device control |
| [Collecting Logs](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Collecting-Logs) | Capturing a diagnostic report for a bug report |
| [Custom mpv Configuration](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Custom-mpv-Configuration) | Tuning playback with your own `mpv.conf`, allowed options, and SVP on Windows |
| [Building from Source](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Building-from-Source) | Toolchain versions, quick start, and per-platform build commands |
| [Development](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Development) | Developer notes, contributing guidelines, and the pull request process |

## Contributing

Contributions are welcome. Check the existing issues first, discuss major feature changes before implementing them, match the existing code style, run `flutter analyze`, and test on at least one target platform. Keep pull requests focused and include context, screenshots or logs where useful.

See [Development](https://github.com/Moonfin-Client/Moonfin-Core/wiki/Development) for the full guidelines and the pull request process.

## Help translate Moonfin [here](https://translate.moonfin.io/engage/moonfin-core/)

<a href="https://translate.moonfin.io/engage/moonfin/">
  <img
    src="https://translate.moonfin.io/widgets/moonfin/moonfin-core/multi-auto.svg"
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
