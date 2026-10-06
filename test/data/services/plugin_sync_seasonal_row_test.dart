import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/preference_constants.dart';
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

Map<String, dynamic> _section(String type, {bool enabled = true, int order = 0}) => {
  'kind': 'builtin',
  'type': type,
  'enabled': enabled,
  'order': order,
};

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

  bool? seasonalEnabledInLayout() => prefs.homeSectionsConfig
      .where((c) => c.isBuiltin && c.type == HomeSectionType.seasonal)
      .map((c) => c.enabled)
      .firstOrNull;

  test('the three settings are stored as sent', () async {
    await pull({
      'seasonalRowEnabled': true,
      'seasonalRowCountry': 'ca',
      'seasonalRowHiddenHolidays': ['pride', 'easter'],
    });

    expect(prefs.get(UserPreferences.seasonalRowEnabled), isTrue);
    expect(prefs.get(UserPreferences.seasonalRowCountry), 'CA');
    expect(prefs.get(UserPreferences.seasonalRowHiddenHolidays), 'pride,easter');
  });

  test("a country this client can't read keeps the local choice", () async {
    await prefs.set(UserPreferences.seasonalRowCountry, 'other');

    await pull({'seasonalRowCountry': 'everywhere'});

    expect(prefs.get(UserPreferences.seasonalRowCountry), 'other');
  });

  test('a layout that leaves the row out re-adds it from the toggle', () async {
    await pull({
      'seasonalRowEnabled': true,
      'homeSections': [_section('resume'), _section('nextup', order: 1)],
    });
    expect(seasonalEnabledInLayout(), isTrue);

    await pull({
      'seasonalRowEnabled': false,
      'homeSections': [_section('resume'), _section('nextup', order: 1)],
    });
    expect(seasonalEnabledInLayout(), isFalse);
  });

  test('a layout that names the row flips the toggle to match', () async {
    await prefs.set(UserPreferences.seasonalRowEnabled, true);

    await pull({
      'homeSections': [_section('resume'), _section('seasonal', enabled: false, order: 1)],
    });

    expect(seasonalEnabledInLayout(), isFalse);
    expect(prefs.get(UserPreferences.seasonalRowEnabled), isFalse);
  });
}
