import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

void main() {
  test('skips the offline wrapper when the offline stack is missing', () {
    // Background isolates register a minimal set of services, so resolving the
    // catalog here used to throw and take the worker down with it.
    final factory = MediaServerClientFactory(
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Device',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
    );

    final client = factory.getClient(
      serverId: 'server',
      serverType: ServerType.jellyfin,
      baseUrl: 'http://example.test',
    );

    expect(client, isNot(isA<ConnectivityAwareMediaServerClient>()));
  });

  test('builds a Silo client for a Silo server', () {
    final factory = MediaServerClientFactory(
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Device',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
    );

    final client = factory.getClient(
      serverId: 'silo-server',
      serverType: ServerType.silo,
      baseUrl: 'https://silo.example',
    );

    expect(client, isA<SiloMediaServerClient>());
    expect(client.serverType, ServerType.silo);
    expect(client.baseUrl, 'https://silo.example');
    final silo = client as SiloMediaServerClient;
    // The test host is Linux, and the platform header is always filled in.
    expect(silo.platform, isNotEmpty);
    expect(silo.requestHeaders['X-Silo-Device-Platform'], silo.platform);
    expect(silo.requestHeaders['X-Silo-Device-Id'], 'device');
  });
}
