import 'package:flutter_test/flutter_test.dart';
import 'package:gamepads/gamepads.dart';
import 'package:moonfin/util/native_controller_mapping.dart';

void main() {
  test('round-trips through JSON', () {
    const mapping = NativeControllerMapping({
      96: RetroPadButton.a,
      97: RetroPadButton.b,
    });

    final restored = NativeControllerMapping.fromJson(mapping.toJson());

    expect(restored.keycodeToButton, mapping.keycodeToButton);
  });

  test('withBinding replaces any existing binding of the same button', () {
    const mapping = NativeControllerMapping({96: RetroPadButton.a});

    final rebound = mapping.withBinding(97, RetroPadButton.a);

    expect(rebound.keycodeToButton[96], isNull);
    expect(rebound.keycodeToButton[97], RetroPadButton.a);
  });

  test('withBinding replaces any existing binding of the same key', () {
    const mapping = NativeControllerMapping({96: RetroPadButton.a});

    final rebound = mapping.withBinding(96, RetroPadButton.b);

    expect(rebound.keycodeToButton[96], RetroPadButton.b);
  });

  test('ignores malformed persisted bindings', () {
    final restored = NativeControllerMapping.fromJson('{"96": 99, "bad": 0}');

    expect(restored.keycodeToButton, isEmpty);
  });

  // These codes are persisted in users' saved desktop mappings, so the table
  // has to stay both complete and stable across gamepads-package upgrades. A
  // new button arriving upstream is silently unmappable without the first
  // check; a duplicated code would make two physical buttons share one
  // binding. Neither shows up as a compile error.
  test('every normalized gamepad button has a unique persisted code', () {
    expect(
      desktopGamepadButtonCodes.keys.toSet(),
      GamepadButton.values.toSet(),
      reason: 'gamepads upgrade changed GamepadButton; update the code table',
    );
    expect(
      desktopGamepadButtonCodes.values.toSet().length,
      GamepadButton.values.length,
      reason: 'two buttons share a persisted code',
    );
    expect(desktopGamepadButtonsByCode.length, GamepadButton.values.length);
  });

  test('desktop device ids are namespaced away from Android hashes', () {
    expect(desktopControllerDeviceId('0'), 'pad:0');
  });
}
