import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';

/// Enriches a list of Next Up items with an accurate [LastPlayedDate] pulled
/// from the parent Series, so that the continue-watching row sorts correctly
/// when a user's most-recently-watched episode has an older [DateCreated].
///
/// Strategy:
///  1. Start from the [recentlyPlayed] map [fetchSeriesLastPlayed] builds.
///  2. For any series still missing (i.e. beyond the top 100), batch-query
///     the Series items directly by ID.
///  3. Set each item's effective LastPlayedDate to
///     max(seriesLastPlayed, episodeDateCreated).
Future<List<AggregatedItem>> enrichNextUpItemsWithSeriesLastPlayed(
  List<AggregatedItem> items,
  MediaServerClient client,
  Future<Map<String, String>?> recentlyPlayed,
) async {
  final seriesIds = items
      .map((item) => item.rawData['SeriesId']?.toString())
      .where((id) => id != null && id.isNotEmpty)
      .cast<String>()
      .toSet()
      .toList();

  if (seriesIds.isEmpty) return items;

  try {
    final seriesLastPlayedMap = await recentlyPlayed;
    if (seriesLastPlayedMap == null) return items;

    // 2. For any series not found in the top 100, batch-query directly.
    //    Note: do NOT pass recursive=true when IDs are supplied — it has no
    //    effect on ID-based lookups but can cause some servers to include
    //    child items, eating into the limit.
    final missingSeriesIds = seriesIds
        .where((id) => !seriesLastPlayedMap.containsKey(id))
        .toList();
    if (missingSeriesIds.isNotEmpty) {
      final seriesResponse = await client.itemsApi.getItems(
        ids: missingSeriesIds,
        fields: 'UserData',
        limit: missingSeriesIds.length,
      );
      final seriesItems = seriesResponse['Items'] as List? ?? [];
      for (final s in seriesItems) {
        if (s is Map) {
          final id = s['Id']?.toString();
          final lastPlayed = s['UserData']?['LastPlayedDate'] as String?;
          if (id != null && lastPlayed != null && lastPlayed.isNotEmpty) {
            seriesLastPlayedMap[id] = lastPlayed;
          }
        }
      }
    }

    // 3. Determine the effective date for each item
    return items.map((item) {
      final sId = item.rawData['SeriesId']?.toString();
      final seriesLastPlayed = sId != null ? seriesLastPlayedMap[sId] : null;
      final episodeDateCreated = item.rawData['DateCreated'] as String?;

      final lastPlayedDate = seriesLastPlayed != null
          ? DateTime.tryParse(seriesLastPlayed)
          : null;
      final dateCreated = episodeDateCreated != null
          ? DateTime.tryParse(episodeDateCreated)
          : null;

      DateTime? effectiveDate;
      if (lastPlayedDate != null && dateCreated != null) {
        effectiveDate = lastPlayedDate.isAfter(dateCreated)
            ? lastPlayedDate
            : dateCreated;
      } else {
        effectiveDate = lastPlayedDate ?? dateCreated;
      }

      if (effectiveDate != null) {
        final updatedRaw = Map<String, dynamic>.from(item.rawData);
        final userData = Map<String, dynamic>.from(
          updatedRaw['UserData'] as Map? ?? {},
        );
        userData['LastPlayedDate'] = effectiveDate.toIso8601String();
        updatedRaw['UserData'] = userData;
        return AggregatedItem(
          id: item.id,
          serverId: item.serverId,
          rawData: updatedRaw,
        );
      }
      return item;
    }).toList();
  } catch (_) {
    return items;
  }
}

/// When each series was last played, read from the 100 most recently played
/// episodes, or null when the lookup failed. It doesn't need Next Up's answer,
/// so callers send it right after the Next Up request. Next Up goes first so a
/// timeout on it never counts time spent queued behind this.
Future<Map<String, String>?> fetchSeriesLastPlayed(
  MediaServerClient client,
) async {
  try {
    final recentPlayedResponse = await client.itemsApi.getItems(
      includeItemTypes: const ['Episode'],
      filters: const ['IsPlayed'],
      recursive: true,
      sortBy: 'DatePlayed',
      sortOrder: 'Descending',
      limit: 100,
      fields: 'UserData,SeriesId',
    );

    final recentItems = recentPlayedResponse['Items'] as List? ?? [];
    final seriesLastPlayedMap = <String, String>{};
    for (final item in recentItems) {
      if (item is Map) {
        final sId = item['SeriesId']?.toString();
        final lastPlayed = item['UserData']?['LastPlayedDate'] as String?;
        if (sId != null && lastPlayed != null && lastPlayed.isNotEmpty) {
          seriesLastPlayedMap.putIfAbsent(sId, () => lastPlayed);
        }
      }
    }
    return seriesLastPlayedMap;
  } catch (_) {
    return null;
  }
}
