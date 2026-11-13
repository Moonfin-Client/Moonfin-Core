import 'dart:math';

import 'package:server_core/server_core.dart';

import '../../util/accent_folding.dart';
import '../models/aggregated_item.dart';

/// The two libraries that merge across servers.
enum UnifiedLibraryKind {
  movies('movies', 'Movie'),
  series('tvshows', 'Series');

  const UnifiedLibraryKind(this.collectionType, this.itemType);

  final String collectionType;

  final String itemType;

  static UnifiedLibraryKind? fromName(String? name) {
    for (final kind in values) {
      if (kind.name == name) return kind;
    }
    return null;
  }

  static UnifiedLibraryKind? fromItemType(String? itemType) {
    for (final kind in values) {
      if (kind.itemType == itemType) return kind;
    }
    return null;
  }

  static UnifiedLibraryKind? fromCollectionType(String? collectionType) {
    final type = collectionType?.toLowerCase();
    for (final kind in values) {
      if (kind.collectionType == type) return kind;
    }
    return null;
  }
}

bool supportsUnifiedLibraries(ServerType type) =>
    type == ServerType.jellyfin || type == ServerType.emby;

const unifiedServerIdKey = 'UnifiedServerId';

const unifiedKindKey = 'UnifiedKind';

/// Raw-item key listing every copy of the title, the shown one included.
// The value keeps its first name: the home row cache writes it to disk.
const unifiedCopiesKey = 'UnifiedVersions';

/// Raw-item key for the genres of every copy of a title held more than once.
const unifiedGenresKey = 'UnifiedGenres';

/// Marks a genre tile that opens the genre merged across servers.
const unifiedGenreTileKey = 'UnifiedGenre';

/// Genres with the same key are one genre. Accents are kept: folding them
/// would start to guess at translations.
String genreNameKey(String name) => name.trim().toLowerCase();

/// The genres any copy of the title in [rawData] carries.
List<String> unifiedGenresOf(Map<String, dynamic> rawData) =>
    _stringList(rawData[unifiedGenresKey] ?? rawData['Genres']);

/// One genre of a merged library, with the titles in it.
typedef UnifiedGenre = ({String name, List<Map<String, dynamic>> items});

/// The genres of [items], same names folded into one and sorted by name.
/// [spellings] says how a genre is written, by [genreNameKey].
List<UnifiedGenre> catalogGenres(
  Iterable<Map<String, dynamic>> items, {
  Map<String, String> spellings = const {},
}) {
  final byKey = <String, UnifiedGenre>{};
  for (final item in items) {
    final seen = <String>{};
    for (final genre in unifiedGenresOf(item)) {
      final key = genreNameKey(genre);
      if (key.isEmpty || !seen.add(key)) continue;
      byKey
          .putIfAbsent(
            key,
            () => (name: spellings[key] ?? genre.trim(), items: []),
          )
          .items
          .add(item);
    }
  }
  return byKey.values.toList()..sort(
    (a, b) => genreNameKey(a.name).compareTo(genreNameKey(b.name)),
  );
}

/// One movie or series as one server lists it.
class UnifiedCatalogEntry {
  final String serverId;
  final String itemId;

  /// `Movie` or `Series`.
  final String itemType;
  final Map<String, dynamic> raw;

  UnifiedCatalogEntry({
    required this.serverId,
    required this.itemId,
    required this.itemType,
    required this.raw,
  });

  late final List<String> matchKeys = catalogMatchKeys(itemType, raw);

  UnifiedCatalogEntry withUserData(Map<String, dynamic> userData) =>
      UnifiedCatalogEntry(
        serverId: serverId,
        itemId: itemId,
        itemType: itemType,
        raw: {...raw, 'UserData': userData},
      );
}

typedef UnifiedCopyRef = ({String serverId, String itemId});

/// Identifies one copy; two servers can hand out the same item id.
String unifiedCopyKey(String serverId, String itemId) => '$serverId|$itemId';

/// One copy of a title. A server can hold several (a 4K and an HD library).
class UnifiedCopy {
  final String serverId;
  final String itemId;
  final String serverName;

  /// The copy's title on its server. When one server holds two copies, the
  /// title is the only thing that tells them apart.
  final String? name;
  final String? originalTitle;

  /// This copy's own rating; servers don't always agree on one.
  final String? officialRating;
  final bool played;
  final int positionTicks;
  final double? playedPercentage;
  final bool reachable;

  const UnifiedCopy({
    required this.serverId,
    required this.itemId,
    required this.serverName,
    required this.played,
    required this.positionTicks,
    required this.playedPercentage,
    required this.reachable,
    this.name,
    this.originalTitle,
    this.officialRating,
  });

