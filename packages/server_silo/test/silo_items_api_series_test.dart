import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _series = 'series-imdb-tt1641384';
const _season1 = 'season-imdb-tt1641384-1';

FixtureServer _server() => FixtureServer({
  '/api/v2/catalog/items/$_series': FixtureServer.file(
    'silo/catalog_item_series.json',
  ),
  '/api/v2/catalog/series/$_series/seasons': FixtureServer.file(
    'silo/series_seasons.json',
  ),
  '/api/v2/catalog/items/$_season1/episodes': FixtureServer.file(
    'silo/season_episodes.json',
  ),
});

List<Map<String, dynamic>> _items(Map<String, dynamic> page) =>
    (page['Items'] as List).cast<Map<String, dynamic>>();

void main() {
  group('getSeasons', () {
    test('the captured seasons, as Emby lists them', () async {
      final server = _server();
      final client = siloTestClient(server);
      await client.itemsApi.getItem(_series);

      final seasons = _items(await client.itemsApi.getSeasons(_series));
      final emby = _items(siloEmbyFixture('series_seasons.json'));

      expect(seasons.map((s) => s['Name']), emby.map((s) => s['Name']));
      expect(
        seasons.map((s) => s['IndexNumber']),
        emby.map((s) => s['IndexNumber']),
      );
      final first = seasons.first;
      expect(first['Id'], _season1);
      expect(first['Type'], 'Season');
      expect(first['SeriesId'], _series);
      expect(first['SeriesName'], 'Young Justice');
      expect(
        (first['UserData'] as Map)['UnplayedItemCount'],
        (emby.first['UserData'] as Map)['UnplayedItemCount'],
      );
      expect(first['ImageTags'], contains('Primary'));
      final q = server.requests.last.uri.queryParameters;
      expect(q['include_artwork'], 'true');
      expect(q['image_size'], 'medium');
    });

    test('a series as parentId lists its seasons', () async {
      final page = await siloTestClient(
        _server(),
      ).itemsApi.getItems(parentId: _series);
      expect(_items(page), hasLength(4));
    });

    test('a season by id comes from its series\' list', () async {
      final server = _server();
      final season = await siloTestClient(server).itemsApi.getItem(_season1);
      expect(season['Name'], 'Season 1');
      expect(server.requests.single.uri.path, endsWith('/seasons'));
    });

    test('a season that isn\'t there', () async {
      expect(
        () => siloTestClient(
          _server(),
        ).itemsApi.getItem('season-imdb-tt1641384-9'),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('getEpisodes', () {
    test('a season\'s episodes, as Emby lists them', () async {
      final server = _server();
      final client = siloTestClient(server);
      await client.itemsApi.getItem(_series);

      final episodes = _items(
        await client.itemsApi.getEpisodes(_series, seasonId: _season1),
      );
      final emby = _items(siloEmbyFixture('season_episodes.json'));

      expect(episodes.map((e) => e['Name']), emby.map((e) => e['Name']));
      expect(
        episodes.map((e) => e['IndexNumber']),
        emby.map((e) => e['IndexNumber']),
      );
      final first = episodes.first;
      expect(first['Type'], 'Episode');
      expect(first['SeriesId'], _series);
      expect(first['SeasonId'], _season1);
      expect(first['SeriesName'], 'Young Justice');
      expect(first['ParentIndexNumber'], 1);
      expect(first['MediaSources'], hasLength(1));
      expect(
        server.requests.last.uri.path,
        '/api/v2/catalog/items/$_season1/episodes',
      );
    });

    test('a season as parentId lists its episodes', () async {
      final page = await siloTestClient(
        _server(),
      ).itemsApi.getItems(parentId: _season1);
      expect(_items(page), hasLength(3));
    });

    test('no season: every season\'s episodes, in season order', () async {
      final server = FixtureServer({
        '/api/v2/catalog/series/$_series/seasons': siloJson({
          'items': [
            {
              'content_id': '${_season1.replaceFirst('-1', '-0')}',
              'season_number': 0,
            },
            {'content_id': _season1, 'season_number': 1},
          ],
        }),
        '/api/v2/catalog/items/season-imdb-tt1641384-0/episodes': siloJson({
          'items': [
            {
              'content_id': 'episode-imdb-tt1641384-0-1',
              'season_number': 0,
              'episode_number': 1,
              'title': 'Special',
            },
          ],
        }),
        '/api/v2/catalog/items/$_season1/episodes': FixtureServer.file(
          'silo/season_episodes.json',
        ),
      });
      final episodes = _items(
        await siloTestClient(server).itemsApi.getEpisodes(_series),
      );
      expect(episodes, hasLength(4));
      expect(episodes.first['Name'], 'Special');
      expect(episodes[1]['IndexNumber'], 1);
    });
  });
}
