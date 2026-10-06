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

/// Serves whichever resolved profile the test sets.
class _ProfileAdapter implements HttpClientAdapter {
  Map<String, dynamic> resolvedProfile = {};

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    Map<String, dynamic>? body;
    if (path.endsWith('/Moonfin/Ping')) {
      body = {'installed': true, 'settingsSyncEnabled': true};
    } else if (path.contains('/Moonfin/Settings/Resolved/')) {
      body = resolvedProfile;
    } else if (path.contains('/Moonfin/Settings/Profile/')) {
      body = {};
    }

    if (body == null) {
      return ResponseBody.fromString('', 404);
    }
    return ResponseBody.fromString(
      jsonEncode(body),
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

  late _ProfileAdapter adapter;
  late UserPreferences prefs;
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
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
    );

    adapter = _ProfileAdapter();
    final dio = Dio();
    dio.httpClientAdapter = adapter;
    service = PluginSyncService(prefs, store, dio: dio);

    await prefs.set(UserPreferences.pluginSyncEnabled, true);
    expect(await service.refreshAvailability(client), isTrue);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<void> pull(Map<String, dynamic> profile) async {
    adapter.resolvedProfile = profile;
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});
  }

  String effect() => prefs.get(UserPreferences.seasonalSurprise);
  String density() => prefs.get(UserPreferences.seasonalDensity);

  test('a known effect and density are stored as sent', () async {
    await pull({'seasonalSurprise': 'fireworks', 'seasonalDensity': 'heavy'});

    expect(effect(), 'fireworks');
    expect(density(), 'heavy');
  });

  test("older clients' winter and fall are stored as snow and leaves", () async {
    await pull({'seasonalSurprise': 'winter'});
    expect(effect(), 'snow');

    await pull({'seasonalSurprise': 'fall'});
    expect(effect(), 'leaves');
  });

  test("older clients' spring and summer are stored as petals and fireflies", () async {
    await pull({'seasonalSurprise': 'spring'});
    expect(effect(), 'petals');

    await pull({'seasonalSurprise': 'summer'});
    expect(effect(), 'fireflies');
  });

  test('the newer effects are stored as sent', () async {
    for (final value in ['christmas', 'petals', 'fireflies', 'halloween']) {
      await pull({'seasonalSurprise': value});
      expect(effect(), value);
    }
  });

  test('a value this client does not know keeps the local choice', () async {
    await prefs.set(UserPreferences.seasonalSurprise, 'confetti');
    await prefs.set(UserPreferences.seasonalDensity, 'light');

    await pull({'seasonalSurprise': 'aurora', 'seasonalDensity': 'blizzard'});

    expect(effect(), 'confetti');
    expect(density(), 'light');
  });
}
