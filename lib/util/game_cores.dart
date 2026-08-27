import 'dart:convert';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_core/server_core.dart';

import '../preference/user_preferences.dart';
import 'game_cores_abi_stub.dart'
    if (dart.library.io) 'game_cores_abi_io.dart';
import 'game_storage.dart';
import 'platform_detection.dart';

/// Whether [core] is one of the server's arcade-family core names ("arcade"
/// for FBNeo, "mame" for MAME), mirroring
/// `GamesService.IsArcadeFamilyCore` on the server. Arcade ROMs are
/// multi-file ZIPs that the core must receive intact, unlike every other
/// system's single-file ROMs.
bool isArcadeFamilyCore(String core) => core == 'arcade' || core == 'mame';

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
    this.emulatorJsSystemCores = const {},
    this.bundledOnApple = false,
    this.bundledOnMacOS = false,
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

  /// Server core names that load this libretro core when native playback is
  /// selected. Keeping aliases here makes the catalog the single source of
  /// truth for routing, download metadata, and bundled-core inventories.
  final Set<String> emulatorJsSystemCores;

  /// Whether this interpreter-only core ships in the iOS and tvOS apps.
  final bool bundledOnApple;

  /// Whether this core is fetched into the macOS app bundle.
  final bool bundledOnMacOS;
}

