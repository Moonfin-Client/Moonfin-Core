import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import 'fixture_server.dart';

/// Shared setup for the API tests: a signed-in client acting as a profile,
/// answering from a [FixtureServer].

final siloTestNow = DateTime.utc(2026, 10, 14, 12);

const siloTestDevice = DeviceInfo(
  id: 'device-1',
  name: 'Test',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

/// A signed-in client acting as profile `p1`.
SiloMediaServerClient siloTestClient(FixtureServer server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: siloTestDevice,
        httpClientAdapter: server,
        clock: () => siloTestNow,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: siloTestNow.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'p1';

/// A route answering the effective settings [values].
ResponseBody Function(RequestOptions) siloEffectiveSettings(
  Map<String, Object?> values,
) =>
    (_) => FixtureServer.json(
      200,
      jsonEncode({
        'revision': 1,
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

/// A route answering [body] as JSON.
ResponseBody Function(RequestOptions) siloJson(Object body) =>
    (_) => FixtureServer.json(200, jsonEncode(body));

/// The JSON of fixture `silo/<name>`.
Map<String, dynamic> siloFixture(String name) =>
    jsonDecode(fixture('silo/$name')) as Map<String, dynamic>;

/// The JSON of fixture `emby/<name>`.
Map<String, dynamic> siloEmbyFixture(String name) =>
    jsonDecode(fixture('emby/$name')) as Map<String, dynamic>;
