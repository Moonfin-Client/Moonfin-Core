import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/hub_focus_memory.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';

void main() {
  testWidgets('a burst of presses still parks the focused card at the start', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    HubFocusMemory.set('drift', 0);
    final node = FocusNode();
    addTearDown(node.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: LockedFocusRow<int>(
          items: List.generate(30, (i) => i),
          hubKey: 'drift',
          itemExtent: 40,
          height: 40,
          focusNode: node,
          // Grows on focus like a Modern card, slower than the scroll, so the
          // first card scrolls out of the cache before it has shrunk back.
          itemBuilder: (context, item, index, isFocused) => AnimatedSize(
            duration: const Duration(milliseconds: 600),
            alignment: Alignment.centerLeft,
            child: SizedBox(
              key: ValueKey('card-$index'),
              width: isFocused ? 120 : 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
    node.requestFocus();
    await tester.pumpAndSettle();

    for (var i = 0; i < 15; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    }
    await tester.pumpAndSettle();

    expect(tester.getTopLeft(find.byKey(const ValueKey('card-15'))).dx, 0);
  });

  testWidgets('cards of different widths still park the focused one at the start', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    HubFocusMemory.set('mixed', 0);
    final node = FocusNode();
    addTearDown(node.dispose);
    double widthOf(int index) => index.isEven ? 40 : 60;

    await tester.pumpWidget(
      MaterialApp(
        home: LockedFocusRow<int>(
          items: List.generate(30, (i) => i),
          hubKey: 'mixed',
          itemExtent: 40,
          itemExtentOf: widthOf,
          itemSpacing: 8,
          height: 40,
          focusNode: node,
          itemBuilder: (context, item, index, isFocused) => SizedBox(
            key: ValueKey('card-$index'),
            width: widthOf(index),
            height: 40,
          ),
        ),
      ),
    );
    node.requestFocus();
    await tester.pumpAndSettle();

    for (var i = 0; i < 7; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    }
    await tester.pumpAndSettle();

    expect(tester.getTopLeft(find.byKey(const ValueKey('card-7'))).dx, 0);
  });
}
