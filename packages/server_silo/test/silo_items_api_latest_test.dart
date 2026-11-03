import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _catalogPath = '/api/v2/catalog';

const _settingsPath = '/api/v2/settings/values/effective';

/// A catalog answering [count] titles of [type], the libraries list (Movies
/// is `1`, TV Shows `3`) and the profile's "hide watched items from Home"
/// setting ([hideWatched], or null when the setting can't be read).
FixtureServer _server({
  String type = 'movie',
  int count = 30,
  bool? hideWatched = false,
}) => FixtureServer({
  '/api/v2/user/libraries': FixtureServer.file('silo/user_libraries.json'),
  if (hideWatched != null)
    _settingsPath: siloEffectiveSettings({
      'home.hide_watched_items': hideWatched,
    }),
  _catalogPath: (RequestOptions o) => FixtureServer.json(
    200,
    jsonEncode({
      'items': [
        for (var i = 0; i < count; i++)
          {'content_id': '$type-$i', 'type': type, 'title': 'T$i'},
      ],
      'page': {'has_more': false},
      'total': count,
    }),
  ),
});

Map<String, String> _catalogQuery(FixtureServer server) => server.requests
    .singleWhere((r) => r.uri.path == _catalogPath)
    .uri
    .queryParameters;

final _unwatched = jsonEncode([
  {
    'match': 'any',
    'rules': [
      {'field': 'watched', 'op': 'is', 'value': false},
    ],
  },
]);

void main() {
  test('a TV library: shows by their newest episode', () async {
    final server = _server(type: 'series');
    final api = siloTestClient(server).itemsApi;
    final page = await api.getLatestItems(
      parentId: '3',
      limit: 80,
      fields: 'PrimaryImageAspectRatio',
      enableImageTypes: 'Primary,Backdrop,Thumb',
      imageTypeLimit: 1,
    );

    expect(_catalogQuery(server), {
      'library_id': '3',
      'type': 'series',
      'sort': '-latest_episode_added',
      'image_size': 'medium',
      'limit': '100',
    });
    final items = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(items, hasLength(30));
    expect(items.first['Type'], 'Series');
    expect(items.first['ParentId'], '3');
    expect(page['TotalRecordCount'], 30);
    expect(api.libraryOf('series-0'), '3');
  });

  test('a film library: films by when they arrived', () async {
    final server = _server();
    final page = await siloTestClient(
      server,
    ).itemsApi.getLatestItems(parentId: '1');
    final q = _catalogQuery(server);
    expect(q['type'], 'movie');
    expect(q['sort'], '-added_at');
    // Watched films stay, as on Silo's Home by default.
    expect(q.containsKey('groups'), isFalse);
    // Jellyfin's default of 20.
    expect(page['Items'], hasLength(20));
    expect(page['TotalRecordCount'], 20);
  });

  test(
    'watched titles follow Silo\'s "hide watched items from Home"',
    () async {
      Future<Map<String, String>> query(bool? hide) async {
        final server = _server(hideWatched: hide);
        final api = siloTestClient(server).itemsApi;
        await api.getLatestItems(parentId: '1');
        // The setting is read once for several rows. (The libraries list
        // reads other settings from the same path.)
        final reads = server.requests.where(
          (r) =>
              r.uri.path == _settingsPath &&
              r.uri.queryParameters['keys'] == 'home.hide_watched_items',
        );
        expect(reads, hasLength(1));
        expect(reads.single.uri.queryParametersAll['keys'], [
          'home.hide_watched_items',
        ]);
        return server.requests
            .firstWhere((r) => r.uri.path == _catalogPath)
            .uri
            .queryParameters;
      }

      expect((await query(true))['groups'], _unwatched);
      expect((await query(false)).containsKey('groups'), isFalse);
    },
  );

  test('a setting that can\'t be read hides nothing', () async {
    final server = _server(hideWatched: null);
    await siloTestClient(server).itemsApi.getLatestItems(parentId: '1');
    expect(_catalogQuery(server).containsKey('groups'), isFalse);
  });

  test('a mixed or unknown library: films and series by arrival', () async {
    final server = FixtureServer({
      _settingsPath: siloEffectiveSettings({'home.hide_watched_items': false}),
      '/api/v2/user/libraries': siloJson({
        'items': [
          {'id': '9', 'name': 'Everything', 'type': 'mixed'},
        ],
      }),
      _catalogPath: siloJson({
        'items': <Object>[],
        'page': {'has_more': false},
      }),
    });
    await siloTestClient(server).itemsApi.getLatestItems(parentId: '9');
    final q = _catalogQuery(server);
    expect(q['type'], 'video');
    expect(q['sort'], '-added_at');
  });

  test('by type across the server', () async {
    Future<Map<String, String>> query(List<String> types) async {
      final server = _server();
      await siloTestClient(
        server,
      ).itemsApi.getLatestItems(includeItemTypes: types, limit: 10);
      return _catalogQuery(server);
    }

    final films = await query(['Movie']);
    expect(films['type'], 'movie');
    expect(films.containsKey('library_id'), isFalse);
    // Episodes come as their shows, as Jellyfin groups them.
    expect((await query(['Episode']))['type'], 'series');
    expect((await query(['Series']))['sort'], '-latest_episode_added');
    expect((await query(['Movie', 'Series']))['type'], 'video');
  });

  test('nothing asked for types Silo lacks or a non-library parent', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    expect(
      (await api.getLatestItems(includeItemTypes: ['MusicAlbum']))['Items'],
      isEmpty,
    );
    expect(
      (await api.getLatestItems(parentId: 'series-imdb-tt1641384'))['Items'],
      isEmpty,
    );
    expect(server.requests, isEmpty);
  });
}
