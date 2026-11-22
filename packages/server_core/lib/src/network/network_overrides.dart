// User-configurable overrides for the network path Moonfin uses to reach its
// media servers and the outside services around them (Emby Connect, Plex,
// Seerr). They live in server_core because the server clients and the app's
// HTTP overrides both read them, and Settings writes them while the app runs.
//
// Each one is empty by default, which means "behave exactly as before": a
// direct connection and the built-in request headers. The app keeps
// them in step with its settings, the same way it does with
// `gAllowSelfSignedCertificates`.

import 'server_request_header.dart';

/// The proxy every connection is routed through, as `host:port` or with an
/// `http://` scheme in front.
///
/// Empty means a direct connection. This is the one thing that makes a server
/// reachable here when the network only allows it through a proxy, which is
/// what SenPlayer and browsers that honour the system proxy already do.
///
/// Enter the port a local proxy app calls its "mixed" or HTTP port, the same
/// one a browser's proxy setting uses. dart:io has no SOCKS support, so a
/// SOCKS-only port is not usable here; the value is always sent as dart:io's
/// `PROXY host:port` rule, which tunnels HTTPS with CONNECT and forwards plain
/// HTTP. That rule has no room for credentials, so a proxy that requires a
/// username and password is not usable through this setting.
String gServerProxyUrl = '';

/// The `User-Agent` to send instead of the built-in one, verbatim.
///
/// Empty keeps the built-in `Mozilla/5.0 (compatible; Moonfin/<version>)`,
/// whose Mozilla prefix some reverse proxies and WAFs require.
String gServerUserAgentOverride = '';

/// The app/client name servers see for this device, replacing the platform
/// default (e.g. `Moonfin for macOS`) in the Jellyfin/Emby authorization
/// header, Silo's client header and Plex's product header.
///
/// This is the field some server-side rules gate login on, so it is the useful
/// one when a server blocks `Moonfin` but allows a client it knows.
String gServerClientNameOverride = '';

enum EmbyAuthorizationHeader {
  authorization('Authorization'),
  xEmbyAuthorization('X-Emby-Authorization');

  const EmbyAuthorizationHeader(this.value);

  final String value;
}

enum EmbyAuthorizationScheme {
  emby('Emby'),
  mediaBrowser('MediaBrowser');

  const EmbyAuthorizationScheme(this.value);

  final String value;
}

EmbyAuthorizationHeader gEmbyAuthorizationHeader =
    EmbyAuthorizationHeader.authorization;
EmbyAuthorizationScheme gEmbyAuthorizationScheme = EmbyAuthorizationScheme.emby;
String gEmbyDeviceNameOverride = '';
String gEmbyDeviceIdOverride = '';
String gEmbyClientVersionOverride = '';

List<ServerRequestHeader> gServerRequestHeaders = const [];

/// Puts every override back to its default. For tests, which share process
/// globals and would otherwise leak one into the next.
void resetServerNetworkOverrides() {
  gServerProxyUrl = '';
  gServerUserAgentOverride = '';
  gServerClientNameOverride = '';
  gEmbyAuthorizationHeader = EmbyAuthorizationHeader.authorization;
  gEmbyAuthorizationScheme = EmbyAuthorizationScheme.emby;
  gEmbyDeviceNameOverride = '';
  gEmbyDeviceIdOverride = '';
  gEmbyClientVersionOverride = '';
  gServerRequestHeaders = const [];
}

/// [gServerProxyUrl] as the `findProxy` rule dart:io expects, or null when it
/// is unset or unreadable.
String? get serverProxyFindProxy => serverProxyRuleFor(gServerProxyUrl);