  String get key => unifiedCopyKey(serverId, itemId);

  Map<String, dynamic> toJson() => {
    'ServerId': serverId,
    'ItemId': itemId,
    'ServerName': serverName,
    'Name': ?name,
    'OriginalTitle': ?originalTitle,
    'OfficialRating': ?officialRating,
    'Played': played,
    'PlaybackPositionTicks': positionTicks,
    'PlayedPercentage': ?playedPercentage,
    'Reachable': reachable,
  };

  factory UnifiedCopy.fromJson(Map<dynamic, dynamic> json) => UnifiedCopy(
    serverId: json['ServerId']?.toString() ?? '',
    itemId: json['ItemId']?.toString() ?? '',
    serverName: json['ServerName']?.toString() ?? '',
    played: json['Played'] == true,
    positionTicks: _int(json['PlaybackPositionTicks']) ?? 0,
    playedPercentage: _double(json['PlayedPercentage']),
    reachable: json['Reachable'] != false,
    name: json['Name']?.toString(),
    originalTitle: json['OriginalTitle']?.toString(),
    officialRating: json['OfficialRating']?.toString(),
  );
}

/// The copies of the title in [rawData]; empty outside a merged library.
List<UnifiedCopy> unifiedCopiesOf(Map<String, dynamic> rawData) => [
  for (final copy in _list(rawData[unifiedCopiesKey]))
    if (copy is Map) UnifiedCopy.fromJson(copy),
];

/// Equal for two cards that show the same copy with the same copies behind it.
String unifiedCardKey(AggregatedItem item) => [
  item.serverId,
  item.id,
  for (final copy in unifiedCopiesOf(item.rawData)) copy.key,
].join('|');

/// Every name the title in [rawData] goes by on any copy, folded for search.
String unifiedSearchText(Map<String, dynamic> rawData) => {
  for (final name in [
    rawData['SortName'] ?? rawData['Name'],
    rawData['OriginalTitle'],
    for (final copy in unifiedCopiesOf(rawData)) ...[
      copy.name,
      copy.originalTitle,
    ],
  ])
    if (name != null) foldForSearch(name.toString()),
}.join('\n');

/// The external ids [raw] is known by, as `movie:tmdb:1003`; title and year
/// alone are never a key. Placeholder ids (`0`, `tt0000000`) are dropped, or
/// unmatched titles would fold into one card.
List<String> catalogMatchKeys(String itemType, Map<String, dynamic> raw) {
  final ids = raw['ProviderIds'];
  if (ids is! Map) return const [];
  // Emby and Jellyfin don't agree on the casing of these keys.
  final byProvider = <String, Object?>{
    for (final entry in ids.entries)
      entry.key.toString().trim().toLowerCase(): entry.value,
  };
  return [
    for (final provider in const ['tmdb', 'imdb', 'tvdb'])
      if (_providerId(provider, byProvider[provider]) case final id?)
        '${itemType.toLowerCase()}:$provider:$id',
  ];
}

String? _providerId(String provider, Object? value) {
  final id = value?.toString().trim().toLowerCase() ?? '';
  if (id.isEmpty) return null;
  if (provider == 'imdb') {
    final digits = id.startsWith('tt') ? id.substring(2) : id;
    return digits.replaceAll('0', '').isEmpty ? null : id;
  }
  // TMDB and TVDB number their titles from one.
  final number = int.tryParse(id);
  return number == null || number <= 0 ? null : '$number';
}

/// The filters and sort order of one listing of a merged library.
class UnifiedCatalogQuery {
  /// A comma-joined list of item types that only feeds [signature].
  final String itemTypes;
  final String sortBy;
  final bool descending;
  final List<String> filters;
  final List<String> seriesStatus;
  final bool favoritesOnly;
  final List<String> genres;

  /// The genre a genre page is about, matched on any copy of a title.
  final String? genre;
  final List<String> officialRatings;
  final List<int> years;
  final List<String>? ids;

  const UnifiedCatalogQuery({
    required this.itemTypes,
    this.sortBy = 'SortName',
    this.descending = false,
    this.filters = const [],
    this.seriesStatus = const [],
    this.favoritesOnly = false,
    this.genres = const [],
    this.genre,
    this.officialRatings = const [],
    this.years = const [],
    this.ids,
  });

