import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_info.dart';
import 'package:moonfin/data/models/trickplay_prefetch_planner.dart';
import 'package:server_core/server_core.dart';

void main() {
  const info = TrickplayInfo(
    width: 100,
    height: 60,
    tileWidth: 5,
    tileHeight: 4,
    interval: 10000,
  );
  const totalDuration = Duration(minutes: 20);

  group('TrickplayPrefetchPlanner.planImageIndexes (directional, D-pad)', () {
    test('forward returns only sheets ahead of the current one', () {
      final indexes = TrickplayPrefetchPlanner.planImageIndexes(
        info: info,
        position: const Duration(seconds: 220), // sheet 1
        totalDuration: totalDuration,
        directionForward: true,
        sheetsAhead: 2,
      );
      expect(indexes, [2, 3]);
    });

    test('backward returns only sheets behind the current one', () {
      final indexes = TrickplayPrefetchPlanner.planImageIndexes(
        info: info,
        position: const Duration(seconds: 420), // sheet 2
        totalDuration: totalDuration,
        directionForward: false,
        sheetsAhead: 2,
      );
      expect(indexes, [1, 0]);
    });

    test('backward near the start clamps at sheet 0, no negatives', () {
      final indexes = TrickplayPrefetchPlanner.planImageIndexes(
        info: info,
        position: Duration.zero, // sheet 0
        totalDuration: totalDuration,
        directionForward: false,
        sheetsAhead: 2,
      );
      expect(indexes, isEmpty);
    });

    test('forward near the end clamps at the last sheet', () {
      final indexes = TrickplayPrefetchPlanner.planImageIndexes(
        info: info,
        position: totalDuration - const Duration(seconds: 1), // last sheet
        totalDuration: totalDuration,
        directionForward: true,
        sheetsAhead: 2,
      );
      expect(indexes, isEmpty);
    });
  });

  group('TrickplayPrefetchPlanner.planAllImageIndexes (touch/mouse)', () {
    test('covers every sheet, ordered nearest-to-position outward', () {
      final indexes = TrickplayPrefetchPlanner.planAllImageIndexes(
        info: info,
        position: const Duration(seconds: 420), // sheet 2
        totalDuration: totalDuration,
      );
      expect(indexes.toSet(), {0, 1, 2, 3, 4, 5});
      expect(indexes.first, 2);
      final distances = indexes.map((i) => (i - 2).abs()).toList();
      for (var i = 1; i < distances.length; i++) {
        expect(distances[i], greaterThanOrEqualTo(distances[i - 1]));
      }
    });

    test('maxSheets caps the result for very long content', () {
      final indexes = TrickplayPrefetchPlanner.planAllImageIndexes(
        info: info,
        position: Duration.zero,
        totalDuration: const Duration(hours: 10), // 180 sheets, > 128 cap
        maxSheets: 128,
      );
      expect(indexes.length, 128);
      expect(indexes.every((i) => i < 128), isTrue);
    });
  });

  test('timestamped frames use their real indexes and respect the cap', () {
    final timestamped = TrickplayInfo.fromThumbnailSet(
      TrickplayThumbnailSet(
        aspectRatio: 16 / 9,
        thumbnails: List.generate(
          20,
          (index) => TrickplayThumbnail(
            positionTicks: index * index * 10000000,
            imageTag: 'frame-$index',
          ),
        ),
      ),
      width: 320,
    );

    final indexes = TrickplayPrefetchPlanner.planAllImageIndexes(
      info: timestamped,
      position: const Duration(seconds: 100),
      totalDuration: const Duration(minutes: 10),
      maxSheets: 7,
    );

    expect(indexes, hasLength(7));
    expect(
      indexes.first,
      timestamped.resolveTile(const Duration(seconds: 100)).imageIndex,
    );
    expect(indexes.every((index) => index >= 0 && index < 20), isTrue);
  });
}
