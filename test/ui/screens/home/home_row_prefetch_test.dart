import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_row_prefetch.dart';
import 'package:moonfin/util/device_performance.dart';

void main() {
  group('rowPrefetchBudget', () {
    test('nothing on the reduced tier, offline, or in the background', () {
      expect(
        rowPrefetchBudget(
          tier: DevicePerformanceTier.reduced,
          canReachServer: true,
          isBackgrounded: false,
          cellularOnly: false,
        ),
        isNull,
      );
      expect(
        rowPrefetchBudget(
          tier: DevicePerformanceTier.standard,
          canReachServer: false,
          isBackgrounded: false,
          cellularOnly: false,
        ),
        isNull,
      );
      expect(
        rowPrefetchBudget(
          tier: DevicePerformanceTier.standard,
          canReachServer: true,
          isBackgrounded: true,
          cellularOnly: false,
        ),
        isNull,
      );
    });

    test('one row and no extras on cellular, two rows otherwise', () {
      final cellular = rowPrefetchBudget(
        tier: DevicePerformanceTier.standard,
        canReachServer: true,
        isBackgrounded: false,
        cellularOnly: true,
      );
      expect(cellular, (rowsAhead: 1, extraCards: 0));
      final wifi = rowPrefetchBudget(
        tier: DevicePerformanceTier.standard,
        canReachServer: true,
        isBackgrounded: false,
        cellularOnly: false,
      );
      expect(wifi, (rowsAhead: 2, extraCards: 2));
    });
  });

  group('homeRowPrefetchTargets', () {
    test('skips rows that are loading or empty and caps the count', () {
      final targets = homeRowPrefetchTargets(
        rowCount: 6,
        fromRow: 1,
        rowsAhead: 3,
        visibleCards: (_) => 6,
        extraCards: 2,
        isRowReady: (row) => row != 2,
        itemCount: (row) => row == 3 ? 3 : 100,
      );
      expect(targets, [(row: 3, count: 3), (row: 4, count: 8)]);
    });

    test('never exceeds the per-row cap or the row list', () {
      final targets = homeRowPrefetchTargets(
        rowCount: 3,
        fromRow: 1,
        rowsAhead: 5,
        visibleCards: (_) => 40,
        extraCards: 2,
        isRowReady: (_) => true,
        itemCount: (_) => 500,
      );
      expect(targets, [(row: 2, count: 12)]);
    });
  });

  test('visibleCardsFor rounds up', () {
    expect(
      visibleCardsFor(viewportWidth: 1000, cardWidth: 150, spacing: 16),
      7,
    );
    expect(visibleCardsFor(viewportWidth: 0, cardWidth: 150, spacing: 16), 0);
  });

  test('gridCacheExtentFor is one row on standard and default on reduced', () {
    expect(
      gridCacheExtentFor(
        tier: DevicePerformanceTier.standard,
        cellExtent: 300,
        spacing: 12,
      ),
      312,
    );
    expect(
      gridCacheExtentFor(
        tier: DevicePerformanceTier.reduced,
        cellExtent: 300,
        spacing: 12,
      ),
      isNull,
    );
  });
}
