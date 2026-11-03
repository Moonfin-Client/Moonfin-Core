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

/// Serves a canned resolved profile and keeps the last pushed one.
class _RecordingAdapter implements HttpClientAdapter {
  Map<String, dynamic> resolvedProfile = {};
  Map<String, dynamic>? pushedProfile;

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
      if (options.method == 'POST') {
        pushedProfile = Map<String, dynamic>.from(
          (options.data as Map)['profile'] as Map,
        );
      }
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
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
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

  test('each surface receives its own source list, translated', () async {
    adapter.resolvedProfile = {
      'mdblistRatingSources': ['imdb'],
      'homeRowsMdblistRatingSources': ['myAnimeList', 'stars'],
      'mediaBarMdblistRatingSources': ['rogerEbert'],
    };
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});

    expect(prefs.get(UserPreferences.enabledRatings), 'imdb');
    expect(prefs.get(UserPreferences.homeRowsEnabledRatings), 'myanimelist,stars');
    expect(prefs.get(UserPreferences.mediaBarEnabledRatings), 'rogerebert');
  });

  test('a profile without the new lists leaves them alone', () async {
    await prefs.set(UserPreferences.homeRowsEnabledRatings, 'tmdb');
    adapter.resolvedProfile = {
      'mdblistRatingSources': ['imdb'],
    };
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});

    expect(prefs.get(UserPreferences.homeRowsEnabledRatings), 'tmdb');
    expect(
      prefs.get(UserPreferences.mediaBarEnabledRatings),
      UserPreferences.mediaBarEnabledRatings.defaultValue,
    );
  });

  test('an empty surface list keeps the local one, unlike the global', () async {
    await prefs.set(UserPreferences.enabledRatings, 'tmdb');
    await prefs.set(UserPreferences.homeRowsEnabledRatings, 'imdb');
    await prefs.set(UserPreferences.mediaBarEnabledRatings, 'stars');
    adapter.resolvedProfile = {
      'mdblistRatingSources': <String>[],
      'homeRowsMdblistRatingSources': <String>[],
      'mediaBarMdblistRatingSources': <String>[],
    };
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});

    expect(prefs.get(UserPreferences.enabledRatings), '');
    expect(prefs.get(UserPreferences.homeRowsEnabledRatings), 'imdb');
    expect(prefs.get(UserPreferences.mediaBarEnabledRatings), 'stars');
  });

  test('each surface pushes its own source list and switches', () async {
    await prefs.set(UserPreferences.enabledRatings, 'imdb');
    await prefs.set(UserPreferences.homeRowsEnabledRatings, 'metacriticuser');
    await prefs.set(UserPreferences.mediaBarEnabledRatings, 'tomatoes,stars');
    await prefs.set(UserPreferences.homeRowsShowRatingLabels, true);
    await prefs.set(UserPreferences.mediaBarEnableAdditionalRatings, true);

    await service.pushSettingsForProfile(client, profile: 'desktop');

    final pushed = adapter.pushedProfile!;
    expect(pushed['mdblistRatingSources'], ['imdb']);
    expect(pushed['homeRowsMdblistRatingSources'], ['metacriticUser']);
    expect(pushed['mediaBarMdblistRatingSources'], ['tomatoes', 'stars']);
    expect(pushed['homeRowsMdblistShowRatingNames'], isTrue);
    expect(pushed['mdblistShowRatingNames'], isTrue);
    expect(pushed['mediaBarMdblistEnabled'], isTrue);
    expect(pushed['mdblistEnabled'], isFalse);
  });
}
