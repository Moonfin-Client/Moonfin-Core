import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_follower.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_effects.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_simulation.dart';

void main() {
  testWidgets('tracks the selected card when Home keeps focus on a wide row', (
    tester,
  ) async {
    final rowNode = FocusNode();
    addTearDown(rowNode.dispose);
    final rowKey = GlobalKey<LockedFocusRowState<int>>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 100),
                child: LockedFocusRow<int>(
                  key: rowKey,
                  focusNode: rowNode,
                  items: const [0, 1, 2],
                  hubKey: 'halloween-regression',
                  itemExtent: 120,
                  height: 200,
                  itemBuilder: (_, item, index, focused) => SizedBox(
                    width: 120,
                    child: Column(
                      children: [
                        AspectRatio(aspectRatio: 1, child: Text('Card $item')),
                        const SizedBox(height: 30, child: Text('Title')),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned.fill(
                child: SeasonalEffectsHost(
                  effect: 'halloween',
                  density: 'light',
                  followFocus: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    rowNode.requestFocus();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    final dynamic painter = tester
        .widget<CustomPaint>(
          find.descendant(
            of: find.byType(SeasonalEffectsLayer),
            matching: find.byType(CustomPaint),
          ),
        )
        .painter;
    final follower = (painter.followers as List<SeasonalFollower>).single;
    expect(follower.position, isNotNull);
    expect(follower.opacity, greaterThan(0));
    // The artwork's left edge is at 100 and its middle at 160, and the tip
    // reaches 4 into it.
    expect(follower.position!.dx, closeTo(80, 0.1));
    expect(follower.position!.dy, closeTo(160, 0.1));
    final firstPosition = follower.position!;
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 33));
    }
    expect(rowKey.currentState!.focusedIndex, 1);
    expect(rowNode.hasPrimaryFocus, isTrue);
    expect(follower.position!.dx, greaterThan(firstPosition.dx));
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('Halloween follower leaves directional focus with the cards', (
    tester,
  ) async {
    final first = FocusNode();
    final second = FocusNode();
    addTearDown(first.dispose);
    addTearDown(second.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              Row(
                children: [
                  TextButton(
                    focusNode: first,
                    onPressed: () {},
                    child: const Text('One'),
                  ),
                  TextButton(
                    focusNode: second,
                    onPressed: () {},
                    child: const Text('Two'),
                  ),
                ],
              ),
              const Positioned.fill(
                child: SeasonalEffectsHost(
                  effect: 'halloween',
                  density: 'light',
                  followFocus: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    first.requestFocus();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(second.hasPrimaryFocus, isTrue);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('fades out while focus is in a sheet over Home', (tester) async {
    final button = FocusNode();
    addTearDown(button.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              Center(
                child: TextButton(
                  focusNode: button,
                  onPressed: () {},
                  child: const Text('Card'),
                ),
              ),
              const Positioned.fill(
                child: SeasonalEffectsHost(
                  effect: 'halloween',
                  density: 'light',
                  followFocus: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    Future<void> settle() async {
      for (var i = 0; i < 40; i++) {
        await tester.pump(const Duration(milliseconds: 33));
      }
    }

    button.requestFocus();
    await settle();
    final dynamic painter = tester
        .widget<CustomPaint>(
          find.descendant(
            of: find.byType(SeasonalEffectsLayer),
            matching: find.byType(CustomPaint),
          ),
        )
        .painter;
    final follower = (painter.followers as List<SeasonalFollower>).single;
    expect(follower.opacity, 1);

    // Like OverlaySheet, an entry on the root overlay rather than a route, so
    // Home's route stays current underneath it.
    final sheetButton = FocusNode();
    addTearDown(sheetButton.dispose);
    final sheet = OverlayEntry(
      builder: (_) => Align(
        alignment: Alignment.bottomCenter,
        child: TextButton(
          focusNode: sheetButton,
          onPressed: () {},
          child: const Text('Sheet'),
        ),
      ),
    );
    Overlay.of(tester.element(find.text('Card')), rootOverlay: true)
        .insert(sheet);
    await tester.pump();
    sheetButton.requestFocus();
    await settle();
    expect(button.hasPrimaryFocus, isFalse);
    expect(follower.opacity, 0);
    sheet.remove();
    await tester.pumpWidget(const SizedBox.shrink());
  });

  test('glides toward the latest focus and rests its tip on the left edge', () {
    final planchette = SeasonalFollower(FollowerStyle.planchette);
    const size = Size(960, 540);
    planchette.step(0.03, const Rect.fromLTWH(100, 100, 100, 150), size);
    final start = planchette.position!;
    const next = Rect.fromLTWH(500, 100, 100, 150);
    planchette.step(0.03, next, size);
    expect(planchette.position!.dx, greaterThan(start.dx));
    expect(planchette.position!.dx, lessThan(next.right));
    for (var i = 0; i < 200; i++) {
      planchette.step(0.03, next, size);
    }
    expect(planchette.position!.dx, closeTo(next.left - 20, 0.1));
    expect(planchette.position!.dy, closeTo(next.center.dy, 0.1));
    expect(math.sin(planchette.angle), closeTo(1, 0.01));
  });

  for (final fps in [30, 60]) {
    test(
      'turns continuously through travel, reversal and arrival at $fps fps',
      () {
        final planchette = SeasonalFollower(FollowerStyle.planchette);
        const size = Size(960, 540);
        final dt = 1 / fps;
        planchette.step(dt, const Rect.fromLTWH(100, 100, 100, 100), size);
        for (final target in [
          const Rect.fromLTWH(100, 350, 100, 100),
          const Rect.fromLTWH(500, 100, 100, 100),
          const Rect.fromLTWH(100, 100, 100, 100),
        ]) {
          // Include arrival so a change from travel heading to resting aim cannot snap.
          for (var i = 0; i < fps * 6; i++) {
            final before = planchette.angle;
            planchette.step(dt, target, size);
            expect((planchette.angle - before).abs(), lessThan(6 / fps));
          }
          expect(math.sin(planchette.angle), closeTo(1, 0.01));
        }
      },
    );
  }

  for (final fps in [30, 60]) {
    test('aims at top navigation before lateral travel stops at $fps fps', () {
      final planchette = SeasonalFollower(FollowerStyle.planchette);
      const size = Size(960, 540);
      final dt = 1 / fps;
      const first = Rect.fromLTWH(600, 20, 100, 50);
      const next = Rect.fromLTWH(100, 20, 100, 50);
      planchette.step(dt, first, size, landing: FollowerLanding.below);
      var checkedApproach = false;
      for (var i = 0; i < fps * 6; i++) {
        final before = planchette.position!;
        planchette.step(dt, next, size, landing: FollowerLanding.below);
        final remaining =
            (planchette.position! - const Offset(150, 100)).distance;
        final speed = (planchette.position! - before).distance / dt;
        if (!checkedApproach && remaining < 5 && speed > 5) {
          // It should already face up while approaching, not wait at the
          // destination pointing sideways until the movement tail dies away.
          expect(math.cos(planchette.angle), greaterThan(0.9));
          checkedApproach = true;
        }
      }
      expect(checkedApproach, isTrue);
      expect(math.cos(planchette.angle), closeTo(1, 0.01));
    });
  }

  test(
    'rests just under a top bar button and outside the whole side panel',
    () {
      const size = Size(960, 540);
      final top = SeasonalFollower(FollowerStyle.planchette);
      top.step(
        0.03,
        const Rect.fromLTWH(100, 20, 120, 48),
        size,
        landing: FollowerLanding.below,
      );
      // The tip, 24 above the center, sits 6 under the button.
      expect(top.position!.dx, 160);
      expect(top.position!.dy, 98);
      final side = SeasonalFollower(FollowerStyle.planchette);
      side.step(
        0.03,
        const Rect.fromLTWH(20, 80, 40, 48),
        size,
        landing: FollowerLanding.right,
        navigationBounds: const Rect.fromLTWH(0, 0, 280, 540),
      );
      expect(side.position!.dx - 38, greaterThan(280));
      expect(side.position!.dy, 104);
    },
  );

  test('stays on screen and fades out when focus disappears', () {
    final planchette = SeasonalFollower(FollowerStyle.planchette);
    const size = Size(960, 540);
    for (var i = 0; i < 40; i++) {
      planchette.step(0.03, const Rect.fromLTWH(0, 490, 100, 60), size);
    }
    expect(planchette.position!.dx, greaterThanOrEqualTo(28));
    expect(planchette.position!.dy, lessThanOrEqualTo(512));
    expect(planchette.opacity, 1);
    for (var i = 0; i < 40; i++) {
      planchette.step(0.03, null, size);
    }
    expect(planchette.opacity, 0);
  });

  testWidgets('takes the mouse pointer\'s place in the desktop layout', (tester) async {
    Widget pointer(String effect) => MaterialApp(
      home: SeasonalPointer(
        effect: effect,
        enabled: true,
        child: const SizedBox.expand(),
      ),
    );
    MouseCursor? cursor() =>
        RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1);
    final mouse = await tester.createGesture(
      kind: PointerDeviceKind.mouse,
      pointer: 1,
    );
    addTearDown(mouse.removePointer);
    await mouse.addPointer(location: const Offset(400, 300));

    // Snow has nothing to follow, so the system pointer stays.
    await tester.pumpWidget(pointer('snow'));
    await mouse.moveTo(const Offset(410, 300));
    await tester.pump();
    expect(cursor(), SystemMouseCursors.basic);

    // It shows under a pointer that hasn't moved since Home appeared.
    await tester.pumpWidget(pointer('halloween'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 16));
    expect(cursor(), SystemMouseCursors.none);
    final dynamic painter = tester
        .widget<CustomPaint>(find.byWidgetPredicate((w) => w is CustomPaint && w.painter != null))
        .painter;
    final planchette = (painter.followers as List<SeasonalFollower>).single;
    expect(planchette.opacity, 1);

    await mouse.moveTo(const Offset(300, 200));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 16));
    // The tip, 46% of the drawing up from its center, sits on the pointer.
    final tip = planchette.position! +
        Offset(math.sin(planchette.angle), -math.cos(planchette.angle)) *
            (FollowerStyle.planchette.extent * 0.46);
    expect(tip.dx, closeTo(300, 0.01));
    expect(tip.dy, closeTo(200, 0.01));

    await mouse.moveTo(const Offset(-10, -10));
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }
    expect(planchette.opacity, 0);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('Easter brings only its egg to the pointer', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SeasonalPointer(
          effect: 'easter',
          enabled: true,
          child: SizedBox.expand(),
        ),
      ),
    );
    final dynamic painter = tester
        .widget<CustomPaint>(find.byWidgetPredicate((w) => w is CustomPaint && w.painter != null))
        .painter;
    expect(
      [for (final follower in painter.followers as List<SeasonalFollower>) follower.style],
      [FollowerStyle.easterEgg],
    );
    await tester.pumpWidget(const SizedBox.shrink());
  });

  test('each holiday effect brings its own followers', () {
    expect(FollowerStyle.forEffect(SeasonalEffect.halloween), [FollowerStyle.planchette]);
    expect(FollowerStyle.forEffect(SeasonalEffect.valentines), [FollowerStyle.cupidArrow]);
    expect(FollowerStyle.forEffect(SeasonalEffect.fireworks), [FollowerStyle.sparkler]);
    expect(FollowerStyle.forEffect(SeasonalEffect.christmas), [FollowerStyle.sleigh]);
    expect(FollowerStyle.forEffect(SeasonalEffect.easter), [FollowerStyle.bunnyEars, FollowerStyle.easterEgg]);
    expect(FollowerStyle.forEffect(SeasonalEffect.lunar), [FollowerStyle.lantern]);
    expect(FollowerStyle.forEffect(SeasonalEffect.diwali), [FollowerStyle.diya]);
    expect(FollowerStyle.forEffect(SeasonalEffect.pride), [FollowerStyle.rainbow]);
    for (final effect in [
      SeasonalEffect.snow,
      SeasonalEffect.confetti,
      SeasonalEffect.leaves,
      SeasonalEffect.petals,
      SeasonalEffect.fireflies,
    ]) {
      expect(FollowerStyle.forEffect(effect), isEmpty, reason: effect.name);
    }
  });

  testWidgets('the effects layer brings the followers for its effect', (tester) async {
    for (final (effect, styles) in [
      ('pride', [FollowerStyle.rainbow]),
      ('easter', [FollowerStyle.bunnyEars, FollowerStyle.easterEgg]),
      ('snow', <FollowerStyle>[]),
    ]) {
      await tester.pumpWidget(
        MaterialApp(
          home: SeasonalEffectsHost(effect: effect, density: 'light', followFocus: true),
        ),
      );
      final dynamic painter = tester
          .widget<CustomPaint>(
            find.descendant(
              of: find.byType(SeasonalEffectsLayer),
              matching: find.byType(CustomPaint),
            ),
          )
          .painter;
      expect(
        [for (final follower in painter.followers as List<SeasonalFollower>) follower.style],
        styles,
        reason: effect,
      );
    }
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('every follower draws and paints', (tester) async {
    for (final style in FollowerStyle.values) {
      final follower = SeasonalFollower(style)..rasterize(2);
      final landing = style.onlyOnNav ? FollowerLanding.below : FollowerLanding.card;
      for (var i = 0; i < 30; i++) {
        follower.step(
          0.03,
          const Rect.fromLTWH(200, 200, 150, 220),
          const Size(960, 540),
          landing: landing,
        );
      }
      final recorder = ui.PictureRecorder();
      follower.paint(Canvas(recorder));
      recorder.endRecording().dispose();
      follower.dispose();
      expect(follower.opacity, greaterThan(0), reason: style.name);
    }
  });

  test('the sleigh faces its card from the left and turns around for the sidebar', () {
    const size = Size(960, 540);
    final sleigh = SeasonalFollower(FollowerStyle.sleigh);
    const card = Rect.fromLTWH(200, 200, 150, 220);
    for (var i = 0; i < 200; i++) {
      sleigh.step(0.03, card, size);
    }
    expect(sleigh.position!.dx, closeTo(card.left + 6 - 32, 0.1));
    expect(sleigh.position!.dy, closeTo(card.center.dy, 0.1));
    expect(sleigh.angle.abs(), lessThan(0.01));

    const item = Rect.fromLTWH(20, 140, 200, 44);
    const panel = Rect.fromLTWH(0, 0, 280, 540);
    var climbed = false;
    for (var i = 0; i < 200; i++) {
      sleigh.step(0.03, item, size, landing: FollowerLanding.right, navigationBounds: panel);
      if (sleigh.angle.abs() > 0.05) climbed = true;
    }
    expect(climbed, isTrue, reason: 'it tips its nose on the way up');
    expect(sleigh.position!.dx, closeTo(panel.right + 8 + 32, 0.1));
    expect(sleigh.angle.abs(), lessThan(0.01));
  });

  test('Easter hands over from the ears on a card to the egg on the nav', () {
    const size = Size(960, 540);
    final ears = SeasonalFollower(FollowerStyle.bunnyEars);
    final egg = SeasonalFollower(FollowerStyle.easterEgg);
    void stepBoth(Rect focus, FollowerLanding landing) {
      for (var i = 0; i < 40; i++) {
        ears.step(0.03, focus, size, landing: landing);
        egg.step(0.03, focus, size, landing: landing);
      }
    }

    const card = Rect.fromLTWH(200, 200, 150, 220);
    stepBoth(card, FollowerLanding.card);
    expect(ears.opacity, 1);
    expect(egg.opacity, 0);
    expect(ears.position, Offset(card.right - 40, card.top));

    const button = Rect.fromLTWH(100, 24, 120, 42);
    stepBoth(button, FollowerLanding.below);
    expect(ears.opacity, 0);
    expect(egg.opacity, 1);
    expect(egg.position!.dx, closeTo(button.center.dx, 0.1));
  });

  test('the lantern hangs beside the card, swings when it moves, then settles', () {
    const size = Size(960, 540);
    final lantern = SeasonalFollower(FollowerStyle.lantern);
    const first = Rect.fromLTWH(100, 200, 150, 220);
    const next = Rect.fromLTWH(500, 200, 150, 220);
    lantern.step(0.03, first, size);
    expect(lantern.position, Offset(first.left - 24, first.top + 2));
    var widest = 0.0;
    for (var i = 0; i < 40; i++) {
      lantern.step(0.03, next, size);
      widest = math.max(widest, lantern.angle.abs());
    }
    expect(widest, greaterThan(0.05));
    for (var i = 0; i < 600; i++) {
      lantern.step(0.03, next, size);
    }
    expect(lantern.position!.dx, closeTo(next.left - 24, 0.1));
    expect(lantern.angle.abs(), lessThan(0.01));
  });

  test('the diya rests on the bottom edge of the card, to its left', () {
    const size = Size(960, 540);
    final diya = SeasonalFollower(FollowerStyle.diya);
    const card = Rect.fromLTWH(100, 200, 150, 220);
    for (var i = 0; i < 100; i++) {
      diya.step(0.03, card, size);
    }
    expect(diya.position, Offset(card.left - 26, card.bottom));
  });

  test('the rainbow underlines the card and stretches to its width', () {
    const size = Size(960, 540);
    final rainbow = SeasonalFollower(FollowerStyle.rainbow);
    rainbow.step(0.03, const Rect.fromLTWH(100, 200, 100, 150), size);
    expect(rainbow.width, 100);
    const wide = Rect.fromLTWH(300, 200, 300, 150);
    for (var i = 0; i < 200; i++) {
      rainbow.step(0.03, wide, size);
    }
    expect(rainbow.width, closeTo(wide.width, 0.5));
    expect(rainbow.position!.dx, closeTo(wide.center.dx, 0.1));
    expect(rainbow.position!.dy, closeTo(wide.bottom + 6, 0.1));
  });
}
