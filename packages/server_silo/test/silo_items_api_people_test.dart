import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _vin = '146552272560604468';

FixtureServer _server() => FixtureServer({
  '/api/v2/user/libraries': FixtureServer.file('silo/user_libraries.json'),
  '/api/v2/settings/values/effective': siloEffectiveSettings({}),
  '/api/v2/catalog/people/$_vin': FixtureServer.file('silo/person.json'),
  '/api/v2/catalog': siloJson({
    'items': [
      {'content_id': 'movie-imdb-tt0295701', 'type': 'movie', 'title': 'xXx'},
      {'content_id': 'series-x', 'type': 'series', 'title': 'Show'},
    ],
    'page': {'has_more': false},
  }),
});

void main() {
  test('a person\'s page', () async {
    final client = siloTestClient(_server());
    final person = await client.itemsApi.getItem(_vin);

    expect(person['Type'], 'Person');
    expect(person['Name'], 'Vin Diesel');
    expect(person['Overview'], startsWith('Mark Sinclair'));
    expect(person['PremiereDate'], '1967-07-18T00:00:00.0000000Z');
    expect(person, isNot(contains('EndDate')));
    expect(person['ProductionLocations'], ['Alameda County, California, USA']);
    expect(person['ProviderIds'], {
      'Imdb': 'nm0004874',
      'Tmdb': '12835',
      'Tvdb': '310526',
    });
    expect(
      client.imageApi.getPrimaryImageUrl(
        _vin,
        tag: (person['ImageTags'] as Map)['Primary'] as String,
      ),
      contains('/people/12835/profile/'),
    );
  });

  test('a library id still answers the library', () async {
    final library = await siloTestClient(_server()).itemsApi.getItem('1');
    expect(library['Type'], 'CollectionFolder');
  });

  test('filmography: source=person, newest first', () async {
    final server = _server();
    final page = await siloTestClient(server).itemsApi.getItems(
      personIds: [_vin],
      includeItemTypes: ['Movie', 'Series', 'MusicVideo', 'Episode'],
      sortBy: 'PremiereDate',
      sortOrder: 'Descending',
      limit: 100,
    );
    expect(page['Items'], hasLength(2));
    final q = server.requests.single.uri.queryParameters;
    expect(q['source'], 'person');
    expect(q['person_id'], _vin);
    expect(q['sort'], '-release_date');
    expect(q, isNot(contains('type')), reason: 'no single scope for the mix');
  });

  test('a death date', () {
    final person = siloPersonToBaseItemDto({
      'id': '1',
      'name': 'X',
      'death_date': '2001-02-03',
    });
    expect(person['EndDate'], '2001-02-03T00:00:00.0000000Z');
    expect(person['ProductionLocations'], isEmpty);
  });
}
