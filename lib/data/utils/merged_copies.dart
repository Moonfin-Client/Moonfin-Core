import 'dart:collection';

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

/// The server whose copy a merged card should be, and the other servers'
/// copies of its titles waiting for that card to come up.
class PreferredCopies {
  PreferredCopies(this.serverId, this.titles);

  final String serverId;

  /// The match keys of every title [serverId] holds.
  final Set<String> titles;

  final _waiting = <String, List<AggregatedItem>>{};

  /// Holds [item] back when the preferred server has its title, so the card
  /// shows that server's name and sits where that server sorts it.
  bool _wait(AggregatedItem item, Set<String> keys) {
    if (item.serverId == serverId || !keys.any(titles.contains)) return false;
    for (final key in keys) {
      (_waiting[key] ??= []).add(item);
    }
    return true;
  }

  Set<AggregatedItem> _take(Set<String> keys) {
    final taken = {for (final key in keys) ...?_waiting.remove(key)};
    for (final item in taken) {
      for (final key in titleMatchKeys(item)) {
        _waiting[key]?.remove(item);
      }
    }
    return taken;
  }

  /// Every copy still waiting, once the list has run out without the
  /// preferred server's copy turning up.
  List<AggregatedItem> takeAllWaiting() {
    final all = {for (final items in _waiting.values) ...items};
    _waiting.clear();
    return all.toList();
  }
}

/// Folds each item that shares a match key with an earlier one into it, as
/// one of its copies. [holders] carries the titles already shown from one
/// call to the next, so a later page folds into an earlier page's card. With
/// [preferred], another server's copy of a title the preferred server holds
/// waits to join that server's card instead of becoming the card.
List<AggregatedItem> foldCopies(
  Iterable<AggregatedItem> items, [
  Map<String, AggregatedItem>? holders,
  PreferredCopies? preferred,
]) {
  holders ??= {};
  final kept = <AggregatedItem>[];
  for (final item in items) {
    final keys = titleMatchKeys(item);
    // The card already holding this copy, as a light one from the index,
    // comes first, so the full one replaces it rather than landing elsewhere.
    final holder =
        holders[_ownerKey(item)] ??
        keys.map((key) => holders![key]).nonNulls.firstOrNull;
    if (holder != null) {
      _join(holder, item, keys, holders);
      continue;
    }
    if (preferred != null && preferred._wait(item, keys)) continue;
    kept.add(item);
    if (keys.isEmpty) continue;
    // Made up front so a refreshed card, which copies the map, still shares
    // the list later copies are added to.
    item.rawData.putIfAbsent(_copiesKey, () => []);
    holders[_ownerKey(item)] = item;
    for (final key in keys) {
      holders[key] = item;
    }
    for (final copy in preferred?._take(keys) ?? const <AggregatedItem>{}) {
      _join(item, copy, titleMatchKeys(copy), holders);
    }
  }
  return kept;
}

/// Marks a copy the index gave a card, which holds ids only.
const _lightCopyKey = 'MergedLightCopy';

String _copyKey(AggregatedItem copy) => '${copy.serverId}|${copy.id}';

/// Where [holders] keeps the card a copy sits on, beside the title keys. A
/// title key can lead to another card than the one holding the copy, when a
/// copy's ids bridge two cards.
String _ownerKey(AggregatedItem copy) => 'copy:${_copyKey(copy)}';

Map<String, int> _storedCopies(AggregatedItem holder) {
  final copies = holder.rawData[_copiesKey] as List? ?? const [];
  return {
    for (var i = 0; i < copies.length; i++)
      if (copies[i] case {
        'serverId': final String serverId,
        'item': final Map raw,
      })
        '$serverId|${raw['Id']?.toString() ?? ''}': i,
  };
}

// A copy already on the card is never added twice, but the full copy paging
// folds in takes the place of the light one the index gave the card first.
void _join(
  AggregatedItem holder,
  AggregatedItem item,
  Set<String> keys,
  Map<String, AggregatedItem> holders,
) {
  final copies = holder.rawData[_copiesKey] as List;
  final holderKey = _copyKey(holder);
  final stored = _storedCopies(holder);
  for (final copy in copiesOf(item)) {
    final key = _copyKey(copy);
    if (key == holderKey) continue;
    final entry = {
      'serverId': copy.serverId,
      'item': {...copy.rawData}..remove(_copiesKey),
    };
    if (stored[key] case final at?) {
      final storedIsLight = (copies[at] as Map)['item']?[_lightCopyKey] == true;
      if (storedIsLight && copy.rawData[_lightCopyKey] != true) {
        copies[at] = entry;
      }
    } else {
      stored[key] = copies.length;
      copies.add(entry);
    }
    holders[_ownerKey(copy)] = holder;
  }
  for (final key in keys) {
    holders.putIfAbsent(key, () => holder);
  }
}

/// The titles more than one item holds, by match key. Two servers can name a
/// title in different languages and so sort it far apart, so a card can't
/// count on paging to bring its copies in.
Map<String, List<AggregatedItem>> indexCopies(Iterable<AggregatedItem> items) {
  final index = <String, List<AggregatedItem>>{};
  for (final item in items) {
    for (final key in titleMatchKeys(item)) {
      (index[key] ??= []).add(item);
    }
  }
  index.removeWhere((_, holding) => holding.map(_copyKey).toSet().length < 2);
  return index;
}

/// Adds to [card] the copies of its title in [index] that [skip] lets through,
/// except one another card already holds, so a copy whose ids lead to two
/// cards sits on just one. Returns whether the card took on a copy.
bool joinIndexedCopies(
  AggregatedItem card,
  Map<String, List<AggregatedItem>> index,
  Map<String, AggregatedItem> holders,
  bool Function(AggregatedItem copy) skip,
) {
  if (index.isEmpty) return false;
  card.rawData.putIfAbsent(_copiesKey, () => []);
  // Every copy's ids, not just the card's: the index leaves out an id only one
  // item holds, and a copy already on the card can carry one that leads on.
  final pending = Queue.of([
    for (final copy in copiesOf(card)) ...titleMatchKeys(copy),
  ]);
  final visited = <String>{};
  final taken = <String>{};
  final found = <(AggregatedItem, Set<String>)>[];
  while (pending.isNotEmpty) {
    final key = pending.removeFirst();
    if (!visited.add(key)) continue;
    for (final copy in index[key] ?? const <AggregatedItem>[]) {
      final copyKeys = titleMatchKeys(copy);
      pending.addAll(copyKeys);
      // Already on this card or another one.
      if (holders.containsKey(_ownerKey(copy)) || skip(copy)) continue;
      if (!taken.add(_copyKey(copy))) continue;
      found.add((copy, copyKeys));
    }
  }
  for (final (copy, copyKeys) in found) {
    _join(
      card,
      AggregatedItem(
        id: copy.id,
        serverId: copy.serverId,
        rawData: {...copy.rawData, _lightCopyKey: true},
      ),
      copyKeys,
      holders,
    );
  }
  return found.isNotEmpty;
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
