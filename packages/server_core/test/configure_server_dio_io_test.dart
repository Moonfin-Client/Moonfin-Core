import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  group('configureServerDio', () {
    late HttpServer server;
    StreamSubscription<HttpRequest>? requests;

    setUp(() async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    });

    tearDown(() async {
      await requests?.cancel();
      await server.close(force: true);
      // The version is process-wide, so clear it to keep tests independent.
      setServerUserAgentVersion('');
    });

    // Answers one request and reports the user agent it arrived with.
    Future<String?> userAgentOfNextRequest() async {
      final received = Completer<String?>();
      requests = server.listen((request) async {
        if (!received.isCompleted) {
          received.complete(request.headers.value(HttpHeaders.userAgentHeader));
        }
        request.response.statusCode = HttpStatus.noContent;
        await request.response.close();
      });

      final dio = Dio();
      configureServerDio(dio);

      try {
        await dio.get<void>('http://127.0.0.1:${server.port}/');
        return await received.future;
      } finally {
        dio.close(force: true);
      }
    }

    test('uses a browser-compatible Moonfin user agent', () async {
      expect(
        await userAgentOfNextRequest(),
        'Mozilla/5.0 (compatible; Moonfin/Flutter)',
      );
    });

    test('includes the app version once startup records it', () async {
      setServerUserAgentVersion('2.3.2');

      expect(
        await userAgentOfNextRequest(),
        'Mozilla/5.0 (compatible; Moonfin/2.3.2)',
      );
    });

    test('truncates at anything that would break the header', () async {
      setServerUserAgentVersion('2.3.2 (beta)\r\nX-Injected: 1');

      expect(
        await userAgentOfNextRequest(),
        'Mozilla/5.0 (compatible; Moonfin/2.3.2)',
      );
    });

    test('falls back to an unversioned agent for a blank version', () async {
      setServerUserAgentVersion('   ');

      expect(
        await userAgentOfNextRequest(),
        'Mozilla/5.0 (compatible; Moonfin/Flutter)',
      );
    });
  });

  // A screen that asks for more at once than the slots hold has to queue, and
  // none of that wait may count against the connect timeout.
  group('slot limited requests', () {
    late HttpServer server;
    const slowResponse = Duration(milliseconds: 300);
    const moreRequestsThanSlots = 60;
    var inFlight = 0;
    var mostInFlight = 0;
    var failEveryRequest = false;

    setUp(() async {
      inFlight = 0;
      mostInFlight = 0;
      failEveryRequest = false;
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((request) async {
        inFlight++;
        if (inFlight > mostInFlight) mostInFlight = inFlight;
        await Future<void>.delayed(slowResponse);
        inFlight--;
        request.response.statusCode = failEveryRequest
            ? HttpStatus.internalServerError
            : HttpStatus.ok;
        await request.response.close();
      });
    });

    tearDown(() => server.close(force: true));

    Dio dioWith(Duration connectTimeout) {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'http://${server.address.address}:${server.port}',
          connectTimeout: connectTimeout,
        ),
      );
      configureServerDio(dio);
      return dio;
    }

    Future<List<Object?>> fireConcurrently(Dio dio) => Future.wait(
      List.generate(
        moreRequestsThanSlots,
        (i) => dio
            .get<void>('/$i')
            .then<Object?>((r) => r)
            .catchError((Object e) => e),
      ),
    );

    test('queueing is never billed to the connect timeout', () async {
      final results = await fireConcurrently(
        dioWith(const Duration(milliseconds: 400)),
      );
      expect(results.whereType<DioException>(), isEmpty);
    });

    test('holds the rest back once the slots are taken', () async {
      await fireConcurrently(dioWith(const Duration(seconds: 30)));
      // A browser allows itself six per host without multiplexing, and going
      // past that is what a proxy reads as a flood.
      expect(mostInFlight, lessThanOrEqualTo(6));
      expect(mostInFlight, greaterThan(1));
    });

    test('hands a slot back when the request fails', () async {
      final dio = dioWith(const Duration(seconds: 30));
      failEveryRequest = true;
      final failed = await fireConcurrently(dio);
      expect(
        failed.whereType<DioException>(),
        hasLength(moreRequestsThanSlots),
      );

      failEveryRequest = false;
      final response = await dio
          .get<void>('/after')
          .timeout(const Duration(seconds: 5));
      expect(response.statusCode, HttpStatus.ok);
    });
  });

  group('the pool idle timeout', () {
    late HttpServer server;
    late Set<int> connections;

    setUp(() async {
      connections = <int>{};
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((request) async {
        // One remote port is one connection, so counting them counts reuse.
        connections.add(request.connectionInfo!.remotePort);
        request.response.statusCode = HttpStatus.noContent;
        await request.response.close();
      });
    });

    tearDown(() => server.close(force: true));

    Future<void> twoRequests(Duration idleTimeout, Duration apart) async {
      final dio = Dio(
        BaseOptions(baseUrl: 'http://${server.address.address}:${server.port}'),
      );
      configureServerDio(dio, idleTimeout: idleTimeout);
      addTearDown(() => dio.close(force: true));

      await dio.get<void>('/one');
      await Future<void>.delayed(apart);
      await dio.get<void>('/two');
    }

    test('keeps a connection for a caller that comes straight back', () async {
      await twoRequests(
        const Duration(seconds: 10),
        const Duration(milliseconds: 50),
      );

      expect(connections, hasLength(1));
    });

    test('drops it once the caller has been away for longer', () async {
      await twoRequests(
        const Duration(milliseconds: 100),
        const Duration(milliseconds: 400),
      );

      expect(connections, hasLength(2));
    });
  });

  // A slot frees when the headers land, but dart:io keeps the connection until
  // the body has drained, so the pool has to be roomier than the slots.
  group('a body still draining', () {
    late HttpServer server;
    const bodyDelay = Duration(milliseconds: 1500);

    setUp(() async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((request) async {
        // Headers straight away, body much later, which is the shape that
        // leaves a connection busy long after its slot went back.
        final socket = await request.response.detachSocket(writeHeaders: false);
        socket.write(
          'HTTP/1.1 200 OK\r\n'
          'Content-Type: application/json\r\n'
          'Content-Length: 8\r\n'
          '\r\n',
        );
        await socket.flush();
        await Future<void>.delayed(bodyDelay);
        socket.write('{"ok":1}');
        await socket.flush();
        socket.destroy();
      });
    });

    tearDown(() => server.close(force: true));

    test('does not park the next request in the dart:io queue', () async {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'http://${server.address.address}:${server.port}',
          // Short on purpose. Anything parked in the queue inside dart:io is
          // billed to this, which is what made a busy screen read as a
          // connection timeout.
          connectTimeout: const Duration(milliseconds: 400),
        ),
      );
      configureServerDio(dio);
      addTearDown(() => dio.close(force: true));

      final results = await Future.wait(
        List.generate(
          12,
          (i) => dio
              .get<dynamic>('/$i')
              .then<Object?>((r) => r)
              .catchError((Object e) => e),
        ),
      );

      expect(results.whereType<DioException>(), isEmpty);
    });
  });

  // dart:io hands out a pooled connection without checking it is still open,
  // and one the peer already dropped only fails once TCP gives up.
  group('a pooled connection that died', () {
    final retries = <String>[];
    var handled = 0;

    setUp(() {
      retries.clear();
      handled = 0;
      ServerLog.sink = (category, level, message, {error}) {
        if (message.startsWith('Connection died')) retries.add(message);
      };
    });

    tearDown(() => ServerLog.sink = null);

    // Reads the request and drops the socket without writing anything back,
    // which is what a connection the peer let go of looks like.
    Future<HttpServer> serverKilling(int firstRequests) async {
      final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      addTearDown(() => server.close(force: true));
      server.listen((request) async {
        handled++;
        if (handled <= firstRequests) {
          final socket = await request.response.detachSocket();
          socket.destroy();
          return;
        }
        request.response.write('{"ok":true}');
        await request.response.close();
      });
      return server;
    }

    Dio dioFor(HttpServer server) {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'http://${server.address.address}:${server.port}',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );
      configureServerDio(dio);
      return dio;
    }

    test('a GET is asked for again and the caller never sees it', () async {
      final dio = dioFor(await serverKilling(1));
      addTearDown(() => dio.close(force: true));

      final response = await dio.get<dynamic>('/Users/Me');

      expect(response.statusCode, HttpStatus.ok);
      expect(handled, 2);
      expect(retries, hasLength(1));
    });

    test('a POST is left alone so the server never runs it twice', () async {
      final dio = dioFor(await serverKilling(1));
      addTearDown(() => dio.close(force: true));

      await expectLater(
        dio.post<dynamic>('/Sessions/Capabilities/Full', data: {'a': 1}),
        throwsA(isA<DioException>()),
      );
      expect(handled, 1);
    });

    test('a second death in a row gives up instead of looping', () async {
      final dio = dioFor(await serverKilling(9));
      addTearDown(() => dio.close(force: true));

      await expectLater(
        dio.get<dynamic>('/Users/Me'),
        throwsA(isA<DioException>()),
      );
      expect(handled, 2);
    });

    test('a host that refuses is not asked twice', () async {
      // Nothing answered, so there is no dead connection to shake off and a
      // second attempt only doubles the wait in front of the offline banner.
      final closed = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      final port = closed.port;
      await closed.close(force: true);

      final dio = Dio(
        BaseOptions(
          baseUrl: 'http://127.0.0.1:$port',
          connectTimeout: const Duration(seconds: 5),
        ),
      );
      configureServerDio(dio);
      addTearDown(() => dio.close(force: true));

      await expectLater(
        dio.get<dynamic>('/Users/Me'),
        throwsA(isA<DioException>()),
      );
      expect(retries, isEmpty);
    });

    test('a body that already started is never asked for again', () async {
      final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      addTearDown(() => server.close(force: true));
      server.listen((request) async {
        handled++;
        // Written by hand because detachSocket refuses once the headers have
        // gone out, and this needs them out before the socket dies.
        final socket = await request.response.detachSocket(writeHeaders: false);
        socket.write(
          'HTTP/1.1 200 OK\r\n'
          'Content-Type: application/json\r\n'
          'Content-Length: 4096\r\n'
          '\r\n'
          'only a little',
        );
        await socket.flush();
        socket.destroy();
      });

      final dio = dioFor(server);
      addTearDown(() => dio.close(force: true));

      await expectLater(dio.get<dynamic>('/big'), throwsA(isA<DioException>()));
      // Headers were out, so the server did work the retry must not repeat.
      expect(handled, 1);
    });
  });

  group('an untrusted certificate', () {
    late HttpServer server;

    setUp(() async {
      final context = SecurityContext()
        ..useCertificateChainBytes(_selfSignedCertificate.codeUnits)
        ..usePrivateKeyBytes(_selfSignedKey.codeUnits);
      server = await HttpServer.bindSecure(
        InternetAddress.loopbackIPv4,
        0,
        context,
      );
      server.listen((request) async {
        request.response.statusCode = HttpStatus.noContent;
        await request.response.close();
      });
    });

    tearDown(() async {
      gAllowSelfSignedCertificates = false;
      await server.close(force: true);
    });

    Future<int?> statusOf(Dio dio) async {
      try {
        final response = await dio.get<void>(
          'https://127.0.0.1:${server.port}/',
        );
        return response.statusCode;
      } finally {
        dio.close(force: true);
      }
    }

    test(
      'is refused while the user has not allowed self-signed ones',
      () async {
        final dio = Dio();
        configureServerDio(dio);

        await expectLater(
          statusOf(dio),
          throwsA(
            isA<DioException>().having(
              isUntrustedCertificate,
              'an untrusted certificate',
              isTrue,
            ),
          ),
        );
      },
    );

    test('is accepted once the user allows self-signed ones', () async {
      gAllowSelfSignedCertificates = true;
      final dio = Dio();
      configureServerDio(dio);

      expect(await statusOf(dio), HttpStatus.noContent);
    });

    test('is the only failure read as one', () {
      final refused = DioException.connectionError(
        requestOptions: RequestOptions(path: '/'),
        reason: 'refused',
        error: const SocketException('Connection refused'),
      );

      expect(isUntrustedCertificate(refused), isFalse);
      expect(isUntrustedCertificate(StateError('bug')), isFalse);
      expect(isUntrustedCertificate(null), isFalse);
    });
  });
}

