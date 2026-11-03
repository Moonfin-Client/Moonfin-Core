import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _catalogPath = '/api/v2/catalog';

/// Films released on two dates, the libraries list, and the profile's
/// "hide watched items from Home" setting.
FixtureServer _server({bool hideWatched = false}) => FixtureServer({
  '/api/v2/settings/values/effective': siloEffectiveSettings({
    'home.hide_watched_items': hideWatched,
  }),
  '/api/v2/user/libraries': FixtureServer.file('silo/user_libraries.json'),
  _catalogPath: (RequestOptions o) => FixtureServer.json(
    200,
    jsonEncode({
      'items': [
        {
          'content_id': 'movie-a',
          'type': 'movie',
          'title': 'A',
          'release_date': '2026-10-10',
        },
        {
          'content_id': 'movie-b',
          'type': 'movie',
          'title': 'B',
          'release_date': '2026-09-01',
        },
      ],
      'page': {'has_more': false},
      'total': 2,
    }),
  ),
});

Map<String, String> _query(FixtureServer server) => server.requests
    .singleWhere((r) => r.uri.path == _catalogPath)
    .uri
    .queryParameters;

void main() {
  test('a film library: by release date, released by today', () async {
    final server = _server();
    final page = await siloTestClient(server).itemsApi.getRecentlyReleasedItems(
      parentId: '1',
      includeItemTypes: ['Movie'],
      limit: 20,
      recursive: true,
      fields: 'PrimaryImageAspectRatio',
    );

    // The test clock is 2026-10-14 12:00 UTC.
    expect(_query(server), {
      'library_id': '1',
      'type': 'movie',
      'sort': '-release_date',
      'groups': jsonEncode([
        {
          'match': 'all',
          'rules': [
            {'field': 'release_date', 'op': 'lt', 'value': '2026-10-15'},
          ],
        },
      ]),
      'image_size': 'medium',
      'limit': '100',
    });
    final items = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(items.map((i) => i['Id']), ['movie-a', 'movie-b']);
    expect(items.first['PremiereDate'], startsWith('2026-10-10'));
    expect(items.first['ParentId'], '1');
    expect(page['TotalRecordCount'], 2);
  });

  test('watched titles leave when Silo\'s Home hides them', () async {
    final server = _server(hideWatched: true);
    await siloTestClient(
      server,
    ).itemsApi.getRecentlyReleasedItems(parentId: '1', limit: 20);
    expect(
      _query(server)['groups'],
      jsonEncode([
        {
          'match': 'all',
          'rules': [
            {'field': 'release_date', 'op': 'lt', 'value': '2026-10-15'},
          ],
        },
        {
          'match': 'any',
          'rules': [
            {'field': 'watched', 'op': 'is', 'value': false},
          ],
        },
      ]),
    );
  });

  test(
    'a TV library by the user\'s choice of series, season or episode',
    () async {
      Future<String?> scope(List<String>? types) async {
        final server = _server();
        await siloTestClient(server).itemsApi.getRecentlyReleasedItems(
          parentId: '3',
          includeItemTypes: types,
          recursive: types != null,
        );
        return _query(server)['type'];
      }

      expect(await scope(['Series']), 'series');
      // The catalog lists no seasons: a season row shows its series.
      expect(await scope(['Season']), 'series');
      expect(await scope(['Episode']), 'episode');
      // No types: the library's kind.
      expect(await scope(null), 'series');
    },
  );

  test('across the server, by type', () async {
    final server = _server();
    await siloTestClient(server).itemsApi.getRecentlyReleasedItems(
      includeItemTypes: ['Movie', 'Series'],
      recursive: true,
    );
    final q = _query(server);
    expect(q['type'], 'video');
    expect(q.containsKey('library_id'), isFalse);
  });

  test('nothing asked for types Silo lacks or a non-library parent', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    expect(
      (await api.getRecentlyReleasedItems(
        parentId: '1',
        includeItemTypes: ['MusicAlbum'],
      ))['Items'],
      isEmpty,
    );
    expect(
      (await api.getRecentlyReleasedItems(
        parentId: 'silo-collection:9',
      ))['Items'],
      isEmpty,
    );
    expect(server.requests, isEmpty);
  });
}
