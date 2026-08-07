import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'server_user_agent.dart';

void configureServerDio(Dio dio) {
  dio.transformer = FusedTransformer(contentLengthIsolateThreshold: 50 * 1024);

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();

      client.userAgent = serverUserAgent;

      client.badCertificateCallback = (_, _, _) => true;

      client.connectionTimeout = const Duration(seconds: 30);
      client.idleTimeout = const Duration(seconds: 120);

      client.maxConnectionsPerHost = 15;

      return client;
    },
  );
}
