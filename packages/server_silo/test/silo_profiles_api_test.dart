import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import '../../playback_silo/test/silo_contract.dart';
import 'fixture_server.dart';

final _now = DateTime.utc(2026, 10, 13, 12);

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test TV',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

Map<String, dynamic> _profile(
  String id, {
  bool primary = false,
  bool pin = false,
  bool child = false,
}) => {
  'id': id,
  'name': 'Profile $id',
  'has_pin': pin,
  'is_child': child,
  'is_primary': primary,
};

ResponseBody Function(RequestOptions) _profiles(
  List<Map<String, dynamic>> items,
) =>
    (_) => FixtureServer.json(
      200,
      jsonEncode({
        'items': items,
        'avatar_upload_enabled': true,
        'max_advisory_age_supported': true,
        'require_advisory_age_supported': true,
      }),
    );

SiloMediaServerClient _client(FixtureServer server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: _device,
        httpClientAdapter: server,
        clock: () => _now,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: _now.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      );

void main() {
  group('list', () {
    test('reads the captured profiles.json', () async {
      final server = FixtureServer({
        '/api/v2/profiles': FixtureServer.file('silo/profiles.json'),
      });

      final profiles = await _client(server).profilesApi.list();

      expect(profiles, hasLength(1));
      final p = profiles.single;
      expect(p.id, 'eaddd2dc-4b4e-47e8-b0e2-8729dff5dc63');
      expect(p.name, 'Profile 1');
      expect(p.isPrimary, isTrue);
      expect(p.hasPin, isFalse);
      expect(p.isChild, isFalse);
      expect(p.json['subtitle_mode'], 'auto');
    });

    test('reads the PIN and child flags', () async {
      final server = FixtureServer({
        '/api/v2/profiles': _profiles([
          _profile('a', primary: true),
          _profile('b', pin: true),
          _profile('c', child: true),
        ]),
      });

      final profiles = await _client(server).profilesApi.list();

      expect([for (final p in profiles) p.id], ['a', 'b', 'c']);
      expect([for (final p in profiles) p.hasPin], [false, true, false]);
      expect([for (final p in profiles) p.isChild], [false, false, true]);
    });

    test('skips entries without an id and rejects a non-list answer', () async {
      final server = FixtureServer({
        '/api/v2/profiles': _profiles([
          _profile('a', primary: true),
          {'name': 'broken'},
        ]),
      });
      expect(await _client(server).profilesApi.list(), hasLength(1));

      final bad = FixtureServer({
        '/api/v2/profiles': (_) => FixtureServer.json(200, '{"items": null}'),
      });
      await expectLater(
        _client(bad).profilesApi.list(),
        throwsA(isA<FormatException>()),
      );
    });
  });

  test('choosing a profile is an identity change', () {
    final client = _client(FixtureServer({}));
    final before = client.session.identity;

    client.profileId = 'main';

    expect(client.session.identity, isNot(before));
    expect(client.requestHeaders['X-Profile-Id'], 'main');
  });

  group('verifyPin', () {
    const path = '/api/v2/profiles/kid-1/verify-pin';

    test('a matching PIN gives the profile token and its expiry', () async {
      final answer = {
        'valid': true,
        'profile_token': 'pvt_5f3a9c1e7b2d4e8fa0c6',
        'expires_at': '2026-10-13T13:00:00.000Z',
      };
      expect(siloSchemaErrors('ProfileVerification', answer), isEmpty);
      final server = FixtureServer({
        path: (_) => FixtureServer.json(200, jsonEncode(answer)),
      });

      final result = await _client(
        server,
      ).profilesApi.verifyPin('kid-1', '1234');

      expect(result, isA<SiloPinAccepted>());
      final accepted = result as SiloPinAccepted;
      expect(accepted.profileToken, 'pvt_5f3a9c1e7b2d4e8fa0c6');
      expect(accepted.expiresAt, DateTime.utc(2026, 10, 13, 13));
      final request = server.requests.single;
      expect(request.method, 'POST');
      expect(request.data, {'pin': '1234'});
      expect(siloSchemaErrors('ProfilePINCheck', request.data), isEmpty);
      expect(request.headers['Authorization'], 'Bearer access-1');
    });

    test('a token without an expiry', () async {
      final answer = {
        'valid': true,
        'profile_token': 'pvt_1',
        'expires_at': null,
      };
      expect(siloSchemaErrors('ProfileVerification', answer), isEmpty);
      final server = FixtureServer({
        path: (_) => FixtureServer.json(200, jsonEncode(answer)),
      });

      final result = await _client(server).profilesApi.verifyPin('kid-1', '1');

      expect((result as SiloPinAccepted).expiresAt, isNull);
    });

    test('a wrong PIN is rejected and sent once', () async {
      final answer = {'valid': false, 'expires_at': null};
      expect(siloSchemaErrors('ProfileVerification', answer), isEmpty);
      final server = FixtureServer({
        path: (_) => FixtureServer.json(200, jsonEncode(answer)),
      });

      final result = await _client(server).profilesApi.verifyPin('kid-1', '0');

      expect(result, isA<SiloPinRejected>());
      expect(server.requests, hasLength(1));
    });

    test('a lockout says how long, and is not retried', () async {
      final server = FixtureServer({
        path: (_) => ResponseBody.fromString(
          jsonEncode({
            'type': 'https://siloserver.org/docs/api/v2/problems/rate_limited',
            'status': 429,
            'detail': 'Too many PIN attempts.',
          }),
          429,
          headers: {
            Headers.contentTypeHeader: ['application/problem+json'],
            'retry-after': ['287'],
          },
        ),
      });

      final result = await _client(server).profilesApi.verifyPin('kid-1', '1');

      expect(result, isA<SiloPinLocked>());
      expect(
        (result as SiloPinLocked).retryAfter,
        const Duration(seconds: 287),
      );
      expect(server.requests, hasLength(1));
    });

    test('other failures are thrown, once', () async {
      final server = FixtureServer({
        path: (_) => FixtureServer.problem(404, 'not_found', 'No profile.'),
      });

      await expectLater(
        _client(server).profilesApi.verifyPin('kid-1', '1'),
        throwsA(isA<DioException>()),
      );
      expect(server.requests, hasLength(1));
    });

    test('the check and the listing go out as the account', () async {
      final server = FixtureServer({
        path: (_) => FixtureServer.json(
          200,
          jsonEncode({'valid': false, 'expires_at': null}),
        ),
        '/api/v2/profiles': _profiles([_profile('main', primary: true)]),
      });
      final client = _client(server)
        ..profileId = 'main'
        ..profileToken = 'pvt_old';

      await client.profilesApi.verifyPin('kid-1', '1');
      await client.profilesApi.list();

      for (final request in server.requests) {
        expect(request.headers.containsKey('X-Profile-Id'), isFalse);
        expect(request.headers.containsKey('X-Profile-Token'), isFalse);
        expect(request.headers['Authorization'], 'Bearer access-1');
      }
    });

    test('the profile id is escaped in the path', () async {
      final server = FixtureServer({});

      await expectLater(
        _client(server).profilesApi.verifyPin('a/b', '1'),
        throwsA(isA<DioException>()),
      );
      expect(
        server.requests.single.uri.path,
        '/api/v2/profiles/a%2Fb/verify-pin',
      );
    });
  });
}
