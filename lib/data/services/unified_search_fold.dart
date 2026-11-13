import '../models/aggregated_item.dart';
import 'unified_catalog_query.dart';

/// Folds the movies and series in [items] that several of [servers] hold into
/// one item each, as a merged library shows them. Order is kept: a folded
/// title stands where its first copy stood, and the rest come back untouched.
/// [knownCopies] adds the copies the catalog holds of a title found here.
List<AggregatedItem> foldSharedTitles(
  List<AggregatedItem> items,
  List<UnifiedServerInfo> servers, {
  Iterable<UnifiedCatalogEntry> Function(UnifiedCatalogEntry found)?
  knownCopies,
}) {
  final order = UnifiedServerOrder(servers);
  final entries = <UnifiedCatalogEntry>[];
  final entryOf = Map<AggregatedItem, UnifiedCatalogEntry>.identity();
  for (final item in items) {
    final itemType = UnifiedLibraryKind.fromItemType(item.type)?.itemType;
    if (itemType == null || !order.holds(item.serverId)) continue;
    final entry = UnifiedCatalogEntry(
      serverId: item.serverId,
      itemId: item.id,
      itemType: itemType,
      raw: item.rawData,
    );
    entries.add(entry);
    entryOf[item] = entry;
  }
  final foundCount = entries.length;
  if (knownCopies != null) {
    final seen = {
      for (final entry in entries) unifiedCopyKey(entry.serverId, entry.itemId),
    };
    for (final entry in entries.sublist(0, foundCount)) {
      for (final copy in knownCopies(entry)) {
        if (order.holds(copy.serverId) &&
            seen.add(unifiedCopyKey(copy.serverId, copy.itemId))) {
          entries.add(copy);
        }
      }
    }
  }
  if (entries.length < 2) return items;
  final foundEntries = entryOf.values.toSet();

  // A group's first copy is the earliest, whose place the folded title takes.
  final folded = Map<UnifiedCatalogEntry, AggregatedItem>.identity();
  final dropped = Set<UnifiedCatalogEntry>.identity();
  for (final kind in UnifiedLibraryKind.values) {
    final groups = groupCatalogEntries(
      entries,
      itemType: kind.itemType,
      order: order,
    );
    for (final copies in groups) {
      // Found entries come first, so a group without one has none at all.
      if (copies.length < 2 || !foundEntries.contains(copies.first)) continue;
      final raw = mergeCatalogCopies(copies, order);
      // The copy shown comes first among the copies.
      final shown = unifiedCopiesOf(raw).first;
      folded[copies.first] = AggregatedItem(
        id: shown.itemId,
        serverId: shown.serverId,
        rawData: raw,
      );
      dropped.addAll(copies.skip(1));
    }
  }
  if (folded.isEmpty) return items;

  final result = <AggregatedItem>[];
  for (final item in items) {
    final entry = entryOf[item];
    if (entry == null) {
      result.add(item);
    } else if (!dropped.contains(entry)) {
      result.add(folded[entry] ?? item);
    }
  }
  return result;
}
