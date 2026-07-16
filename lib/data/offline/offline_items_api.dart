import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:server_core/server_core.dart';

import '../services/storage_path_service.dart';
import 'offline_catalog.dart';
import 'offline_errors.dart';
import 'offline_views.dart';

/// Serves the standard Jellyfin items envelopes from the local downloads
/// catalog so the regular UI (home rows, search, libraries, details) renders
/// offline with only downloaded content.
class OfflineItemsApi implements ItemsApi {
  final OfflineCatalog _catalog;
  final StoragePathService _storagePath;

  OfflineItemsApi(this._catalog, this._storagePath);

  Map<String, dynamic> _envelope(
    List<Map<String, dynamic>> items, {
    int? startIndex,
    int? limit,
    int? totalOverride,
  }) {
    final total = totalOverride ?? items.length;
    var page = items;
    final start = startIndex ?? 0;
    if (start > 0) {
      page = start < page.length
          ? page.sublist(start)
          : <Map<String, dynamic>>[];
    }
    if (limit != null && page.length > limit) {
      page = page.sublist(0, limit);
    }
    return {'Items': page, 'TotalRecordCount': total, 'StartIndex': start};
  }

  String? _str(Map<String, dynamic> m, String key) => m[key]?.toString();

  DateTime? _date(Map<String, dynamic> m, String key) {
    final v = m[key] as String?;
    return v != null ? DateTime.tryParse(v) : null;
  }

  /// Resolves a parentId to the entries inside it.
  List<OfflineEntry> _scope(
    String? parentId, {
    List<String>? includeItemTypes,
  }) {
    final hasTypeFilter =
        includeItemTypes != null && includeItemTypes.isNotEmpty;
    if (parentId == null || parentId.isEmpty) {
      return _catalog.entries;
    }
    if (OfflineViews.isOfflineView(parentId)) {
      final inView = _catalog.entries
          .where((e) => OfflineViews.viewForType(e.type) == parentId)
          .toList();
      if (hasTypeFilter) return inView;
      final topLevel = OfflineViews.topLevelTypesFor(parentId);
      final top = inView.where((e) => topLevel.contains(e.type)).toList();
      // The homevideos view is a catch-all, so show whatever it holds.
      if (top.isEmpty && parentId == OfflineViews.videos) return inView;
      return top;
    }
    final parent = _catalog.byId(parentId);
    if (parent == null) return const [];
    switch (parent.type) {
      case 'Series':
        return _catalog.entries
            .where((e) => e.row.seriesId == parentId && e.id != parentId)
            .toList();
      case 'Season':
        return _catalog.entries
            .where((e) => e.row.seasonId == parentId)
            .toList();
      case 'MusicAlbum':
        return _catalog.entries
            .where((e) => _str(e.metadata, 'AlbumId') == parentId)
            .toList();
      default:
        return _catalog.entries
            .where((e) => _str(e.metadata, 'ParentId') == parentId)
            .toList();
    }
  }

  /// Like [_scope], but a view resolves to everything inside it rather than
  /// just its top-level rows. Used where children matter, like latest items
  /// and genre aggregation.
  List<OfflineEntry> _scopeIncludingChildren(String? parentId) {
    if (parentId != null && OfflineViews.isOfflineView(parentId)) {
      return _catalog.entries
          .where((e) => OfflineViews.viewForType(e.type) == parentId)
          .toList();
    }
    return _scope(parentId).toList();
  }

  bool _matchesSearch(OfflineEntry e, String term) {
    final t = term.toLowerCase();
    bool has(String? s) => s != null && s.toLowerCase().contains(t);
    if (has(e.metadata['Name'] as String?) || has(e.row.name)) return true;
    if (has(e.metadata['OriginalTitle'] as String?)) return true;
    if (has(e.row.seriesName) || has(e.metadata['SeriesName'] as String?)) {
      return true;
    }
    if (has(e.metadata['Album'] as String?)) return true;
    if (has(e.metadata['AlbumArtist'] as String?)) return true;
    final artists = (e.metadata['Artists'] as List?) ?? const [];
    return artists.whereType<String>().any((a) => a.toLowerCase().contains(t));
  }

