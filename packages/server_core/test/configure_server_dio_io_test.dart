import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  group('configureServerDio', () {
    late HttpServer server;
    late StreamSubscription<HttpRequest> requests;

    setUp(() async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    });

    tearDown(() async {
      await requests.cancel();
      await server.close(force: true);
    });

    test('uses a browser-compatible Moonfin user agent', () async {
      final receivedUserAgent = Completer<String?>();
      requests = server.listen((request) async {
        receivedUserAgent.complete(
          request.headers.value(HttpHeaders.userAgentHeader),
        );
        request.response.statusCode = HttpStatus.noContent;
        await request.response.close();
      });

      final dio = Dio();
      configureServerDio(dio);

      try {
        await dio.get<void>('http://127.0.0.1:${server.port}/');

        expect(
          await receivedUserAgent.future,
          'Mozilla/5.0 (compatible; Moonfin/Flutter)',
        );
      } finally {
        dio.close(force: true);
      }
    });
  });
}
