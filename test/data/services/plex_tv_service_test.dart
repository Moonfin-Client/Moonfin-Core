import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/plex_tv_service.dart';

void main() {
  group('PlexServer.fromJson', () {
    Map<String, dynamic> connection(
      String address, {
      bool local = false,
      bool relay = false,
    }) => {'address': address, 'port': 32400, 'local': local, 'relay': relay};

    test('prefers a local connection over remote and relay', () {
      final server = PlexServer.fromJson({
        'name': 'Basement',
        'connections': [
          connection('10.0.0.1', relay: true),
          connection('203.0.113.7'),
          connection('192.168.50.45', local: true),
        ],
      });
      expect(server.name, 'Basement');
      expect(server.address, '192.168.50.45:32400');
    });

    test('falls back to relay when nothing else is listed', () {
      final server = PlexServer.fromJson({
        'name': 'Remote',
        'connections': [connection('10.0.0.1', relay: true)],
      });
      expect(server.address, '10.0.0.1:32400');
    });

    test('has no address without connections', () {
      expect(PlexServer.fromJson({'name': 'Empty'}).address, isNull);
    });
  });
}
