import 'package:server_core/server_core.dart';

import '../../util/accent_folding.dart';
import '../models/aggregated_item.dart';
import '../models/aggregated_library.dart';

const _mergedLibraryIdPrefix = 'merged-';

/// The library that stands for every server's libraries of [collectionType].
String mergedLibraryId(String collectionType) =>
    '$_mergedLibraryIdPrefix$collectionType';

/// The collection type [libraryId] merges, or null for a server's own library.
String? mergedLibraryType(String libraryId) =>
    libraryId.startsWith(_mergedLibraryIdPrefix)
    ? libraryId.substring(_mergedLibraryIdPrefix.length)
    : null;

/// Puts every server's movie libraries behind one library and their show
/// libraries behind another, for each type at least two servers hold. The
/// merged library takes the first one's place and artwork.
List<AggregatedLibrary> mergeLibrariesByType(
  List<AggregatedLibrary> libraries, {
  required String Function(String collectionType) nameOf,
}) {
  final merged = [...libraries];
  for (final type in const ['movies', 'tvshows']) {
    final members = [
      for (final library in merged)
        if (library.collectionType == type) library,
    ];
    if (members.map((library) => library.serverId).toSet().length < 2) {
      continue;
    }
    final first = members.first;
    merged[merged.indexOf(first)] = AggregatedLibrary(
      id: mergedLibraryId(type),
      name: nameOf(type),
      collectionType: type,
      serverId: first.serverId,
      imageItemId: first.id,
      primaryImageAspectRatio: first.primaryImageAspectRatio,
      imageTags: first.imageTags,
      backdropImageTags: first.backdropImageTags,
    );
    merged.removeWhere(members.skip(1).contains);
  }
  return merged;
}

/// Where a title several servers hold keeps its other copies, as plain maps
/// so the item still round trips through the Home row cache.
const _copiesKey = 'MergedCopies';

/// The ids that say two servers hold the same title. Placeholder ids some
/// metadata leaves behind don't count, so a title without a real one never
/// folds.
Set<String> titleMatchKeys(AggregatedItem item) {
  final keys = <String>{};
  item.providerIds.forEach((provider, value) {
    final name = provider.toLowerCase();
    final id = value.trim().toLowerCase();
    final number = switch (name) {
      'tmdb' || 'tvdb' => int.tryParse(id),
      'imdb' when id.startsWith('tt') => int.tryParse(id.substring(2)),
      _ => null,
    };
    if (number != null && number > 0) keys.add('${item.type}:$name:$id');
  });
  return keys;
}

/// Every copy of [item], itself first.
List<AggregatedItem> copiesOf(AggregatedItem item) => [
  item,
  for (final copy in item.rawData[_copiesKey] as List? ?? const [])
    if (copy case {'serverId': final String serverId, 'item': final Map raw})
      AggregatedItem(
        id: raw['Id']?.toString() ?? '',
        serverId: serverId,
        rawData: raw.cast<String, dynamic>(),
      ),
];

/// How many different servers hold [item].
int serverCountOf(AggregatedItem item) =>
    copiesOf(item).map((copy) => copy.serverId).toSet().length;

/// Folds each item that shares a match key with an earlier one into it, as
/// one of its copies. [holders] carries the titles already shown from one
/// call to the next, so a later page folds into an earlier page's card.
List<AggregatedItem> foldCopies(
  Iterable<AggregatedItem> items, [
  Map<String, AggregatedItem>? holders,
]) {
  holders ??= {};
  final kept = <AggregatedItem>[];
  for (final item in items) {
    final keys = titleMatchKeys(item);
    final holder = keys.map((key) => holders![key]).nonNulls.firstOrNull;
    if (holder == null) {
      kept.add(item);
      if (keys.isEmpty) continue;
      // Made up front so a refreshed card, which copies the map, still shares
      // the list later copies are added to.
      item.rawData.putIfAbsent(_copiesKey, () => []);
      for (final key in keys) {
        holders[key] = item;
      }
      continue;
    }
    final copies = holder.rawData[_copiesKey] as List;
    for (final copy in copiesOf(item)) {
      copies.add({
        'serverId': copy.serverId,
        'item': {...copy.rawData}..remove(_copiesKey),
      });
    }
    for (final key in keys) {
      holders.putIfAbsent(key, () => holder);
    }
  }
  return kept;
}

/// Orders items the way a server does for [sortBy], its comma separated sort
/// fields, so pages from several servers can be merged into one list. Null
/// for a random order, which has nothing to merge on.
int Function(AggregatedItem, AggregatedItem)? mergedSortComparator(
  String sortBy, {
  required bool descending,
}) {
  final fields = sortBy.split(',').map((field) => field.trim()).toList();
  if (fields.contains('Random')) return null;
  return (a, b) {
    for (final field in fields) {
      final order = _compareNullable(
        _sortValue(a, field),
        _sortValue(b, field),
      );
      if (order != 0) return descending ? -order : order;
    }
    return 0;
  };
}

Comparable<Object>? _sortValue(AggregatedItem item, String field) =>
    switch (field) {
      // Folded so "Été" sorts with the E's, as each server lists it.
      'SortName' => foldForSearch(item.sortName ?? item.name),
      'Name' => foldForSearch(item.name),
      'DateCreated' => item.dateCreated,
      // Servers sort on this name but send the date as DateLastMediaAdded.
      'DateLastContentAdded' => parseServerDate(
        item.rawData['DateLastMediaAdded'],
      ),
      'PremiereDate' => item.premiereDate,
      'ProductionYear' => item.productionYear,
      'OfficialRating' => item.officialRating,
      'Runtime' => item.runTimeTicks,
      'CriticRating' => item.criticRating,
      'CommunityRating' => item.communityRating,
      'DatePlayed' => item.lastPlayedDate,
      'PlayCount' => (item.rawData['UserData'] as Map?)?['PlayCount'] as num?,
      _ => null,
    } as Comparable<Object>?;

// A missing value sorts first, the way the servers order a null.
int _compareNullable(Comparable<Object>? a, Comparable<Object>? b) {
  if (a == null) return b == null ? 0 : -1;
  if (b == null) return 1;
  return a.compareTo(b);
}
