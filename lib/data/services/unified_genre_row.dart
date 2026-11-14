import 'dart:math';

import '../models/aggregated_item.dart';
import '../utils/blocked_ratings.dart';
import 'unified_catalog_query.dart';
import 'unified_catalog_service.dart';

/// The name of the genre [genreId] as its server's [items] give it, else
/// [title] unless an item's genres contradict it.
String? genreNameOf(
  Iterable<AggregatedItem> items,
  String genreId, {
  required String title,
}) {
  for (final item in items) {
    final genres = item.rawData['GenreItems'];
    if (genres is! List) continue;
    for (final genre in genres) {
      if (genre is! Map || genre['Id']?.toString() != genreId) continue;
      final name = genre['Name']?.toString().trim() ?? '';
      if (name.isNotEmpty) return name;
    }
  }
  final key = genreNameKey(title);
  if (key.isEmpty) return null;
  final agrees = items.every((item) {
    final genres = item.rawData['Genres'];
    return genres is! List ||
        genres.any((genre) => genreNameKey(genre.toString()) == key);
  });
  return agrees ? title.trim() : null;
}

bool hasCatalogCards(Iterable<AggregatedItem> items) =>
    items.any((item) => item.rawData.containsKey(unifiedCopiesKey));

/// Catalog-backed stand-in for a Home genre row: the cards of one genre,
/// read from the merged catalog instead of from a single server.
class UnifiedGenreRow {
  const UnifiedGenreRow({
    required this.name,
    required this.kinds,
    required this.sortBy,
    required this.descending,
    required this.activeServerId,
  });

  final String name;
  final List<UnifiedLibraryKind> kinds;
  final String sortBy;
  final bool descending;

  /// Server id to attribute live cards to, since their own serverId is the
  /// base URL.
  final String activeServerId;

  bool get _isRandom => sortBy.split(',').first == 'Random';

  List<AggregatedItem> cards(UnifiedCatalogService catalog) {
    final snapshot = catalog.snapshotOf(
      kinds,
      UnifiedCatalogQuery(
        itemTypes: kinds.map((kind) => kind.itemType).join(','),
        sortBy: sortBy,
        descending: descending,
        genre: name,
      ),
    );
    return [
      for (final raw in snapshot.items)
        if (!isAnyCopyBlocked(raw))
          AggregatedItem(
            id: raw['Id'].toString(),
            serverId: raw[unifiedServerIdKey].toString(),
            rawData: raw,
          ),
    ];
  }

  /// Null when the catalog holds nothing of the genre. A random row keeps
  /// [shown] in place, since a second draw would move every card.
  ({List<AggregatedItem> items, int total})? complete(
    List<AggregatedItem> shown,
    UnifiedCatalogService catalog, {
    required int limit,
  }) {
    final all = cards(catalog);
    if (all.isEmpty) return null;
    final size = max(limit, shown.length);
    if (!_isRandom) {
      return (items: all.take(size).toList(), total: all.length);
    }
    final byCopy = {
      for (final card in all)
        for (final key in _copyKeys(card)) key: card,
    };
    final placed = Set<AggregatedItem>.identity();
    final items = <AggregatedItem>[];
    // Live cards the catalog doesn't hold, kept beside every card it does.
    var liveOnly = 0;
    for (final item in shown) {
      final card = _copyKeys(item).map((key) => byCopy[key]).nonNulls.firstOrNull;
      if (card != null) {
        if (placed.add(card)) items.add(card);
      } else if (!hasCatalogCards([item])) {
        items.add(item);
        liveOnly++;
      }
    }
    for (final card in all) {
      if (items.length >= size) break;
      if (placed.add(card)) items.add(card);
    }
    return (items: items, total: all.length + liveOnly);
  }

  ({List<AggregatedItem> items, int total}) nextPage(
    List<AggregatedItem> shown,
    UnifiedCatalogService catalog, {
    required int pageSize,
    required int maxItems,
  }) {
    final seen = {for (final item in shown) ..._copyKeys(item)};
    final more = [
      for (final card in cards(catalog))
        if (!_copyKeys(card).any(seen.contains)) card,
    ];
    final room = min(pageSize, max(0, maxItems - shown.length));
    final items = [...shown, ...more.take(room)];
    return (
      items: items,
      total: items.length >= maxItems
          ? items.length
          : shown.length + more.length,
    );
  }

  Iterable<String> _copyKeys(AggregatedItem item) {
    final copies = unifiedCopiesOf(item.rawData);
    if (copies.isNotEmpty) return copies.map((copy) => copy.key);
    return [unifiedCopyKey(activeServerId, item.id)];
  }
}
