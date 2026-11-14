import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_http_client.dart';
import 'package:moonfin/data/services/seerr/seerr_models.dart';

void main() {
  late HttpServer server;
  final requests = <({String path, Map<String, String> headers, String body})>[];

  setUp(() async {
    requests.clear();
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      final body = await utf8.decoder.bind(request).join();
      final headers = <String, String>{};
      request.headers.forEach((name, values) => headers[name] = values.join(','));
      requests.add((path: request.uri.path, headers: headers, body: body));
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({
        'success': true,
        'seerrUserId': 7,
        'displayName': 'kid',
        'enabled': true,
        'authenticated': true,
        'permissions': 0,
      }));
      await request.response.close();
    });
  });

  tearDown(() => server.close(force: true));

  String base() => 'http://${server.address.host}:${server.port}';

  SeerrHttpClient plexClient() => SeerrHttpClient(
    proxyConfig: MoonfinProxyConfig(
      jellyfinBaseUrl: base(),
      jellyfinToken: 'pms',
      authHeaders: const {'X-Plex-Token': 'pms'},
    ),
  );

  test('Moonbase for Plex gets the PMS token and the plex.tv token only in the sign in', () async {
    final client = plexClient();
    final result = await client.moonfinPlexLogin(authToken: 'plextv');
    client.close();

    expect(result.success, isTrue);
    expect(result.seerrUserId, 7);
    final login = requests.single;
    expect(login.path, '/Moonfin/Seerr/Login');
    expect(login.headers['x-plex-token'], 'pms');
    expect(login.headers.containsKey('authorization'), isFalse);
    expect(jsonDecode(login.body), {'authType': 'plex', 'authToken': 'plextv'});
  });

  test('the settings sign in sends the plex.tv token with authType plex', () async {
    final client = plexClient();
    await client.moonfinLogin(
      username: '',
      password: '',
      authType: 'plex',
      authToken: 'plextv',
    );
    client.close();

    final body = jsonDecode(requests.single.body) as Map<String, dynamic>;
    expect(body['authType'], 'plex');
    expect(body['authToken'], 'plextv');
  });

  test('a password sign in leaves authToken out', () async {
    final client = plexClient();
    await client.moonfinLogin(username: 'a@b.c', password: 'pw', authType: 'local');
    client.close();

    expect(
      (jsonDecode(requests.single.body) as Map).containsKey('authToken'),
      isFalse,
    );
  });

  test('a media server keeps the MediaBrowser token', () async {
    final client = SeerrHttpClient(
      proxyConfig: MoonfinProxyConfig(jellyfinBaseUrl: base(), jellyfinToken: 'jf'),
    );
    await client.getMoonfinStatus();
    client.close();

    expect(requests.single.path, '/Moonfin/Seerr/Status');
    expect(requests.single.headers['authorization'], 'MediaBrowser Token="jf"');
  });
}
