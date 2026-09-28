# Install Moonfin Books

Moonfin Books is the client fork that adds a native **Books** request tab. Your administrator must first set up [Moonbase Books on Jellyfin](https://github.com/ZepiGit/Moonbase-Books/blob/master/docs/SERVER_SETUP.md). You only need the client package and your existing Jellyfin login. Shelfmark, Prowlarr, downloader categories, and import folders are administrator settings.

**Compatibility:** Official native Moonfin apps still connect to a Jellyfin server with Moonbase Books for their normal features, but those apps do not contain this fork's Books tab. Install a Moonfin Books native app to get the tab. The plugin-served web app at `/Moonfin/Web/` includes Books without a native installation. Moonfin Books uses separate app/installer identities and separate local data from official Moonfin; sign in again and do not expect automatic transfer of offline downloads or preferences. Books requests currently require Jellyfin, not Emby.

## Before installing

1. Check [current build status](BUILD_STATUS.md). The platform list below describes **planned preview packages after validation**, not packages already published or tested on every device. The expanded CI jobs and device checks must finish first.
2. When a validated package is published, download it from [Moonfin Books Releases](https://github.com/ZepiGit/Moonfin-Books/releases). Choose your operating system and CPU architecture, compare its SHA-256 with the release checksum, and keep the package for rollback. A temporary CI artifact is not a release.
3. Ask your administrator for the Jellyfin server URL. Use a URL that already works for normal Jellyfin sign-in; do not enter a private Shelfmark URL or any server secret in the app.

## Choose and install a package

| Platform | Planned preview output | Installation notes |
| --- | --- | --- |
| Android phone/tablet | Release-signed mobile APK and AAB | Install the APK through Android's trusted local-package flow. An AAB is for a compatible distribution service or bundle tool; it is not directly installable as an APK. Use APKs from the same release publisher for future in-place updates; temporary debug builds use a different signature. |
| Android TV / Google TV / Fire TV | Release-signed TV/Fire TV flavor APKs and AABs | Choose the correct device flavor and install its APK using that device's supported local-package flow. Use the remote to check navigation after installation. TV input handling has source-level unit tests; real-device runtime remains unverified until device testing. |
| iPhone/iPad and Apple TV | Unsigned iOS/tvOS IPA | An unsigned IPA cannot be installed as-is. A distributor needs an actual Apple signing certificate and provisioning profile for the device or approved distribution channel, then must sign and install the app with Apple-supported tooling. The repository provides no transferable Apple identity. |
| macOS, Intel / Apple Silicon | Ad hoc signed, unnotarized macOS package | The universal DMG contains Intel and Apple Silicon code. Verify the checksum and install the app. macOS Gatekeeper may require an individual **Open** or **Open Anyway** approval for this verified app in Finder or System Settings → Privacy & Security. The preview is not Apple notarized. |
| Windows x64 / ARM64 | Unsigned installer for each architecture | Choose the matching CPU architecture, verify the checksum, run the installer, and confirm **Moonfin Books** appears as a separate application. Windows may show a publisher warning because the preview installer is unsigned. |
| Linux x64 / ARM64 | `tar.gz`, `deb`, `rpm`, `AppImage`, `snap`, and `flatpak` for each architecture | Choose one format supported by your distribution, verify its checksum, and install it with that distribution's package manager or local application flow. Check its required media and desktop libraries on the target system. These formats and both architectures still need package and runtime validation. |
| Web / PWA | Served by Moonbase Books | Open `https://your-jellyfin-server/Moonfin/Web/` in a browser. The server supplies the web build; no native package is needed. |

These packages are planned for the [Releases page](https://github.com/ZepiGit/Moonfin-Books/releases) only after validation. No store release, notarized macOS app, signed Windows installer, or currently published preview package is implied here. See [Build status](BUILD_STATUS.md) for evidence as the builds finish.

## Platform steps

### Android phones and tablets

1. Download the **mobile APK** on the device. Do not select the TV APK or the AAB.
2. Open the downloaded APK. If Android asks, grant the specific browser or file manager permission to install this package, then choose **Install**.
3. Open **Moonfin Books** and follow the connection steps below. Official Moonfin can stay installed.
4. For later updates, install a newer APK from this same fork over Moonfin Books. Do not uninstall first if you want to retain local data.

### Android TV, Google TV, and Fire TV

1. Download the **stable Android TV APK** to a computer. Its universal package includes 32-bit ARM and ARM64 devices; the beta package has a separate app identity.
2. Use your device's supported sideloading method. With [Android's official ADB tools](https://developer.android.com/tools/adb), enable debugging on the TV, connect and approve the computer on the TV, then run `adb install -r /path/to/Moonfin_Books_AndroidTV_stable_signed.apk`.
3. Open Moonfin Books from the TV launcher. Use the directional pad, Select and Back to connect and navigate. Disable debugging afterward if you no longer need it. Fire TV device-specific restrictions still apply.

### Windows

1. In **Settings → System → About**, check **System type** and download the x64 or ARM64 installer accordingly.
2. Open the downloaded `.exe`, verify the fork's filename and checksum, and follow the installer. Preview installers do not yet have a verified publisher signature.
3. Start **Moonfin Books** from the Start menu and connect. It installs separately from official Moonfin.

### macOS

1. Open the downloaded universal `.dmg`.
2. Drag **Moonfin Books.app** into **Applications**, then eject the disk image.
3. Open Moonfin Books from Applications. For an unnotarized preview, approve only this app through **System Settings → Privacy & Security → Open Anyway** if macOS requests it; do not disable Gatekeeper globally.

### Linux

Choose **one** package for your architecture. `Linux` assets are x86_64; `LinuxARM64` assets are aarch64. Replace `PACKAGE` below with the downloaded filename, including its extension.

| Format | Install or start |
| --- | --- |
| Debian / Ubuntu `.deb` | `sudo apt install ./PACKAGE.deb` resolves its declared runtime dependencies. |
| Fedora-compatible `.rpm` | `sudo dnf install ./PACKAGE.rpm` resolves its declared runtime dependencies. |
| AppImage | `chmod +x ./PACKAGE.AppImage`, then `./PACKAGE.AppImage`. Your system needs compatible FUSE support. |
| Local Flatpak bundle | `flatpak install --user ./PACKAGE.flatpak`, then `flatpak run art.tiedemann.moonfin.linux`. Install the required runtime if Flatpak prompts. |
| Local Snap | `sudo snap install --dangerous ./PACKAGE.snap`, then `moonfin-books`. Here `--dangerous` means a local Snap without a store assertion; it does not disable the host's general security controls. |
| Portable `.tar.gz` | Extract into a new empty directory with `tar -xzf PACKAGE.tar.gz -C /path/to/empty-directory`, then run its `moonfin-books` launcher. Do not extract over an existing installation. |

Use the release's platform status for the formats actually provided. Desktop, media and system-library compatibility still depends on your distribution; a successful CI build does not establish runtime support for every Linux release.

### iOS and tvOS

1. Check whether the release provides an **unsigned** IPA. Such an IPA is a build artifact, not a ready-to-install App Store package.
2. A distributor must prepare the appropriate Apple certificate, app identifiers, entitlements and provisioning profile using [Apple's distribution instructions](https://developer.apple.com/documentation/xcode/distributing-your-app-for-beta-testing-and-releases). tvOS also contains a Top Shelf extension that needs matching provisioning.
3. Sign and distribute through the chosen Apple-supported channel, or build from source with a Mac and the required Xcode/toolchain. This repository cannot supply a signing identity for other users. End users should obtain a correctly provisioned build from their distributor.

## Connect and check

1. Open Moonfin Books, enter your Jellyfin server URL, and sign in with your usual Jellyfin username and password. The app uses that session for Books; it does not ask for a separate Shelfmark login.
2. Confirm **Books** appears, then search an ebook or audiobook. A release search can show progress while the server polls its own job. A selected release is queued on the **server**, not saved to your device.
3. If **Books** is missing, confirm you installed the **Moonfin Books** fork rather than official Moonfin. Ask the administrator to check that Moonbase Books is loaded, **Settings Sync** and **Books** are enabled, and the authenticated plugin Ping reports `booksEnabled: true`. If search fails, the administrator should check Shelfmark and its private network connection.

To return to the official native app, open or reinstall official Moonfin and sign in there. Its local data is independent from Moonfin Books. Back up anything you need from the fork before uninstalling it. A server plugin rollback is an administrator task; it does not require wiping either client's data.
