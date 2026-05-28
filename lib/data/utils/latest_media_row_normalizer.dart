import '../models/aggregated_item.dart';

int latestMediaFetchLimitForCollection(
  String? collectionType, {
  required int defaultLimit,
  required int maxLimit,
}) {
  final normalizedType = collectionType?.toLowerCase();
  if (normalizedType == 'tvshows') {
    final expandedLimit = defaultLimit * 4;
    if (expandedLimit > maxLimit) {
      return maxLimit;
    }
    return expandedLimit;
  }

  return defaultLimit;
}

List<AggregatedItem> normalizeLatestMediaItems(
  List<AggregatedItem> items, {
  String? collectionType,
  required int limit,
}) {
  final normalizedType = collectionType?.toLowerCase();
  final normalized = switch (normalizedType) {
    'tvshows' => _collapseLatestTvItems(items),
    _ => items,
  };

  if (normalized.length <= limit) {
    return normalized;
  }

  return normalized.take(limit).toList();
}

List<AggregatedItem> _collapseLatestTvItems(List<AggregatedItem> items) {
  final collapsed = <AggregatedItem>[];
  final seenIds = <String>{};

  for (final item in items) {
    final normalized = _seriesCardForLatestTvItem(item) ?? item;
    if (seenIds.add(normalized.id)) {
      collapsed.add(normalized);
    }
  }

  return collapsed;
}

AggregatedItem? _seriesCardForLatestTvItem(AggregatedItem item) {
  if (item.type == 'Series') {
    return item;
  }

  if (item.type != 'Episode' && item.type != 'Season') {
    return null;
  }

  final seriesId = item.seriesId;
  final seriesName = item.seriesName?.trim();
  if (seriesId == null || seriesName == null || seriesName.isEmpty) {
    return null;
  }

  final rawData = Map<String, dynamic>.from(item.rawData);
  rawData['Id'] = seriesId;
  rawData['Type'] = 'Series';
  rawData['Name'] = seriesName;
  rawData.remove('IndexNumber');
  rawData.remove('ParentIndexNumber');

  if (item.type == 'Episode') {
    rawData['LatestEpisodeId'] = item.id;
    rawData['LatestEpisodePrimaryImageTag'] =
        item.primaryImageTag ?? item.primaryImageTagField;
  }

  final seriesPrimaryImageTag = item.seriesPrimaryImageTag;
  if (seriesPrimaryImageTag != null && seriesPrimaryImageTag.isNotEmpty) {
    final imageTags = Map<String, dynamic>.from(
      rawData['ImageTags'] as Map? ?? const {},
    );
    imageTags['Primary'] ??= seriesPrimaryImageTag;
    rawData['ImageTags'] = imageTags;
    rawData['PrimaryImageTag'] ??= seriesPrimaryImageTag;
    rawData['PrimaryImageItemId'] ??= seriesId;
  }

  return AggregatedItem(
    id: seriesId,
    serverId: item.serverId,
    rawData: rawData,
  );
}
