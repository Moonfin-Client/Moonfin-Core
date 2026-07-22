import 'package:dio/dio.dart';

import '../diagnostics/server_log_sink.dart';
import '../models/device_info.dart';
import 'auth_header.dart';
import 'redirect_interceptor.dart';

/// Wires up redirect handling, the Authorization header and network logging
/// shared by all media server clients.
void attachServerInterceptors(
  Dio dio, {
  required DeviceInfo deviceInfo,
  required String authScheme,
  required String? Function() getAccessToken,
}) {
  dio.interceptors.add(redirectInterceptor(dio));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers['Authorization'] = buildServerAuthorizationHeader(
        scheme: authScheme,
        deviceInfo: deviceInfo,
        accessToken: getAccessToken(),
      );
      ServerLog.network('→ ${options.method} ${options.uri}');
      handler.next(options);
    },
    onResponse: (response, handler) {
      ServerLog.network(
        '← ${response.statusCode} ${response.requestOptions.method} '
        '${response.requestOptions.uri}',
      );
      handler.next(response);
    },
    onError: (error, handler) {
      ServerLog.network(
        '✗ ${error.requestOptions.method} ${error.requestOptions.uri} '
        '(${error.response?.statusCode ?? error.type.name})',
        level: ServerLogLevel.error,
        error: error.message ?? error.toString(),
      );
      handler.next(error);
    },
  ));
}
