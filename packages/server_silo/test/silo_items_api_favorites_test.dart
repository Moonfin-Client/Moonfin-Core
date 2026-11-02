import 'dart:convert';

import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _catalogPath = '/api/v2/catalog';

/// The catalog answering the captured favorites (catalog cards), as one
/// whole page.
FixtureServer _server() => FixtureServer({
  _catalogPath: siloJson({
    ...siloFixture('favorites.json'),
    'page': {'has_more': false},
  }),
});

Map<String, String> _query(FixtureServer server) => server.requests
    .singleWhere((r) => r.uri.path == _catalogPath)
    .uri
    .queryParameters;

final _favorited = jsonEncode([
  {
    'match': 'any',
    'rules': [
      {'field': 'favorited', 'op': 'is', 'value': true},
    ],
  },
]);

/// What Home's favorite rows ask (`RowDataSource.loadFavorites`).
Future<Map<String, dynamic>> _row(
  FixtureServer server,
  List<String> types, {
  String? parentId,
  String sortBy = 'SortName',
}) => siloTestClient(server).itemsApi.getItems(
  parentId: parentId,
  includeItemTypes: types,
  sortBy: sortBy,
  sortOrder: 'Ascending',
  recursive: true,
  limit: 20,
  isFavorite: true,
);

void main() {
  test('favorite films: the favorited rule on the catalog', () async {
    final server = _server();
    final page = await _row(server, ['Movie']);
    final q = _query(server);
    expect(q['type'], 'movie');
    expect(q['groups'], _favorited);
    expect(q['sort'], 'title');
    expect(q.containsKey('source'), isFalse);
    expect(q.containsKey('library_id'), isFalse);

    // The scope asked for films. The captured list also has a series,
    // which a films row leaves out.
    final items = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(items.map((i) => i['Name']), [
      'The Wall',
      'Tom & Jerry',
      'Bohemian Rhapsody',
      'Operation Avalanche',
    ]);
    expect(
      items.every((i) => (i['UserData'] as Map)['IsFavorite'] == true),
      isTrue,
    );
  });

  test('favorite series and episodes', () async {
    for (final (types, scope) in [
      (['Series'], 'series'),
      (['Episode'], 'episode'),
    ]) {
      final server = _server();
      await _row(server, types, sortBy: 'DateCreated');
      final q = _query(server);
      expect(q['type'], scope, reason: '$types');
      expect(q['groups'], _favorited, reason: '$types');
      expect(q['sort'], 'added_at', reason: '$types');
    }
  });

  test('one library at a time when some are hidden', () async {
    final server = _server();
    await _row(server, ['Movie'], parentId: '1');
    expect(_query(server)['library_id'], '1');
  });

  test('favorite people and collections: Silo has none', () async {
    final server = _server();
    final people = await _row(server, ['Person']);
    expect(people['Items'], isEmpty);
    // Silo's favorites are titles. Without this the row would list every
    // collection.
    final collections = await _row(server, ['BoxSet']);
    expect(collections['Items'], isEmpty);
    expect(server.requests, isEmpty);
  });
}
