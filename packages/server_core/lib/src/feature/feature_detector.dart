import '../media_server_client.dart';
import '../models/server_type.dart';

/// What Moonfin can do with a given server.
///
/// For Silo a flag is true only once Moonfin's Silo backend implements the
/// feature. Features Silo has but Moonfin doesn't support yet stay false,
/// and features Silo never offers stay false for good.
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
  bool get _isPlex => serverType == ServerType.plex;

  bool get supportsSyncPlay => _isJellyfin;
  /// Sprite-sheet seek previews (Jellyfin's `Trickplay`). Silo's are read
  /// per file (`TrickplayManifestApi`).
  bool get supportsTrickplay => _isJellyfin || _isSilo;
  bool get supportsLyrics => _isJellyfin;

  /// Jellyfin's MediaSegments API. Silo answers it from its skip markers.
  bool get supportsMediaSegments => _isJellyfin || _isSilo;

  /// Intro and credits segments for skip overlays: Jellyfin through the
  /// MediaSegments API, Emby through chapter markers, Plex and Silo through
  /// their own markers.
  bool get supportsSkipSegments => true;

  /// Signing in with a code (Jellyfin's Quick Connect, Silo's device sign-in)
  /// and approving another device's code.
  bool get supportsQuickConnect => _isJellyfin || _isSilo;

  /// Whether jellyfin-web opens its Quick Connect page from a link with the
  /// code already filled in. That page arrived in 10.9, and older servers
  /// only have the page without the prefill.
  bool get supportsQuickConnectWebLink => _isJellyfin && _versionAtLeast(10, 9);

  bool get supportsClientLog => _isJellyfin;

  bool get supportsBifTrickplay => _isEmby;

  /// Seerr requests and discovery. Moonfin reaches Seerr through the Moonfin
  /// plugin's proxy (`/Moonfin/Seerr/*`) on Jellyfin and Emby. On Silo the
  /// same screens use Silo's own requests (`/api/v2/requests`).
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

  /// Live TV, DVR and the guide. Silo has none of these by design.
  bool get supportsLiveTv => !_isSilo;

  /// Music libraries, artists, albums and lyrics. Silo has no music.
  bool get supportsMusic => !_isSilo;

  /// Playlists. Silo has none. Its personal collections are the nearest thing.
  bool get supportsPlaylists => !_isSilo;

  /// Instant mix. Silo has no equivalent.
  bool get supportsInstantMix => !_isSilo;

  /// Moonfin's admin panel, which speaks the Jellyfin and Emby admin APIs.
  /// Silo is administered from its own web app.
  bool get supportsAdmin => _isJellyfin || _isEmby;

  /// The Moonfin server plugin, Moonbase. Jellyfin and Emby serve it at the
  /// server root. Silo serves it under the plugin's installation id, and Plex,
  /// which can't run plugins, through a companion service. Those two only have
  /// part of it, see [supportsFullMoonfinPlugin].
  bool get supportsMoonfinPlugin =>
      _isJellyfin || _isEmby || _isSilo || _isPlex;

  /// The rest of the Moonfin plugin's routes (`/Moonfin/*` at the server
  /// root: Seerr proxy, games, anime markers, custom rows, bookmarks...),
  /// which only the Jellyfin and Emby plugins have.
  bool get supportsFullMoonfinPlugin => _isJellyfin || _isEmby;

  /// Remote control: listing the account's other sessions and sending them
  /// play, pause and navigation commands (the Jellyfin/Emby Sessions API).
  /// Silo has no equivalent, and its Watch Together is a separate protocol.
  bool get supportsRemoteControl => !_isSilo;

  /// Hiding a library from the Latest rows (`UserConfiguration`'s
  /// `LatestItemsExcludes`, "Show in Latest Media" in the library settings).
  /// Silo has no such setting and keeps none for a client, so the switch
  /// wouldn't stick there. Every Silo library gets a Latest row.
  bool get supportsLatestItemsExcludes => !_isSilo;

  /// Personal likes and dislikes. Plex has none, and its own rating already
  /// stands in for favorites.
  bool get supportsPersonalRatings => !_isPlex;

  /// Favoriting people. Plex can only favorite media, and Silo keeps no
  /// person favorites.
  bool get supportsPersonFavorites => !_isPlex && !_isSilo;

  /// Trailer links on items. Plex keeps none, so a trailer is searched for on
  /// YouTube instead.
  bool get supportsRemoteTrailers => !_isPlex;

  /// Downloading a transcoded copy. Plex's transcoder makes streams rather
  /// than files, so Plex only downloads originals.
  bool get supportsTranscodedDownloads => !_isPlex;

  /// The 4K filter in the library picker. Emby's items query takes no 4K
  /// flag. Silo filters 4K by resolution.
  bool get supportsUhdFilter => !_isEmby;

  /// The series status, likes, 3D, extras and disc source filters in the
  /// library picker. Plex keeps none of these.
  bool get supportsExtraLibraryFilters => !_isPlex;

  /// The unreleased series filter in the library picker. Emby's series
  /// status holds only continuing and ended.
  bool get supportsUnreleasedSeriesFilter => _isJellyfin;

  /// The guide's sports, news and kids filters. Plex programs never carry
  /// those flags, so the filters would always come up empty there.
  bool get supportsGuideCategoryFilters => !_isPlex;

  /// Whether adding to or removing from a collection needs the user's
  /// collection permission (or admin). Only Jellyfin gates it.
  bool get collectionsNeedPermission => _isJellyfin;

  /// The achievements plugin, which is Jellyfin-only.
  bool get supportsAchievements => _isJellyfin;

  /// Moonbase's server-sent settings stream. Emby sends plugin events over
  /// the session websocket, and Moonbase for Silo and Plex can't stream.
  bool get supportsPluginSettingsStream => _isJellyfin;

  /// Installing Moonbase from the app, through the admin plugins API.
  bool get supportsMoonbaseInstall => _isJellyfin;

  /// Reading whether the server may encode HEVC (Jellyfin's `encoding`
  /// configuration).
  bool get supportsHevcEncodingSetting => _isJellyfin;

  /// Measuring bandwidth against the server for auto bitrate. Silo has no
  /// bandwidth test route, and its playback start applies the server's own
  /// policy to the client's bandwidth.
  bool get supportsBandwidthTest => !_isSilo;

  /// Reporting reading progress inside an EPUB to the server.
  bool get supportsBookProgressReports => _isJellyfin;
}

extension ServerTypeFeatures on ServerType {
  /// What Moonfin can do with a server of this type. The version isn't known
  /// here, so version-gated flags count it as recent enough. Build a
  /// [FeatureDetector] with the server's version for those.
  FeatureDetector get features =>
      FeatureDetector(serverType: this, serverVersion: '');
}

extension MediaServerClientFeatures on MediaServerClient {
  /// [ServerTypeFeatures.features] for this client's server.
  FeatureDetector get features => serverType.features;
}
