import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _xxx = 'movie-imdb-tt0295701';

void main() {
  group('getItem', () {
    test('a movie: detail, versions, large artwork', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/$_xxx': FixtureServer.file(
          'silo/catalog_item_movie.json',
        ),
      });
      final client = siloTestClient(server);

      final item = await client.itemsApi.getItem(_xxx);

      expect(item['Id'], _xxx);
      expect(item['Name'], 'xXx');
      expect(item['Type'], 'Movie');
      expect(item['MediaSources'], hasLength(1));
      expect(item['People'], isNotEmpty);
      expect(server.requests, hasLength(1), reason: 'versions came along');
      expect(server.requests.single.uri.queryParameters['image_size'], 'large');
      expect(
        client.imageApi.getPrimaryImageUrl(
          _xxx,
          tag: (item['ImageTags'] as Map)['Primary'] as String,
        ),
        startsWith('https://silo.example/api/v2/artwork/'),
      );
    });

    test('versions are fetched when the detail has none', () async {
      final detail = siloFixture('catalog_item_movie.json')..remove('versions');
      final server = FixtureServer({
        '/api/v2/catalog/items/$_xxx': siloJson(detail),
        '/api/v2/catalog/items/$_xxx/versions': FixtureServer.file(
          'silo/catalog_versions_movie.json',
        ),
      });

      final item = await siloTestClient(server).itemsApi.getItem(_xxx);

      expect((item['MediaSources'] as List).single['Id'], '4598');
      expect(server.requests.map((r) => r.uri.path), [
        '/api/v2/catalog/items/$_xxx',
        '/api/v2/catalog/items/$_xxx/versions',
      ]);
    });

    test('a series has no versions to fetch', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/series-imdb-tt1641384': FixtureServer.file(
          'silo/catalog_item_series.json',
        ),
      });
      final item = await siloTestClient(
        server,
      ).itemsApi.getItem('series-imdb-tt1641384');
      expect(item['Type'], 'Series');
      expect(server.requests, hasLength(1));
    });

    test('mediaSourceId is sent as file_id', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/$_xxx': FixtureServer.file(
          'silo/catalog_item_movie.json',
        ),
      });
      await siloTestClient(
        server,
      ).itemsApi.getItem(_xxx, mediaSourceId: '4598');
      expect(server.requests.single.uri.queryParameters['file_id'], '4598');
    });

    test('a library id answers the library view', () async {
      final server = FixtureServer({
        '/api/v2/user/libraries': FixtureServer.file(
          'silo/user_libraries.json',
        ),
        '/api/v2/settings/values/effective': siloEffectiveSettings({}),
      });
      final library = await siloTestClient(server).itemsApi.getItem('3');
      expect(library['Name'], 'TV Shows');
      expect(library['CollectionType'], 'tvshows');
    });

    test('UserLibraryApi.getItem is the same', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/$_xxx': FixtureServer.file(
          'silo/catalog_item_movie.json',
        ),
      });
      final client = siloTestClient(server);
      expect((await client.userLibraryApi.getItem(_xxx))['Name'], 'xXx');
    });

    test('an item listed in a library knows its ParentId', () async {
      final server = FixtureServer({
        '/api/v2/catalog': siloJson({
          'items': [
            {'content_id': _xxx, 'type': 'movie', 'title': 'xXx'},
          ],
          'page': {'has_more': false},
        }),
        '/api/v2/catalog/items/$_xxx': FixtureServer.file(
          'silo/catalog_item_movie.json',
        ),
      });
      final api = siloTestClient(server).itemsApi;
      final page = await api.getItems(parentId: '1');
      expect((page['Items'] as List).single['ParentId'], '1');
      expect((await api.getItem(_xxx))['ParentId'], '1');
      expect(api.libraryOf(_xxx), '1');
    });
  });

  group('getItems(ids)', () {
    test('in the order asked; unknown ids left out', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/$_xxx': FixtureServer.file(
          'silo/catalog_item_movie.json',
        ),
        '/api/v2/catalog/items/series-imdb-tt1641384': FixtureServer.file(
          'silo/catalog_item_series.json',
        ),
      });
      final page = await siloTestClient(
        server,
      ).itemsApi.getItems(ids: ['series-imdb-tt1641384', 'movie-gone', _xxx]);
      expect((page['Items'] as List).map((i) => (i as Map)['Id']), [
        'series-imdb-tt1641384',
        _xxx,
      ]);
    });
  });

  group('one page, one read (perf)', () {
    FixtureServer movie() => FixtureServer({
      '/api/v2/catalog/items/$_xxx': FixtureServer.file(
        'silo/catalog_item_movie.json',
      ),
    });

    test('the page, its extras and its media info share the detail', () async {
      final server = movie();
      final client = siloTestClient(server);

      await Future.wait([
        client.itemsApi.getItem(_xxx),
        client.itemsApi.getSpecialFeatures(_xxx),
        client.playbackApi.getPlaybackInfo(_xxx),
      ]);
      await client.itemsApi.getItem(_xxx);

      expect(server.requests, hasLength(1));
    });

    test('each caller gets its own copy', () async {
      final client = siloTestClient(movie());

      final first = await client.itemsApi.getItem(_xxx);
      (first['MediaSources'] as List).clear();
      final second = await client.itemsApi.getItem(_xxx);

      expect(second['MediaSources'], hasLength(1));
    });

    test('a change to user data reads it again', () async {
      final server = movie();
      final client = siloTestClient(server);

      await client.itemsApi.getItem(_xxx);
      client.itemsApi.noteUserDataChanged(_xxx);
      await client.itemsApi.getItem(_xxx);

      expect(server.requests, hasLength(2));
    });
  });
}