  /// Queries with the same signature give the same list, so pages share one.
  String get signature => [
    itemTypes,
    sortBy,
    descending,
    filters.join(','),
    seriesStatus.join(','),
    favoritesOnly,
    genres.join('|'),
    genre ?? '',
    officialRatings.join('|'),
    years.join(','),
    ids?.join(',') ?? '',
  ].join(';');
}

class UnifiedServerInfo {
  final String id;
  final String name;
  final bool reachable;

  const UnifiedServerInfo({
    required this.id,
    required this.name,
    this.reachable = true,
  });
}

/// The rank of [servers], given preferred first; built once per merge.
class UnifiedServerOrder {
  UnifiedServerOrder(List<UnifiedServerInfo> servers)
    : _rank = {for (var i = 0; i < servers.length; i++) servers[i].id: i},
      _byId = {for (final server in servers) server.id: server};

  final Map<String, int> _rank;
  final Map<String, UnifiedServerInfo> _byId;

  bool holds(String serverId) => _rank.containsKey(serverId);

  /// Which copy of a title is shown: a reachable server first, then the copy
  /// in progress, then server order.
  int _compareForDisplay(UnifiedCatalogEntry a, UnifiedCatalogEntry b) {
    final aReachable = _byId[a.serverId]!.reachable ? 0 : 1;
    final bReachable = _byId[b.serverId]!.reachable ? 0 : 1;
    if (aReachable != bReachable) return aReachable - bReachable;
    final aInProgress = _inProgress(a.raw) ? 0 : 1;
    final bInProgress = _inProgress(b.raw) ? 0 : 1;
    if (aInProgress != bInProgress) return aInProgress - bInProgress;
    final server = _rank[a.serverId]! - _rank[b.serverId]!;
    if (server != 0) return server;
    // Dart's sort isn't stable, and two copies on one server tie this far.
    return a.itemId.compareTo(b.itemId);
  }
}

/// Groups [entries] of [itemType] into one list per title: those sharing any
/// external id, directly or through another copy.
List<List<UnifiedCatalogEntry>> groupCatalogEntries(
  Iterable<UnifiedCatalogEntry> entries, {
  required String itemType,
  required UnifiedServerOrder order,
}) {
  final wanted = [
    for (final entry in entries)
      if (entry.itemType == itemType && order.holds(entry.serverId)) entry,
  ];

  // Union-find over the shared keys.
  final parent = List<int>.generate(wanted.length, (i) => i);
  int root(int i) {
    while (parent[i] != i) {
      parent[i] = parent[parent[i]];
      i = parent[i];
    }
    return i;
  }

  final firstWithKey = <String, int>{};
  for (var i = 0; i < wanted.length; i++) {
    for (final key in wanted[i].matchKeys) {
      final other = firstWithKey.putIfAbsent(key, () => i);
      if (other != i) parent[root(i)] = root(other);
    }
  }
  final groups = <int, List<UnifiedCatalogEntry>>{};
  for (var i = 0; i < wanted.length; i++) {
    groups.putIfAbsent(root(i), () => []).add(wanted[i]);
  }
  return groups.values.toList();
}

/// Folds the [copies] of one title into a single raw item, with every copy
/// under [unifiedCopiesKey]. It is in progress while any copy is, else
/// watched once any copy is, and a favourite when any copy is.
Map<String, dynamic> mergeCatalogCopies(
  List<UnifiedCatalogEntry> copies,
  UnifiedServerOrder order,
) {
  final rankedCopies = [...copies]..sort(order._compareForDisplay);
  final shown = rankedCopies.first;

  final raw = Map<String, dynamic>.from(shown.raw);
  raw[unifiedServerIdKey] = shown.serverId;
  raw[unifiedCopiesKey] = [
    for (final copy in rankedCopies)
      UnifiedCopy(
        serverId: copy.serverId,
        itemId: copy.itemId,
        serverName: order._byId[copy.serverId]!.name,
        name: copy.raw['Name']?.toString(),
        originalTitle: copy.raw['OriginalTitle']?.toString(),
        officialRating: copy.raw['OfficialRating']?.toString(),
        played: _userData(copy.raw)['Played'] == true,
        positionTicks: _positionTicks(copy.raw),
        playedPercentage: _double(_userData(copy.raw)['PlayedPercentage']),
        reachable: order._byId[copy.serverId]!.reachable,
      ).toJson(),
  ];
  if (rankedCopies.length == 1) return raw;

  // The shown copy is the one in progress, unless that copy's server is
  // unreachable. The title counts as in progress in that case too.
  final inProgressCopy = rankedCopies
      .where((c) => _inProgress(c.raw))
      .firstOrNull;
  // The user data is taken whole from the watched copy. Mixing in an
  // unwatched copy's count of episodes left would show a watched tick next
  // to a number of unwatched episodes.
  final watchedCopy = inProgressCopy == null
      ? rankedCopies
            .where((c) => _userData(c.raw)['Played'] == true)
            .firstOrNull
      : null;
  final userDataSource = inProgressCopy ?? watchedCopy ?? shown;
  final userData = <String, dynamic>{
    for (final entry in _userData(userDataSource.raw).entries)
      entry.key.toString(): entry.value,
  };
  if (rankedCopies.any((c) => _userData(c.raw)['IsFavorite'] == true)) {
    userData['IsFavorite'] = true;
  }
  final lastPlayed = _latestDateString(
    rankedCopies.map((c) => _userData(c.raw)['LastPlayedDate']),
  );
  if (lastPlayed != null) userData['LastPlayedDate'] = lastPlayed;
  raw['UserData'] = userData;

  final genres = <String>{};
  raw[unifiedGenresKey] = [
    for (final copy in rankedCopies)
      for (final genre in _stringList(copy.raw['Genres']))
        if (genres.add(genreNameKey(genre))) genre,
  ];

  // The latest addition on any server makes the title a recent one.
  final latestAdded = _latestDateString(
    rankedCopies.map((c) => c.raw['DateCreated']),
  );
  if (latestAdded != null) raw['DateCreated'] = latestAdded;
  return raw;
}

