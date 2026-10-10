import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/server_type.dart';
import '../silo_support.dart';

/// Result of probing a base URL for a Jellyfin, Emby or Silo server.
class ServerProbeResult {
  /// The public server info in Jellyfin's `System/Info/Public` shape
  /// (`Id`, `ServerName`, `Version`, `ProductName`, ...). For Silo this is
  /// assembled from the native `/api/v2` system and branding endpoints.
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

/// Silo's public, unauthenticated native system info.
const siloSystemInfoPath = '/api/v2/system/info';

// Emby answers at both `/System/Info/Public` and `/emby/System/Info/Public`;
// reverse proxies often route only the latter, so both must be tried.
const _publicInfoPaths = <String>[
  '/System/Info/Public',
  '/emby/System/Info/Public',
];

/// Probes [baseUrl] for a media server.
///
/// Silo's native API is tried first. Silo also runs a Jellyfin-compatible
/// listener, and some deployments answer `/System/Info/Public` on the native
/// host with the web app's HTML, so checking for Silo first keeps a native
/// Silo address from being added as Jellyfin. Then the Jellyfin/Emby
/// public-info endpoint is tried at the root and under `/emby`. Returns null if
/// no server answers.
///
/// Silo is only looked for when [detectSilo] is true, which defaults to
/// [siloSupportEnabled].
///
/// Relies on [dio]'s configuration (timeouts, cert handling, validateStatus).
/// Rethrows the last [DioException] when every path failed at the network level
/// so callers can report the underlying error.
Future<ServerProbeResult?> probeServerPublicInfo(
  Dio dio,
  String baseUrl, {
  bool detectSilo = siloSupportEnabled,
}) async {
  final base = baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;

  DioException? lastError;
  if (detectSilo) {
    try {
      final silo = await _probeSilo(dio, base);
      if (silo != null) return silo;
    } on DioException catch (e) {
      lastError = e;
    }
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

/// Whether [data] is Silo's `GET /api/v2/system/info` payload.
bool isSiloSystemInfo(Map<String, dynamic>? data) =>
    data != null &&
    data['api_major'] is num &&
    data['server_version'] is String;

Future<ServerProbeResult?> _probeSilo(Dio dio, String baseUrl) async {
  final (response, requestUrl) =
      await _getFollowingRedirects(dio, '$baseUrl$siloSystemInfoPath');
  if (!_isSuccess(response)) return null;

  final systemInfo = asJsonMap(response.data);
  if (!isSiloSystemInfo(systemInfo)) return null;

  final resolvedBaseUrl = _stripSuffix(requestUrl, siloSystemInfoPath);

  // Identity and branding are best effort: the server is already identified,
  // and an add-server flow must not fail because a cosmetic call did.
  final identity = await _tryGetJson(dio, '$resolvedBaseUrl/api/v2/system/identity');
  final branding = await _tryGetJson(dio, '$resolvedBaseUrl/api/v2/theme/branding');
  final setup = await _tryGetJson(dio, '$resolvedBaseUrl/api/v2/system/setup');

  return ServerProbeResult(
    info: siloPublicInfoToJellyfinShape(
      systemInfo: systemInfo!,
      identity: identity,
      branding: branding,
      setup: setup,
    ),
    serverType: ServerType.silo,
    resolvedBaseUrl: resolvedBaseUrl,
  );
}

/// Folds Silo's native public endpoints into the Jellyfin `PublicSystemInfo`
/// keys the app reads (`Id`, `ServerName`, `Version`, `ProductName`,
/// `StartupWizardCompleted`, `LoginDisclaimer`), keeping the native payloads
/// under `Silo*` keys for anything that needs them.
///
/// `Id` is the native v2 server identity. Silo's legacy v1 health route
/// reports a different id; it must never be used.
Map<String, dynamic> siloPublicInfoToJellyfinShape({
  required Map<String, dynamic> systemInfo,
  Map<String, dynamic>? identity,
  Map<String, dynamic>? branding,
  Map<String, dynamic>? setup,
}) {
  final serverName = (branding?['server_name'] as String?)?.trim();
  final loginSubtitle = (branding?['login_subtitle'] as String?)?.trim();
  final needsSetup = setup?['needs_setup'] as bool?;
  return {
    'Id': identity?['server_id'],
    'ServerName': (serverName == null || serverName.isEmpty) ? 'Silo' : serverName,
    // A git short hash on pre-1.0 builds, not a semantic version. Display it,
    // never parse it; compatibility is decided by SiloApiMajor.
    'Version': systemInfo['server_version'],
    'ProductName': 'Silo',
    'StartupWizardCompleted': needsSetup == null ? true : !needsSetup,
    if (loginSubtitle != null && loginSubtitle.isNotEmpty)
      'LoginDisclaimer': loginSubtitle,
    'SiloApiMajor': systemInfo['api_major'],
    'SiloContractDigest': systemInfo['contract_digest'],
    'SiloSystemInfo': systemInfo,
    if (identity != null) 'SiloIdentity': identity,
    if (branding != null) 'SiloBranding': branding,
  };
}

Future<Map<String, dynamic>?> _tryGetJson(Dio dio, String url) async {
  try {
    final response = await dio.get<dynamic>(url);
    if (!_isSuccess(response)) return null;
    return asJsonMap(response.data);
  } catch (_) {
    return null;
  }
}

Future<ServerProbeResult?> _probePath(
  Dio dio,
  String baseUrl,
  String endpointPath,
) async {
  final (response, requestUrl) =
      await _getFollowingRedirects(dio, '$baseUrl$endpointPath');
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

/// A response body as a JSON object, or null when it isn't one.
///
/// Dio leaves the body as a raw string when the content type is missing or
/// not JSON (`text/plain`, some proxies), so string bodies are decoded here
/// rather than failing a cast.
Map<String, dynamic>? asJsonMap(Object? data) {
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
