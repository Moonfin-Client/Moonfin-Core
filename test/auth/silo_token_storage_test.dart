import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/services/silo_token_storage.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:server_core/server_core.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_silo/server_silo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

final _now = DateTime.utc(2026, 10, 13, 12);

/// Answers Silo's refresh route with a new pair numbered by call.
class _RefreshServer implements HttpClientAdapter {
  int refreshes = 0;
  bool refuse = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.uri.path != '/api/v2/auth/refresh') {
      return ResponseBody.fromString('', 404);
    }
    if (refuse) {
      return ResponseBody.fromString(
        jsonEncode({
          'type': 'https://siloserver.org/docs/api/v2/problems/invalid_token',
          'status': 401,
        }),
        401,
        headers: {
          Headers.contentTypeHeader: ['application/problem+json'],
        },
      );
    }
    refreshes++;
    return ResponseBody.fromString(
      jsonEncode({
        'access_token': 'access-$refreshes',
        'refresh_token': 'refresh-$refreshes',
        'expires_in': 3600,
      }),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

SiloMediaServerClient _silo(_RefreshServer server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: _device,
        httpClientAdapter: server,
        clock: () => _now,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-0',
          refreshToken: 'refresh-0',
          expiresAt: _now.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthenticationStore store;
  late SiloTokenStorage storage;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = AuthenticationStore();
    await store.init();
    storage = SiloTokenStorage(store);
  });

  group('siloClientOf', () {
    test('finds a Silo client and ignores Jellyfin', () {
      final silo = _silo(_RefreshServer());
      final jellyfin = JellyfinMediaServerClient(
        baseUrl: 'https://jf.example',
        deviceInfo: _device,
      );

      expect(siloClientOf(silo), same(silo));
      expect(siloClientOf(jellyfin), isNull);
    });
  });

  test('save and read round-trip the pair', () async {
    await storage.save(
      's1',
      '9',
      SiloTokens(
        accessToken: 'a',
        refreshToken: 'r',
        expiresAt: _now,
        lifetime: const Duration(hours: 1),
      ),
    );

    final back = storage.read('s1', '9')!;
    expect(back.accessToken, 'a');
    expect(back.refreshToken, 'r');
    expect(back.expiresAt, _now);
    expect(storage.read('s1', 'other'), isNull);
  });

  test('every refreshed pair replaces the stored one', () async {
    final server = _RefreshServer();
    final client = _silo(server);
    storage.bind(client: client, serverId: 's1', accountId: '9');

    await client.refreshSession();
    await pumpEventQueue();
    expect(storage.read('s1', '9')?.refreshToken, 'refresh-1');

    await client.refreshSession();
    await pumpEventQueue();
    expect(storage.read('s1', '9')?.refreshToken, 'refresh-2');
  });

  test('a refused refresh forgets the stored pair', () async {
    final server = _RefreshServer()..refuse = true;
    final client = _silo(server);
    await storage.save('s1', '9', client.session.tokens!);
    storage.bind(client: client, serverId: 's1', accountId: '9');

    await client.refreshSession();
    await pumpEventQueue();

    // Silo refused it, so nothing should ever restore it again.
    expect(storage.read('s1', '9'), isNull);
  });

  test('unbind stops saving', () async {
    final server = _RefreshServer();
    final client = _silo(server);
    storage.bind(client: client, serverId: 's1', accountId: '9');
    storage.unbind(client);

    await client.refreshSession();
    await pumpEventQueue();

    expect(storage.read('s1', '9'), isNull);
  });

  test('rebinding to another account saves there instead', () async {
    final server = _RefreshServer();
    final client = _silo(server);
    storage.bind(client: client, serverId: 's1', accountId: '9');
    storage.bind(client: client, serverId: 's1', accountId: '10');

    await client.refreshSession();
    await pumpEventQueue();

    expect(storage.read('s1', '9'), isNull);
    expect(storage.read('s1', '10')?.refreshToken, 'refresh-1');
  });
}
