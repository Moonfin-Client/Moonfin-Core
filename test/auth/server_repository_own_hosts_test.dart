import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';

import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';

class _AuthStore extends Fake implements AuthenticationStore {
  @override
  Future<void> putServer(Server server) async {}
}

class _ClientFactory extends Fake implements MediaServerClientFactory {}

void main() {
  tearDown(() {
    gAllowSelfSignedCertificates = false;
    gIsOwnServerHost = (_) => false;
  });

  test('self-signed certificates only pass for the user\'s own servers',
      () async {
    final repo = ServerRepository(_AuthStore(), _ClientFactory());
    await repo.saveServer(
      Server(
        id: 'plex',
        name: 'Plex',
        address: 'https://media.home.lan:32400',
        candidateAddresses: const ['https://10-0-0-5.abc.plex.direct:32400'],
        version: '1',
        serverType: ServerType.plex,
        dateAdded: DateTime(2026),
      ),
    );
    await repo.addServer('http://127.0.0.1:1');

    gAllowSelfSignedCertificates = true;
    expect(acceptsUntrustedCertificate('media.home.lan'), isTrue);
    expect(acceptsUntrustedCertificate('10-0-0-5.abc.plex.direct'), isTrue);
    expect(acceptsUntrustedCertificate('127.0.0.1'), isTrue, reason: 'typed');
    expect(acceptsUntrustedCertificate('plex.tv'), isFalse);

    gAllowSelfSignedCertificates = false;
    expect(acceptsUntrustedCertificate('media.home.lan'), isFalse);
  });
}
