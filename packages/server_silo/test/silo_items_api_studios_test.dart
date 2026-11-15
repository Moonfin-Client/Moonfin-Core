import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

void main() {
  FixtureServer server() => FixtureServer({
    '/api/v2/catalog/filters': siloJson({
      'genres': [],
      'studios': ['Warner Bros.', 'A24'],
      'networks': ['HBO', 'A24'],
      'countries': [],
      'original_languages': [],
      'content_ratings': [],
      'authors': [],
      'narrators': [],
      'series': [],
    }),
    '/api/v2/catalog': siloJson({
      'items': [],
      'page': {'has_more': false},
    }),
  });

  test('studios and networks together, sorted, once each', () async {
    final s = server();
    final page = await siloTestClient(s).itemsApi.getStudios(parentId: '3');
    final items = (page['Items'] as List).cast<Map>();
    expect(items.map((i) => i['Name']), ['A24', 'HBO', 'Warner Bros.']);
    expect(items.first['Type'], 'Studio');
    expect(items.first['Id'], siloStudioId('A24'));
    final q = s.requests.single.uri.queryParameters;
    expect(q['library_id'], '3');
    expect(q['skip_technical'], 'true');
  });

  test('a studio\'s titles match the studio or the network', () async {
    final s = server();
    final api = siloTestClient(s).itemsApi;
    await api.getItems(parentId: '1', studios: ['HBO']);
    await api.getItems(parentId: siloStudioId('A24'));

    for (final (i, name) in [(0, 'HBO'), (1, 'A24')]) {
      final groups =
          jsonDecode(s.requests[i].uri.queryParameters['groups']!) as List;
      final rules = (groups.single['rules'] as List).cast<Map>();
      expect(rules.map((r) => '${r['field']} ${r['value']}'), [
        'studio $name',
        'network $name',
      ]);
    }
  });

  test('getItem on a studio id names it', () async {
    final studio = await siloTestClient(
      server(),
    ).itemsApi.getItem(siloStudioId('HBO'));
    expect(studio['Type'], 'Studio');
    expect(studio['Name'], 'HBO');
  });
}
