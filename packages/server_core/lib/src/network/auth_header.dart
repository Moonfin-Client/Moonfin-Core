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
/// Silo authenticates with a bearer token, selects the household profile with
/// `X-Profile-Id` (plus `X-Profile-Token` for a PIN-locked profile), and
/// records the device from the `X-Silo-Device-*` headers at sign-in. The device
/// id must match `[A-Za-z0-9._:-]{1,128}`: v2 refuses other characters with a
/// 422, so it is filtered here rather than sent as is.
Map<String, String> buildSiloRequestHeaders({
  required DeviceInfo deviceInfo,
  String? accessToken,
  String? profileId,
  String? profileToken,
}) {
  final deviceId = _siloDeviceId(deviceInfo.id);
  final deviceName = _clamp(_sanitizeHeaderValue(deviceInfo.name), 120);
  return {
    if (accessToken != null && accessToken.isNotEmpty)
      'Authorization': 'Bearer $accessToken',
    if (profileId != null && profileId.isNotEmpty) 'X-Profile-Id': profileId,
    if (profileToken != null && profileToken.isNotEmpty)
      'X-Profile-Token': profileToken,
    if (deviceId != null) 'X-Silo-Device-Id': deviceId,
    'X-Silo-Device-Name': deviceName,
    'X-Silo-Client': _sanitizeHeaderValue(deviceInfo.appName),
    'X-Silo-Client-Version': _sanitizeHeaderValue(deviceInfo.appVersion),
  };
}

String? _siloDeviceId(String raw) {
  final filtered = raw.replaceAll(RegExp(r'[^A-Za-z0-9._:\-]'), '');
  if (filtered.isEmpty) return null;
  return _clamp(filtered, 128);
}

String _clamp(String value, int max) =>
    value.length <= max ? value : value.substring(0, max);
