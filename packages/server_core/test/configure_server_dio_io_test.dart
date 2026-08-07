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
}
