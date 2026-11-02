import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

const _device = DeviceInfo(
  id: 'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
  name: 'Test Mac',
  appName: 'Moonfin for macOS',
  appVersion: '2.7.0',
);

Map<String, ResponseBody Function(RequestOptions)> _publicRoutes() => {
  '/api/v2/system/info': FixtureServer.file('silo/system_info.json'),
  '/api/v2/system/identity': FixtureServer.file('silo/system_identity.json'),
  '/api/v2/theme/branding': FixtureServer.file('silo/theme_branding.json'),
  '/api/v2/system/setup': FixtureServer.file('silo/system_setup.json'),
};

SiloMediaServerClient _client(FixtureServer server) => SiloMediaServerClient(
  baseUrl: 'https://silo.example',
  deviceInfo: _device,
  platform: 'macOS',
  httpClientAdapter: server,
);

void main() {
  group('getPublicSystemInfo', () {
    test('maps the captured responses to the Jellyfin shape', () async {
      final server = FixtureServer(_publicRoutes());
      final info = await _client(server).systemApi.getPublicSystemInfo();
      expect(info['Id'], '7b72fbd5-e741-48f0-9d05-b438990f3a7e');
      expect(info['ServerName'], 'Silo');
      expect(info['Version'], '4b2e921c+dirty');
      expect(info['ProductName'], 'Silo');
      expect(info['StartupWizardCompleted'], isTrue);
      expect(info['LoginDisclaimer'], 'Sign in with an existing account.');
      expect(info['SiloApiMajor'], 2);
      expect(server.requests.map((r) => r.uri.path).toSet(), {
        '/api/v2/system/info',
        '/api/v2/system/identity',
        '/api/v2/theme/branding',
        '/api/v2/system/setup',
      });
    });

    test('still answers when the cosmetic endpoints fail', () async {
      final server = FixtureServer({
        '/api/v2/system/info': FixtureServer.file('silo/system_info.json'),
      });
      final info = await _client(server).systemApi.getPublicSystemInfo();
      expect(info['Id'], isNull);
      expect(info['ServerName'], 'Silo');
      expect(info['Version'], '4b2e921c+dirty');
    });

    test('fails when /system/info is not Silo', () async {
      final server = FixtureServer({
        ..._publicRoutes(),
        '/api/v2/system/info': (_) => FixtureServer.json(
          200,
          '{"ProductName":"Jellyfin Server","Version":"10.10.7"}',
        ),
      });
      expect(
        _client(server).systemApi.getPublicSystemInfo(),
        throwsA(isA<FormatException>()),
      );
    });

    test('fails on an HTML page', () async {
      final server = FixtureServer({
        ..._publicRoutes(),
        '/api/v2/system/info': (_) => ResponseBody.fromString(
          '<!doctype html><html></html>',
          200,
          headers: {
            Headers.contentTypeHeader: ['text/html'],
          },
        ),
      });
      expect(
        _client(server).systemApi.getPublicSystemInfo(),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('getSystemInfo', () {
    Map<String, ResponseBody Function(RequestOptions)> routes() => {
      ..._publicRoutes(),
      '/api/v2/account/me': (o) =>
          o.headers['Authorization'] == 'Bearer good-token'
          ? FixtureServer.file('silo/account_me.json')(o)
          : FixtureServer.problem(
              401,
              'authentication_required',
              'Sign in to continue.',
            ),
    };

    test('adds the signed-in account', () async {
      final client = _client(FixtureServer(routes()))
        ..accessToken = 'good-token';
      final info = await client.systemApi.getSystemInfo();
      expect(info['ServerName'], 'Silo');
      expect((info['SiloAccount'] as Map)['role'], 'admin');
    });

    test("fails with Silo's problem when not signed in", () async {
      final client = _client(FixtureServer(routes()));
      try {
        await client.systemApi.getSystemInfo();
        fail('should have thrown');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
        expect(SiloProblem.codeOf(e), 'authentication_required');
        expect(
          e.message,
          'Silo 401 authentication_required: Sign in to continue.',
        );
      }
    });
  });

  group('ping', () {
    test('true when identity answers', () async {
      expect(
        await _client(FixtureServer(_publicRoutes())).systemApi.ping(),
        isTrue,
      );
    });

    test('false when it does not', () async {
      expect(await _client(FixtureServer({})).systemApi.ping(), isFalse);
    });

    // The connectivity check reads a ping's answer the same way for every
    // server type: a 401 heard from the server counts.
    test('a 401 still counts as an answer', () async {
      final server = FixtureServer({
        '/api/v2/system/identity': (_) => FixtureServer.problem(
          401,
          'authentication_required',
          'Sign in to continue.',
        ),
      });
      expect(await _client(server).systemApi.ping(), isTrue);
    });

    test('waits no longer than the ping timeout', () async {
      final server = FixtureServer(_publicRoutes());
      await _client(server).systemApi.ping();
      expect(server.requests.single.receiveTimeout, SystemApi.pingTimeout);
    });
  });

  group('headers on the wire', () {
    test('device and app before sign-in, no bearer or profile', () async {
      final server = FixtureServer(_publicRoutes());
      await _client(server).systemApi.ping();
      final headers = server.requests.single.headers;
      expect(headers['X-Silo-Device-Id'], _device.id);
      expect(headers['X-Silo-Device-Name'], 'Test Mac');
      expect(headers['X-Silo-Device-Platform'], 'macOS');
      expect(headers['X-Silo-Client'], 'Moonfin for macOS');
      expect(headers['X-Silo-Client-Version'], '2.7.0');
      expect(headers.containsKey('Authorization'), isFalse);
      expect(headers.containsKey('X-Profile-Id'), isFalse);
    });

    test('bearer token and profile once set', () async {
      final server = FixtureServer(_publicRoutes());
      final client = _client(server)
        ..accessToken = 'tok'
        ..profileId = 'eaddd2dc-4b4e-47e8-b0e2-8729dff5dc63';
      await client.systemApi.ping();
      final headers = server.requests.single.headers;
      expect(headers['Authorization'], 'Bearer tok');
      expect(headers['X-Profile-Id'], 'eaddd2dc-4b4e-47e8-b0e2-8729dff5dc63');
    });
  });

  group('redirects', () {
    test('a redirect to another site is not followed', () async {
      final server = FixtureServer({
        '/api/v2/system/identity': (_) => ResponseBody.fromString(
          '',
          302,
          headers: {
            'location': ['https://elsewhere.example/api/v2/system/identity'],
          },
        ),
      });
      expect(await _client(server).systemApi.ping(), isFalse);
      expect(server.requests, hasLength(1));
    });

    test('a redirect within the same server is followed', () async {
      final server = FixtureServer({
        '/api/v2/system/identity': (o) => o.uri.queryParameters['moved'] == '1'
            ? FixtureServer.file('silo/system_identity.json')(o)
            : ResponseBody.fromString(
                '',
                302,
                headers: {
                  'location': ['/api/v2/system/identity?moved=1'],
                },
              ),
      });
      expect(await _client(server).systemApi.ping(), isTrue);
      expect(server.requests, hasLength(2));
    });
  });
}
