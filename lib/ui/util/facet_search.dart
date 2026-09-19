import '../../util/accent_folding.dart';

/// Below this a filter list is quicker to read down than to type at, so the
/// box that narrows it only appears once a facet is longer than this.
const facetSearchThreshold = 15;

/// Whether [values] is long enough to be worth a search box.
bool facetIsSearchable(List<String> values) =>
    values.length > facetSearchThreshold;

/// The subset of [values] whose visible row matches [query].
///
/// Matching reads the label rather than the value, because a language row shows
/// a name while it filters on a code, and it folds accents so a tag answers to
/// the query whichever way its accents were typed. An empty query hands back
/// [values] itself, so an untouched list costs nothing.
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
