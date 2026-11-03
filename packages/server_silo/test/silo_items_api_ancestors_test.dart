import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _series = 'series-imdb-tt1641384';

FixtureServer _server() => FixtureServer({
  '/api/v2/catalog': siloJson({
    'items': [
      {'content_id': _series, 'type': 'series', 'title': 'Young Justice'},
      {'content_id': 'movie-imdb-tt0295701', 'type': 'movie', 'title': 'xXx'},
    ],
    'page': {'has_more': false},
  }),
  '/api/v2/user/libraries': FixtureServer.file('silo/user_libraries.json'),
  '/api/v2/settings/values/effective': siloEffectiveSettings({}),
});

List<(String?, String?)> _shape(List<Map<String, dynamic>> list) => [
  for (final a in list) (a['Type'] as String?, a['Name'] as String?),
];

void main() {
  test('ids parse', () {
    expect(parseSiloEpisodeId('episode-imdb-tt1641384-1-12'), (
      seriesId: _series,
      seasonNumber: 1,
      episodeNumber: 12,
    ));
    expect(
      parseSiloEpisodeId('episode-tvdb-192061-0-3')?.seriesId,
      'series-tvdb-192061',
    );
    expect(parseSiloEpisodeId('movie-imdb-tt1'), isNull);
    expect(parseSiloEpisodeId('episode-x'), isNull);
  });

  test(
    'an episode: season, series, library, with no request of its own',
    () async {
      final server = _server();
      final api = siloTestClient(server).itemsApi;
      await api.getItems(parentId: '3');
      final before = server.requests.length;

      final ancestors = await api.getAncestors('episode-imdb-tt1641384-1-1');

      expect(_shape(ancestors), [
        ('Season', 'Season 1'),
        ('Series', 'Young Justice'),
        ('CollectionFolder', 'TV Shows'),
      ]);
      expect(ancestors.first['Id'], 'season-imdb-tt1641384-1');
      expect(
        server.requests
            .skip(before)
            .where((r) => r.uri.path.contains('catalog')),
        isEmpty,
      );
    },
  );

  test('a season of specials; a film', () async {
    final api = siloTestClient(_server()).itemsApi;
    await api.getItems(parentId: '1');

    expect(_shape(await api.getAncestors('episode-imdb-tt9-0-2')).first, (
      'Season',
      'Specials',
    ));
    // The fake library lists the series too, so it is its library.
    expect(_shape(await api.getAncestors('season-imdb-tt1641384-2')), [
      ('Series', 'Young Justice'),
      ('CollectionFolder', 'Movies'),
    ]);
    expect(_shape(await api.getAncestors('movie-imdb-tt0295701')), [
      ('CollectionFolder', 'Movies'),
    ]);
  });

  test('nothing known: no ancestors', () async {
    final api = siloTestClient(FixtureServer({})).itemsApi;
    expect(await api.getAncestors('movie-imdb-tt1'), isEmpty);
  });
}
