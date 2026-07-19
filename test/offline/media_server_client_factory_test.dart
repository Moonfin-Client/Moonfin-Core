import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:server_core/server_core.dart';

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
}