  bool _matchesGenres(OfflineEntry e, List<String> genreIds) {
    final genreItems = ((e.metadata['GenreItems'] as List?) ?? const [])
        .whereType<Map>()
        .toList();
    for (final wanted in genreIds) {
      for (final g in genreItems) {
        if (g['Id']?.toString() == wanted) return true;
      }
      if (wanted.startsWith('offline-genre:')) {
        final name = wanted.substring('offline-genre:'.length);
        if (e.genres.any((g) => g.toLowerCase() == name.toLowerCase())) {
          return true;
        }
      }
      if (e.genres.any((g) => g.toLowerCase() == wanted.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  bool _isResumable(OfflineEntry e) {
    final ticks = (e.userData?['PlaybackPositionTicks'] as num?)?.toInt() ?? 0;
    return ticks > 0 && !e.isPlayed;
  }

  bool _applyFilters(OfflineEntry e, List<String> filters) {
    for (final f in filters) {
      switch (f.toLowerCase()) {
        case 'isplayed':
          if (!e.isPlayed) return false;
        case 'isunplayed':
          if (e.isPlayed) return false;
        case 'isresumable':
          if (!_isResumable(e)) return false;
        case 'isfavorite':
          if (!e.isFavorite) return false;
        case 'isnotfolder':
          if (e.type == 'Series' ||
              e.type == 'Season' ||
              e.type == 'MusicAlbum' ||
              e.type == 'BoxSet') {
            return false;
          }
        default:
          break;
      }
    }
    return true;
  }

  int _compareBy(OfflineEntry a, OfflineEntry b, String key) {
    int compareNullable<T extends Comparable>(T? x, T? y) {
      if (x == null && y == null) return 0;
      if (x == null) return 1;
      if (y == null) return -1;
      return x.compareTo(y);
    }

    switch (key) {
      case 'SortName':
      case 'Name':
        return compareNullable(
          a.sortName?.toLowerCase(),
          b.sortName?.toLowerCase(),
        );
      case 'DateCreated':
        return compareNullable(
          _date(a.metadata, 'DateCreated') ?? a.row.downloadedAt,
          _date(b.metadata, 'DateCreated') ?? b.row.downloadedAt,
        );
      case 'DateLastContentAdded':
        return compareNullable(a.row.downloadedAt, b.row.downloadedAt);
      case 'PremiereDate':
        return compareNullable(
          _date(a.metadata, 'PremiereDate'),
          _date(b.metadata, 'PremiereDate'),
        );
      case 'ProductionYear':
        return compareNullable(
          (a.metadata['ProductionYear'] as num?)?.toInt(),
          (b.metadata['ProductionYear'] as num?)?.toInt(),
        );
      case 'CommunityRating':
        return compareNullable(
          (a.metadata['CommunityRating'] as num?)?.toDouble(),
          (b.metadata['CommunityRating'] as num?)?.toDouble(),
        );
      case 'CriticRating':
        return compareNullable(
          (a.metadata['CriticRating'] as num?)?.toDouble(),
          (b.metadata['CriticRating'] as num?)?.toDouble(),
        );
      case 'DatePlayed':
        return compareNullable(
          _date(a.userData ?? const {}, 'LastPlayedDate'),
          _date(b.userData ?? const {}, 'LastPlayedDate'),
        );
      case 'IndexNumber':
      case 'ParentIndexNumber,IndexNumber':
      case 'SortIndexNumber':
        final parent = compareNullable(
          a.row.parentIndexNumber ??
              (a.metadata['ParentIndexNumber'] as num?)?.toInt(),
          b.row.parentIndexNumber ??
              (b.metadata['ParentIndexNumber'] as num?)?.toInt(),
        );
        if (parent != 0) return parent;
        return compareNullable(
          a.row.indexNumber ?? (a.metadata['IndexNumber'] as num?)?.toInt(),
          b.row.indexNumber ?? (b.metadata['IndexNumber'] as num?)?.toInt(),
        );
      case 'Album':
        return compareNullable(
          (a.metadata['Album'] as String?)?.toLowerCase(),
          (b.metadata['Album'] as String?)?.toLowerCase(),
        );
      case 'AlbumArtist':
        return compareNullable(
          (a.metadata['AlbumArtist'] as String?)?.toLowerCase(),
          (b.metadata['AlbumArtist'] as String?)?.toLowerCase(),
        );
      case 'Runtime':
        return compareNullable(a.runTimeTicks, b.runTimeTicks);
      default:
        return 0;
    }
  }

  List<OfflineEntry> _sort(
    List<OfflineEntry> entries,
    String? sortBy,
    String? sortOrder,
  ) {
    if (sortBy == null || sortBy.isEmpty) return entries;
    final keys = sortBy.split(',').map((k) => k.trim()).toList();
    if (keys.contains('Random')) {
      final shuffled = [...entries]..shuffle(Random());
      return shuffled;
    }
    final sorted = [...entries];
    sorted.sort((a, b) {
      for (final key in keys) {
        final c = _compareBy(a, b, key);
        if (c != 0) return c;
      }
      return 0;
    });
    if (sortOrder == 'Descending') {
      return sorted.reversed.toList();
    }
    return sorted;
  }

  List<Map<String, dynamic>> _materialize(Iterable<OfflineEntry> entries) =>
      entries.map((e) => e.metadata).toList();

  @override
  Future<Map<String, dynamic>> getItems({
    bool? serverWide,
    String? parentId,
    List<String>? ids,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    bool? recursive,
    String? searchTerm,
    String? fields,
    List<String>? personIds,
    List<String>? artistIds,
    List<String>? filters,
    List<String>? seriesStatus,
    String? nameStartsWith,
    String? nameLessThan,
    List<String>? genreIds,
    List<String>? genres,
    bool? isFavorite,
    bool? collapseBoxSetItems,
    bool? enableTotalRecordCount,
    String? enableImageTypes,
    int? imageTypeLimit,
    List<String>? tags,
    List<String>? studios,
    DateTime? minPremiereDate,
    String? maxOfficialRating,
    bool? hasParentalRating,
    String? anyProviderIdEquals,
  }) async {
    List<OfflineEntry> result;
    if (ids != null && ids.isNotEmpty) {
      result = ids.map(_catalog.byId).whereType<OfflineEntry>().toList();
    } else {
      result = _scope(parentId, includeItemTypes: includeItemTypes);
    }

    if (includeItemTypes != null && includeItemTypes.isNotEmpty) {
      result = result.where((e) => includeItemTypes.contains(e.type)).toList();
    }
    if (excludeItemTypes != null && excludeItemTypes.isNotEmpty) {
      result = result.where((e) => !excludeItemTypes.contains(e.type)).toList();
    }
    if (searchTerm != null && searchTerm.trim().isNotEmpty) {
      result = result.where((e) => _matchesSearch(e, searchTerm)).toList();
    }
    if (genreIds != null && genreIds.isNotEmpty) {
      result = result.where((e) => _matchesGenres(e, genreIds)).toList();
    }
    if (genres != null && genres.isNotEmpty) {
      result = result
          .where(
            (e) => e.genres.any(
              (g) => genres.any((w) => w.toLowerCase() == g.toLowerCase()),
            ),
          )
          .toList();
    }
    if (isFavorite == true) {
      result = result.where((e) => e.isFavorite).toList();
    }
    if (filters != null && filters.isNotEmpty) {
      result = result.where((e) => _applyFilters(e, filters)).toList();
    }
    if (seriesStatus != null && seriesStatus.isNotEmpty) {
      result = result
          .where((e) => seriesStatus.contains(e.metadata['Status']))
          .toList();
    }
    if (artistIds != null && artistIds.isNotEmpty) {
      result = result.where((e) {
        final lists = [
          (e.metadata['ArtistItems'] as List?) ?? const [],
          (e.metadata['AlbumArtists'] as List?) ?? const [],
        ];
        return lists.any(
          (l) => l.whereType<Map>().any(
            (m) => artistIds.contains(m['Id']?.toString()),
          ),
        );
      }).toList();
    }
    if (personIds != null && personIds.isNotEmpty) {
      result = result.where((e) {
        final people = (e.metadata['People'] as List?) ?? const [];
        return people.whereType<Map>().any(
          (m) => personIds.contains(m['Id']?.toString()),
        );
      }).toList();
    }
    if (nameStartsWith != null && nameStartsWith.isNotEmpty) {
      final prefix = nameStartsWith.toLowerCase();
      result = result
          .where((e) => (e.sortName ?? '').toLowerCase().startsWith(prefix))
          .toList();
    }
    if (nameLessThan != null && nameLessThan.isNotEmpty) {
      final bound = nameLessThan.toLowerCase();
      result = result
          .where((e) => (e.sortName ?? '').toLowerCase().compareTo(bound) < 0)
          .toList();
    }
    if (minPremiereDate != null) {
      result = result.where((e) {
        final d = _date(e.metadata, 'PremiereDate');
        return d != null && !d.isBefore(minPremiereDate);
      }).toList();
    }
    if (tags != null && tags.isNotEmpty) {
      result = result.where((e) {
        final itemTags = ((e.metadata['Tags'] as List?) ?? const [])
            .whereType<String>()
            .map((t) => t.toLowerCase());
        return tags.any((t) => itemTags.contains(t.toLowerCase()));
      }).toList();
    }

    result = _sort(result, sortBy, sortOrder);
    return _envelope(
      _materialize(result),
      startIndex: startIndex,
      limit: limit,
    );
  }

  @override
  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  }) async {
    return _envelope(const []);
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    if (OfflineViews.isOfflineView(itemId)) {
      final serverId = _catalog.entries.isNotEmpty
          ? _catalog.entries.first.row.serverId
          : '';
      return OfflineViews.viewStub(itemId, serverId);
    }
    final entry = _catalog.byId(itemId);
    if (entry == null) throw offlineNotFound('/Items/$itemId');
    return entry.metadata;
  }

  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async {
    final entry = _catalog.byId(itemId);
    if (entry == null) return const [];
    final ancestors = <Map<String, dynamic>>[];
    if (entry.type == 'Episode' && entry.row.seasonId != null) {
      final season = _catalog.byId(entry.row.seasonId!);
      if (season != null) ancestors.add(season.metadata);
    }
    final seriesId = entry.row.seriesId;
    if ((entry.type == 'Episode' || entry.type == 'Season') &&
        seriesId != null) {
      final series = _catalog.byId(seriesId);
      if (series != null) ancestors.add(series.metadata);
    }
    final albumId = _str(entry.metadata, 'AlbumId');
    if (albumId != null) {
      final album = _catalog.byId(albumId);
      if (album != null) ancestors.add(album.metadata);
    }
    ancestors.add(
      OfflineViews.viewStub(
        OfflineViews.viewForType(entry.type),
        entry.row.serverId,
      ),
    );
    return ancestors;
  }

  @override
  Future<Map<String, dynamic>> getSimilarItems(
    String itemId, {
    int? limit,
  }) async {
    final entry = _catalog.byId(itemId);
    if (entry == null) return _envelope(const []);
    final view = OfflineViews.viewForType(entry.type);
    final ownGenres = entry.genres.map((g) => g.toLowerCase()).toSet();
    final topLevel = OfflineViews.topLevelTypesFor(view);
    final candidates = _catalog.entries.where((e) {
      if (e.id == itemId) return false;
      if (!topLevel.contains(e.type)) return false;
      if (entry.row.seriesId != null && e.id == entry.row.seriesId) {
        return false;
      }
      if (ownGenres.isEmpty) return true;
      return e.genres.any((g) => ownGenres.contains(g.toLowerCase()));
    }).toList()..shuffle(Random());
    return _envelope(_materialize(candidates), limit: limit ?? 12);
  }

  @override
  Future<Map<String, dynamic>> getNextUp({
    String? seriesId,
    String? parentId,
    int? limit,
    String? fields,
    bool? enableResumable,
    String? enableImageTypes,
    int? imageTypeLimit,
  }) async {
    final episodesBySeries = <String, List<OfflineEntry>>{};
    for (final e in _catalog.entries) {
      if (e.type != 'Episode') continue;
      final sid = e.row.seriesId;
      if (sid == null) continue;
      if (seriesId != null && sid != seriesId) continue;
      episodesBySeries.putIfAbsent(sid, () => []).add(e);
    }

    final nextUp = <OfflineEntry>[];
    episodesBySeries.forEach((sid, episodes) {
      episodes.sort((a, b) {
        final p = (a.row.parentIndexNumber ?? 0).compareTo(
          b.row.parentIndexNumber ?? 0,
        );
        if (p != 0) return p;
        return (a.row.indexNumber ?? 0).compareTo(b.row.indexNumber ?? 0);
      });
      final lastPlayed = episodes.lastIndexWhere((e) => e.isPlayed);
      if (lastPlayed < 0) return;
      for (var i = lastPlayed + 1; i < episodes.length; i++) {
        final candidate = episodes[i];
        if (candidate.isPlayed) continue;
        if (enableResumable == false && _isResumable(candidate)) return;
        nextUp.add(candidate);
        return;
      }
    });

    nextUp.sort((a, b) {
      final aDate =
          _date(a.userData ?? const {}, 'LastPlayedDate') ??
          a.row.downloadedAt ??
          DateTime.fromMillisecondsSinceEpoch(0);
      final bDate =
          _date(b.userData ?? const {}, 'LastPlayedDate') ??
          b.row.downloadedAt ??
          DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate);
    });
    return _envelope(_materialize(nextUp), limit: limit);
  }

  @override
  Future<Map<String, dynamic>> getResumeItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
  }) async {
    final types = (includeItemTypes != null && includeItemTypes.isNotEmpty)
        ? includeItemTypes
        : const ['Movie', 'Episode', 'Video', 'MusicVideo', 'AudioBook'];
    final resumable =
        _catalog.entries
            .where((e) => types.contains(e.type) && _isResumable(e))
            .toList()
          ..sort((a, b) {
            final aDate =
                _date(a.userData ?? const {}, 'LastPlayedDate') ??
                a.row.downloadedAt ??
                DateTime.fromMillisecondsSinceEpoch(0);
            final bDate =
                _date(b.userData ?? const {}, 'LastPlayedDate') ??
                b.row.downloadedAt ??
                DateTime.fromMillisecondsSinceEpoch(0);
            return bDate.compareTo(aDate);
          });
    return _envelope(_materialize(resumable), limit: limit);
  }

  @override
  Future<Map<String, dynamic>> getLatestItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
  }) async {
    var scope = _scopeIncludingChildren(parentId);
    if (includeItemTypes != null && includeItemTypes.isNotEmpty) {
      scope = scope.where((e) => includeItemTypes.contains(e.type)).toList();
    }

    // Collapse episodes into their series and tracks into their albums,
    // mirroring the server's grouped Latest behavior.
    final seen = <String>{};
    final collapsed = <OfflineEntry>[];
    scope.sort((a, b) {
      final aDate =
          a.row.downloadedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bDate =
          b.row.downloadedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate);
    });
    for (final e in scope) {
      OfflineEntry display = e;
      if (e.type == 'Episode' && e.row.seriesId != null) {
        display = _catalog.byId(e.row.seriesId!) ?? e;
      } else if (e.type == 'Audio') {
        final albumId = _str(e.metadata, 'AlbumId');
        if (albumId != null) display = _catalog.byId(albumId) ?? e;
      } else if (e.type == 'Season' || e.type == 'Series') {
        continue;
      } else if (e.type == 'MusicAlbum') {
        continue;
      }
      if (seen.add(display.id)) collapsed.add(display);
    }
    return _envelope(_materialize(collapsed), limit: limit ?? 16);
  }

  @override
  Future<Map<String, dynamic>> getRecentlyReleasedItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
  }) async {
    var scope = _scope(parentId, includeItemTypes: includeItemTypes);
    if (includeItemTypes != null && includeItemTypes.isNotEmpty) {
      scope = scope.where((e) => includeItemTypes.contains(e.type)).toList();
    }
    final dated =
        scope.where((e) => _date(e.metadata, 'PremiereDate') != null).toList()
          ..sort(
            (a, b) => _date(
              b.metadata,
              'PremiereDate',
            )!.compareTo(_date(a.metadata, 'PremiereDate')!),
          );
    return _envelope(_materialize(dated), limit: limit ?? 16);
  }

  @override
  Future<Map<String, dynamic>> getSeasons(String seriesId) async {
    final seasons = _catalog.entries
        .where((e) => e.type == 'Season' && e.row.seriesId == seriesId)
        .toList();
    if (seasons.isNotEmpty) {
      seasons.sort((a, b) {
        final ai = (a.metadata['IndexNumber'] as num?)?.toInt() ?? 0;
        final bi = (b.metadata['IndexNumber'] as num?)?.toInt() ?? 0;
        return ai.compareTo(bi);
      });
      return _envelope(_materialize(seasons));
    }

    // Synthesize season stubs from downloaded episodes when the season
    // container row is missing.
    final synthesized = <String, Map<String, dynamic>>{};
    for (final e in _catalog.entries) {
      if (e.type != 'Episode' || e.row.seriesId != seriesId) continue;
      final seasonId = e.row.seasonId;
      if (seasonId == null || synthesized.containsKey(seasonId)) continue;
      synthesized[seasonId] = {
        'Id': seasonId,
        'Name':
            e.row.seasonName ??
            'Season ${e.row.parentIndexNumber ?? ''}'.trim(),
        'Type': 'Season',
        'IndexNumber': e.row.parentIndexNumber,
        'SeriesId': seriesId,
        'SeriesName': e.row.seriesName,
        'ServerId': e.row.serverId,
        'ImageTags': const <String, dynamic>{},
        'UserData': const <String, dynamic>{},
      };
    }
    final stubs = synthesized.values.toList()
      ..sort(
        (a, b) => ((a['IndexNumber'] as int?) ?? 0).compareTo(
          (b['IndexNumber'] as int?) ?? 0,
        ),
      );
    return _envelope(stubs);
  }

  @override
  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  }) async {
    final episodes =
        _catalog.entries
            .where(
              (e) =>
                  e.type == 'Episode' &&
                  e.row.seriesId == seriesId &&
                  (seasonId == null || e.row.seasonId == seasonId),
            )
            .toList()
          ..sort((a, b) {
            final p = (a.row.parentIndexNumber ?? 0).compareTo(
              b.row.parentIndexNumber ?? 0,
            );
            if (p != 0) return p;
            return (a.row.indexNumber ?? 0).compareTo(b.row.indexNumber ?? 0);
          });
    return _envelope(_materialize(episodes));
  }

  @override
  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  }) async {
    return {
      'ThemeSongsResult': {'Items': const [], 'TotalRecordCount': 0},
      'ThemeVideosResult': {'Items': const [], 'TotalRecordCount': 0},
      'SoundtrackSongsResult': {'Items': const [], 'TotalRecordCount': 0},
    };
  }

  @override
  Future<Map<String, dynamic>> getPlaylists() async => _envelope(const []);

  Map<String, dynamic> _artistsEnvelope({
    String? nameStartsWith,
    String? nameLessThan,
    int? startIndex,
    int? limit,
    bool albumArtistsOnly = false,
  }) {
    final artists = <String, Map<String, dynamic>>{};
    for (final e in _catalog.entries) {
      if (e.type != 'Audio' && e.type != 'MusicAlbum') continue;
      final lists = [
        (e.metadata['AlbumArtists'] as List?) ?? const [],
        if (!albumArtistsOnly) (e.metadata['ArtistItems'] as List?) ?? const [],
      ];
      for (final list in lists) {
        for (final artist in list.whereType<Map>()) {
          final id = artist['Id']?.toString();
          final name = artist['Name'] as String?;
          if (id == null || name == null || name.isEmpty) continue;
          artists.putIfAbsent(
            id,
            () => {
              'Id': id,
              'Name': name,
              'Type': 'MusicArtist',
              'ServerId': e.row.serverId,
              'ImageTags': const <String, dynamic>{},
              'UserData': const <String, dynamic>{},
            },
          );
        }
      }
    }
    var result = artists.values.toList()
      ..sort(
        (a, b) => (a['Name'] as String).toLowerCase().compareTo(
          (b['Name'] as String).toLowerCase(),
        ),
      );
    if (nameStartsWith != null && nameStartsWith.isNotEmpty) {
      final prefix = nameStartsWith.toLowerCase();
      result = result
          .where((a) => (a['Name'] as String).toLowerCase().startsWith(prefix))
          .toList();
    }
    if (nameLessThan != null && nameLessThan.isNotEmpty) {
      final bound = nameLessThan.toLowerCase();
      result = result
          .where(
            (a) => (a['Name'] as String).toLowerCase().compareTo(bound) < 0,
          )
          .toList();
    }
    return _envelope(result, startIndex: startIndex, limit: limit);
  }

  @override
  Future<Map<String, dynamic>> getArtists({
    String? parentId,
    String? userId,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    bool? recursive,
    String? fields,
    String? nameStartsWith,
    String? nameLessThan,
    bool? isFavorite,
  }) async {
    return _artistsEnvelope(
      nameStartsWith: nameStartsWith,
      nameLessThan: nameLessThan,
      startIndex: startIndex,
      limit: limit,
    );
  }

  @override
  Future<Map<String, dynamic>> getAlbumArtists({
    String? parentId,
    String? userId,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    bool? recursive,
    String? fields,
    String? nameStartsWith,
    String? nameLessThan,
    bool? isFavorite,
  }) async {
    return _artistsEnvelope(
      nameStartsWith: nameStartsWith,
      nameLessThan: nameLessThan,
      startIndex: startIndex,
      limit: limit,
      albumArtistsOnly: true,
    );
  }

  @override
  Future<Map<String, dynamic>> getPlaylistItems(String playlistId) async =>
      _envelope(const []);

  @override
  Future<Map<String, dynamic>> createPlaylist({
    required String name,
    List<String>? itemIds,
  }) async {
    throw offlineUnavailable('/Playlists');
  }

  @override
  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) async {
    throw offlineUnavailable('/Collections');
  }

  @override
  Future<void> addToPlaylist(String playlistId, List<String> itemIds) async {
    throw offlineUnavailable('/Playlists/$playlistId/Items');
  }

  @override
  Future<void> addToCollection(
    String collectionId,
    List<String> itemIds,
  ) async {
    throw offlineUnavailable('/Collections/$collectionId/Items');
  }

  @override
  Future<void> removeFromPlaylist(
    String playlistId,
    List<String> entryIds,
  ) async {
    throw offlineUnavailable('/Playlists/$playlistId/Items');
  }

  @override
  Future<void> movePlaylistItem(
    String playlistId,
    String playlistItemId,
    int newIndex,
  ) async {
    throw offlineUnavailable('/Playlists/$playlistId/Items');
  }

  @override
  Future<void> renamePlaylist(String playlistId, String name) async {
    throw offlineUnavailable('/Playlists/$playlistId');
  }

  @override
  Future<void> deleteItem(String itemId) async {
    throw offlineUnavailable('/Items/$itemId');
  }

  @override
  Future<void> deletePlaylist(String playlistId) async {
    throw offlineUnavailable('/Playlists/$playlistId');
  }

  @override
  Future<Map<String, dynamic>> getGenres({
    String? parentId,
    String? userId,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    bool? recursive,
    String? fields,
    List<String>? includeItemTypes,
  }) async {
    var scope = _scopeIncludingChildren(parentId);
    if (includeItemTypes != null && includeItemTypes.isNotEmpty) {
      scope = scope.where((e) => includeItemTypes.contains(e.type)).toList();
    }

    final genresByName = <String, Map<String, dynamic>>{};
    void count(Map<String, dynamic> genre, String type) {
      final key = switch (type) {
        'Movie' => 'MovieCount',
        'Series' => 'SeriesCount',
        'Episode' => 'EpisodeCount',
        'MusicAlbum' => 'AlbumCount',
        'Audio' => 'SongCount',
        _ => null,
      };
      if (key != null) {
        genre[key] = ((genre[key] as int?) ?? 0) + 1;
      }
    }

    for (final e in scope) {
      final genreItems = ((e.metadata['GenreItems'] as List?) ?? const [])
          .whereType<Map>()
          .toList();
      if (genreItems.isNotEmpty) {
        for (final g in genreItems) {
          final name = g['Name'] as String?;
          if (name == null || name.isEmpty) continue;
          final genre = genresByName.putIfAbsent(
            name.toLowerCase(),
            () => {
              'Id': g['Id']?.toString() ?? 'offline-genre:$name',
              'Name': name,
              'Type': 'Genre',
              'ServerId': e.row.serverId,
            },
          );
          count(genre, e.type);
        }
      } else {
        for (final name in e.genres) {
          final genre = genresByName.putIfAbsent(
            name.toLowerCase(),
            () => {
              'Id': 'offline-genre:$name',
              'Name': name,
              'Type': 'Genre',
              'ServerId': e.row.serverId,
            },
          );
          count(genre, e.type);
        }
      }
    }

    final result = genresByName.values.toList()
      ..sort(
        (a, b) => (a['Name'] as String).toLowerCase().compareTo(
          (b['Name'] as String).toLowerCase(),
        ),
      );
    return _envelope(result, startIndex: startIndex, limit: limit);
  }

  @override
  Future<Map<String, dynamic>> getLyrics(String itemId) async {
    try {
      final imageDir = await _storagePath.getImageCacheDir();
      final file = File('${imageDir.path}/$itemId/lyrics.json');
      if (await file.exists()) {
        final decoded = jsonDecode(await file.readAsString());
        if (decoded is Map<String, dynamic>) return decoded;
      }
    } catch (_) {}
    throw offlineNotFound('/Audio/$itemId/Lyrics');
  }

  @override
  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId) async =>
      const [];

  @override
  Future<List<Map<String, dynamic>>> getIntros(String itemId) async => const [];

  @override
  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId) async =>
      const [];

  @override
  Future<List<Map<String, dynamic>>> getMediaSegments(String itemId) async =>
      const [];

  @override
  Future<List<Map<String, dynamic>>> searchRemoteSubtitles(
    String itemId, {
    required String language,
    bool? isPerfectMatch,
  }) async => const [];

  @override
  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId) async {
    throw offlineUnavailable(
      '/Items/$itemId/RemoteSearch/Subtitles/$subtitleId',
    );
  }
}
