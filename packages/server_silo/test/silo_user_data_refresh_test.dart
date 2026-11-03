import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _show = 'series-imdb-tt1641384';
const _season = 'season-imdb-tt1641384-1';
const _episode = 'episode-imdb-tt1641384-1-2';
const _sibling = 'episode-imdb-tt1641384-2-1';
const _otherShow = 'episode-imdb-tt0472954-17-1';
const _film = 'movie-imdb-tt0295701';

ResponseBody _noContent(RequestOptions _) => ResponseBody.fromString('', 204);

/// A client whose clock the test moves.
({SiloMediaServerClient client, void Function(Duration) advance}) _client(
  FixtureServer server,
) {
  var now = siloTestNow;
  final client =
      SiloMediaServerClient(
          baseUrl: 'https://silo.example',
          deviceInfo: siloTestDevice,
          httpClientAdapter: server,
          clock: () => now,
        )
        ..session.setTokens(
          SiloTokens(
            accessToken: 'access-1',
            refreshToken: 'refresh-1',
            expiresAt: siloTestNow.add(const Duration(days: 1)),
            lifetime: const Duration(days: 1),
          ),
        )
        ..profileId = 'p1';
  return (client: client, advance: (d) => now = now.add(d));
}

List<String> _scope(MediaServerClient client, List<String> ids) =>
    (client.itemsApi as UserDataRefreshScope).userDataMayHaveChanged(ids);

const _all = [_show, _season, _episode, _sibling, _otherShow, _film];

void main() {
  test('nothing changed: nothing worth reading again', () {
    final client = siloTestClient(FixtureServer({}));
    expect(client.itemsApi, isA<UserDataRefreshScope>());
    expect(_scope(client, _all), isEmpty);
  });

  test('an episode marked: its show, seasons and episodes', () async {
    final server = FixtureServer({'/api/v2/watched/$_episode': _noContent});
    final client = siloTestClient(server);
    await client.userLibraryApi.markPlayed(_episode);
    expect(_scope(client, _all), [_show, _season, _episode, _sibling]);
  });

  test('a film favorited: the film alone', () async {
    final server = FixtureServer({'/api/v2/favorites/$_film': _noContent});
    final client = siloTestClient(server);
    await client.userLibraryApi.markFavorite(_film);
    expect(_scope(client, _all), [_film]);
  });

  test('a failed write changed nothing', () async {
    final server = FixtureServer({
      '/api/v2/ratings/$_film': (_) =>
          FixtureServer.problem(503, 'unavailable', 'busy'),
    });
    final client = siloTestClient(server);
    await expectLater(
      client.userLibraryApi.updateUserRating(_film, likes: true),
      throwsA(isA<DioException>()),
    );
    expect(_scope(client, _all), isEmpty);
  });

  test('a change is remembered for ten minutes', () async {
    final server = FixtureServer({'/api/v2/watched/$_film': _noContent});
    final (:client, :advance) = _client(server);
    await client.userLibraryApi.markPlayed(_film);
    advance(const Duration(minutes: 9));
    expect(_scope(client, _all), [_film]);
    advance(const Duration(minutes: 2));
    expect(_scope(client, _all), isEmpty);
  });

  test('Home reads Silo again after a change', () async {
    const layout = '/api/v2/home/layout';
    const cw = '/api/v2/home/sections/146552064640566580/items';
    final server = FixtureServer({
      layout: FixtureServer.file('silo/home_layout.json'),
      cw: FixtureServer.file('silo/home_continue_watching.json'),
      '/api/v2/watched/$_film': _noContent,
    });
    final client = siloTestClient(server);
    int reads() => server.requests.where((r) => r.uri.path == cw).length;

    await client.itemsApi.getResumeItems();
    await client.itemsApi.getResumeItems();
    expect(reads(), 1, reason: 'kept for 5 s');
    await client.userLibraryApi.markPlayed(_film);
    await client.itemsApi.getResumeItems();
    expect(reads(), 2, reason: 'the change forgot it');
  });
}