/// [address] as the `findProxy` rule dart:io expects, or null when it is empty
/// or unreadable.
///
/// dart:io accepts a semicolon-separated list of rules but only knows two
/// keywords, `PROXY host:port` and `DIRECT`, and throws on anything else, so
/// the scheme is only used to find the host and port and the rule is always an
/// HTTP `PROXY`. A missing port falls back to the scheme's usual one: 8080 for
/// `http` (a local proxy app's HTTP/mixed listener), 443 for `https`, and 1080
/// for `socks4`/`socks5`.
///
/// Credentials in the address are dropped: dart:io's proxy rule has no way to
/// carry them and would read `user:pass@host` as the host name. A proxy that
/// needs authentication is not usable through this setting.
String? serverProxyRuleFor(String address) {
  final raw = address.trim();
  if (raw.isEmpty) return null;

  // A proxy address never contains a space, and Uri is lenient enough to turn
  // `not a url` into the host `not`, so reject it before parsing.
  if (raw.contains(RegExp(r'\s'))) return null;

  // A bare `host:port` has no scheme, and Uri would otherwise read the host
  // as a scheme, so give it one to parse against.
  final uri = Uri.tryParse(raw.contains('://') ? raw : 'http://$raw');
  if (uri == null) return null;

  final host = uri.host.trim();
  if (host.isEmpty || !_proxyHost.hasMatch(host)) return null;

  // Uri drops a port that matches the scheme's default (`http://host:80` and
  // `https://host:443`), so `hasPort` is false for an explicit one. Read the
  // explicit port from the address itself before falling back.
  final port = _explicitProxyPort(raw) ?? _defaultProxyPort(uri.scheme);
  // Uri drops the brackets around an IPv6 literal, but dart:io's rule splits
  // host and port on the last colon, so a bare `::1` would parse as host `::`.
  final hostPart = host.contains(':') ? '[$host]' : host;
  return 'PROXY $hostPart:$port';
}

/// The port written in [raw], including one the URI would treat as the
/// scheme's default, or null when the address leaves it out.
int? _explicitProxyPort(String raw) {
  final schemeEnd = raw.indexOf('://');
  var authority = schemeEnd == -1 ? raw : raw.substring(schemeEnd + 3);
  final pathStart = authority.indexOf('/');
  if (pathStart != -1) authority = authority.substring(0, pathStart);
  final userInfoEnd = authority.lastIndexOf('@');
  if (userInfoEnd != -1) authority = authority.substring(userInfoEnd + 1);

  final String portText;
  if (authority.startsWith('[')) {
    final close = authority.indexOf(']');
    if (close == -1) return null;
    final rest = authority.substring(close + 1);
    if (!rest.startsWith(':')) return null;
    portText = rest.substring(1);
  } else {
    final colon = authority.lastIndexOf(':');
    if (colon == -1) return null;
    portText = authority.substring(colon + 1);
  }

  final port = int.tryParse(portText);
  return port != null && port > 0 && port <= 65535 ? port : null;
}

/// The port a proxy usually listens on when the address leaves it out.
int _defaultProxyPort(String scheme) => switch (scheme.toLowerCase()) {
  'https' => 443,
  'socks4' || 'socks5' => 1080,
  _ => 8080,
};

/// Host names, IPv4 literals and the inside of a bracketed IPv6 literal. Uri
/// has already rejected anything else structurally, so this is the last check
/// that keeps whitespace and separators out of the rule.
final _proxyHost = RegExp(r'^[A-Za-z0-9._:\-]+$');

/// The configured request headers scoped to [uri]'s origin, in the order they
/// were saved.
///
/// Empty when none apply, which keeps every caller on its previous behavior.
Map<String, String> serverRequestHeadersFor(Uri uri) {
  if (gServerRequestHeaders.isEmpty ||
      (uri.scheme != 'http' && uri.scheme != 'https') ||
      uri.host.isEmpty) {
    return const {};
  }
  final origin = uri.origin;
  final headers = <String, String>{};
  for (final header in gServerRequestHeaders) {
    if (header.origin == origin) headers[header.name] = header.value;
  }
  return headers;
}

/// [builtIn] unless the user set a client name, which is what servers see as
/// the app name. Read at header-build time so a change applies to the next
/// request without rebuilding the client that holds it.
String serverClientName(String builtIn) {
  final override = gServerClientNameOverride.trim();
  return override.isEmpty ? builtIn : override;
}
