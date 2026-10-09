import 'dart:io';

int osMajorVersion() {
  final match = RegExp(r'\d+').firstMatch(Platform.operatingSystemVersion);
  if (match == null) return 0;
  return int.tryParse(match.group(0)!) ?? 0;
}

String osVersionRaw() => Platform.operatingSystemVersion;

/// FLATPAK_ID, unless this binary isn't the Flatpak's own: a native build
/// started from some other Flatpak's terminal inherits that app's ID. Same rule
/// as my_application_resolve_id in linux/runner/my_application.cc.
String? linuxFlatpakAppId() {
  final id = Platform.environment['FLATPAK_ID'];
  if (id == null || id.isEmpty) return null;
  if (!Platform.resolvedExecutable.startsWith('/app/')) return null;
  return id;
}