/// Native core capabilities, ordered as they appear in the download manager.
///
/// Each entry owns its server-core aliases, download presentation, JIT policy,
/// and Apple bundle membership. MAME deliberately has no entry: it is an
/// EmulatorJS-only server core, while `arcade` maps to FBNeo.
const List<GameCore> gameCoreCatalog = [
  GameCore(
    coreId: 'fceumm',
    system: 'Nintendo Entertainment System',
    approxSizeMb: 1,
    emulatorJsSystemCores: {'nes'},
    bundledOnApple: true,
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'snes9x',
    system: 'Super Nintendo',
    approxSizeMb: 3,
    emulatorJsSystemCores: {'snes'},
    bundledOnApple: true,
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'gambatte',
    system: 'Game Boy and Game Boy Color',
    approxSizeMb: 1,
    emulatorJsSystemCores: {'gb'},
    bundledOnApple: true,
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'mgba',
    system: 'Game Boy Advance',
    approxSizeMb: 3,
    emulatorJsSystemCores: {'gba'},
    bundledOnApple: true,
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'genesis_plus_gx',
    system: 'Sega Genesis, Master System, and Game Gear',
    approxSizeMb: 2,
    emulatorJsSystemCores: {'segaMD', 'segaMS', 'segaGG'},
    bundledOnApple: true,
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'pcsx_rearmed',
    system: 'PlayStation',
    approxSizeMb: 2,
    emulatorJsSystemCores: {'psx'},
    bundledOnApple: true,
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'fbneo',
    system: 'Arcade (FBNeo)',
    approxSizeMb: 16,
    emulatorJsSystemCores: {'arcade'},
  ),
  GameCore(
    coreId: 'mupen64plus_next',
    system: 'Nintendo 64',
    approxSizeMb: 6,
    needsJit: true,
    emulatorJsSystemCores: {'n64'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'ppsspp',
    system: 'PlayStation Portable',
    approxSizeMb: 18,
    needsJit: true,
    emulatorJsSystemCores: {'psp'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'melonds',
    system: 'Nintendo DS',
    approxSizeMb: 4,
    needsJit: true,
    emulatorJsSystemCores: {'nds'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'mednafen_pce_fast',
    system: 'PC Engine and TurboGrafx-16',
    approxSizeMb: 2,
    emulatorJsSystemCores: {'pce'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'stella',
    system: 'Atari 2600',
    approxSizeMb: 2,
    emulatorJsSystemCores: {'atari2600'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'prosystem',
    system: 'Atari 7800',
    approxSizeMb: 1,
    emulatorJsSystemCores: {'atari7800'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'handy',
    system: 'Atari Lynx',
    approxSizeMb: 1,
    emulatorJsSystemCores: {'lynx'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'mednafen_wswan',
    system: 'WonderSwan',
    approxSizeMb: 2,
    emulatorJsSystemCores: {'ws'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'mednafen_ngp',
    system: 'Neo Geo Pocket',
    approxSizeMb: 1,
    emulatorJsSystemCores: {'ngp'},
    bundledOnMacOS: true,
  ),
  GameCore(
    coreId: 'mednafen_vb',
    system: 'Virtual Boy',
    approxSizeMb: 2,
    emulatorJsSystemCores: {'vb'},
    bundledOnMacOS: true,
  ),
];

/// The cores offered in the download manager. Kept as a named view for its
/// existing consumers; every entry is defined by [gameCoreCatalog].
final List<GameCore> downloadableCores = List.unmodifiable(gameCoreCatalog);

/// The subset shipped inside the tvOS and iOS apps. The App Store can't
/// download executable code, so these targets bundle a fixed set that also
/// avoids JIT. Derived from [gameCoreCatalog] and checked against both fetch
/// scripts in the focused tests.
final Set<String> appleBundledCores = Set.unmodifiable(
  gameCoreCatalog
      .where((core) => core.bundledOnApple)
      .map((core) => core.coreId),
);

/// The libretro core ids macOS actually bundles, derived from
/// [gameCoreCatalog] and checked against `macos/game_host/fetch_cores.sh`.
final Set<String> macosBundledCores = Set.unmodifiable(
  gameCoreCatalog
      .where((core) => core.bundledOnMacOS)
      .map((core) => core.coreId),
);

/// EmulatorJS core name to libretro core id for the native backend. The
/// mapping is derived from [gameCoreCatalog] so routing cannot drift from core
/// availability or download metadata.
final Map<String, String> _libretroCores = Map.unmodifiable({
  for (final capability in gameCoreCatalog)
    for (final systemCore in capability.emulatorJsSystemCores)
      systemCore: capability.coreId,
});

/// Whether this platform has the native libretro backend at all (tvOS, iOS,
/// Android, desktop). iOS bundles a fixed core set and falls back to the
/// EmulatorJS WebView for systems it can't play natively.
bool get nativeGameBackendSupported =>
    PlatformDetection.isAppleTV ||
    PlatformDetection.isIOS ||
    PlatformDetection.isAndroid ||
    PlatformDetection.isDesktop;

/// Whether EmulatorJS works in the browser or in this platform's embedded
/// WebView. Linux has no flutter_inappwebview implementation and tvOS has no
/// WebKit.
bool get emulatorJsAvailable =>
    PlatformDetection.isWeb ||
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

/// The save-state key for a game, isolated by emulator core.
///
/// A state produced by one core cannot safely be loaded by another. The
/// backend prefix also prevents the native libretro and EmulatorJS state
/// formats from colliding for the same game/core pair.
String gameStateKey(
  String gameId,
  String core, {
  bool forceEmulatorJs = false,
}) => !forceEmulatorJs && usesNativeGameBackendFor(core)
    ? 'lr-$core-$gameId'
    : 'ejs-$core-$gameId';

/// The save-state key [gameStateKey] replaced. The native backend used to key
/// by game id alone (`lr-$gameId`, no core segment) and EmulatorJS used the
/// bare [gameId] (no prefix, no core segment at all). Kept only so
/// [loadGameStateWithMigration] can find a save written under the old scheme
/// and copy it forward; nothing should write here anymore.
String legacyGameStateKey(
  String gameId,
  String core, {
  bool forceEmulatorJs = false,
}) =>
    !forceEmulatorJs && usesNativeGameBackendFor(core) ? 'lr-$gameId' : gameId;

/// Reads a game's save state, transparently migrating it off the legacy key
/// scheme ([legacyGameStateKey]) the first time it's found.
///
/// Tries [gameStateKey] first. On a miss, falls back to the legacy key; a hit
/// there is copied forward to the new key (best-effort — the legacy bytes are
/// still returned even if that write fails, so the game loads either way) and
/// returned. A miss at both keys returns null.
///
/// Centralizing this here means every read call site gets the migration for
/// free instead of duplicating the fallback logic.
Future<List<int>?> loadGameStateWithMigration(
  GamesApi games,
  String gameId,
  String core, {
  bool forceEmulatorJs = false,
}) async {
  final newKey = gameStateKey(gameId, core, forceEmulatorJs: forceEmulatorJs);
  final current = await games.getSave(newKey);
  if (current != null && current.isNotEmpty) return current;

  final legacyKey = legacyGameStateKey(
    gameId,
    core,
    forceEmulatorJs: forceEmulatorJs,
  );
  if (legacyKey == newKey) return current;
  final legacy = await games.getSave(legacyKey);
  if (legacy == null || legacy.isEmpty) return current;

  try {
    await games.putSave(newKey, legacy);
  } catch (_) {
    // Best-effort: the user's game should still load from the legacy save
    // even if the migration copy didn't stick this time.
  }
  return legacy;
}

/// The saved-settings key for [coreId], shared by every place that reads or
/// writes a core's persisted emulator options.
String coreSettingsKey(String coreId) => 'moonfin-native-$coreId';

/// Clears [coreId]'s saved emulator settings so the next load falls back to
/// the core's own defaults. A single newline byte, not an empty list: the
/// settings parser already treats it as "no saved options", and it avoids
/// sending a zero-byte PUT body, which some HTTP stacks and servers mishandle.
Future<void> resetCoreSettings(GamesApi games, String coreId) =>
    games.putSave(coreSettingsKey(coreId), const [10], kind: 'settings');

/// Reads [coreId]'s persisted options as id -> value. One `id=value` per line;
/// a line with no `=`, or `=` at position zero, is skipped.
Future<Map<String, String>> readCoreSettings(
  GamesApi games,
  String coreId,
) async {
  final blob = await games.getSave(coreSettingsKey(coreId), kind: 'settings');
  if (blob == null || blob.isEmpty) return const {};
  final map = <String, String>{};
  for (final line in String.fromCharCodes(blob).split('\n')) {
    final eq = line.indexOf('=');
    if (eq > 0) map[line.substring(0, eq)] = line.substring(eq + 1);
  }
  return map;
}

/// Writes [values] as [coreId]'s persisted options, in the format
/// [readCoreSettings] and the in-game menu both use.
Future<void> writeCoreSettings(
  GamesApi games,
  String coreId,
  Map<String, String> values,
) {
  if (values.isEmpty) return resetCoreSettings(games, coreId);
  final blob = values.entries.map((e) => '${e.key}=${e.value}').join('\n');
  return games.putSave(
    coreSettingsKey(coreId),
    utf8.encode(blob),
    kind: 'settings',
  );
}

/// EmulatorJS's settings key. One GLOBAL blob for every game, unlike the
/// native cores' per-core keys.
const String emulatorJsSettingsKey = 'moonfin-global';

/// Clears the EmulatorJS settings shared by every game.
///
/// `{}`, not the newline [resetCoreSettings] uses: the restore path injects any
/// non-empty value straight into `ejs-settings`, so a newline would land there
/// unparseable rather than cleared.
Future<void> resetEmulatorJsSettings(GamesApi games) =>
    games.putSave(emulatorJsSettingsKey, utf8.encode('{}'), kind: 'settings');

/// The libretro core id for an EmulatorJS core name, or null if there's no
/// mapping for it.
String? libretroCoreId(String core) => _libretroCores[core];

/// Whether the native backend on this platform can play the given system. The
/// bundled Apple targets only run their fixed set. macOS, Android, and desktop
/// support every mapped core; [_nativeCoreIsAvailable] separately checks
/// whether its bundled or downloaded binary is present.
bool nativeCanPlay(String core) {
  final id = _libretroCores[core];
  if (id == null) return false;
  if (PlatformDetection.isAppleTV || PlatformDetection.isIOS) {
    return appleBundledCores.contains(id);
  }
  return true;
}

/// Whether a specific game plays through the native backend right now. Native
/// is used when it's selected, supports the system, and its core is actually
/// available. Android and desktop otherwise fall back to EmulatorJS instead of
/// opening the native player only to report that its core is not installed.
bool usesNativeGameBackendFor(String core) => resolveNativeGameBackend(
  nativeSelected: usesNativeGameBackend,
  nativeSupported: nativeCanPlay(core),
  emulatorAvailable: emulatorJsAvailable,
  nativeCoreAvailable: _nativeCoreIsAvailable(core),
);

/// Pure routing decision shared with focused tests.
///
/// A platform without EmulatorJS must retain the native route so its player
/// can present the appropriate unsupported/missing-core error. Where the
/// WebView is available, a missing downloadable core is a normal fallback.
bool resolveNativeGameBackend({
  required bool nativeSelected,
  required bool nativeSupported,
  required bool emulatorAvailable,
  required bool nativeCoreAvailable,
}) {
  if (!nativeSelected) return false;
  if (!emulatorAvailable) return true;
  return nativeSupported && nativeCoreAvailable;
}

/// Whether the native backend can genuinely load [core] on this device right
/// now, ignoring the user's current native/EmulatorJS preference. Needed so
/// the core picker can always offer a forceable native option even when
/// EmulatorJS is currently preferred.
bool nativeCoreReachable(String core) =>
    nativeGameBackendSupported && _nativeCoreIsAvailable(core);

bool _nativeCoreIsAvailable(String core) {
  if (!nativeGameBackendSupported) return false;
  if (!nativeCanPlay(core)) return false;
  if (PlatformDetection.isAppleTV || PlatformDetection.isIOS) return true;
  if (PlatformDetection.isMacOS) {
    final id = libretroCoreId(core);
    return id != null && macosBundledCores.contains(id);
  }

  // Android and non-Apple desktop builds install cores on demand. The
  // downloader records a core only after its binary has been written.
  if (PlatformDetection.isAndroid || PlatformDetection.isDesktop) {
    if (!supportsCoreDownloads ||
        !GetIt.instance.isRegistered<PreferenceStore>()) {
      return false;
    }
    final coreId = libretroCoreId(core);
    final installed = GetIt.instance<PreferenceStore>().getStringList(
      installedCoresPreferenceKey,
    );
    return coreId != null && (installed?.contains(coreId) ?? false);
  }

  return true;
}

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
