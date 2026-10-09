import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:server_core/server_core.dart';

void main() {
  Server idnServer() => Server(
    id: 'server-1',
    name: 'Books',
    address: 'https://xn--bcher-kva.de',
    displayAddress: 'https://bücher.de',
    version: '1.0.0',
    serverType: ServerType.jellyfin,
    dateAdded: DateTime.utc(2026, 8, 20),
  );

  test('stores the display address beside the Punycode address', () {
    final server = idnServer();

    final json = server.toJson();
    expect(json['address'], 'https://xn--bcher-kva.de');
    expect(json['displayAddress'], 'https://bücher.de');

    final restored = Server.fromJson(server.id, json);
    expect(restored.address, 'https://xn--bcher-kva.de');
    expect(restored.displayAddress, 'https://bücher.de');
  });

  test('legacy stored servers have no display address', () {
    final restored = Server.fromJson('legacy', {
      'name': 'Legacy',
      'address': 'https://example.com',
      'version': '1.0.0',
      'serverType': ServerType.jellyfin.name,
      'dateAdded': DateTime.utc(2026, 8, 20).toIso8601String(),
    });

    expect(restored.address, 'https://example.com');
    expect(restored.displayAddress, isNull);
  });

  test('copyWith keeps the display address unless told to clear it', () {
    final server = idnServer();
    final cleared = server.copyWith(clearDisplayAddress: true);

    expect(
      server.copyWith(name: 'Renamed').displayAddress,
      'https://bücher.de',
    );
    expect(cleared.displayAddress, isNull);
    expect(cleared.address, 'https://xn--bcher-kva.de');
  });
}
