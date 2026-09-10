import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/sliding_pill_tabs.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Which thumb the pill draws, and that taps and drags both land on a
/// segment when the jelly thumb is in.
void main() {
  // Both ends, so a previous file can't leak a glass theme in and this one
  // can't leak one out.
  void reset() {
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
    GlassSettings.tier = GlassTier.solid;
    GlassSettings.usePackageRenderer = false;
  }

  setUp(reset);
  tearDown(reset);

  void useJelly() {
    ThemeRegistry.setActiveById(ThemeRegistry.glassId);
    GlassSettings.tier = GlassTier.frost;
    GlassSettings.usePackageRenderer = true;
  }

  Future<List<int>> pumpPill(WidgetTester tester) async {
    final changes = <int>[];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SlidingPillTabs(
          labels: const ['Movies', 'Shows', 'Music'],
          selectedIndex: 0,
          onChanged: changes.add,
        ),
      ),
    ));
    // Segments measure on a post-frame callback and the thumb only appears
    // once they have.
    await tester.pump();
    await tester.pump();
    return changes;
  }

  testWidgets('non-glass theme keeps the plain sliding thumb', (tester) async {
    await pumpPill(tester);
    expect(find.byType(AnimatedPositioned), findsOneWidget);
    expect(find.byType(AnimatedGlassIndicator), findsNothing);
  });

  testWidgets('glass without the package renderer keeps the plain thumb',
      (tester) async {
    ThemeRegistry.setActiveById(ThemeRegistry.glassId);
    GlassSettings.tier = GlassTier.sheen;
    await pumpPill(tester);
    expect(find.byType(AnimatedPositioned), findsOneWidget);
    expect(find.byType(AnimatedGlassIndicator), findsNothing);
  });

  testWidgets('glass on the package renderer draws the jelly thumb',
      (tester) async {
    useJelly();
    await pumpPill(tester);
    expect(find.byType(AnimatedGlassIndicator), findsOneWidget);
    expect(find.byType(AnimatedPositioned), findsNothing);
  });

  testWidgets('a tap on a segment still selects it under the jelly thumb',
      (tester) async {
    useJelly();
    final changes = await pumpPill(tester);
    await tester.tap(find.text('Shows'));
    await tester.pump();
    expect(changes, [1]);
  });

  testWidgets('the jelly thumb is free to swell past its slot', (tester) async {
    useJelly();
    await pumpPill(tester);
    final stack = tester.widget<Stack>(
      find.ancestor(
        of: find.byType(AnimatedGlassIndicator),
        matching: find.byType(Stack),
      ).first,
    );
    expect(stack.clipBehavior, Clip.none);
  });

  testWidgets('a drag across the pill lands on the segment under the finger',
      (tester) async {
    useJelly();
    final changes = await pumpPill(tester);
    final from = tester.getCenter(find.text('Movies'));
    final to = tester.getCenter(find.text('Music'));
    await tester.timedDrag(
      find.text('Movies'),
      to - from,
      const Duration(milliseconds: 300),
    );
    await tester.pump();
    expect(changes, [2]);
  });
}
