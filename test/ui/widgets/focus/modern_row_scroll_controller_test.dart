import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/modern_row_scroll_controller.dart';

const _duration = Duration(milliseconds: 220);

Future<ModernRowScrollController> _mount(WidgetTester tester) async {
  final controller = ModernRowScrollController();
  addTearDown(controller.dispose);
  await tester.pumpWidget(
    MaterialApp(
      home: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 600,
          height: 400,
          child: ListView.builder(
            controller: controller,
            itemExtent: 100,
            itemCount: 40,
            itemBuilder: (_, index) => Text('Row $index'),
          ),
        ),
      ),
    ),
  );
  return controller;
}

void main() {
  testWidgets('moves promptly and eases into place without a slow wind-up', (
    tester,
  ) async {
    final controller = await _mount(tester);
    final move = controller.animateToRow(1000, duration: _duration);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 16));
    expect(controller.offset, inExclusiveRange(190, 210));
    await tester.pump(const Duration(milliseconds: 94));
    expect(controller.offset, closeTo(875, 0.001));
    await tester.pump(const Duration(milliseconds: 94));
    expect(controller.offset, inExclusiveRange(990, 1000));
    await tester.pump(const Duration(milliseconds: 17));
    await move;
    expect(controller.offset, 1000);
    expect(controller.position.isScrollingNotifier.value, isFalse);
  });

  for (final target in [2000.0, 0.0]) {
    testWidgets(
      'retargeting to $target preserves position and follows direction',
      (tester) async {
        final controller = await _mount(tester);
        controller.jumpTo(400);
        final first = controller.animateToRow(1400, duration: _duration);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 79));
        final before = controller.offset;
        await tester.pump(const Duration(milliseconds: 1));
        final atRetarget = controller.offset;
        final incomingStep = atRetarget - before;
        final second = controller.animateToRow(target, duration: _duration);
        await first;
        await tester.pump();
        expect(controller.offset, closeTo(atRetarget, 0.001));
        await tester.pump(const Duration(milliseconds: 1));
        final outgoingStep = controller.offset - atRetarget;
        expect(incomingStep, greaterThan(0));
        if (target > atRetarget) {
          expect(outgoingStep, closeTo(incomingStep, incomingStep * 0.02));
        } else {
          expect(outgoingStep, lessThan(0));
        }
        await tester.pumpAndSettle();
        await second;
        expect(controller.offset, target);
      },
    );
  }

  testWidgets('a reversal near the boundary still reaches its destination', (
    tester,
  ) async {
    final controller = await _mount(tester);
    controller.jumpTo(3000);
    final first = controller.animateToRow(3600, duration: _duration);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 160));
    final second = controller.animateToRow(3000, duration: _duration);
    await first;
    await tester.pump();
    var previous = controller.offset;
    for (var frame = 0; frame < 16; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
      expect(controller.offset, inInclusiveRange(3000, previous));
      previous = controller.offset;
    }
    await second;
    expect(controller.offset, 3000);
  });

  testWidgets('a nearer target never overshoots then comes back', (
    tester,
  ) async {
    final controller = await _mount(tester);
    final first = controller.animateToRow(1000, duration: _duration);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 40));
    var previous = controller.offset;
    final target = previous + 20;
    final second = controller.animateToRow(target, duration: _duration);
    await first;
    await tester.pump();
    for (var frame = 0; frame < 16; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
      expect(controller.offset, inInclusiveRange(previous, target));
      previous = controller.offset;
    }
    await second;
    expect(controller.offset, target);
  });

  testWidgets('disabled motion and cancellation finish pending handoffs', (
    tester,
  ) async {
    final controller = await _mount(tester);
    await controller.animateToRow(1000, duration: Duration.zero);
    expect(controller.offset, 1000);
    final move = controller.animateToRow(2000, duration: _duration);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 80));
    final stoppedAt = controller.offset;
    controller.jumpTo(stoppedAt);
    await move;
    await tester.pump(const Duration(milliseconds: 300));
    expect(controller.offset, stoppedAt);
  });

  testWidgets('ordinary animateTo retains its requested curve', (tester) async {
    final controller = await _mount(tester);
    final move = controller.animateTo(
      1000,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(controller.offset, closeTo(250, 0.001));
    await tester.pumpAndSettle();
    await move;
    expect(controller.offset, 1000);
  });
}
