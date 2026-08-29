import 'dart:convert';

import 'package:gamepads/gamepads.dart';
import 'package:server_core/server_core.dart';

import 'settings_save_retry.dart';

/// The RetroPad semantic indices accepted by the native libretro bridge.
enum RetroPadButton {
  a(0, 'A'),
  x(1, 'X'),
  select(2, 'Select'),
  start(3, 'Start'),
  up(4, 'D-pad Up'),
  down(5, 'D-pad Down'),
  left(6, 'D-pad Left'),
  right(7, 'D-pad Right'),
  b(8, 'B'),
  y(9, 'Y'),
  l1(10, 'L1'),
  r1(11, 'R1'),
  l2(12, 'L2'),
  r2(13, 'R2'),
  l3(14, 'L3'),
  r3(15, 'R3');

  const RetroPadButton(this.retroPadIndex, this.label);

  final int retroPadIndex;
  final String label;
}

/// Libretro's generic controller type. Leaving a port on this type asks the
/// core to use its own default layout rather than assuming an advertised entry
/// is the default.
const retroDeviceJoypad = 1;

/// One controller type advertised by the active libretro core for a port.
class CoreControllerType {
  const CoreControllerType({
    required this.port,
    required this.id,
    required this.label,
  });

  final int port;
  final int id;
  final String label;

  factory CoreControllerType.fromMap(Map<String, dynamic> map) {
    return CoreControllerType(
      port: (map['port'] as num?)?.toInt() ?? -1,
      id: (map['id'] as num?)?.toInt() ?? retroDeviceJoypad,
      label: map['label']?.toString() ?? 'Unknown controller type',
    );
  }

  bool get isCoreDefault => id == retroDeviceJoypad;

  /// The first UI pass intentionally supports generic joypads plus the three
  /// FBNeo layouts we can drive through the existing Android RetroPad path.
  /// Libretro subtype ids are core-specific, so an identical numeric id from a
  /// different core is not presumed compatible.
  bool isSupportedForCore(String coreId) {
    if (isCoreDefault) return true;
    return coreId == 'fbneo' && _fbNeoControllerTypeIds.contains(id);
  }
}

const Set<int> _fbNeoControllerTypeIds = {5, 261, 517};

/// How strictly a stick is snapped to fixed directions. Per game and per
/// controller: a 4-way game needs the weaker axis dropped, an 8-way game needs
/// diagonals kept.
enum StickSnapMode {
  off('off'),
  eightWay('8way'),
  fourWay('4way');

  const StickSnapMode(this.wireName);

  final String wireName;

  static StickSnapMode fromWireName(String? name) =>
      values.where((mode) => mode.wireName == name).firstOrNull ??
      StickSnapMode.off;
}

/// Custom physical-keycode bindings for one controller. Missing bindings keep
/// MainActivity's established RetroPad layout as their default.
class NativeControllerMapping {
  const NativeControllerMapping(
    this.keycodeToButton, {
    this.controllerTypesByCore = const {},
    this.snapByGame = const {},
    this.bindingsByGame = const {},
  });

  static const empty = NativeControllerMapping({});

  /// The default bindings, used by any game without an override of its own.
  final Map<int, RetroPadButton> keycodeToButton;

  /// Explicit alternate layouts by canonical libretro core id. An absent entry
  /// means [retroDeviceJoypad], i.e. Auto (Core default).
  final Map<String, int> controllerTypesByCore;

  /// Stick snap mode by game id; absent means [StickSnapMode.off].
  final Map<String, StickSnapMode> snapByGame;

  /// Whole replacement binding tables by game id; an absent game inherits
  /// [keycodeToButton].
  ///
  /// Replacement rather than an overlay because bindings are 1:1, and an
  /// overlay cannot say "unbound here" without a tombstone concept.
  final Map<String, Map<int, RetroPadButton>> bindingsByGame;

  /// Returns an independent immutable snapshot of this mapping.
  ///
  /// Mapping values are enums, but the source map may have come from a caller
  /// that still owns a mutable map. Copying at the profile fan-out boundary
  /// prevents one controller's edit from changing another profile in place.
  NativeControllerMapping copy() => NativeControllerMapping(
    Map.unmodifiable(Map<int, RetroPadButton>.from(keycodeToButton)),
    controllerTypesByCore: Map.unmodifiable(
      Map<String, int>.from(controllerTypesByCore),
    ),
    snapByGame: Map.unmodifiable(Map<String, StickSnapMode>.from(snapByGame)),
    bindingsByGame: Map<String, Map<int, RetroPadButton>>.unmodifiable({
      for (final entry in bindingsByGame.entries)
        entry.key: Map<int, RetroPadButton>.unmodifiable(
          Map<int, RetroPadButton>.from(entry.value),
        ),
    }),
  );

