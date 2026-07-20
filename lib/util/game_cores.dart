import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import '../preference/user_preferences.dart';
import 'platform_detection.dart';

/// EmulatorJS core name to libretro core id, for the native libretro backend
/// (Android, desktop, tvOS). The plugin names cores in EmulatorJS terms (nes,
/// snes, gb, ...) and the native backend loads the matching libretro core.
const Map<String, String> _libretroCores = {
  'nes': 'fceumm',
  'snes': 'snes9x',
  'gb': 'gambatte',
  'gba': 'mgba',
  'segaMD': 'genesis_plus_gx',
  'segaMS': 'genesis_plus_gx',
  'segaGG': 'genesis_plus_gx',
  'atari2600': 'stella',
  'atari7800': 'prosystem',
  'lynx': 'handy',
  'ws': 'mednafen_wswan',
  'ngp': 'mednafen_ngp',
  'pce': 'mednafen_pce_fast',
  'vb': 'mednafen_vb',
  'psx': 'pcsx_rearmed',
  'n64': 'mupen64plus_next',
  'psp': 'ppsspp',
  'nds': 'melonds',
};

/// The subset shipped inside the tvOS app. The App Store can't download
/// executable code, so tvOS bundles a fixed set that also avoids JIT.
const Set<String> tvosBundledCores = {
  'fceumm',
  'snes9x',
  'gambatte',
  'mgba',
  'genesis_plus_gx',
  'pcsx_rearmed',
};

/// Preference key holding the list of downloaded core ids on Android and
/// desktop.
const String installedCoresPreferenceKey = 'installed_libretro_cores';

/// A libretro core the user can download on Android and desktop.
class GameCore {
  const GameCore({
    required this.coreId,
    required this.system,
    required this.approxSizeMb,
    this.needsJit = false,
  });

  /// The libretro core id, matching [_libretroCores] values and the buildbot
  /// file name.
  final String coreId;

  /// The system name shown in the download list.
  final String system;

  /// Rough download size in megabytes, for the list. The real size comes from
  /// the server at download time.
  final double approxSizeMb;

  /// Cores that recompile guest code at runtime. They only run where a JIT is
  /// allowed (Android and desktop, not the App Store platforms).
  final bool needsJit;
}

/// The cores offered in the download manager, ordered roughly by how common the
/// system is. One entry per core, so Genesis, Master System, and Game Gear
/// share the single Sega core.
const List<GameCore> downloadableCores = [
  GameCore(coreId: 'fceumm', system: 'Nintendo Entertainment System', approxSizeMb: 1),
  GameCore(coreId: 'snes9x', system: 'Super Nintendo', approxSizeMb: 3),
  GameCore(coreId: 'gambatte', system: 'Game Boy and Game Boy Color', approxSizeMb: 1),
  GameCore(coreId: 'mgba', system: 'Game Boy Advance', approxSizeMb: 3),
  GameCore(coreId: 'genesis_plus_gx', system: 'Sega Genesis, Master System, and Game Gear', approxSizeMb: 2),
  GameCore(coreId: 'pcsx_rearmed', system: 'PlayStation', approxSizeMb: 2),
  GameCore(coreId: 'mupen64plus_next', system: 'Nintendo 64', approxSizeMb: 6, needsJit: true),
  GameCore(coreId: 'ppsspp', system: 'PlayStation Portable', approxSizeMb: 18, needsJit: true),
  GameCore(coreId: 'melonds', system: 'Nintendo DS', approxSizeMb: 4, needsJit: true),
  GameCore(coreId: 'mednafen_pce_fast', system: 'PC Engine and TurboGrafx-16', approxSizeMb: 2),
  GameCore(coreId: 'stella', system: 'Atari 2600', approxSizeMb: 2),
  GameCore(coreId: 'prosystem', system: 'Atari 7800', approxSizeMb: 1),
  GameCore(coreId: 'handy', system: 'Atari Lynx', approxSizeMb: 1),
  GameCore(coreId: 'mednafen_wswan', system: 'WonderSwan', approxSizeMb: 2),
  GameCore(coreId: 'mednafen_ngp', system: 'Neo Geo Pocket', approxSizeMb: 1),
  GameCore(coreId: 'mednafen_vb', system: 'Virtual Boy', approxSizeMb: 2),
];

/// Whether this platform has the native libretro backend at all (tvOS,
/// Android, desktop). iOS only has the EmulatorJS WebView.
bool get nativeGameBackendSupported =>
    PlatformDetection.isAppleTV ||
    PlatformDetection.isAndroid ||
    PlatformDetection.isDesktop;

/// Whether the EmulatorJS WebView backend works on this platform. Linux has no
/// flutter_inappwebview implementation and tvOS has no WebKit.
bool get emulatorJsAvailable =>
    PlatformDetection.isIOS ||
    PlatformDetection.isAndroid ||
    PlatformDetection.isWindows ||
    PlatformDetection.isMacOS;

/// Whether the user can choose between the two backends here, which decides if
/// the settings toggle is shown.
bool get canToggleGameBackend =>
    nativeGameBackendSupported && emulatorJsAvailable;

