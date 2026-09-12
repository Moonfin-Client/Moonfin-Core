import '../data/models/aggregated_library.dart';

/// Servers do not agree on how to spell the collection type, so it is
/// lowercased before it is compared.
bool isLiveTvLibrary(AggregatedLibrary library) =>
    library.collectionType.toLowerCase() == 'livetv';

/// The guide has a button of its own, so the library list drops Live TV rather
/// than offering a second way to the same screen.
List<AggregatedLibrary> librariesForNav(
  List<AggregatedLibrary> libraries,
  bool hasLiveTvButton,
) => hasLiveTvButton
    ? libraries.where((lib) => !isLiveTvLibrary(lib)).toList()
    : libraries;