// A self-signed certificate for 127.0.0.1 and its key, used only by the tests
// above.
const _selfSignedCertificate = '''
-----BEGIN CERTIFICATE-----
MIIDHDCCAgSgAwIBAgIUd6aI6q7jVvc06OotVkZtTgIOIxcwDQYJKoZIhvcNAQEL
BQAwFDESMBAGA1UEAwwJMTI3LjAuMC4xMCAXDTI2MTAwMjAwMzYzMFoYDzIxMjYw
OTA4MDAzNjMwWjAUMRIwEAYDVQQDDAkxMjcuMC4wLjEwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDIVeFC2ZId8nyItKdDZFqeM2ZuPTkVIGG66iCkf9UJ
owpw36EZivH/yVJkw3nDLVjvR93oG0C3TWXhwRueYzzCVAy0eI7S6AasmkJi6FUv
zKrVH6yLdP1vtbcQrhav+lrUbCyja5JfkemKFf67ar8fm4VSXJRS0Scm7bgkmYIn
hBTBYgMWnoKzqZma3usfqUWcZ9kPZ+5geKbqDeKkQMKYqKvEG+99tp0vglJeCZM4
Lu8/NqXqyPjINLsE5cNzzlqCCUfovkt7XvgJ4jnfQIZLwoAVZAztXaiZ+9qWdAWG
CEoGO+oDbB6169+vNfT4UPiI5hzk8ldGauHJ7R+K0r9RAgMBAAGjZDBiMB0GA1Ud
DgQWBBTXFD9LJa5dxR8YVlUpG+gqnzDYqzAfBgNVHSMEGDAWgBTXFD9LJa5dxR8Y
VlUpG+gqnzDYqzAPBgNVHRMBAf8EBTADAQH/MA8GA1UdEQQIMAaHBH8AAAEwDQYJ
KoZIhvcNAQELBQADggEBAFvrLgVEPVBhIULRjxOk3BL+w8kYXxllmyIpE6XHKQVG
kc3jEai7gACWCS/Wuz2ldTQAtUtdL9uVt2ggBZ6As2Bq6PazzAUApZZMN5X7T7pa
qgZWQA2Hy6/tNjaNP/91/ELI4yVkVxYilBI7wyytFg2WnQQgv5+0DLIrVtF8e9xV
2Cg8jut8OP92TjCGwHOiWc9eGzq7CzyvHTfglaIQKHTVksF8cCD2RcI8+ALT/Wzl
GTHblhl7E/jdNEziaKn2JdO7cIJUaevh6j/2E4H+pTXgJufYyLOWc3EDKC1OgiZ6
CLvZCbmJfvb30ZUlO4c4KI4E8KHR5UgQXd4goCTjVW8=
-----END CERTIFICATE-----
''';