/// [items] narrowed by [query]'s filters and put in its order. A random sort
/// places each title by the seed and the title alone, so a list rebuilt from
/// the same seed keeps every other title where it was.
List<Map<String, dynamic>> filterAndSortCatalog(
  List<Map<String, dynamic>> items,
  UnifiedCatalogQuery query, {
  Random? random,
}) {
  final ids = query.ids?.toSet();
  final genres = query.genres.map(genreNameKey).toSet();
  final genre = query.genre == null ? null : genreNameKey(query.genre!);
  final ratings = query.officialRatings.toSet();
  final years = query.years.toSet();
  final statuses = query.seriesStatus.map((s) => s.toLowerCase()).toSet();

  bool matches(Map<String, dynamic> item) {
    if (ids != null && !ids.contains(item['Id']?.toString())) return false;
    final userData = _userData(item);
    final played = userData['Played'] == true;
    for (final filter in query.filters) {
      switch (filter) {
        case 'IsPlayed':
          if (!played) return false;
        case 'IsUnplayed':
          if (played) return false;
        case 'IsResumable':
          if (!_inProgress(item)) return false;
        case 'Likes':
          if (userData['Likes'] != true) return false;
        case 'Dislikes':
          if (userData['Likes'] != false) return false;
      }
    }
    if (query.favoritesOnly && userData['IsFavorite'] != true) return false;
    if (statuses.isNotEmpty &&
        !statuses.contains(item['Status']?.toString().toLowerCase())) {
      return false;
    }
    if (genres.isNotEmpty &&
        !unifiedGenresOf(item)
            .any((g) => genres.contains(genreNameKey(g)))) {
      return false;
    }
    if (genre != null &&
        !unifiedGenresOf(item).any((g) => genreNameKey(g) == genre)) {
      return false;
    }
    if (ratings.isNotEmpty && !ratings.contains(item['OfficialRating'])) {
      return false;
    }
    if (years.isNotEmpty && !years.contains(_int(item['ProductionYear']))) {
      return false;
    }
    return true;
  }

  final matching = items.where(matches).toList();

  // Callers may pass the full sort value, like 'DateCreated,SortName'.
  final primary = query.sortBy.split(',').first;
  if (primary == 'Random') {
    final seed = (random ?? Random()).nextInt(0x7fffffff);
    final shuffled = [
      for (final item in matching)
        (
          item: item,
          shuffleKey: Object.hash(
            seed,
            '${item['Id']}',
            item[unifiedServerIdKey],
          ),
          id: '${item['Id']}',
          serverId: '${item[unifiedServerIdKey] ?? ''}',
        ),
    ];
    shuffled.sort((a, b) {
      final byShuffleKey = a.shuffleKey.compareTo(b.shuffleKey);
      if (byShuffleKey != 0) return byShuffleKey;
      final id = a.id.compareTo(b.id);
      return id != 0 ? id : a.serverId.compareTo(b.serverId);
    });
    return [for (final entry in shuffled) entry.item];
  }

  // Sort keys are computed once, here. Computed inside the comparison, each
  // date would be parsed again on every compare.
  final keyed = [
    for (final item in matching)
      (
        item: item,
        key: _sortKey(primary, item),
        name: _sortName(item),
        id: '${item['Id']}',
        serverId: '${item[unifiedServerIdKey] ?? ''}',
      ),
  ];
  final direction = query.descending ? -1 : 1;
  keyed.sort((a, b) {
    // Items without a value sort lowest, as on the server.
    final aKey = a.key;
    final bKey = b.key;
    if (aKey == null || bKey == null) {
      if (aKey != null) return direction;
      if (bKey != null) return -direction;
    } else {
      final key = aKey.compareTo(bKey);
      if (key != 0) return key * direction;
    }
    final name = a.name.compareTo(b.name);
    if (name != 0) return name * direction;
    // Dart's sort isn't stable. Id, then server since two can share an id,
    // keeps every page cut from the same order.
    final id = a.id.compareTo(b.id);
    return id != 0 ? id : a.serverId.compareTo(b.serverId);
  });
  return [for (final entry in keyed) entry.item];
}

