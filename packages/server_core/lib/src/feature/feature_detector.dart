import '../models/server_type.dart';

class FeatureDetector {
  final ServerType serverType;
  final String serverVersion;

  const FeatureDetector({
    required this.serverType,
    required this.serverVersion,
  });

  bool get _isJellyfin => serverType == ServerType.jellyfin;
  bool get _isEmby => serverType == ServerType.emby;
  bool get _isSilo => serverType == ServerType.silo;

  bool get supportsSyncPlay => _isJellyfin;

  /// Tile-sheet trickplay. Silo's seek-preview manifests map onto the same
  /// tile layout, so the Jellyfin rendering path serves both.
  bool get supportsTrickplay => _isJellyfin || _isSilo;
  bool get supportsLyrics => _isJellyfin;

  /// Jellyfin's MediaSegments API; Silo's intro/credits/recap/preview markers
  /// are translated into the same segment shape.
  bool get supportsMediaSegments => _isJellyfin || _isSilo;

  /// Every server can surface intro and credits segments for skip overlays:
  /// Jellyfin through the MediaSegments API, Emby through chapter markers and
  /// Silo through its file markers.
  bool get supportsSkipSegments => true;

  /// Code-based sign-in from another device (Jellyfin QuickConnect). Silo's
  /// device sign-in maps onto the same calls but is enabled with Silo
  /// sign-in, not before: until then the sign-in screen would offer a button
  /// that can only fail.
  bool get supportsQuickConnect => _isJellyfin;
  bool get supportsClientLog => _isJellyfin;

  bool get supportsBifTrickplay => _isEmby;
  bool get supportsJellyseerr => true;

  /// Silo never serves these: Live TV, music and playlists are outside its
  /// product scope, and its admin API is unrelated to Jellyfin's.
  bool get supportsLiveTv => !_isSilo;
  bool get supportsMusic => !_isSilo;
  bool get supportsPlaylists => !_isSilo;
  bool get supportsInstantMix => !_isSilo;
  bool get supportsAdmin => _isJellyfin;

  /// The Moonfin server plugin (`/Moonfin/*`: settings sync, Seerr proxy,
  /// TMDB/MDBList proxies, bookmarks, ...) exists for Jellyfin and Emby only.
  bool get supportsMoonfinPlugin => !_isSilo;

  /// Household profiles selected per request (Silo's `X-Profile-Id`).
  bool get supportsProfiles => _isSilo;
}
