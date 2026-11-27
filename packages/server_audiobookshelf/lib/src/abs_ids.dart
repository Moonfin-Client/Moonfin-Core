/// Ids the app sees for Audiobookshelf objects.
///
/// A library item keeps its own Audiobookshelf id, so the routes that take one
/// work with it as it is. Everything else gets a prefix, since the app asks
/// for any of them through the same item lookup.
const absLibraryPrefix = 'library-';
const absSeriesPrefix = 'series-';
const absAuthorPrefix = 'author-';
const absCollectionPrefix = 'collection-';
const absPlaylistPrefix = 'playlist-';
const absGenrePrefix = 'genre-';
const absEpisodePrefix = 'episode-';

/// Joins a podcast's item id and an episode id. Both are UUIDs, which have
/// dashes of their own.
const _episodeSeparator = '~';

String absLibraryId(String id) => '$absLibraryPrefix$id';
String absSeriesId(String id) => '$absSeriesPrefix$id';
String absAuthorId(String id) => '$absAuthorPrefix$id';
String absCollectionId(String id) => '$absCollectionPrefix$id';
String absPlaylistId(String id) => '$absPlaylistPrefix$id';
String absGenreId(String name) => '$absGenrePrefix${Uri.encodeComponent(name)}';
String absEpisodeId(String itemId, String episodeId) =>
    '$absEpisodePrefix$itemId$_episodeSeparator$episodeId';

String? _after(String? id, String prefix) =>
    id != null && id.startsWith(prefix) ? id.substring(prefix.length) : null;

String? absLibraryKey(String? id) => _after(id, absLibraryPrefix);
String? absSeriesKey(String? id) => _after(id, absSeriesPrefix);
String? absAuthorKey(String? id) => _after(id, absAuthorPrefix);
String? absCollectionKey(String? id) => _after(id, absCollectionPrefix);
String? absPlaylistKey(String? id) => _after(id, absPlaylistPrefix);

String? absGenreKey(String? id) {
  final raw = _after(id, absGenrePrefix);
  return raw == null ? null : Uri.decodeComponent(raw);
}

/// The podcast item and episode an episode id names, or null for any other id.
({String itemId, String episodeId})? absEpisodeKey(String? id) {
  final raw = _after(id, absEpisodePrefix);
  if (raw == null) return null;
  final at = raw.indexOf(_episodeSeparator);
  if (at <= 0 || at == raw.length - 1) return null;
  return (itemId: raw.substring(0, at), episodeId: raw.substring(at + 1));
}

/// The route that holds the signed in user's progress for a book or episode.
String absProgressPath(String id) {
  final episode = absEpisodeKey(id);
  return episode == null
      ? '/api/me/progress/$id'
      : '/api/me/progress/${episode.itemId}/${episode.episodeId}';
}

/// The library item an id belongs to: the id itself, or an episode's podcast.
String absItemIdOf(String id) => absEpisodeKey(id)?.itemId ?? id;

/// Whether [id] is a library item, the one kind of id without a prefix.
bool absIsLibraryItemId(String id) => !const [
  absLibraryPrefix,
  absSeriesPrefix,
  absAuthorPrefix,
  absCollectionPrefix,
  absPlaylistPrefix,
  absGenrePrefix,
  absEpisodePrefix,
].any(id.startsWith);
