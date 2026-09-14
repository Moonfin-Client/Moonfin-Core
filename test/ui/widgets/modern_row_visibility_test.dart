import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/hub_focus_memory.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/modern_card_transition.dart';
import 'package:moonfin/ui/widgets/modern_row_visibility.dart';

const _duration = Duration(milliseconds: 180);

Widget _host({
  required bool visible,
  Duration duration = _duration,
  required Widget child,
}) => MaterialApp(
  home: Scaffold(
    body: Align(
      alignment: Alignment.topLeft,
      child: ModernRowVisibility(
        visible: visible,
        duration: duration,
        child: child,
      ),
    ),
  ),
);

double _opacity(WidgetTester tester) => tester
    .widget<FadeTransition>(
      find.descendant(
        of: find.byType(ModernRowVisibility),
        matching: find.byType(FadeTransition),
      ),
    )
    .opacity
    .value;

void main() {
  setUp(HubFocusMemory.clearAll);

  testWidgets('visibility preserves the row controller and keyed focus state', (
    tester,
  ) async {
    final rowKey = GlobalKey<LockedFocusRowState<int>>();
    late ModernCardRowController motion;

    Widget row() => ModernCardRowTransition(
      duration: _duration,
      builder: (context, controller) {
        motion = controller;
        return LockedFocusRow<int>(
          key: rowKey,
          items: const [0, 1, 2],
          hubKey: 'modern-visibility-test',
          itemKeyBuilder: (item) => item,
          itemExtent: 100,
          height: 120,
          onIndexChanged: (_, item) => controller.select(item),
          itemBuilder: (_, item, index, focused) =>
              SizedBox(width: 100, child: Text('$item')),
        );
      },
    );

    await tester.pumpWidget(_host(visible: true, child: row()));
    final originalMotion = motion;
    final originalFocusState = rowKey.currentState!;
    originalFocusState.requestFocusAt(1);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 45));
    final progress = motion.progressOf(1);
    expect(progress, greaterThan(0));
    expect(progress, lessThan(1));
    expect(originalFocusState.hasFocusedItem, isTrue);

    await tester.pumpWidget(_host(visible: false, child: row()));
    expect(motion, same(originalMotion));
    expect(rowKey.currentState, same(originalFocusState));
    expect(motion.progressOf(1), closeTo(progress, 0.00001));
    expect(rowKey.currentState!.focusedIndex, 1);

    await tester.pumpAndSettle();
    expect(_opacity(tester), 0);
    expect(motion.progressOf(1), 1);
    expect(rowKey.currentState, same(originalFocusState));
    expect(originalFocusState.hasFocusedItem, isTrue);

    await tester.pumpWidget(_host(visible: true, child: row()));
    await tester.pumpAndSettle();
    expect(_opacity(tester), 1);
    expect(motion, same(originalMotion));
    expect(motion.progressOf(1), 1);
    expect(rowKey.currentState, same(originalFocusState));
    expect(tester.takeException(), isNull);
  });

  testWidgets('fade reverses smoothly and inactive rows ignore pointer input', (
    tester,
  ) async {
    var taps = 0;
    final tile = GestureDetector(
      onTap: () => taps++,
      child: const SizedBox(
        width: 100,
        height: 100,
        child: ColoredBox(color: Colors.blue),
      ),
    );
    await tester.pumpWidget(_host(visible: true, child: tile));
    await tester.tapAt(const Offset(50, 50));
    expect(taps, 1);

    await tester.pumpWidget(_host(visible: false, child: tile));
    expect(_opacity(tester), 1);
    await tester.tapAt(const Offset(50, 50));
    expect(taps, 1);
    await tester.pump(const Duration(milliseconds: 90));
    final halfway = _opacity(tester);
    expect(halfway, greaterThan(0));
    expect(halfway, lessThan(1));

    await tester.pumpWidget(_host(visible: true, child: tile));
    expect(_opacity(tester), closeTo(halfway, 0.00001));
    await tester.pumpAndSettle();
    expect(_opacity(tester), 1);
    await tester.tapAt(const Offset(50, 50));
    expect(taps, 2);
  });

  testWidgets('zero duration changes opacity immediately', (tester) async {
    const tile = SizedBox(width: 100, height: 100);
    await tester.pumpWidget(
      _host(visible: true, duration: Duration.zero, child: tile),
    );
    expect(_opacity(tester), 1);

    await tester.pumpWidget(
      _host(visible: false, duration: Duration.zero, child: tile),
    );
    expect(_opacity(tester), 0);

    await tester.pumpWidget(
      _host(visible: true, duration: Duration.zero, child: tile),
    );
    expect(_opacity(tester), 1);
    expect(tester.takeException(), isNull);
  });
}