const _selfSignedKey = '''
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDIVeFC2ZId8nyI
tKdDZFqeM2ZuPTkVIGG66iCkf9UJowpw36EZivH/yVJkw3nDLVjvR93oG0C3TWXh
wRueYzzCVAy0eI7S6AasmkJi6FUvzKrVH6yLdP1vtbcQrhav+lrUbCyja5JfkemK
Ff67ar8fm4VSXJRS0Scm7bgkmYInhBTBYgMWnoKzqZma3usfqUWcZ9kPZ+5geKbq
DeKkQMKYqKvEG+99tp0vglJeCZM4Lu8/NqXqyPjINLsE5cNzzlqCCUfovkt7XvgJ
4jnfQIZLwoAVZAztXaiZ+9qWdAWGCEoGO+oDbB6169+vNfT4UPiI5hzk8ldGauHJ
7R+K0r9RAgMBAAECggEAFY1bqw/yDsO4DxL0TaU9tHhOJDz056dwrCWk9l2EQ0Gl
jWgZkkBm8YAsm4eGEW/O+gsOvfo0l6O9erCGMp91eWiGZ2Hy55CrqyT7UF2zUG2h
0UTTkLs4yqxPcf1wlmUGIYUzti8L87kkWUUtfucogZN/H9Gy6Uf0ANWhMlrLbEmx
3fPtoSy1H51LElkSjmXgB+8MGXSPCZE9RlspFOs5iR0vqaI8Un/IAGgSMXIFdJvP
5JZJ7u5mUQ8VWRovNMcCYwyNS0z/tDrwfI1gltDcrE9dCkWwaZ2RSW/pBAS02JYA
wTjFO+HZIE5GabSazxpovEs1VAllhuXSfH6iJ/vAIQKBgQD7WvRjOgCM1Cp2uxD+
WwD6v7QWsoE7D3qFL2ZA4oiK94S9Mtmhh0pMwfQuypCGuW+vaSRxXpoAy2i64kvx
i/CVc9mhU4VfCqXVaU0v43oJmcanPbK+q9WfyZ3Drg0iSQBoQDz0agsDx37FlSWX
6DwhXUFkasXklAWxBEwYbTpaeQKBgQDMCZL74moQONbRHkmryx97GzAeNSeammso
HbpCyVC4AepMeGQE/XtGDgW4ewwD2UZpTih6+uEFelvTZSerfd7/kOcJlgdXw0km
IaYwqgtifeDbO+qmWZGo9OyNK57vrpN2G47tllzWqffebYntWWHgfqF8EUkYCh/c
nP6OOAzVmQKBgQCKbKDCNKMw63cnRAYrzfpQHVsUVOIOoIuc5WmuuhLwVTfo6iQo
bNViSD4ttqi5SU5Uj9beCHdPkLXwlce1Epg/9jkYO2Lr4HVLfl5fzSrcNq/MUpIp
p4BSKzqTFTtucj2jLB1ljTDbt/X84hJ+Agt7ZFwq7RJmu44W2oL9wMmuIQKBgAM/
R8KQeOWnMewEEmIUiny4Ewz4BZhVSs1Jo9Q6RfmXtjXfWKAntJWJ1Zd5Bdjt1UwJ
vWUvpvMiXmG/42C8URc6JCMn6xf/eKONt4pgumun2zNCAdsB4+qPc1BP2GiyG5Cu
oZiwYuvbqqE0lxRa7s7W1RUXZVVnm9gz+20iATpJAoGBAIGNPiN+TXoEuuAOk1DJ
5Kxi2WIKkgkYS/j/WrqJ5iy900MpDt+vF5PthFGBp8q+X4TOTEBLMO2WNOTuqkof
1WaB9xPeh32Wtblqb1e3jMhIH8hAIQSy/EXWmWKcHwDnvopFONFg4K5+OVxCNE1I
tGeB6FL356Pj6Ltsc5k5fWwn
-----END PRIVATE KEY-----
''';
