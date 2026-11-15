import 'dart:math';

import 'package:server_core/server_core.dart';

import 'bounded_concurrency.dart';

/// The sort a studio row with nothing picked can apply. Jellyfin's /Studios
/// only lists by name, so name and random are the orders a page can give; any
/// other order would need every studio, so it reads as name, as the setting
/// shows it.
(String sortBy, String sortOrder) unpickedStudioSort(
  String sortBy,
  String sortOrder,
) => const ['SortName', 'Random'].contains(sortBy.split(',').first)
    ? (sortBy, sortOrder)
    : ('SortName', sortOrder);

/// Gives each studio without counts the number of movies and series it holds,
/// from a one-item query of its own. Jellyfin before 12 only sends a studio's
/// counts when the list is filtered by type, which would drop studios.
Future<void> countStudios(
  ItemsApi api,
  Iterable<Map<String, dynamic>> studios,
) async {
  final uncounted = studios
      .where((s) => s['MovieCount'] == null && s['SeriesCount'] == null)
      .toList();
  await mapBounded(uncounted, 6, (studio) async {
    final result = await api.getItems(
      studios: [studio['Name'] as String? ?? ''],
      includeItemTypes: const ['Movie', 'Series'],
      recursive: true,
      limit: 1,
    );
    studio['ChildCount'] = result['TotalRecordCount'];
    return null;
  });
}

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
