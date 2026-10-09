import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/auto_download_planner.dart';
import 'package:moonfin/data/services/smart_download_planner.dart';

import 'auto_download_test_support.dart';

AutoDownloadPlan _plan(
  List<AggregatedItem> episodes, {
  required Set<String> downloaded,
  Set<String> inFlight = const {},
  int keepReady = 1,
  int? budget,
  String? playing,
  DateTime? downloadedOn,
  bool finished = false,
  DateTime? since,
  DateTime? playedSince,
}) => planSmartDownload(
  episodes: episodes,
  downloadedAt: {for (final id in downloaded) id: downloadedOn ?? downloadedAt},
  inFlightIds: inFlight,
  keepReady: keepReady,
  storageBudgetBytes: budget,
  sizeOf: sizeOf,
  playingItemId: playing,
  finishedRecently: finished,
  since: since ?? _enabledAt,
  playedSince: playedSince,
);

/// When smart downloads was turned on in these tests.
final _enabledAt = DateTime.utc(2026, 9, 1);

List<String> _ids(List<AggregatedItem> items) => [for (final i in items) i.id];

List<AggregatedItem> _season({int count = 6, Set<int> finished = const {}}) => [
  for (var n = 1; n <= count; n++)
    finished.contains(n)
        ? watched('e$n', number: n)
        : episode('e$n', number: n),
];

void main() {
  test('swaps a watched download for the next episode', () {
    final result = _plan(_season(finished: {1}), downloaded: {'e1', 'e2'});
    expect(_ids(result.toDelete), ['e1']);
    expect(_ids(result.toQueue), ['e3']);
  });

  test('swaps one for one when several downloads were watched', () {
    final result = _plan(
      _season(finished: {1, 2}),
      downloaded: {'e1', 'e2', 'e3'},
    );
    expect(_ids(result.toDelete), ['e1', 'e2']);
    expect(_ids(result.toQueue), ['e4', 'e5']);
  });

  test('tops the series up to keepReady after a watch', () {
    final result = _plan(
      _season(finished: {1}),
      downloaded: {'e1', 'e2'},
      keepReady: 3,
    );
    expect(_ids(result.toQueue), ['e3', 'e4']);
  });

  test('in-flight episodes count toward keepReady and are not queued', () {
    final result = _plan(
      _season(finished: {1}),
      downloaded: {'e1'},
      inFlight: {'e2'},
      keepReady: 2,
    );
    expect(_ids(result.toQueue), ['e3']);
  });

  test('does nothing until a download is watched', () {
    final result = _plan(_season(), downloaded: {'e1', 'e2'}, keepReady: 4);
    expect(result.toQueue, isEmpty);
    expect(result.toDelete, isEmpty);
  });

  test('keeps a download that was watched before it was downloaded', () {
    final result = _plan(
      _season(finished: {1}),
      downloaded: {'e1'},
      downloadedOn: downloadedAt.add(const Duration(days: 2)),
    );
    expect(result.toDelete, isEmpty);
    expect(result.toQueue, isEmpty);
  });

  test('keeps a played download without a last played date', () {
    final result = _plan(
      [episode('e1', number: 1, played: true), episode('e2', number: 2)],
      downloaded: {'e1'},
    );
    expect(result.toDelete, isEmpty);
    expect(result.toQueue, isEmpty);
  });

  test('deletes the final episode once watched', () {
    final result = _plan(_season(count: 3, finished: {3}), downloaded: {'e3'});
    expect(result.toDelete.map((e) => e.id), ['e3']);
    expect(result.toQueue, isEmpty);
  });

  test('leaves the playing episode for the next check', () {
    final result = _plan(
      _season(finished: {1}),
      downloaded: {'e1'},
      playing: 'e1',
    );
    expect(result.toDelete, isEmpty);
    expect(result.toQueue, isEmpty);
  });

  test('queues after the furthest watched episode, across seasons', () {
    final result = _plan(
      [
        watched('s1e1', number: 1),
        episode('s1e2', number: 2),
        watched('s1e3', number: 3),
        episode('s2e1', season: 2, number: 1),
        episode('s2e2', season: 2, number: 2),
      ],
      downloaded: {'s1e1', 's1e3'},
    );
    expect(_ids(result.toDelete), ['s1e1', 's1e3']);
    expect(_ids(result.toQueue), ['s2e1', 's2e2']);
  });

  test('skips specials, played and missing episodes', () {
    final result = _plan(
      [
        watched('e1', number: 1),
        episode('sp', season: 0, number: 1),
        episode('e2', number: 2, played: true),
        episode('e3', number: 3, extra: {'LocationType': 'Virtual'}),
        episode('e4', number: 4),
        episode('e5', number: 5),
      ],
      downloaded: {'e1'},
    );
    expect(_ids(result.toQueue), ['e4']);
  });

  test('counts the freed space and holds back what still does not fit', () {
    final result = _plan(
      _season(finished: {1, 2}),
      downloaded: {'e1', 'e2'},
      budget: 50,
    );
    // 50 left plus the 200 the swapped episodes free.
    expect(_ids(result.toQueue), ['e3', 'e4']);

    final tight = _plan(
      _season(finished: {1}),
      downloaded: {'e1'},
      keepReady: 3,
      budget: 50,
    );
    expect(_ids(tight.toQueue), ['e2']);
    expect(_ids(tight.blocked), ['e3', 'e4']);
    expect(tight.storageFull, isTrue);
  });

  test('finishing a streamed episode downloads the next ones', () {
    final result = _plan(
      _season(finished: {1, 2}),
      downloaded: const {},
      finished: true,
      keepReady: 2,
    );
    expect(result.toDelete, isEmpty);
    expect(_ids(result.toQueue), ['e3', 'e4']);
  });

  test('a finished episode tops up around what is already downloaded', () {
    final result = _plan(
      _season(finished: {1}),
      downloaded: {'e2'},
      finished: true,
      keepReady: 3,
    );
    expect(_ids(result.toQueue), ['e3', 'e4']);
  });

  test('nothing is queued after the finale', () {
    final result = _plan(
      _season(count: 3, finished: {1, 2, 3}),
      downloaded: const {},
      finished: true,
      keepReady: 2,
    );
    expect(result.toQueue, isEmpty);
  });

  test('watches from before it was turned on do not swap', () {
    final result = _plan(
      _season(finished: {1}),
      downloaded: {'e1'},
      since: downloadedAt.add(const Duration(days: 3)),
    );
    expect(result.toDelete, isEmpty);
    expect(result.toQueue, isEmpty);
  });

  test('the playing episode counts as unwatched', () {
    final result = _plan(
      _season(finished: {1, 2}),
      downloaded: {'e2'},
      finished: true,
      playing: 'e2',
    );
    // e2 is still open, so it is the one episode kept ready after e1.
    expect(result.toDelete, isEmpty);
    expect(result.toQueue, isEmpty);
  });

  test('a watch already replaced is only deleted', () {
    final result = _plan(
      _season(finished: {1}),
      downloaded: {'e1'},
      inFlight: {'e2'},
      playedSince: downloadedAt.add(const Duration(days: 2)),
    );
    expect(_ids(result.toDelete), ['e1']);
    expect(result.toQueue, isEmpty);
  });
}
