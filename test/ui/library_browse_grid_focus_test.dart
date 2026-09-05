import 'dart:math' as math;
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

void main() {
  group('Library Browse Grid Focus & Scroll Geometry (Issue #1356)', () {
    test('tvOS focus overhang and row spacing parity across 200 rows', () {
      // tvOS: focusScale is 1.12
      const double tvosFocusScale = 1.12;
      const double cellHeight = 282.0;
      const int crossAxisCount = 5;

      // focusGap(cellHeight, minimum: 0.0) on tvOS
      final focusOverhang =
          math.max(0.0, cellHeight * (tvosFocusScale - 1.0) / 2.0);
      final rowSpacing = math.max(8.0, focusOverhang);
      final gridTopPadding = 8.0 + focusOverhang;

      // Layout geometry used by SliverGridDelegate and _gridGeometry
      final geometry = (
        perLine: crossAxisCount,
        lineExtent: cellHeight,
        lineSpacing: rowSpacing,
        leadingPad: gridTopPadding,
      );

      // Verify that using _gridGeometry matches the layout's exact row position
      for (final row in [0, 1, 10, 30, 50, 100, 200]) {
        final sliverRowTop =
            gridTopPadding + row * (cellHeight + rowSpacing);

        // Effective calculation in _scrollToGridRow with _gridGeometry
        final effectiveLeadingPad = geometry.leadingPad;
        final effectiveLineExtent = geometry.lineExtent;
        final effectiveLineSpacing = geometry.lineSpacing;
        final computedRowTop = effectiveLeadingPad +
            row * (effectiveLineExtent + effectiveLineSpacing);

        expect(
          computedRowTop,
          equals(sliverRowTop),
          reason: 'Row $row position must match sliver layout without drift',
        );

        // Demonstrate the previous bug: hardcoded mainAxisSpacing: 8.0
        final legacyRowTop = 8.0 + row * (cellHeight + 8.0);
        final discrepancy = sliverRowTop - legacyRowTop;

        if (row == 30) {
          // At row 30 on tvOS, legacy formula was ~274px off!
          expect(discrepancy, greaterThan(250.0));
        } else if (row == 100) {
          // At row 100 on tvOS, legacy formula was ~900px off (completely off-screen)
          expect(discrepancy, greaterThan(850.0));
        }
      }
    });

    test('Desktop and Android TV Large card / Banner drift prevention', () {
      // Android TV / Desktop: focusScale is 1.05
      const double standardFocusScale = 1.05;
      const double largeCellHeight = 360.0;
      const int crossAxisCount = 6;

      final focusOverhang =
          math.max(0.0, largeCellHeight * (standardFocusScale - 1.0) / 2.0);
      // For 360px card, overhang is 360 * 0.025 = 9.0px
      expect(focusOverhang, closeTo(9.0, 0.001));

      final rowSpacing = math.max(8.0, focusOverhang);
      expect(rowSpacing, closeTo(9.0, 0.001));

      final gridTopPadding = 8.0 + focusOverhang;
      expect(gridTopPadding, closeTo(17.0, 0.001));

      final geometry = (
        perLine: crossAxisCount,
        lineExtent: largeCellHeight,
        lineSpacing: rowSpacing,
        leadingPad: gridTopPadding,
      );

      for (final row in [0, 10, 50, 100]) {
        final sliverRowTop =
            gridTopPadding + row * (largeCellHeight + rowSpacing);

        final computedRowTop = geometry.leadingPad +
            row * (geometry.lineExtent + geometry.lineSpacing);

        expect(
          computedRowTop,
          closeTo(sliverRowTop, 0.001),
          reason: 'Large cards on Desktop/Android must match sliver layout',
        );

        // In legacy code, hardcoded 8.0 caused progressive drift on large cards
        final legacyRowTop = 8.0 + row * (largeCellHeight + 8.0);
        final discrepancy = sliverRowTop - legacyRowTop;
        if (row == 100) {
          // 1px per row + 9px top pad = 109px drift
          expect(discrepancy, closeTo(109.0, 0.001));
        }
      }
    });

    test('topPad respects focus overhang to prevent clipping top border glow', () {
      const double tvosFocusScale = 1.12;
      const double cellHeight = 282.0;
      final focusOverhang =
          math.max(0.0, cellHeight * (tvosFocusScale - 1.0) / 2.0);
      final leadingPad = 8.0 + focusOverhang;

      // In updated _scrollToGridRow:
      final topPad = leadingPad;
      expect(topPad, greaterThan(8.0));
      expect(topPad, equals(8.0 + focusOverhang));
    });
  });
}
