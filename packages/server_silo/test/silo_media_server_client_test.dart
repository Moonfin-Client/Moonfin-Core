import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

/// A body sent as `text/plain`, which Dio hands over as a raw string.
class _PlainText {
  const _PlainText(this.body);
  final String body;
}

/// Answers from the captured fixtures and records every request.
class _FixtureAdapter implements HttpClientAdapter {
  _FixtureAdapter(this.routes);

  final Map<String, Object> routes;
  final requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final body = routes[options.uri.path];
    if (body == null) return ResponseBody.fromString('{"status":404}', 404);
    if (body is int) return ResponseBody.fromString('', body);
    if (body is _PlainText) {
      return ResponseBody.fromString(
        body.body,
        200,
        headers: {
          Headers.contentTypeHeader: ['text/plain; charset=utf-8'],
        },
      );
    }
    return ResponseBody.fromString(
      body is String ? body : jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

String _fixture(String name) =>
    File('test/fixtures/silo/$name.json').readAsStringSync();

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test TV',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

(SiloMediaServerClient, _FixtureAdapter) _client(Map<String, Object> routes) {
  final adapter = _FixtureAdapter(routes);
  final client = SiloMediaServerClient(
    baseUrl: 'https://silo.test',
    deviceInfo: _device,
    httpClientAdapter: adapter,
  );
  return (client, adapter);
}

Map<String, Object> get _publicRoutes => {
  '/api/v2/system/info': _fixture('system_info'),
  '/api/v2/system/identity': _fixture('system_identity'),
  '/api/v2/theme/branding': _fixture('theme_branding'),
  '/api/v2/system/setup': _fixture('system_setup'),
};

void main() {
  group('SiloMediaServerClient', () {
    test('reports itself as Silo', () {
      final (client, _) = _client({});
      expect(client.serverType, ServerType.silo);
      expect(client.baseUrl, 'https://silo.test');
    });

    test('sends bearer, profile and device headers on every request', () async {
      final (client, adapter) = _client(_publicRoutes);
      client
        ..accessToken = 'access-1'
        ..profileId = 'profile-1'
        ..profileToken = 'pin-proof';

      await client.systemApi.ping();

      final headers = adapter.requests.single.headers;
      expect(headers['Authorization'], 'Bearer access-1');
      expect(headers['X-Profile-Id'], 'profile-1');
      expect(headers['X-Profile-Token'], 'pin-proof');
      expect(headers['X-Silo-Device-Id'], 'device-1');
      expect(headers['X-Silo-Client'], 'Moonfin');
    });

    test('sends no Authorization header before sign-in', () async {
      final (client, adapter) = _client(_publicRoutes);

      await client.systemApi.ping();

      expect(adapter.requests.single.headers.containsKey('Authorization'), isFalse);
    });

    test('admin surfaces are unsupported', () {
      final (client, _) = _client({});
      expect(() => client.adminSystemApi, throwsUnsupportedError);
      expect(() => client.adminUsersApi, throwsUnsupportedError);
    });

    test('Silo has no SyncPlay, client log, games or trickplay API objects', () {
      final (client, _) = _client({});
      expect(client.syncPlayApi, isNull);
      expect(client.clientLogApi, isNull);
      expect(client.gamesApi, isNull);
      expect(client.trickplayApi, isNull);
    });

    test('a planned API fails with a message naming its plan step', () {
      final (client, _) = _client({});
      // Placeholders throw at the call, which an awaiting caller receives as
      // its own error just like a failed request.
      expect(
        () => client.itemsApi.getItem('movie-imdb-tt0295701'),
        throwsA(
          isA<SiloNotImplementedError>()
              .having((e) => e.api, 'api', 'ItemsApi')
              .having((e) => e.message, 'message', contains('getItem')),
        ),
      );
    });

    test('image URLs stay empty until the image registry lands', () {
      final (client, _) = _client({});
      expect(client.imageApi.getPrimaryImageUrl('x', tag: 't'), isEmpty);
    });
  });

  group('SiloSystemApi', () {
    test('public info is the Jellyfin shape built from the native endpoints', () async {
      final (client, adapter) = _client(_publicRoutes);

      final info = await client.systemApi.getPublicSystemInfo();

      expect(info['Id'], '7b72fbd5-e741-48f0-9d05-b438990f3a7e');
      expect(info['ServerName'], 'Silo');
      expect(info['Version'], '4e371f4c');
      expect(info['ProductName'], 'Silo');
      expect(info['StartupWizardCompleted'], isTrue);
      expect(info['LoginDisclaimer'], 'Sign in with an existing account.');
      expect(info['SiloApiMajor'], 2);
      expect(
        adapter.requests.map((r) => r.uri.path),
        containsAll(_publicRoutes.keys),
      );
    });

    test('public info survives missing branding and identity', () async {
      final (client, _) = _client({
        '/api/v2/system/info': _fixture('system_info'),
      });

      final info = await client.systemApi.getPublicSystemInfo();

      expect(info['ServerName'], 'Silo');
      expect(info['Id'], isNull);
    });

    test('system info needs a session and includes the account', () async {
      final (client, _) = _client({
        ..._publicRoutes,
        '/api/v2/account/me': {
          'id': '4',
          'username': 'testuser',
          'role': 'user',
          'email': '',
          'permissions': <String>[],
          'download_allowed': true,
          'password_change_required': false,
        },
      });

      final info = await client.systemApi.getSystemInfo();

      expect((info['SiloAccount'] as Map)['username'], 'testuser');
    });

    test('system info fails when the session is rejected', () async {
      final (client, _) = _client({..._publicRoutes, '/api/v2/account/me': 401});

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
    });

    test('ping uses the public identity route', () async {
      final (client, adapter) = _client(_publicRoutes);

      expect(await client.systemApi.ping(), isTrue);
      expect(adapter.requests.single.uri.path, '/api/v2/system/identity');
    });

    test('ping is false when the server does not answer', () async {
      final (client, _) = _client({});
      expect(await client.systemApi.ping(), isFalse);
    });

    test('server id survives a JSON body sent as plain text', () async {
      final (client, _) = _client({
        '/api/v2/system/identity': _PlainText(_fixture('system_identity')),
      });

      expect(await client.serverId(), '7b72fbd5-e741-48f0-9d05-b438990f3a7e');
    });

    test('public info survives JSON bodies sent as plain text', () async {
      final (client, _) = _client({
        for (final e in _publicRoutes.entries)
          e.key: _PlainText(e.value as String),
      });

      final info = await client.systemApi.getPublicSystemInfo();

      expect(info['Id'], '7b72fbd5-e741-48f0-9d05-b438990f3a7e');
      expect(info['Version'], '4e371f4c');
      expect(info['LoginDisclaimer'], 'Sign in with an existing account.');
    });

    test('a problem body sent as plain text is still read', () {
      final problem = SiloProblem.fromJson(
        '{"type":"https://silo.dev/problems/invalid_token","title":"Invalid"}',
      );

      expect(problem?.code, 'invalid_token');
    });
  });

  group('SiloLiveTvApi', () {
    test('reads are empty and writes are unsupported', () async {
      const api = SiloLiveTvApi();
      expect((await api.getChannels())['Items'], isEmpty);
      expect((await api.getTimers())['TotalRecordCount'], 0);
      await expectLater(api.createTimer('p'), throwsUnsupportedError);
    });
  });

  group('ProfileAwareClient', () {
    test('Silo client is profile aware and serves its own headers', () {
      final (client, _) = _client({});
      client
        ..accessToken = 'a'
        ..profileId = 'p';
      expect(client, isA<ProfileAwareClient>());
      expect(serverAuthHeaders(client)['Authorization'], 'Bearer a');
      expect(serverAuthHeaders(client)['X-Profile-Id'], 'p');
      expect(clientProfileId(client), 'p');
    });
  });
}
