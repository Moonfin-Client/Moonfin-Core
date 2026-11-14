import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/macos_touch_input.dart';

void main() {
  final macOS = TargetPlatformVariant.only(TargetPlatform.macOS);

  tearDown(MacosTouchInput.reset);

  Future<void> send(List<List<Object?>> touches) =>
      MacosTouchInput.handleMessage(touches);

  List<Object?> touch(
    String phase,
    double x,
    double y,
    double seconds, {
    int slot = 0,
  }) => [phase, slot, x, y, seconds];

  /// Drags one finger in a straight line, a step every 8 ms.
  Future<double> drag(
    WidgetTester tester, {
    required Offset from,
    required Offset by,
    double start = 1.0,
    int steps = 10,
  }) async {
    var seconds = start;
    await send([touch('down', from.dx, from.dy, seconds)]);
    for (var i = 1; i <= steps; i++) {
      seconds += 0.008;
      final at = from + by * (i / steps);
      await send([touch('move', at.dx, at.dy, seconds)]);
      await tester.pump(const Duration(milliseconds: 8));
    }
    return seconds;
  }

  Future<ScrollController> pumpList(WidgetTester tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: ListView.builder(
          controller: controller,
          itemExtent: 100,
          itemCount: 200,
          itemBuilder: (context, index) => Text('row $index'),
        ),
      ),
    );
    return controller;
  }

  Future<void> pumpDetector(
    WidgetTester tester, {
    GestureTapDownCallback? onTapDown,
    VoidCallback? onTap,
    VoidCallback? onTapCancel,
    VoidCallback? onLongPress,
  }) => tester.pumpWidget(
    MaterialApp(
      home: GestureDetector(
        onTapDown: onTapDown,
        onTap: onTap,
        onTapCancel: onTapCancel,
        onLongPress: onLongPress,
        child: const ColoredBox(color: Colors.blue, child: SizedBox.expand()),
      ),
    ),
  );

  List<PointerEvent> recordPointerEvents() {
    final seen = <PointerEvent>[];
    void record(PointerEvent event) => seen.add(event);
    GestureBinding.instance.pointerRouter.addGlobalRoute(record);
    addTearDown(
      () => GestureBinding.instance.pointerRouter.removeGlobalRoute(record),
    );
    return seen;
  }

  testWidgets('a tap presses on the way down and taps once on the way up', (
    tester,
  ) async {
    final log = <String>[];
    await pumpDetector(
      tester,
      onTapDown: (_) => log.add('down'),
      onTap: () => log.add('tap'),
    );

    await send([touch('down', 400, 300, 1.0)]);
    await tester.pump(const Duration(milliseconds: 150));
    expect(log, ['down']);

    await send([touch('up', 400, 300, 1.15)]);
    await tester.pump();
    expect(log, ['down', 'tap']);
  }, variant: macOS);

  testWidgets('a held finger is a long press', (tester) async {
    var pressed = 0;
    await pumpDetector(tester, onLongPress: () => pressed++);

    await send([touch('down', 400, 300, 1.0)]);
    await tester.pump(const Duration(milliseconds: 600));
    expect(pressed, 1);

    await send([touch('up', 400, 300, 1.6)]);
    await tester.pump();
  }, variant: macOS);

  testWidgets('a drag scrolls the list and a quick lift flings it', (
    tester,
  ) async {
    final controller = await pumpList(tester);

    final seconds = await drag(
      tester,
      from: const Offset(400, 400),
      by: const Offset(0, -300),
    );
    final dragged = controller.offset;
    expect(dragged, greaterThan(200));

    await send([touch('up', 400, 100, seconds)]);
    await tester.pumpAndSettle();
    expect(controller.offset, greaterThan(dragged + 100));
  }, variant: macOS);

  testWidgets('a finger that rests before lifting does not fling', (
    tester,
  ) async {
    final controller = await pumpList(tester);

    final seconds = await drag(
      tester,
      from: const Offset(400, 400),
      by: const Offset(0, -300),
    );
    await tester.pump(const Duration(milliseconds: 300));
    final rested = controller.offset;

    await send([touch('up', 400, 100, seconds + 0.3)]);
    await tester.pumpAndSettle();
    expect(controller.offset, moreOrLessEquals(rested, epsilon: 1));
  }, variant: macOS);

  testWidgets('a sideways drag moves the row and leaves the page', (
    tester,
  ) async {
    final page = ScrollController();
    final row = ScrollController();
    addTearDown(page.dispose);
    addTearDown(row.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: ListView(
          controller: page,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                controller: row,
                scrollDirection: Axis.horizontal,
                itemExtent: 150,
                itemCount: 100,
                itemBuilder: (context, index) => Text('card $index'),
              ),
            ),
            const SizedBox(height: 3000),
          ],
        ),
      ),
    );

    final seconds = await drag(
      tester,
      from: const Offset(500, 100),
      by: const Offset(-300, 0),
    );
    await tester.pump(const Duration(milliseconds: 300));
    await send([touch('up', 200, 100, seconds + 0.3)]);
    await tester.pumpAndSettle();

    expect(row.offset, greaterThan(200));
    expect(page.offset, 0);
  }, variant: macOS);

  testWidgets('a slider thumb follows the finger', (tester) async {
    var value = 0.0;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: StatefulBuilder(
            builder: (context, setState) => Slider(
              value: value,
              onChanged: (next) => setState(() => value = next),
            ),
          ),
        ),
      ),
    );

    final thumb = tester.getTopLeft(find.byType(Slider)) + const Offset(24, 24);
    final seconds = await drag(tester, from: thumb, by: const Offset(400, 0));
    await send([touch('up', thumb.dx + 400, thumb.dy, seconds)]);
    await tester.pump();

    expect(value, greaterThan(0.3));
  }, variant: macOS);

  testWidgets('two fingers moving apart zoom', (tester) async {
    final transform = TransformationController();
    addTearDown(transform.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: InteractiveViewer(
          transformationController: transform,
          maxScale: 5,
          child: const ColoredBox(color: Colors.blue, child: SizedBox.expand()),
        ),
      ),
    );

    await send([
      touch('down', 350, 300, 1.0),
      touch('down', 450, 300, 1.0, slot: 1),
    ]);
    var seconds = 1.0;
    for (var i = 1; i <= 10; i++) {
      seconds += 0.008;
      await send([
        touch('move', 350 - i * 15, 300, seconds),
        touch('move', 450 + i * 15, 300, seconds, slot: 1),
      ]);
      await tester.pump(const Duration(milliseconds: 8));
    }
    await send([
      touch('up', 200, 300, seconds),
      touch('up', 600, 300, seconds, slot: 1),
    ]);
    await tester.pumpAndSettle();

    expect(transform.value.getMaxScaleOnAxis(), greaterThan(1.5));
  }, variant: macOS);

  testWidgets('a tap does not hover', (tester) async {
    final log = <String>[];
    await tester.pumpWidget(
      MaterialApp(
        home: MouseRegion(
          onEnter: (_) => log.add('enter'),
          onExit: (_) => log.add('exit'),
          child: const SizedBox.expand(),
        ),
      ),
    );

    await send([touch('down', 400, 300, 1.0)]);
    await send([touch('move', 403, 302, 1.05)]);
    await send([touch('up', 403, 302, 1.1)]);
    await tester.pump();

    expect(log, isEmpty);
  }, variant: macOS);

  testWidgets('hover follows a sliding finger and leaves when it lifts', (
    tester,
  ) async {
    final log = <String>[];
    await tester.pumpWidget(
      MaterialApp(
        home: Align(
          alignment: Alignment.topLeft,
          child: MouseRegion(
            onEnter: (_) => log.add('enter'),
            onExit: (_) => log.add('exit'),
            child: const SizedBox(width: 200, height: 200),
          ),
        ),
      ),
    );

    await send([touch('down', 500, 500, 1.0)]);
    await tester.pump();
    expect(log, isEmpty);

    await send([touch('move', 100, 100, 1.1)]);
    await tester.pump();
    expect(log, ['enter']);

    await send([touch('up', 100, 100, 1.2)]);
    await tester.pump();
    expect(log, ['enter', 'exit']);
  }, variant: macOS);

  testWidgets('a lift away from the last report moves there first', (
    tester,
  ) async {
    final seen = recordPointerEvents();
    await pumpDetector(tester);

    await send([touch('down', 400, 300, 1.0)]);
    await send([touch('up', 430, 300, 1.1)]);
    await tester.pump();

    final touches = seen.where((e) => e.kind == PointerDeviceKind.touch);
    expect(touches.map((e) => e.runtimeType), [
      PointerAddedEvent,
      PointerDownEvent,
      PointerMoveEvent,
      PointerUpEvent,
      PointerRemovedEvent,
    ]);
    expect(touches.whereType<PointerMoveEvent>().single.delta.dx, 30);
    expect(touches.whereType<PointerUpEvent>().single.position.dx, 430);
  }, variant: macOS);

  testWidgets('a finger that lands twice cancels the first where it was', (
    tester,
  ) async {
    final seen = recordPointerEvents();
    await pumpDetector(tester);

    await send([touch('down', 100, 100, 1.0)]);
    await send([touch('down', 600, 400, 1.2)]);
    await tester.pump();

    final cancel = seen.whereType<PointerCancelEvent>().single;
    expect(cancel.position, const Offset(100, 100));
    expect(seen.whereType<PointerDownEvent>().length, 2);

    await send([touch('up', 600, 400, 1.3)]);
    await tester.pump();
  }, variant: macOS);

  testWidgets('a cancelled touch releases the press without a tap', (
    tester,
  ) async {
    final log = <String>[];
    await pumpDetector(
      tester,
      onTapDown: (_) => log.add('down'),
      onTapCancel: () => log.add('cancel'),
      onTap: () => log.add('tap'),
    );

    await send([touch('down', 400, 300, 1.0)]);
    await tester.pump(const Duration(milliseconds: 150));
    await send([touch('cancel', 400, 300, 1.2)]);
    await tester.pump();

    expect(log, ['down', 'cancel']);
  }, variant: macOS);

  testWidgets('a move or lift with no finger down is ignored', (tester) async {
    final seen = recordPointerEvents();
    await pumpList(tester);

    await send([touch('move', 400, 300, 1.0)]);
    await send([touch('up', 400, 300, 1.1)]);
    await tester.pump();

    expect(seen, isEmpty);
  }, variant: macOS);

  testWidgets('a malformed message is ignored', (tester) async {
    final seen = recordPointerEvents();
    await pumpList(tester);

    await MacosTouchInput.handleMessage('down');
    await send([
      ['down', 0, 400.0],
      ['down', 'zero', 400.0, 300.0, 1.0],
      ['down', 0, double.nan, 300.0, 1.0],
      ['sideways', 0, 400.0, 300.0, 1.0],
    ]);
    await tester.pump();

    expect(seen, isEmpty);
  }, variant: macOS);

  testWidgets('touches arrive over the channel the runner uses', (
    tester,
  ) async {
    var taps = 0;
    await pumpDetector(tester, onTap: () => taps++);
    MacosTouchInput.install();

    Future<void> deliver(List<Object?> message) =>
        tester.binding.defaultBinaryMessenger.handlePlatformMessage(
          'moonfin/macos_touch',
          const StandardMessageCodec().encodeMessage(message),
          (_) {},
        );

    await deliver([touch('down', 400, 300, 1.0)]);
    await deliver([touch('up', 400, 300, 1.1)]);
    await tester.pump();

    expect(taps, 1);
  }, variant: macOS);
}