  factory NativeControllerMapping.fromJson(String json) {
    try {
      final decoded = jsonDecode(json);
      if (decoded is! Map) return empty;
      final sourceBindings = decoded['bindings'] is Map
          ? decoded['bindings'] as Map
          : decoded;
      final bindings = _bindingsFrom(sourceBindings);
      final controllerTypes = <String, int>{};
      final rawTypes = decoded['controllerTypes'];
      if (rawTypes is Map) {
        for (final entry in rawTypes.entries) {
          final coreId = entry.key.toString();
          final deviceType = entry.value is num
              ? (entry.value as num).toInt()
              : int.tryParse(entry.value.toString());
          if (coreId.isNotEmpty &&
              deviceType != null &&
              deviceType != retroDeviceJoypad) {
            controllerTypes[coreId] = deviceType;
          }
        }
      }
      final snaps = <String, StickSnapMode>{};
      final rawSnaps = decoded['snapByGame'];
      if (rawSnaps is Map) {
        for (final entry in rawSnaps.entries) {
          final gameId = entry.key.toString();
          final mode = StickSnapMode.fromWireName(entry.value?.toString());
          if (gameId.isNotEmpty && mode != StickSnapMode.off) {
            snaps[gameId] = mode;
          }
        }
      }
      final overrides = <String, Map<int, RetroPadButton>>{};
      final rawOverrides = decoded['bindingsByGame'];
      if (rawOverrides is Map) {
        for (final entry in rawOverrides.entries) {
          final gameId = entry.key.toString();
          // A game whose table is unreadable falls back to the default rather
          // than to no bindings at all.
          if (gameId.isEmpty || entry.value is! Map) continue;
          overrides[gameId] = Map<int, RetroPadButton>.unmodifiable(
            _bindingsFrom(entry.value as Map),
          );
        }
      }
      return NativeControllerMapping(
        Map.unmodifiable(bindings),
        controllerTypesByCore: Map.unmodifiable(controllerTypes),
        snapByGame: Map.unmodifiable(snaps),
        bindingsByGame: Map<String, Map<int, RetroPadButton>>.unmodifiable(
          overrides,
        ),
      );
    } catch (_) {
      return empty;
    }
  }

  /// Reads a keycode->button table, skipping anything that is not one, which
  /// is how the nonnumeric metadata keys fall out when this runs on the whole
  /// document.
  static Map<int, RetroPadButton> _bindingsFrom(Map source) {
    final bindings = <int, RetroPadButton>{};
    for (final entry in source.entries) {
      final keycode = int.tryParse(entry.key.toString());
      final buttonIndex = entry.value is num
          ? (entry.value as num).toInt()
          : int.tryParse(entry.value.toString());
      if (keycode == null || buttonIndex == null) continue;
      final button = RetroPadButton.values
          .where((candidate) => candidate.retroPadIndex == buttonIndex)
          .firstOrNull;
      if (button != null) bindings[keycode] = button;
    }
    return bindings;
  }

  String toJson() => jsonEncode({
    // Keep keycodes at the top level so older Moonfin clients continue to
    // consume the bindings and simply ignore the nonnumeric metadata key.
    for (final entry in keycodeToButton.entries)
      entry.key.toString(): entry.value.retroPadIndex,
    if (controllerTypesByCore.isNotEmpty)
      'controllerTypes': controllerTypesByCore,
    if (snapByGame.isNotEmpty)
      'snapByGame': {
        for (final entry in snapByGame.entries) entry.key: entry.value.wireName,
      },
    if (bindingsByGame.isNotEmpty)
      'bindingsByGame': {
        for (final entry in bindingsByGame.entries)
          entry.key: {
            for (final binding in entry.value.entries)
              binding.key.toString(): binding.value.retroPadIndex,
          },
      },
  });

