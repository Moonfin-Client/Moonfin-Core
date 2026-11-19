/// Item types between Silo and the Jellyfin shapes Moonfin reads.
///
/// Silo's `CatalogItem.type` is one of `movie`, `series`, `season`,
/// `episode`, `audiobook`, `ebook`, `podcast`, `podcast_episode`. Moonfin
/// reads Jellyfin's `Type`, `MediaType` and `IsFolder`.
library;

/// How one Silo type appears in a Jellyfin `BaseItemDto`.
class SiloItemType {
  const SiloItemType({
    required this.siloType,
    required this.jellyfinType,
    required this.mediaType,
    required this.isFolder,
  });

  final String siloType;
  final String jellyfinType;

  /// Jellyfin's `MediaType`, or null for containers (series, season), as Emby
  /// sends it.
  final String? mediaType;
  final bool isFolder;
}

/// Every Silo type with a Jellyfin equivalent, keyed by Silo type. Values match
/// what Emby sends for the same kind of item (see the Emby fixtures).
///
/// `podcast` and `podcast_episode` are left out: Jellyfin has no such type
/// and no Moonfin screen shows them, so they don't map.
const Map<String, SiloItemType> siloItemTypes = {
  'movie': SiloItemType(
    siloType: 'movie',
    jellyfinType: 'Movie',
    mediaType: 'Video',
    isFolder: false,
  ),
  'series': SiloItemType(
    siloType: 'series',
    jellyfinType: 'Series',
    mediaType: null,
    isFolder: true,
  ),
  'season': SiloItemType(
    siloType: 'season',
    jellyfinType: 'Season',
    mediaType: null,
    isFolder: true,
  ),
  'episode': SiloItemType(
    siloType: 'episode',
    jellyfinType: 'Episode',
    mediaType: 'Video',
    isFolder: false,
  ),
  'audiobook': SiloItemType(
    siloType: 'audiobook',
    jellyfinType: 'AudioBook',
    mediaType: 'Audio',
    isFolder: false,
  ),
  'ebook': SiloItemType(
    siloType: 'ebook',
    jellyfinType: 'Book',
    mediaType: 'Book',
    isFolder: false,
  ),
};

/// The mapping for Silo's [type], or null when it has none (`podcast`, an
/// unknown future type, a missing field).
SiloItemType? siloItemTypeOf(Object? type) =>
    type is String ? siloItemTypes[type.trim().toLowerCase()] : null;

/// The Silo types Moonfin handles, which is video only. As in
/// `FeatureDetector`, a type is only on once Moonfin can open it.
const Set<String> siloSupportedTypes = {'movie', 'series', 'season', 'episode'};

/// Silo's type for each lowercased Jellyfin `Type` that has one.
final Map<String, String> _siloTypeByJellyfin = {
  for (final t in siloItemTypes.values)
    t.jellyfinType.toLowerCase(): t.siloType,
};

/// The Silo types carrying each lowercased Jellyfin `MediaType`.
final Map<String, Set<String>> _siloTypesByMediaType = () {
  final map = <String, Set<String>>{};
  for (final t in siloItemTypes.values) {
    final media = t.mediaType;
    if (media == null) continue;
    map.putIfAbsent(media.toLowerCase(), () => {}).add(t.siloType);
  }
  return map;
}();

/// The Silo types a Jellyfin-style query asks for.
///
/// [includeItemTypes] (`Movie`, `Episode`…) and [mediaTypes] (`Video`,
/// `Audio`…, comma-separated) narrow the query together, as on Jellyfin.
/// Names are matched case-insensitively. Jellyfin types Silo doesn't have
/// (`MusicAlbum`, `Playlist`, `TvChannel`…) match nothing. The answer is then
/// limited to [supported].
///
/// - **null**: the query names no type, so it isn't narrowed by type.
/// - **empty**: it names only types Silo can't serve here. The caller answers
///   with an empty result and sends **no request**: dropping the filter would
///   return films for a "Continue listening" or "Albums" row.
/// - otherwise the Silo types to ask for.
Set<String>? siloTypesForQuery({
  Iterable<String>? includeItemTypes,
  String? mediaTypes,
  Set<String> supported = siloSupportedTypes,
}) {
  final named = includeItemTypes
      ?.map((t) => t.trim().toLowerCase())
      .where((t) => t.isNotEmpty)
      .toList();
  final media = mediaTypes
      ?.split(',')
      .map((t) => t.trim().toLowerCase())
      .where((t) => t.isNotEmpty)
      .toList();
  final hasTypes = named != null && named.isNotEmpty;
  final hasMedia = media != null && media.isNotEmpty;
  if (!hasTypes && !hasMedia) return null;

  Set<String>? result;
  if (hasTypes) {
    result = {
      for (final t in named)
        if (_siloTypeByJellyfin[t] case final silo?) silo,
    };
  }
  if (hasMedia) {
    final byMedia = {for (final m in media) ...?_siloTypesByMediaType[m]};
    result = result == null ? byMedia : result.intersection(byMedia);
  }
  return result!.intersection(supported);
}

/// The single `type` scope of `GET /catalog` that lists exactly [types], or
/// null when no one scope does: a season is listed through its series, and
/// mixes such as movies with episodes take more than one request.
///
/// `video` is Silo's scope for movies and series together.
String? siloCatalogScopeFor(Set<String> types) {
  if (types.length == 1) {
    final only = types.single;
    return only == 'season' ? null : only;
  }
  if (types.length == 2 &&
      types.contains('movie') &&
      types.contains('series')) {
    return 'video';
  }
  return null;
}

/// Silo's types for movies, series and episodes: what its search-only
/// `video_with_episodes` scope covers.
const Set<String> _siloVideoWithEpisodes = {'movie', 'series', 'episode'};

/// The `type` scope of a catalog **search** (`q`) for [types].
///
/// Silo lists episodes apart from films and series. Only a text search can
/// mix them, through the `video_with_episodes` scope. That scope is used
/// when [withEpisodes] (the server's `video_with_episodes_scope`
/// capability) and the search asks for episodes along with films or series,
/// or for any type ([types] null) while Moonfin shows only video. Otherwise
/// the scope is the browse one ([siloCatalogScopeFor]). With no type the
/// search is unscoped and the caller keeps what it can show.
String? siloSearchScopeFor(Set<String>? types, {required bool withEpisodes}) {
  final wanted = types ?? siloSupportedTypes.difference({'season'});
  if (withEpisodes &&
      wanted.length > 1 &&
      wanted.contains('episode') &&
      _siloVideoWithEpisodes.containsAll(wanted)) {
    return 'video_with_episodes';
  }
  return types == null ? null : siloCatalogScopeFor(types);
}
