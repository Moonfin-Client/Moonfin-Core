import 'dart:convert';

import 'package:gamepads/gamepads.dart';
import 'package:server_core/server_core.dart';

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

/// Custom physical-keycode bindings for one controller. Missing bindings keep
/// MainActivity's established RetroPad layout as their default.
class NativeControllerMapping {
  const NativeControllerMapping(this.keycodeToButton);

  static const empty = NativeControllerMapping({});

  final Map<int, RetroPadButton> keycodeToButton;

  factory NativeControllerMapping.fromJson(String json) {
    try {
      final decoded = jsonDecode(json);
      if (decoded is! Map) return empty;
      final bindings = <int, RetroPadButton>{};
      for (final entry in decoded.entries) {
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
      return NativeControllerMapping(Map.unmodifiable(bindings));
    } catch (_) {
      return empty;
    }
  }

  String toJson() => jsonEncode({
    for (final entry in keycodeToButton.entries)
      entry.key.toString(): entry.value.retroPadIndex,
  });

  NativeControllerMapping withBinding(int keycode, RetroPadButton button) {
    final next = Map<int, RetroPadButton>.from(keycodeToButton);
    // One physical key and one semantic button each have exactly one binding.
    next.removeWhere((_, current) => current == button);
    next[keycode] = button;
    return NativeControllerMapping(Map.unmodifiable(next));
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

Future<void> saveControllerMapping(
  GamesApi games,
  String deviceHash,
  NativeControllerMapping mapping,
) => games.putSave(
  _controllerMappingSaveId(deviceHash),
  utf8.encode(mapping.toJson()),
  kind: 'settings',
);
