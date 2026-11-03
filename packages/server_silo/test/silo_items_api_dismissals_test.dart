import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _layout = '/api/v2/home/layout';
const _cw = '/api/v2/home/sections/146552064640566580/items';
const _cwDismiss = '/api/v2/home/dismissals/continue_watching';
const _nuDismiss = '/api/v2/home/dismissals/next_up';
const _film = 'movie-imdb-tt2518788';
const _episode = 'episode-imdb-tt1641384-1-2';
const _nextEpisode = 'episode-imdb-tt0472954-17-1';

ResponseBody _noContent(RequestOptions _) => ResponseBody.fromString('', 204);

FixtureServer _server([
  Map<String, ResponseBody Function(RequestOptions)> extra = const {},
]) => FixtureServer({
  _layout: FixtureServer.file('silo/home_layout.json'),
  _cw: FixtureServer.file('silo/home_continue_watching.json'),
  ...extra,
});

List<String> _writes(FixtureServer server) => [
  for (final r in server.requests)
    if (r.method != 'GET') '${r.method} ${r.uri.path} ${jsonEncode(r.data)}',
];

HomeDismissalsApi _api(FixtureServer server) =>
    siloTestClient(server).itemsApi as HomeDismissalsApi;

Future<Map<String, dynamic>> _card(MediaServerClient client, String id) async {
  final rows = await Future.wait([
    client.itemsApi.getResumeItems(),
    client.itemsApi.getNextUp(),
  ]);
  return [
    for (final page in rows)
      ...(page['Items'] as List).cast<Map<String, dynamic>>(),
  ].firstWhere((i) => i['Id'] == id);
}

void main() {
  test('a Continue Watching card, with its own resume time', () async {
    final server = _server({'$_cwDismiss/$_film': _noContent});
    final client = siloTestClient(server);
    final card = await _card(client, _film);
    await (client.itemsApi as HomeDismissalsApi).hideFromContinueWatching(card);
    expect(_writes(server), [
      'PUT $_cwDismiss/$_film {"progress_updated_at":"2026-10-14T20:15:00.000Z"}',
    ]);
  });

  test('the same item from elsewhere: the time from Silo\'s row', () async {
    final server = _server({'$_cwDismiss/$_episode': _noContent});
    // As a library grid or a show page lists it: no resume time on it.
    await _api(server).hideFromContinueWatching({
      'Id': _episode,
      'Type': 'Episode',
      'SeriesId': 'series-imdb-tt1641384',
    });
    expect(_writes(server), [
      'PUT $_cwDismiss/$_episode {"progress_updated_at":"2026-10-12T18:00:00.000Z"}',
    ]);
  });

  test('nothing to hide when Silo has no resume point', () async {
    final server = _server();
    await expectLater(
      _api(server).hideFromContinueWatching({'Id': 'movie-unknown'}),
      throwsA(isA<StateError>()),
    );
    expect(_writes(server), isEmpty);
  });

  test('a Next Up card, with its show', () async {
    final server = _server({'$_nuDismiss/$_nextEpisode': _noContent});
    final client = siloTestClient(server);
    final card = await _card(client, _nextEpisode);
    await (client.itemsApi as HomeDismissalsApi).hideFromNextUp(card);
    expect(_writes(server), [
      'PUT $_nuDismiss/$_nextEpisode {"series_id":"series-imdb-tt0472954"}',
    ]);
  });

  test('Next Up needs an episode of a show', () async {
    final server = _server();
    await expectLater(
      _api(server).hideFromNextUp({'Id': 'movie-imdb-tt0295701'}),
      throwsA(isA<StateError>()),
    );
    expect(_writes(server), isEmpty);
  });

  test('Home reads Silo again after a hide', () async {
    final server = _server({'$_cwDismiss/$_film': _noContent});
    final client = siloTestClient(server);
    int reads() => server.requests.where((r) => r.uri.path == _cw).length;
    final card = await _card(client, _film);
    expect(reads(), 1);
    await (client.itemsApi as HomeDismissalsApi).hideFromContinueWatching(card);
    await client.itemsApi.getResumeItems();
    expect(reads(), 2);
  });
}
