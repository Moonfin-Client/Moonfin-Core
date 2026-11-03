/// Moonfin's sort fields (Jellyfin `ItemSortBy`) and Silo's `sort` values.
///
/// Silo sorts by one term, `field` or `-field` for descending. The fields
/// come from the server's sort definitions, checked against the live server,
/// and `date_viewed` and `plays` are per profile. Silo's contract also names
/// `rating` and `random`, but the catalog refuses both. Random order exists
/// only as a home section ("Surprise Me"), so `Random` maps to nothing here
/// and the items API shuffles instead ([siloWantsRandom]). A Moonfin field
/// with no Silo equivalent maps to nothing, and the request then leaves
/// `sort` out so Silo applies the list's saved or default order, rather than
/// risk an error for a field Silo doesn't know.
library;

/// Jellyfin sort field (lowercased) to Silo sort field.
const Map<String, String> siloSortFields = {
  'sortname': 'title',
  'name': 'title',
  'seriessortname': 'title',
  'productionyear': 'year',
  'premieredate': 'release_date',
  'datecreated': 'added_at',
  // "Date Episode Added": when a show's newest episode file arrived.
  'datelastcontentadded': 'latest_episode_added',
  // The rating Moonfin shows as a card's community rating. Silo's `rating`
  // alias is refused by the catalog (422).
  'communityrating': 'rating_tmdb',
  // Rotten Tomatoes critics, when a metadata plugin provides it.
  'criticrating': 'rating_rt_critic',
  // Moonfin's "Rating" menu entry: the content rating (PG-13…).
  'officialrating': 'content_rating',
  'runtime': 'runtime',
  // Per profile: the title's last watch and its completed plays.
  'dateplayed': 'date_viewed',
  'playcount': 'plays',
};

/// Silo's `sort` value for Moonfin's [sortBy] and [sortOrder], or null to
/// leave `sort` out.
///
/// Moonfin sends a comma-separated list (`ProductionYear,SortName`), and
/// Silo takes one term, so only the **first** counts. When the first has no
/// Silo equivalent the answer is null rather than the next term: an episode
/// list asked for in `ParentIndexNumber,IndexNumber,SortName` order must
/// keep Silo's natural episode order, not be sorted by title. `Descending`
/// (the first of [sortOrder]'s terms) gives `-field`. `Random` gives null
/// ([siloWantsRandom]).
String? siloSortFor({String? sortBy, String? sortOrder}) {
  final first = _firstTerm(sortBy);
  if (first == null) return null;
  final field = siloSortFields[first.toLowerCase()];
  if (field == null) return null;
  final descending = _firstTerm(sortOrder)?.toLowerCase() == 'descending';
  return descending ? '-$field' : field;
}

/// Moonfin's sort field and order for Silo's [sort] value (`-added_at`), or
/// null for a field Moonfin has no name for. For showing the order Silo
/// applied (`effective_sort`) in Moonfin's sort menu.
({String sortBy, String sortOrder})? jellyfinSortForSilo(String? sort) {
  final term = sort?.trim();
  if (term == null || term.isEmpty) return null;
  final descending = term.startsWith('-');
  final field = descending ? term.substring(1) : term;
  final sortBy = _jellyfinNames[field.toLowerCase()];
  if (sortBy == null) return null;
  return (sortBy: sortBy, sortOrder: descending ? 'Descending' : 'Ascending');
}

const _jellyfinNames = {
  'title': 'SortName',
  'year': 'ProductionYear',
  'release_date': 'PremiereDate',
  'added_at': 'DateCreated',
  'latest_episode_added': 'DateLastContentAdded',
  'rating_tmdb': 'CommunityRating',
  'rating_rt_critic': 'CriticRating',
  'content_rating': 'OfficialRating',
  'runtime': 'Runtime',
  'random': 'Random',
  'date_viewed': 'DatePlayed',
  'plays': 'PlayCount',
};

/// Whether [sortBy]'s first term asks for a random order, which Silo's
/// catalog can't sort by: the caller leaves `sort` out and shuffles.
bool siloWantsRandom(String? sortBy) =>
    _firstTerm(sortBy)?.toLowerCase() == 'random';

String? _firstTerm(String? list) {
  if (list == null) return null;
  for (final term in list.split(',')) {
    final t = term.trim();
    if (t.isNotEmpty) return t;
  }
  return null;
}
