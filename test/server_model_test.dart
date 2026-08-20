import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:server_core/server_core.dart';

void main() {
  test('stores display and connection addresses separately', () {
    final server = Server(
      id: 'server-1',
      name: 'Books',
      address: 'https://bücher.de',
      connectionAddress: 'https://xn--bcher-kva.de',
      version: '1.0.0',
      serverType: ServerType.jellyfin,
      dateAdded: DateTime.utc(2026, 8, 20),
    );

    final json = server.toJson();
    expect(json['address'], 'https://bücher.de');
    expect(json['connectionAddress'], 'https://xn--bcher-kva.de');

    final restored = Server.fromJson(server.id, json);
    expect(restored.address, 'https://bücher.de');
    expect(restored.connectionAddress, 'https://xn--bcher-kva.de');
  });

  test('legacy stored servers use address as the connection address', () {
    final restored = Server.fromJson('legacy', {
      'name': 'Legacy',
      'address': 'https://example.com',
      'version': '1.0.0',
      'serverType': ServerType.jellyfin.name,
      'dateAdded': DateTime.utc(2026, 8, 20).toIso8601String(),
    });

    expect(restored.address, 'https://example.com');
    expect(restored.connectionAddress, 'https://example.com');
  });
}
