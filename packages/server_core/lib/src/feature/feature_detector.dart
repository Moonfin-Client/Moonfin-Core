import '../models/server_type.dart';

class FeatureDetector {
  final ServerType serverType;
  final String serverVersion;

  const FeatureDetector({
    required this.serverType,
    required this.serverVersion,
  });

  bool get supportsSyncPlay => serverType == ServerType.jellyfin;
  bool get supportsTrickplay => serverType == ServerType.jellyfin;
  bool get supportsLyrics => serverType == ServerType.jellyfin;
  bool get supportsMediaSegments => serverType == ServerType.jellyfin;

  /// Both servers can surface intro and credits segments for skip overlays,
  /// Jellyfin through the MediaSegments API and Emby through chapter markers.
  bool get supportsSkipSegments =>
      serverType == ServerType.jellyfin || serverType == ServerType.emby;

  bool get supportsQuickConnect => serverType == ServerType.jellyfin;

  /// Whether jellyfin-web opens its Quick Connect page from a link with the
  /// code already filled in. That page arrived in 10.9, and older servers
  /// only have the page without the prefill.
  bool get supportsQuickConnectWebLink =>
      supportsQuickConnect && _versionAtLeast(10, 9);

  bool get supportsClientLog => serverType == ServerType.jellyfin;

  bool get supportsBifTrickplay => serverType == ServerType.emby;
  bool get supportsJellyseerr => true;

  /// A version that doesn't parse counts as recent enough, since the
  /// alternative is hiding a feature on every server that reports something
  /// unexpected.
  bool _versionAtLeast(int major, int minor) {
    final parts = serverVersion.split('.');
    final serverMajor = int.tryParse(parts.first);
    final serverMinor = parts.length > 1 ? int.tryParse(parts[1]) : null;
    if (serverMajor == null || serverMinor == null) return true;
    return serverMajor > major ||
        (serverMajor == major && serverMinor >= minor);
  }
}
