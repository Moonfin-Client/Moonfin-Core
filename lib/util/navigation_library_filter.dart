import '../data/models/aggregated_library.dart';

/// Collection types promoted by the movie/TV-first navigation profile.
///
/// Jellyfin's user-views endpoint has already applied the signed-in user's
/// library access policy. This filter only removes unwanted media types; it
/// never adds a library the user cannot access.
const movieTvNavigationCollectionTypes = <String>{'movies', 'tvshows'};

bool isMovieOrTvLibrary(AggregatedLibrary library) =>
    movieTvNavigationCollectionTypes.contains(
      library.collectionType.toLowerCase(),
    );

List<AggregatedLibrary> filterNavigationLibraries(
  Iterable<AggregatedLibrary> libraries, {
  required bool movieTvOnly,
}) {
  if (!movieTvOnly) return List<AggregatedLibrary>.of(libraries);
  return libraries.where(isMovieOrTvLibrary).toList();
}
