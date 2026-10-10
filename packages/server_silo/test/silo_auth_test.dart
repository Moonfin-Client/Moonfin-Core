import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

typedef _Handler = FutureOr<ResponseBody> Function(RequestOptions options);

/// A scripted Silo server that records every request it answers.
class _Server implements HttpClientAdapter {
  _Server(this.handler);

  _Handler handler;
  final requests = <RequestOptions>[];

  /// The bearer each request carried when it was sent. A replay reuses its
  /// original RequestOptions, so reading headers afterwards would show the
  /// replayed value twice.
  final sentBearers = <String?>[];

  Iterable<String> get paths =>
      requests.map((r) => '${r.method} ${r.uri.path}');

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    sentBearers.add(options.headers['Authorization'] as String?);
    return handler(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(
  Object body, {
  int status = 200,
  Map<String, List<String>>? headers,
}) => ResponseBody.fromString(
  jsonEncode(body),
  status,
  headers: {
    Headers.contentTypeHeader: [Headers.jsonContentType],
    ...?headers,
  },
);

ResponseBody _problem(
  int status,
  String code, {
  Map<String, List<String>>? headers,
}) => _json(
  {
    'type': 'https://siloserver.org/docs/api/v2/problems/$code',
    'title': code,
    'status': status,
    'detail': code,
  },
  status: status,
  headers: headers,
);

const _account = {
  'id': '4',
  'username': 'testuser',
  'email': '',
  'role': 'user',
  'permissions': <String>[],
  'download_allowed': true,
  'password_change_required': false,
};

Map<String, Object> _tokenPair(
  String access, {
  String refresh = 'r1',
  int expiresIn = 3600,
}) => {
  'access_token': access,
  'refresh_token': refresh,
  'expires_in': expiresIn,
  'user': _account,
};

const _primaryId = 'a3191085-977f-4ed5-a7da-c4da2e83fb8c';

const _profiles = {
  'items': [
    {
      'id': _primaryId,
      'name': 'testuser',
      'has_pin': false,
      'is_child': false,
      'is_primary': true,
      'language': '',
      'subtitle_language': '',
      'subtitle_mode': 'auto',
      'show_forced_subtitles': true,
    },
    {
      'id': 'kid-1',
      'name': 'Kid',
      'has_pin': true,
      'is_child': true,
      'is_primary': false,
      'language': 'en',
      'subtitle_language': 'en',
      'subtitle_mode': 'off',
      'show_forced_subtitles': false,
      'avatar_url': '/api/v2/artwork/avatars/kid.webp?sig=x',
    },
  ],
};

String? _bearer(RequestOptions r) => r.headers['Authorization'] as String?;

(SiloMediaServerClient, _Server) _client(
  _Handler handler, {
  DateTime Function()? clock,
}) {
  final server = _Server(handler);
  final client = SiloMediaServerClient(
    baseUrl: 'https://silo.test',
    deviceInfo: const DeviceInfo(
      id: 'device-1',
      name: 'Living Room TV',
      appName: 'Moonfin',
      appVersion: '2.7.0',
    ),
    httpClientAdapter: server,
    clock: clock,
  );
  return (client, server);
}

ResponseBody _identity() => _json({'server_id': 'srv-7b72'});

void main() {
  group('password sign-in', () {
    test(
      'posts the credentials without a bearer and answers in the Jellyfin shape',
      () async {
        final (client, server) = _client(
          (r) => switch (r.uri.path) {
            '/api/v2/auth/login' => _json(_tokenPair('a1')),
            '/api/v2/system/identity' => _identity(),
            _ => _json({}, status: 404),
          },
        );

        final result = await client.authApi.authenticateByName(
          'testuser',
          'pw',
        );

        final login = server.requests.firstWhere(
          (r) => r.uri.path == '/api/v2/auth/login',
        );
        expect(login.data, {'username': 'testuser', 'password': 'pw'});
        expect(_bearer(login), isNull);
        expect(login.headers['X-Silo-Device-Id'], 'device-1');
        expect(login.headers['X-Silo-Device-Name'], 'Living Room TV');

        expect(result['AccessToken'], 'a1');
        expect(result['ServerId'], 'srv-7b72');
        final user = result['User'] as Map;
        expect(user['Id'], '4');
        expect(user['Name'], 'testuser');
        expect(user[siloAccountIdKey], '4');
        expect(
          (result[SiloAuthApi.siloTokensKey] as Map)['refreshToken'],
          'r1',
        );

        expect(client.accessToken, 'a1');
        expect(client.session.canRefresh, isTrue);
      },
    );

    test('a refused sign-in is never retried or refreshed', () async {
      final (client, server) = _client(
        (r) => _problem(401, 'invalid_credentials'),
      );

      await expectLater(
        client.authApi.authenticateByName('testuser', 'wrong'),
        throwsA(isA<DioException>()),
      );
      expect(server.paths, ['POST /api/v2/auth/login']);
    });
  });

  group('token refresh', () {
    test(
      'a 401 refreshes once and replays the request with the new token',
      () async {
        final (client, server) = _client((r) {
          switch (r.uri.path) {
            case '/api/v2/profiles':
              return _bearer(r) == 'Bearer a2'
                  ? _json(_profiles)
                  : _problem(401, 'token_refresh_required');
            case '/api/v2/auth/refresh':
              return _json(_tokenPair('a2', refresh: 'r2'));
          }
          return _json({}, status: 404);
        });
        client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));
        SiloTokens? persisted;
        client.session.onTokensChanged = (t) => persisted = t;

        final profiles = await client.profilesApi.listProfiles();

        expect(profiles, hasLength(2));
        expect(server.paths, [
          'GET /api/v2/profiles',
          'POST /api/v2/auth/refresh',
          'GET /api/v2/profiles',
        ]);
        final refresh = server.requests[1];
        expect(refresh.data, {'refresh_token': 'r1'});
        expect(server.sentBearers, ['Bearer a1', null, 'Bearer a2']);
        expect(client.accessToken, 'a2');
        expect(persisted?.refreshToken, 'r2');
      },
    );

    test('an expired token answered as invalid_token is refreshed', () async {
      // The exact problem a live Silo (build 4e371f4c) returns for an access
      // token it no longer accepts.
      final (client, server) = _client((r) {
        if (r.uri.path == '/api/v2/auth/refresh') {
          return _json(_tokenPair('a2', refresh: 'r2'));
        }
        return _bearer(r) == 'Bearer a2'
            ? _json({'items': <Object>[]})
            : _json({
                'type':
                    'https://siloserver.org/docs/api/v2/problems/invalid_token',
                'title': 'Invalid token',
                'status': 401,
                'detail': 'The credential is invalid or expired.',
                'instance': 'urn:silo:request:abc',
              }, status: 401);
      });
      client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));

      expect(await client.profilesApi.listProfiles(), isEmpty);
      expect(server.sentBearers, ['Bearer a1', null, 'Bearer a2']);
    });

