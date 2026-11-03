import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

final _personal = {
  'items': [
    {
      'id': '01J9Z8C3W4R5T6Y7U8I9O0P1Q2',
      'name': 'Date night',
      'description': 'Films for two',
      'item_count': 12,
      'poster_url': '/api/v2/artwork/collections/a.webp?sig=1',
      'contains': true,
    },
    {
      'id': '01J9Z8C3W4R5T6Y7U8I9O0P1Q3',
      'name': 'Later',
      'item_count': 3,
      'poster_url': '',
      'contains': false,
    },
  ],
  'groups': [],
};

final _library = {
  'library_id': '1',
  'collections': [
    {
      'id': 'c-fast',
      'title': 'Fast & Furious',
      'item_count': 10,
      'poster_url': '/api/v2/artwork/collections/f.webp?sig=1',
      'backdrop_url': '/api/v2/artwork/collections/fb.webp?sig=1',
    },
  ],
  'groups': [],
};

FixtureServer _server() => FixtureServer({
  '/api/v2/collections': siloJson(_personal),
  '/api/v2/library/1/collections': siloJson(_library),
  '/api/v2/catalog': siloJson({
    'items': [
      {'content_id': 'movie-imdb-tt0295701', 'type': 'movie', 'title': 'xXx'},
    ],
    'page': {'has_more': false},
    'total': 1,
    'total_exact': true,
  }),
});

List<Map<String, dynamic>> _items(Map<String, dynamic> page) =>
    (page['Items'] as List).cast<Map<String, dynamic>>();

void main() {
  test('ids', () {
    expect(parseSiloCollectionId(siloCollectionId('01J')), (
      id: '01J',
      libraryId: null,
    ));
    expect(parseSiloCollectionId(siloLibraryCollectionId('1', 'c:x')), (
      id: 'c:x',
      libraryId: '1',
    ));
    expect(parseSiloCollectionId('movie-1'), isNull);
    expect(parseSiloCollectionId('silo-libcollection:1'), isNull);
  });

  test('personal collections as BoxSets', () async {
    final client = siloTestClient(_server());
    final page = await client.itemsApi.getItems(
      includeItemTypes: ['BoxSet'],
      recursive: true,
    );
    final boxes = _items(page);
    expect(boxes.map((b) => b['Name']), ['Date night', 'Later']);
    final first = boxes.first;
    expect(first['Id'], siloCollectionId('01J9Z8C3W4R5T6Y7U8I9O0P1Q2'));
    expect(first['Type'], 'BoxSet');
    expect(first['ChildCount'], 12);
    expect(first['Overview'], 'Films for two');
    expect(
      client.imageApi.getPrimaryImageUrl(
        first['Id'] as String,
        tag: (first['ImageTags'] as Map)['Primary'] as String,
      ),
      contains('/collections/a.webp'),
    );
    expect(boxes[1]['ImageTags'], isEmpty);
  });

  test('a library\'s collections', () async {
    final page = await siloTestClient(
      _server(),
    ).itemsApi.getItems(parentId: '1', includeItemTypes: ['BoxSet']);
    final box = _items(page).single;
    expect(box['Id'], siloLibraryCollectionId('1', 'c-fast'));
    expect(box['Name'], 'Fast & Furious');
    expect(box['BackdropImageTags'], hasLength(1));
    expect(box['ParentId'], '1');
  });

  test('a grid grouping collections still gets its films', () async {
    final server = _server();
    await siloTestClient(
      server,
    ).itemsApi.getItems(parentId: '1', includeItemTypes: ['Movie', 'BoxSet']);
    expect(server.requests.single.uri.path, '/api/v2/catalog');
  });

  test('a collection\'s titles page through the catalog', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;

    await api.getItems(
      parentId: siloCollectionId('01J9Z8C3W4R5T6Y7U8I9O0P1Q2'),
    );
    await api.getItems(parentId: siloLibraryCollectionId('1', 'c-fast'));

    final q1 = server.requests[0].uri.queryParameters;
    expect(q1['source'], 'user_collection');
    expect(q1['collection_id'], '01J9Z8C3W4R5T6Y7U8I9O0P1Q2');
    expect(q1, isNot(contains('library_id')));
    final q2 = server.requests[1].uri.queryParameters;
    expect(q2['source'], 'library_collection');
    expect(q2['collection_id'], 'c-fast');
    expect(q2['library_id'], '1');
  });

  test('a collection\'s page', () async {
    final api = siloTestClient(_server()).itemsApi;
    expect(
      (await api.getItem(siloLibraryCollectionId('1', 'c-fast')))['Name'],
      'Fast & Furious',
    );
    expect(
      (await api.getItem(
        siloCollectionId('01J9Z8C3W4R5T6Y7U8I9O0P1Q3'),
      ))['Name'],
      'Later',
    );
  });

  test('ancestors list the personal collections holding the item', () async {
    final server = _server();
    final ancestors = await siloTestClient(
      server,
    ).itemsApi.getAncestors('movie-imdb-tt0295701');
    expect(ancestors.map((a) => a['Name']), ['Date night']);
    expect(
      server.requests.single.uri.queryParameters['contains_item'],
      'movie-imdb-tt0295701',
    );
  });
}
