import '../../data/models/aggregated_library.dart';

/// Whether [a] and [b] render identically in the navigation. Comparing ids is
/// not enough: a merged library reuses the id of the library it replaced and
/// differs only in its unifiedKindName.
bool sameNavLibraries(List<AggregatedLibrary> a, List<AggregatedLibrary> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].id != b[i].id || a[i].unifiedKindName != b[i].unifiedKindName) {
      return false;
    }
  }
  return true;
}