  NativeControllerMapping withBinding(int keycode, RetroPadButton button) {
    final next = Map<int, RetroPadButton>.from(keycodeToButton);
    // One physical key and one semantic button each have exactly one binding.
    next.removeWhere((_, current) => current == button);
    next[keycode] = button;
    return NativeControllerMapping(
      Map.unmodifiable(next),
      controllerTypesByCore: controllerTypesByCore,
      snapByGame: snapByGame,
      bindingsByGame: bindingsByGame,
    );
  }

  /// The bindings [gameId] actually plays with: its own table when it has one,
  /// otherwise the default.
  Map<int, RetroPadButton> bindingsForGame(String gameId) =>
      bindingsByGame[gameId] ?? keycodeToButton;

  /// Whether [gameId] has diverged from the default.
  bool hasGameOverride(String gameId) => bindingsByGame.containsKey(gameId);

  /// Binds within [gameId]'s own table, leaving every other game alone.
  ///
  /// The first edit copies the current default in, so buttons the user never
  /// touched keep working. An empty [gameId] edits the default itself.
  NativeControllerMapping withBindingForGame(
    String gameId,
    int keycode,
    RetroPadButton button,
  ) {
    if (gameId.isEmpty) return withBinding(keycode, button);
    final table = Map<int, RetroPadButton>.from(bindingsForGame(gameId));
    // One physical key and one semantic button each have exactly one binding,
    // within this game only.
    table.removeWhere((_, current) => current == button);
    table[keycode] = button;
    return _withOverrides({
      ...bindingsByGame,
      gameId: Map<int, RetroPadButton>.unmodifiable(table),
    });
  }

  /// Replaces [gameId]'s whole table with [bindings], for copy-to-all-pads and
  /// reset. An empty [gameId] replaces the default instead.
  NativeControllerMapping withBindingsForGame(
    String gameId,
    Map<int, RetroPadButton> bindings,
  ) {
    if (gameId.isEmpty) {
      return NativeControllerMapping(
        Map<int, RetroPadButton>.unmodifiable(bindings),
        controllerTypesByCore: controllerTypesByCore,
        snapByGame: snapByGame,
        bindingsByGame: bindingsByGame,
      );
    }
    return _withOverrides({
      ...bindingsByGame,
      gameId: Map<int, RetroPadButton>.unmodifiable(bindings),
    });
  }

  /// Returns [gameId] to the default bindings.
  NativeControllerMapping withoutGameOverride(String gameId) {
    if (!bindingsByGame.containsKey(gameId)) return this;
    final next = Map<String, Map<int, RetroPadButton>>.from(bindingsByGame)
      ..remove(gameId);
    return _withOverrides(next);
  }

  NativeControllerMapping _withOverrides(
    Map<String, Map<int, RetroPadButton>> overrides,
  ) => NativeControllerMapping(
    keycodeToButton,
    controllerTypesByCore: controllerTypesByCore,
    snapByGame: snapByGame,
    bindingsByGame: Map<String, Map<int, RetroPadButton>>.unmodifiable(
      overrides,
    ),
  );

  int controllerTypeForCore(String coreId) =>
      controllerTypesByCore[coreId] ?? retroDeviceJoypad;

  NativeControllerMapping withControllerType(String coreId, int deviceType) {
    final next = Map<String, int>.from(controllerTypesByCore);
    if (deviceType == retroDeviceJoypad) {
      next.remove(coreId);
    } else {
      next[coreId] = deviceType;
    }
    return NativeControllerMapping(
      keycodeToButton,
      controllerTypesByCore: Map.unmodifiable(next),
      snapByGame: snapByGame,
      bindingsByGame: bindingsByGame,
    );
  }

  StickSnapMode snapForGame(String gameId) =>
      snapByGame[gameId] ?? StickSnapMode.off;

  NativeControllerMapping withSnap(String gameId, StickSnapMode mode) {
    final next = Map<String, StickSnapMode>.from(snapByGame);
    if (mode == StickSnapMode.off) {
      next.remove(gameId);
    } else {
      next[gameId] = mode;
    }
    return NativeControllerMapping(
      keycodeToButton,
      controllerTypesByCore: controllerTypesByCore,
      snapByGame: Map.unmodifiable(next),
      bindingsByGame: bindingsByGame,
    );
  }
}

