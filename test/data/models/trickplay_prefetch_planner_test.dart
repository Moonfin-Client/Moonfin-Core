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

  group('seek destinations', () {
    const frames = TrickplayInfo(
      width: 100,
      height: 60,
      tileWidth: 1,
      tileHeight: 1,
      interval: 1000,
    );
    List<int> plan(TrickplayInfo source, int seconds, bool forward) =>
        TrickplayPrefetchPlanner.planSeekImageIndexes(
          info: source,
          position: Duration(seconds: seconds),
          totalDuration: const Duration(seconds: 100),
          forwardStepMs: 10000,
          backwardStepMs: 5000,
          directionForward: forward,
        );

    test('uses configured seek steps instead of adjacent frame indexes', () {
      expect(plan(frames, 20, true), [20, 30, 40, 50, 60, 70, 80, 15, 10]);
      expect(plan(frames, 40, false), [40, 35, 30, 25, 20, 15, 10, 50, 60]);
    });
    test('clamps at both ends and deduplicates sprite sheets', () {
      expect(plan(frames, 0, false), [0, 10, 20]);
      expect(plan(frames, 95, true), [95, 99, 90, 85]);
      expect(plan(info, 20, true), [0]);
    });
    test('resolves irregular timestamped frames at seek destinations', () {
      final irregular = TrickplayInfo.fromThumbnailSet(
        TrickplayThumbnailSet(
          aspectRatio: 16 / 9,
          thumbnails: [0, 3, 19, 28, 46, 65, 90]
              .map(
                (seconds) => TrickplayThumbnail(
                  positionTicks: seconds * 10000000,
                  imageTag: 'frame-$seconds',
                ),
              )
              .toList(),
        ),
        width: 320,
      );
      expect(plan(irregular, 20, true), [2, 3, 4, 5, 1]);
    });
  });

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

  group('planSheetDecodeSize', () {
    const budget = 100663296;
    ({int width, int height})? plan(int width, int height, int bytes) =>
        TrickplayPrefetchPlanner.planSheetDecodeSize(
          sheetWidth: width,
          sheetHeight: height,
          cacheBytes: bytes,
        );

    test('decodes a 6400 x 3200 sheet at three quarters', () {
      expect(plan(6400, 3200, budget), (width: 4800, height: 2400));
    });
    test('keeps a 3200 x 1600 sheet at its full size', () {
      expect(plan(3200, 1600, budget), (width: 3200, height: 1600));
    });
    test('budgets for two sheets, not one', () {
      expect(plan(7200, 3600, budget), (width: 4500, height: 2250));
    });
    test('skips an eighth with a fractional height', () {
      expect(plan(6400, 3202, budget), (width: 3200, height: 1601));
    });
    test('skips an eighth with a fractional width', () {
      expect(plan(6402, 3200, budget), (width: 3201, height: 1600));
    });
    test('decodes a 9800 x 4900 sheet at one half', () {
      expect(plan(9800, 4900, budget), (width: 4900, height: 2450));
    });
    test('gives a 16:9 sheet five eighths because two do not fit at three', () {
      expect(plan(6400, 3600, budget), (width: 4000, height: 2250));
    });
    test('follows the budget it is given', () {
      expect(plan(6400, 3200, 33554432), (width: 2400, height: 1200));
    });
    test('accepts a decode that exactly fills the budget with two sheets', () {
      expect(plan(4800, 2400, 92160000), (width: 4800, height: 2400));
    });
    test('falls to one eighth when nothing larger fits', () {
      expect(plan(6400, 3200, 2560000), (width: 800, height: 400));
    });
    test('returns null for a sheet width below 1', () {
      expect(plan(0, 3200, budget), isNull);
    });
    test('returns null for a sheet height below 1', () {
      expect(plan(6400, 0, budget), isNull);
    });
    test('returns null for a cache budget below 1', () {
      expect(plan(6400, 3200, 0), isNull);
    });
    test('returns null when not even one eighth fits', () {
      expect(plan(100000, 100000, 1000), isNull);
    });
  });

  group('planPlaybackKeepForward', () {
    // A sheet covers 1,000 s; the last of three starts at 2,000 s. With steps
    // of 30 s forward and 10 s back, the next sheet is held from 250 s in.
    const sheets = TrickplayInfo(
      width: 640,
      height: 320,
      tileWidth: 10,
      tileHeight: 10,
      interval: 10000,
    );
    const duration = Duration(milliseconds: 2578000);
    bool keepForward(
      int positionMs, {
      int forwardStepMs = 30000,
      int backwardStepMs = 10000,
      TrickplayInfo source = sheets,
    }) => TrickplayPrefetchPlanner.planPlaybackKeepForward(
      info: source,
      position: Duration(milliseconds: positionMs),
      totalDuration: duration,
      forwardStepMs: forwardStepMs,
      backwardStepMs: backwardStepMs,
    );

    test('holds the previous sheet early in a sheet', () {
      expect(keepForward(1100000), isFalse);
    });
    test('holds the previous sheet just before the switch', () {
      expect(keepForward(1249000), isFalse);
    });
    test('holds the next sheet from the switch on', () {
      expect(keepForward(1250000), isTrue);
    });
    test('holds the next sheet on the first sheet', () {
      expect(keepForward(60000), isTrue);
    });
    test('holds the previous sheet on the last sheet', () {
      expect(keepForward(2500000), isFalse);
    });
    test('moves the switch with the step lengths', () {
      expect(
        keepForward(1700000, forwardStepMs: 10000, backwardStepMs: 30000),
        isFalse,
      );
    });
    test('looks forward for a forward step below 1', () {
      expect(keepForward(1100000, forwardStepMs: 0), isTrue);
    });
    test('looks forward for individual frames', () {
      const frames = TrickplayInfo(
        width: 320,
        height: 180,
        tileWidth: 1,
        tileHeight: 1,
        interval: 10000,
        frames: [
          TrickplayFrameInfo(positionTicks: 0, imageTag: 'a'),
          TrickplayFrameInfo(positionTicks: 100000000, imageTag: 'b'),
          TrickplayFrameInfo(positionTicks: 200000000, imageTag: 'c'),
        ],
      );
      expect(keepForward(1060000, source: frames), isTrue);
    });
  });
}
