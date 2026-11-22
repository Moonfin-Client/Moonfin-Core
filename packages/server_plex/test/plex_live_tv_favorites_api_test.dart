import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/src/api/plex_live_tv_favorites_api.dart';
import 'package:test/test.dart';

void main() {
  test('Plex favorites preserve account auth and the complete remote list', () async {
    const device = DeviceInfo(
      id: 'device', name: 'Test', appName: 'Moonfin', appVersion: '1',
    );
    Map<String, dynamic> payload = {
      'MediaContainer': {
        'FavoriteChannel': [
          {'source': 'provider://tv.plex.provider.epg', 'id': 'free'},
          {'source': 'server://other-pms/dvr', 'id': '4'},
        ],
      },
    };
    final requests = <RequestOptions>[];
    final dio = Dio()..interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        requests.add(request);
        handler.resolve(Response(
          requestOptions: request,
          statusCode: 200,
          data: request.method == 'GET' ? payload : null,
        ));
      },
    ));
    addTearDown(() => dio.close());
    final api = PlexLiveTvFavoritesApi(dio: dio);
    Future<List<Map<String, dynamic>>> read() =>
        api.readFavorites(deviceInfo: device, accountToken: 'account-token');

    final rows = await read();
    await api.writeFavorites(
      deviceInfo: device, accountToken: 'account-token', rows: rows,
    );
    expect(rows, hasLength(2));
    expect(requests.map((r) => r.method), ['GET', 'PUT']);
    expect(requests.every((r) =>
        r.uri.toString() ==
        'https://epg.provider.plex.tv/settings/favoriteChannels'), isTrue);
    expect(requests.every((r) =>
        r.headers['X-Plex-Token'] == 'account-token'), isTrue);
    expect(requests.last.data, rows);

    payload = {'MediaContainer': {'size': 0}};
    expect(await read(), isEmpty);
    payload = {'MediaContainer': {'FavoriteChannel': [42]}};
    await expectLater(read(), throwsA(isA<FormatException>()));
  });
}
