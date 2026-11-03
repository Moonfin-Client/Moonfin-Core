import 'package:dio/dio.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _layoutPath = '/api/v2/home/layout';
const _cwId = '146552064640566580';
const _cwPath = '/api/v2/home/sections/$_cwId/items';

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

void main() {
  test('films and episodes part way through, from the home section', () async {
    final server = _server();
    final client = siloTestClient(server);
    final page = await client.itemsApi.getResumeItems(
      mediaTypes: 'Video',
      limit: 50,
      fields: 'PrimaryImageAspectRatio,Overview',
      enableImageTypes: 'Primary,Backdrop,Thumb',
      imageTypeLimit: 1,
    );

    expect(_paths(server), [_layoutPath, _cwPath]);
    expect(server.requests.last.uri.queryParameters, {'image_size': 'medium'});

    // The section also holds each show's next episode (item_source
    // next_up), and those belong to Next Up.
    final items = _items(page);
    expect(items.map((i) => i['Id']), [
      'movie-imdb-tt2518788',
      'episode-imdb-tt1641384-1-2',
    ]);
    expect(page['TotalRecordCount'], 2);
    expect(page['StartIndex'], 0);

    final film = items.first;
    expect(film['Type'], 'Movie');
    final filmData = film['UserData'] as Map;
    expect(filmData['PlaybackPositionTicks'], 18005000000);
    expect(filmData['PlayedPercentage'], closeTo(26.79, 0.01));
    expect(filmData['Played'], false);
    expect(filmData['LastPlayedDate'], '2026-10-14T20:15:00.0000000Z');
    expect(
      client.imageApi.getPrimaryImageUrl(
        film['Id'] as String,
        tag: (film['ImageTags'] as Map)['Primary'] as String,
      ),
      contains('/tmdb/movies/217316/poster/'),
    );

    final episode = items.last;
    expect(episode['Type'], 'Episode');
    expect(episode['SeriesId'], 'series-imdb-tt1641384');
    expect(episode['SeriesName'], 'Young Justice');
    expect(episode['ParentIndexNumber'], 1);
    expect(episode['IndexNumber'], 2);
    expect((episode['UserData'] as Map)['PlaybackPositionTicks'], 5820800000);
  });

  test('types narrow the row; audio asks nothing', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    final films = await api.getResumeItems(includeItemTypes: ['Movie']);
    expect(_items(films).map((i) => i['Type']), ['Movie']);

    final audio = await api.getResumeItems(mediaTypes: 'Audio');
    expect(audio['Items'], isEmpty);
    expect(_paths(server), [
      _layoutPath,
      _cwPath,
    ], reason: 'the audio row made no request');
  });

  test('startIndex and limit slice the row', () async {
    final api = siloTestClient(_server()).itemsApi;
    final second = await api.getResumeItems(startIndex: 1, limit: 1);
    expect(_items(second).map((i) => i['Id']), ['episode-imdb-tt1641384-1-2']);
    expect(second['TotalRecordCount'], 2);
    expect(second['StartIndex'], 1);
  });

  test('rows loading together share one read of the section', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    await Future.wait([api.getResumeItems(), api.getResumeItems(limit: 5)]);
    expect(_paths(server), [_layoutPath, _cwPath]);
  });

  test('every Continue Watching section on the page counts', () async {
    final server = _server(
      layout: siloJson({
        'sections': [
          {'id': 'a', 'section_type': 'continue_watching', 'title': 'A'},
          {'id': 'b', 'section_type': 'trending_on_server', 'title': 'B'},
          {'id': 'c', 'section_type': 'continue_watching', 'title': 'C'},
        ],
        'included_sections': <Object>[],
      }),
      extra: {
        '/api/v2/home/sections/a/items': siloJson({
          'items': [
            {
              'content_id': 'movie-1',
              'type': 'movie',
              'title': 'One',
              'item_source': 'in_progress',
              'position_seconds': 60,
            },
          ],
        }),
        '/api/v2/home/sections/c/items': siloJson({
          'items': [
            {
              'content_id': 'ab-1',
              'type': 'audiobook',
              'title': 'Book',
              'item_source': 'in_progress',
            },
            {'content_id': 'movie-1', 'type': 'movie', 'title': 'One'},
            {'content_id': 'movie-2', 'type': 'movie', 'title': 'Two'},
          ],
        }),
      },
    );
    final page = await siloTestClient(server).itemsApi.getResumeItems();
    // The audiobook is left out, and the repeated film shows once.
    expect(_items(page).map((i) => i['Name']), ['One', 'Two']);
    expect(
      _paths(server),
      isNot(contains('/api/v2/home/sections/b/items')),
      reason: 'other sections are not read',
    );
  });

  test('a library row reads the library page', () async {
    const libLayout = '/api/v2/library/5/layout';
    const libCw = '/api/v2/library/5/sections/default-continue-watching/items';
    final server = FixtureServer({
      libLayout: siloJson({
        'sections': [
          {
            'id': 'default-continue-watching',
            'section_type': 'continue_watching',
            'title': 'Continue Watching',
          },
          {
            'id': 'default-recently-added',
            'section_type': 'recently_added',
            'title': 'Recently Added',
          },
        ],
      }),
      libCw: FixtureServer.file('silo/home_continue_watching.json'),
    });
    final api = siloTestClient(server).itemsApi;
    final page = await api.getResumeItems(parentId: '5');
    expect(_paths(server), [libLayout, libCw]);
    expect(_items(page), hasLength(2));
    expect(_items(page).first['ParentId'], '5');
    expect(api.libraryOf('movie-imdb-tt2518788'), '5');

    // Anything other than a library has nothing to resume on Silo.
    final none = await api.getResumeItems(parentId: 'series-imdb-tt1641384');
    expect(none['Items'], isEmpty);
    expect(server.requests, hasLength(2));
  });

  test('without the section, the resume points are read', () async {
    final server = FixtureServer({
      '/api/v2/library/5/layout': siloJson({'sections': <Object>[]}),
      '/api/v2/progress': siloJson({
        'items': [
          {
            'media_item_id': 'episode-imdb-tt1641384-1-1',
            'position_seconds': 300,
            'duration_seconds': 1200,
            'completed': false,
            'updated_at': '2026-10-14T10:00:00.000Z',
          },
          {
            'media_item_id': 'movie-gone',
            'position_seconds': 100,
            'duration_seconds': 6000,
            'completed': false,
            'updated_at': '2026-10-13T10:00:00.000Z',
          },
        ],
        'page': {'has_more': false},
      }),
      '/api/v2/catalog/items/episode-imdb-tt1641384-1-1': FixtureServer.file(
        'silo/catalog_item_episode.json',
      ),
    });
    final page = await siloTestClient(
      server,
    ).itemsApi.getResumeItems(parentId: '5', limit: 12);

    final progress = server.requests.singleWhere(
      (r) => r.uri.path == '/api/v2/progress',
    );
    expect(progress.uri.queryParameters, {
      'status': 'in_progress',
      'library_id': '5',
      'limit': '12',
    });
    // An item Silo no longer has is left out.
    final items = _items(page);
    expect(items.map((i) => i['Id']), ['episode-imdb-tt1641384-1-1']);
    final data = items.single['UserData'] as Map;
    expect(data['PlaybackPositionTicks'], 3000000000);
    expect(data['PlayedPercentage'], 25);
    expect(data['LastPlayedDate'], '2026-10-14T10:00:00.0000000Z');
  });

  test('errors reach the caller', () async {
    final server = _server(
      layout: (_) => FixtureServer.problem(503, 'unavailable', 'down'),
    );
    await expectLater(
      siloTestClient(server).itemsApi.getResumeItems(),
      throwsA(isA<DioException>()),
    );
  });

  test('a card\'s resume point maps without the section', () {
    final item = siloItemToBaseItemDto({
      'content_id': 'movie-1',
      'type': 'movie',
      'title': 'One',
      'position_seconds': 90,
      'duration_seconds': 360,
      'user_state': {'played': false},
    });
    expect((item!['UserData'] as Map)['PlayedPercentage'], 25);
  });
}
