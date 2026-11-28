import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/util/item_watch_state.dart';

AggregatedItem _item(String type, Map<String, dynamic> extra) => AggregatedItem(
  id: 'i1',
  serverId: 's1',
  rawData: {'Id': 'i1', 'Type': type, ...extra},
);

void main() {
  group('a plain item', () {
    test('with nothing watched has no progress', () {
      final ws = watchStateOf(_item('Movie', {}));
      expect(ws.hasProgress, isFalse);
      expect(ws.isFullyUnwatched, isTrue);
      expect(ws.isFullyWatched, isFalse);
    });

    test('with a resume position has progress', () {
      final ws = watchStateOf(
        _item('Movie', {
          'UserData': {'PlaybackPositionTicks': 6000000000},
        }),
      );
      expect(ws.hasProgress, isTrue);
      expect(ws.isPartiallyWatched, isTrue);
      expect(ws.isFullyUnwatched, isFalse);
    });

    test('with a played percentage has progress', () {
      final ws = watchStateOf(
        _item('Episode', {
          'UserData': {'PlayedPercentage': 12.5},
        }),
      );
      expect(ws.hasProgress, isTrue);
    });

    test('marked played reads as fully watched', () {
      final ws = watchStateOf(
        _item('Movie', {
          'UserData': {'Played': true},
        }),
      );
      expect(ws.isFullyWatched, isTrue);
      expect(ws.isFullyUnwatched, isFalse);
    });
  });

  group('a series', () {
    test('nobody has started is fully unwatched', () {
      final ws = watchStateOf(
        _item('Series', {
          'RecursiveItemCount': 10,
          'UserData': {'UnplayedItemCount': 10},
        }),
      );
      expect(ws.isFullyUnwatched, isTrue);
      expect(ws.hasProgress, isFalse);
    });

    test('part way through has progress even with no position of its own', () {
      final ws = watchStateOf(
        _item('Series', {
          'RecursiveItemCount': 10,
          'UserData': {'UnplayedItemCount': 4},
        }),
      );
      expect(ws.isPartiallyWatched, isTrue);
      expect(ws.hasProgress, isTrue);
    });

    test('with nothing left unplayed is fully watched', () {
      final ws = watchStateOf(
        _item('Series', {
          'RecursiveItemCount': 10,
          'UserData': {'UnplayedItemCount': 0},
        }),
      );
      expect(ws.isFullyWatched, isTrue);
      expect(ws.hasProgress, isFalse);
    });
  });

  group('a season', () {
    test('answers progress from its own position, not its child count', () {
      final counted = watchStateOf(
        _item('Season', {
          'ChildCount': 10,
          'UserData': {'UnplayedItemCount': 4},
        }),
      );
      expect(counted.isPartiallyWatched, isTrue);
      expect(
        counted.hasProgress,
        isFalse,
        reason: 'only a series stands in its children for progress',
      );

      final positioned = watchStateOf(
        _item('Season', {
          'ChildCount': 10,
          'UserData': {'UnplayedItemCount': 4, 'PlayedPercentage': 30.0},
        }),
      );
      expect(positioned.hasProgress, isTrue);
    });
  });

  group('a rewatch', () {
    AggregatedItem ep(
      String id, {
      bool played = true,
      int? position,
      int? runtime = 12000000000,
      String? lastPlayed,
    }) => AggregatedItem(
      id: id,
      serverId: 's1',
      rawData: {
        'Id': id,
        'Type': 'Episode',
        'RunTimeTicks': ?runtime,
        'UserData': {
          'Played': played,
          'PlaybackPositionTicks': ?position,
          'LastPlayedDate': ?lastPlayed,
        },
      },
    );

    test('a watched episode with a position can resume', () {
      expect(hasResumePosition(ep('a', position: 6000000000)), isTrue);
    });

    test('a position at the runtime leaves nothing to resume', () {
      expect(hasResumePosition(ep('a', position: 12000000000)), isFalse);
      expect(hasResumePosition(ep('a', position: 0)), isFalse);
      expect(hasResumePosition(ep('a')), isFalse);
    });

    test('an unknown runtime still resumes', () {
      expect(hasResumePosition(ep('a', position: 1, runtime: null)), isTrue);
    });

    test('picks the rewatch played last', () {
      final pick = latestRewatch([
        ep('a', position: 100, lastPlayed: '2026-11-01T00:00:00Z'),
        ep('b'),
        ep('c', position: 100, lastPlayed: '2026-11-20T00:00:00Z'),
      ]);
      expect(pick?.id, 'c');
    });

    test('without dates keeps list order', () {
      final pick = latestRewatch([
        ep('a'),
        ep('b', position: 100),
        ep('c', position: 100, lastPlayed: '2026-11-20T00:00:00Z'),
      ]);
      expect(pick?.id, 'b');
    });

    test('finds nothing when no episode has a position', () {
      expect(latestRewatch([ep('a'), ep('b', position: 12000000000)]), isNull);
    });
  });
}
