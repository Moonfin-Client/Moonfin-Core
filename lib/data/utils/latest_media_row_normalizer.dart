import '../../l10n/app_localizations.dart';
import '../../preference/preference_constants.dart';
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

/// The item types a Recently Released row asks a library for.
///
/// Asking by type is what lets the query recurse and reach a title the server
/// left sitting inside a folder of its own. A library that reports no type, or
/// one nothing here covers, gets null, and the caller then leaves recursion off
/// so the row keeps to the titles sitting directly in the library.
///
/// [seriesType] is only called for a TV library, so nothing else has to have
/// the setting to hand.
List<String>? recentlyReleasedItemTypesFor(
  String? collectionType, {
  required RecentlyReleasedSeriesType Function() seriesType,
}) => switch (collectionType?.toLowerCase()) {
  'tvshows' || 'shows' => switch (seriesType()) {
    RecentlyReleasedSeriesType.series => const ['Series'],
    RecentlyReleasedSeriesType.season => const ['Season'],
    RecentlyReleasedSeriesType.episode => const ['Episode'],
  },
  'movies' => const ['Movie'],
  'music' => const ['MusicAlbum'],
  // A books library holds both kinds.
  'books' => const ['Book', 'AudioBook'],
  'audiobooks' => const ['AudioBook', 'Audio'],
  _ => null,
};

/// Marks a row stitched together from several libraries of one kind. Such a row
/// has no single parent library, so nothing can ask the server for more of it.
const mergedTypeRowIdPrefix = 'mergedtype_';

bool isMergedTypeRowId(String rowId) => rowId.startsWith(mergedTypeRowIdPrefix);

/// Names the kind of media a merged row holds, standing in for the library
/// names it replaced.
String genericDescriptorForCollectionType(
  AppLocalizations l10n,
  String? collectionType,
) {
  return switch (collectionType?.toLowerCase()) {
    'movies' => l10n.movies,
    'tvshows' || 'shows' => l10n.tvShows,
    'music' => l10n.music,
    'books' => l10n.books,
    'audiobooks' => l10n.audiobooks,
    'musicvideos' => l10n.musicVideos,
    'homevideos' || 'photos' => l10n.homeVideos,
    _ => l10n.library,
  };
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
