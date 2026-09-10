import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gamepads/gamepads.dart';
import 'package:moonfin/util/desktop_emulator_gamepad.dart';

typedef _Press = (String label, bool pressed);

NormalizedGamepadEvent _button(
  GamepadButton button, {
  required bool pressed,
  String gamepadId = 'pad-1',
}) => NormalizedGamepadEvent(
  gamepadId: gamepadId,
  timestamp: 0,
  value: pressed ? 1 : 0,
  button: button,
  rawEvent: GamepadEvent(
    gamepadId: gamepadId,
    timestamp: 0,
    type: KeyType.button,
    key: button.name,
    value: pressed ? 1 : 0,
  ),
);

NormalizedGamepadEvent _axis(
  GamepadAxis axis,
  double value, {
  String gamepadId = 'pad-1',
}) => NormalizedGamepadEvent(
  gamepadId: gamepadId,
  timestamp: 0,
  value: value,
  axis: axis,
  rawEvent: GamepadEvent(
    gamepadId: gamepadId,
    timestamp: 0,
    type: KeyType.analog,
    key: axis.name,
    value: value,
  ),
);

void main() {
  late StreamController<NormalizedGamepadEvent> pad;
  late List<_Press> seen;
  late List<Map<String, dynamic>> devices;
  late DesktopEmulatorGamepad forwarder;

  setUp(() {
    pad = StreamController<NormalizedGamepadEvent>.broadcast();
    seen = [];
    devices = [];
    forwarder = DesktopEmulatorGamepad(
      events: pad.stream,
      listGamepads: () async => [(id: 'pad-1', name: 'Xbox Controller')],
      onButton: (label, pressed, device) {
        seen.add((label, pressed));
        devices.add(device);
      },
    )..start();
  });

  tearDown(() async {
    forwarder.stop();
    await pad.close();
  });

  Future<void> send(NormalizedGamepadEvent event) async {
    pad.add(event);
    await Future<void>.delayed(Duration.zero);
  }

  group('buttons', () {
    test('a face button arrives under its EmulatorJS name', () async {
      await send(_button(GamepadButton.a, pressed: true));
      await send(_button(GamepadButton.a, pressed: false));
      expect(seen, [('BUTTON_2', true), ('BUTTON_2', false)]);
    });

    test('start and select keep the names the overlay watches for', () async {
      await send(_button(GamepadButton.start, pressed: true));
      await send(_button(GamepadButton.back, pressed: true));
      expect(seen, [('START', true), ('SELECT', true)]);
    });

    test('a button with nothing to map to is dropped', () async {
      await send(_button(GamepadButton.home, pressed: true));
      await send(_button(GamepadButton.touchpad, pressed: true));
      expect(seen, isEmpty);
    });
  });

  group('directions', () {
    test('the d-pad reports the direction it was given', () async {
      await send(_button(GamepadButton.dpadLeft, pressed: true));
      await send(_button(GamepadButton.dpadLeft, pressed: false));
      expect(seen, [('DPAD_LEFT', true), ('DPAD_LEFT', false)]);
    });

    test('the left stick drives the same four directions', () async {
      await send(_axis(GamepadAxis.leftStickX, 1));
      expect(seen, [('DPAD_RIGHT', true)]);
    });

    test('stick up is up, not down', () async {
      await send(_axis(GamepadAxis.leftStickY, 1));
      expect(seen, [('DPAD_UP', true)]);
    });

    test('inside the deadzone the stick says nothing', () async {
      await send(_axis(GamepadAxis.leftStickX, 0.4));
      expect(seen, isEmpty);
    });

    test('flicking across releases the old direction first', () async {
      await send(_axis(GamepadAxis.leftStickX, 1));
      seen.clear();
      await send(_axis(GamepadAxis.leftStickX, -1));
      expect(seen, [('DPAD_RIGHT', false), ('DPAD_LEFT', true)]);
    });

    test('a held d-pad wins over the stick', () async {
      await send(_button(GamepadButton.dpadLeft, pressed: true));
      seen.clear();
      await send(_axis(GamepadAxis.leftStickX, 1));
      expect(seen, isEmpty);
    });

    test('the stick takes over once the d-pad is let go', () async {
      await send(_button(GamepadButton.dpadLeft, pressed: true));
      await send(_axis(GamepadAxis.leftStickX, 1));
      seen.clear();
      await send(_button(GamepadButton.dpadLeft, pressed: false));
      expect(seen, [('DPAD_LEFT', false), ('DPAD_RIGHT', true)]);
    });

    test('the right stick is not a direction', () async {
      await send(_axis(GamepadAxis.rightStickX, 1));
      await send(_axis(GamepadAxis.rightStickY, -1));
      expect(seen, isEmpty);
    });
  });

  group('triggers', () {
    test('an analog trigger reports once it is far enough down', () async {
      await send(_axis(GamepadAxis.leftTrigger, 0.2));
      expect(seen, isEmpty);
      await send(_axis(GamepadAxis.leftTrigger, 0.9));
      expect(seen, [('LEFT_BOTTOM_SHOULDER', true)]);
    });

    test('holding a trigger down reports nothing new', () async {
      await send(_axis(GamepadAxis.rightTrigger, 0.9));
      await send(_axis(GamepadAxis.rightTrigger, 1));
      expect(seen, [('RIGHT_BOTTOM_SHOULDER', true)]);
    });

    test('letting a trigger go reports the release', () async {
      await send(_axis(GamepadAxis.rightTrigger, 1));
      await send(_axis(GamepadAxis.rightTrigger, 0));
      expect(seen, [
        ('RIGHT_BOTTOM_SHOULDER', true),
        ('RIGHT_BOTTOM_SHOULDER', false),
      ]);
    });
  });

  group('the pad it came from', () {
    test('carries the name the page lists it under', () async {
      await forwarder.refreshDevices();
      await send(_button(GamepadButton.a, pressed: true));
      expect(devices.single, {'id': 'pad-1', 'name': 'Xbox Controller'});
    });

    test('falls back to a plain name before the list is read', () async {
      await send(_button(GamepadButton.a, pressed: true));
      expect(devices.single['name'], 'Controller');
    });

    test('registers what the plugin reports', () async {
      expect(await forwarder.refreshDevices(), [
        {'id': 'pad-1', 'name': 'Xbox Controller'},
      ]);
    });

    test('two pads keep their own directions apart', () async {
      await send(_axis(GamepadAxis.leftStickX, 1));
      await send(_axis(GamepadAxis.leftStickX, 1, gamepadId: 'pad-2'));
      expect(seen, [('DPAD_RIGHT', true), ('DPAD_RIGHT', true)]);
      expect(devices.map((d) => d['id']), ['pad-1', 'pad-2']);
    });
  });

  test('nothing has been reported before a pad speaks', () async {
    expect(forwarder.hasReportedInput, isFalse);
    await send(_button(GamepadButton.a, pressed: true));
    expect(forwarder.hasReportedInput, isTrue);
  });

  test('stopping ends the stream', () async {
    forwarder.stop();
    await send(_button(GamepadButton.a, pressed: true));
    expect(seen, isEmpty);
  });
}
