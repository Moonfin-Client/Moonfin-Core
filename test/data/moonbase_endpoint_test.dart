import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/moonbase_endpoint.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_plex/server_plex.dart';
import 'package:server_silo/server_silo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

/// Answers Silo's plugin listing with [plugins], counting the calls.
class _PluginList implements HttpClientAdapter {
  _PluginList(this.plugins);

  List<Map<String, Object>> plugins;
  int calls = 0;
  RequestOptions? last;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.uri.path != '/api/v2/settings/plugins') {
      return ResponseBody.fromString('', 404);
    }
    calls++;
    last = options;
    return ResponseBody.fromString(
      jsonEncode({'items': plugins}),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

SiloMediaServerClient _silo(String baseUrl) {
  final now = DateTime.now().toUtc();
  return SiloMediaServerClient(baseUrl: baseUrl, deviceInfo: _device)
    ..session.setTokens(
      SiloTokens(
        accessToken: 'access',
        refreshToken: 'refresh',
        expiresAt: now.add(const Duration(hours: 1)),
        lifetime: const Duration(hours: 1),
      ),
    )
    ..profileId = '7'
    ..profileToken = 'pin-proof';
}

Dio _dio(HttpClientAdapter server) => Dio()..httpClientAdapter = server;

/// Answers a Moonbase ping with [body], recording each request.
class _Companion implements HttpClientAdapter {
  Object body = {'installed': true, 'settingsSyncEnabled': true};
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    if (options.uri.path != '/Moonfin/Ping') {
      return ResponseBody.fromString('', 404);
    }
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

PlexMediaServerClient _plex(String baseUrl) =>
    PlexMediaServerClient(baseUrl: baseUrl, deviceInfo: _device)
      ..accessToken = 'pms-token';

void main() {
  test('Jellyfin serves Moonbase at its root with the MediaBrowser token',
      () async {
    final client = JellyfinMediaServerClient(
      baseUrl: 'https://jf.example',
      deviceInfo: _device,
    )..accessToken = 'token';
    final server = _PluginList(const []);

    final ep = await moonbaseEndpoint(client, _dio(server));

    expect(ep!.base, 'https://jf.example');
    expect(ep.headers['Authorization'], startsWith('MediaBrowser '));
    expect(server.calls, 0);
  });

  test('Silo finds Moonbase by plugin id and signs as the profile', () async {
    final client = _silo('https://silo-found.example');
    final server = _PluginList([
      {'id': '3', 'plugin_id': 'org.example.other'},
      {'id': '12', 'plugin_id': siloMoonbasePluginId},
    ]);

    final ep = await moonbaseEndpoint(client, _dio(server));

    expect(
      ep!.base,
      'https://silo-found.example/api/v2/plugin-content/plugins/12',
    );
    expect(ep.headers['Authorization'], 'Bearer access');
    expect(ep.headers['X-Profile-Id'], '7');
    expect(ep.headers['X-Profile-Token'], 'pin-proof');
    expect(server.last!.headers['Authorization'], 'Bearer access');

    // The id is kept, until a 404 says to look again.
    await moonbaseEndpoint(client, _dio(server));
    expect(server.calls, 1);
    forgetMoonbaseEndpoint(client);
    server.plugins = [
      {'id': '13', 'plugin_id': siloMoonbasePluginId},
    ];
    final again = await moonbaseEndpoint(client, _dio(server));
    expect(again!.base, endsWith('/plugins/13'));
    expect(server.calls, 2);
  });

  test('a Silo without Moonbase is not asked again straight away', () async {
    final client = _silo('https://silo-missing.example');
    final server = _PluginList(const []);

    expect(await moonbaseEndpoint(client, _dio(server)), isNull);
    expect(await moonbaseEndpoint(client, _dio(server)), isNull);
    expect(server.calls, 1);
  });

  group('Plex', () {
    tearDown(() => GetIt.instance.reset());

    test('finds the companion next to Plex and signs with the PMS token',
        () async {
      final client = _plex('http://192.168.50.45:32400');
      final server = _Companion();

      final ep = await moonbaseEndpoint(client, _dio(server));

      expect(ep!.base, 'http://192.168.50.45:32500');
      expect(ep.headers, {'X-Plex-Token': 'pms-token'});
      final ping = server.requests.single;
      expect(ping.uri.toString(), 'http://192.168.50.45:32500/Moonfin/Ping');
      expect(ping.headers['X-Plex-Token'], 'pms-token');
      expect(ping.headers.containsKey('Authorization'), isFalse);

      // Confirmed once, then kept.
      await moonbaseEndpoint(client, _dio(server));
      expect(server.requests, hasLength(1));
    });

    test('a Plex server without the companion is not asked again straight '
        'away', () async {
      final client = _plex('http://192.168.50.60:32400');
      // What Plex itself answers on a path it doesn't know.
      final server = _Companion()
        ..body = {
          'MediaContainer': {'size': 0},
        };

      expect(await moonbaseEndpoint(client, _dio(server)), isNull);
      expect(await moonbaseEndpoint(client, _dio(server)), isNull);
      expect(server.requests, hasLength(1));
      expect(moonbaseKnownMissing(client), isTrue);

      forgetMoonbaseEndpoint(client);
      server.body = {'installed': true};
      expect(await moonbaseEndpoint(client, _dio(server)), isNotNull);
      expect(moonbaseKnownMissing(client), isFalse);
    });

    test('a typed address wins and is tidied', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      GetIt.instance
        ..registerSingleton<UserPreferences>(prefs)
        ..registerSingleton(MediaServerClientFactory(deviceInfo: _device));
      final client = _plex('http://192.168.50.61:32400');
      // With no client registered, the factory names a server by its URL.
      await prefs.set(
        UserPreferences.moonbaseUrlForServer(client.baseUrl),
        ' moonbase.lan:8080/ ',
      );
      final server = _Companion();

      final ep = await moonbaseEndpoint(client, _dio(server));

      expect(ep!.base, 'http://moonbase.lan:8080');
      expect(
        server.requests.single.uri.toString(),
        'http://moonbase.lan:8080/Moonfin/Ping',
      );
    });

    test('the address preference is for Plex servers only', () {
      GetIt.instance.registerSingleton(
        MediaServerClientFactory(deviceInfo: _device),
      );
      final jellyfin = JellyfinMediaServerClient(
        baseUrl: 'https://jf.example',
        deviceInfo: _device,
      );
      expect(plexMoonbasePreference(jellyfin), isNull);
      expect(plexMoonbasePreference(_plex('http://x:32400')), isNotNull);
    });

    test('a plex.direct name turns back into its address', () {
      expect(
        plexMoonbaseDefault(
          _plex('https://192-168-50-45.d3b9933a3dbad36e.plex.direct:32400'),
        ),
        'http://192.168.50.45:32500',
      );
      expect(
        plexMoonbaseDefault(_plex('http://[fd00::5]:32400')),
        'http://[fd00::5]:32500',
      );
      expect(plexDirectAddress('plex.example.com'), isNull);
    });
  });
}
