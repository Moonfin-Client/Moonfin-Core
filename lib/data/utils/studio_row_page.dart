import 'dart:math';

import 'package:server_core/server_core.dart';

/// The sort a studio row with nothing picked can apply. Jellyfin's /Studios
/// only lists by name, so name and random are the orders a page can give; any
/// other order would need every studio, so it stays A to Z.
(String sortBy, String sortOrder) unpickedStudioSort(
  String sortBy,
  String sortOrder,
) => const ['SortName', 'Random'].contains(sortBy.split(',').first)
    ? (sortBy, sortOrder)
    : ('SortName', 'Ascending');

/// Reads the studios a row with nothing picked is drawn from, in name order:
/// the first page for A to Z, the last page for Z to A, and a page at a random
/// offset for Random. The caller sorts the result.
Future<Map<String, dynamic>> fetchStudioRowPage(
  Future<Map<String, dynamic>> Function(int startIndex, int limit) fetchPage, {
  required String sortBy,
  required String sortOrder,
  required int limit,
  required int pageSize,
}) async {
  final random = sortBy == 'Random';
  final descending = sortOrder.toLowerCase() == 'descending';
  final first = await fetchPage(0, random ? pageSize : limit);
  if (!random && !descending) return first;
  final total = first['TotalRecordCount'] as int? ?? 0;
  if (!random) return total > limit ? fetchPage(total - limit, limit) : first;
  final lastStart = total - pageSize;
  return lastStart > 0
      ? fetchPage(Random().nextInt(lastStart + 1), pageSize)
      : first;
}


/// When each studio was last watched, by lower-case name, from the [limit]
/// most recently played movies and episodes in [parentId], or in every library.
/// An episode counts for its series' studio.
Future<Map<String, String>> fetchStudioLastPlayed(
  ItemsApi api, {
  String? parentId,
  int limit = 300,
}) async {
  final response = await api.getItems(
    parentId: parentId,
    recursive: true,
    includeItemTypes: const ['Movie', 'Episode'],
    sortBy: 'DatePlayed',
    sortOrder: 'Descending',
    limit: limit,
    fields: 'Studios,SeriesStudio,UserData',
  );
  final lastPlayed = <String, String>{};
  for (final item
      in (response['Items'] as List? ?? const [])
          .cast<Map<String, dynamic>>()) {
    final date = (item['UserData'] as Map?)?['LastPlayedDate'] as String?;
    if (date == null) continue;
    final names = [
      for (final studio in item['Studios'] as List? ?? const [])
        (studio as Map)['Name'],
      item['SeriesStudio'],
    ];
    for (final name in names.whereType<String>()) {
      lastPlayed.putIfAbsent(name.toLowerCase(), () => date);
    }
  }
  return lastPlayed;
}

/// Puts each studio's date from [lastPlayed] in its UserData, where
/// sortAggregatedItems reads it.
void markStudiosLastPlayed(
  Iterable<Map<String, dynamic>> studios,
  Map<String, String> lastPlayed,
) {
  for (final studio in studios) {
    final date = lastPlayed[(studio['Name'] as String? ?? '').toLowerCase()];
    if (date == null) continue;
    studio['UserData'] = {
      ...?studio['UserData'] as Map<String, dynamic>?,
      'LastPlayedDate': date,
    };
  }
}
