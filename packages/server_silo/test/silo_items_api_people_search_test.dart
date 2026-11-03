import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _peoplePath = '/api/v2/catalog/people';

FixtureServer _server({
  ResponseBody Function(RequestOptions)? capabilities,
  ResponseBody Function(RequestOptions)? people,
}) => FixtureServer({
  '/api/v2/catalog/search/capabilities':
      capabilities ?? FixtureServer.file('silo/search_capabilities.json'),
  _peoplePath: people ?? FixtureServer.file('silo/people_search.json'),
});

Map<String, String> _peopleQuery(FixtureServer server) => server.requests
    .singleWhere((r) => r.uri.path == _peoplePath)
    .uri
    .queryParameters;

void main() {
  test('people by name, with photos and provider ids', () async {
    final server = _server();
    final client = siloTestClient(server);
    final page = await client.itemsApi.getPersons(
      searchTerm: ' vin ',
      limit: 24,
      fields: 'PrimaryImageAspectRatio',
      enableImageTypes: 'Primary',
    );

    expect(_peopleQuery(server), {
      'q': 'vin',
      'limit': '24',
      'media_scope': 'video_with_episodes',
    });
    // Silo matches word starts and lists them by name, so "vin" brings
    // Vincents before Vin Diesel.
    final people = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(page['TotalRecordCount'], 5);
    expect(people.map((p) => p['Name']), [
      'Alex Vincent',
      'Allen Vincent',
      'Altair Vincent',
      'Anne Vince',
      'Bernard Vincent',
    ]);
    expect(people.map((p) => p['Type']).toSet(), {'Person'});

    final alex = people.first;
    expect(alex['Id'], '146552330928538932');
    expect((alex['ProviderIds'] as Map)['Tmdb'], '65683');
    expect(
      client.imageApi.getPrimaryImageUrl(
        alex['Id'] as String,
        tag: (alex['ImageTags'] as Map)['Primary'] as String,
      ),
      contains('/people/65683/profile/'),
    );
    expect(people[2]['ImageTags'], isEmpty, reason: 'no photo');
  });

  test('media scope follows the capabilities', () async {
    Future<String?> scope(Map<String, Object?> caps) async {
      final server = _server(capabilities: siloJson(caps));
      await siloTestClient(server).itemsApi.getPersons(searchTerm: 'vin');
      return _peopleQuery(server)['media_scope'];
    }

    const base = {'revision': 'r', 'state': 'available', 'allowed': true};
    expect(
      await scope({...base, 'people_media_scope': true}),
      'video',
      reason: 'no episodes scope',
    );
    expect(
      await scope({...base, 'video_with_episodes_scope': true}),
      isNull,
      reason: 'people search takes no scope',
    );
  });

  test('limit: Silo\'s maximum, or its default', () async {
    var server = _server();
    await siloTestClient(
      server,
    ).itemsApi.getPersons(searchTerm: 'vin', limit: 500);
    expect(_peopleQuery(server)['limit'], '100');

    server = _server();
    await siloTestClient(server).itemsApi.getPersons(searchTerm: 'vin');
    expect(_peopleQuery(server), isNot(contains('limit')));
  });

  test('a blank term lists the first people', () async {
    final server = _server();
    await siloTestClient(server).itemsApi.getPersons(searchTerm: '  ');
    expect(_peopleQuery(server), isNot(contains('q')));
  });

  test('no request when search is not allowed', () async {
    final server = _server(
      capabilities: siloJson({
        'revision': 'r',
        'state': 'available',
        'allowed': false,
      }),
    );
    final page = await siloTestClient(
      server,
    ).itemsApi.getPersons(searchTerm: 'vin');
    expect(page['Items'], isEmpty);
    expect(server.requests.where((r) => r.uri.path == _peoplePath), isEmpty);
  });

  test('entries without an id are skipped', () async {
    final server = _server(
      people: siloJson({
        'items': [
          {'name': 'Nobody'},
          {'id': '7', 'name': 'Al Pacino'},
        ],
      }),
    );
    final page = await siloTestClient(
      server,
    ).itemsApi.getPersons(searchTerm: 'al');
    expect((page['Items'] as List).map((p) => (p as Map)['Name']), [
      'Al Pacino',
    ]);
  });

  test('errors reach the caller', () async {
    final server = _server(
      people: (_) => FixtureServer.problem(500, 'internal', 'boom'),
    );
    await expectLater(
      siloTestClient(server).itemsApi.getPersons(searchTerm: 'vin'),
      throwsA(anything),
    );
  });
}
