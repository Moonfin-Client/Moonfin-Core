import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

final _now = DateTime.utc(2026, 10, 13, 12);

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test TV',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

SiloTokens _tokens(String access, {Duration left = const Duration(hours: 1)}) =>
    SiloTokens(
      accessToken: access,
      refreshToken: 'refresh-$access',
      expiresAt: _now.add(left),
      lifetime: const Duration(hours: 1),
    );

ResponseBody _refreshed(String access) => FixtureServer.json(
  200,
  jsonEncode({
    'access_token': access,
    'refresh_token': 'refresh-$access',
    'expires_in': 3600,
  }),
);

ResponseBody _expired() => FixtureServer.problem(
  401,
  'invalid_token',
  'The access token is invalid or expired.',
);

ResponseBody _redirect(String location) => ResponseBody.fromString(
  '',
  307,
  headers: {
    'location': [location],
  },
);

/// The public system endpoints plus [routes]. `/account/me` answers only the
/// bearer token in [goodToken] unless overridden.
Map<String, ResponseBody Function(RequestOptions)> _routes({
  String goodToken = 'new-access',
  Map<String, ResponseBody Function(RequestOptions)> routes = const {},
}) => {
  '/api/v2/system/info': FixtureServer.file('silo/system_info.json'),
  '/api/v2/system/identity': FixtureServer.file('silo/system_identity.json'),
  '/api/v2/theme/branding': FixtureServer.file('silo/theme_branding.json'),
  '/api/v2/system/setup': FixtureServer.file('silo/system_setup.json'),
  '/api/v2/auth/refresh': (_) => _refreshed('new-access'),
  '/api/v2/account/me': (o) => o.headers['Authorization'] == 'Bearer $goodToken'
      ? FixtureServer.file('silo/account_me.json')(o)
      : _expired(),
  ...routes,
};

SiloMediaServerClient _client(FixtureServer server, {SiloTokens? tokens}) =>
    SiloMediaServerClient(
      baseUrl: 'https://silo.example',
      deviceInfo: _device,
      httpClientAdapter: server,
      clock: () => _now,
    )..session.setTokens(tokens ?? _tokens('old-access'));

List<String> _sent(FixtureServer server, String path) => [
  for (final r in server.requests)
    if (r.uri.path == path) (r.headers['Authorization'] as String?) ?? '',
];

