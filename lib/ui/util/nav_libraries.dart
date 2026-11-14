import '../../data/models/aggregated_library.dart';

/// Whether [a] and [b] render identically in the navigation and open the
/// same places. Comparing ids is not enough: a merged library reuses the id
/// of the library it replaced, two servers can hand out the same id, and a
/// library can be renamed. The navigation draws the name and the collection
/// type's icon, and opens by id, server and unifiedKindName.
bool sameNavLibraries(List<AggregatedLibrary> a, List<AggregatedLibrary> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].id != b[i].id ||
        a[i].serverId != b[i].serverId ||
        a[i].name != b[i].name ||
        a[i].collectionType != b[i].collectionType ||
        a[i].unifiedKindName != b[i].unifiedKindName) {
      return false;
    }
  }
  return true;
}
