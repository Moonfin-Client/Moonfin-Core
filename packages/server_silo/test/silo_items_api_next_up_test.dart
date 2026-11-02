import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _layoutPath = '/api/v2/home/layout';
const _cwPath = '/api/v2/home/sections/146552064640566580/items';
const _seriesPath = '/api/v2/catalog/items/series-imdb-tt1641384';
const _episodePath = '/api/v2/catalog/items/episode-imdb-tt1641384-1-1';

FixtureServer _server({
  ResponseBody Function(RequestOptions)? layout,
  Map<String, ResponseBody Function(RequestOptions)> extra = const {},
}) => FixtureServer({
  _layoutPath: layout ?? FixtureServer.file('silo/home_layout.json'),
  _cwPath: FixtureServer.file('silo/home_continue_watching.json'),
  ...extra,
});

List<Map<String, dynamic>> _items(Map<String, dynamic> page) =>
    (page['Items'] as List).cast<Map<String, dynamic>>();

List<String> _paths(FixtureServer server) => [
  for (final r in server.requests) r.uri.path,
];

Map<String, Object?> _card(
  String id, {
  String source = 'next_up',
  num? position,
  String type = 'episode',
}) => {
  'content_id': id,
  'type': type,
  'title': id,
  'series_id': 'series-x',
  'series_title': 'X',
  'season_number': 1,
  'episode_number': 1,
  'item_source': source,
  'position_seconds': ?position,
};

