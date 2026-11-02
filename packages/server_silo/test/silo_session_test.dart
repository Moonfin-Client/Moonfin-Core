import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

final _t0 = DateTime.utc(2026, 10, 13, 12);

SiloTokens _pair(
  String access, {
  Duration lifetime = const Duration(hours: 1),
}) => SiloTokens(
  accessToken: access,
  refreshToken: 'refresh-$access',
  expiresAt: _t0.add(lifetime),
  lifetime: lifetime,
);

ResponseBody _refreshed(String access) => FixtureServer.json(
  200,
  jsonEncode({
    'access_token': access,
    'refresh_token': 'refresh-$access',
    'expires_in': 3600,
  }),
);

Dio _dio(FixtureServer server) =>
    Dio(BaseOptions(baseUrl: 'https://silo.example'))
      ..httpClientAdapter = server;

void main() {
  group('SiloTokens', () {
    test('reads a sign-in or refresh response', () {
      final t = SiloTokens.fromResponse({
        'access_token': 'a',
        'refresh_token': 'r',
        'expires_in': 900,
        'user': {'id': '9'},
      }, now: _t0);
      expect(t.accessToken, 'a');
      expect(t.refreshToken, 'r');
      expect(t.lifetime, const Duration(minutes: 15));
      expect(t.expiresAt, _t0.add(const Duration(minutes: 15)));
    });

    test('tolerates missing or wrongly typed fields', () {
      final t = SiloTokens.fromResponse({
        'access_token': 1,
        'expires_in': '900',
      }, now: _t0);
      expect(t.accessToken, '');
      expect(t.refreshToken, '');
      expect(t.lifetime, Duration.zero);
    });

    test(
      'refresh is due at four fifths of the lifetime or the last minute',
      () {
        final t = _pair('a'); // one hour from _t0
        expect(t.needsRefresh(_t0), isFalse);
        expect(t.needsRefresh(_t0.add(const Duration(minutes: 47))), isFalse);
        expect(t.needsRefresh(_t0.add(const Duration(minutes: 49))), isTrue);
        final short = _pair('b', lifetime: const Duration(seconds: 90));
        expect(
          short.needsRefresh(_t0.add(const Duration(seconds: 31))),
          isTrue,
        );
      },
    );

    test('never due without a refresh token', () {
      final bare = SiloTokens(
        accessToken: 'key',
        refreshToken: '',
        expiresAt: _t0,
        lifetime: Duration.zero,
      );
      expect(bare.needsRefresh(_t0.add(const Duration(days: 1))), isFalse);
    });

    test('round-trips through JSON', () {
      final t = _pair('a');
      final back = SiloTokens.fromJson(t.toJson())!;
      expect(back.accessToken, 'a');
      expect(back.refreshToken, 'refresh-a');
      expect(back.expiresAt, t.expiresAt);
      expect(back.lifetime, t.lifetime);
      expect(SiloTokens.fromJson(null), isNull);
      expect(SiloTokens.fromJson({'accessToken': 'a'}), isNull);
    });
  });

  group('SiloSession.refresh', () {
    test('swaps in the rotated pair and reports it', () async {
      final server = FixtureServer({
        '/api/v2/auth/refresh': (_) => _refreshed('a2'),
      });
      final saved = <SiloTokens>[];
      final session = SiloSession(clock: () => _t0)
        ..setTokens(_pair('a1'))
        ..onTokensChanged = saved.add;

      expect(await session.refresh(_dio(server)), isTrue);
      expect(session.accessToken, 'a2');
      expect(session.tokens!.refreshToken, 'refresh-a2');
      expect(saved.single.accessToken, 'a2');

      final request = server.requests.single;
      expect(request.method, 'POST');
      expect(request.data, {'refresh_token': 'refresh-a1'});
      expect(request.extra[siloNoAuthExtra], isTrue);
      expect(request.extra[siloNoRefreshExtra], isTrue);
    });

    test('concurrent callers share one request', () async {
      final gate = Completer<void>();
      var calls = 0;
      final server = FixtureServer({
        '/api/v2/auth/refresh': (_) {
          calls++;
          return _refreshed('a2');
        },
      });
      final dio = _dio(server)
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (o, h) async {
              await gate.future;
              h.next(o);
            },
          ),
        );
      final session = SiloSession(clock: () => _t0)..setTokens(_pair('a1'));

      final results = Future.wait([
        session.refresh(dio),
        session.refresh(dio),
        session.refresh(dio),
      ]);
      gate.complete();
      expect(await results, [true, true, true]);
      expect(calls, 1);
    });

    test('a refused refresh token ends the session once', () async {
      final server = FixtureServer({
        '/api/v2/auth/refresh': (_) =>
            FixtureServer.problem(401, 'session_expired', 'Sign in again.'),
      });
      final ended = <SiloSessionEnd>[];
      var accountChanges = 0;
      final session = SiloSession(clock: () => _t0)
        ..setTokens(_pair('a1'))
        ..onSessionEnded = ended.add
        ..addAccountChangedListener(() => accountChanges++);

      expect(await session.refresh(_dio(server)), isFalse);
      expect(session.tokens, isNull);
      expect(ended, [SiloSessionEnd.expired]);
      expect(accountChanges, 1);
    });

    test('a 503, a network error or a bad answer keeps the tokens', () async {
      for (final respond in <ResponseBody Function(RequestOptions)>[
        (_) => FixtureServer.problem(503, 'dependency_unavailable', 'Later.'),
        (o) => throw DioException.connectionError(
          requestOptions: o,
          reason: 'offline',
        ),
        (_) => FixtureServer.json(200, '{"unexpected":true}'),
        (_) => FixtureServer.json(200, '<html>'),
      ]) {
        final ended = <SiloSessionEnd>[];
        final session = SiloSession(clock: () => _t0)
          ..setTokens(_pair('a1'))
          ..onSessionEnded = ended.add;
        final server = FixtureServer({'/api/v2/auth/refresh': respond});

        expect(await session.refresh(_dio(server)), isFalse);
        expect(session.accessToken, 'a1');
        expect(ended, isEmpty);
      }
    });

    test('does nothing without a refresh token', () async {
      final server = FixtureServer({});
      final session = SiloSession()..setAccessToken('api-key');
      expect(session.canRefresh, isFalse);
      expect(await session.refresh(_dio(server)), isFalse);
      expect(server.requests, isEmpty);
      expect(session.accessToken, 'api-key');
    });

    test(
      'a refresh that finishes after a new sign-in changes nothing',
      () async {
        final gate = Completer<void>();
        final server = FixtureServer({
          '/api/v2/auth/refresh': (_) => _refreshed('stale'),
        });
        final dio = _dio(server)
          ..interceptors.add(
            InterceptorsWrapper(
              onResponse: (r, h) async {
                await gate.future;
                h.next(r);
              },
            ),
          );
        final session = SiloSession(clock: () => _t0)..setTokens(_pair('old'));

        final pending = session.refresh(dio);
        session.setTokens(_pair('new'));
        gate.complete();

        expect(await pending, isFalse);
        expect(session.accessToken, 'new');
      },
    );

    test('a failing save or end callback does not break the refresh', () async {
      final ok = SiloSession(clock: () => _t0)
        ..setTokens(_pair('a1'))
        ..onTokensChanged = (_) => throw StateError('disk full');
      expect(
        await ok.refresh(
          _dio(
            FixtureServer({'/api/v2/auth/refresh': (_) => _refreshed('a2')}),
          ),
        ),
        isTrue,
      );
      expect(ok.accessToken, 'a2');

      final refused = SiloSession(clock: () => _t0)
        ..setTokens(_pair('a1'))
        ..onSessionEnded = (_) => throw StateError('boom');
      expect(
        await refused.refresh(
          _dio(
            FixtureServer({
              '/api/v2/auth/refresh': (_) =>
                  FixtureServer.problem(401, 'session_expired', 'x'),
            }),
          ),
        ),
        isFalse,
      );
      expect(refused.tokens, isNull);
    });
  });

  group('identity', () {
    test(
      'a new login, a bare token or sign-out changes it; a refresh does not',
      () async {
        final session = SiloSession(clock: () => _t0);
        var last = session.identity;
        int bump() {
          final changed = session.identity != last;
          last = session.identity;
          return changed ? 1 : 0;
        }

        session.setTokens(_pair('a1'));
        expect(bump(), 1);
        session.setAccessToken('a1'); // same token: nothing changes
        expect(bump(), 0);
        await session.refresh(
          _dio(
            FixtureServer({'/api/v2/auth/refresh': (_) => _refreshed('a2')}),
          ),
        );
        expect(bump(), 0);
        session.identityChanged(); // profile switch
        expect(bump(), 1);
        session.setAccessToken('api-key');
        expect(bump(), 1);
        session.clear();
        expect(bump(), 1);
      },
    );
  });

  group('the client', () {
    SiloMediaServerClient client() => SiloMediaServerClient(
      baseUrl: 'https://silo.example',
      deviceInfo: const DeviceInfo(
        id: 'd',
        name: 'Mac',
        appName: 'Moonfin',
        appVersion: '1',
      ),
    );

    test('reads its access token from the session', () {
      final c = client()..session.setTokens(_pair('a1'));
      expect(c.accessToken, 'a1');
      expect(c.requestHeaders['Authorization'], 'Bearer a1');
      // Setting the same token through the generic API keeps the refresh token.
      c.accessToken = 'a1';
      expect(c.session.canRefresh, isTrue);
    });

    test('a new login or sign-out drops the profile and its PIN proof', () {
      final c = client()
        ..session.setTokens(_pair('a1'))
        ..profileId = 'p1'
        ..profileToken = 'pvt';
      c.session.setTokens(_pair('b1'));
      expect(c.profileId, isNull);
      expect(c.profileToken, isNull);

      c
        ..profileId = 'p2'
        ..session.clear();
      expect(c.profileId, isNull);
    });

    test('a refresh of the same login keeps the profile', () async {
      final c = client()
        ..session.setTokens(_pair('a1'))
        ..profileId = 'p1';
      await c.session.refresh(
        _dio(FixtureServer({'/api/v2/auth/refresh': (_) => _refreshed('a2')})),
      );
      expect(c.profileId, 'p1');
      expect(c.requestHeaders['Authorization'], 'Bearer a2');
    });

    test('a profile switch changes the identity', () {
      final c = client()..session.setTokens(_pair('a1'));
      final before = c.session.identity;
      c.profileId = 'p1';
      expect(c.session.identity, isNot(before));
      final after = c.session.identity;
      c.profileId = 'p1'; // unchanged
      expect(c.session.identity, after);
    });

    test('requests carry the session\'s bearer token', () async {
      final server = FixtureServer({
        '/api/v2/system/identity': FixtureServer.file(
          'silo/system_identity.json',
        ),
      });
      final c = SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: const DeviceInfo(
          id: 'd',
          name: 'Mac',
          appName: 'Moonfin',
          appVersion: '1',
        ),
        httpClientAdapter: server,
        clock: () => _t0,
      )..session.setTokens(_pair('a1'));
      expect(await c.systemApi.ping(), isTrue);
      expect(server.requests.single.headers['Authorization'], 'Bearer a1');
    });
  });
}
