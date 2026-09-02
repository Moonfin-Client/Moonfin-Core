import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/immersive/hero/immersive_action_buttons.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  testWidgets('primary action responds to tap and select keys', (tester) async {
    var activations = 0;
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: ImmersiveActionButtons(
          primaryAction: ImmersiveAction(
            label: 'Play',
            icon: Icons.play_arrow,
            focusNode: focusNode,
            onPressed: () => activations++,
          ),
          secondaryActions: const [],
        ),
      ),
    );

    await tester.tap(find.text('Play'));
    expect(activations, 1);
    focusNode.requestFocus();
    await tester.pump();
    for (final key in [
      LogicalKeyboardKey.select,
      LogicalKeyboardKey.enter,
      LogicalKeyboardKey.space,
    ]) {
      await tester.sendKeyEvent(key);
    }
    expect(activations, 4);
  });

  testWidgets('secondary action responds to select, enter and space', (
    tester,
  ) async {
    var activations = 0;
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: ImmersiveActionButtons(
          primaryAction: null,
          secondaryActions: [
            ImmersiveAction(
              label: 'Favorite',
              icon: Icons.favorite,
              focusNode: focusNode,
              onPressed: () => activations++,
            ),
          ],
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    for (final key in [
      LogicalKeyboardKey.select,
      LogicalKeyboardKey.enter,
      LogicalKeyboardKey.space,
    ]) {
      await tester.sendKeyEvent(key);
    }
    expect(activations, 3);
  });

  testWidgets('directional callbacks and optional callbacks are safe', (
    tester,
  ) async {
    final calls = <String>[];
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: ImmersiveActionButtons(
          primaryAction: ImmersiveAction(
            label: 'Action',
            focusNode: focusNode,
            onPressed: () {},
            onArrowUp: () => calls.add('up'),
            onArrowDown: () => calls.add('down'),
            onArrowLeft: () => calls.add('left'),
            onArrowRight: () => calls.add('right'),
          ),
          secondaryActions: const [],
        ),
      ),
    );
    focusNode.requestFocus();
    await tester.pump();
    for (final key in [
      LogicalKeyboardKey.arrowUp,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowLeft,
      LogicalKeyboardKey.arrowRight,
    ]) {
      await tester.sendKeyEvent(key);
    }
    expect(calls, ['up', 'down', 'left', 'right']);

    await tester.pumpWidget(
      _TestApp(
        child: ImmersiveActionButtons(
          primaryAction: ImmersiveAction(
            label: 'No optional callbacks',
            onPressed: () {},
          ),
          secondaryActions: const [],
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('overflow opens a dialog and selecting an action invokes it', (
    tester,
  ) async {
    var selected = 0;
    final actions = [
      for (var i = 0; i < 4; i++)
        ImmersiveAction(
          label: 'Action $i',
          icon: Icons.star,
          onPressed: i == 3 ? () => selected++ : () {},
        ),
    ];

    await tester.pumpWidget(
      _TestApp(
        child: ImmersiveActionButtons(
          primaryAction: null,
          secondaryActions: actions,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.more_horiz_rounded));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('Action 3'), findsOneWidget);
    await tester.tap(find.text('Action 3'));
    await tester.pumpAndSettle();
    expect(selected, 1);
    expect(find.byType(Dialog), findsNothing);
  });

  testWidgets('secondary tooltip appears on focus and disappears on loss', (
    tester,
  ) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: ImmersiveActionButtons(
          primaryAction: null,
          secondaryActions: [
            ImmersiveAction(
              label: 'Favorite',
              icon: Icons.favorite,
              focusNode: focusNode,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Favorite'), findsWidgets);
    focusNode.unfocus();
    await tester.pump();
    expect(find.text('Favorite'), findsNothing);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      home: Scaffold(body: Center(child: child)),
    );
  }
}
