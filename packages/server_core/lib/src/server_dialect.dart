/// Captures the small behavioral differences between Jellyfin and Emby so a
/// single API implementation can serve both servers.
class ServerDialect {
  /// Scheme used in the Authorization header (`MediaBrowser` or `Emby`).
  final String authScheme;

  /// Emby addresses library data through `/Users/{userId}/...` routes;
  /// Jellyfin 10.9+ prefers the user-less variants (`/UserItems/Resume`,
  /// `/UserViews`, ...).
  final bool userScopedLibraryEndpoints;

  final bool supportsQuickConnect;
  final bool supportsLyrics;
  final bool supportsMediaSegments;
  final bool supportsRemoteSubtitleSearch;

  /// Emby authenticates plain image URLs with an `api_key` query parameter.
  final bool includeApiKeyInImageUrls;

  /// Default `Fields` value for item lookups, null to omit the parameter.
  final String? defaultItemFields;

  /// Display preferences are stored per client name; keep each server's
  /// historical name so existing user settings survive.
  final String displayPrefsClient;

  const ServerDialect._({
    required this.authScheme,
    required this.userScopedLibraryEndpoints,
    required this.supportsQuickConnect,
    required this.supportsLyrics,
    required this.supportsMediaSegments,
    required this.supportsRemoteSubtitleSearch,
    required this.includeApiKeyInImageUrls,
    required this.defaultItemFields,
    required this.displayPrefsClient,
  });

  static const jellyfin = ServerDialect._(
    authScheme: 'MediaBrowser',
    userScopedLibraryEndpoints: false,
    supportsQuickConnect: true,
    supportsLyrics: true,
    supportsMediaSegments: true,
    supportsRemoteSubtitleSearch: true,
    includeApiKeyInImageUrls: false,
    defaultItemFields:
        'Trickplay,Chapters,MediaSources,MediaStreams,People,Overview,Genres,'
        'RecursiveItemCount,ChildCount,ParentLogoItemId,ParentLogoImageTag',
    displayPrefsClient: 'moonfin',
  );

  static const emby = ServerDialect._(
    authScheme: 'Emby',
    userScopedLibraryEndpoints: true,
    supportsQuickConnect: false,
    supportsLyrics: false,
    supportsMediaSegments: false,
    supportsRemoteSubtitleSearch: false,
    includeApiKeyInImageUrls: true,
    defaultItemFields: null,
    displayPrefsClient: 'emby',
  );

  // -- Path helpers -------------------------------------------------------

  String resumePath(String userId) => userScopedLibraryEndpoints
      ? '/Users/$userId/Items/Resume'
      : '/UserItems/Resume';

  String latestPath(String userId) => userScopedLibraryEndpoints
      ? '/Users/$userId/Items/Latest'
      : '/Items/Latest';

  String favoriteItemPath(String userId, String itemId) =>
      userScopedLibraryEndpoints
          ? '/Users/$userId/FavoriteItems/$itemId'
          : '/UserFavoriteItems/$itemId';

  String playedItemPath(String userId, String itemId) =>
      userScopedLibraryEndpoints
          ? '/Users/$userId/PlayedItems/$itemId'
          : '/UserPlayedItems/$itemId';

  String ratingPath(String userId, String itemId) => userScopedLibraryEndpoints
      ? '/Users/$userId/Items/$itemId/Rating'
      : '/UserItems/$itemId/Rating';

  String userViewsPath(String userId) =>
      userScopedLibraryEndpoints ? '/Users/$userId/Views' : '/UserViews';

  String currentUserPath(String userId) =>
      userScopedLibraryEndpoints ? '/Users/$userId' : '/Users/Me';

  String userConfigPath(String userId) => userScopedLibraryEndpoints
      ? '/Users/$userId/Configuration'
      : '/Users/Configuration';

  /// Single-item lookup used by the user-library API.
  String libraryItemPath(String userId, String itemId) =>
      userScopedLibraryEndpoints
          ? '/Users/$userId/Items/$itemId'
          : '/Items/$itemId';

  /// Playlist listing: Jellyfin queries server-wide, Emby per user.
  String playlistsPath(String userId) =>
      userScopedLibraryEndpoints ? '/Users/$userId/Items' : '/Items';

  /// Recently-released listing: Jellyfin queries per user, Emby server-wide.
  String recentlyReleasedPath(String userId) =>
      userScopedLibraryEndpoints ? '/Items' : '/Users/$userId/Items';

  /// Emby passes the user along when resolving theme media.
  bool get themeMediaNeedsUserId => userScopedLibraryEndpoints;

  /// Query param name for filtering /Sessions by controllable user.
  /// Each server documents a different casing; keep both wire formats
  /// exactly as prescribed.
  String get controllableByUserIdParam => userScopedLibraryEndpoints
      ? 'ControllableByUserId'
      : 'controllableByUserId';
}
