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

// Routes each candidate by port: [reachablePort] goes to a listener that
// hangs up mid-handshake, like a proxy refusing a missing client certificate
// over TLS 1.3, and everything else to a port nothing listens on.
class _Overrides extends HttpOverrides {
  _Overrides({
    required this.reachablePort,
    required this.hangUpPort,
    required this.closedPort,
  });

  final int reachablePort;
  final int hangUpPort;
  final int closedPort;

  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..connectionFactory = (uri, proxyHost, proxyPort) {
          final reached = uri.port == reachablePort;
          final port = reached ? hangUpPort : closedPort;
          return uri.isScheme('https')
              ? SecureSocket.startConnect(InternetAddress.loopbackIPv4, port)
              : Socket.startConnect(InternetAddress.loopbackIPv4, port);
        };
}

void main() {
  late ServerSocket hangUp;
  late int closedPort;

  setUp(() async {
    hangUp = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    hangUp.listen((socket) => socket.destroy());
    final probe = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    closedPort = probe.port;
    await probe.close();
  });

  tearDown(() => hangUp.close());

  test(
    'the import is offered for the https address that was reached, not the '
    'first one tried',
    () async {
      final repo = ServerRepository(_AuthStore(), _ClientFactory());
      final server = await HttpOverrides.runWithHttpOverrides(
        () => repo.addServer('https://media.example.com'),
        _Overrides(
          reachablePort: 8920,
          hangUpPort: hangUp.port,
          closedPort: closedPort,
        ),
      );

      expect(server, isNull);
      final failure = repo.lastFailure!;
      expect(failure.candidatesTried.first, 'https://media.example.com');
      expect(
        failure.possibleClientCertCandidate,
        'https://media.example.com:8920',
      );
    },
  );

  test('nothing is offered when no https address answered', () async {
    final repo = ServerRepository(_AuthStore(), _ClientFactory());
    await HttpOverrides.runWithHttpOverrides(
      () => repo.addServer('https://media.example.com'),
      _Overrides(
        reachablePort: -1,
        hangUpPort: hangUp.port,
        closedPort: closedPort,
      ),
    );

    expect(repo.lastFailure!.possibleClientCertCandidate, isNull);
  });
}
