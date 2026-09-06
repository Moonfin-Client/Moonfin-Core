import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/browse/library_browse_screen.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

/// The vertical browse grid widens its row pitch and its leading pad to leave
/// a focused card room to grow, and the scroll controller has to land on the
/// lines the sliver really drew. These build the same sliver the screen builds
/// and measure where the cards render, so a start that stops matching the
/// layout fails here instead of walking the focused card off a TV screen.
void main() {
  const viewport = Size(1920, 1080);
  const gridPadding = 48.0;
  const crossSpacing = 12.0;

  /// Lays out the grid the way _buildVerticalGrid does for a card of
  /// [cellHeight] under [focusScale], then checks every row in [rows] renders
  /// where gridLineStart says it will.
  Future<void> expectNoDrift(
    WidgetTester tester, {
    required double focusScale,
    required double cellHeight,
    required int crossAxisCount,
    required List<int> rows,
  }) async {
    tester.view.physicalSize = viewport;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final overhang = math.max(0.0, cellHeight * (focusScale - 1) / 2);
    final GridGeometry geometry = (
      perLine: crossAxisCount,
      lineExtent: cellHeight,
      lineSpacing: math.max(8.0, overhang),
      leadingPad: 8.0 + overhang,
    );
    final cellWidth =
        (viewport.width -
            gridPadding * 2 -
            (crossAxisCount - 1) * crossSpacing) /
        crossAxisCount;

    // Enough lines past the deepest one under test for it to sit at the top of
    // a full viewport, so no jump is clamped short of where it was aimed.
    final pitch = geometry.lineExtent + geometry.lineSpacing;
    final lineCount =
        rows.reduce(math.max) + 2 + (viewport.height / pitch).ceil();

    final controller = ScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                gridPadding,
                geometry.leadingPad,
                gridPadding,
                16,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: geometry.perLine,
                  mainAxisSpacing: geometry.lineSpacing,
                  crossAxisSpacing: crossSpacing,
                  childAspectRatio: cellWidth / geometry.lineExtent,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      SizedBox.expand(key: ValueKey<int>(index)),
                  childCount: lineCount * crossAxisCount,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    for (final row in rows) {
      final card = find.byKey(ValueKey<int>(row * crossAxisCount));
      final start = gridLineStart(geometry, row * crossAxisCount);
      controller.jumpTo(start);
      await tester.pump();

      expect(
        controller.offset,
        closeTo(start, 0.01),
        reason:
            'row $row has to be reachable or the checks below prove nothing',
      );

      final cardTop = tester.getTopLeft(card).dy;
      expect(
        cardTop,
        closeTo(0.0, 0.01),
        reason:
            'row $row rendered ${cardTop}px from where gridLineStart put it',
      );
      // A pitch that only comes out right because the extent and the spacing
      // cancel each other would still leave the row's bottom edge wrong.
      expect(tester.getSize(card).height, closeTo(geometry.lineExtent, 0.01));
    }
  }

  group('grid line starts match the sliver the browse screen builds', () {
    testWidgets('tvOS focus scale, standard poster', (tester) async {
      await expectNoDrift(
        tester,
        focusScale: 1.12,
        cellHeight: 282.0,
        crossAxisCount: 5,
        rows: const [0, 1, 10, 30, 100, 200],
      );
    });

    testWidgets('desktop and Android TV focus scale, standard poster', (
      tester,
    ) async {
      await expectNoDrift(
        tester,
        focusScale: 1.05,
        cellHeight: 282.0,
        crossAxisCount: 6,
        rows: const [0, 1, 10, 50, 200],
      );
    });

    testWidgets('desktop and Android TV focus scale, large poster', (
      tester,
    ) async {
      await expectNoDrift(
        tester,
        focusScale: 1.05,
        cellHeight: 360.0,
        crossAxisCount: 6,
        rows: const [0, 10, 100, 200],
      );
    });

    testWidgets('banner layout, few wide cells per line', (tester) async {
      await expectNoDrift(
        tester,
        focusScale: 1.12,
        cellHeight: 180.0,
        crossAxisCount: 2,
        rows: const [0, 5, 60, 200],
      );
    });

    testWidgets('the focus scale this build was compiled for', (tester) async {
      await expectNoDrift(
        tester,
        focusScale: MediaCard.focusScale,
        cellHeight: 282.0,
        crossAxisCount: 5,
        rows: const [0, 1, 40, 150],
      );
    });
  });

  test('gridLineStart holds a line together and steps a whole pitch', () {
    const GridGeometry geometry = (
      perLine: 5,
      lineExtent: 282.0,
      lineSpacing: 16.92,
      leadingPad: 24.92,
    );
    const pitch = 282.0 + 16.92;

    expect(gridLineStart(geometry, 0), closeTo(24.92, 0.001));
    expect(gridLineStart(geometry, 4), closeTo(24.92, 0.001));
    expect(gridLineStart(geometry, 5), closeTo(24.92 + pitch, 0.001));
    expect(gridLineStart(geometry, 500), closeTo(24.92 + 100 * pitch, 0.001));
  });
}