/// Persisted binding codes for the gamepads package's normalized buttons.
///
/// Windows and Linux read controllers in Dart, so they have no keycode to key a
/// [NativeControllerMapping] by the way Android does. These codes fill that
/// role. They are written out one by one rather than taken from
/// `GamepadButton.index` on purpose: the enum belongs to a third-party package,
/// and inserting or reordering a member there would silently rebind every saved
/// desktop mapping to the wrong button, with nothing in this repo changing to
/// hint at it. They start at 1000 so a value that ever reaches the Android path
/// is obviously not an Android keycode.
const Map<GamepadButton, int> desktopGamepadButtonCodes = {
  GamepadButton.a: 1000,
  GamepadButton.b: 1001,
  GamepadButton.x: 1002,
  GamepadButton.y: 1003,
  GamepadButton.leftBumper: 1004,
  GamepadButton.rightBumper: 1005,
  GamepadButton.leftTrigger: 1006,
  GamepadButton.rightTrigger: 1007,
  GamepadButton.back: 1008,
  GamepadButton.start: 1009,
  GamepadButton.home: 1010,
  GamepadButton.leftStick: 1011,
  GamepadButton.rightStick: 1012,
  GamepadButton.dpadUp: 1013,
  GamepadButton.dpadDown: 1014,
  GamepadButton.dpadLeft: 1015,
  GamepadButton.dpadRight: 1016,
  GamepadButton.touchpad: 1017,
};

/// The reverse of [desktopGamepadButtonCodes], for turning a stored binding
/// back into the button that produced it.
final Map<int, GamepadButton> desktopGamepadButtonsByCode = Map.unmodifiable({
  for (final entry in desktopGamepadButtonCodes.entries) entry.value: entry.key,
});

/// Namespaces a gamepads-package controller id for use as a save id.
///
/// Android device ids are hashes; the gamepads package hands out short platform
/// ids that can be as plain as "0". Prefixing keeps a desktop pad from ever
/// colliding with an Android controller's saved mapping in the same account,
/// and makes which platform wrote a save obvious from the id alone.
String desktopControllerDeviceId(String gamepadId) => 'pad:$gamepadId';

String _controllerMappingSaveId(String deviceHash) =>
    'moonfin-native-controller-$deviceHash';

Future<NativeControllerMapping> loadControllerMapping(
  GamesApi games,
  String deviceHash,
) async {
  try {
    final blob = await games.getSave(
      _controllerMappingSaveId(deviceHash),
      kind: 'settings',
    );
    if (blob == null || blob.isEmpty) return NativeControllerMapping.empty;
    return NativeControllerMapping.fromJson(utf8.decode(blob));
  } catch (_) {
    return NativeControllerMapping.empty;
  }
}

/// Like [loadControllerMapping], but reports WHY there is nothing.
///
/// The two cases are not interchangeable: "this pad has no saved mapping" is a
/// fact, while "the server could not be reached" is an unknown. Treating the
/// second as the first shows default bindings, and then the next edit persists
/// that blank state over the user's real mapping -- losing it. Anything that
/// may go on to WRITE should use this and refuse to save when [reachable] is
/// false.
class ControllerMappingLoad {
  const ControllerMappingLoad(this.mapping, {required this.reachable});

  final NativeControllerMapping mapping;

  /// False when the read itself failed, so [mapping] is a fallback rather than
  /// the stored truth.
  final bool reachable;
}

Future<ControllerMappingLoad> loadControllerMappingChecked(
  GamesApi games,
  String deviceHash,
) async {
  try {
    final blob = await games.getSave(
      _controllerMappingSaveId(deviceHash),
      kind: 'settings',
    );
    if (blob == null || blob.isEmpty) {
      return const ControllerMappingLoad(
        NativeControllerMapping.empty,
        reachable: true,
      );
    }
    return ControllerMappingLoad(
      NativeControllerMapping.fromJson(utf8.decode(blob)),
      reachable: true,
    );
  } catch (_) {
    return const ControllerMappingLoad(
      NativeControllerMapping.empty,
      reachable: false,
    );
  }
}

/// Persists [mapping], retrying transient transport failures.
///
/// Throws when the write ultimately fails, so the caller can say so rather than
/// leaving the user with an edit that only exists for this session.
Future<void> saveControllerMapping(
  GamesApi games,
  String deviceHash,
  NativeControllerMapping mapping, {
  Future<void> Function(Duration)? retryDelay,
}) => retryOnTransientFailure(
  () => games.putSave(
    _controllerMappingSaveId(deviceHash),
    utf8.encode(mapping.toJson()),
    kind: 'settings',
  ),
  delay: retryDelay,
);
