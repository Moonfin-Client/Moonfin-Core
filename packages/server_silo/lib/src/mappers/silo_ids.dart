/// Item ids between Silo and Moonfin.
///
/// Moonfin treats an item id as an opaque string, so Silo's ids pass through
/// unchanged: content ids such as `movie-imdb-tt0295701`, numeric person and
/// library ids (sent as strings, sometimes as numbers).
///
/// Jellyfin also gives **genres and studios** ids, and Moonfin opens a genre or
/// studio page by id. Silo names them only, so Moonfin makes a synthetic id
/// from the name: `silo-genre:<name>` and `silo-studio:<name>`, with the name
/// percent-encoded so any character survives the round trip. The Silo client
/// recognizes these ids and turns them back into a name filter.
library;

const siloGenreIdPrefix = 'silo-genre:';

const siloStudioIdPrefix = 'silo-studio:';

/// A Silo id as Moonfin's string id: numbers become their decimal text,
/// strings are trimmed, and anything empty or missing is null.
String? siloIdOf(Object? raw) {
  if (raw == null) return null;
  final text = raw is num ? raw.toString() : raw.toString().trim();
  return text.isEmpty ? null : text;
}

String siloGenreId(String name) =>
    '$siloGenreIdPrefix${Uri.encodeComponent(name)}';

String siloStudioId(String name) =>
    '$siloStudioIdPrefix${Uri.encodeComponent(name)}';

/// The genre name in a synthetic genre id, or null when [id] isn't one.
String? siloGenreNameOf(String id) => _nameAfter(siloGenreIdPrefix, id);

/// The studio name in a synthetic studio id, or null when [id] isn't one.
String? siloStudioNameOf(String id) => _nameAfter(siloStudioIdPrefix, id);

bool isSyntheticSiloId(String id) =>
    id.startsWith(siloGenreIdPrefix) || id.startsWith(siloStudioIdPrefix);

String? _nameAfter(String prefix, String id) {
  if (!id.startsWith(prefix)) return null;
  final encoded = id.substring(prefix.length);
  if (encoded.isEmpty) return null;
  try {
    return Uri.decodeComponent(encoded);
  } on ArgumentError {
    // Not percent-encoded by us, so take it as written.
    return encoded;
  }
}

/// The id of season [seasonNumber] of the series [seriesId].
///
/// Silo names seasons after their series: `series-imdb-tt1641384` has
/// `season-imdb-tt1641384-1`, `-2`… An episode's detail carries its
/// `series_id` and `season_number` but no season id, so Moonfin builds it to
/// fill `SeasonId`. Null when [seriesId] isn't a Silo series id.
String? siloSeasonId(String seriesId, int seasonNumber) {
  const prefix = 'series-';
  if (!seriesId.startsWith(prefix) || seriesId.length == prefix.length) {
    return null;
  }
  return 'season-${seriesId.substring(prefix.length)}-$seasonNumber';
}

/// The series and season number inside a season id, the reverse of
/// [siloSeasonId]: Moonfin asks for a season's episodes by `SeasonId`, and
/// Silo lists them by series and number. Null when [seasonId] isn't one.
({String seriesId, int seasonNumber})? parseSiloSeasonId(String seasonId) {
  const prefix = 'season-';
  if (!seasonId.startsWith(prefix)) return null;
  final dash = seasonId.lastIndexOf('-');
  if (dash <= prefix.length) return null;
  final number = int.tryParse(seasonId.substring(dash + 1));
  if (number == null || number < 0) return null;
  final key = seasonId.substring(prefix.length, dash);
  return (seriesId: 'series-$key', seasonNumber: number);
}

/// The Silo type an id names by its prefix (`movie-…`, `series-…`,
/// `season-…`, `episode-…`), or null. Season and episode **list entries**
/// carry no `type` field, so the mapper falls back to this.
String? siloTypeOfId(String id) {
  final dash = id.indexOf('-');
  if (dash <= 0) return null;
  final prefix = id.substring(0, dash);
  return const {'movie', 'series', 'season', 'episode'}.contains(prefix)
      ? prefix
      : null;
}

/// The series, season number and episode number inside an episode id
/// (`episode-<key>-<season>-<episode>`, e.g. `episode-imdb-tt1641384-1-1`),
/// or null when [episodeId] isn't one.
({String seriesId, int seasonNumber, int episodeNumber})? parseSiloEpisodeId(
  String episodeId,
) {
  const prefix = 'episode-';
  if (!episodeId.startsWith(prefix)) return null;
  final match = RegExp(
    r'^(.+)-(\d+)-(\d+)$',
  ).firstMatch(episodeId.substring(prefix.length));
  if (match == null) return null;
  return (
    seriesId: 'series-${match.group(1)}',
    seasonNumber: int.parse(match.group(2)!),
    episodeNumber: int.parse(match.group(3)!),
  );
}

/// Prefix of a personal collection's id in Moonfin.
const siloCollectionIdPrefix = 'silo-collection:';

/// Prefix of a library collection's id in Moonfin.
const siloLibraryCollectionIdPrefix = 'silo-libcollection:';

/// Moonfin's id for Silo's personal collection [id]. Silo's collection ids
/// are opaque strings that could look like anything, so collections get a
/// prefix that tells them apart from titles, people and libraries.
String siloCollectionId(String id) => '$siloCollectionIdPrefix$id';

/// Moonfin's id for collection [id] of library [libraryId]. A library
/// collection is read and paged through its library.
String siloLibraryCollectionId(String libraryId, String id) =>
    '$siloLibraryCollectionIdPrefix$libraryId:$id';

/// What a collection id names: a personal collection (no library) or a
/// library's collection. Null when [id] isn't a collection id.
({String id, String? libraryId})? parseSiloCollectionId(String id) {
  if (id.startsWith(siloCollectionIdPrefix)) {
    final rest = id.substring(siloCollectionIdPrefix.length);
    return rest.isEmpty ? null : (id: rest, libraryId: null);
  }
  if (id.startsWith(siloLibraryCollectionIdPrefix)) {
    final rest = id.substring(siloLibraryCollectionIdPrefix.length);
    final colon = rest.indexOf(':');
    if (colon <= 0 || colon == rest.length - 1) return null;
    return (id: rest.substring(colon + 1), libraryId: rest.substring(0, colon));
  }
  return null;
}
