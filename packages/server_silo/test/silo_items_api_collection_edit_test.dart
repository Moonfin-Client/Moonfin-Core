import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _listPath = '/api/v2/collections';
const _film = 'movie-imdb-tt0295701';
const _show = 'series-imdb-tt1641384';

ResponseBody _noContent(RequestOptions _) => ResponseBody.fromString('', 204);

Map<String, Object?> _collection(
  String id,
  String name, {
  String type = 'manual',
  String creator = 'p1',
}) => {
  'id': id,
  'name': name,
  'collection_type': type,
  'creator_profile_id': creator,
  'item_count': 3,
};

/// The profile's collections as `GET /collections` lists them: its own
/// manual ones, its own smart and imported ones, and another profile's
/// shared one.
FixtureServer _server([
  Map<String, ResponseBody Function(RequestOptions)> extra = const {},
]) => FixtureServer({
  _listPath: siloJson({
    'items': [
      _collection('c3', 'zombies'),
      _collection('c1', 'Christmas'),
      _collection('c2', 'Top rated', type: 'smart'),
      _collection('c4', 'IMDb 250', type: 'mdblist'),
      _collection('c5', 'Kids picks', creator: 'p2'),
    ],
    'groups': <Object>[],
  }),
  ...extra,
});

List<String> _paths(FixtureServer server) => [
  for (final r in server.requests)
    '${r.method} ${r.uri.path}${r.data == null ? '' : ' ${jsonEncode(r.data)}'}',
];

void main() {
  test('only the profile\'s own manual collections can be edited', () async {
    final client = siloTestClient(_server());
    final api = client.itemsApi as EditableCollectionsApi;
    final own = await api.getEditableCollections();
    expect(own.map((c) => c['Name']), ['Christmas', 'zombies']);
    expect(own.first['Id'], 'silo-collection:c1');
    expect(own.every(api.canEditCollection), isTrue);

    // Every collection the profile sees, as the collection rows list them.
    final all = await client.itemsApi.getItems(
      includeItemTypes: const ['BoxSet'],
    );
    final editable = {
      for (final c in (all['Items'] as List).cast<Map<String, dynamic>>())
        c['Name']: api.canEditCollection(c),
    };
    expect(editable, {
      'zombies': true,
      'Christmas': true,
      'Top rated': false,
      'IMDb 250': false,
      'Kids picks': false,
    });
  });

  test('a library\'s collection is never editable', () {
    final api =
        siloTestClient(FixtureServer({})).itemsApi as EditableCollectionsApi;
    expect(
      api.canEditCollection({
        'Id': 'silo-libcollection:1:c9',
        '_silo': _collection('c9', 'Marvel'),
      }),
      isFalse,
    );
  });

  test('nothing is editable while the profile is unknown', () async {
    final client = siloTestClient(_server())..profileId = null;
    final api = client.itemsApi as EditableCollectionsApi;
    expect(await api.getEditableCollections(), isEmpty);
  });

  test('a new collection, then the titles added to it', () async {
    final server = _server({'/api/v2/collections/c7/items/$_film': _noContent});
    final original = server.routes[_listPath]!;
    server.routes[_listPath] = (o) => o.method == 'POST'
        ? FixtureServer.json(201, jsonEncode(_collection('c7', 'Rainy day')))
        : original(o);
    final created = await siloTestClient(
      server,
    ).itemsApi.createCollection(name: ' Rainy day ', itemIds: [_film]);
    expect(created['Id'], 'silo-collection:c7');
    expect(created['Name'], 'Rainy day');
    expect(created['Type'], 'BoxSet');
    expect(_paths(server), [
      'POST /api/v2/collections {"name":"Rainy day","collection_type":"manual"}',
      'PUT /api/v2/collections/c7/items/$_film {"position":0}',
    ]);
  });

  test('adding and removing, one title at a time', () async {
    final server = FixtureServer({
      '/api/v2/collections/c1/items/$_film': _noContent,
      '/api/v2/collections/c1/items/$_show': _noContent,
    });
    final api = siloTestClient(server).itemsApi;
    await api.addToCollection('silo-collection:c1', [_film, _show]);
    await api.removeFromCollection('silo-collection:c1', [_show]);
    expect(_paths(server), [
      'PUT /api/v2/collections/c1/items/$_film {"position":0}',
      'PUT /api/v2/collections/c1/items/$_show {"position":0}',
      'DELETE /api/v2/collections/c1/items/$_show',
    ]);
  });

  test('a refusal stops the rest', () async {
    final server = FixtureServer({
      '/api/v2/collections/c2/items/$_film': (_) => FixtureServer.problem(
        409,
        'collection_not_manual',
        'Only manual collection membership can be edited',
      ),
    });
    await expectLater(
      siloTestClient(
        server,
      ).itemsApi.addToCollection('silo-collection:c2', [_film, _show]),
      throwsA(isA<DioException>()),
    );
    expect(server.requests, hasLength(1));
  });

  test('a library\'s collection is refused without a request', () {
    final server = FixtureServer({});
    expect(
      () => siloTestClient(
        server,
      ).itemsApi.addToCollection('silo-libcollection:1:c9', [_film]),
      throwsA(isA<UnsupportedError>()),
    );
    expect(server.requests, isEmpty);
  });
}
