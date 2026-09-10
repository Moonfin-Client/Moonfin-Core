import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/auto_download_planner.dart';

import 'auto_download_test_support.dart';

AutoDownloadPlan _plan(
  List<AggregatedItem> episodes, {
  int? keep,
  Duration? deleteAfter,
  DateTime? now,
  Set<String> downloaded = const {},
  Set<String> inFlight = const {},
  Set<String> autoOwned = const {},
  int? budget,
  String? playing,
}) => planAutoDownload(
  episodes: episodes,
  keepUnwatched: keep,
  deleteAfter: deleteAfter,
  now: now ?? _checkedAt,
  downloadedIds: downloaded,
  inFlightIds: inFlight,
  autoOwnedIds: autoOwned,
  storageBudgetBytes: budget,
  sizeOf: sizeOf,
  newSince: followedAt,
  playingItemId: playing,
);

List<String> _ids(List<AggregatedItem> items) => [for (final i in items) i.id];

/// When the planner runs in these tests.
final _checkedAt = DateTime(2026, 9, 7, 12);

void main() {
  test('queues unwatched episodes oldest first and skips played ones', () {
    final result = _plan([
      episode('s2e1', season: 2, number: 1),
      episode('s1e2', number: 2),
      episode('s1e1', number: 1, played: true),
      episode('s1e3', number: 3),
    ]);
    expect(_ids(result.toQueue), ['s1e2', 's1e3', 's2e1']);
    expect(result.toDelete, isEmpty);
    expect(result.storageFull, isFalse);
  });

  test('keepUnwatched counts downloaded and in-flight episodes', () {
    final result = _plan(
      [
        episode('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
        episode('e4', number: 4),
      ],
      keep: 3,
      downloaded: {'e1'},
      inFlight: {'e2'},
    );
    expect(_ids(result.toQueue), ['e3']);
  });

  test('a played downloaded episode frees its keep slot', () {
    final result = _plan(
      [
        episode('e1', number: 1, played: true),
        episode('e2', number: 2),
        episode('e3', number: 3),
      ],
      keep: 2,
      downloaded: {'e1'},
    );
    expect(_ids(result.toQueue), ['e2', 'e3']);
  });

  test('null keepUnwatched means everything unwatched', () {
    final result = _plan([
      for (var n = 1; n <= 12; n++) episode('e$n', number: n),
    ]);
    expect(result.toQueue, hasLength(12));
  });

  test('keepUnwatched already met queues nothing', () {
    final result = _plan(
      [episode('e1', number: 1), episode('e2', number: 2)],
      keep: 1,
      downloaded: {'e1'},
    );
    expect(result.toQueue, isEmpty);
  });

  test('never queues specials, placeholders or unaired episodes', () {
    final result = _plan([
      episode('special', season: 0, number: 1),
      episode('missing', number: 1, extra: {'IsMissing': true}),
      episode('virtual', number: 2, extra: {'LocationType': 'virtual'}),
      episode(
        'unaired',
        number: 3,
        extra: {
          'PremiereDate': DateTime.now()
              .add(const Duration(days: 30))
              .toIso8601String(),
        },
      ),
      episode('real', number: 4),
    ]);
    expect(_ids(result.toQueue), ['real']);
  });

  test('episodes without numbers sort after numbered ones', () {
    final result = _plan([episode('unnumbered'), episode('e1', number: 1)]);
    expect(_ids(result.toQueue), ['e1', 'unnumbered']);
  });

  test('episodes held back by the budget are reported in order', () {
    final result = _plan([
      episode('e1', number: 1, size: 100),
      episode('e2', number: 2, size: 100),
      episode('e3', number: 3, size: 100),
    ], budget: 150);
    expect(result.toQueue.map((e) => e.id), ['e1']);
    expect(result.blocked.map((e) => e.id), ['e2', 'e3']);
    expect(result.storageFull, isTrue);
  });

  test('stops at the storage budget without skipping ahead', () {
    final result = _plan([
      episode('e1', number: 1, size: 60),
      episode('e2', number: 2, size: 60),
      episode('e3', number: 3, size: 10),
    ], budget: 100);
    expect(_ids(result.toQueue), ['e1']);
    expect(result.storageFull, isTrue);
  });

  test('a null budget means unlimited', () {
    final result = _plan([episode('e1', number: 1, size: 1 << 40)]);
    expect(_ids(result.toQueue), ['e1']);
  });

  test('deletes only auto-owned, downloaded, played episodes when enabled', () {
    final episodes = [
      episode('manual', number: 1, played: true),
      episode('auto', number: 2, played: true),
      episode('autoUnwatched', number: 3),
      episode('autoGone', number: 4, played: true),
    ];
    final on = _plan(
      episodes,
      deleteAfter: Duration.zero,
      downloaded: {'manual', 'auto', 'autoUnwatched'},
      autoOwned: {'auto', 'autoUnwatched', 'autoGone'},
    );
    expect(_ids(on.toDelete), ['auto']);

    final off = _plan(
      episodes,
      downloaded: {'manual', 'auto'},
      autoOwned: {'auto'},
    );
    expect(off.toDelete, isEmpty);
  });

  test('only episodes added after the subscription are candidates', () {
    final result = _plan([
      episode(
        'backlog',
        number: 1,
        added: followedAt.subtract(const Duration(days: 30)),
      ),
      episode('undated', number: 2, extra: {'DateCreated': null}),
      episode(
        'new',
        number: 3,
        added: followedAt.add(const Duration(hours: 1)),
      ),
    ]);
    expect(_ids(result.toQueue), ['new']);
  });

  test('a backlog episode still counts toward the keep cap and deletes', () {
    final result = _plan(
      [
        episode(
          'old',
          number: 1,
          added: followedAt.subtract(const Duration(days: 30)),
        ),
        episode('new1', number: 2),
        episode('new2', number: 3),
      ],
      keep: 2,
      downloaded: {'old'},
    );
    expect(_ids(result.toQueue), ['new1']);
  });

  test('a delayed delete waits for the last play date to age', () {
    final watchedYesterday = episode(
      'yesterday',
      number: 1,
      played: true,
      extra: {
        'UserData': {
          'Played': true,
          'LastPlayedDate': _checkedAt
              .subtract(const Duration(hours: 30))
              .toIso8601String(),
        },
      },
    );
    final watchedJustNow = episode(
      'fresh',
      number: 2,
      played: true,
      extra: {
        'UserData': {
          'Played': true,
          'LastPlayedDate': _checkedAt
              .subtract(const Duration(hours: 2))
              .toIso8601String(),
        },
      },
    );
    final undated = episode('undated', number: 3, played: true);
    final all = {'yesterday', 'fresh', 'undated'};

    final afterDay = _plan(
      [watchedYesterday, watchedJustNow, undated],
      deleteAfter: const Duration(days: 1),
      downloaded: all,
      autoOwned: all,
    );
    expect(_ids(afterDay.toDelete), ['yesterday']);

    final immediately = _plan(
      [watchedYesterday, watchedJustNow, undated],
      deleteAfter: Duration.zero,
      downloaded: all,
      autoOwned: all,
    );
    expect(_ids(immediately.toDelete), ['yesterday', 'fresh', 'undated']);
  });

  test('never deletes the episode that is playing', () {
    final result = _plan(
      [episode('e1', number: 1, played: true)],
      deleteAfter: Duration.zero,
      downloaded: {'e1'},
      autoOwned: {'e1'},
      playing: 'e1',
    );
    expect(result.toDelete, isEmpty);
  });
}
