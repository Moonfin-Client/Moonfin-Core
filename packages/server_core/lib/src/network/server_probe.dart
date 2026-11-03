import 'package:dio/dio.dart';

import '../models/server_type.dart';
import 'json_body.dart';
import 'silo_public_info.dart';

/// Result of probing a base URL for a Jellyfin, Emby or Silo server.
class ServerProbeResult {
  /// The public server info in Jellyfin's `System/Info/Public` shape (`Id`,
  /// `ServerName`, `Version`, `ProductName`, ...). For Silo it is assembled
  /// from the native `/api/v2` system and branding endpoints by
  /// [siloPublicInfoToJellyfinShape].
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

/// Failures that concern the host, not the path: every other path on the same
/// address would fail the same way.
const _hostLevelFailures = {
  DioExceptionType.connectionError,
  DioExceptionType.connectionTimeout,
  DioExceptionType.badCertificate,
};

/// Probes [baseUrl] for a media server.
///
/// Silo's native API (`/api/v2/system/info`) is tried first. Silo also runs a
/// Jellyfin-compatible listener, and its native host can answer
/// `/System/Info/Public` with the web app's HTML, so checking for Silo first
/// keeps a native Silo address from being taken for anything else. Then the
/// Jellyfin/Emby public-info endpoint is tried at the root and under `/emby`.
/// Returns null if no server answers. Throws [SiloApiUnsupported] when Silo
/// answers that this build's API is retired.
///
/// When the first attempt fails at the connection level (refused, timed out,
/// certificate rejected) the host is unreachable on every path, so that error
/// is rethrown at once instead of waiting out the same failure per path.
///
/// Relies on [dio]'s configuration (timeouts, cert handling, validateStatus).
/// Rethrows the last [DioException] when every path failed at the network level
/// so callers can report the underlying error.
Future<ServerProbeResult?> probeServerPublicInfo(Dio dio, String baseUrl) async {
  final base = baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;

  DioException? lastError;
  try {
    final silo = await _probeSilo(dio, base);
    if (silo != null) return silo;
  } on DioException catch (e) {
    if (_hostLevelFailures.contains(e.type)) rethrow;
    lastError = e;
  }
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

/// Probes [baseUrl] for Silo's native API only (`/api/v2/system/info`, then
/// the identity, branding and setup extras). Returns null when the address
/// answers but isn't a native Silo host. Connection failures are thrown.
Future<ServerProbeResult?> probeSiloServer(Dio dio, String baseUrl) {
  final base = baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;
  return _probeSilo(dio, base);
}

/// Whether the Jellyfin server at [baseUrl] is Silo's Jellyfin-compatible
/// service. Silo's compat listener answers `/System/Info/Public` as
/// "Jellyfin Server", but its `/Branding/Configuration` disclaimer names Silo
/// ("Silo provides Jellyfin-compatible app support. ..."). A hint only: the
/// caller confirms a native Silo host before offering it. Never throws.
Future<bool> looksLikeSiloJellyfinCompat(Dio dio, String baseUrl) async {
  final base = baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;
  final branding = await _tryGetJson(dio, '$base/Branding/Configuration');
  final disclaimer = branding?['LoginDisclaimer'];
  return disclaimer is String && disclaimer.toLowerCase().contains('silo');
}

Future<ServerProbeResult?> _probeSilo(Dio dio, String baseUrl) async {
  (Response<dynamic>, String) fetched;
  try {
    fetched = await _getFollowingRedirects(
      dio,
      '$baseUrl$siloSystemInfoPath',
    );
  } on DioException catch (e) {
    // A Silo that has moved on to a newer API answers the old namespace
    // with a tombstone: say so instead of trying the address as Jellyfin.
    if (isSiloClientUpgradeRequired(
      e.response?.statusCode,
      e.response?.data,
    )) {
      throw const SiloApiUnsupported();
    }
    rethrow;
  }
  final (response, requestUrl) = fetched;
  if (!_isSuccess(response)) return null;

  final systemInfo = asJsonMap(response.data);
  if (!isSiloSystemInfo(systemInfo)) return null;

  final resolvedBaseUrl = _stripSuffix(requestUrl, siloSystemInfoPath);

  // Identity, branding and setup are best effort: the server is already
  // identified, and adding it must not fail because a cosmetic call did.
  final extras = await Future.wait([
    _tryGetJson(dio, '$resolvedBaseUrl/api/v2/system/identity'),
    _tryGetJson(dio, '$resolvedBaseUrl/api/v2/theme/branding'),
    _tryGetJson(dio, '$resolvedBaseUrl/api/v2/system/setup'),
  ]);

  return ServerProbeResult(
    info: siloPublicInfoToJellyfinShape(
      systemInfo: systemInfo!,
      identity: extras[0],
      branding: extras[1],
      setup: extras[2],
    ),
    serverType: ServerType.silo,
    resolvedBaseUrl: resolvedBaseUrl,
  );
}

Future<Map<String, dynamic>?> _tryGetJson(Dio dio, String url) async {
  try {
    final response = await dio.get<dynamic>(url);
    return _isSuccess(response) ? asJsonMap(response.data) : null;
  } catch (_) {
    return null;
  }
}

Future<ServerProbeResult?> _probePath(
  Dio dio,
  String baseUrl,
  String endpointPath,
) async {
  final (response, requestUrl) = await _getFollowingRedirects(
    dio,
    '$baseUrl$endpointPath',
  );
  if (!_isSuccess(response)) return null;

  final data = asJsonMap(response.data);
  if (data == null) return null;

  return ServerProbeResult(
    info: data,
    serverType: ServerType.detect(
      data['ProductName'] as String?,
      data['Version'] as String?,
    ),
    resolvedBaseUrl: _stripSuffix(requestUrl, '/System/Info/Public'),
  );
}

Future<(Response<dynamic>, String)> _getFollowingRedirects(
  Dio dio,
  String url,
) async {
  var requestUrl = url;
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
  return (response, requestUrl);
}

bool _isSuccess(Response<dynamic> response) {
  final status = response.statusCode ?? 0;
  return status >= 200 && status < 300;
}

// Strip only the endpoint suffix, keeping any base-path prefix (e.g. the
// `/emby` of a reverse-proxied Emby) so later API calls hit it.
String _stripSuffix(String requestUrl, String suffix) {
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
