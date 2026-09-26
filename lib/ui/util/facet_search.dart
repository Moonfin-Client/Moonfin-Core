import '../../util/accent_folding.dart';

/// Facets longer than this get a search box.
const facetSearchThreshold = 15;

/// Whether [values] is long enough to be worth a search box.
bool facetIsSearchable(List<String> values) =>
    values.length > facetSearchThreshold;

/// The subset of [values] whose label matches [query], ignoring accents. Labels, not values,
/// since a language shows a name but filters on a code.
List<String> facetValuesMatching(
  List<String> values,
  String query, {
  Map<String, String> labels = const {},
}) {
  final folded = foldForSearch(query.trim());
  if (folded.isEmpty) return values;
  return [
    for (final value in values)
      if (foldForSearch(labels[value] ?? value).contains(folded)) value,
  ];
}
