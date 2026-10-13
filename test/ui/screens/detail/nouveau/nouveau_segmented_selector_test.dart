import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/nouveau/shared/nouveau_segmented_selector.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  final seasons = [for (var i = 1; i <= 20; i++) i];

  Widget host(Widget selector) => MaterialApp(
    theme: AppTheme.buildTheme(ThemeRegistry.active),
    home: Scaffold(
      body: Center(child: SizedBox(width: 400, child: selector)),
    ),
  );

  Future<GlobalKey<NouveauSegmentedSelectorState<int>>> pumpSelector(
    WidgetTester tester, {
    int initial = 1,
  }) async {
    final key = GlobalKey<NouveauSegmentedSelectorState<int>>();
    var selected = initial;

    await tester.pumpWidget(
      host(
        StatefulBuilder(
          builder: (context, setState) {
            return NouveauSegmentedSelector<int>(
              key: key,
              values: seasons,
              selectedValue: selected,
              labelBuilder: (value) => 'Season $value',
              onValueActivated: (value) {
                setState(() => selected = value);
              },
              selectOnFocus: true,
            );
          },
        ),
      ),
    );

    return key;
  }

  Rect visibleRect(WidgetTester tester) {
    return tester.getRect(find.byType(NouveauSegmentedSelector<int>));
  }

  void expectSegmentVisible(WidgetTester tester, int season) {
    final segment = tester.getRect(find.text('Season $season'));
    final viewport = visibleRect(tester);

    expect(segment.left, greaterThanOrEqualTo(viewport.left));
    expect(segment.right, lessThanOrEqualTo(viewport.right));
  }

  testWidgets('scrolls a segment focused off screen into view', (
    tester,
  ) async {
    final key = await pumpSelector(tester);

    key.currentState!.requestFocusAt(1);
    await tester.pumpAndSettle();

    for (var i = 0; i < 15; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
    }

    expectSegmentVisible(tester, 16);

    for (var i = 0; i < 15; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
    }

    expectSegmentVisible(tester, 1);
  });

  testWidgets('reaches the last segment', (tester) async {
    final key = await pumpSelector(tester);

    key.currentState!.requestFocusAt(20);
    await tester.pumpAndSettle();

    expectSegmentVisible(tester, 20);
  });

  testWidgets('opens on a selected segment off screen with nothing focused', (
    tester,
  ) async {
    await pumpSelector(tester, initial: 16);
    await tester.pumpAndSettle();

    expectSegmentVisible(tester, 16);
  });

  testWidgets('a new list of the same length brings the selection back', (
    tester,
  ) async {
    Widget row(List<int> values) => host(
      NouveauSegmentedSelector<int>(
        values: values,
        selectedValue: 1,
        labelBuilder: (value) => 'Season $value',
        onValueActivated: (_) {},
      ),
    );

    await tester.pumpWidget(row(seasons));
    await tester.pumpAndSettle();
    await tester.drag(
      find.byType(SingleChildScrollView),
      const Offset(-4000, 0),
    );
    await tester.pumpAndSettle();

    await tester.pumpWidget(row([1, for (var i = 22; i <= 40; i++) i]));
    await tester.pumpAndSettle();

    expectSegmentVisible(tester, 1);
  });

  testWidgets('clips segments scrolled past the edge of the pill', (
    tester,
  ) async {
    await pumpSelector(tester);

    final scrollView = find.descendant(
      of: find.byType(NouveauSegmentedSelector<int>),
      matching: find.byType(SingleChildScrollView),
    );
    final clip = find.ancestor(
      of: scrollView,
      matching: find.byType(ClipRRect),
    );

    expect(clip, findsOneWidget);
    // Inside the 1px outline and 2px padding.
    expect(tester.getRect(clip), visibleRect(tester).deflate(3));
  });
}
