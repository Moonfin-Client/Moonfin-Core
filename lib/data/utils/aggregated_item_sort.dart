import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';

/// Sorts items the way the server would for [sortBy] and [sortOrder].
List<AggregatedItem> sortAggregatedItems(
  List<AggregatedItem> items, {
  required String sortBy,
  required String sortOrder,
}) {
  final sorted = List<AggregatedItem>.of(items);
  // Rows pass the full sort value, like 'DateCreated,SortName'.
  final primarySortBy = sortBy.split(',').first;
  if (primarySortBy == 'Random') {
    sorted.shuffle();
    return sorted;
  }

  // Items without a value count as the lowest, the way the server sorts
  // them: first when the oldest or lowest come first, last when the newest
  // or highest do. Ties fall back to the name, like the server's SortName
  // tie-break.
  final descending = sortOrder.toLowerCase() == 'descending';

  // SortName drops leading articles, so "The Asylum" sorts under A.
  String sortName(AggregatedItem item) =>
      (item.rawData['SortName'] as String? ?? item.name).toLowerCase();

  int compareByName(AggregatedItem a, AggregatedItem b) {
    final byName = sortName(a).compareTo(sortName(b));
    return descending ? -byName : byName;
  }

  int compareByKey(AggregatedItem a, AggregatedItem b) {
    switch (primarySortBy) {
      case 'DateCreated':
        return _compareNullableDate(
          parseServerDate(a.rawData['DateCreated']),
          parseServerDate(b.rawData['DateCreated']),
          descending: descending,
        );
      case 'PremiereDate':
        return _compareNullableDate(
          a.premiereDate,
          b.premiereDate,
          descending: descending,
        );
      case 'CommunityRating':
        return _compareNullableNum(
          a.communityRating,
          b.communityRating,
          descending: descending,
        );
      case 'CriticRating':
        return _compareNullableNum(
          a.criticRating?.toDouble(),
          b.criticRating?.toDouble(),
          descending: descending,
        );
      case 'Runtime':
      case 'RunTimeTicks':
        return _compareNullableNum(
          a.runTimeTicks?.toDouble(),
          b.runTimeTicks?.toDouble(),
          descending: descending,
        );
      case 'ProductionYear':
        return _compareNullableNum(
          a.productionYear?.toDouble(),
          b.productionYear?.toDouble(),
          descending: descending,
        );
      default:
        return 0;
    }
  }

  sorted.sort((a, b) {
    final byKey = compareByKey(a, b);
    return byKey != 0 ? byKey : compareByName(a, b);
  });
  return sorted;
}

int _compareNullableDate(DateTime? a, DateTime? b, {bool descending = false}) {
  if (a == null && b == null) return 0;
  final ascending = a == null ? -1 : (b == null ? 1 : a.compareTo(b));
  return descending ? -ascending : ascending;
}

int _compareNullableNum(double? a, double? b, {bool descending = false}) {
  if (a == null && b == null) return 0;
  final ascending = a == null ? -1 : (b == null ? 1 : a.compareTo(b));
  return descending ? -ascending : ascending;
}
