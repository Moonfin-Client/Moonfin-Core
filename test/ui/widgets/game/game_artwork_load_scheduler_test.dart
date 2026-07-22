import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/game/game_artwork_load_scheduler.dart';

void main() {
  test('orders nearby rows outward above then below the viewport', () {
    expect(
      gameArtworkLoadOrder(
        firstIndex: 0,
        lastIndexExclusive: 18,
        visibleFirstIndex: 6,
        visibleLastIndexExclusive: 12,
        crossAxisCount: 3,
        surroundingRows: 2,
      ),
      [
        6, 7, 8, 9, 10, 11, // Visible rows.
        3, 4, 5, 12, 13, 14, // One row above, then one below.
        0, 1, 2, 15, 16, 17, // Two rows above, then two below.
      ],
    );
  });

  test('limits submissions and advances as artwork finishes', () {
    final scheduler = GameArtworkLoadScheduler(maxConcurrent: 2);

    scheduler.showViewport(const ['a', 'b', 'c'], priorityKey: 'b');

    expect(scheduler.isEnabled('b'), isTrue);
    expect(scheduler.isEnabled('a'), isTrue);
    expect(scheduler.isEnabled('c'), isFalse);

    scheduler.markFinished('b', scheduler.generationFor('b')!);

    expect(scheduler.isEnabled('c'), isTrue);
  });

  test(
    'replaces pending work and ignores completions from an old viewport',
    () {
      final scheduler = GameArtworkLoadScheduler(maxConcurrent: 2);
      scheduler.showViewport(const ['a', 'b', 'c']);
      final oldGeneration = scheduler.generationFor('a')!;

      scheduler.showViewport(const ['z1', 'z2', 'z3'], priorityKey: 'z2');

      expect(scheduler.isEnabled('c'), isFalse);
      expect(scheduler.isEnabled('z2'), isTrue);
      expect(scheduler.isEnabled('z1'), isTrue);
      expect(scheduler.isEnabled('z3'), isFalse);

      scheduler.markFinished('a', oldGeneration);
      expect(scheduler.isEnabled('z3'), isFalse);

      scheduler.markFinished('z2', scheduler.generationFor('z2')!);
      expect(scheduler.isEnabled('z3'), isTrue);
    },
  );

  test('caps remembered finished keys but never drops an on-screen one', () {
    final scheduler = GameArtworkLoadScheduler(maxConcurrent: 4, maxFinished: 3);

    void showAndFinish(List<String> keys) {
      scheduler.showViewport(keys);
      for (final key in keys) {
        final generation = scheduler.generationFor(key);
        if (generation != null) scheduler.markFinished(key, generation);
      }
    }

    // 'persistent' stays visible in every viewport; the rest scroll away.
    for (var batch = 0; batch < 20; batch++) {
      showAndFinish(['persistent', 'a$batch', 'b$batch', 'c$batch']);
      expect(scheduler.isEnabled('persistent'), isTrue);
    }

    // The current viewport is still fully enabled after all the churn.
    expect(scheduler.isEnabled('a19'), isTrue);
    expect(scheduler.isEnabled('b19'), isTrue);
    expect(scheduler.isEnabled('c19'), isTrue);

    // The remembered set is bounded by the on-screen keys rather than growing
    // with every batch (20 * 4 = 80 keys would accumulate without the cap).
    expect(scheduler.finishedCount, lessThanOrEqualTo(4));
  });

  test('prioritizes current viewport keys ahead of nearby rows', () {
    final scheduler = GameArtworkLoadScheduler(maxConcurrent: 4);

    scheduler.showViewport(const [
      'current-1',
      'current-2',
      'current-3',
      'current-4',
      'above',
    ], priorityKey: 'current-3');

    expect(scheduler.isEnabled('current-3'), isTrue);
    expect(scheduler.isEnabled('current-1'), isTrue);
    expect(scheduler.isEnabled('current-2'), isTrue);
    expect(scheduler.isEnabled('current-4'), isTrue);
    expect(scheduler.isEnabled('above'), isFalse);
  });
}
