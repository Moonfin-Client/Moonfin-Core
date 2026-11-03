import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

void main() {
  test('Silo\'s recommendations for the title', () async {
    final server = FixtureServer({
      '/api/v2/recommendations/similar/movie-imdb-tt0295701':
          FixtureServer.file('silo/similar_movie.json'),
    });
    final client = siloTestClient(server);

    final page = await client.itemsApi.getSimilarItems(
      'movie-imdb-tt0295701',
      limit: 12,
    );

    final items = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(items, isNotEmpty);
    expect(items.first['Name'], 'xXx: State of the Union');
    expect(items.first['Type'], 'Movie');
    expect(page['TotalRecordCount'], items.length);
    expect(server.requests.single.uri.queryParameters['limit'], '12');
    expect(
      client.imageApi.getPrimaryImageUrl(items.first['Id'] as String),
      startsWith('https://'),
    );
  });

  test('types Moonfin can\'t open are left out', () async {
    final server = FixtureServer({
      '/api/v2/recommendations/similar/m': siloJson({
        'items': [
          {'content_id': 'ab-1', 'type': 'audiobook', 'title': 'Book'},
          {'content_id': 'movie-2', 'type': 'movie', 'title': 'Film'},
        ],
      }),
    });
    final page = await siloTestClient(server).itemsApi.getSimilarItems('m');
    expect((page['Items'] as List).map((i) => (i as Map)['Name']), ['Film']);
  });
}
