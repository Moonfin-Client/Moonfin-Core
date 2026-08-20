import 'package:punycoder/punycoder.dart';
import 'package:server_core/server_core.dart' show MediaServerClient;

final _schemeRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9+.-]*://');

/// Whether a download row's [stored] server belongs to the server known as
/// [serverId] at [baseUrl]. Rows keep the app's server id, or the server's
/// URL when the item came straight from a client.
bool isStoredServer(
  String stored, {
  required String serverId,
  required String baseUrl,
}) {
  if (stored == serverId) return true;
  if (!stored.contains('://')) return false;
  final storedUrl = normalizeServerBaseUrl(stored);
  return storedUrl.isNotEmpty && storedUrl == normalizeServerBaseUrl(baseUrl);
}

String normalizeServerBaseUrl(String input) {
  final trimmed = input.trim();
  if (trimmed.isEmpty) return '';

  final hasScheme = _schemeRegex.hasMatch(trimmed);
  final parseTarget = hasScheme ? trimmed : 'https://$trimmed';

  Uri uri;
  try {
    uri = Uri.parse(parseTarget);
  } catch (_) {
    return _stripTrailingSlash(trimmed);
  }

  final normalizedPath = _normalizeServerPath(uri.pathSegments);
  final normalizedHost = _normalizeServerHost(uri.host);

  if (hasScheme) {
    var result = '${uri.scheme}://$normalizedHost';
    if (uri.hasPort && uri.port != 80 && uri.port != 443) {
      result += ':${uri.port}';
    }
    result += normalizedPath;
    return _stripTrailingSlash(result);
  }

  if (uri.host.isEmpty) {
    return _stripTrailingSlash(trimmed);
  }

  final authority = uri.hasPort && uri.port != 80 && uri.port != 443
      ? '$normalizedHost:${uri.port}'
      : normalizedHost;

  return _stripTrailingSlash(
    normalizedPath.isEmpty ? authority : '$authority$normalizedPath',
  );
}

/// Keeps an IDN hostname in the Unicode form the user entered while retaining
/// the resolved scheme, port, and path used for the connection.
///
/// Explicit Punycode input is never decoded. If the resolved endpoint uses a
/// different hostname, the resolved address is returned unchanged.
String serverDisplayAddress({
  required String enteredAddress,
  required String resolvedAddress,
}) {
  final entered = enteredAddress.trim();
  if (entered.isEmpty || resolvedAddress.isEmpty) return resolvedAddress;

  final enteredHasScheme = _schemeRegex.hasMatch(entered);
  final enteredUri = Uri.tryParse(
    enteredHasScheme ? entered : 'https://$entered',
  );
  final resolvedUri = Uri.tryParse(resolvedAddress);
  if (enteredUri == null ||
      enteredUri.host.isEmpty ||
      resolvedUri == null ||
      resolvedUri.host.isEmpty) {
    return resolvedAddress;
  }

  String enteredHost;
  try {
    enteredHost = Uri.decodeComponent(enteredUri.host);
  } catch (_) {
    return resolvedAddress;
  }

  if (!enteredHost.runes.any((rune) => rune > 0x7f)) {
    return resolvedAddress;
  }

  String enteredAscii;
  try {
    enteredAscii = domainToAscii(enteredHost).toLowerCase();
  } on FormatException {
    return resolvedAddress;
  }

  if (enteredAscii != resolvedUri.host.toLowerCase()) {
    return resolvedAddress;
  }

  return resolvedAddress.replaceFirst(resolvedUri.host, enteredHost);
}

String _normalizeServerHost(String host) {
  if (host.isEmpty) return host;

  String decodedHost;
  try {
    decodedHost = Uri.decodeComponent(host);
  } catch (_) {
    return host;
  }

  if (!decodedHost.runes.any((rune) => rune > 0x7f)) {
    return host;
  }

  try {
    return domainToAscii(decodedHost).toLowerCase();
  } on FormatException {
    return host;
  }
}

String _normalizeServerPath(List<String> pathSegments) {
  final segments = pathSegments.where((segment) => segment.isNotEmpty).toList();
  if (segments.isEmpty) return '';

  final lower = segments.map((s) => s.toLowerCase()).toList();

  if (lower.length >= 2 &&
      lower[lower.length - 2] == 'web' &&
      lower.last == 'index.html') {
    segments.removeRange(segments.length - 2, segments.length);
  } else if (lower.last == 'web') {
    segments.removeLast();
  }

  if (segments.isEmpty) return '';
  return '/${segments.join('/')}';
}

String _stripTrailingSlash(String value) {
  if (value.endsWith('/')) {
    return value.substring(0, value.length - 1);
  }
  return value;
}

/// Appends the access token query parameter so the URL authenticates itself.
///
/// For fetches that go out without the app's Authorization header. Emby URLs
/// already carry api_key while Jellyfin's don't, and Jellyfin 12 only reads
/// the ApiKey spelling, so the name comes from the server type.
String? tokenAuthedUrl(MediaServerClient client, String? url) {
  if (url == null) return null;
  final token = client.accessToken;
  if (token == null || token.isEmpty) return url;
  final lower = url.toLowerCase();
  if (lower.contains('api_key=') ||
      lower.contains('apikey=') ||
      lower.contains('x-emby-token=')) {
    return url;
  }
  final sep = url.contains('?') ? '&' : '?';
  return '$url$sep${client.serverType.tokenQueryParam}='
      '${Uri.encodeQueryComponent(token)}';
}
