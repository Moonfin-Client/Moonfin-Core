import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Server _server(String id, ServerType type) => Server(
  id: id,
  name: id,
  address: 'https://$id.test',
  version: '1',
  serverType: type,
  dateAdded: DateTime.utc(2026),
  dateLastAccessed: DateTime.utc(2026),
);

void main() {
  test('a saved Silo server is hidden while Silo support is off', () async {
    // The tests build without MOONFIN_SILO, so support is off here.
    expect(siloSupportEnabled, isFalse);
    SharedPreferences.setMockInitialValues({});
    final store = AuthenticationStore();
    await store.init();

    await store.putServer(_server('jelly', ServerType.jellyfin));
    await store.putServer(_server('silo', ServerType.silo));

    expect(store.getServers().map((s) => s.id), ['jelly']);
    expect(store.getServer('silo'), isNull);
    expect(store.getServer('jelly'), isNotNull);
  });
}
