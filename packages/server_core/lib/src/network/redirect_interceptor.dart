import 'package:dio/dio.dart';

/// Interceptor that follows HTTP redirects (301, 302, 307, 308) for all
/// request methods including POST/PUT, which Dart's HttpClient does not
/// follow automatically.
///
/// The redirected request is sent again with its headers and body. With
/// [sameOriginOnly] a redirect is only followed when it stays on the same
/// origin, or upgrades `http` to `https` on the same host (see
/// [isSameOriginRedirect]). Anything else is returned to the caller as the
/// original error, so a bearer token or a password in the body never reaches
/// another site. Off by default, which keeps the Jellyfin and Emby behavior.
Interceptor redirectInterceptor(Dio dio, {bool sameOriginOnly = false}) {
  return InterceptorsWrapper(
    onError: (error, handler) async {
      final statusCode = error.response?.statusCode;
      if (statusCode != null &&
          (statusCode == 301 ||
              statusCode == 302 ||
              statusCode == 307 ||
              statusCode == 308)) {
        final depth =
            (error.requestOptions.extra['_redirectDepth'] as int?) ?? 0;
        if (depth >= 5) return handler.next(error);
        final location = error.response?.headers.value('location');
        if (location != null && location.isNotEmpty) {
          final redirectUri = error.requestOptions.uri.resolve(location);
          if (sameOriginOnly &&
              !isSameOriginRedirect(error.requestOptions.uri, redirectUri)) {
            return handler.next(error);
          }
          try {
            final response = await dio.request(
              redirectUri.toString(),
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters,
              options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers,
                extra: {
                  ...error.requestOptions.extra,
                  '_redirectDepth': depth + 1,
                },
              ),
            );
            return handler.resolve(response);
          } on DioException catch (e) {
            return handler.next(e);
          }
        }
      }
      handler.next(error);
    },
  );
}

/// Whether a redirect from [from] to [to] stays on the same origin: same
/// host, scheme and port, or an upgrade from `http` to `https` on the same
/// host. An upgrade may come from any port (a server on `:8080` sending people
/// to its HTTPS address is normal) but must land on the default HTTPS port or
/// on the port it came from. Any other port on the host could be a different
/// service.
bool isSameOriginRedirect(Uri from, Uri to) {
  if (from.host.toLowerCase() != to.host.toLowerCase()) return false;
  if (from.scheme == to.scheme) return from.port == to.port;
  if (from.scheme != 'http' || to.scheme != 'https') return false;
  return to.port == 443 || to.port == from.port;
}
