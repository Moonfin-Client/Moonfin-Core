import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/download_source.dart';
import 'package:moonfin/data/services/remove_watched_planner.dart';

import 'auto_download_test_support.dart';

/// A day after [downloadedAt], when [watched] marks its plays.
final _playedAt = downloadedAt.add(const Duration(days: 1));

AggregatedItem _movie(String id, {bool played = true, DateTime? playedAt}) =>
    AggregatedItem(
      id: id,
      serverId: server,
      rawData: {
        'Id': id,
        'Type': 'Movie',
        'Name': 'Movie $id',
        'UserData': {
          'Played': played,
          if (played)
            'LastPlayedDate': (playedAt ?? _playedAt).toIso8601String(),
        },
      },
    );

AggregatedItem _audio(String id) => AggregatedItem(
  id: id,
  serverId: server,
  rawData: {
    'Id': id,
    'Type': 'Audio',
    'Name': 'Track $id',
    'UserData': {'Played': true, 'LastPlayedDate': _playedAt.toIso8601String()},
  },
);

RemoveWatchedCandidate _row(
  AggregatedItem item, {
  DateTime? downloaded,
  bool synced = true,
  DownloadSource source = DownloadSource.manual,
}) => (
  item: item,
  downloadedAt: downloaded ?? downloadedAt,
  progressSynced: synced,
  source: source,
);

List<String> _plan(
  List<RemoveWatchedCandidate> rows, {
  Duration deleteAfter = Duration.zero,
  DateTime? now,
  Set<String> kept = const {},
  String? playing,
}) => [
  for (final item in planRemoveWatched(
    rows,
    deleteAfter: deleteAfter,
    now: now ?? _playedAt.add(const Duration(hours: 1)),
    keptIds: kept,
    playingItemId: playing,
  ))
    item.id,
];

void main() {
  test('removes watched episodes and movies', () {
    expect(
      _plan([_row(watched('e1')), _row(_movie('m1')), _row(episode('e2'))]),
      ['e1', 'm1'],
    );
  });

  test('leaves what smart downloads or a followed series queued', () {
    expect(_plan([_row(watched('e1'), source: DownloadSource.auto)]), isEmpty);
  });

  test('leaves music and books alone', () {
    expect(_plan([_row(_audio('a1'))]), isEmpty);
  });

  test('leaves unwatched downloads alone', () {
    expect(_plan([_row(_movie('m1', played: false))]), isEmpty);
  });

  test('waits until offline progress reached the server', () {
    expect(_plan([_row(_movie('m1'), synced: false)]), isEmpty);
  });

  test('keeps a download of something watched before it was downloaded', () {
    final rewatch = _row(
      _movie('m1'),
      downloaded: _playedAt.add(const Duration(minutes: 1)),
    );
    expect(_plan([rewatch]), isEmpty);
  });

  test('keeps a download without dates to tell a rewatch apart', () {
    final noDate = (
      item: _movie('m1'),
      downloadedAt: null,
      progressSynced: true,
      source: DownloadSource.manual,
    );
    expect(_plan([noDate]), isEmpty);
  });

  test('waits out the delay after the last play', () {
    final rows = [_row(_movie('m1'))];
    const day = Duration(days: 1);
    expect(
      _plan(
        rows,
        deleteAfter: day,
        now: _playedAt.add(const Duration(hours: 23)),
      ),
      isEmpty,
    );
    expect(_plan(rows, deleteAfter: day, now: _playedAt.add(day)), ['m1']);
  });

  test('keeps a kept item, and every episode of a kept series', () {
    final rows = [
      _row(_movie('m1')),
      _row(watched('e1', series: 'kept-series')),
      _row(watched('e2', series: 'other')),
    ];
    expect(_plan(rows, kept: {'m1', 'kept-series'}), ['e2']);
  });

  test('only removes what was watched after the setting was turned on', () {
    final rows = [_row(_movie('m1'))];
    expect(
      planRemoveWatched(
        rows,
        deleteAfter: Duration.zero,
        now: _playedAt.add(const Duration(hours: 1)),
        watchedAfter: _playedAt.add(const Duration(minutes: 1)),
      ),
      isEmpty,
    );
    expect(
      planRemoveWatched(
        rows,
        deleteAfter: Duration.zero,
        now: _playedAt.add(const Duration(hours: 1)),
        watchedAfter: _playedAt.subtract(const Duration(minutes: 1)),
      ),
      hasLength(1),
    );
  });

  test('leaves the item playing now for the next pass', () {
    expect(_plan([_row(_movie('m1'))], playing: 'm1'), isEmpty);
  });
}
