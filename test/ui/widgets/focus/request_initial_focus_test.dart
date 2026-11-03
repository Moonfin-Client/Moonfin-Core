import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/request_initial_focus.dart';

void main() {
  testWidgets('focuses the first focusable descendant, not the last', (
    tester,
  ) async {
    final nodes = List.generate(4, (i) => FocusNode(debugLabel: 'tile $i'));
    addTearDown(() {
      for (final node in nodes) {
        node.dispose();
      }
    });

    await tester.pumpWidget(
      MaterialApp(
        home: RequestInitialFocus(
          child: Column(
            children: [
              for (final node in nodes)
                Focus(focusNode: node, child: const SizedBox(height: 40)),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(nodes.first.hasPrimaryFocus, isTrue);
    expect(nodes.last.hasFocus, isFalse);
  });
}
