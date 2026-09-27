// Mirrors the dispatch path under test, which has to use the deprecated key
// message handler to reach the focus tree.
// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/focus/gamepad/gamepad_key_synthesizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GamepadKeySynthesizer synthesizer;
  late List<KeyEvent> seen;
  late bool consume;
  bool handler(KeyEvent event) {
    seen.add(event);
    return consume;
  }

  setUp(() {
    synthesizer = GamepadKeySynthesizer();
    seen = <KeyEvent>[];
    consume = false;
    HardwareKeyboard.instance.addHandler(handler);
  });

  tearDown(() {
    synthesizer.releaseAll();
    HardwareKeyboard.instance.removeHandler(handler);
  });

  test('emits the logical keys the app already navigates with', () {
    for (final entry in {
      GamepadNavKey.up: LogicalKeyboardKey.arrowUp,
      GamepadNavKey.down: LogicalKeyboardKey.arrowDown,
      GamepadNavKey.left: LogicalKeyboardKey.arrowLeft,
      GamepadNavKey.right: LogicalKeyboardKey.arrowRight,
      GamepadNavKey.select: LogicalKeyboardKey.select,
      GamepadNavKey.back: LogicalKeyboardKey.escape,
      GamepadNavKey.contextMenu: LogicalKeyboardKey.contextMenu,
    }.entries) {
      expect(GamepadKeySynthesizer.logicalKeyFor(entry.key), entry.value);
    }
  });

  test('a held direction produces down then repeats then up', () {
    synthesizer.press(GamepadNavKey.down);
    synthesizer.repeat(GamepadNavKey.down);
    synthesizer.repeat(GamepadNavKey.down);
    synthesizer.release(GamepadNavKey.down);

    expect(seen.map((e) => e.runtimeType).toList(), <Type>[
      KeyDownEvent,
      KeyRepeatEvent,
      KeyRepeatEvent,
      KeyUpEvent,
    ]);
    // Screens that act on a held key look for KeyRepeatEvent, so without this
    // a held direction would fire once and then go quiet.
  });

  test('pressing an already-held key repeats rather than double-downing', () {
    synthesizer.press(GamepadNavKey.left);
    synthesizer.press(GamepadNavKey.left);

    expect(seen.map((e) => e.runtimeType).toList(), <Type>[
      KeyDownEvent,
      KeyRepeatEvent,
    ]);
  });

  test('releasing a key that isn\'t held emits nothing', () {
    synthesizer.release(GamepadNavKey.right);
    expect(seen, isEmpty);
  });

  test('releaseAll clears every held key', () {
    synthesizer
      ..press(GamepadNavKey.up)
      ..press(GamepadNavKey.select);
    seen.clear();

    synthesizer.releaseAll();

    expect(seen.length, 2);
    expect(seen.every((e) => e is KeyUpEvent), isTrue);
    expect(synthesizer.pressedKeys, isEmpty);
  });

  test('synthetic physical keys never collide with real keyboard keys', () {
    // HardwareKeyboard tracks pressed keys by physical key, so sharing a usage
    // with a real one would corrupt its bookkeeping.
    synthesizer.press(GamepadNavKey.up);
    final physical = seen.single.physicalKey;

    expect(GamepadKeySynthesizer.isSynthetic(physical), isTrue);
    expect(
      PhysicalKeyboardKey.knownPhysicalKeys.map((k) => k.usbHidUsage),
      isNot(contains(physical.usbHidUsage)),
    );
    expect(
      GamepadKeySynthesizer.isSynthetic(PhysicalKeyboardKey.arrowUp),
      isFalse,
    );
  });

  test('remote taps have their own identity and always release', () {
    final remote = GamepadKeySynthesizer.remote();
    synthesizer.press(GamepadNavKey.select);
    final heldPadKey = seen.single.physicalKey;
    seen.clear();
    consume = true;
    expect(remote.tap(GamepadNavKey.select), isTrue);
    expect(seen.map((e) => e.runtimeType), [KeyDownEvent, KeyUpEvent]);
    expect(
      seen.every((e) => GamepadKeySynthesizer.isRemote(e.physicalKey)),
      isTrue,
    );
    expect(seen.first.physicalKey, isNot(heldPadKey));
    expect(remote.pressedKeys, isEmpty);
    expect(HardwareKeyboard.instance.physicalKeysPressed, contains(heldPadKey));
    expect(
      HardwareKeyboard.instance.physicalKeysPressed,
      isNot(contains(seen.first.physicalKey)),
    );
  });

  test('a tap handled on release does not need a fallback activation', () {
    final previous = ServicesBinding.instance.keyEventManager.keyMessageHandler;
    ServicesBinding.instance.keyEventManager.keyMessageHandler = (message) =>
        message.events.any((event) => event is KeyUpEvent);
    addTearDown(
      () =>
          ServicesBinding.instance.keyEventManager.keyMessageHandler = previous,
    );
    final remote = GamepadKeySynthesizer.remote();
    expect(remote.tap(GamepadNavKey.select), isTrue);
    expect(remote.pressedKeys, isEmpty);
  });

  test('doesn\'t reach the focus tree when a global handler consumed it', () {
    // Flutter only dispatches to focused widgets when no HardwareKeyboard
    // handler claimed the event, and we have to mirror that.
    final focusTreeSaw = <KeyEvent>[];
    final previous = ServicesBinding.instance.keyEventManager.keyMessageHandler;
    ServicesBinding.instance.keyEventManager.keyMessageHandler = (message) {
      focusTreeSaw.addAll(message.events);
      return true;
    };
    addTearDown(
      () =>
          ServicesBinding.instance.keyEventManager.keyMessageHandler = previous,
    );

    consume = true;
    synthesizer.press(GamepadNavKey.back);
    expect(focusTreeSaw, isEmpty);

    synthesizer.release(GamepadNavKey.back);
    consume = false;
    synthesizer.press(GamepadNavKey.back);
    expect(focusTreeSaw, hasLength(1));
  });
}
