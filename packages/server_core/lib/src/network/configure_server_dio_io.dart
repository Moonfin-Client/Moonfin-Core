import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

const _serverUserAgent = 'Mozilla/5.0 (compatible; Moonfin/Flutter)';

void configureServerDio(Dio dio) {
  dio.transformer = FusedTransformer(contentLengthIsolateThreshold: 50 * 1024);

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();

      // Dart's default user agent is blocked by some reverse proxies. Keep a
      // browser-compatible prefix while identifying Moonfin to server logs.
      client.userAgent = _serverUserAgent;

      client.badCertificateCallback = (_, _, _) => true;

      client.connectionTimeout = const Duration(seconds: 30);
      client.idleTimeout = const Duration(seconds: 120);

      client.maxConnectionsPerHost = 15;

      return client;
    },
  );
}
