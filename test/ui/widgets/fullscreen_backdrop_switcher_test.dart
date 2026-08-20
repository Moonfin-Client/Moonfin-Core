import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/fullscreen_backdrop_switcher.dart';

void main() {
  Widget app(String? imageUrl) {
    return MaterialApp(
      home: FullscreenBackdropSwitcher(
        imageUrl: imageUrl,
        duration: const Duration(milliseconds: 800),
        imageBuilder: (url) => Text(url),
      ),
    );
  }

  testWidgets('does not restart the backdrop fade during rapid changes', (
    tester,
  ) async {
    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));
    await tester.pump(const Duration(milliseconds: 400));

    await tester.pumpWidget(app('c'));

    final fadeFinder = find.descendant(
      of: find.byType(FullscreenBackdropSwitcher),
      matching: find.byType(FadeTransition),
    );

    final fade = tester.widget<FadeTransition>(fadeFinder);

    expect(
      fade.opacity.value,
      greaterThan(0),
      reason: 'rapid changes should not restart the active fade from zero',
    );
  });

  testWidgets('clears all backdrop layers immediately when URL becomes null', (
    tester,
  ) async {
    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));
    await tester.pump(const Duration(milliseconds: 300));

    await tester.pumpWidget(app('c'));

    expect(find.text('a'), findsOneWidget);
    expect(find.text('b'), findsOneWidget);

    await tester.pumpWidget(app(null));

    expect(find.text('a'), findsNothing);
    expect(find.text('b'), findsNothing);
    expect(find.text('c'), findsNothing);

    final fadeFinder = find.descendant(
      of: find.byType(FullscreenBackdropSwitcher),
      matching: find.byType(FadeTransition),
    );

    expect(fadeFinder, findsNothing);
  });

  testWidgets('drops stale pending backdrop when focus returns to incoming', (
    tester,
  ) async {
    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));
    await tester.pump(const Duration(milliseconds: 200));

    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));

    await tester.pumpAndSettle();

    expect(find.text('b'), findsOneWidget);
    expect(find.text('a'), findsNothing);
  });
}
