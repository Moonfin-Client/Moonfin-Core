import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';

class _AuthStore extends Fake implements AuthenticationStore {
  @override
  Future<void> putServer(Server server) async {}
}

class _ClientFactory extends Fake implements MediaServerClientFactory {}

// Sends every connection to the fake server whatever host the URL names, so
// an IDN host can be probed without DNS.
class _LoopbackOverrides extends HttpOverrides {
  _LoopbackOverrides(this.port);

  final int port;

  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..connectionFactory = (uri, proxyHost, proxyPort) =>
            Socket.startConnect(InternetAddress.loopbackIPv4, port);
}

void main() {
  late HttpServer jellyfin;
  late ServerRepository repo;
  final hostHeaders = <String>[];

  setUp(() async {
    hostHeaders.clear();
    repo = ServerRepository(_AuthStore(), _ClientFactory());
    jellyfin = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    jellyfin.listen((request) {
      hostHeaders.add(request.headers.value(HttpHeaders.hostHeader) ?? '');
      request.response
        ..headers.contentType = ContentType.json
        ..write(
          jsonEncode({
            'ServerName': 'Books',
            'Version': '10.11.0',
            'ProductName': 'Jellyfin Server',
          }),
        )
        ..close();
    });
  });

  tearDown(() => jellyfin.close(force: true));

  Future<Server?> add(String typed) => HttpOverrides.runWithHttpOverrides(
    () => repo.addServer(typed),
    _LoopbackOverrides(jellyfin.port),
  );

  test(
    'a Unicode host is shown as typed but stored and probed as Punycode',
    () async {
      final server = await add('http://bücher.de:8096');

      expect(server!.address, 'http://xn--bcher-kva.de:8096');
      expect(server.displayAddress, 'http://bücher.de:8096');
      expect(hostHeaders, isNotEmpty);
      expect(hostHeaders, everyElement('xn--bcher-kva.de:8096'));
    },
  );

  test('typed Punycode is never shown decoded', () async {
    final server = await add('http://xn--bcher-kva.de:8096');

    expect(server!.address, 'http://xn--bcher-kva.de:8096');
    expect(server.displayAddress, isNull);
  });

  test('re-adding a server follows how it was typed last', () async {
    final first = await add('http://bücher.de:8096');
    final punycode = await add('http://xn--bcher-kva.de:8096');

    expect(punycode!.id, first!.id);
    expect(punycode.address, 'http://xn--bcher-kva.de:8096');
    expect(punycode.displayAddress, isNull);

    final unicode = await add('http://bücher.de:8096');
    expect(unicode!.id, first.id);
    expect(unicode.displayAddress, 'http://bücher.de:8096');
    expect(repo.servers, hasLength(1));
  });
}
