import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

Map<String, Object?> _libraries() => {
  'items': [
    {'id': '1', 'name': 'Movies', 'type': 'movies', 'sort_order': 1},
    {'id': '3', 'name': 'TV Shows', 'type': 'series', 'sort_order': 2},
    {'id': '5', 'name': 'Kids', 'type': 'mixed', 'sort_order': 3},
    {'id': '7', 'name': 'Podcasts', 'type': 'podcasts', 'sort_order': 4},
  ],
};

FixtureServer _server({
  Object? libraries,
  Map<String, Object?> settings = const {},
  bool settingsFail = false,
}) => FixtureServer({
  '/api/v2/user/libraries': siloJson(libraries ?? _libraries()),
  if (!settingsFail)
    '/api/v2/settings/values/effective': siloEffectiveSettings(settings),
});

List<String> _names(Map<String, dynamic> views) => [
  for (final v in (views['Items'] as List).cast<Map>()) v['Name'] as String,
];

void main() {
  test('the captured libraries, as Emby lists the same ones', () async {
    final server = FixtureServer({
      '/api/v2/user/libraries': FixtureServer.file('silo/user_libraries.json'),
      '/api/v2/settings/values/effective': siloEffectiveSettings({}),
    });
    final views = await siloTestClient(server).userViewsApi.getUserViews();

    expect(_names(views), ['Movies', 'TV Shows']);
    expect(views['TotalRecordCount'], 2);
    final items = (views['Items'] as List).cast<Map>();
    expect(items.map((v) => v['CollectionType']), ['movies', 'tvshows']);
    expect(items.first['Type'], 'CollectionFolder');
  });

  test('openable types only (podcasts left out until supported)', () async {
    final views = await siloTestClient(_server()).userViewsApi.getUserViews();
    expect(_names(views), ['Movies', 'TV Shows', 'Kids']);
  });

  test('the profile\'s order and hidden list apply', () async {
    final client = siloTestClient(
      _server(
        settings: {
          siloLibraryOrderKey: [5, 1],
          siloDisabledLibrariesKey: [3],
        },
      ),
    );

    expect(_names(await client.userViewsApi.getUserViews()), [
      'Kids',
      'Movies',
    ]);
  });

  test('includeHidden keeps hidden ones and asks Silo for them', () async {
    final server = _server(
      settings: {
        siloLibraryOrderKey: [3],
        siloDisabledLibrariesKey: [3],
      },
    );
    final client = siloTestClient(server);

    final views = await client.userViewsApi.getUserViews(includeHidden: true);

    expect(_names(views), ['TV Shows', 'Movies', 'Kids']);
    final request = server.requests.firstWhere(
      (r) => r.uri.path == '/api/v2/user/libraries',
    );
    expect(request.uri.queryParameters['include_hidden'], 'true');
  });

  test('without includeHidden Silo is not asked for hidden ones', () async {
    final server = _server();
    await siloTestClient(server).userViewsApi.getUserViews();
    final request = server.requests.firstWhere(
      (r) => r.uri.path == '/api/v2/user/libraries',
    );
    expect(request.uri.queryParameters, isNot(contains('include_hidden')));
  });

  test('settings that can\'t be read: Silo\'s order, unfiltered', () async {
    final views = await siloTestClient(
      _server(settingsFail: true),
    ).userViewsApi.getUserViews();
    expect(_names(views), ['Movies', 'TV Shows', 'Kids']);
  });

  test('cached; concurrent callers share one request', () async {
    final server = _server();
    final api = siloTestClient(server).userViewsApi;

    await Future.wait([api.getUserViews(), api.getUserViews()]);
    await api.getUserViews();

    expect(
      server.requests.where((r) => r.uri.path == '/api/v2/user/libraries'),
      hasLength(1),
    );
  });

  test('saving the library settings drops the cache', () async {
    final settings = <String, Object?>{
      siloLibraryOrderKey: null,
      siloDisabledLibrariesKey: null,
    };
    final server = FixtureServer({
      '/api/v2/user/libraries': siloJson(_libraries()),
      '/api/v2/settings/values/effective': siloEffectiveSettings(settings),
      '/api/v2/settings/values/$siloDisabledLibrariesKey': siloJson({}),
    });
    final client = siloTestClient(server);
    await client.userViewsApi.getUserViews();

    final config = await client.usersApi.getUserConfiguration();
    await client.usersApi.updateUserConfiguration(
      config.copyWith(myMediaExcludes: ['1']),
    );
    await client.userViewsApi.getUserViews();

    expect(
      server.requests.where((r) => r.uri.path == '/api/v2/user/libraries'),
      hasLength(2),
    );
  });

  test('library posters are registered for ImageApi', () async {
    final server = FixtureServer({
      '/api/v2/user/libraries': FixtureServer.file('silo/user_libraries.json'),
      '/api/v2/settings/values/effective': siloEffectiveSettings({}),
    });
    final client = siloTestClient(server);
    final views = await client.userViewsApi.getUserViews();
    final movies = (views['Items'] as List).first as Map;

    expect(
      client.imageApi.getPrimaryImageUrl(
        movies['Id'] as String,
        tag: (movies['ImageTags'] as Map)['Primary'] as String,
      ),
      contains('/library-posters/1.png'),
    );
  });
}
