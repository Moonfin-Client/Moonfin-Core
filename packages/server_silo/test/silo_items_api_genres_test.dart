import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

FixtureServer _server() => FixtureServer({
  '/api/v2/catalog/filters': FixtureServer.file('silo/catalog_filters.json'),
  '/api/v2/catalog': siloJson({
    'items': [],
    'page': {'has_more': false},
  }),
});

void main() {
  test('a library\'s genres as Genre items with synthetic ids', () async {
    final server = _server();
    final page = await siloTestClient(server).itemsApi.getGenres(
      parentId: '1',
      sortBy: 'SortName',
      sortOrder: 'Ascending',
    );
    final items = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(items.first, {
      'Id': siloGenreId('Action'),
      'Name': 'Action',
      'SortName': 'Action',
      'Type': 'Genre',
      'IsFolder': true,
      'ImageTags': <String, String>{},
      'BackdropImageTags': <String>[],
    });
    expect(page['TotalRecordCount'], items.length);
    expect(server.requests.single.uri.queryParameters['library_id'], '1');
  });

  test('descending, and a page of them', () async {
    final api = siloTestClient(_server()).itemsApi;
    final all = await api.getGenres(parentId: '1');
    final desc = await api.getGenres(parentId: '1', sortOrder: 'Descending');
    final page = await api.getGenres(parentId: '1', startIndex: 1, limit: 2);
    final names = [for (final g in all['Items'] as List) (g as Map)['Name']];
    expect([
      for (final g in desc['Items'] as List) (g as Map)['Name'],
    ], names.reversed);
    expect(
      [for (final g in page['Items'] as List) (g as Map)['Name']],
      [names[1], names[2]],
    );
    expect(page['TotalRecordCount'], names.length);
  });

  test('a genre\'s titles: by genre id or as the parent', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    await api.getItems(
      parentId: '1',
      genreIds: [siloGenreId('Sci-Fi & Fantasy')],
    );
    await api.getItems(parentId: siloGenreId('Drama'));

    String rule(int i) =>
        ((jsonDecode(server.requests[i].uri.queryParameters['groups']!) as List)
                        .single['rules']
                    as List)
                .single['value']
            as String;
    expect(rule(0), 'Sci-Fi & Fantasy');
    expect(rule(1), 'Drama');
    expect(
      server.requests[1].uri.queryParameters,
      isNot(contains('library_id')),
    );
  });

  test('getItem on a genre id names it, with no request', () async {
    final server = _server();
    final genre = await siloTestClient(
      server,
    ).itemsApi.getItem(siloGenreId('Action'));
    expect(genre['Type'], 'Genre');
    expect(genre['Name'], 'Action');
    expect(server.requests, isEmpty);
  });
}
