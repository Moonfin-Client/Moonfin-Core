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

  /// The strip hugging its segments, and what it has to leave room for.
  group('the strip around the segments', () {
    const labels = ['Season 1', 'Season 2', 'Season 3', 'Season 4'];

    /// The box the strip actually paints in, which is the one the [Align]
    /// sizes rather than the widget's own root.
    Rect stripRect(WidgetTester tester) => tester.getRect(
      find
          .descendant(
            of: find.descendant(
              of: find.byType(SlidingPillTabs),
              matching: find.byType(Align),
            ),
            matching: find.byType(SizedBox),
          )
          .first,
    );

    List<Rect> segmentRects(WidgetTester tester) => [
      for (final label in labels)
        tester.getRect(
          find
              .ancestor(of: find.text(label), matching: find.byType(Padding))
              .first,
        ),
    ];

    Future<void> pumpTabs(WidgetTester tester, {required double width}) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: width,
                child: const SlidingPillTabs(
                  labels: labels,
                  selectedIndex: 3,
                  onChanged: _ignore,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
    }

    testWidgets('sits the same distance either side of the segments', (
      tester,
    ) async {
      // The strip counted the pane's padding but not the focus halo's ring,
      // so it came up short and sat closer to the last segment than the
      // first, with the last one clipped.
      await pumpTabs(tester, width: 1324);
      final strip = stripRect(tester);
      final segments = segmentRects(tester);

      expect(
        segments.first.left - strip.left,
        closeTo(strip.right - segments.last.right, 0.01),
      );
    });

    testWidgets('leaves the last segment room to draw in full', (tester) async {
      await pumpTabs(tester, width: 1324);
      final strip = stripRect(tester);
      final track = tester.getRect(
        find
            .descendant(
              of: find.byType(SlidingPillTabs),
              matching: find.byType(SingleChildScrollView),
            )
            .first,
      );
      final segments = segmentRects(tester);

      expect(
        track.width,
        greaterThanOrEqualTo(segments.last.right - segments.first.left),
      );
      expect(segments.last.right, lessThanOrEqualTo(strip.right));
    });

    testWidgets('gives the focus ring no room of its own', (tester) async {
      // The ring is laid out focused or not, so drawn around the pane it
      // widens the strip on every side. Painted over, the pane's own
      // padding is the whole inset.
      await pumpTabs(tester, width: 1324);
      final strip = stripRect(tester);
      final segments = segmentRects(tester);

      expect(segments.first.left - strip.left, closeTo(5, 0.01));
    });

    testWidgets('lays out as tall as it says it does', (tester) async {
      // The layouts that reserve room for the strip read this before it is
      // built, so a constant that undercounts the chrome overflows them.
      await pumpTabs(tester, width: 1324);
      expect(stripRect(tester).height, SlidingPillTabs.height);
    });

    testWidgets('caps at the room it has when the segments overflow', (
      tester,
    ) async {
      await pumpTabs(tester, width: 120);
      expect(stripRect(tester).width, lessThanOrEqualTo(120));
    });
  });
}

void _ignore(int _) {}
