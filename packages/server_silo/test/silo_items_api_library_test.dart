import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

/// A library of [count] movies served the way Silo pages: next cursors,
/// a window cursor and `seek`.
ResponseBody Function(RequestOptions) _library(int count) => (o) {
  final q = o.uri.queryParameters;
  final limit = int.parse(q['limit'] ?? '50');
  final cursor = q['cursor'];
  final start = cursor == null
      ? 0
      : cursor == 'window'
      ? int.parse(q['seek']!)
      : int.parse(cursor.substring('next-'.length));
  final end = start + limit > count ? count : start + limit;
  return siloJson({
    'window_cursor': 'window',
    'items': [
      for (var i = start; i < end; i++)
        {
          'content_id': 'movie-imdb-tt$i',
          'type': 'movie',
          'title': 'Film $i',
          'poster_url': '/api/v2/artwork/p/$i.webp?sig=x',
        },
    ],
    'page': {
      'has_more': end < count,
      if (end < count) 'next_cursor': 'next-$end',
    },
    'total': count,
    'total_exact': true,
  })(o);
};

List<RequestOptions> _catalog(FixtureServer s) =>
    s.requests.where((r) => r.uri.path == '/api/v2/catalog').toList();

void main() {
  test('the captured library page maps to Jellyfin items', () async {
    final server = FixtureServer({
      '/api/v2/catalog': FixtureServer.file('silo/catalog_library_page1.json'),
    });
    final client = siloTestClient(server);

    final page = await client.itemsApi.getItems(
      parentId: '1',
      includeItemTypes: ['Movie', 'BoxSet'],
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      startIndex: 0,
      limit: 5,
      recursive: true,
    );

    final items = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(items, hasLength(5));
    expect(page['TotalRecordCount'], 4611);
    expect(items.first['Type'], 'Movie');
    expect(items.first['ImageTags'], contains('Primary'));
    final q = _catalog(server).single.uri.queryParameters;
    expect(q['library_id'], '1');
    expect(q['type'], 'movie');
    expect(q['sort'], 'title');
    expect(q['image_size'], 'medium');
    // Silo binds cursors to the limit, so the pager always asks for its
    // fixed page size and trims.
    expect(q['limit'], '100');
    // Artwork is ready for the grid.
    final id = items.first['Id'] as String;
    expect(client.imageApi.getPrimaryImageUrl(id), startsWith('https://'));
  });

  test('TV libraries ask for series; mixed for movies and series', () async {
    final server = FixtureServer({'/api/v2/catalog': _library(3)});
    final api = siloTestClient(server).itemsApi;

    await api.getItems(parentId: '3', includeItemTypes: ['Series', 'BoxSet']);
    await api.getItems(parentId: '5', includeItemTypes: ['Movie', 'Series']);
    await api.getItems(parentId: '5');

    final types = _catalog(server).map((r) => r.uri.queryParameters['type']);
    expect(types, ['series', 'video', null]);
  });

  test('sort direction', () async {
    final server = FixtureServer({'/api/v2/catalog': _library(3)});
    await siloTestClient(server).itemsApi.getItems(
      parentId: '1',
      sortBy: 'DateCreated,SortName',
      sortOrder: 'Descending',
    );
    expect(_catalog(server).single.uri.queryParameters['sort'], '-added_at');
  });

  test('scrolling pages through next cursors, jumping seeks', () async {
    final server = FixtureServer({'/api/v2/catalog': _library(300)});
    final api = siloTestClient(server).itemsApi;
    Future<List<String>> ids(int start) async => [
      for (final i
          in ((await api.getItems(
                    parentId: '1',
                    includeItemTypes: ['Movie'],
                    startIndex: start,
                    limit: 100,
                  ))['Items']
                  as List)
              .cast<Map>())
        i['Name'] as String,
    ];

    expect((await ids(0)).first, 'Film 0');
    expect((await ids(100)).first, 'Film 100');
    expect((await ids(250)).first, 'Film 250');
    final cursors = _catalog(
      server,
    ).map((r) => r.uri.queryParameters['cursor']).toList();
    expect(cursors, [null, 'next-100', 'window']);
    expect(_catalog(server).last.uri.queryParameters['seek'], '250');
  });

  // BoxSet alone lists collections, so it isn't among these.
  test('only types Silo can\'t serve: empty, no request', () async {
    final server = FixtureServer({'/api/v2/catalog': _library(3)});
    final api = siloTestClient(server).itemsApi;

    for (final types in [
      ['MusicAlbum'],
      ['Playlist'],
      ['Audio', 'MusicArtist'],
      ['TvChannel'],
    ]) {
      final page = await api.getItems(includeItemTypes: types);
      expect(page['Items'], isEmpty, reason: '$types');
      expect(page['TotalRecordCount'], 0);
    }
    expect(server.requests, isEmpty);
  });

  test('excluded types and types Moonfin can\'t open are dropped', () async {
    final server = FixtureServer({
      '/api/v2/catalog': siloJson({
        'items': [
          {'content_id': 'movie-1', 'type': 'movie', 'title': 'A'},
          {'content_id': 'series-2', 'type': 'series', 'title': 'B'},
          {'content_id': 'ab-3', 'type': 'audiobook', 'title': 'C'},
          {'content_id': 'pod-4', 'type': 'podcast', 'title': 'D'},
        ],
        'page': {'has_more': false},
      }),
    });
    final page = await siloTestClient(
      server,
    ).itemsApi.getItems(parentId: '5', excludeItemTypes: ['Series']);
    expect((page['Items'] as List).map((i) => (i as Map)['Name']), ['A']);
  });

  test('what Silo lacks names itself', () async {
    final api = siloTestClient(FixtureServer({})).itemsApi;
    expect(
      () => api.deleteItem('movie-1'),
      throwsA(
        isA<UnsupportedError>().having(
          (e) => e.message,
          'message',
          'ItemsApi.deleteItem is not supported on Silo',
        ),
      ),
    );
  });

  test('music and playlists answer empty', () async {
    final api = siloTestClient(FixtureServer({})).itemsApi;
    expect((await api.getPlaylists())['Items'], isEmpty);
    expect((await api.getArtists())['Items'], isEmpty);
    expect((await api.getAlbumArtists())['Items'], isEmpty);
    expect(
      () => api.addToPlaylist('p', ['i']),
      throwsA(isA<UnsupportedError>()),
    );
  });
}
