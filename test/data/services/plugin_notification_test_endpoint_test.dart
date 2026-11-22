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
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

class _RecordingAdapter implements HttpClientAdapter {
  final List<String> requests = [];
  bool failTestEndpoint = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    requests.add('${options.method} $path');

    if (path.endsWith('/Moonfin/Ping')) {
      return ResponseBody.fromString(
        jsonEncode({
          'installed': true,
          'settingsSyncEnabled': true,
          'pushSupported': true,
        }),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }

    if (path.endsWith('/Moonfin/Notifications/Test')) {
      if (failTestEndpoint) {
        return ResponseBody.fromString('{"error":"failed"}', 500);
      }
      return ResponseBody.fromString(
        jsonEncode({'success': true, 'pushEnabled': true, 'devicesCount': 2}),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }

    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late _RecordingAdapter adapter;
  late PluginSyncService service;
  late _MockClient client;

  setUp(() async {
    SharedPreferences.setMockInitialValues({'pref_last_server_id': 'srv1'});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    final session = _MockSessionRepository();
    when(() => session.activeUserId).thenReturn('user1');
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, session),
    );

    client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://plugin.test');
    when(() => client.accessToken).thenReturn('token');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
    );

    adapter = _RecordingAdapter();
    final dio = Dio();
    dio.httpClientAdapter = adapter;
    service = PluginSyncService(prefs, store, dio: dio);

    await prefs.set(UserPreferences.pluginSyncEnabled, true);
    expect(await service.refreshAvailability(client), isTrue);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    adapter.requests.clear();
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  test(
    'sendTestNotification posts to test endpoint and returns result',
    () async {
      final result = await service.sendTestNotification(client);
      expect(result, isNotNull);
      expect(result!.success, isTrue);
      expect(result.pushEnabled, isTrue);
      expect(result.devicesCount, equals(2));
      expect(adapter.requests, contains('POST /Moonfin/Notifications/Test'));
    },
  );

  test('sendTestNotification returns null on error', () async {
    adapter.failTestEndpoint = true;
    final result = await service.sendTestNotification(client);
    expect(result, isNull);
  });
}
