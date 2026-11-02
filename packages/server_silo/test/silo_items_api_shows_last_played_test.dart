import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _catalogPath = '/api/v2/catalog';

Map<String, Object?> _card(String id, String type) => {
  'content_id': id,
  'type': type,
  'title': id,
};

/// Five shows in Silo's default order, and a watch history (most recent
/// first) holding two of them and a film.
FixtureServer _server() => FixtureServer({
  _catalogPath: (RequestOptions o) {
    final history = o.uri.queryParameters['source'] == 'history';
    return FixtureServer.json(
      200,
      jsonEncode({
        'items': history
            ? [
                _card('series-c', 'series'),
                _card('movie-x', 'movie'),
                _card('series-a', 'series'),
              ]
            : [
                for (final id in ['a', 'b', 'c', 'd', 'e'])
                  _card('series-$id', 'series'),
              ],
        'page': {'has_more': false},
        'total': history ? 3 : 5,
      }),
    );
  },
});

Future<(List<String>, FixtureServer)> _grid(String order) async {
  final server = _server();
  final page = await siloTestClient(server).itemsApi.getItems(
    parentId: '3',
    includeItemTypes: ['Series'],
    sortBy: 'DatePlayed,SortName',
    sortOrder: order,
    startIndex: 0,
    limit: 100,
  );
  return (
    [for (final i in (page['Items'] as List).cast<Map>()) i['Id'] as String],
    server,
  );
}

void main() {
  test(
    'shows by last played: the watch history first, the rest after',
    () async {
      final (ids, server) = await _grid('Descending');
      expect(ids, ['series-c', 'series-a', 'series-b', 'series-d', 'series-e']);
      final queries = [for (final r in server.requests) r.uri.queryParameters];
      final list = queries.singleWhere((q) => q['source'] == null);
      expect(list['type'], 'series');
      expect(list['library_id'], '3');
      expect(list.containsKey('sort'), isFalse, reason: 'Silo dates no show');
      final history = queries.singleWhere((q) => q['source'] == 'history');
      expect(history['library_id'], '3');
    },
  );

  test('ascending: never watched first, then the longest ago', () async {
    final (ids, _) = await _grid('Ascending');
    expect(ids, ['series-b', 'series-d', 'series-e', 'series-a', 'series-c']);
  });

  test('films still sort by Silo\'s date viewed', () async {
    final server = _server();
    await siloTestClient(server).itemsApi.getItems(
      parentId: '1',
      includeItemTypes: ['Movie'],
      sortBy: 'DatePlayed',
      sortOrder: 'Descending',
      limit: 100,
    );
    expect(server.requests.single.uri.queryParameters['sort'], '-date_viewed');
  });
}
