import 'dart:math';

import 'package:clock/clock.dart';
import 'package:server_core/server_core.dart';

/// Reads the studios a row sorted by [sortBy] and [sortOrder] is drawn from.
///
/// A server that [serverSorts] gets the sort, and its first page is the row.
/// Otherwise name and random read at most two pages by name. Item count and
/// last played, which no server sorts studios by, and date added read every
/// page for the caller to rank, kept for a day per [cacheKey] since Home
/// reloads often.
Future<Map<String, dynamic>> fetchStudioRowPage(
  Future<Map<String, dynamic>> Function(
    int startIndex,
    int limit,
    String sortBy,
    String sortOrder,
  )
  fetchPage, {
  required String sortBy,
  required String sortOrder,
  required int limit,
  required int pageSize,
  required bool serverSorts,
  required String cacheKey,
}) async {
  final rankedInApp =
      sortBy == 'ItemCount' || sortBy.startsWith('DatePlayed');
  if (serverSorts && !rankedInApp) {
    return fetchPage(0, limit, sortBy, sortOrder);
  }
  Future<Map<String, dynamic>> byName(int startIndex, int limit) =>
      fetchPage(startIndex, limit, 'SortName', 'Ascending');
  final primary = sortBy.split(',').first;
  if (const ['ItemCount', 'DateCreated', 'DatePlayed'].contains(primary)) {
    return _readAllStudios(byName, pageSize, cacheKey);
  }
  final nameSort = primary == 'SortName';
  final descending = sortOrder.toLowerCase() == 'descending';
  if (nameSort && !descending) return byName(0, limit);
  final first = await byName(0, pageSize);
  final lastStart = (first['TotalRecordCount'] as int? ?? 0) - pageSize;
  if (lastStart <= 0) return first;
  if (sortBy == 'Random') {
    return byName(Random().nextInt(lastStart + 1), pageSize);
  }
  return nameSort ? byName(lastStart, pageSize) : first;
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

final _studioLists = <String, (DateTime, Map<String, dynamic>)>{};

Future<Map<String, dynamic>> _readAllStudios(
  Future<Map<String, dynamic>> Function(int startIndex, int limit) byName,
  int pageSize,
  String cacheKey,
) async {
  final cached = _studioLists[cacheKey];
  if (cached != null &&
      clock.now().difference(cached.$1) < const Duration(days: 1)) {
    return cached.$2;
  }
  final items = <dynamic>[];
  while (true) {
    final page = await byName(items.length, pageSize);
    final pageItems = page['Items'] as List? ?? const [];
    items.addAll(pageItems);
    final total = page['TotalRecordCount'] as int?;
    if (pageItems.length < pageSize || (total != null && items.length >= total)) {
      break;
    }
  }
  final all = {'Items': items, 'TotalRecordCount': items.length};
  _studioLists[cacheKey] = (clock.now(), all);
  return all;
}
