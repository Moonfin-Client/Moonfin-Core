import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _layoutPath = '/api/v2/home/layout';
const _trendingId = '146552064657409332';
const _trendingPath = '/api/v2/home/sections/$_trendingId/items';

Map<String, dynamic> _capturedSection(String id) =>
    (siloFixture('home_sections.json')['sections'] as List)
        .cast<Map<String, dynamic>>()
        .singleWhere((s) => s['id'] == id);

FixtureServer _server() => FixtureServer({
  _layoutPath: FixtureServer.file('silo/home_layout.json'),
  _trendingPath: siloJson(_capturedSection(_trendingId)),
});

void main() {
  test('Silo\'s own rows, without the ones Moonfin builds itself', () async {
    final api = siloTestClient(_server()).itemsApi;
    expect(api, isA<ServerHomeSectionsApi>());
    final sections = await api.getServerHomeSections();
    expect(sections.map((s) => s.title), [
      'Hidden Gems',
      'Trending on Server',
      'Seasonal Picks',
      'Recently Added in Movies',
      'Recently Added in TV Shows',
    ]);
    expect(sections[1].id, _trendingId);
    expect(sections[1].kind, 'trending_on_server');
  });

  test('a row\'s items, in Silo\'s order', () async {
    final server = _server();
    final api = siloTestClient(server).itemsApi;
    await api.getServerHomeSections();
    final page = await api.getServerHomeSectionItems(_trendingId, limit: 20);

    // The layout read for the list is reused.
    expect(server.requests.map((r) => r.uri.path), [
      _layoutPath,
      _trendingPath,
    ]);
    expect(server.requests.last.uri.queryParameters, {'image_size': 'medium'});
    final items = (page['Items'] as List).cast<Map<String, dynamic>>();
    expect(items.first['Name'], "It's Always Sunny in Philadelphia");
    expect(items.first['Type'], 'Series');
    expect(page['TotalRecordCount'], items.length);
  });

  test('a row named by its type is that type\'s row', () async {
    final server = _server();
    final page = await siloTestClient(
      server,
    ).itemsApi.getServerHomeSectionItems('type:trending_on_server');
    expect(server.requests.last.uri.path, _trendingPath);
    expect(page['Items'], isNotEmpty);
  });

  test('a row Silo no longer has is empty', () async {
    final server = _server();
    final page = await siloTestClient(
      server,
    ).itemsApi.getServerHomeSectionItems('gone');
    expect(page['Items'], isEmpty);
    expect(server.requests.map((r) => r.uri.path), [_layoutPath]);
  });

  test('a failed read is an error, not an empty home', () async {
    final server = FixtureServer({
      _layoutPath: (_) => FixtureServer.problem(503, 'unavailable', 'off'),
    });
    await expectLater(
      siloTestClient(server).itemsApi.getServerHomeSections(),
      throwsA(isA<DioException>()),
    );
  });
}
