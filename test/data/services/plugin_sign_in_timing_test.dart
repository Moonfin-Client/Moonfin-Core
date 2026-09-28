import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

class _MockSeerrRepository extends Mock implements SeerrRepository {}

/// Answers the plugin, except for the settings stream, which stays open
/// without sending anything the way a server holding back its first flush
/// does.
class _PluginAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    if (path.endsWith('/Moonfin/Settings/Stream')) {
      return Completer<ResponseBody>().future;
    }
    Map<String, dynamic>? body;
    if (path.endsWith('/Moonfin/Ping')) {
      body = {'installed': true, 'settingsSyncEnabled': true};
    } else if (path.contains('/Moonfin/Settings/')) {
      body = {};
    }
    if (body == null) return ResponseBody.fromString('', 404);
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

  late PluginSyncService service;
  late _MockClient client;
  late _MockSeerrRepository seerr;
  late bool seerrSignedIn;

  Future<void> signInToSeerr() => seerr.bootstrapMoonfinSso(
    jellyfinBaseUrl: any(named: 'jellyfinBaseUrl'),
    jellyfinToken: any(named: 'jellyfinToken'),
    username: any(named: 'username'),
    password: any(named: 'password'),
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({'pref_last_server_id': 'srv1'});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);

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
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    seerr = _MockSeerrRepository();
    seerrSignedIn = false;
    when(
      () => seerr.ensureInitialized(force: any(named: 'force')),
    ).thenAnswer((_) async {});
    when(() => seerr.isAvailable).thenAnswer((_) => seerrSignedIn);
    when(signInToSeerr).thenAnswer((_) async => seerrSignedIn = true);
    GetIt.instance.registerLazySingletonAsync<SeerrRepository>(
      () async => seerr,
    );

    final dio = Dio()..httpClientAdapter = _PluginAdapter();
    service = PluginSyncService(prefs, store, dio: dio);
    await prefs.set(UserPreferences.pluginSyncEnabled, true);
  });

  tearDown(() => GetIt.instance.reset());

  test('sign-in finishes without waiting on the settings stream', () async {
    await service
        .syncOnLogin(client, serverId: 'srv1')
        .timeout(const Duration(seconds: 2));
  });

  test('a live Seerr session skips signing in again', () async {
    expect(await service.refreshAvailability(client), isTrue);
    seerrSignedIn = true;

    expect(await service.configureSeerr(client), isFalse);
    verifyNever(signInToSeerr);
  });

  test('signing in to Seerr asks the home to load its rows again', () async {
    expect(await service.refreshAvailability(client), isTrue);

    expect(await service.configureSeerr(client), isTrue);
    verify(signInToSeerr).called(1);
  });
}
