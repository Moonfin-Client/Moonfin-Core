import '../models/device_info.dart';
import 'network_overrides.dart';

String buildServerAuthorizationHeader({
  required String scheme,
  required DeviceInfo deviceInfo,
  String? accessToken,
}) {
  final fields = [
    ..._serverIdentityFields(deviceInfo),
    if (accessToken != null && accessToken.isNotEmpty)
      _field('Token', accessToken),
  ];
  return '$scheme ${fields.join(', ')}';
}

/// Uses the configured Emby header and the credentials from the active session.
Map<String, String> buildEmbyAuthorizationHeaders({
  required DeviceInfo deviceInfo,
  String? accessToken,
  String? userId,
}) {
  final header = gEmbyAuthorizationHeader;
  final identity = _serverIdentityFields(
    deviceInfo,
    deviceName: gEmbyDeviceNameOverride,
    deviceId: serverEmbyDeviceId(deviceInfo),
    version: gEmbyClientVersionOverride,
  );
  final hasToken = accessToken != null && accessToken.isNotEmpty;
  final fields = switch (header) {
    EmbyAuthorizationHeader.authorization => [
      ...identity,
      if (hasToken) _field('Token', accessToken),
    ],
    EmbyAuthorizationHeader.xEmbyAuthorization => [
      if (hasToken) _field('Token', accessToken),
      if (hasToken && userId != null && userId.isNotEmpty)
        _field('UserId', userId),
      ...identity,
    ],
  };
  return {
    header.value: '${gEmbyAuthorizationScheme.value} ${fields.join(', ')}',
  };
}

List<String> _serverIdentityFields(
  DeviceInfo deviceInfo, {
  String deviceName = '',
  String deviceId = '',
  String version = '',
}) => [
  _field('Client', serverClientName(deviceInfo.appName)),
  _field('Device', _valueOrDefault(deviceName, deviceInfo.name)),
  _field('DeviceId', _valueOrDefault(deviceId, deviceInfo.id)),
  _field('Version', _valueOrDefault(version, deviceInfo.appVersion)),
];

/// The device id Emby sees, which the configured override replaces.
///
/// Playback and socket requests have to name the same device as the
/// authorization header, or the server treats them as two devices.
String serverEmbyDeviceId(DeviceInfo deviceInfo) =>
    _valueOrDefault(gEmbyDeviceIdOverride, deviceInfo.id);

String _valueOrDefault(String value, String fallback) =>
    value.trim().isEmpty ? fallback : value;

String _field(String name, String value) =>
    '$name="${_sanitizeHeaderValue(value)}"';

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
    'X-Silo-Client': _sanitizeHeaderValue(serverClientName(deviceInfo.appName)),
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
