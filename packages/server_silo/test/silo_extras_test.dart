import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _id = 'movie-imdb-tt0295701';

void main() {
  test('xXx: its YouTube trailer, no local extras', () async {
    final server = FixtureServer({
      '/api/v2/catalog/items/$_id': FixtureServer.file(
        'silo/catalog_item_movie.json',
      ),
    });
    final api = siloTestClient(server).itemsApi;
    final item = await api.getItem(_id);
    expect(item['RemoteTrailers'], [
      {
        'Url': 'https://www.youtube.com/watch?v=NgPdDDzVhkA',
        'Name': 'Official Trailer',
      },
    ]);
    expect(item, isNot(contains('LocalTrailerCount')));
    expect(await api.getLocalTrailers(_id), isEmpty);
    expect(await api.getIntros(_id), isEmpty);
  });

  test('local trailers and special features from extras', () async {
    final detail = siloFixture('catalog_item_movie.json')
      ..['extras'] = [
        {
          'content_id': 'extra-1',
          'kind': 'trailer',
          'title': 'Trailer',
          'duration_seconds': 150,
          'file_id': 7,
        },
        {'content_id': 'extra-2', 'kind': 'teaser', 'title': 'Teaser'},
        {'content_id': 'extra-3', 'kind': 'behind_the_scenes'},
        {'content_id': 'extra-4', 'kind': 'deleted_scene', 'title': 'Cut'},
        {'kind': 'clip'},
      ];
    final server = FixtureServer({
      '/api/v2/catalog/items/$_id': siloJson(detail),
    });
    final api = siloTestClient(server).itemsApi;

    final item = await api.getItem(_id);
    // Moonfin plays them, so the trailer button offers them.
    expect(siloLocalTrailersPlayable, isTrue);
    expect(item['LocalTrailerCount'], 2);
    expect(item['SpecialFeatureCount'], 3);
    final local = await api.getLocalTrailers(_id);
    expect(local.map((t) => t['Name']), ['Trailer', 'Teaser']);
    // A trailer keeps the file it plays.
    expect((local.first['_silo'] as Map)['file_id'], 7);

    final trailers = siloExtrasOf(detail, trailers: true, ownerId: _id);
    expect(trailers.map((t) => t['Name']), ['Trailer', 'Teaser']);
    expect(trailers.first['Type'], 'Trailer');
    expect(trailers.first['RunTimeTicks'], 1500000000);
    expect(trailers.first['ParentId'], _id);

    final features = await api.getSpecialFeatures(_id);
    expect(features.map((f) => f['ExtraType']), [
      'BehindTheScenes',
      'DeletedScene',
    ]);
    expect(features.first['Name'], 'extra-3', reason: 'no title: its id');
  });

  test('remote trailers: trailers first, unknown sites left out', () {
    expect(
      siloRemoteTrailers([
        {'kind': 'featurette', 'site': 'youtube', 'site_key': 'f'},
        {'kind': 'teaser', 'site': 'Vimeo', 'site_key': '42'},
        {'kind': 'trailer', 'site': 'dailymotion', 'site_key': 'x'},
        {'kind': 'trailer', 'site': 'youtube'},
      ]).map((t) => t['Url']),
      ['https://vimeo.com/42', 'https://www.youtube.com/watch?v=f'],
    );
  });
}
