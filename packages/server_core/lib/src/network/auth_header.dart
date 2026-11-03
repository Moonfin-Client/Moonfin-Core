import '../models/device_info.dart';

String buildServerAuthorizationHeader({
  required String scheme,
  required DeviceInfo deviceInfo,
  String? accessToken,
}) {
  final client = _sanitizeHeaderValue(deviceInfo.appName);
  final device = _sanitizeHeaderValue(deviceInfo.name);
  final deviceId = _sanitizeHeaderValue(deviceInfo.id);
  final version = _sanitizeHeaderValue(deviceInfo.appVersion);

  final authHeader = StringBuffer(
    '$scheme Client="$client", '
    'Device="$device", '
    'DeviceId="$deviceId", '
    'Version="$version"',
  );

  if (accessToken != null && accessToken.isNotEmpty) {
    authHeader.write(', Token="${_sanitizeHeaderValue(accessToken)}"');
  }

  return authHeader.toString();
}

String _sanitizeHeaderValue(String value) {
  final asciiOnly = value.replaceAll(RegExp(r'[^\x20-\x7E]'), ' ');
  final noQuotes = asciiOnly
      .replaceAll('"', '')
      .replaceAll('\\', '')
      .replaceAll(',', ' ')
      .replaceAll(RegExp(r'[\r\n\t]'), ' ');

  final collapsed = noQuotes.replaceAll(RegExp(r'\s+'), ' ').trim();
  return collapsed.isEmpty ? 'Unknown' : collapsed;
}

/// Headers for a request to Silo's native `/api/v2` API.
///
/// Silo authenticates with a bearer token and selects the household profile
/// with `X-Profile-Id` (plus `X-Profile-Token` while a PIN-locked profile is
/// unlocked). The `X-Silo-Device-*` headers identify this device: Silo records
/// them in its device registry at sign-in and playback start, and uses the
/// device id to resolve device-scoped playback preferences on catalog
/// requests, so they go on every request. `X-Silo-Client*` names the app.
///
/// Silo answers 422 when `X-Silo-Device-Id` holds anything other than
/// letters, digits, `.`, `_`, `:` or `-`, so other characters are dropped
/// here (Moonfin's ids are UUIDs, which already qualify). Lengths follow the
/// v2 contract: id 128, name 120, platform 40.
Map<String, String> buildSiloRequestHeaders({
  required DeviceInfo deviceInfo,
  String? platform,
  String? accessToken,
  String? profileId,
  String? profileToken,
}) {
  final deviceId = siloDeviceId(deviceInfo.id);
  return {
    if (accessToken != null && accessToken.isNotEmpty)
      'Authorization': 'Bearer $accessToken',
    if (profileId != null && profileId.isNotEmpty) 'X-Profile-Id': profileId,
    if (profileToken != null && profileToken.isNotEmpty)
      'X-Profile-Token': profileToken,
    if (deviceId != null) 'X-Silo-Device-Id': deviceId,
    'X-Silo-Device-Name': _clamp(_sanitizeHeaderValue(deviceInfo.name), 120),
    if (platform != null && platform.trim().isNotEmpty)
      'X-Silo-Device-Platform': _clamp(_sanitizeHeaderValue(platform), 40),
    'X-Silo-Client': _sanitizeHeaderValue(deviceInfo.appName),
    'X-Silo-Client-Version': _sanitizeHeaderValue(deviceInfo.appVersion),
  };
}

/// [raw] reduced to the characters Silo accepts in a device id and clamped to
/// 128, or null when nothing usable is left.
String? siloDeviceId(String raw) {
  final filtered = raw.replaceAll(RegExp(r'[^A-Za-z0-9._:\-]'), '');
  if (filtered.isEmpty) return null;
  return _clamp(filtered, 128);
}

String _clamp(String value, int max) =>
    value.length <= max ? value : value.substring(0, max);
