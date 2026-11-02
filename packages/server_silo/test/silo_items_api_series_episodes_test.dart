import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _series = 'series-imdb-tt1641384';

/// Young Justice: four seasons, season 1 with three episodes (the first
/// watched), the others empty.
FixtureServer _server() {
  final season1 = siloFixture('season_episodes.json');
  final episodes = (season1['items'] as List).cast<Map<String, dynamic>>();
  episodes.first['user_state'] = {'played': true};
  return FixtureServer({
    '/api/v2/catalog/series/$_series/seasons': FixtureServer.file(
      'silo/series_seasons.json',
    ),
    '/api/v2/catalog/items/season-imdb-tt1641384-1/episodes': siloJson(season1),
    for (final n in [2, 3, 4])
      '/api/v2/catalog/items/season-imdb-tt1641384-$n/episodes': siloJson({
        'items': <Object>[],
      }),
  });
}

List<String> _ids(Map<String, dynamic> page) => [
  for (final i in (page['Items'] as List).cast<Map>()) i['Id'] as String,
];

void main() {
  test('a series asked for its episodes gives episodes, not seasons', () async {
    // Rewatch's "first episode of the show".
    final page = await siloTestClient(_server()).itemsApi.getItems(
      parentId: _series,
      includeItemTypes: ['Episode'],
      recursive: true,
      sortBy: 'SortName,ProductionYear',
      sortOrder: 'Ascending',
      limit: 1,
    );
    expect(_ids(page), ['episode-imdb-tt1641384-1-1']);
    expect((page['Items'] as List).single['Type'], 'Episode');
    expect(page['TotalRecordCount'], 3);
  });

  test('played filters apply', () async {
    final api = siloTestClient(_server()).itemsApi;
    // Rewatch's "is anything left unwatched?" check.
    final unwatched = await api.getItems(
      parentId: _series,
      includeItemTypes: ['Episode'],
      recursive: true,
      filters: ['IsUnplayed'],
      limit: 1,
    );
    expect(_ids(unwatched), ['episode-imdb-tt1641384-1-2']);
    expect(unwatched['TotalRecordCount'], 2);
    final watched = await api.getItems(
      parentId: _series,
      includeItemTypes: ['Episode'],
      filters: ['IsPlayed'],
    );
    expect(_ids(watched), ['episode-imdb-tt1641384-1-1']);
  });

  test('without episode types a series still lists its seasons', () async {
    final page = await siloTestClient(
      _server(),
    ).itemsApi.getItems(parentId: _series);
    expect((page['Items'] as List).first['Type'], 'Season');
  });
}
