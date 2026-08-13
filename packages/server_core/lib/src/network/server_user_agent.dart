// User agent sent with every request Moonfin makes to a media server.
//
// Dart's default `Dart/<version> (dart:io)` is rejected outright by some
// reverse proxies and WAFs, so an otherwise reachable server looks
// unreachable and the connection probes exhaust themselves. The
// `Mozilla/5.0 (compatible; ...)` prefix clears those filters while still
// naming Moonfin and its version, so admins can pick the traffic out of
// their access logs.

/// Stands in until startup records the real version.
const _fallbackVersion = 'Flutter';

String _version = _fallbackVersion;

/// The `User-Agent` value for all media-server traffic.
String get serverUserAgent => 'Mozilla/5.0 (compatible; Moonfin/$_version)';

/// For `Image.network` and `NetworkImage`, which fetch through a shared client
/// of Flutter's own that nothing can configure, so each call site passes the
/// agent as a header instead.
Map<String, String> get serverImageHeaders => {'User-Agent': serverUserAgent};

/// Records the running app version so it shows up in server access logs.
///
/// Called once during startup. Anything sent before that falls back to an
/// unversioned agent rather than failing, so the ordering isn't critical.
void setServerUserAgentVersion(String version) {
  final sanitized = _versionToken.firstMatch(version.trim())?.group(0) ?? '';
  _version = sanitized.isEmpty ? _fallbackVersion : sanitized;
}

/// A version is one token, so anything the platform reports is taken only up
/// to the first character that doesn't belong in a header. Truncating beats
/// stripping here, which would splice trailing junk onto the number.
final _versionToken = RegExp(r'^[A-Za-z0-9.\-+_]{1,32}');
