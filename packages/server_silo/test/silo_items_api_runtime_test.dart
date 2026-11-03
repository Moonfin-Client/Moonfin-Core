import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _catalogPath = '/api/v2/catalog';

/// Silo's ascending runtime order: the three shows without a runtime first,
/// then the three with one. [counts] false: Silo refuses the runtime rule.
FixtureServer _server({bool counts = true}) => FixtureServer({
  _catalogPath: (RequestOptions o) {
    final q = o.uri.queryParameters;
    final counting = (q['groups'] ?? '').contains('"runtime"');
    if (counting && !counts) {
      return FixtureServer.problem(422, 'invalid_rule', 'no');
    }
    final ids = counting
        ? ['r30', 'r45', 'r60']
        : ['n1', 'n2', 'n3', 'r30', 'r45', 'r60'];
    return FixtureServer.json(
      200,
      jsonEncode({
        'items': [
          for (final id in ids)
            {'content_id': 'series-$id', 'type': 'series', 'title': id},
        ],
        'page': {'has_more': false},
        'total': ids.length,
      }),
    );
  },
});

Future<(List<String>, Map<String, dynamic>)> _grid(
  FixtureServer server, {
  String order = 'Ascending',
  int start = 0,
  int limit = 100,
}) async {
  final page = await siloTestClient(server).itemsApi.getItems(
    parentId: '3',
    includeItemTypes: ['Series'],
    sortBy: 'Runtime,SortName',
    sortOrder: order,
    startIndex: start,
    limit: limit,
  );
  return (
    [
      for (final i in (page['Items'] as List).cast<Map>())
        (i['Id'] as String).substring('series-'.length),
    ],
    page,
  );
}

void main() {
  test('shortest first, titles without a runtime last', () async {
    final server = _server();
    final (ids, page) = await _grid(server);
    expect(ids, ['r30', 'r45', 'r60', 'n1', 'n2', 'n3']);
    expect(page['TotalRecordCount'], 6);
    final count = server.requests
        .map((r) => r.uri.queryParameters)
        .singleWhere((q) => (q['groups'] ?? '').contains('runtime'));
    expect(jsonDecode(count['groups']!), [
      {
        'match': 'all',
        'rules': [
          {'field': 'runtime', 'op': 'gt', 'value': 0},
        ],
      },
    ]);
    expect(count['type'], 'series');
    expect(count['library_id'], '3');
  });

  test('a page across the turn', () async {
    final (ids, page) = await _grid(_server(), start: 2, limit: 2);
    expect(ids, ['r60', 'n1']);
    expect(page['StartIndex'], 2);
    expect(page['TotalRecordCount'], 6);
  });

  test('longest first stays Silo\'s order', () async {
    final server = _server();
    await _grid(server, order: 'Descending');
    final queries = [for (final r in server.requests) r.uri.queryParameters];
    expect(queries.single['sort'], '-runtime');
  });

  test('a count Silo refuses leaves Silo\'s order', () async {
    final (ids, _) = await _grid(_server(counts: false));
    expect(ids, ['n1', 'n2', 'n3', 'r30', 'r45', 'r60']);
  });
}
