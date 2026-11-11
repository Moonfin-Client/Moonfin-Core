import '../../l10n/app_localizations.dart';
import '../../preference/preference_constants.dart';
import '../models/aggregated_item.dart';

/// A server names a TV library 'tvshows' or 'shows', so both count.
bool _isTvCollectionType(String? collectionType) {
  final normalized = collectionType?.toLowerCase();
  return normalized == 'tvshows' || normalized == 'shows';
}

int latestMediaFetchLimitForCollection(
  String? collectionType, {
  required int defaultLimit,
  required int maxLimit,
}) {
  if (_isTvCollectionType(collectionType)) {
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

bool isRawItemWatchedForRecentRow(Map<String, dynamic> rawData) {
  final userData = rawData['UserData'];
  if (userData is! Map) return false;
  if (userData['Played'] == true) return true;
  final type = rawData['Type']?.toString();
  final unplayedCount = (userData['UnplayedItemCount'] as num?)?.toInt();
  final childCount = (rawData['ChildCount'] as num?)?.toInt();
  if ((type == 'Series' || type == 'Season') &&
      unplayedCount != null &&
      unplayedCount <= 0 &&
      (childCount == null || childCount > 0)) {
    return true;
  }
  return false;
}

bool _isItemWatchedForRecentRow(AggregatedItem item) {
  if (item.isPlayed) return true;
  if ((item.type == 'Series' || item.type == 'Season') &&
      item.unplayedItemCount != null &&
      item.unplayedItemCount! <= 0 &&
      (item.childCount == null || item.childCount! > 0)) {
    return true;
  }
  return isRawItemWatchedForRecentRow(item.rawData);
}

List<AggregatedItem> normalizeLatestMediaItems(
  List<AggregatedItem> items, {
  String? collectionType,
  required int limit,
  bool hideWatched = false,
}) {
  final sourceItems = hideWatched
      ? items.where((item) => !_isItemWatchedForRecentRow(item)).toList()
      : items;

  // Paging asks without a collection type, so a row that opened with series
  // cards would start handing back seasons part way along.
  final shouldCollapse =
      _isTvCollectionType(collectionType) ||
      (collectionType == null &&
          sourceItems.any((i) => i.type == 'Episode' || i.type == 'Season'));

  final normalized = shouldCollapse
      ? _collapseLatestTvItems(sourceItems)
      : sourceItems;

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

  // A season's parent is the series so its tag fits the id set below, but an
  // episode's parent is the season and that tag would not match the series.
  final seriesPrimaryImageTag =
      item.seriesPrimaryImageTag ??
      (item.type == 'Season' ? item.parentPrimaryImageTag : null);
  // The parent tag only fits the id below when the parent really is the
  // series. An episode whose season has a thumb of its own would otherwise
  // stamp the season's tag onto the series card, the mismatch the primary
  // tag above already guards against.
  final seriesThumbImageTag = item.parentThumbItemId == seriesId
      ? item.parentThumbImageTag
      : null;

  // A tag the episode or season brought along points at one scene, so the card
  // drops it rather than letting it stand in for the show.
  if (item.parentBackdropItemId == seriesId &&
      item.parentBackdropImageTags.isNotEmpty) {
    rawData['BackdropImageTags'] = List<String>.from(
      item.parentBackdropImageTags,
    );
  } else {
    rawData.remove('BackdropImageTags');
  }

  final imageTags = Map<String, dynamic>.from(
    rawData['ImageTags'] as Map? ?? const {},
  );
  if (seriesPrimaryImageTag != null && seriesPrimaryImageTag.isNotEmpty) {
    imageTags['Primary'] = seriesPrimaryImageTag;
    rawData['PrimaryImageTag'] = seriesPrimaryImageTag;
  } else {
    imageTags.remove('Primary');
    rawData.remove('PrimaryImageTag');
  }
  rawData['PrimaryImageItemId'] = seriesId;

  if (seriesThumbImageTag != null && seriesThumbImageTag.isNotEmpty) {
    imageTags['Thumb'] = seriesThumbImageTag;
  } else {
    imageTags.remove('Thumb');
  }

  rawData['ImageTags'] = imageTags;

  return AggregatedItem(
    id: seriesId,
    serverId: item.serverId,
    rawData: rawData,
  );
}
