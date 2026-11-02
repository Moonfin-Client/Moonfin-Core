import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

void main() {
  FixtureServer server() => FixtureServer({
    '/api/v2/catalog': siloJson({
      'items': [],
      'page': {'has_more': false},
    }),
    '/api/v2/catalog/letters': FixtureServer.file('silo/catalog_letters.json'),
  });

  test('nameStartsWith is name_prefix', () async {
    final s = server();
    await siloTestClient(
      s,
    ).itemsApi.getItems(parentId: '1', nameStartsWith: 'B');
    expect(s.requests.single.uri.queryParameters['name_prefix'], 'B');
  });

  test('# and blank have no prefix', () async {
    final s = server();
    final api = siloTestClient(s).itemsApi;
    await api.getItems(parentId: '1', nameStartsWith: '#');
    await api.getItems(parentId: '1', nameStartsWith: ' ');
    for (final r in s.requests) {
      expect(r.uri.queryParameters, isNot(contains('name_prefix')));
    }
  });

  test('the letter index', () async {
    final s = server();
    final index = await siloTestClient(
      s,
    ).itemsApi.letters(libraryId: '1', includeItemTypes: ['Movie']);
    expect(index.total, 4611);
    expect(index.letters.first, (letter: '#', count: 70, position: 0));
    expect(index.positionOf('b'), 347);
    expect(index.positionOf('Q'), isNotNull);
    expect(s.requests.single.method, 'POST');
    expect(s.requests.single.data, {
      'library_id': '1',
      'type': 'movie',
      'order': 'asc',
    });
  });

  group('letterPosition', () {
    test('the list on screen, sorted by name', () async {
      final s = server();
      final api = siloTestClient(s).itemsApi;
      await api.getItems(
        parentId: '1',
        includeItemTypes: ['Movie'],
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        genres: ['Drama'],
      );
      expect(await api.letterPosition('B', parentId: '1'), 347);
      final letters = s.requests.last;
      expect(letters.method, 'POST');
      expect(letters.data['library_id'], '1');
      expect(letters.data['type'], 'movie');
      expect(letters.data['order'], 'asc');
      expect(letters.data['groups'], [
        {
          'match': 'any',
          'rules': [
            {'field': 'genre', 'op': 'is', 'value': 'Drama'},
          ],
        },
      ]);
    });

    test('descending counts from the end', () async {
      final s = server();
      final api = siloTestClient(s).itemsApi;
      await api.getItems(
        parentId: '1',
        sortBy: 'SortName',
        sortOrder: 'Descending',
      );
      await api.letterPosition('B', parentId: '1');
      expect(s.requests.last.data['order'], 'desc');
    });

    test('no position for another sort, a series status, or no list', () async {
      final s = server();
      final api = siloTestClient(s).itemsApi;
      expect(await api.letterPosition('B', parentId: '1'), isNull);
      await api.getItems(parentId: '1', sortBy: 'SortName');
      await api.getItems(parentId: '1', sortBy: 'DateCreated');
      expect(await api.letterPosition('B', parentId: '1'), isNull);
      await api.getItems(
        parentId: '1',
        sortBy: 'SortName',
        seriesStatus: ['Ended'],
      );
      expect(await api.letterPosition('B', parentId: '1'), isNull);
      expect(
        s.requests.where((r) => r.uri.path.endsWith('/letters')),
        isEmpty,
      );
    });
  });

  group('sort names', () {
    test('a leading article moves to the end, as Silo files it', () {
      expect(siloDefaultSortTitle('The Hobbit'), 'Hobbit, The');
      expect(siloDefaultSortTitle('A Quiet Place'), 'Quiet Place, A');
      expect(siloDefaultSortTitle('An Education'), 'Education, An');
      expect(siloDefaultSortTitle('  the   Office '), 'Office, The');
      expect(siloDefaultSortTitle('The'), isNull);
      expect(siloDefaultSortTitle('Theodore Rex'), isNull);
      expect(siloDefaultSortTitle('Heat'), isNull);
    });

    test('cards get the default; a detail\'s own sort title wins', () {
      final card = siloItemToBaseItemDto({
        'content_id': 'movie:1',
        'type': 'movie',
        'title': 'The Hobbit',
      })!;
      expect(card['SortName'], 'Hobbit, The');
      expect(card['Name'], 'The Hobbit');
      final detail = siloItemToBaseItemDto({
        'content_id': 'movie:2',
        'type': 'movie',
        'title': 'The Thing',
        'sort_title': 'Thing (1982)',
      })!;
      expect(detail['SortName'], 'Thing (1982)');
    });
  });
}
