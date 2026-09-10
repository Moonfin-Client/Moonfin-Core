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

/// Serves canned plugin responses, so a test can hand the client whichever
/// home layout moonbase would have pushed.
class _RecordingAdapter implements HttpClientAdapter {
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

Map<String, dynamic> _section(
  HomeSectionType type, {
  required int order,
  bool enabled = true,
}) => {
  'type': type.serializedName,
  'enabled': enabled,
  'order': order,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingAdapter adapter;
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

    adapter = _RecordingAdapter();
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

  Future<void> pushLayout(List<Map<String, dynamic>> sections) async {
    adapter.resolvedProfile = {'homeSections': sections};
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});
  }

  int rows() => prefs.get(UserPreferences.sinceYouWatchedNumRows).value;

  test('three rows in the layout raise the count to three', () async {
    expect(rows(), 1);

    await pushLayout([
      _section(HomeSectionType.sinceYouWatched1, order: 0),
      _section(HomeSectionType.sinceYouWatched2, order: 1),
      _section(HomeSectionType.sinceYouWatched3, order: 2),
    ]);

    expect(rows(), 3);
  });

  test('the count follows the highest row, not how many there are', () async {
    await pushLayout([
      _section(HomeSectionType.sinceYouWatched1, order: 0),
      _section(HomeSectionType.sinceYouWatched4, order: 1),
    ]);

    expect(rows(), 4);
  });

  test('a row the layout turned off is left out of the count', () async {
    await pushLayout([
      _section(HomeSectionType.sinceYouWatched1, order: 0),
      _section(HomeSectionType.sinceYouWatched3, order: 1, enabled: false),
    ]);

    expect(rows(), 1);
  });

  test('a layout with none of them leaves the count alone', () async {
    await prefs.set(
      UserPreferences.sinceYouWatchedNumRows,
      SinceYouWatchedNumRows.four,
    );

    await pushLayout([_section(HomeSectionType.resume, order: 0)]);

    expect(rows(), 4);
  });

  test('a count already above the layout stays where it is', () async {
    await prefs.set(
      UserPreferences.sinceYouWatchedNumRows,
      SinceYouWatchedNumRows.five,
    );

    await pushLayout([
      _section(HomeSectionType.sinceYouWatched1, order: 0),
      _section(HomeSectionType.sinceYouWatched2, order: 1),
    ]);

    expect(rows(), 5);
  });

  test('the rows the layout asked for are enabled as well', () async {
    await pushLayout([
      _section(HomeSectionType.sinceYouWatched1, order: 0),
      _section(HomeSectionType.sinceYouWatched2, order: 1),
    ]);

    expect(prefs.get(UserPreferences.sinceYouWatched2Enabled), isTrue);
    expect(prefs.get(UserPreferences.sinceYouWatched3Enabled), isFalse);
  });
}
