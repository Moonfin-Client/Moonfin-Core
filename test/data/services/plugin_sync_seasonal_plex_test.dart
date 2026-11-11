import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_plex/server_plex.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

const _suggestion = {
  'name': 'Elf',
  'type': 'Movie',
  'providerIds': {'Tmdb': '500'},
};

/// Answers the Moonbase ping and the seasonal row with [items].
class _FakeMoonbase extends Interceptor {
  _FakeMoonbase(this.items);

  final List<Map<String, Object>> items;
  final asked = <RequestOptions>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) {
    asked.add(options);
    h.resolve(
      Response(
        requestOptions: options,
        data: options.uri.path == '/Moonfin/Ping'
            ? {'installed': true}
            : {
                'holiday': 'christmas',
                'items': items,
                'suggestions': [_suggestion],
              },
      ),
    );
  }
}

void main() {
  late PluginSyncService service;
  late _FakeMoonbase moonbase;

  Future<void> setUpWith(List<Map<String, Object>> items) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    moonbase = _FakeMoonbase(items);
    service = PluginSyncService(
      UserPreferences(store),
      store,
      dio: Dio()..interceptors.add(moonbase),
    );
  }

  test('Plex seasonal movies come back in the Jellyfin item shape', () async {
    await setUpWith([
      {'ratingKey': '11', 'type': 'movie', 'title': 'Klaus', 'year': 2019},
    ]);
    final client = PlexMediaServerClient(
      baseUrl: 'http://192.168.50.91:32400',
      deviceInfo: _device,
    )..accessToken = 'pms-token';

    final data = await service.fetchSeasonalRow(client, country: 'US');

    final request = moonbase.asked.last;
    expect(request.uri.path, '/Moonfin/Seasonal/Row');
    expect(request.uri.port, 32500);
    expect(request.uri.queryParameters['country'], 'US');
    final item = (data!['items'] as List).single as Map;
    expect(item['Id'], '11');
    expect(item['Name'], 'Klaus');
    expect(item['Type'], 'Movie');
    expect(data['holiday'], 'christmas');
    expect(data['suggestions'], [_suggestion]);
  });

  test('Jellyfin seasonal movies pass through as they are', () async {
    final items = [
      {'Id': 'abc', 'Name': 'Klaus', 'Type': 'Movie'},
    ];
    await setUpWith(items);
    final client = JellyfinMediaServerClient(
      baseUrl: 'https://jf.example',
      deviceInfo: _device,
    )..accessToken = 'token';

    final data = await service.fetchSeasonalRow(client);

    expect(data!['items'], items);
  });
}
