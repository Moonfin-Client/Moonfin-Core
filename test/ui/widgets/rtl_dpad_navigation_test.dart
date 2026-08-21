import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/modern/widgets/details_tab_bar.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';

// A physical Left press moves the highlight physically left whatever the
// locale, and an escape fires for the key whose edge focus is actually at.
// LockedFocusRow is where that rule started and DetailsTabBar held a copy
// that drifted, so those two are pinned here.
void main() {
  group('LockedFocusRow', () {
    late List<int> indices;
    late int leftEdge;
    late int rightEdge;
    late FocusNode node;

    setUp(() {
      indices = [];
      leftEdge = 0;
      rightEdge = 0;
      node = FocusNode();
    });

    tearDown(() => node.dispose());

    Future<void> pump(WidgetTester tester, TextDirection direction) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: direction,
            child: LockedFocusRow<String>(
              items: const ['a', 'b', 'c'],
              hubKey: 'test-${direction.name}',
              itemExtent: 100,
              height: 100,
              focusNode: node,
              itemBuilder: (context, item, index, isFocused) => Text(item),
              onIndexChanged: (index, item) => indices.add(index),
              onLeftEdge: () => leftEdge++,
              onRightEdge: () => rightEdge++,
            ),
          ),
        ),
      );
      node.requestFocus();
      await tester.pump();
      // Gaining focus reports the resting index, which isn't a movement.
      indices.clear();
    }

    testWidgets('LTR: Right advances and each edge fires its own key', (
      tester,
    ) async {
      await pump(tester, TextDirection.ltr);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(indices, [1]);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(indices, [1, 2]);
      expect(rightEdge, 1, reason: 'Right at the last item leaves right');

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      expect(indices, [1, 2, 1, 0]);
      expect(leftEdge, 1, reason: 'Left at the first item leaves left');
    });

    testWidgets('RTL: physical keys still move the highlight physically', (
      tester,
    ) async {
      await pump(tester, TextDirection.rtl);

      // Index 0 sits physically rightmost in a mirrored row, so a physical
      // Left press moves inward to index 1.
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      expect(indices, [1]);

      // The last index is the physically leftmost item, so pressing Left
      // there leaves through the left edge, not the right one.
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      expect(indices, [1, 2]);
      expect(leftEdge, 1);
      expect(rightEdge, 0);

      // And back across: physical Right walks to index 0 and then leaves
      // through the right edge.
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(indices, [1, 2, 1, 0]);
      expect(rightEdge, 1);
    });
  });

  group('DetailsTabBar', () {
    late List<FocusNode> nodes;
    late int exits;

    setUp(() {
      nodes = [for (var i = 0; i < 3; i++) FocusNode()];
      exits = 0;
    });

    tearDown(() {
      for (final n in nodes) {
        n.dispose();
      }
    });

    Future<void> pump(WidgetTester tester, TextDirection direction) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: direction,
            child: Scaffold(
              body: DetailsTabBar(
                labels: const ['one', 'two', 'three'],
                selectedIndex: 0,
                onSelect: (_) {},
                focusNodeFor: (index) => nodes[index],
                onExitLeft: () => exits++,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('LTR: Left at the first tab exits left', (tester) async {
      await pump(tester, TextDirection.ltr);
      nodes[0].requestFocus();
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      expect(exits, 1);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(nodes[1].hasFocus, isTrue);
    });

    testWidgets('RTL: the exit still belongs to the physical Left key', (
      tester,
    ) async {
      await pump(tester, TextDirection.rtl);

      // Index 0 is the physically rightmost tab. Pressing Right there has
      // nowhere to go and must not throw focus out through the left.
      nodes[0].requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(exits, 0);
      expect(nodes[0].hasFocus, isTrue);

      // Physical Left steps inward through the mirrored row.
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      expect(nodes[1].hasFocus, isTrue);

      // And at the physically leftmost tab it leaves through onExitLeft.
      nodes[2].requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      expect(exits, 1);
    });
  });
}
