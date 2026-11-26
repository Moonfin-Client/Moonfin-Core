import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/src/api/plex_live_tv_favorites_api.dart';
import 'package:test/test.dart';

void main() {
  test('favorites round-trip the entire account list and reject incomplete reads', () async {
    const rows = [
      {'source': 'provider://tv.plex.provider.epg', 'id': 'free'},
      {'source': 'server://other-pms/dvr', 'id': '4'},
    ];
    const device = DeviceInfo(id: 'device', name: 'Test', appName: 'Moonfin', appVersion: '1');
    Map<String, dynamic> container = {'FavoriteChannel': rows};
    final methods = <String>[];
    final dio = Dio()..interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      methods.add(request.method);
      expect(request.uri.toString(), 'https://epg.provider.plex.tv/settings/favoriteChannels');
      expect(request.headers['X-Plex-Token'], 'account-token');
      if (request.method == 'PUT') expect(request.data, rows);
      handler.resolve(Response(requestOptions: request, data: {'MediaContainer': container}, statusCode: 200));
    }));
    addTearDown(() => dio.close());
    final api = PlexLiveTvFavoritesApi(dio: dio);
    Future<List<Map<String, dynamic>>> read() => api.readFavorites(deviceInfo: device, accountToken: 'account-token');
    await api.writeFavorites(deviceInfo: device, accountToken: 'account-token', rows: await read());
    expect(methods, ['GET', 'PUT']);
    for (final empty in [{'size': 0}, {'size': '0', 'FavoriteChannel': []}]) {
      container = empty;
      expect(await read(), isEmpty);
    }
    for (final invalid in [{'size': 2, 'FavoriteChannel': []}, {'size': '2', 'FavoriteChannel': []}, {'FavoriteChannel': [42]}]) {
      container = invalid;
      await expectLater(read(), throwsFormatException);
    }
  });
}
