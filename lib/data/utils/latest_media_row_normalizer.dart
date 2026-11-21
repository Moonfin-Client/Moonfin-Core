import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

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
  bool hideWatched = false,
}) {
  if (_isTvCollectionType(collectionType) || hideWatched) {
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

int? _toNullableInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

bool isRawItemWatchedForRecentRow(Map<String, dynamic> rawData) {
  final userData = rawData['UserData'];
  if (userData is! Map) return false;
  if (userData['Played'] == true) return true;
  final type = rawData['Type']?.toString();
  final unplayedCount = _toNullableInt(userData['UnplayedItemCount']);
  final childCount = _toNullableInt(rawData['ChildCount']);
  if ((type == 'Series' || type == 'Season') &&
      unplayedCount != null &&
      unplayedCount <= 0 &&
      (childCount == null || childCount > 0)) {
    return true;
  }
  return false;
}

bool _isItemWatchedForRecentRow(AggregatedItem item) =>
    isRawItemWatchedForRecentRow(item.rawData);

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
      ? _collapseLatestTvItems(sourceItems).items
      : sourceItems;

  if (normalized.length <= limit) {
    return normalized;
  }

  return normalized.take(limit).toList();
}

/// Maximum number of series IDs sent in a single `getItems` hydration request.
const _seriesHydrationBatchSize = 100;

/// Default timeout for optional series hydration lookups.
const _defaultHydrationTimeout = Duration(seconds: 8);

/// Normalizes recent-row items and hydrates any [Series] cards that were
/// collapsed from [Episode] or [Season] items with the parent series's own
/// `UserData` (such as `UnplayedItemCount` and `Played`) and child counts.
///
/// Jellyfin 12's `/Items/Latest`, Emby's `/Items/Latest`, and Plex's
/// `/recentlyAdded` can return `Episode` items (no `UnplayedItemCount`) or
/// `Season` items (season-only `UnplayedItemCount`). Hydrating collapsed
/// cards from the parent `Series` ensures badges reflect the total unwatched
/// episodes for the show and prevents a watched episode/season from hiding a
/// show that still has unwatched episodes when [hideWatched] is enabled.
Future<List<AggregatedItem>> normalizeAndHydrateLatestMediaItems(
  List<AggregatedItem> items, {
  String? collectionType,
  required int limit,
  bool hideWatched = false,
  ItemsApi? itemsApi,
  Duration timeout = _defaultHydrationTimeout,
  Map<String, Map<String, dynamic>>? seriesCache,
  @visibleForTesting
  Future<List<Map<String, dynamic>>> Function(List<String> seriesIds)?
  fetchSeriesByIds,
}) async {
  final shouldCollapse =
      _isTvCollectionType(collectionType) ||
      (collectionType == null &&
          items.any((i) => i.type == 'Episode' || i.type == 'Season'));

  if (!shouldCollapse) {
    return normalizeLatestMediaItems(
      items,
      collectionType: collectionType,
      limit: limit,
      hideWatched: hideWatched,
    );
  }

  // Collapse before hideWatched so a watched episode/season can still be
  // evaluated against the full series's UserData after hydration.
  final collapsedResult = _collapseLatestTvItems(items);
  var collapsed = collapsedResult.items;
  final collapsedIds = collapsedResult.collapsedSeriesIds;

  if (!hideWatched && collapsed.length > limit) {
    collapsed = collapsed.take(limit).toList();
  }

  final idsToHydrate = <String>[
    for (final item in collapsed)
      if (collapsedIds.contains(item.id) &&
          !(seriesCache?.containsKey(item.id) ?? false))
        item.id,
  ];

  final hydratedIds = <String>{};
  final fetched = <Map<String, dynamic>>[];
  if (idsToHydrate.isNotEmpty &&
      timeout > Duration.zero &&
      (fetchSeriesByIds != null || itemsApi != null)) {
    final deadline = DateTime.now().add(timeout);
    for (var i = 0; i < idsToHydrate.length; i += _seriesHydrationBatchSize) {
      final remaining = deadline.difference(DateTime.now());
      if (remaining <= Duration.zero) break;
      final end = (i + _seriesHydrationBatchSize < idsToHydrate.length)
          ? i + _seriesHydrationBatchSize
          : idsToHydrate.length;
      final batch = idsToHydrate.sublist(i, end);
      try {
        final batchItems = await (fetchSeriesByIds != null
                ? fetchSeriesByIds(batch)
                : itemsApi!
                      .getItems(
                        ids: batch,
                        includeItemTypes: const ['Series'],
                        fields: 'UserData,ChildCount,RecursiveItemCount',
                        enableUserData: true,
                      )
                      .then(_extractItemsList))
            .timeout(remaining);
        fetched.addAll(batchItems);
      } catch (_) {
        // Keep successful batches and fall back to unhydrated cards for failed batches.
      }
    }
  }

  final seriesById = <String, Map<String, dynamic>>{
    ...?seriesCache,
    for (final series in fetched)
      if (series['Id'] != null) series['Id'].toString(): series,
  };
  if (seriesCache != null && fetched.isNotEmpty) {
    for (final series in fetched) {
      if (series['Id'] != null) {
        seriesCache[series['Id'].toString()] = series;
      }
    }
  }
  if (seriesById.isNotEmpty) {
    collapsed = [
      for (final item in collapsed)
        if (seriesById[item.id] case final series?
            when collapsedIds.contains(item.id))
          () {
            hydratedIds.add(item.id);
            return _mergeSeriesUserData(item, series);
          }()
        else
          item,
    ];
  }

  List<AggregatedItem> filtered;
  if (hideWatched) {
    final hasUnhydrated = collapsed.any(
      (item) =>
          collapsedIds.contains(item.id) && !hydratedIds.contains(item.id),
    );
    if (hasUnhydrated) {
      final fallback = normalizeLatestMediaItems(
        items,
        collectionType: collectionType,
        limit: items.length,
        hideWatched: true,
      );
      final fallbackById = {for (final item in fallback) item.id: item};
      final firstIndexBySeriesId = <String, int>{};
      final unwatchedIndexBySeriesId = <String, int>{};
      for (var i = 0; i < items.length; i++) {
        final raw = items[i];
        final key = (raw.type == 'Episode' || raw.type == 'Season')
            ? (raw.seriesId ?? raw.id)
            : raw.id;
        firstIndexBySeriesId.putIfAbsent(key, () => i);
        if (!_isItemWatchedForRecentRow(raw)) {
          unwatchedIndexBySeriesId.putIfAbsent(key, () => i);
        }
      }

      final ordered = <(int, AggregatedItem)>[];
      for (var i = 0; i < collapsed.length; i++) {
        final item = collapsed[i];
        if (collapsedIds.contains(item.id) && !hydratedIds.contains(item.id)) {
          final fb = fallbackById[item.id];
          if (fb != null) {
            ordered.add((
              unwatchedIndexBySeriesId[fb.id] ??
                  firstIndexBySeriesId[item.id] ??
                  i,
              fb,
            ));
          }
        } else if (!_isItemWatchedForRecentRow(item)) {
          ordered.add((firstIndexBySeriesId[item.id] ?? i, item));
        }
      }
      ordered.sort((a, b) => a.$1.compareTo(b.$1));
      filtered = [for (final entry in ordered) entry.$2];
    } else {
      filtered = [
        for (final item in collapsed)
          if (!_isItemWatchedForRecentRow(item)) item,
      ];
    }
  } else {
    filtered = collapsed;
  }

  if (filtered.length <= limit) {
    return filtered;
  }

  return filtered.take(limit).toList();
}

List<Map<String, dynamic>> _extractItemsList(Map<String, dynamic> response) {
  final raw = response['Items'];
  if (raw is! List) return const [];
  return [
    for (final entry in raw)
      if (entry is Map) Map<String, dynamic>.from(entry),
  ];
}

AggregatedItem _mergeSeriesUserData(
  AggregatedItem item,
  Map<String, dynamic>? series,
) {
  if (series == null) return item;
  final updatedRaw = Map<String, dynamic>.from(item.rawData);
  if (series['UserData'] is Map) {
    updatedRaw['UserData'] = Map<String, dynamic>.from(
      series['UserData'] as Map,
    );
  }
  if (series['ChildCount'] != null) {
    updatedRaw['ChildCount'] = series['ChildCount'];
  }
  if (series['RecursiveItemCount'] != null) {
    updatedRaw['RecursiveItemCount'] = series['RecursiveItemCount'];
  }
  return AggregatedItem(
    id: item.id,
    serverId: item.serverId,
    rawData: updatedRaw,
  );
}

({List<AggregatedItem> items, Set<String> collapsedSeriesIds})
_collapseLatestTvItems(List<AggregatedItem> items) {
  final collapsed = <AggregatedItem>[];
  final seenIds = <String>{};
  final collapsedSeriesIds = <String>{};

  for (final item in items) {
    final synthesized = item.type == 'Episode' || item.type == 'Season'
        ? _seriesCardForLatestTvItem(item)
        : null;
    final normalized = synthesized ?? item;
    if (seenIds.add(normalized.id)) {
      collapsed.add(normalized);
      if (synthesized != null) {
        collapsedSeriesIds.add(normalized.id);
      }
    }
  }

  return (items: collapsed, collapsedSeriesIds: collapsedSeriesIds);
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
  // The episode's or season's own ids would match a different title than the
  // series when copies are folded across servers.
  rawData.remove('ProviderIds');

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

  // The show's logo comes as the parent logo, so it only fits when the
  // parent is the series.
  final seriesLogoImageTag = item.parentLogoItemId == seriesId
      ? item.seriesLogoImageTag
      : null;
  if (seriesLogoImageTag != null && seriesLogoImageTag.isNotEmpty) {
    imageTags['Logo'] = seriesLogoImageTag;
  } else {
    imageTags.remove('Logo');
  }

  rawData['ImageTags'] = imageTags;

  return AggregatedItem(
    id: seriesId,
    serverId: item.serverId,
    rawData: rawData,
  );
}
