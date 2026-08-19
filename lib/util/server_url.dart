import 'package:punycoder/punycoder.dart';

final _schemeRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9+.-]*://');

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