    test('concurrent 401s share one refresh', () async {
      var refreshes = 0;
      final gate = Completer<void>();
      final (client, server) = _client((r) async {
        if (r.uri.path == '/api/v2/auth/refresh') {
          refreshes++;
          await gate.future;
          return _json(_tokenPair('a2', refresh: 'r2'));
        }
        return _bearer(r) == 'Bearer a2'
            ? _json({'items': <Object>[]})
            : _problem(401, 'authentication_required');
      });
      client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));

      final calls = List.generate(4, (_) => client.profilesApi.listProfiles());
      await Future<void>.delayed(const Duration(milliseconds: 20));
      gate.complete();
      final results = await Future.wait(calls);

      expect(results, everyElement(isEmpty));
      expect(refreshes, 1);
      expect(server.sentBearers.where((b) => b == 'Bearer a1'), hasLength(4));
      expect(server.sentBearers.where((b) => b == 'Bearer a2'), hasLength(4));
    });

    test(
      'a refused refresh ends the session and surfaces the original 401',
      () async {
        final (client, _) = _client(
          (r) => r.uri.path == '/api/v2/auth/refresh'
              ? _problem(401, 'session_expired')
              : _problem(401, 'authentication_required'),
        );
        client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));
        final ended = <SiloSessionEnd>[];
        client.session.onSessionEnded = ended.add;

        await expectLater(
          client.profilesApi.listProfiles(),
          throwsA(
            isA<DioException>().having(
              (e) => e.response?.statusCode,
              'status',
              401,
            ),
          ),
        );
        expect(ended, [SiloSessionEnd.expired]);
        expect(client.accessToken, isNull);
      },
    );

    test('a refresh that cannot reach the server keeps the session', () async {
      final (client, _) = _client(
        (r) => r.uri.path == '/api/v2/auth/refresh'
            ? _problem(
                503,
                'dependency_unavailable',
                headers: {
                  'retry-after': ['5'],
                },
              )
            : _problem(401, 'authentication_required'),
      );
      client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));
      final ended = <SiloSessionEnd>[];
      client.session.onSessionEnded = ended.add;

      await expectLater(
        client.profilesApi.listProfiles(),
        throwsA(isA<DioException>()),
      );
      expect(ended, isEmpty);
      expect(client.accessToken, 'a1');
    });

    test(
      'a token close to expiry is refreshed before the request goes out',
      () async {
        var now = DateTime.utc(2026, 10, 8, 12);
        final (client, server) = _client(
          (r) => r.uri.path == '/api/v2/auth/refresh'
              ? _json(_tokenPair('a2', refresh: 'r2'))
              : _json({'items': <Object>[]}),
          clock: () => now,
        );
        client.session.setTokens(
          SiloTokens.fromResponse(_tokenPair('a1', expiresIn: 900), now: now),
        );

        await client.profilesApi.listProfiles();
        expect(server.paths, [
          'GET /api/v2/profiles',
        ], reason: 'fresh token, no refresh');

        now = now.add(const Duration(minutes: 13));
        server.requests.clear();
        await client.profilesApi.listProfiles();

        expect(server.paths, [
          'POST /api/v2/auth/refresh',
          'GET /api/v2/profiles',
        ]);
        expect(_bearer(server.requests.last), 'Bearer a2');
      },
    );

    test('a bare token (API key) is never refreshed', () async {
      final (client, server) = _client(
        (r) => _problem(401, 'authentication_required'),
      );
      client.accessToken = 'api-key';

      await expectLater(
        client.profilesApi.listProfiles(),
        throwsA(isA<DioException>()),
      );
      expect(server.paths, ['GET /api/v2/profiles']);
    });

    test('setting the same access token keeps the refresh token', () {
      final (client, _) = _client((r) => _json({}));
      client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));
      client.accessToken = 'a1';
      expect(client.session.canRefresh, isTrue);
    });

    test('tokens survive a round trip through storage', () {
      final tokens = SiloTokens.fromResponse(
        _tokenPair('a1', expiresIn: 600),
        now: DateTime.utc(2026, 10, 8),
      );
      final restored = SiloTokens.fromJson(tokens.toJson())!;
      expect(restored.accessToken, 'a1');
      expect(restored.refreshToken, 'r1');
      expect(restored.expiresAt, DateTime.utc(2026, 10, 8, 0, 10));
      expect(restored.lifetime, const Duration(minutes: 10));
    });
  });

  group('profiles', () {
    test('lists the household with PIN and avatar details', () async {
      final (client, server) = _client((r) => _json(_profiles));
      client.accessToken = 'a1';

      final profiles = await client.profilesApi.listProfiles();

      expect(profiles.map((p) => p.name), ['testuser', 'Kid']);
      expect(profiles.first.isPrimary, isTrue);
      expect(profiles.first.avatarUrl, isNull);
      expect(profiles.last.hasPin, isTrue);
      expect(profiles.last.avatarUrl, startsWith('/api/v2/artwork/'));
      expect(
        server.requests.single.headers.containsKey('X-Profile-Id'),
        isFalse,
      );
    });

    test('a right PIN returns the profile token', () async {
      final (client, server) = _client(
        (r) => _json({
          'valid': true,
          'profile_token': 'proof',
          'expires_at': '2026-10-09T00:00:00Z',
        }),
      );
      client.accessToken = 'a1';

      final result = await client.profilesApi.verifyPin('kid-1', '1234');

      expect(
        result,
        isA<SiloPinAccepted>().having((r) => r.profileToken, 'token', 'proof'),
      );
      expect(
        server.requests.single.uri.path,
        '/api/v2/profiles/kid-1/verify-pin',
      );
      expect(server.requests.single.data, {'pin': '1234'});
    });

    test('a wrong PIN is a rejection, not an error', () async {
      final (client, _) = _client((r) => _json({'valid': false}));
      client.accessToken = 'a1';
      expect(
        await client.profilesApi.verifyPin('kid-1', '0000'),
        isA<SiloPinRejected>(),
      );
    });

    test(
      'a locked profile reports how long to wait and is not retried',
      () async {
        final (client, server) = _client(
          (r) => _problem(
            429,
            'rate_limited',
            headers: {
              'retry-after': ['300'],
            },
          ),
        );
        client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));

        final result = await client.profilesApi.verifyPin('kid-1', '1111');

        expect(
          result,
          isA<SiloPinLocked>().having(
            (r) => r.retryAfter,
            'wait',
            const Duration(minutes: 5),
          ),
        );
        expect(server.requests, hasLength(1));
      },
    );

    test('a PIN check is never replayed after a 401', () async {
      final (client, server) = _client(
        (r) => _problem(401, 'authentication_required'),
      );
      client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));

      await expectLater(
        client.profilesApi.verifyPin('kid-1', '1'),
        throwsA(isA<DioException>()),
      );
      expect(server.paths, ['POST /api/v2/profiles/kid-1/verify-pin']);
    });
  });

  group('current user', () {
    Map<String, Object> account({required bool admin}) => {
      ..._account,
      'role': admin ? 'admin' : 'user',
    };

    test('is the selected profile, with the account rights behind it', () async {
      final (client, server) = _client(
        (r) => switch (r.uri.path) {
          '/api/v2/account/me' => _json(account(admin: true)),
          '/api/v2/profiles' => _json(_profiles),
          '/api/v2/system/identity' => _identity(),
          _ => _json({}, status: 404),
        },
      );
      client
        ..accessToken = 'a1'
        ..profileId = _primaryId;

      final user = await client.usersApi.getCurrentUser();

      expect(user.id, _primaryId);
      expect(user.name, 'testuser');
      expect(user.serverId, 'srv-7b72');
      expect(user.policy?.isAdministrator, isTrue);
      expect(user.policy?.enableContentDownloading, isTrue);
      expect(user.configuration?.subtitleMode, 'default');
      final me = server.requests.firstWhere(
        (r) => r.uri.path == '/api/v2/account/me',
      );
      expect(me.headers['X-Profile-Id'], _primaryId);
    });

    test(
      'a secondary profile of an admin account is not an administrator',
      () async {
        final (client, _) = _client(
          (r) => switch (r.uri.path) {
            '/api/v2/account/me' => _json(account(admin: true)),
            '/api/v2/profiles' => _json(_profiles),
            _ => _identity(),
          },
        );
        client
          ..accessToken = 'a1'
          ..profileId = 'kid-1';

        final user = await client.usersApi.getCurrentUser();

        expect(user.policy?.isAdministrator, isFalse);
        expect(user.configuration?.subtitleMode, 'none');
        expect(user.configuration?.subtitleLanguagePreference, 'en');
      },
    );

    test('needs a selected profile', () async {
      final (client, _) = _client((r) => _json({}));
      client.accessToken = 'a1';
      await expectLater(client.usersApi.getCurrentUser(), throwsStateError);
    });

    test('saving the configuration patches the profile in Silo terms', () async {
      final (client, server) = _client((r) => _json({}));
      client
        ..accessToken = 'a1'
        ..profileId = 'kid-1';

      await client.usersApi.updateUserConfiguration(
        UserConfiguration.fromJson({
          'AudioLanguagePreference': 'ja',
          'SubtitleLanguagePreference': 'en',
          'SubtitleMode': 'OnlyForced',
        }),
      );

      final patch = server.requests.single;
      expect(patch.method, 'PATCH');
      expect(patch.uri.path, '/api/v2/profiles/kid-1');
      expect(patch.data, {
        'language': 'ja',
        'subtitle_language': 'en',
        'subtitle_mode': 'off',
        'show_forced_subtitles': true,
      });
    });
  });

  group('device sign-in behind QuickConnect', () {
    test(
      'starting returns the code to show and the secret to poll with',
      () async {
        final (client, server) = _client(
          (r) => _json({
            'device_code': 'dev-secret',
            'user_code': 'ABCD-EFGH',
            'match_code': '12',
            'device_name': 'Living Room TV',
            'device_platform': 'Moonfin',
            'client_purpose': 'device_login',
            'expires_at': '2026-10-08T12:10:00Z',
            'expires_in': 600,
            'interval': 5,
            'temporary': false,
            'verification_uri': 'https://silo.test/link',
            'verification_uri_complete':
                'https://silo.test/link?code=ABCD-EFGH',
          }, status: 201),
        );

        final start = await client.authApi.initiateQuickConnect();

        expect(start['Code'], 'ABCD-EFGH');
        expect(start['Secret'], 'dev-secret');
        expect(
          start['SiloVerificationUriComplete'],
          'https://silo.test/link?code=ABCD-EFGH',
        );
        expect(_bearer(server.requests.single), isNull);
        expect(
          server.requests.single.data,
          containsPair('device_name', 'Living Room TV'),
        );
      },
    );

    test(
      'an approved poll hands over the tokens and the chosen profile once',
      () async {
        var polls = 0;
        final (client, server) = _client((r) {
          if (r.uri.path == '/api/v2/system/identity') return _identity();
          polls++;
          return polls == 1
              ? _json({
                  'status': 'pending',
                  'opened': false,
                  'poll_after': 5,
                  'profile_id': '',
                  'profile_token': '',
                  'temporary': false,
                })
              : _json({
                  'status': 'approved',
                  'opened': true,
                  'poll_after': 5,
                  'profile_id': 'kid-1',
                  'profile_token': 'proof',
                  'temporary': false,
                  'tokens': _tokenPair('a9', refresh: 'r9'),
                });
        });

        final first = await client.authApi.checkQuickConnect('dev-secret');
        expect(first['Authenticated'], isFalse);

        final second = await client.authApi.checkQuickConnect('dev-secret');
        expect(second['Authenticated'], isTrue);

        final result = await client.authApi.authenticateWithQuickConnect(
          'dev-secret',
        );

        expect(polls, 2, reason: 'the approved poll is not repeated');
        expect(result['AccessToken'], 'a9');
        expect(result[SiloAuthApi.siloProfileIdKey], 'kid-1');
        expect(result[SiloAuthApi.siloProfileTokenKey], 'proof');
        expect(client.session.canRefresh, isTrue);
        final pollBodies = server.requests
            .where((r) => r.uri.path == '/api/v2/auth/device/poll')
            .map((r) => (r.data as Map)['device_code']);
        expect(pollBodies, everyElement('dev-secret'));
      },
    );

    test('approving another device posts its code', () async {
      final (client, server) = _client((r) => _json({'status': 'approved'}));
      client.accessToken = 'a1';

      expect(await client.authApi.authorizeQuickConnect('ABCD-EFGH'), isTrue);
      expect(server.requests.single.uri.path, '/api/v2/auth/device/approve');
      expect(server.requests.single.data, {'code': 'ABCD-EFGH'});
    });
  });

  group('sign-out', () {
    test('clears the session even when the server cannot be reached', () async {
      final (client, server) = _client(
        (r) => _problem(503, 'dependency_unavailable'),
      );
      client.session.setTokens(SiloTokens.fromResponse(_tokenPair('a1')));

      await expectLater(
        client.authApi.logout(),
        throwsA(isA<DioException>()),
      );
      expect(client.accessToken, isNull);
      expect(_bearer(server.requests.single), 'Bearer a1');
    });
  });

  group('subtitle modes', () {
    test('map both ways between Silo and Jellyfin', () {
      expect(siloSubtitleModeToJellyfin('always'), 'Always');
      expect(siloSubtitleModeToJellyfin('auto'), 'Default');
      expect(siloSubtitleModeToJellyfin('off'), 'OnlyForced');
      expect(siloSubtitleModeToJellyfin('off', showForced: false), 'None');
      expect(jellyfinSubtitleModeToSilo('None'), (
        mode: 'off',
        showForced: false,
      ));
      expect(jellyfinSubtitleModeToSilo('Smart'), (
        mode: 'auto',
        showForced: true,
      ));
      // Moonfin's UserConfiguration keeps the mode lowercase.
      expect(jellyfinSubtitleModeToSilo('onlyforced'), (
        mode: 'off',
        showForced: true,
      ));
      expect(jellyfinSubtitleModeToSilo('always'), (
        mode: 'always',
        showForced: true,
      ));
    });
  });

  group('problems', () {
    test('the code is the last segment of the type URI', () {
      final problem = SiloProblem.fromJson({
        'type':
            'https://siloserver.org/docs/api/v2/problems/token_refresh_required',
        'title': 'Token refresh required',
        'status': 401,
      });
      expect(problem?.code, 'token_refresh_required');
      expect(SiloProblem.fromJson('<html>'), isNull);
    });
  });
}