/// Whether games play through the native libretro backend right now: forced on
/// platforms with a single working backend, the user's choice everywhere else.
/// The single source of truth for routing, save keys, and core support.
bool get usesNativeGameBackend {
  if (!nativeGameBackendSupported) return false;
  if (!emulatorJsAvailable) return true;
  if (!GetIt.instance.isRegistered<UserPreferences>()) return true;
  return GetIt.instance<UserPreferences>().get(
    UserPreferences.useNativeEmulator,
  );
}

/// Whether this platform ships its cores inside the app and loads them from the
/// bundle rather than downloading them. tvOS and macOS bundle (the Apple stores
/// forbid downloading executable code), so neither shows the download manager.
bool get bundlesGameCores =>
    PlatformDetection.isAppleTV || PlatformDetection.isMacOS;

/// Whether this device can download and run cores, and so should offer the
/// emulator cores manager. Bundled platforms (tvOS, macOS) and the WebView on
/// iOS do not. Android, Windows, and Linux download, and also need an
/// architecture the libretro buildbot builds for.
bool get supportsCoreDownloads =>
    !bundlesGameCores &&
    (PlatformDetection.isAndroid || PlatformDetection.isDesktop) &&
    _buildbotTarget() != null;

/// Whether the player screen accepts keyboard gameplay, mapping keys to a
/// RetroPad mask sent down to the core. All desktops do, so a game is playable
/// without a controller.
bool get usesKeyboardInput => PlatformDetection.isDesktop;

/// Whether the player shows on-screen touch controls. Android phones and tablets
/// have no physical buttons, so a virtual gamepad drives the RetroPad mask.
bool get usesOnScreenControls =>
    PlatformDetection.isAndroid && !PlatformDetection.isTV;

/// The save-state key for a game. Native libretro states are namespaced so they
/// don't collide with an EmulatorJS state of the same game.
String gameStateKey(String gameId) =>
    usesNativeGameBackend ? 'lr-$gameId' : gameId;

/// The libretro core id for an EmulatorJS core name, or null if there's no
/// mapping for it.
String? libretroCoreId(String core) => _libretroCores[core];

/// Whether the active backend can play the given EmulatorJS core.
///
/// tvOS only runs its bundled subset. The native backend elsewhere needs a
/// libretro mapping for the system (macOS bundles every mapped core, Android
/// and the other desktops download them on demand). EmulatorJS plays
/// everything the plugin serves.
bool gameCoreSupported(String core) {
  if (PlatformDetection.isAppleTV) {
    final id = _libretroCores[core];
    return id != null && tvosBundledCores.contains(id);
  }
  if (usesNativeGameBackend) return _libretroCores[core] != null;
  return true;
}

/// The downloaded-core file name for a libretro core id on this platform.
String coreFileName(String coreId) {
  final ext = Platform.isWindows
      ? 'dll'
      : Platform.isMacOS
          ? 'dylib'
          : 'so';
  return '${coreId}_libretro.$ext';
}

/// The buildbot path segment and in-zip file suffix for this device, or null
/// when libretro publishes no build for the architecture.
({String dir, String suffix})? _buildbotTarget() {
  switch (Abi.current()) {
    case Abi.androidArm64:
      return (dir: 'android/latest/arm64-v8a', suffix: '_libretro_android.so.zip');
    case Abi.androidArm:
      return (dir: 'android/latest/armeabi-v7a', suffix: '_libretro_android.so.zip');
    case Abi.androidX64:
      return (dir: 'android/latest/x86_64', suffix: '_libretro_android.so.zip');
    case Abi.linuxX64:
      return (dir: 'linux/x86_64/latest', suffix: '_libretro.so.zip');
    case Abi.macosArm64:
      return (dir: 'apple/osx/arm64/latest', suffix: '_libretro.dylib.zip');
    case Abi.macosX64:
      return (dir: 'apple/osx/x86_64/latest', suffix: '_libretro.dylib.zip');
    case Abi.windowsX64:
      return (dir: 'windows/x86_64/latest', suffix: '_libretro.dll.zip');
    default:
      return null;
  }
}

/// The buildbot download URL for a core on this device, or null when libretro
/// has no build for the architecture. The zip holds one core file, which the
/// downloader extracts to [coreFileName] regardless of its name inside.
String? coreDownloadUrl(String coreId) {
  final target = _buildbotTarget();
  if (target == null) return null;
  return 'https://buildbot.libretro.com/nightly/${target.dir}/$coreId${target.suffix}';
}

/// Where downloaded cores live, tagged by ABI so a shared support directory
/// stays correct across architectures.
Future<Directory> coresDirectory() async {
  final support = await getApplicationSupportDirectory();
  final abi = Abi.current().toString().replaceAll(RegExp('[^A-Za-z0-9]'), '');
  return Directory('${support.path}/cores/$abi');
}

/// The path to an installed libretro core file, or null when it isn't
/// downloaded yet. tvOS bundles its cores in the app, so this only resolves
/// downloads on Android and desktop.
Future<String?> installedCorePath(String coreId) async {
  final dir = await coresDirectory();
  final file = File('${dir.path}/${coreFileName(coreId)}');
  return await file.exists() ? file.path : null;
}
