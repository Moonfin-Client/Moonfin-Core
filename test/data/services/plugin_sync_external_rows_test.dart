import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

/// Answers the Moonbase ping with [ping], or with nothing when it's null.
class _FakePing extends Interceptor {
  _FakePing(this.ping);

  final Map<String, Object>? ping;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) {
    if (ping == null) {
      h.reject(DioException(requestOptions: options));
      return;
    }
    h.resolve(Response(requestOptions: options, data: ping));
  }
}

void main() {
  late UserPreferences prefs;

  Future<PluginSyncService> pinged(Map<String, Object>? ping) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    final service = PluginSyncService(
      prefs,
      store,
      dio: Dio()..interceptors.add(_FakePing(ping)),
    );
    final client = JellyfinMediaServerClient(
      baseUrl: 'https://jf.example',
      deviceInfo: _device,
    )..accessToken = 'token';
    await service.refreshAvailability(client);
    return service;
  }

  const plugin = {'installed': true, 'settingsSyncEnabled': true};

  test('with no plugin no external row is offered, except a seasonal row the server makes', () async {
    final service = await pinged(null);
    expect(service.externalRowAvailable(HomeSectionType.imdbTop250Movies), isFalse);
    expect(service.externalRowAvailable(HomeSectionType.tmdbPopularMovies), isFalse);
    expect(service.externalRowAvailable(HomeSectionType.seasonal), isFalse);
    expect(
      service.externalRowAvailable(HomeSectionType.seasonal, serverBuildsSeasonal: () => true),
      isTrue,
    );
  });

  test('the plugin alone offers the IMDb and seasonal rows', () async {
    final service = await pinged(plugin);
    expect(service.externalRowAvailable(HomeSectionType.imdbTop250Movies), isTrue);
    expect(service.externalRowAvailable(HomeSectionType.seasonal), isTrue);
    expect(service.externalRowAvailable(HomeSectionType.tmdbPopularMovies), isFalse);
    expect(service.externalRowAvailable(HomeSectionType.mdblistWatchingNow), isFalse);
    expect(service.externalRowAvailable(HomeSectionType.radarrCalendar), isFalse);
  });

  test("a TMDB or MDBList key, the admin's or the viewer's own, offers its rows", () async {
    var service = await pinged({...plugin, 'tmdbAvailable': true, 'mdblistAvailable': true});
    expect(service.externalRowAvailable(HomeSectionType.tmdbTrendingAllWeekly), isTrue);
    expect(service.externalRowAvailable(HomeSectionType.mdblistWatchingNow), isTrue);

    service = await pinged(plugin);
    await prefs.set(UserPreferences.tmdbApiKey, 'own');
    await prefs.set(UserPreferences.mdblistApiKey, 'own');
    expect(service.externalRowAvailable(HomeSectionType.tmdbTrendingAllWeekly), isTrue);
    expect(service.externalRowAvailable(HomeSectionType.mdblistWatchingNow), isTrue);
  });

  test('the calendars follow the plugin calendar flag', () async {
    final service = await pinged({...plugin, 'calendarAvailable': true});
    expect(service.externalRowAvailable(HomeSectionType.radarrCalendar), isTrue);
    expect(service.externalRowAvailable(HomeSectionType.sonarrCalendar), isTrue);
  });

  test("every other row isn't an external one, so it answers null", () async {
    final service = await pinged(plugin);
    expect(service.externalRowAvailable(HomeSectionType.resume), isNull);
    expect(service.externalRowAvailable(HomeSectionType.seerrTrending), isNull);
  });
}
