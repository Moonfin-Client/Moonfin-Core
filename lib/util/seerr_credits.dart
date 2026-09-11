import '../data/repositories/seerr_repository.dart';
import '../data/services/seerr/seerr_api_models.dart';

/// A person's combined credits from Seerr, split the way the detail screens
/// show them.
typedef SeerrPersonCredits = ({
  List<SeerrDiscoverItem> cast,
  List<SeerrDiscoverItem> crew,
});

/// Jobs that say nothing about what a person did on a title.
const _excludedJobs = {'thanks', 'special thanks'};

/// Fetches [personId]'s combined credits, keeping only entries with artwork
/// and dropping courtesy crew jobs. Every detail style shows the same list,
/// so they all come through here.
Future<SeerrPersonCredits> loadSeerrPersonCredits(
  SeerrRepository repo,
  int personId,
) async {
  final credits = await repo.getPersonCombinedCredits(personId);
  int byTitle(SeerrDiscoverItem a, SeerrDiscoverItem b) =>
      a.displayTitle.compareTo(b.displayTitle);
  return (
    cast: credits.cast.where((i) => i.posterPath != null).toList()
      ..sort(byTitle),
    crew:
        credits.crew
            .where(
              (i) =>
                  i.posterPath != null &&
                  !_excludedJobs.contains(i.job?.toLowerCase()),
            )
            .toList()
          ..sort(byTitle),
  );
}

/// Collapses repeats of the same title into one entry, joining the roles or
/// jobs that earned it a place. Seerr lists a title once per credit, so a
/// person who wrote and directed the same film appears twice without this.
List<SeerrDiscoverItem> groupSeerrCredits(
  List<SeerrDiscoverItem> list, {
  required bool isCrew,
}) {
  final grouped = <int, List<SeerrDiscoverItem>>{};
  for (final item in list) {
    grouped.putIfAbsent(item.id, () => []).add(item);
  }

  return [
    for (final entries in grouped.values)
      if (entries.length == 1)
        entries.first
      else
        _merged(entries, isCrew: isCrew),
  ];
}

SeerrDiscoverItem _merged(
  List<SeerrDiscoverItem> entries, {
  required bool isCrew,
}) {
  final first = entries.first;
  final parts = <String>{};
  for (final entry in entries) {
    final part = isCrew ? (entry.job ?? entry.department) : entry.character;
    if (part != null && part.isNotEmpty) parts.add(part);
  }
  final combined = parts.join(', ');
  return SeerrDiscoverItem(
    id: first.id,
    mediaType: first.mediaType,
    title: first.title,
    name: first.name,
    originalTitle: first.originalTitle,
    originalName: first.originalName,
    posterPath: first.posterPath,
    backdropPath: first.backdropPath,
    overview: first.overview,
    releaseDate: first.releaseDate,
    firstAirDate: first.firstAirDate,
    originalLanguage: first.originalLanguage,
    genreIds: first.genreIds,
    voteAverage: first.voteAverage,
    voteCount: first.voteCount,
    popularity: first.popularity,
    adult: first.adult,
    mediaInfo: first.mediaInfo,
    character: isCrew
        ? first.character
        : (combined.isNotEmpty ? combined : null),
    job: isCrew ? (combined.isNotEmpty ? combined : null) : first.job,
    department: first.department,
  );
}

/// Orders a person's credits by the person page sort preference. Entries with
/// no date at all sink to the bottom whichever way the dates run.
List<SeerrDiscoverItem> sortSeerrCredits(
  List<SeerrDiscoverItem> items,
  String sortOption,
) {
  final sorted = List<SeerrDiscoverItem>.from(items);

  int byTitle(SeerrDiscoverItem a, SeerrDiscoverItem b) =>
      a.displayTitle.toLowerCase().compareTo(b.displayTitle.toLowerCase());

  if (sortOption == 'alphabetical') {
    return sorted..sort(byTitle);
  }

  final ascending = sortOption == 'releaseDateAsc';

  sorted.sort((a, b) {
    final rawA = a.releaseDate ?? a.firstAirDate;
    final rawB = b.releaseDate ?? b.firstAirDate;

    if (rawA == null && rawB == null) return byTitle(a, b);
    if (rawA == null) return 1;
    if (rawB == null) return -1;

    final dateA = DateTime.tryParse(rawA);
    final dateB = DateTime.tryParse(rawB);

    if (dateA == null && dateB == null) return rawA.compareTo(rawB);
    if (dateA == null) return 1;
    if (dateB == null) return -1;

    final comparison = dateA.compareTo(dateB);

    return ascending ? comparison : -comparison;
  });

  return sorted;
}
