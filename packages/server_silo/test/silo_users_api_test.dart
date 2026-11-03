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

const _mainId = 'eaddd2dc-4b4e-47e8-b0e2-8729dff5dc63';

Map<String, dynamic> _fixture(String name) =>
    jsonDecode(fixture('silo/$name')) as Map<String, dynamic>;

/// `account_me.json` with [changes] merged in.
ResponseBody Function(RequestOptions) _account([
  Map<String, dynamic> changes = const {},
]) =>
    (_) => FixtureServer.json(
      200,
      jsonEncode({..._fixture('account_me.json'), ...changes}),
    );

/// `profiles.json` plus [extra] profiles.
ResponseBody Function(RequestOptions) _profiles([
  List<Map<String, dynamic>> extra = const [],
]) => (_) {
  final list = _fixture('profiles.json');
  list['items'] = [...list['items'] as List, ...extra];
  return FixtureServer.json(200, jsonEncode(list));
};

Map<String, dynamic> _kid = {
  'id': 'kid',
  'name': 'Kid',
  'has_pin': false,
  'is_child': true,
  'is_primary': false,
};

SiloMediaServerClient _client(FixtureServer server, {String? profile}) =>
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
      )
      ..profileId = profile;

void main() {
  group('getCurrentUser', () {
    test('maps the captured account and main profile', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': _profiles(),
      });

      final user = await _client(
        server,
        profile: _mainId,
      ).usersApi.getCurrentUser();

      expect(user.id, _mainId);
      expect(user.name, 'Profile 1');
      expect(user.hasPassword, isTrue);
      final policy = user.policy!;
      expect(policy.isAdministrator, isTrue);
      expect(policy.enableContentDownloading, isTrue);
      expect(policy.enableCollectionManagement, isTrue);
      expect(policy.canFetchRemoteSubtitles, isTrue);
      expect(policy.enableAllFolders, isTrue);
      expect(policy.enableLiveTvAccess, isFalse);
      expect(policy.enableMediaPlayback, isTrue);
    });

    test('describes the profile the client acts as', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': _profiles([_kid]),
      });

      final user = await _client(
        server,
        profile: 'kid',
      ).usersApi.getCurrentUser();

      expect(user.id, 'kid');
      expect(user.name, 'Kid');
      expect(
        user.policy!.isAdministrator,
        isFalse,
        reason: 'Silo keeps admin routes to the primary profile',
      );
    });

    test('a profile avatar is registered for ImageApi', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': _profiles([
          {
            ..._kid,
            'avatar': 'preset:fox',
            'avatar_source': 'preset',
            'avatar_url': '/avatars/presets/fox.png',
          },
        ]),
      });
      final client = _client(server, profile: 'kid');

      final user = await client.usersApi.getCurrentUser();

      expect(user.primaryImageTag, isNotNull);
      expect(
        client.imageApi.getUserImageUrl('kid'),
        'https://silo.example/avatars/presets/fox.png',
      );
    });

    test('no avatar, no tag and no URL', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': _profiles(),
      });
      final client = _client(server, profile: _mainId);

      final user = await client.usersApi.getCurrentUser();

      expect(user.primaryImageTag, isNull);
      expect(client.imageApi.getUserImageUrl(_mainId), '');
    });

    test('with no profile chosen yet, describes the main profile', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': _profiles([_kid]),
      });

      final user = await _client(server).usersApi.getCurrentUser();

      expect(user.id, _mainId);
    });

    test('a non-admin account without downloads', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account({
          'role': 'user',
          'download_allowed': false,
        }),
        '/api/v2/profiles': _profiles(),
      });

      final policy = (await _client(
        server,
        profile: _mainId,
      ).usersApi.getCurrentUser()).policy!;

      expect(policy.isAdministrator, isFalse);
      expect(policy.enableContentDownloading, isFalse);
    });

    test('a blank profile name falls back to the username', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': (_) => FixtureServer.json(
          200,
          jsonEncode({
            'items': [
              {'id': 'p', 'name': '  ', 'is_primary': true},
            ],
          }),
        ),
      });

      final user = await _client(server).usersApi.getCurrentUser();

      expect(user.name, 'user');
    });

    test('the raw account and profile ride along for later mappers', () {
      final dto = siloProfileToUserDto(
        profile: _kid,
        account: _fixture('account_me.json'),
      );

      expect(dto[siloAccountIdKey], '9');
      expect((dto[siloAccountKey] as Map)['username'], 'user');
      expect((dto[siloProfileKey] as Map)['is_child'], isTrue);
    });

    test(
      'a profile that no longer exists is a readable error, not a 401',
      () async {
        final server = FixtureServer({
          '/api/v2/account/me': _account(),
          '/api/v2/profiles': _profiles(),
        });

        await expectLater(
          _client(server, profile: 'deleted').usersApi.getCurrentUser(),
          throwsA(
            isA<StateError>().having(
              (e) => e.message,
              'message',
              contains('no longer exists'),
            ),
          ),
        );
      },
    );

    test('a rejected token surfaces as the 401 the app signs out on', () async {
      final server = FixtureServer({
        '/api/v2/account/me': (_) =>
            FixtureServer.problem(401, 'invalid_token', 'expired'),
        '/api/v2/profiles': (_) =>
            FixtureServer.problem(401, 'invalid_token', 'expired'),
        '/api/v2/auth/refresh': (_) =>
            FixtureServer.problem(401, 'invalid_token', 'Refresh refused.'),
      });

      await expectLater(
        _client(server, profile: _mainId).usersApi.getCurrentUser(),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status',
            401,
          ),
        ),
      );
    });

    test('sends every read but the listing as the chosen profile', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': _profiles(),
      });

      await _client(server, profile: _mainId).usersApi.getCurrentUser();

      expect(
        {
          for (final r in server.requests)
            r.uri.path: r.headers['X-Profile-Id'],
        },
        {
          '/api/v2/account/me': _mainId,
          // Listed as the account, so a locked profile can't refuse it.
          '/api/v2/profiles': null,
          '/api/v2/capabilities/downloads': _mainId,
        },
      );
    });
  });

  group('getHousehold', () {
    test('every profile of the account, each as a Moonfin user', () async {
      final server = FixtureServer({
        '/api/v2/account/me': _account(),
        '/api/v2/profiles': _profiles([
          {
            ..._kid,
            'has_pin': true,
            'avatar_url': '/api/v2/profiles/kid/avatar?v=3',
          },
        ]),
      });
      final client = _client(server, profile: _mainId);

      final household =
          await (client.usersApi as SiloUsersApi).getHousehold();

      expect(household.map((m) => m.profile.id), [_mainId, 'kid']);
      final main = household.first;
      expect(main.user.id, _mainId);
      expect(main.profile.isPrimary, isTrue);
      final kid = household.last;
      expect(kid.user.id, 'kid');
      expect(kid.user.name, 'Kid');
      expect(kid.profile.hasPin, isTrue);
      expect(kid.user.policy?.isAdministrator, isFalse);
      // The avatar is recorded for the account switcher.
      expect(kid.user.primaryImageTag, isNotNull);
      expect(client.imageApi.getUserImageUrl('kid'), isNotEmpty);
      // Read as the account, with nothing about downloads (read per profile).
      expect(
        server.requests
            .firstWhere((r) => r.uri.path == '/api/v2/profiles')
            .headers
            .containsKey('X-Profile-Id'),
        isFalse,
      );
      expect(
        server.requests.map((r) => r.uri.path),
        isNot(contains('/api/v2/capabilities/downloads')),
      );
    });
  });
}