Comparable<dynamic>? _sortKey(String sortBy, Map<String, dynamic> item) =>
    switch (sortBy) {
      'DateCreated' => parseServerDate(
        item['DateCreated'],
      )?.microsecondsSinceEpoch,
      'PremiereDate' => _premiere(item)?.microsecondsSinceEpoch,
      'CommunityRating' => _double(item['CommunityRating']),
      'CriticRating' => _double(item['CriticRating']),
      'Runtime' => _int(item['RunTimeTicks']),
      'DatePlayed' => parseServerDate(
        _userData(item)['LastPlayedDate'],
      )?.microsecondsSinceEpoch,
      'PlayCount' => _int(_userData(item)['PlayCount']),
      'OfficialRating' => item['OfficialRating']?.toString(),
      _ => null,
    };

/// [genreSpellings] says how a genre is written, by [genreNameKey].
QueryFilterValues catalogFacets(
  Iterable<Map<String, dynamic>> items, {
  Map<String, String> genreSpellings = const {},
}) {
  final genres = <String, String>{};
  final ratings = <String>{};
  final years = <int>{};
  for (final item in items) {
    for (final genre in unifiedGenresOf(item)) {
      final key = genreNameKey(genre);
      if (key.isEmpty) continue;
      genres.putIfAbsent(key, () => genreSpellings[key] ?? genre.trim());
    }
    final rating = item['OfficialRating']?.toString();
    if (rating != null && rating.isNotEmpty) ratings.add(rating);
    final year = _int(item['ProductionYear']);
    if (year != null) years.add(year);
  }
  return QueryFilterValues(
    genres: genres.values.toList()..sort(),
    officialRatings: ratings.toList()..sort(),
    years: years.toList()..sort((a, b) => b.compareTo(a)),
  );
}

/// A server can send a non-map here, which counts as empty.
Map<dynamic, dynamic> _userData(Map<String, dynamic> raw) {
  final userData = raw['UserData'];
  return userData is Map ? userData : const {};
}

List<dynamic> _list(Object? value) => value is List ? value : const [];

int _positionTicks(Map<String, dynamic> raw) =>
    _int(_userData(raw)['PlaybackPositionTicks']) ?? 0;

bool _inProgress(Map<String, dynamic> raw) {
  final userData = _userData(raw);
  if (userData['Played'] == true) return false;
  if (_positionTicks(raw) > 0) return true;
  // A series keeps no position of its own, only how much of it is watched.
  final percentage = _double(userData['PlayedPercentage']) ?? 0;
  return percentage > 0 && percentage < 100;
}

/// The key the alphabet strip files a title under, so letter jumps line up.
String _sortName(Map<String, dynamic> raw) =>
    foldAccents(((raw['SortName'] ?? raw['Name'])?.toString() ?? '').trim())
        .toUpperCase();

DateTime? _premiere(Map<String, dynamic> raw) {
  final date = parseServerDate(raw['PremiereDate']);
  if (date != null) return date;
  final year = _int(raw['ProductionYear']);
  return year == null ? null : DateTime.utc(year);
}

String? _latestDateString(Iterable<Object?> values) {
  String? latest;
  DateTime? latestDate;
  for (final value in values) {
    final date = parseServerDate(value);
    if (date == null) continue;
    if (latestDate == null || date.isAfter(latestDate)) {
      latestDate = date;
      latest = value.toString();
    }
  }
  return latest;
}

List<String> _stringList(Object? raw) => [
  for (final value in _list(raw))
    if (value != null && value.toString().isNotEmpty) value.toString(),
];

int? _int(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

double? _double(Object? value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
