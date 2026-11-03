import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/repositories/server_user_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:server_core/server_core.dart';

class _UnusedStore extends Fake implements AuthenticationStore {}

void main() {
  // No TestWidgetsFlutterBinding: it would swap dart:io's HttpClient for one
  // that never connects, and this test counts real requests.
  late HttpServer server;
  late List<String> paths;

  setUp(() async {
    paths = [];
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      paths.add(request.uri.path);
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType.json
        ..write('[{"Id":"u1","Name":"Brady","HasPassword":true}]');
      await request.response.close();
    });
  });

  tearDown(() => server.close(force: true));

  Server serverOf(ServerType type) => Server(
    id: 's1',
    name: 'Test',
    address: 'http://127.0.0.1:${server.port}',
    version: '1',
    serverType: type,
    dateAdded: DateTime.utc(2026, 10, 13),
  );

  test('Silo has no public user list and is not asked for one', () async {
    final users = await ServerUserRepository(
      _UnusedStore(),
    ).getPublicServerUsers(serverOf(ServerType.silo));
    expect(users, isEmpty);
    expect(paths, isEmpty);
  });

  test('Jellyfin still lists its public users', () async {
    final users = await ServerUserRepository(
      _UnusedStore(),
    ).getPublicServerUsers(serverOf(ServerType.jellyfin));
    expect(users.single.name, 'Brady');
    expect(paths, ['/Users/Public']);
  });
}
