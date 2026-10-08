import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/auto_download_downloader.dart';

import 'auto_download_test_support.dart';

void main() {
  final start = DateTime.utc(2026, 9, 1);

  /// Ten episodes played an hour apart, newest first: e9 down to e0.
  final history = [
    for (var i = 9; i >= 0; i--)
      watched('e$i', playedAt: start.add(Duration(hours: i))),
  ];

  /// Serves [history] in pages of three, recording each page's index.
  Future<List<String>> read(
    List<int> pagesRead, {
    DateTime? playedAfter,
  }) async {
    final items = await readRecentlyPlayedEpisodes(
      (startIndex) async {
        pagesRead.add(startIndex);
        final page = history.skip(startIndex).take(3).toList();
        return (read: page.length, items: page);
      },
      playedAfter: playedAfter,
      pageSize: 3,
    );
    return [for (final AggregatedItem item in items) item.id];
  }

  test('the first page is read whole, even past the marker', () async {
    final pages = <int>[];
    // Only e9 was played after the marker, but e8 and e7 still come back,
    // so a raise still sees the series watched before it.
    final ids = await read(
      pages,
      playedAfter: start.add(const Duration(hours: 8)),
    );
    expect(ids, ['e9', 'e8', 'e7']);
    expect(pages, [0]);
  });

  test('reads further back until it passes the marker', () async {
    final pages = <int>[];
    final ids = await read(
      pages,
      playedAfter: start.add(const Duration(hours: 4)),
    );
    // The second page ends on e4, the marker itself, so a third isn't read.
    expect(ids, ['e9', 'e8', 'e7', 'e6', 'e5', 'e4']);
    expect(pages, [0, 3]);
  });

  test('stops when the history runs out', () async {
    final pages = <int>[];
    final ids = await read(pages, playedAfter: DateTime.utc(2000));
    expect(ids, hasLength(10));
    expect(pages, [0, 3, 6, 9]);
  });

  test('without a marker it reads one page', () async {
    final pages = <int>[];
    expect(await read(pages), ['e9', 'e8', 'e7']);
    expect(pages, [0]);
  });
}
