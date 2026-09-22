import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tvos/flutter_tvos.dart'
    show TvRemoteTouchEvent, TvRemoteTouchPhase;
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/focus/siri_remote_glide.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final glide = SiriRemoteGlide.instance;
  final pressed = <LogicalKeyboardKey>[];
  bool capture(KeyEvent event) {
    if (event is KeyDownEvent) pressed.add(event.logicalKey);
    return true;
  }

  void touch(TvRemoteTouchPhase phase, double x, double y) {
    glide.debugHandleTouch(TvRemoteTouchEvent(phase: phase, x: x, y: y));
  }

  setUp(() {
    pressed.clear();
    // The step counts below are written against the high thresholds.
    glide.sensitivity = SiriRemoteSwipeSensitivity.high;
    HardwareKeyboard.instance.addHandler(capture);
  });

  tearDown(() {
    glide.debugReset();
    HardwareKeyboard.instance.removeHandler(capture);
  });

  test('medium is the default and lower sensitivity steps less per drag', () {
    expect(
      UserPreferences.siriRemoteSwipeSensitivity.defaultValue,
      SiriRemoteSwipeSensitivity.medium,
    );

    int stepsFor(SiriRemoteSwipeSensitivity sensitivity) {
      glide.sensitivity = sensitivity;
      pressed.clear();
      var x = -0.9;
      touch(TvRemoteTouchPhase.started, x, 0);
      // A full edge-to-edge slow drag.
      for (var i = 0; i < 18; i++) {
        x += 0.1;
        touch(TvRemoteTouchPhase.move, x, 0);
      }
      touch(TvRemoteTouchPhase.ended, x, 0);
      return pressed.length;
    }

    final high = stepsFor(SiriRemoteSwipeSensitivity.high);
    final medium = stepsFor(SiriRemoteSwipeSensitivity.medium);
    final low = stepsFor(SiriRemoteSwipeSensitivity.low);
    expect(high, 5);
    expect(medium, 3);
    expect(low, 2);
  });

  testWidgets('slow drag steps focus per distance and stops on release', (
    tester,
  ) async {
    touch(TvRemoteTouchPhase.started, -0.8, 0);
    var x = -0.8;
    // 16 moves of 0.1 each, crossing 1.6 units of travel: one step at 0.28
    // then one every 0.36, so four steps in total.
    for (var i = 0; i < 16; i++) {
      x += 0.1;
      touch(TvRemoteTouchPhase.move, x, 0);
    }
    expect(pressed, List.filled(4, LogicalKeyboardKey.arrowRight));

    touch(TvRemoteTouchPhase.ended, x, 0);
    await tester.pump(const Duration(seconds: 3));
    expect(pressed.length, 4, reason: 'a drag must not keep moving');
  });

  testWidgets('dragging toward positive y steps down', (tester) async {
    touch(TvRemoteTouchPhase.started, 0, -0.2);
    touch(TvRemoteTouchPhase.move, 0, 0.2);
    expect(pressed, [LogicalKeyboardKey.arrowDown]);
    touch(TvRemoteTouchPhase.ended, 0, 0.2);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('dragging toward negative y steps up', (tester) async {
    touch(TvRemoteTouchPhase.started, 0, 0.2);
    touch(TvRemoteTouchPhase.move, 0, -0.2);
    expect(pressed, [LogicalKeyboardKey.arrowUp]);
    touch(TvRemoteTouchPhase.ended, 0, -0.2);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('a fast flick does not auto scroll after release', (tester) async {
    touch(TvRemoteTouchPhase.started, -0.6, 0);
    var x = -0.6;
    for (var i = 0; i < 5; i++) {
      x += 0.15;
      touch(TvRemoteTouchPhase.move, x, 0);
    }
    final duringDrag = pressed.length;
    expect(duringDrag, greaterThan(0));

    touch(TvRemoteTouchPhase.ended, x, 0);
    await tester.pump(const Duration(seconds: 5));
    expect(pressed.length, duringDrag,
        reason: 'the finger lifting must end the gesture');
  });

  testWidgets('a flick travels the same distance as a slow drag', (
    tester,
  ) async {
    touch(TvRemoteTouchPhase.started, -0.8, 0);
    var slow = -0.8;
    for (var i = 0; i < 16; i++) {
      slow += 0.1;
      touch(TvRemoteTouchPhase.move, slow, 0);
    }
    touch(TvRemoteTouchPhase.ended, slow, 0);
    final slowSteps = pressed.length;

    pressed.clear();
    touch(TvRemoteTouchPhase.started, -0.8, 0);
    var fast = -0.8;
    // The same 1.6 units, delivered in four large moves instead of sixteen
    // small ones.
    for (var i = 0; i < 4; i++) {
      fast += 0.4;
      touch(TvRemoteTouchPhase.move, fast, 0);
    }
    touch(TvRemoteTouchPhase.ended, fast, 0);
    await tester.pump(const Duration(seconds: 3));

    expect(pressed.length, slowSteps,
        reason: 'travel decides the step count, not speed');
  });

  testWidgets('holding still after a swipe emits nothing more', (tester) async {
    touch(TvRemoteTouchPhase.started, -0.6, 0);
    var x = -0.6;
    for (var i = 0; i < 5; i++) {
      x += 0.15;
      touch(TvRemoteTouchPhase.move, x, 0);
    }
    final afterSwipe = pressed.length;

    // Finger resting on the pad: repeated moves that report the same point.
    for (var i = 0; i < 20; i++) {
      touch(TvRemoteTouchPhase.move, x, 0);
    }
    await tester.pump(const Duration(seconds: 3));
    expect(pressed.length, afterSwipe,
        reason: 'a held finger must not step focus');

    touch(TvRemoteTouchPhase.ended, x, 0);
    await tester.pump(const Duration(seconds: 3));
    expect(pressed.length, afterSwipe);
  });

  testWidgets('direction reversal mid drag responds immediately', (
    tester,
  ) async {
    touch(TvRemoteTouchPhase.started, 0.0, 0);
    touch(TvRemoteTouchPhase.move, 0.3, 0);
    expect(pressed, [LogicalKeyboardKey.arrowRight]);

    // Coming back shouldn't have to unwind the forward accumulator.
    touch(TvRemoteTouchPhase.move, 0.0, 0);
    touch(TvRemoteTouchPhase.move, -0.1, 0);
    expect(pressed.last, LogicalKeyboardKey.arrowLeft);
    touch(TvRemoteTouchPhase.ended, -0.1, 0);
    await tester.pump(const Duration(seconds: 3));
  });
}
