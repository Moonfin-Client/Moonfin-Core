import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import '../preference/user_preferences.dart';
import 'game_cores_abi_stub.dart'
    if (dart.library.io) 'game_cores_abi_io.dart';
import 'game_storage.dart';
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

/// The subset shipped inside the tvOS and iOS apps. The App Store can't
/// download executable code, so these targets bundle a fixed set that also
/// avoids JIT.
const Set<String> appleBundledCores = {
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

/// Runtime files a core needs in the system directory before it can boot.
class CoreSupportFiles {
  const CoreSupportFiles({
    required this.url,
    required this.folder,
    required this.markerFile,
    required this.approxSizeMb,
  });

  /// A zip whose entries all sit under a single top-level [folder], so it
  /// unpacks straight into the system directory.
  final String url;

  /// The folder the core looks for inside the system directory.
  final String folder;

  /// A file that only exists once the payload is unpacked, used to tell an
  /// installed set from a missing or half-written one.
  final String markerFile;

  /// Rough download size in megabytes, added to the core's own size.
  final double approxSizeMb;
}

/// The cores that can't boot on the core file alone. PPSSPP reads its fonts,
/// atlas, and compatibility database from `<systemDir>/PPSSPP`, and without
/// them a PSP game fails to boot and the core asks to quit mid-frame.
const Map<String, CoreSupportFiles> coreSupportFiles = {
  'ppsspp': CoreSupportFiles(
    url: 'https://buildbot.libretro.com/assets/system/PPSSPP.zip',
    folder: 'PPSSPP',
    markerFile: 'compat.ini',
    approxSizeMb: 11,
  ),
};

/// The support files this platform has to fetch for [coreId], or null when
/// there are none. The Apple targets bundle theirs and seed the system
/// directory natively at load time, so nothing is downloaded there.
CoreSupportFiles? coreSupportFilesFor(String coreId) =>
    bundlesGameCores ? null : coreSupportFiles[coreId];

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
  // 18 MB core plus the PPSSPP support files, which are fetched with it.
  GameCore(coreId: 'ppsspp', system: 'PlayStation Portable', approxSizeMb: 29, needsJit: true),
  GameCore(coreId: 'melonds', system: 'Nintendo DS', approxSizeMb: 4, needsJit: true),
  GameCore(coreId: 'mednafen_pce_fast', system: 'PC Engine and TurboGrafx-16', approxSizeMb: 2),
  GameCore(coreId: 'stella', system: 'Atari 2600', approxSizeMb: 2),
  GameCore(coreId: 'prosystem', system: 'Atari 7800', approxSizeMb: 1),
  GameCore(coreId: 'handy', system: 'Atari Lynx', approxSizeMb: 1),
  GameCore(coreId: 'mednafen_wswan', system: 'WonderSwan', approxSizeMb: 2),
  GameCore(coreId: 'mednafen_ngp', system: 'Neo Geo Pocket', approxSizeMb: 1),
  GameCore(coreId: 'mednafen_vb', system: 'Virtual Boy', approxSizeMb: 2),
];

/// Whether this platform has the native libretro backend at all (tvOS, iOS,
/// Android, desktop). iOS bundles a fixed core set and falls back to the
/// EmulatorJS WebView for systems it can't play natively.
bool get nativeGameBackendSupported =>
    PlatformDetection.isAppleTV ||
    PlatformDetection.isIOS ||
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
/// bundle rather than downloading them. tvOS, iOS, and macOS bundle (the Apple
/// stores forbid downloading executable code), so none show the download
/// manager.
bool get bundlesGameCores =>
    PlatformDetection.isAppleTV ||
    PlatformDetection.isIOS ||
    PlatformDetection.isMacOS;

/// Whether this device can download and run cores, and so should offer the
/// emulator cores manager. Bundled platforms (tvOS, macOS) and the WebView on
/// iOS do not. Android, Windows, and Linux download, and also need an
/// architecture the libretro buildbot builds for.
bool get supportsCoreDownloads =>
    !bundlesGameCores &&
    (PlatformDetection.isAndroid || PlatformDetection.isDesktop) &&
    currentBuildbotTarget() != null;

