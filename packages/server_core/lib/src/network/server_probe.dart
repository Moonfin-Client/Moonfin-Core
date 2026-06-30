import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/server_type.dart';

/// Result of probing a base URL for a Jellyfin/Emby server.
class ServerProbeResult {
  /// The parsed `System/Info/Public` payload.
  final Map<String, dynamic> info;
  final ServerType serverType;

  /// The base URL the server actually answered on, including any path prefix
  /// (e.g. `/emby` for reverse-proxied Emby) or a redirect-introduced base.
  /// Not application-normalized; callers should normalize as needed.
  final String resolvedBaseUrl;

  const ServerProbeResult({
    required this.info,
    required this.serverType,
    required this.resolvedBaseUrl,
  });
}

// Emby answers at both `/System/Info/Public` and `/emby/System/Info/Public`;
// reverse proxies often route only the latter, so both must be tried.
const _publicInfoPaths = <String>[
  '/System/Info/Public',
  '/emby/System/Info/Public',
];

/// Probes [baseUrl] for a Jellyfin/Emby server using the public-info endpoint,
/// trying both the root and `/emby` paths. Returns null if no server answers.
///
/// Relies on [dio]'s configuration (timeouts, cert handling, validateStatus).
/// Rethrows the last [DioException] when every path failed at the network level
/// so callers can report the underlying error.
Future<ServerProbeResult?> probeServerPublicInfo(Dio dio, String baseUrl) async {
  final base = baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;

  DioException? lastError;
  for (final path in _publicInfoPaths) {
    try {
      final result = await _probePath(dio, base, path);
      if (result != null) return result;
    } on DioException catch (e) {
      lastError = e;
    }
  }
  if (lastError != null) throw lastError;
  return null;
}

Future<ServerProbeResult?> _probePath(
  Dio dio,
  String baseUrl,
  String endpointPath,
) async {
  var requestUrl = '$baseUrl$endpointPath';
  var response = await dio.get<dynamic>(requestUrl);

  var redirects = 0;
  while (response.statusCode != null &&
      const [301, 302, 307, 308].contains(response.statusCode) &&
      redirects < 5) {
    final location = response.headers.value('location');
    if (location == null || location.isEmpty) break;
    requestUrl = Uri.parse(requestUrl).resolve(location).toString();
    response = await dio.get<dynamic>(requestUrl);
    redirects++;
  }

  final status = response.statusCode ?? 0;
  if (status < 200 || status >= 300) return null;

  final data = _asJsonMap(response.data);
  if (data == null) return null;

  return ServerProbeResult(
    info: data,
    serverType: ServerType.detect(
      data['ProductName'] as String?,
      data['Version'] as String?,
    ),
    resolvedBaseUrl: _resolveBaseUrl(requestUrl),
  );
}

// Strip only the `/System/Info/Public` endpoint suffix, keeping any base-path
// prefix (e.g. the `/emby` of a reverse-proxied Emby) so later API calls hit it.
String _resolveBaseUrl(String requestUrl) {
  const suffix = '/System/Info/Public';
  final uri = Uri.parse(requestUrl);
  var basePath = uri.path;
  if (basePath.toLowerCase().endsWith(suffix.toLowerCase())) {
    basePath = basePath.substring(0, basePath.length - suffix.length);
  }
  if (basePath.endsWith('/') && basePath.length > 1) {
    basePath = basePath.substring(0, basePath.length - 1);
  }
  return '${uri.scheme}://${uri.authority}$basePath';
}

Map<String, dynamic>? _asJsonMap(Object? data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) return data.map((k, v) => MapEntry(k.toString(), v));
  if (data is String) {
    try {
      final decoded = jsonDecode(data);
      if (decoded is Map<String, dynamic>) return decoded;
      if (decoded is Map) return decoded.map((k, v) => MapEntry(k.toString(), v));
    } catch (_) {}
  }
  return null;
}
