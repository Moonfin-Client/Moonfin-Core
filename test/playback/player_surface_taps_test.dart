import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/player_surface_taps.dart';

void main() {
  late PlayerSurfaceTaps taps;
  late int singles;
  late List<Offset> doubles;
  late int presses;
  late int twoFingerTaps;

  setUp(() {
    singles = 0;
    doubles = [];
    presses = 0;
    twoFingerTaps = 0;
    taps = PlayerSurfaceTaps(
      onSingleTap: () => singles++,
      onDoubleTap: doubles.add,
      onTwoFingerTap: () => twoFingerTaps++,
    );
  });

  tearDown(() => taps.cancel());

  // Wired like the player: the surface's tap detector over a Listener that
  // sees every pointer, with a control inside both.
  Future<void> pumpSurface(WidgetTester tester) {
    return tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapUp: taps.tapUp,
          child: Listener(
            onPointerDown: taps.pointerDown,
            onPointerUp: taps.pointerUp,
            onPointerCancel: taps.pointerUp,
            child: Stack(
              children: [
                const Positioned.fill(
                  child: ColoredBox(color: Color(0xFF000000)),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  width: 48,
                  height: 48,
                  child: GestureDetector(
                    key: const ValueKey('control'),
                    onTap: () => presses++,
                    child: const ColoredBox(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Issue #1804: a control under the surface fired only once the double-tap
  // timeout ran out.
  testWidgets('a control answers its tap without the double-tap wait', (
    tester,
  ) async {
    await pumpSurface(tester);

    await tester.tap(find.byKey(const ValueKey('control')));
    await tester.pump();
    expect(presses, 1);

    await tester.pump(kDoubleTapTimeout);
    expect(singles, 0);
    expect(doubles, isEmpty);
  });

  testWidgets('a lone surface tap is a single tap once the timeout passes', (
    tester,
  ) async {
    await pumpSurface(tester);

    await tester.tapAt(const Offset(400, 300));
    await tester.pump(kDoubleTapTimeout - const Duration(milliseconds: 50));
    expect(singles, 0);

    await tester.pump(const Duration(milliseconds: 50));
    expect(singles, 1);
    expect(doubles, isEmpty);
  });

  testWidgets('two quick surface taps make one double tap', (tester) async {
    await pumpSurface(tester);

    await tester.tapAt(const Offset(600, 300));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tapAt(const Offset(610, 300));
    await tester.pump();
    expect(doubles, [const Offset(610, 300)]);

    await tester.pump(const Duration(seconds: 1));
    expect(singles, 0);
  });

  testWidgets('a second press that starts in time can end after the timeout', (
    tester,
  ) async {
    await pumpSurface(tester);

    await tester.tapAt(const Offset(600, 300));
    await tester.pump(const Duration(milliseconds: 250));
    final second = await tester.startGesture(const Offset(600, 300));
    await tester.pump(const Duration(milliseconds: 200));
    expect(singles, 0);

    await second.up();
    await tester.pump();
    expect(doubles, hasLength(1));
    expect(singles, 0);
  });

  testWidgets('a far second tap leaves the first one a single tap', (
    tester,
  ) async {
    await pumpSurface(tester);

    await tester.tapAt(const Offset(150, 300));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tapAt(const Offset(650, 300));
    await tester.pump();
    expect(singles, 1);

    await tester.pump(kDoubleTapTimeout);
    expect(singles, 2);
    expect(doubles, isEmpty);
  });

  testWidgets('a control pressed right after a surface tap settles it', (
    tester,
  ) async {
    await pumpSurface(tester);

    await tester.tapAt(const Offset(90, 24));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tap(find.byKey(const ValueKey('control')));
    await tester.pump();
    expect(presses, 1);
    expect(singles, 1);
    expect(doubles, isEmpty);
  });

  testWidgets('cancel drops a tap that is still waiting', (tester) async {
    await pumpSurface(tester);

    await tester.tapAt(const Offset(400, 300));
    taps.cancel();
    await tester.pump(const Duration(seconds: 1));
    expect(singles, 0);
  });

  for (final secondLiftsFirst in [false, true]) {
    testWidgets(
      'a two-finger tap fires once and is not a single tap '
      '(second finger lifts first: $secondLiftsFirst)',
      (tester) async {
        await pumpSurface(tester);

        final first = await tester.startGesture(const Offset(300, 300));
        final second = await tester.startGesture(const Offset(500, 300));
        if (secondLiftsFirst) {
          await second.up();
          await first.up();
        } else {
          await first.up();
          await second.up();
        }
        await tester.pump();
        expect(twoFingerTaps, 1);

        await tester.pump(kDoubleTapTimeout);
        expect(singles, 0);
        expect(doubles, isEmpty);
      },
    );
  }

  testWidgets('two fingers that slide apart are not a tap', (tester) async {
    await pumpSurface(tester);

    final first = await tester.startGesture(const Offset(300, 300));
    final second = await tester.startGesture(const Offset(500, 300));
    await second.moveBy(const Offset(60, 0));
    await first.up();
    await second.up();
    await tester.pump(kDoubleTapTimeout);
    expect(twoFingerTaps, 0);
    expect(singles, 0);
  });

  testWidgets('two fingers held past the long-press timeout are not a tap', (
    tester,
  ) async {
    await pumpSurface(tester);

    final first = await tester.startGesture(const Offset(300, 300));
    final second = await tester.startGesture(const Offset(500, 300));
    const held = Duration(milliseconds: 600);
    await first.up(timeStamp: held);
    await second.up(timeStamp: held);
    await tester.pump(kDoubleTapTimeout);
    expect(twoFingerTaps, 0);
  });

  testWidgets('three fingers are not a two-finger tap', (tester) async {
    await pumpSurface(tester);

    final fingers = [
      for (final x in [200.0, 400.0, 600.0])
        await tester.startGesture(Offset(x, 300)),
    ];
    for (final finger in fingers) {
      await finger.up();
    }
    await tester.pump(kDoubleTapTimeout);
    expect(twoFingerTaps, 0);
  });

  testWidgets('a first finger on a control keeps the control its tap', (
    tester,
  ) async {
    await pumpSurface(tester);

    final first = await tester.startGesture(const Offset(24, 24));
    final second = await tester.startGesture(const Offset(400, 300));
    await first.up();
    await second.up();
    await tester.pump(kDoubleTapTimeout);
    expect(presses, 1);
    expect(twoFingerTaps, 0);
  });

  testWidgets('a two-finger tap settles a tap still waiting on a second one', (
    tester,
  ) async {
    await pumpSurface(tester);

    await tester.tapAt(const Offset(400, 300));
    await tester.pump(const Duration(milliseconds: 100));
    final first = await tester.startGesture(const Offset(400, 300));
    final second = await tester.startGesture(const Offset(600, 300));
    await first.up();
    await second.up();
    await tester.pump();
    expect(singles, 1);
    expect(twoFingerTaps, 1);
    expect(doubles, isEmpty);
  });
}