void main() {
  test('next episodes from the Continue Watching section', () async {
    final server = _server();
    final page = await siloTestClient(server).itemsApi.getNextUp(
      limit: 50,
      enableResumable: false,
      nextUpDateCutoff: DateTime.utc(2026, 1, 1),
      fields: 'PrimaryImageAspectRatio',
    );

    // Silo's default (`ui.next_up_mode` combined) puts them in Continue
    // Watching as next_up cards. The started film and episode stay in the
    // Continue Watching row.
    expect(_paths(server), [_layoutPath, _cwPath]);
    final items = _items(page);
    expect(items.map((i) => i['Id']), [
      'episode-imdb-tt0472954-17-1',
      'episode-imdb-tt14403178-2-5',
    ]);
    expect(page['TotalRecordCount'], 2);
    final sunny = items.first;
    expect(sunny['Type'], 'Episode');
    expect(sunny['SeriesId'], 'series-imdb-tt0472954');
    expect(sunny['SeriesName'], "It's Always Sunny in Philadelphia");
    expect(sunny['ParentIndexNumber'], 17);
    expect(sunny['IndexNumber'], 1);
    expect((sunny['UserData'] as Map)['PlaybackPositionTicks'], 0);
  });

  test('Continue Watching and Next Up share one read', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    await Future.wait([
      api.getResumeItems(mediaTypes: 'Video'),
      api.getNextUp(enableResumable: false),
    ]);
    expect(_paths(server), [_layoutPath, _cwPath]);
  });

  test('a separate Next Up section is read too', () async {
    final server = FixtureServer({
      _layoutPath: siloJson({
        'sections': [
          {'id': 'cw', 'section_type': 'continue_watching', 'title': 'CW'},
          {'id': 'nu', 'section_type': 'next_up', 'title': 'On Deck'},
        ],
      }),
      // Silo's `separate` mode: Continue Watching holds only started items.
      '/api/v2/home/sections/cw/items': siloJson({
        'items': [_card('episode-a-1-1', source: 'in_progress', position: 30)],
      }),
      '/api/v2/home/sections/nu/items': siloJson({
        'items': [
          _card('episode-b-1-2'),
          _card('episode-c-2-1'),
          _card('movie-d', type: 'movie'),
        ],
      }),
    });
    final page = await siloTestClient(server).itemsApi.getNextUp();
    expect(_items(page).map((i) => i['Id']), [
      'episode-b-1-2',
      'episode-c-2-1',
    ]);
  });

  test('a page with neither section answers empty', () async {
    final server = FixtureServer({
      _layoutPath: siloJson({
        'sections': [
          {'id': 'tr', 'section_type': 'trending_on_server', 'title': 'T'},
        ],
      }),
    });
    final page = await siloTestClient(server).itemsApi.getNextUp();
    expect(page['Items'], isEmpty);
    expect(_paths(server), [_layoutPath]);
  });

  test('enableResumable: false leaves out a started episode', () async {
    final server = FixtureServer({
      _layoutPath: siloJson({
        'sections': [
          {'id': 'nu', 'section_type': 'next_up', 'title': 'Next'},
        ],
      }),
      '/api/v2/home/sections/nu/items': siloJson({
        'items': [
          _card('episode-a-1-1', position: 120),
          _card('episode-b-1-1'),
        ],
      }),
    });
    final api = siloTestClient(server).itemsApi;
    final strict = await api.getNextUp(enableResumable: false);
    expect(_items(strict).map((i) => i['Id']), ['episode-b-1-1']);
    final all = await api.getNextUp();
    expect(_items(all).map((i) => i['Id']), ['episode-a-1-1', 'episode-b-1-1']);
  });

  test('a library row reads the library page', () async {
    const libLayout = '/api/v2/library/7/layout';
    const libCw = '/api/v2/library/7/sections/default-continue-watching/items';
    final server = FixtureServer({
      libLayout: siloJson({
        'sections': [
          {
            'id': 'default-continue-watching',
            'section_type': 'continue_watching',
            'title': 'Continue Watching',
          },
        ],
      }),
      libCw: FixtureServer.file('silo/home_continue_watching.json'),
    });
    final api = siloTestClient(server).itemsApi;
    final page = await api.getNextUp(parentId: '7');
    expect(_items(page), hasLength(2));
    // An episode's parent stays its season, and the library is remembered
    // for the ancestors.
    expect(_items(page).first['ParentId'], 'season-imdb-tt0472954-17');
    expect(api.libraryOf('episode-imdb-tt0472954-17-1'), '7');
    expect(_paths(server), [libLayout, libCw]);
  });

  group('one series', () {
    FixtureServer seriesServer({Map<String, Object?>? episodeChanges}) =>
        FixtureServer({
          _seriesPath: FixtureServer.file('silo/catalog_item_series.json'),
          _episodePath: episodeChanges == null
              ? FixtureServer.file('silo/catalog_item_episode.json')
              : siloJson({
                  ...siloFixture('catalog_item_episode.json'),
                  ...episodeChanges,
                }),
        });

    test('the episode Silo would play next', () async {
      final server = seriesServer();
      final page = await siloTestClient(server).itemsApi.getNextUp(
        seriesId: 'series-imdb-tt1641384',
        limit: 1,
        fields: 'Overview',
      );
      // The series' play_content_id is S01E01.
      expect(_paths(server), [_seriesPath, _episodePath]);
      final episode = _items(page).single;
      expect(episode['Id'], 'episode-imdb-tt1641384-1-1');
      expect(episode['Type'], 'Episode');
      expect(episode['MediaSources'], isNotEmpty);
    });

    test('nothing when that episode was watched', () async {
      final server = seriesServer(
        episodeChanges: {
          'user_state': {'played': true},
        },
      );
      final page = await siloTestClient(
        server,
      ).itemsApi.getNextUp(seriesId: 'series-imdb-tt1641384');
      expect(page['Items'], isEmpty);
    });

    test('nothing when Silo names no episode', () async {
      final series = siloFixture('catalog_item_series.json')
        ..remove('play_content_id');
      final server = FixtureServer({
        _seriesPath: (_) => FixtureServer.json(200, jsonEncode(series)),
      });
      final api = siloTestClient(server).itemsApi;
      final page = await api.getNextUp(seriesId: 'series-imdb-tt1641384');
      expect(page['Items'], isEmpty);
      expect(_paths(server), [_seriesPath]);

      // A film has no next episode: nothing is asked.
      final film = await api.getNextUp(seriesId: 'movie-imdb-tt0295701');
      expect(film['Items'], isEmpty);
      expect(server.requests, hasLength(1));
    });
  });
}
