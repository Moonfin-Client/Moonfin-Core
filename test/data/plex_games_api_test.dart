import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/plex_games_api.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/server_plex.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

/// Answers [routes] by path with JSON, recording each request.
class _Server implements HttpClientAdapter {
  _Server(this.routes);

  final Map<String, Object> routes;
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final body = routes[options.uri.path];
    if (body == null) return ResponseBody.fromString('', 404);
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

PlexMediaServerClient _plex(String host, _Server companion, _Server games) =>
    PlexMediaServerClient(
      baseUrl: 'http://$host:32400',
      deviceInfo: _device,
      gamesApi: (client) => plexMoonbaseGamesApi(
        client,
        dio: Dio()..httpClientAdapter = games,
        endpointDio: Dio()..httpClientAdapter = companion,
      ),
    )..accessToken = 'pms-token';

void main() {
  test('games go to the Plex companion, signed with the PMS token', () async {
    final companion = _Server({
      '/Moonfin/Ping': {'installed': true},
    });
    final games = _Server({
      '/Moonfin/Games/Libraries': [
        {'id': 'section-5', 'name': 'Games'},
      ],
    });
    final api = _plex('192.168.50.91', companion, games).gamesApi!;

    final libraries = await api.getLibraries();

    expect(libraries.single.id, 'section-5');
    final request = games.requests.single;
    expect(
      request.uri.toString(),
      'http://192.168.50.91:32500/Moonfin/Games/Libraries',
    );
    expect(request.headers['X-Plex-Token'], 'pms-token');

    final thumb = Uri.parse(
      api.thumbUrl(libraryId: 'section-5', gameId: 'abc'),
    );
    expect(thumb.origin, 'http://192.168.50.91:32500');
    expect(thumb.path, '/Moonfin/Games/section-5/Thumb/abc');
    expect(thumb.queryParameters['X-Plex-Token'], 'pms-token');

    final player = Uri.parse(
      api.playerUrl(
        libraryId: 'section-5',
        gameId: 'abc',
        core: 'snes',
        includeSaveUrl: true,
      ),
    );
    expect(player.origin, 'http://192.168.50.91:32500');
    expect(player.path, '/Moonfin/EmulatorJS/player.html');
    final rom = Uri.parse(player.queryParameters['rom']!);
    expect(rom.path, '/Moonfin/Games/section-5/Rom/abc');
    expect(rom.queryParameters['X-Plex-Token'], 'pms-token');
    final save = Uri.parse(player.queryParameters['save']!);
    expect(save.queryParameters['X-Plex-Token'], 'pms-token');
  });

  test(
    'without a companion nothing is sent and the games are unavailable',
    () async {
      final companion = _Server(const {});
      final games = _Server({'/Moonfin/Games/Libraries': const <Object>[]});
      final api = _plex('192.168.50.92', companion, games).gamesApi!;

      await expectLater(api.getLibraries(), throwsA(isA<DioException>()));
      expect(games.requests, isEmpty);
    },
  );

  test('a Plex client built without the companion has no games', () {
    expect(
      PlexMediaServerClient(
        baseUrl: 'http://192.168.50.93:32400',
        deviceInfo: _device,
      ).gamesApi,
      isNull,
    );
  });
}
