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

/// An `EffectiveSettingCollection` as Silo answers it, for [values].
ResponseBody _effective(Map<String, Object?> values) => FixtureServer.json(
  200,
  jsonEncode({
    'revision': 8,
    'items': [
      for (final e in values.entries)
        {
          'key': e.key,
          'value': e.value,
          'source': e.value == null ? 'default' : 'profile',
          'definition_revision': 1,
        },
    ],
  }),
);

const _stored = <String, Object?>{
  siloLibraryOrderKey: [3, 1],
  siloDisabledLibrariesKey: null,
  siloAudioLanguageKey: 'en',
  siloSubtitleLanguageKey: null,
  siloSubtitleModeKey: 'auto',
  siloShowForcedSubtitlesKey: false,
  siloAutoPlayNextKey: true,
};

class _Settings {
  _Settings([Map<String, Object?> initial = _stored])
    : values = Map.of(initial);

  final Map<String, Object?> values;
  final writes = <String, Object?>{};

  Map<String, ResponseBody Function(RequestOptions)> routes() => {
    '/api/v2/settings/values/effective': (_) => _effective(values),
    for (final key in siloUserConfigurationKeys)
      '/api/v2/settings/values/$key': (o) {
        final value = (o.data as Map)['value'];
        writes[key] = value;
        values[key] = value;
        return FixtureServer.json(
          200,
          jsonEncode({'key': key, 'value': value}),
        );
      },
  };
}

SiloMediaServerClient _client(FixtureServer server, {String? profile = 'p1'}) =>
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
  group('getUserConfiguration', () {
    test('reads the effective settings for the acting profile', () async {
      final server = FixtureServer(_Settings().routes());

      final config = await _client(server).usersApi.getUserConfiguration();

      expect(config.orderedViews, ['3', '1']);
      expect(config.myMediaExcludes, isEmpty);
      expect(config.audioLanguagePreference, 'en');
      expect(config.subtitleMode, 'default');

      final read = server.requests.single;
      expect(read.uri.path, '/api/v2/settings/values/effective');
      expect(read.uri.queryParametersAll['keys'], siloUserConfigurationKeys);
      expect(read.headers['X-Profile-Id'], 'p1');
      expect(read.headers['X-Silo-Device-Id'], isNotEmpty);
    });

    test('needs a profile: a clear error instead of Silo\'s 422', () async {
      final server = FixtureServer(_Settings().routes());

      await expectLater(
        _client(server, profile: null).usersApi.getUserConfiguration(),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('set profileId first'),
          ),
        ),
      );
      expect(server.requests, isEmpty);
    });

    test('a malformed answer is an error', () async {
      final server = FixtureServer({
        '/api/v2/settings/values/effective': (_) =>
            FixtureServer.json(200, '{"revision": 8}'),
      });

      await expectLater(
        _client(server).usersApi.getUserConfiguration(),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('updateUserConfiguration', () {
    test('hiding a library writes only that setting', () async {
      final settings = _Settings();
      final server = FixtureServer(settings.routes());
      final users = _client(server).usersApi;

      final config = await users.getUserConfiguration();
      await users.updateUserConfiguration(
        config.copyWith(myMediaExcludes: ['3']),
      );

      expect(settings.writes, {
        siloDisabledLibrariesKey: [3],
      });
      final put = server.requests.last;
      expect(put.method, 'PUT');
      expect(put.uri.path, '/api/v2/settings/values/ui.disabled_library_ids');
      expect(put.uri.queryParameters, {'scope': 'profile'});
      expect(put.data, {
        'value': [3],
      });
    });

    test('reordering libraries writes the new order', () async {
      final settings = _Settings();
      final server = FixtureServer(settings.routes());
      final users = _client(server).usersApi;

      final config = await users.getUserConfiguration();
      await users.updateUserConfiguration(
        config.copyWith(orderedViews: ['1', '3']),
      );

      expect(settings.writes, {
        siloLibraryOrderKey: [1, 3],
      });
    });

    test('an unchanged configuration writes nothing', () async {
      final settings = _Settings();
      final server = FixtureServer(settings.routes());
      final users = _client(server).usersApi;

      await users.updateUserConfiguration(await users.getUserConfiguration());

      expect(settings.writes, isEmpty);
    });

    test(
      '"Latest" exclusions have no Silo setting and write nothing',
      () async {
        final settings = _Settings();
        final server = FixtureServer(settings.routes());
        final users = _client(server).usersApi;

        final config = await users.getUserConfiguration();
        // The library screens carry the subtitle mode through untouched.
        await users.updateUserConfiguration(
          config.copyWith(latestItemsExcludes: ['1']),
        );

        // The stored show-forced switch (off) survives too: Default keeps it.
        expect(settings.writes, isEmpty);
      },
    );

    test('changing the subtitle mode writes mode and switch', () async {
      final settings = _Settings();
      final server = FixtureServer(settings.routes());
      final users = _client(server).usersApi;

      final config = await users.getUserConfiguration();
      await users.updateUserConfiguration(
        config.copyWith(subtitleMode: 'onlyforced'),
      );

      expect(settings.writes, {
        siloSubtitleModeKey: 'off',
        siloShowForcedSubtitlesKey: true,
      });
    });

    test('updating without a read reads first', () async {
      final settings = _Settings();
      final server = FixtureServer(settings.routes());

      await _client(server).usersApi.updateUserConfiguration(
        const UserConfiguration(
          orderedViews: ['3', '1'],
          audioLanguagePreference: 'en',
          enableNextEpisodeAutoPlay: true,
          subtitleMode: 'default',
          myMediaExcludes: ['1'],
        ),
      );

      expect(
        server.requests.first.uri.path,
        '/api/v2/settings/values/effective',
      );
      expect(settings.writes, {
        siloDisabledLibrariesKey: [1],
      });
    });

    test('a failed write keeps what was saved before it', () async {
      final settings = _Settings();
      final routes = settings.routes()
        ..['/api/v2/settings/values/ui.disabled_library_ids'] = (_) =>
            FixtureServer.problem(503, 'unavailable', 'Try again.');
      final server = FixtureServer(routes);
      final users = _client(server).usersApi;

      final config = await users.getUserConfiguration();
      await expectLater(
        users.updateUserConfiguration(
          config.copyWith(orderedViews: ['1', '3'], myMediaExcludes: ['3']),
        ),
        throwsA(isA<DioException>()),
      );
      expect(settings.writes, {
        siloLibraryOrderKey: [1, 3],
      });

      // Retrying writes only what is still different.
      settings.writes.clear();
      routes['/api/v2/settings/values/ui.disabled_library_ids'] = settings
          .routes()['/api/v2/settings/values/ui.disabled_library_ids']!;
      await users.updateUserConfiguration(
        config.copyWith(orderedViews: ['1', '3'], myMediaExcludes: ['3']),
      );
      expect(settings.writes, {
        siloDisabledLibrariesKey: [3],
      });
    });

    test('another profile reads its own settings first', () async {
      final settings = _Settings();
      final server = FixtureServer(settings.routes());
      final client = _client(server);

      final config = await client.usersApi.getUserConfiguration();
      client.profileId = 'p2';
      await client.usersApi.updateUserConfiguration(config);

      final reads = server.requests
          .where((r) => r.uri.path.endsWith('/effective'))
          .map((r) => r.headers['X-Profile-Id']);
      expect(reads, ['p1', 'p2']);
    });
  });
}
