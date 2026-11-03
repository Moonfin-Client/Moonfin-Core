import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _catalogPath = '/api/v2/catalog';

/// A catalog of [total] films in Silo's default order, answering any range.
FixtureServer _server({int total = 250}) => FixtureServer({
  _catalogPath: (RequestOptions o) {
    final q = o.uri.queryParameters;
    final limit = int.parse(q['limit'] ?? '50');
    final offset =
        int.tryParse(q['seek'] ?? '') ?? int.tryParse(q['cursor'] ?? '') ?? 0;
    final end = (offset + limit).clamp(0, total);
    return FixtureServer.json(
      200,
      jsonEncode({
        'items': [
          for (var i = offset; i < end; i++)
            {'content_id': 'movie-$i', 'type': 'movie', 'title': 'T$i'},
        ],
        'page': {
          'has_more': end < total,
          if (end < total) 'next_cursor': '$end',
        },
        'window_cursor': 'w',
        'total': total,
        'total_exact': true,
      }),
    );
  },
});

void main() {
  test('random: no sort sent, a few drawn from across the list', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    Future<List<String>> draw() async {
      final page = await api.getItems(
        genreIds: ['silo-genre:Action'],
        includeItemTypes: ['Movie', 'Series'],
        sortBy: 'Random',
        sortOrder: 'Ascending',
        recursive: true,
        limit: 10,
      );
      expect(page['TotalRecordCount'], 250);
      return [
        for (final i in (page['Items'] as List).cast<Map>()) i['Id'] as String,
      ];
    }

    final ids = await draw();
    expect(ids, hasLength(10));
    expect(ids.toSet(), hasLength(10));
    for (final r in server.requests) {
      expect(
        r.uri.queryParameters.containsKey('sort'),
        isFalse,
        reason: 'Silo refuses sort=random',
      );
      expect(r.uri.queryParameters['limit'], '100');
    }
    // 250 titles are 3 pages and all of them take part, so the shuffle
    // picker doesn't offer only titles from the start of the alphabet.
    final seen = <int>{};
    for (var i = 0; i < 20; i++) {
      seen.addAll((await draw()).map((id) => int.parse(id.split('-').last)));
    }
    expect(seen.where((n) => n >= 200), isNotEmpty);
    expect(seen.where((n) => n >= 100 && n < 200), isNotEmpty);
  });

  test('a large list: a few random pages, not every one', () async {
    final server = _server(total: 2000);
    final page = await siloTestClient(
      server,
    ).itemsApi.getItems(parentId: '1', sortBy: 'Random', limit: 12);
    expect(page['Items'], hasLength(12));
    // The first page (for the total) and at most four picked ones.
    expect(server.requests.length, lessThanOrEqualTo(5));
  });

  test('a random grid is shuffled whole, every title once', () async {
    final api = siloTestClient(_server()).itemsApi;
    final seen = <String>[];
    // As the library grid pages: 75 first, then 48 at a time. Its first
    // page is under a hundred but is still the grid's, so more than the
    // first screen is random.
    for (var start = 0; start < 250; start += start == 0 ? 75 : 48) {
      final page = await api.getItems(
        parentId: '1',
        sortBy: 'Random',
        startIndex: start,
        limit: start == 0 ? 75 : 48,
      );
      seen.addAll([
        for (final i in (page['Items'] as List).cast<Map>()) i['Id'] as String,
      ]);
    }
    expect(seen, hasLength(250));
    expect(seen.toSet(), hasLength(250));
    // The whole list is shuffled, not each page of Silo's name order: the
    // first page reaches well past the first hundred titles.
    expect(
      seen.take(75).where((id) => int.parse(id.split('-').last) >= 100),
      isNotEmpty,
    );
  });

  test('loading the grid from the top again reshuffles it', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    Future<List<String>> page(int start, String order) async {
      final p = await api.getItems(
        parentId: '1',
        sortBy: 'Random',
        sortOrder: order,
        startIndex: start,
        limit: start == 0 ? 75 : 48,
      );
      return [
        for (final i in (p['Items'] as List).cast<Map>()) i['Id'] as String,
      ];
    }

    final first = await page(0, 'Ascending');
    final reads = server.requests.length;
    // Random picked again: the direction flips and the grid reloads.
    final again = await page(0, 'Descending');
    expect(again, isNot(first));
    expect(server.requests, hasLength(reads), reason: 'the list is kept');
    // The next page follows the new order: no title of its first page.
    final next = await page(75, 'Descending');
    expect(next.toSet().intersection(again.toSet()), isEmpty);
  });
}
