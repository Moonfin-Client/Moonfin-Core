import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _episode = 'episode-imdb-tt1641384-1-1';
const _path = '/api/v2/watch/$_episode/trickplay';

/// The captured previews of Young Justice 1x01 expire at 04:00 on the 16th.
final _expires = DateTime.utc(2026, 10, 16, 4);

/// A client whose clock the test moves.
({SiloMediaServerClient client, void Function(DateTime) setNow}) _client(
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
            expiresAt: DateTime.utc(2027),
            lifetime: const Duration(hours: 1),
          ),
        )
        ..profileId = 'p1';
  return (client: client, setNow: (t) => now = t);
}

Future<void> _settle() =>
    Future<void>.delayed(const Duration(milliseconds: 20));

void main() {
  test('the playing file\'s previews, in Jellyfin\'s shape', () async {
    final server = FixtureServer({
      _path: FixtureServer.file('silo/watch_trickplay_episode.json'),
    });
    final client = siloTestClient(server);
    final api = client.itemsApi as TrickplayManifestApi;
    final manifest = await api.getTrickplayManifest(
      _episode,
      mediaSourceId: '89618',
    );
    final info = (manifest!['89618'] as Map)['300'] as Map;
    expect(info['Width'], 300);
    expect(info['Height'], 168);
    expect(info['TileWidth'], 10);
    expect(info['TileHeight'], 8);
    expect(info['Interval'], 10000);
    expect(info['ThumbnailCount'], 136);
    expect(server.requests.single.uri.queryParameters, {'file_id': '89618'});
    // The sheets are served from the registry, under the file.
    expect(
      client.imageApi.getTrickplayTileImageUrl(
        _episode,
        width: 300,
        index: 1,
        mediaSourceId: '89618',
      ),
      'https://silo.example/api/v2/artwork/trickplay/89618/'
      '5220963635084109598/1.5220963635084109598.jpg?exp=SCRUBBED&sig=SCRUBBED',
    );
  });

  test('kept until shortly before the URLs expire', () async {
    final server = FixtureServer({
      _path: FixtureServer.file('silo/watch_trickplay_episode.json'),
    });
    final c = _client(server);
    final api = c.client.itemsApi;
    await api.getTrickplayManifest(_episode, mediaSourceId: '89618');
    c.setNow(_expires.subtract(const Duration(minutes: 3)));
    await api.getTrickplayManifest(_episode, mediaSourceId: '89618');
    expect(server.requests, hasLength(1));
    c.setNow(_expires.subtract(const Duration(minutes: 1)));
    await api.getTrickplayManifest(_episode, mediaSourceId: '89618');
    expect(server.requests, hasLength(2));
  });

  test('a sheet asked for when its URLs are due reads them again', () async {
    final server = FixtureServer({
      _path: FixtureServer.file('silo/watch_trickplay_episode.json'),
    });
    final c = _client(server);
    await c.client.itemsApi.getTrickplayManifest(
      _episode,
      mediaSourceId: '89618',
    );
    String sheet() => c.client.imageApi.getTrickplayTileImageUrl(
      _episode,
      width: 300,
      index: 0,
      mediaSourceId: '89618',
    );
    sheet();
    await _settle();
    expect(server.requests, hasLength(1));
    c.setNow(_expires);
    expect(sheet(), isNotEmpty);
    sheet();
    await _settle();
    expect(server.requests, hasLength(2), reason: 'one refresh at a time');
  });

  test('a file without previews: none, remembered for a while', () async {
    final server = FixtureServer({});
    final c = _client(server);
    final api = c.client.itemsApi;
    expect(
      await api.getTrickplayManifest(_episode, mediaSourceId: '89618'),
      isNull,
    );
    expect(
      await api.getTrickplayManifest(_episode, mediaSourceId: '89618'),
      isNull,
    );
    expect(server.requests, hasLength(1));
    c.setNow(siloTestNow.add(const Duration(minutes: 11)));
    await api.getTrickplayManifest(_episode, mediaSourceId: '89618');
    expect(server.requests, hasLength(2));
  });

  test('a failed read is not kept', () async {
    var fail = true;
    final server = FixtureServer({
      _path: (request) => fail
          ? FixtureServer.problem(503, 'unavailable', 'Try again')
          : FixtureServer.json(
              200,
              fixture('silo/watch_trickplay_episode.json'),
            ),
    });
    final api = siloTestClient(server).itemsApi;
    await expectLater(
      api.getTrickplayManifest(_episode, mediaSourceId: '89618'),
      throwsA(isA<DioException>()),
    );
    fail = false;
    expect(
      await api.getTrickplayManifest(_episode, mediaSourceId: '89618'),
      isNotNull,
    );
  });
}