/// Whether the player screen accepts keyboard gameplay, mapping keys to a
/// RetroPad mask sent down to the core. All desktops do, so a game is playable
/// without a controller.
bool get usesKeyboardInput => PlatformDetection.isDesktop;

/// Whether the player shows on-screen touch controls. Phones and tablets have
/// no physical buttons, so a virtual gamepad drives the RetroPad mask. A
/// connected controller is still read natively alongside it.
bool get usesOnScreenControls =>
    (PlatformDetection.isAndroid || PlatformDetection.isIOS) &&
    !PlatformDetection.isTV;

/// The save-state key for a game. Native libretro states are namespaced so they
/// don't collide with an EmulatorJS state of the same game. Keyed on the core
/// because a single device can route some systems to native and others to
/// EmulatorJS.
String gameStateKey(String gameId, String core) =>
    usesNativeGameBackendFor(core) ? 'lr-$gameId' : gameId;

/// The libretro core id for an EmulatorJS core name, or null if there's no
/// mapping for it.
String? libretroCoreId(String core) => _libretroCores[core];

/// Whether the native backend on this platform can play the given system. The
/// bundled Apple targets only run their fixed set. macOS bundles every mapped
/// core, and Android and desktop download any mapped core on demand.
bool nativeCanPlay(String core) {
  final id = _libretroCores[core];
  if (id == null) return false;
  if (PlatformDetection.isAppleTV || PlatformDetection.isIOS) {
    return appleBundledCores.contains(id);
  }
  return true;
}

/// Whether a specific game plays through the native backend right now. Native
/// is used when it's selected and can play the system. Where it can't but
/// EmulatorJS exists, that one game falls back to the WebView.
bool usesNativeGameBackendFor(String core) =>
    usesNativeGameBackend && (nativeCanPlay(core) || !emulatorJsAvailable);

/// Whether the game can be played at all here: natively, or through EmulatorJS
/// where that backend exists. tvOS and Linux have no WebView, so only their
/// bundled or mapped native cores are playable.
bool gameCoreSupported(String core) =>
    nativeCanPlay(core) || emulatorJsAvailable;

/// The downloaded-core file name for a libretro core id on this platform.
String coreFileName(String coreId) {
  final ext = Platform.isWindows
      ? 'dll'
      : Platform.isMacOS
          ? 'dylib'
          : 'so';
  return '${coreId}_libretro.$ext';
}

/// The buildbot download URL for a core on this device, or null when libretro
/// has no build for the architecture. The zip holds one core file, which the
/// downloader extracts to [coreFileName] regardless of its name inside.
String? coreDownloadUrl(String coreId) {
  final target = currentBuildbotTarget();
  if (target == null) return null;
  return 'https://buildbot.libretro.com/nightly/${target.dir}/${_buildbotCoreName(coreId)}${target.suffix}';
}

/// The buildbot file name for a core, which usually matches the id. Android
/// only publishes Nintendo 64 as the GLES build, so it needs a different name
/// there while the downloaded file still lands under the plain id.
String _buildbotCoreName(String coreId) {
  if (coreId == 'mupen64plus_next' && PlatformDetection.isAndroid) {
    return 'mupen64plus_next_gles3';
  }
  return coreId;
}

/// Where downloaded cores live, tagged by ABI so a shared support directory
/// stays correct across architectures.
Future<Directory> coresDirectory() async {
  final support = await getApplicationSupportDirectory();
  final abi = currentAbiTag();
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

/// Where a core's support files live once installed, under the shared system
/// directory the core is handed at load time.
Future<Directory> coreSupportDirectory(CoreSupportFiles files) async {
  final system = await GameStorage.systemDir();
  return Directory('${system.path}/${files.folder}');
}

/// Whether [coreId] has everything it needs to boot. Cores without support
/// files, and the platforms that bundle theirs, are always ready.
Future<bool> coreSupportFilesInstalled(String coreId) async {
  final files = coreSupportFilesFor(coreId);
  if (files == null) return true;
  final dir = await coreSupportDirectory(files);
  return File('${dir.path}/${files.markerFile}').exists();
}
