import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

/// Answers the plugin ping as installed, and Silo's plugin listing with
/// [siloPlugins], and records every request.
class _RecordingAdapter implements HttpClientAdapter {
  final List<String> requests = [];
  List<Map<String, Object>> siloPlugins = const [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add('${options.method} ${options.uri}');
    if (options.uri.path == '/api/v2/settings/plugins') {
      return ResponseBody.fromString(
        jsonEncode({'items': siloPlugins}),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    if (options.uri.path.endsWith('/Moonfin/Ping')) {
      return ResponseBody.fromString(
        jsonEncode({'installed': true, 'settingsSyncEnabled': true}),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    return ResponseBody.fromString('', 404);
  }

  @override
  void close({bool force = false}) {}
}

_MockClient _client(ServerType type, String baseUrl) {
  final client = _MockClient();
  when(() => client.baseUrl).thenReturn(baseUrl);
  when(() => client.accessToken).thenReturn('token');
  when(() => client.serverType).thenReturn(type);
  when(() => client.deviceInfo).thenReturn(
    const DeviceInfo(
      id: 'dev1',
      name: 'test',
      appName: 'moonfin',
      appVersion: '0.0.0',
    ),
  );
  return client;
}

/// Answers a Silo personal collection's item order.
class _SiloCollections implements HttpClientAdapter {
  String? putIfMatch;
  Object? putBody;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.uri.path != '/api/v2/collections/c1/items/order') {
      return ResponseBody.fromString('', 404);
    }
    if (options.method == 'PUT') {
      putIfMatch = options.headers['If-Match'] as String?;
      final bytes = await requestStream!.expand((b) => b).toList();
      putBody = jsonDecode(utf8.decode(bytes));
    }
    return ResponseBody.fromString(
      jsonEncode({
        'ordered_ids': ['movie-a', 'movie-b'],
        'has_more': false,
      }),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
        'etag': ['"rev-1"'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

SiloMediaServerClient _silo(String baseUrl) {
  final now = DateTime.now().toUtc();
  return SiloMediaServerClient(
    baseUrl: baseUrl,
    deviceInfo: const DeviceInfo(
      id: 'dev1',
      name: 'test',
      appName: 'moonfin',
      appVersion: '0.0.0',
    ),
  )..session.setTokens(
    SiloTokens(
      accessToken: 'access',
      refreshToken: 'refresh',
      expiresAt: now.add(const Duration(hours: 1)),
      lifetime: const Duration(hours: 1),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingAdapter adapter;
  late PluginSyncService service;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    final session = _MockSessionRepository();
    when(() => session.activeUserId).thenReturn('user1');
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, session),
    );

    adapter = _RecordingAdapter();
    service = PluginSyncService(
      prefs,
      store,
      dio: Dio()..httpClientAdapter = adapter,
    );
  });

  tearDown(() => GetIt.instance.reset());

  test('a Silo server without Moonbase reads as having no plugin', () async {
    final silo = _silo('https://silo-none.example');
    expect(await service.refreshAvailability(silo), isFalse);
    expect(service.pluginAvailable, isFalse);
    expect(adapter.requests, [
      'GET https://silo-none.example/api/v2/settings/plugins',
    ]);
  });

  test('a Silo server with Moonbase is pinged under its installation',
      () async {
    adapter.siloPlugins = [
      {'id': '5', 'plugin_id': 'moonfin.moonbase'},
    ];
    final silo = _silo('https://silo-moonbase.example');
    expect(await service.refreshAvailability(silo), isTrue);
    expect(
      adapter.requests,
      contains(
        'GET https://silo-moonbase.example/api/v2/plugin-content/plugins/5'
        '/Moonfin/Ping',
      ),
    );
  });

  test('signing in to a Silo without Moonbase after a server with the '
      'plugin sends nothing to the plugin', () async {
    // A Jellyfin session with the plugin leaves it marked available.
    final jellyfin = _client(ServerType.jellyfin, 'https://jf.example');
    expect(await service.refreshAvailability(jellyfin), isTrue);
    expect(service.pluginAvailable, isTrue);
    adapter.requests.clear();

    final silo = _silo('https://silo-after.example');
    await service.syncOnLogin(silo, serverId: 'silo-1');
    await service.pushNotificationPrefs(silo);

    expect(service.pluginAvailable, isFalse);
    expect(
      adapter.requests.where((r) => r.contains('/Moonfin/')),
      isEmpty,
      reason: 'this Silo has no Moonbase',
    );
  });

  test('a Silo collection keeps its own order, saved against its ETag',
      () async {
    final silo = _SiloCollections();
    final client = SiloMediaServerClient(
      baseUrl: 'https://silo-order.example',
      deviceInfo: const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
      httpClientAdapter: silo,
    );

    expect(service.collectionOrderSupported(client), isTrue);
    expect(
      await service.fetchCustomCollectionOrder(client, 'c1'),
      ['movie-a', 'movie-b'],
    );
    expect(
      await service.saveCustomCollectionOrder(client, 'c1', [
        'movie-b',
        'movie-a',
      ]),
      isTrue,
    );
    expect(silo.putIfMatch, '"rev-1"');
    expect(silo.putBody, {
      'ordered_ids': ['movie-b', 'movie-a'],
    });
    expect(adapter.requests, isEmpty, reason: 'no plugin is involved');
  });

  test('Jellyfin still pings the plugin', () async {
    final jellyfin = _client(ServerType.jellyfin, 'https://jf.example');
    expect(await service.refreshAvailability(jellyfin), isTrue);
    expect(adapter.requests, contains('GET https://jf.example/Moonfin/Ping'));
  });
}
