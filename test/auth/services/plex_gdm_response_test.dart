import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/services/server_discovery_service_io.dart';
import 'package:server_core/server_core.dart';

void main() {
  test('reads a Plex GDM reply into a discovered server', () {
    final server = parsePlexGdmResponse(
      'HTTP/1.0 200 OK\r\n'
      'Content-Type: plex/media-server\r\n'
      'Name: plex\r\n'
      'Port: 32400\r\n'
      'Resource-Identifier: d3b9933a\r\n'
      'Version: 1.43.4\r\n\r\n',
      '192.168.50.45',
    );
    expect(server?.id, 'd3b9933a');
    expect(server?.name, 'plex');
    expect(server?.address, 'http://192.168.50.45:32400');
    expect(server?.serverType, ServerType.plex);
  });

  test('ignores replies from other Plex devices', () {
    expect(
      parsePlexGdmResponse(
        'HTTP/1.0 200 OK\r\n'
        'Content-Type: plex/media-player\r\n'
        'Resource-Identifier: player\r\n\r\n',
        '192.168.50.20',
      ),
      isNull,
    );
  });
}
