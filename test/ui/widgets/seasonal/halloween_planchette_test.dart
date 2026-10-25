import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/seasonal/halloween_planchette.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_effects.dart';

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
              LockedFocusRow<int>(
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
    final follower = painter.planchette as HalloweenPlanchette;
    expect(follower.position, isNotNull);
    expect(follower.opacity, greaterThan(0));
    expect(follower.position!.dy, closeTo(60, 0.1));
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

  test('glides toward the latest focus and rests its tip at the center', () {
    final planchette = HalloweenPlanchette();
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
    expect(planchette.position!.dx, closeTo(next.center.dx + 34, 0.1));
    expect(math.sin(planchette.angle), closeTo(-1, 0.01));
  });

  for (final fps in [30, 60]) {
    test(
      'turns continuously through travel, reversal and arrival at $fps fps',
      () {
        final planchette = HalloweenPlanchette();
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
          expect(math.sin(planchette.angle), closeTo(-1, 0.01));
        }
      },
    );
  }

  for (final fps in [30, 60]) {
    test('aims at top navigation before lateral travel stops at $fps fps', () {
      final planchette = HalloweenPlanchette();
      const size = Size(960, 540);
      final dt = 1 / fps;
      const first = Rect.fromLTWH(600, 20, 100, 50);
      const next = Rect.fromLTWH(100, 20, 100, 50);
      const panel = Rect.fromLTWH(0, 0, 960, 95);
      planchette.step(
        dt,
        first,
        size,
        landing: PlanchetteLanding.below,
        navigationBounds: panel,
      );
      var checkedApproach = false;
      for (var i = 0; i < fps * 6; i++) {
        final before = planchette.position!;
        planchette.step(
          dt,
          next,
          size,
          landing: PlanchetteLanding.below,
          navigationBounds: panel,
        );
        final remaining =
            (planchette.position! - const Offset(150, 143)).distance;
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
    'rests outside top and side navigation, using the whole panel bounds',
    () {
      const size = Size(960, 540);
      final top = HalloweenPlanchette();
      top.step(
        0.03,
        const Rect.fromLTWH(100, 20, 120, 48),
        size,
        landing: PlanchetteLanding.below,
        navigationBounds: const Rect.fromLTWH(0, 0, 960, 95),
      );
      expect(top.position!.dx, 160);
      expect(top.position!.dy - 38, greaterThan(95));
      final side = HalloweenPlanchette();
      side.step(
        0.03,
        const Rect.fromLTWH(20, 80, 40, 48),
        size,
        landing: PlanchetteLanding.right,
        navigationBounds: const Rect.fromLTWH(0, 0, 280, 540),
      );
      expect(side.position!.dx - 38, greaterThan(280));
      expect(side.position!.dy, 104);
    },
  );

  test('stays on screen and fades out when focus disappears', () {
    final planchette = HalloweenPlanchette();
    const size = Size(960, 540);
    for (var i = 0; i < 40; i++) {
      planchette.step(0.03, const Rect.fromLTWH(850, 470, 100, 60), size);
    }
    expect(planchette.position!.dx, lessThanOrEqualTo(914));
    expect(planchette.position!.dy, lessThanOrEqualTo(494));
    expect(planchette.opacity, 1);
    for (var i = 0; i < 40; i++) {
      planchette.step(0.03, null, size);
    }
    expect(planchette.opacity, 0);
  });
}