void main() {
  group('refresh and replay', () {
    test('a 401 is refreshed once and the request replayed once', () async {
      final server = FixtureServer(_routes());
      final client = _client(server);

      final info = await client.systemApi.getSystemInfo();

      expect((info['SiloAccount'] as Map)['role'], 'admin');
      expect(_sent(server, '/api/v2/account/me'), [
        'Bearer old-access',
        'Bearer new-access',
      ]);
      expect(_sent(server, '/api/v2/auth/refresh'), [
        '',
      ], reason: 'the refresh is sent without a bearer token');
      expect(client.accessToken, 'new-access');
    });

    test('a token about to expire is refreshed before the request', () async {
      final server = FixtureServer(_routes());
      final client = _client(
        server,
        tokens: _tokens('old-access', left: const Duration(seconds: 30)),
      );

      await client.systemApi.getSystemInfo();

      expect(_sent(server, '/api/v2/auth/refresh'), hasLength(1));
      expect(_sent(server, '/api/v2/account/me'), ['Bearer new-access']);
    });

    test('simultaneous 401s share one refresh and are all replayed', () async {
      final server = FixtureServer(_routes());
      final client = _client(server);

      await Future.wait([
        client.systemApi.getSystemInfo(),
        client.systemApi.getSystemInfo(),
        client.systemApi.getSystemInfo(),
      ]);

      expect(_sent(server, '/api/v2/auth/refresh'), hasLength(1));
      expect(
        _sent(
          server,
          '/api/v2/account/me',
        ).where((b) => b == 'Bearer new-access'),
        hasLength(3),
      );
    });

    test('a replay that fails again is not retried a second time', () async {
      final server = FixtureServer(_routes(goodToken: 'never'));
      final client = _client(server);

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status',
            401,
          ),
        ),
      );
      expect(_sent(server, '/api/v2/account/me'), hasLength(2));
      expect(_sent(server, '/api/v2/auth/refresh'), hasLength(1));
    });

    test('a refused refresh ends the session and fails the request', () async {
      final ended = <SiloSessionEnd>[];
      final server = FixtureServer(
        _routes(
          routes: {
            '/api/v2/auth/refresh': (_) =>
                FixtureServer.problem(401, 'session_expired', 'Sign in again.'),
          },
        ),
      );
      final client = _client(server)..session.onSessionEnded = ended.add;

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(ended, [SiloSessionEnd.expired]);
      expect(client.accessToken, isNull);
      expect(_sent(server, '/api/v2/account/me'), hasLength(1));
    });

    test('a refresh that fails with 503 keeps the login', () async {
      final server = FixtureServer(
        _routes(
          routes: {
            '/api/v2/auth/refresh': (_) =>
                FixtureServer.problem(503, 'dependency_unavailable', 'Later.'),
          },
        ),
      );
      final client = _client(server);

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(client.accessToken, 'old-access');
    });

    test('nothing is refreshed without a refresh token', () async {
      final server = FixtureServer(_routes());
      final client = _client(server)..accessToken = 'api-key';

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(_sent(server, '/api/v2/auth/refresh'), isEmpty);
    });
  });

  group('never replayed as someone else', () {
    test('a profile switch while refreshing fails the request', () async {
      late SiloMediaServerClient client;
      final server = FixtureServer(
        _routes(
          routes: {
            '/api/v2/auth/refresh': (_) {
              client.profileId = 'profile-2';
              return _refreshed('new-access');
            },
          },
        ),
      );
      client = _client(server)..profileId = 'profile-1';

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(_sent(server, '/api/v2/account/me'), hasLength(1));
    });

    test('a request waiting on an early refresh is not sent if the profile '
        'changes meanwhile', () async {
      late SiloMediaServerClient client;
      final server = FixtureServer(
        _routes(
          routes: {
            '/api/v2/auth/refresh': (_) {
              client.profileId = 'profile-2';
              return _refreshed('new-access');
            },
          },
        ),
      );
      client = _client(
        server,
        tokens: _tokens('old-access', left: const Duration(seconds: 30)),
      )..profileId = 'profile-1';

      await expectLater(client.systemApi.ping(), completion(isFalse));
      expect(_sent(server, '/api/v2/system/identity'), isEmpty);
    });

    test(
      'a redirect that arrives after a profile switch is not followed',
      () async {
        late SiloMediaServerClient client;
        final server = FixtureServer({
          '/api/v2/system/identity': (_) {
            client.profileId = 'profile-2';
            return _redirect('/moved/identity');
          },
          '/moved/identity': FixtureServer.file('silo/system_identity.json'),
        });
        client = _client(server)..profileId = 'profile-1';

        expect(await client.systemApi.ping(), isFalse);
        expect(_sent(server, '/moved/identity'), isEmpty);
      },
    );

    test('a redirect that arrives after sign-out is not followed', () async {
      late SiloMediaServerClient client;
      final server = FixtureServer({
        '/api/v2/system/identity': (_) {
          client.session.clear();
          return _redirect('/moved/identity');
        },
        '/moved/identity': FixtureServer.file('silo/system_identity.json'),
      });
      client = _client(server);

      expect(await client.systemApi.ping(), isFalse);
      expect(_sent(server, '/moved/identity'), isEmpty);
    });

    test(
      'a dead-connection retry after a profile switch is not sent',
      () async {
        late SiloMediaServerClient client;
        final server = FixtureServer({
          '/api/v2/system/identity': (_) {
            client.profileId = 'profile-2';
            throw const SocketException('Connection reset by peer');
          },
        });
        client = _client(server)..profileId = 'profile-1';

        expect(await client.systemApi.ping(), isFalse);
        expect(_sent(server, '/api/v2/system/identity'), hasLength(1));
      },
    );

    test(
      'a dead-connection retry with no identity change is still sent',
      () async {
        var attempts = 0;
        final server = FixtureServer({
          '/api/v2/system/identity': (o) {
            if (attempts++ == 0) {
              throw const SocketException('Connection reset by peer');
            }
            return FixtureServer.file('silo/system_identity.json')(o);
          },
        });
        final client = _client(server);

        expect(await client.systemApi.ping(), isTrue);
        expect(_sent(server, '/api/v2/system/identity'), hasLength(2));
      },
    );
  });

  group('requests that are never refreshed for', () {
    // Sign-in, refresh, device sign-in and PIN checks set these flags. They're
    // exercised here on a bare Dio with the interceptor.
    Future<void> send(Map<String, Object> extra, FixtureServer server) async {
      final session = SiloSession(clock: () => _now)
        ..setTokens(_tokens('old-access'));
      final dio = Dio(BaseOptions(baseUrl: 'https://silo.example'))
        ..httpClientAdapter = server;
      dio.interceptors.add(SiloSessionInterceptor(dio, dio, session));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (o, h) {
            o.headers['Authorization'] = 'Bearer ${session.accessToken}';
            h.next(o);
          },
        ),
      );
      try {
        await dio.post<dynamic>(
          '/api/v2/auth/login',
          options: Options(extra: extra),
        );
      } on DioException {
        // expected
      }
    }

    test('flagged no-refresh: a 401 is returned as is', () async {
      final server = FixtureServer({
        '/api/v2/auth/login': (_) => _expired(),
        '/api/v2/auth/refresh': (_) => _refreshed('new'),
      });
      await send({siloNoRefreshExtra: true}, server);
      expect(_sent(server, '/api/v2/auth/refresh'), isEmpty);
      expect(_sent(server, '/api/v2/auth/login'), hasLength(1));
    });

    test('flagged no-auth: a 401 is returned as is', () async {
      final server = FixtureServer({
        '/api/v2/auth/login': (_) => _expired(),
        '/api/v2/auth/refresh': (_) => _refreshed('new'),
      });
      await send({siloNoAuthExtra: true}, server);
      expect(_sent(server, '/api/v2/auth/refresh'), isEmpty);
    });

    test(
      'an expiring token is not refreshed before a flagged request',
      () async {
        final server = FixtureServer({
          '/api/v2/auth/login': (_) => FixtureServer.json(200, '{}'),
          '/api/v2/auth/refresh': (_) => _refreshed('new'),
        });
        final session = SiloSession(clock: () => _now)
          ..setTokens(_tokens('old', left: const Duration(seconds: 10)));
        final dio = Dio(BaseOptions(baseUrl: 'https://silo.example'))
          ..httpClientAdapter = server;
        dio.interceptors.add(SiloSessionInterceptor(dio, dio, session));
        await dio.post<dynamic>(
          '/api/v2/auth/login',
          options: Options(extra: {siloNoRefreshExtra: true}),
        );
        expect(_sent(server, '/api/v2/auth/refresh'), isEmpty);
      },
    );
  });

  test('refreshSession refreshes on demand', () async {
    final server = FixtureServer(_routes());
    final client = _client(server);
    expect(await client.refreshSession(), isTrue);
    expect(client.accessToken, 'new-access');
  });
}
