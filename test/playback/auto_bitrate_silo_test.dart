import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/log_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/playback/auto_bitrate_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

void main() {
  late HttpServer server;
  late int requests;

  // No TestWidgetsFlutterBinding here: it would replace dart:io's HttpClient
  // with one that answers 400 without connecting, and the point of this test
  // is to count real requests to a local server.
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<LogService>(
      LogService(
        UserPreferences(store),
        MediaServerClientFactory(deviceInfo: _device),
        _device,
      ),
    );
    requests = 0;
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      requests++;
      request.response.statusCode = 404;
      await request.response.close();
    });
  });

  tearDown(() async {
    await server.close(force: true);
    await GetIt.instance.reset();
  });

  Future<int?> measureFor(ServerType type) {
    final factory = MediaServerClientFactory(deviceInfo: _device);
    // The service measures the signed in server's client.
    GetIt.instance.registerSingleton<MediaServerClient>(
      factory.getClient(
        serverId: 'server',
        serverType: type,
        baseUrl: 'http://127.0.0.1:${server.port}',
      ),
    );
    return AutoBitrateService(factory).measuredBpsForActiveServer();
  }

  test('Silo gets no measurement and no probe request', () async {
    expect(await measureFor(ServerType.silo), isNull);
    expect(requests, 0);
  });

  test('Jellyfin still probes the server', () async {
    // The fake server refuses the probe (the service then falls back to its
    // default ceiling). What matters is that the request reached it.
    await measureFor(ServerType.jellyfin);
    expect(requests, greaterThan(0));
  });
}
