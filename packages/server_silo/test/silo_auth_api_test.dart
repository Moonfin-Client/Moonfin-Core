import 'dart:convert';

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

/// A sign-in answer: the captured `auth_login.json` with real-looking tokens
/// and [account] fields merged over its `user`.
ResponseBody Function(RequestOptions) _signedIn({
  Map<String, dynamic> account = const {},
  String access = 'access-1',
}) => (_) {
  final pair =
      jsonDecode(fixture('silo/auth_login.json')) as Map<String, dynamic>;
  pair['access_token'] = access;
  pair['refresh_token'] = 'refresh-$access';
  pair['user'] = {...pair['user'] as Map<String, dynamic>, ...account};
  return FixtureServer.json(200, jsonEncode(pair));
};

SiloMediaServerClient _client(FixtureServer server) => SiloMediaServerClient(
  baseUrl: 'https://silo.example',
  deviceInfo: _device,
  httpClientAdapter: server,
  platform: 'macos',
  clock: () => _now,
);

RequestOptions _login(FixtureServer server) =>
    server.requests.singleWhere((r) => r.uri.path == '/api/v2/auth/login');

void main() {
  group('authenticateByName', () {
    test('answers in the Jellyfin AuthenticationResult shape', () async {
      final server = FixtureServer({'/api/v2/auth/login': _signedIn()});
      final client = _client(server);

      final result = await client.authApi.authenticateByName('user', 'pw');

      expect(result['AccessToken'], 'access-1');
      final user = result['User'] as Map<String, dynamic>;
      expect(user['Id'], '9');
      expect(user['Name'], 'user');
      expect(user[siloAccountIdKey], '9');
      expect((user[siloAccountKey] as Map)['email'], 'user@example.invalid');
      expect(user['Policy'], {
        'IsAdministrator': true,
        'EnableContentDownloading': true,
        'EnableCollectionManagement': true,
      });
      expect(result[SiloAuthApi.siloPasswordChangeRequiredKey], isFalse);
    });

    test('the result reads as a Moonfin UserPolicy', () async {
      final server = FixtureServer({
        '/api/v2/auth/login': _signedIn(
          account: {'role': 'user', 'download_allowed': false},
        ),
      });

      final result = await _client(server).authApi.authenticateByName('u', 'p');
      final policy = UserPolicy.fromJson(
        (result['User'] as Map<String, dynamic>)['Policy']
            as Map<String, dynamic>,
      );

      expect(policy.isAdministrator, isFalse);
      expect(policy.enableContentDownloading, isFalse);
      expect(policy.enableCollectionManagement, isTrue);
    });

    test('puts the token pair on the session', () async {
      final server = FixtureServer({'/api/v2/auth/login': _signedIn()});
      final client = _client(server);

      final result = await client.authApi.authenticateByName('user', 'pw');

      final tokens = client.session.tokens!;
      expect(tokens.accessToken, 'access-1');
      expect(tokens.refreshToken, 'refresh-access-1');
      expect(tokens.expiresAt, _now.add(const Duration(hours: 1)));
      expect(client.accessToken, 'access-1');
      expect(
        SiloTokens.fromJson(
          result[SiloAuthApi.siloTokensKey] as Map<String, dynamic>,
        )?.refreshToken,
        'refresh-access-1',
      );
    });

    test(
      'sends the credentials with device headers and no bearer token',
      () async {
        final server = FixtureServer({'/api/v2/auth/login': _signedIn()});
        final client = _client(server)..accessToken = 'left-over';

        await client.authApi.authenticateByName('alice', 'secret');

        final login = _login(server);
        expect(login.method, 'POST');
        expect(login.data, {'username': 'alice', 'password': 'secret'});
        expect(login.headers.containsKey('Authorization'), isFalse);
        expect(login.headers['X-Silo-Device-Id'], isNotEmpty);
        expect(login.headers['X-Silo-Device-Name'], 'Test TV');
        expect(login.headers['X-Silo-Device-Platform'], 'macos');
      },
    );

    test('a new sign-in replaces the earlier login and its profile', () async {
      final server = FixtureServer({
        '/api/v2/auth/login': _signedIn(access: 'access-2'),
      });
      final client = _client(server)
        ..session.setTokens(
          SiloTokens(
            accessToken: 'access-1',
            refreshToken: 'refresh-1',
            expiresAt: _now.add(const Duration(hours: 1)),
            lifetime: const Duration(hours: 1),
          ),
        )
        ..profileId = 'p1'
        ..profileToken = 'proof';
      final before = client.session.identity;

      await client.authApi.authenticateByName('user', 'pw');

      expect(client.accessToken, 'access-2');
      expect(client.profileId, isNull);
      expect(client.profileToken, isNull);
      expect(client.session.identity, isNot(before));
    });

    test('flags an account that must change its password', () async {
      final server = FixtureServer({
        '/api/v2/auth/login': _signedIn(
          account: {'password_change_required': true},
        ),
      });

      final result = await _client(server).authApi.authenticateByName('u', 'p');

      expect(result[SiloAuthApi.siloPasswordChangeRequiredKey], isTrue);
    });

    test('a wrong password is a readable 401 and is not retried', () async {
      // What the live server answers (build 4b2e921c): the same code as an
      // expired token, so the session interceptor must stay out of it.
      final server = FixtureServer({
        '/api/v2/auth/login': (_) => FixtureServer.problem(
          401,
          'invalid_token',
          'Invalid username or password.',
        ),
        '/api/v2/auth/refresh': (_) => FixtureServer.json(200, '{}'),
      });
      final client = _client(server)
        ..session.setTokens(
          SiloTokens(
            accessToken: 'access-1',
            refreshToken: 'refresh-1',
            expiresAt: _now.add(const Duration(hours: 1)),
            lifetime: const Duration(hours: 1),
          ),
        );

      final error = await client.authApi
          .authenticateByName('user', 'wrong')
          .then<DioException?>(
            (_) => null,
            onError: (Object e) => e as DioException,
          );

      expect(error!.response?.statusCode, 401);
      expect(
        error.message,
        'Silo 401 invalid_token: Invalid username or password.',
      );
      expect(SiloProblem.of(error)?.code, 'invalid_token');
      expect(server.requests.map((r) => r.uri.path), ['/api/v2/auth/login']);
      expect(
        client.accessToken,
        'access-1',
        reason: 'a failed sign-in keeps the current login',
      );
    });

    test('a validation failure carries Silo\'s field errors', () async {
      final server = FixtureServer({
        '/api/v2/auth/login': (_) => FixtureServer.json(
          422,
          jsonEncode({
            'type':
                'https://siloserver.org/docs/api/v2/problems/validation_failed',
            'title': 'Validation failed',
            'status': 422,
            'detail': 'The request did not pass validation; see errors.',
            'errors': [
              {
                'location': 'body.username',
                'code': 'out_of_range',
                'detail': 'expected length >= 1',
              },
            ],
          }),
        ),
      });

      await expectLater(
        _client(server).authApi.authenticateByName('', 'p'),
        throwsA(
          isA<DioException>().having(
            (e) => e.message,
            'message',
            contains('body.username out_of_range'),
          ),
        ),
      );
    });

    test(
      'an answer without a token pair is an error and changes nothing',
      () async {
        final server = FixtureServer({
          '/api/v2/auth/login': (_) => FixtureServer.json(
            200,
            jsonEncode({
              'user': {'id': '9'},
            }),
          ),
        });
        final client = _client(server);

        await expectLater(
          client.authApi.authenticateByName('u', 'p'),
          throwsA(isA<FormatException>()),
        );
        expect(client.session.tokens, isNull);
      },
    );

    test(
      'an answer without an account is an error and changes nothing',
      () async {
        final server = FixtureServer({
          '/api/v2/auth/login': (_) => FixtureServer.json(
            200,
            jsonEncode({
              'access_token': 'a',
              'refresh_token': 'r',
              'expires_in': 3600,
            }),
          ),
        });
        final client = _client(server);

        await expectLater(
          client.authApi.authenticateByName('u', 'p'),
          throwsA(isA<FormatException>()),
        );
        expect(client.session.tokens, isNull);
      },
    );
  });

  group('logout', () {
    SiloTokens tokens({Duration left = const Duration(hours: 1)}) => SiloTokens(
      accessToken: 'access-1',
      refreshToken: 'refresh-1',
      expiresAt: _now.add(left),
      lifetime: const Duration(hours: 1),
    );

    ResponseBody noContent(RequestOptions _) =>
        ResponseBody.fromString('', 204);

    List<String> paths(FixtureServer server) => [
      for (final r in server.requests) r.uri.path,
    ];

    test('revokes the session on Silo and signs out locally', () async {
      final server = FixtureServer({'/api/v2/auth/logout': noContent});
      final client = _client(server)
        ..session.setTokens(tokens())
        ..profileId = 'p1'
        ..profileToken = 'proof';

      await client.authApi.logout();

      final logout = server.requests.single;
      expect(logout.method, 'POST');
      expect(logout.uri.path, '/api/v2/auth/logout');
      expect(logout.headers['Authorization'], 'Bearer access-1');
      expect(logout.headers['X-Profile-Id'], 'p1');
      expect(client.session.tokens, isNull);
      expect(client.accessToken, isNull);
      expect(client.profileId, isNull);
      expect(client.profileToken, isNull);
    });

    test(
      'an expired access token is refreshed first so the logout lands',
      () async {
        final server = FixtureServer({
          '/api/v2/auth/refresh': (_) => FixtureServer.json(
            200,
            jsonEncode({
              'access_token': 'access-2',
              'refresh_token': 'refresh-2',
              'expires_in': 3600,
            }),
          ),
          '/api/v2/auth/logout': (o) =>
              o.headers['Authorization'] == 'Bearer access-2'
              ? noContent(o)
              : FixtureServer.problem(401, 'invalid_token', 'expired'),
        });
        final client = _client(server)
          ..session.setTokens(tokens(left: const Duration(seconds: -5)));

        await client.authApi.logout();

        expect(paths(server), ['/api/v2/auth/refresh', '/api/v2/auth/logout']);
        expect(client.session.tokens, isNull);
      },
    );

    test(
      'a 401 means the session is already gone and is not an error',
      () async {
        final server = FixtureServer({
          '/api/v2/auth/logout': (_) =>
              FixtureServer.problem(401, 'session_expired', 'Session ended.'),
          // The interceptor tries a refresh first, and Silo refuses it too.
          '/api/v2/auth/refresh': (_) =>
              FixtureServer.problem(401, 'invalid_token', 'Refresh refused.'),
        });
        final client = _client(server)..session.setTokens(tokens());

        await client.authApi.logout();

        expect(client.session.tokens, isNull);
      },
    );

    test('a server failure still signs out locally and is reported', () async {
      final server = FixtureServer({
        '/api/v2/auth/logout': (_) =>
            FixtureServer.problem(503, 'unavailable', 'Try again later.'),
      });
      final client = _client(server)..session.setTokens(tokens());

      await expectLater(
        client.authApi.logout(),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status',
            503,
          ),
        ),
      );
      expect(client.session.tokens, isNull);
    });

    test('nothing is sent when not signed in', () async {
      final server = FixtureServer({'/api/v2/auth/logout': noContent});
      final client = _client(server);

      await client.authApi.logout();

      expect(server.requests, isEmpty);
      expect(client.session.tokens, isNull);
    });

    test('a bare token (no refresh token) is still revoked', () async {
      final server = FixtureServer({'/api/v2/auth/logout': noContent});
      final client = _client(server)..accessToken = 'api-key';

      await client.authApi.logout();

      expect(server.requests.single.headers['Authorization'], 'Bearer api-key');
      expect(client.accessToken, isNull);
    });
  });
}
