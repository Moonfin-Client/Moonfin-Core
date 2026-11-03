import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_item_mapper.dart';
import '../mappers/silo_collection_mapper.dart';
import '../mappers/silo_extras_mapper.dart';
import '../mappers/silo_filters_mapper.dart';
import '../mappers/silo_ids.dart';
import '../mappers/silo_item_types.dart';
import '../mappers/silo_person_mapper.dart';
import '../mappers/silo_sort_map.dart';
import '../silo_image_registry.dart';
import '../silo_kept_reads.dart';
import '../silo_pager.dart';
import 'silo_home_sections.dart';
import 'silo_markers.dart';
import 'silo_remote_subtitles.dart';
import 'silo_shuffles.dart';
import 'silo_themes.dart';
import 'silo_track_preferences.dart';
import 'silo_trickplay.dart';
import 'silo_unsupported.dart';

/// The artwork size Silo is asked for in lists (grids, rows): posters at
/// 500 px, backdrops at 1920 (`images/capabilities`).
const siloListImageSize = 'medium';

/// The artwork size for a single item's page: posters at 780 px.
const siloDetailImageSize = 'large';

/// Moonfin's `ItemsApi` over Silo's catalog.
///
/// Every answer is translated into Jellyfin's shapes by the mappers,
/// and every artwork URL is recorded in the client's image registry on the
/// way. What Silo doesn't have at all answers empty (music, playlists) or
/// throws [UnsupportedError] (see [noSuchMethod]).
class SiloItemsApi
    implements
        ItemsApi,
        LetterPositionApi,
        ServerHomeSectionsApi,
        UserDataRefreshScope,
        EditableCollectionsApi,
        HomeDismissalsApi,
        TrickplayManifestApi,
        ThemeSongStreamApi,
        SeriesTrackPreferencesApi,
        ServerShuffleApi {
  SiloItemsApi(
    this._dio, {
    this.images,
    SiloPager? pager,
    this.userViews,
    this.profileId,
    this.baseUrl,
    DateTime Function()? clock,
  }) : pager = pager ?? SiloPager(),
       _clock = clock ?? DateTime.now;

  final Dio _dio;

  /// The server's base URL, for links Silo answers relative to it.
  final String Function()? baseUrl;

  late final SiloShuffles shuffles = SiloShuffles(
    _dio,
    images: images,
    clock: _clock,
  );

  /// Theme music.
  late final SiloThemes themes = SiloThemes(
    _dio,
    detail: detailJson,
    clock: _clock,
  );

  /// The mapped media source each item plays, as the resolver noted it.
  final _playingSources = <String, Map<String, dynamic>>{};

  /// Series audio and subtitle choices.
  late final SiloTrackPreferences trackPreferences = SiloTrackPreferences(
    _dio,
    (itemId) => _playingSources[itemId],
  );

  /// Skip markers by file.
  late final SiloMarkers markers = SiloMarkers(_dio, clock: _clock);

  /// Subtitle search through the server's providers.
  late final SiloRemoteSubtitles remoteSubtitles = SiloRemoteSubtitles(_dio);

  /// Seek previews by file.
  late final SiloTrickplay trickplay = SiloTrickplay(
    _dio,
    images: images,
    clock: _clock,
  );

  /// The time, for date-bounded rows. Tests move it.
  final DateTime Function() _clock;
  final SiloImageRegistry? images;

  /// The client's library list, for library ids passed to [getItem].
  final UserViewsApi Function()? userViews;

  /// The profile requests act for, to tell its own collections from shared
  /// ones.
  final String? Function()? profileId;

  /// Remembers list cursors per query, so Moonfin's offset paging maps onto
  /// Silo's cursors.
  final SiloPager pager;

  static const _catalogPath = '/api/v2/catalog';

  /// A library grid, or the whole catalog.
  ///
  /// - A library `parentId` is sent as `library_id`, and no `parentId` reads
  ///   the whole catalog. A series, season, genre, studio or collection
  ///   parent reads that list instead.
  /// - `includeItemTypes` is sent as Silo's `type` scope. Types Silo can't
  ///   serve (`BoxSet`, `Playlist`, music…) are dropped from the request, and
  ///   a query for **only** such types answers empty without a request.
  ///   `excludeItemTypes` is applied to what comes back.
  /// - `sortBy`/`sortOrder` are sent as `sort`.
  /// - `startIndex`/`limit` become cursors through the pager.
  ///
  /// - Filters (genres, years, ratings, played state, favorites, 4K/HD,
  ///   languages) are sent as Silo rule `groups` (`siloRuleGroups`). Silo has
  ///   no rule for the series status, so that filter reads the whole list
  ///   once and pages it here (`_clientFiltered`).
  /// - `searchTerm` is sent as `q`, ranked by Silo's relevance unless a sort
  ///   is asked for. A search first reads [searchCapabilities]: none is sent
  ///   when Silo says search isn't available to this profile, and the
  ///   movies-series-episodes scope is used only when Silo offers it
  ///   ([siloSearchScopeFor]).
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
    List<String>? officialRatings,
    List<int>? years,
    List<String>? videoTypes,
    List<String>? audioLanguages,
    List<String>? subtitleLanguages,
    bool? hasSubtitles,
    bool? hasTrailer,
    bool? hasSpecialFeature,
    bool? hasThemeSong,
    bool? hasThemeVideo,
    bool? isHd,
    bool? is4K,
    bool? is3D,
  }) async {
    if (ids != null) {
      return _byIds(
        ids,
        startIndex: startIndex,
        limit: limit,
        userDataOnly: fields?.trim() == 'UserData',
      );
    }
    final libraryId = _libraryIdOf(parentId);
    // A genre page: its synthetic id names the genre.
    final genreParent = parentId == null ? null : siloGenreNameOf(parentId);
    // And a studio or network page.
    final studioParent = parentId == null ? null : siloStudioNameOf(parentId);
    // A collection's titles.
    final collection = parentId == null
        ? null
        : parseSiloCollectionId(parentId);
    // The collections themselves, asked for as BoxSets. Silo's favorites are
    // titles only, so there are no favorite collections.
    if (_asksForCollections(includeItemTypes)) {
      final favorites =
          isFavorite == true ||
          (filters?.any((f) => f.toLowerCase() == 'isfavorite') ?? false);
      if (favorites) return _empty(startIndex);
      return _collections(
        libraryId: libraryId,
        sortBy: sortBy,
        sortOrder: sortOrder,
        startIndex: startIndex,
        limit: limit,
      );
    }
    // A series' children are its seasons, as on Jellyfin. Asked for its
    // episodes (Rewatch's first episode, its "anything unwatched?" check),
    // they're the episodes.
    if (parentId != null && siloTypeOfId(parentId) == 'series') {
      final types = siloTypesForQuery(includeItemTypes: includeItemTypes);
      if (types != null &&
          types.contains('episode') &&
          !types.contains('season')) {
        return _seriesEpisodes(
          parentId,
          filters: filters,
          startIndex: startIndex,
          limit: limit,
        );
      }
      return getSeasons(parentId);
    }
    // And a season's are its episodes.
    if (parentId != null && siloTypeOfId(parentId) == 'season') {
      final series = parseSiloSeasonId(parentId)?.seriesId ?? parentId;
      return getEpisodes(series, seasonId: parentId);
    }
    if (parentId != null &&
        libraryId == null &&
        genreParent == null &&
        studioParent == null &&
        collection == null) {
      throw UnsupportedError(
        'ItemsApi.getItems(parentId: $parentId) is not supported on Silo',
      );
    }

    final types = siloTypesForQuery(includeItemTypes: includeItemTypes);
    if (types != null && types.isEmpty) return _empty(startIndex);

    // A search: only when Silo lets this profile search, and with the
    // scopes it says it has.
    final searchText = _searchTextOf(searchTerm);
    SiloSearchCapabilities? search;
    if (searchText != null) {
      search = await searchCapabilities();
      if (!search.canSearch) return _empty(startIndex);
    }
    final scope = search != null
        ? siloSearchScopeFor(types, withEpisodes: search.videoWithEpisodes)
        : types == null
        ? null
        : siloCatalogScopeFor(types);

    final groups = siloRuleGroups(
      genres: [...?genres, ?genreParent],
      genreIds: genreIds,
      studios: [
        for (final st in studios ?? const <String>[])
          siloStudioNameOf(st) ?? st,
        ?studioParent,
      ],
      years: years,
      officialRatings: officialRatings,
      filters: filters,
      isFavorite: isFavorite,
      is4K: is4K,
      isHd: isHd,
      audioLanguages: audioLanguages,
      subtitleLanguages: subtitleLanguages,
    );
    // A person's titles: Silo pages one person at a time.
    final personId = personIds == null || personIds.isEmpty
        ? null
        : personIds.first;
    final params = <String, Object?>{
      if (personId != null) ...{'source': 'person', 'person_id': personId},
      if (collection != null) ...{
        'source': collection.libraryId == null
            ? 'user_collection'
            : 'library_collection',
        'collection_id': collection.id,
        'library_id': ?collection.libraryId,
      },
      'library_id': ?libraryId,
      'q': ?searchText,
      'type': ?scope,
      'sort': ?siloSortFor(sortBy: sortBy, sortOrder: sortOrder),
      if (groups.isNotEmpty) 'groups': jsonEncode(groups),
      'name_prefix': ?_namePrefix(nameStartsWith),
      'image_size': siloListImageSize,
    };
    final excluded = {
      for (final t in excludeItemTypes ?? const <String>[]) t.toLowerCase(),
    };
    bool keep(Map<String, dynamic> item) {
      final silo = (item[siloOriginalKey] as Map?)?['type'] ?? item['Type'];
      final type = (item['Type'] as String? ?? '').toLowerCase();
      if (excluded.contains(type)) return false;
      if (!siloMatchesSeriesStatus(item, seriesStatus ?? const [])) {
        return false;
      }
      // A scope can be wider than the asked types (no single scope for
      // them, or a search's movies-series-episodes scope), so what wasn't
      // asked for is dropped here.
      if (types != null) return types.contains(silo);
      return siloSupportedTypes.contains(silo);
    }

    _rememberTitleQuery(
      parentId,
      sort: params['sort'] as String?,
      plainCatalog:
          personId == null &&
          collection == null &&
          searchText == null &&
          params['name_prefix'] == null &&
          (seriesStatus == null || seriesStatus.isEmpty),
      libraryId: libraryId,
      scope: scope,
      groups: groups,
    );
    final random = siloWantsRandom(sortBy);
    final filtered = seriesStatus != null && seriesStatus.isNotEmpty;
    // Shows by last played: Silo has no date for a show.
    final sort = params['sort'] as String?;
    if (scope == 'series' &&
        (sort == 'date_viewed' || sort == '-date_viewed') &&
        personId == null &&
        collection == null &&
        searchText == null &&
        params['name_prefix'] == null) {
      final listParams = Map<String, Object?>.of(params)..remove('sort');
      final descending = sort == '-date_viewed';
      return _clientFiltered(
        listParams,
        filter: [
          if (filtered) 'series_status=${seriesStatus.join(',')}',
          descending ? 'last_played_desc' : 'last_played_asc',
        ].join('&'),
        keep: keep,
        startIndex: startIndex,
        limit: limit,
        libraryId: libraryId,
        read: () => _showsByLastPlayed(
          listParams,
          keep: keep,
          libraryId: libraryId,
          descending: descending,
        ),
      );
    }
    // A random grid is shuffled whole (a few random titles come from the
    // first hundred instead, [_shuffledPage]). A grid always sends
    // `startIndex` (its first page is 75, under a hundred), and rows and
    // genre cards don't.
    final smallRandom =
        random &&
        startIndex == null &&
        limit != null &&
        limit > 0 &&
        limit < _randomPool;
    if (filtered || (random && !smallRandom)) {
      return _clientFiltered(
        params,
        filter: [
          if (filtered) 'series_status=${seriesStatus.join(',')}',
          if (random) 'random',
        ].join('&'),
        keep: keep,
        startIndex: startIndex,
        limit: limit,
        libraryId: libraryId,
        shuffle: random,
      );
    }
    if (random) {
      return _shuffledPage(
        params,
        startIndex: startIndex,
        limit: limit,
        keep: keep,
        libraryId: libraryId,
      );
    }
    if (sort == 'runtime') {
      return _runtimeAscending(
        params,
        groups: groups,
        startIndex: startIndex,
        limit: limit,
        keep: keep,
        libraryId: libraryId,
      );
    }
    return _page(
      params,
      startIndex: startIndex,
      limit: limit,
      keep: keep,
      libraryId: libraryId,
    );
  }

  /// Shortest first, with the titles that have no runtime last. Silo's
  /// ascending `runtime` sort lists the titles without one first (most shows
  /// on a server have none), so the grid would open on them. Silo counts the
  /// titles with a runtime (`runtime gt 0`) and the order is rotated by the
  /// rest: Moonfin's index `i` is Silo's `nulls + i` for the titles with a
  /// runtime, and `i - withRuntime` for those without. A count Silo can't
  /// give leaves Silo's order.
  Future<Map<String, dynamic>> _runtimeAscending(
    Map<String, Object?> params, {
    required List<Map<String, Object?>> groups,
    int? startIndex,
    int? limit,
    bool Function(Map<String, dynamic> item)? keep,
    String? libraryId,
  }) async {
    final start = startIndex ?? 0;
    final int total;
    final int withRuntime;
    try {
      final counts = await Future.wait([
        _fetch(params, 0, 1).then((r) => r.totalRecordCount),
        _withRuntimeCount(params, groups),
      ]);
      total = counts[0];
      withRuntime = counts[1];
    } on DioException {
      return _page(
        params,
        startIndex: startIndex,
        limit: limit,
        keep: keep,
        libraryId: libraryId,
      );
    }
    final nulls = total - withRuntime;
    if (nulls <= 0 || withRuntime <= 0) {
      return _page(
        params,
        startIndex: startIndex,
        limit: limit,
        keep: keep,
        libraryId: libraryId,
      );
    }
    final end = limit == null || limit <= 0
        ? total
        : (start + limit).clamp(start, total);
    final raw = <Map<String, dynamic>>[];
    // Titles with a runtime: Silo's [nulls, total).
    if (start < withRuntime) {
      final n = min(end, withRuntime) - start;
      final r = await _fetch(params, nulls + start, n);
      raw.addAll(r.items.take(n));
    }
    // Then those without: Silo's [0, nulls).
    if (end > withRuntime) {
      final from = max(start, withRuntime) - withRuntime;
      final n = end - withRuntime - from;
      final r = await _fetch(params, from, n);
      raw.addAll(r.items.take(n));
    }
    return {
      'Items': _mapPage(raw, keep: keep, libraryId: libraryId),
      'TotalRecordCount': total,
      'StartIndex': start,
    };
  }

  /// How many titles of the query [params] have a runtime, kept for
  /// [_filteredListTtl].
  Future<int> _withRuntimeCount(
    Map<String, Object?> params,
    List<Map<String, Object?>> groups,
  ) {
    final countParams = Map<String, Object?>.of(params)
      ..remove('sort')
      ..['groups'] = jsonEncode([
        ...groups,
        {
          'match': 'all',
          'rules': [
            {'field': 'runtime', 'op': 'gt', 'value': 0},
          ],
        },
      ]);
    return _runtimeCounts.get(
      siloPageSignature(_catalogPath, countParams),
      () => _fetch(countParams, 0, 1).then((r) => r.totalRecordCount),
    );
  }

  late final _runtimeCounts = SiloKeptReads<String, int>(
    lifetime: _filteredListTtl,
    maxKeys: _filteredListMax,
    clock: _clock,
  );

  /// A few titles in random order (`sortBy: Random` with a small `limit`
  /// and no `startIndex`: a genre card's artwork, a row of random titles,
  /// the shuffle picker). Silo's catalog refuses `sort=random`, so they are
  /// drawn from pages of [_randomPool] titles picked at random across the
  /// whole list (in Silo's default order): one page per five titles asked
  /// for, at most [_randomPages], so a genre card's ten titles cost three
  /// reads and the shuffle picker's few more. The first page is read for the
  /// total either way, and it joins the draw only when picked.
  /// A random grid is shuffled whole instead ([_clientFiltered] with
  /// `shuffle`).
  Future<Map<String, dynamic>> _shuffledPage(
    Map<String, Object?> params, {
    int? startIndex,
    int? limit,
    bool Function(Map<String, dynamic> item)? keep,
    String? libraryId,
  }) async {
    final first = await _page(
      params,
      startIndex: 0,
      limit: _randomPool,
      keep: keep,
      libraryId: libraryId,
    );
    final total = first['TotalRecordCount'] as int? ?? 0;
    final pageCount = (total + _randomPool - 1) ~/ _randomPool;
    final picked = ([for (var p = 0; p < pageCount; p++) p]..shuffle(_random))
        .take(((limit ?? _randomPool) / 5).ceil().clamp(1, _randomPages))
        .toList();
    final pages = await Future.wait([
      for (final p in picked)
        p == 0
            ? Future.value(first)
            : _page(
                params,
                startIndex: p * _randomPool,
                limit: _randomPool,
                keep: keep,
                libraryId: libraryId,
              ),
    ]);
    final items = [
      for (final page in pages.isEmpty ? [first] : pages)
        ...(page['Items'] as List).cast<Map<String, dynamic>>(),
    ]..shuffle(_random);
    return {...first, 'Items': items.take(limit ?? items.length).toList()};
  }

  /// A show grid by last played. Silo keeps watches per episode, so its
  /// `date_viewed` sort leaves every show undated. Its watch history
  /// (`source=history`) does list shows, most recently watched first, so:
  /// the shows of the query (read whole, in Silo's default order, filters
  /// applied) ranked by their place in the history, watched shows first and
  /// the rest after them. Ascending is the reverse: never watched first,
  /// then the longest ago.
  Future<List<Map<String, dynamic>>> _showsByLastPlayed(
    Map<String, Object?> params, {
    required bool Function(Map<String, dynamic> item) keep,
    required String? libraryId,
    required bool descending,
  }) async {
    final lists = await Future.wait([
      _readAll(params, keep, libraryId),
      _readAll(
        {
          'source': 'history',
          'library_id': ?libraryId,
          'image_size': siloListImageSize,
        },
        (_) => true,
        null,
      ),
    ]);
    final rank = <String, int>{};
    for (final item in lists[1]) {
      rank.putIfAbsent(item['Id'] as String, () => rank.length);
    }
    final watched = [
      for (final item in lists[0])
        if (rank.containsKey(item['Id'])) item,
    ]..sort((a, b) => rank[a['Id']]!.compareTo(rank[b['Id']]!));
    final unwatched = [
      for (final item in lists[0])
        if (!rank.containsKey(item['Id'])) item,
    ];
    return descending
        ? [...watched, ...unwatched]
        : [...unwatched, ...watched.reversed];
  }

  static const _randomPool = 100;
  static const _randomPages = 4;
  static final _random = Random();

  /// One page of `GET /catalog` with [params], as Jellyfin's
  /// `{Items, TotalRecordCount, StartIndex}`.
  Future<Map<String, dynamic>> _page(
    Map<String, Object?> params, {
    int? startIndex,
    int? limit,
    bool Function(Map<String, dynamic> item)? keep,
    String? libraryId,
  }) async {
    final start = startIndex ?? 0;
    final result = await _fetch(params, start, limit);
    return {
      'Items': _mapPage(result.items, keep: keep, libraryId: libraryId),
      'TotalRecordCount': result.totalRecordCount,
      'StartIndex': start,
    };
  }

  /// Lists filtered by something Silo has no rule for (the series status)
  /// are read whole once, filtered here, and paged from memory, so the grid
  /// gets full pages and an exact total. Filtering each page instead would
  /// hand back short pages counted against the unfiltered total, and the
  /// grid would lose its place.
  ///
  /// The filtered list is kept for [_filteredListTtl], for the grid's next
  /// pages, and [filter] names the client-side filter in the cache key.
  ///
  /// The same read-once list serves orders Silo can't give: [shuffle]
  /// shuffles it (a random grid, again whenever the grid reloads from the
  /// top), and [read] replaces the plain read (a show grid by last played).
  Future<Map<String, dynamic>> _clientFiltered(
    Map<String, Object?> params, {
    required String filter,
    required bool Function(Map<String, dynamic> item) keep,
    int? startIndex,
    int? limit,
    String? libraryId,
    bool shuffle = false,
    Future<List<Map<String, dynamic>>> Function()? read,
  }) async {
    final key = '${siloPageSignature(_catalogPath, params)}#$filter';
    final now = _clock();
    var entry = _filteredLists.remove(key);
    if (entry == null || now.difference(entry.at) > _filteredListTtl) {
      final list = read?.call() ?? _readAll(params, keep, libraryId);
      entry = (
        at: now,
        items: shuffle ? list.then((l) => l..shuffle(_random)) : list,
      );
    } else if (shuffle && (startIndex ?? 0) == 0) {
      // A random grid loading from the top (Random picked again, which
      // flips the direction and reloads, or a refresh) gets a new order, as
      // Jellyfin reshuffles every request. The list isn't read again, and its
      // later pages follow the new order.
      final previous = entry.items;
      entry = (
        at: entry.at,
        items: previous.then((l) => [...l]..shuffle(_random)),
      );
    }
    _filteredLists[key] = entry;
    while (_filteredLists.length > _filteredListMax) {
      _filteredLists.remove(_filteredLists.keys.first);
    }
    final List<Map<String, dynamic>> items;
    try {
      items = await entry.items;
    } catch (_) {
      _filteredLists.remove(key);
      rethrow;
    }
    final start = (startIndex ?? 0).clamp(0, items.length);
    final end = limit == null || limit <= 0
        ? items.length
        : (start + limit).clamp(start, items.length);
    return {
      'Items': [
        for (final item in items.sublist(start, end))
          Map<String, dynamic>.of(item),
      ],
      'TotalRecordCount': items.length,
      'StartIndex': startIndex ?? 0,
    };
  }

  static const _filteredListTtl = Duration(minutes: 2);
  static const _filteredListMax = 4;
  static const _readAllChunk = 1000;
  final LinkedHashMap<
    String,
    ({DateTime at, Future<List<Map<String, dynamic>>> items})
  >
  _filteredLists = LinkedHashMap();

  /// Every item of the query [params] that passes [keep].
  Future<List<Map<String, dynamic>>> _readAll(
    Map<String, Object?> params,
    bool Function(Map<String, dynamic> item) keep,
    String? libraryId,
  ) async {
    final all = <Map<String, dynamic>>[];
    var offset = 0;
    while (true) {
      final result = await _fetch(params, offset, _readAllChunk);
      all.addAll(_mapPage(result.items, keep: keep, libraryId: libraryId));
      offset += result.items.length;
      if (result.items.isEmpty || offset >= result.totalRecordCount) break;
    }
    return all;
  }

  /// Raw items [start] to [start] + [limit] of `GET /catalog` with [params],
  /// through the pager.
  Future<SiloPagedResult> _fetch(
    Map<String, Object?> params,
    int start,
    int? limit,
  ) {
    return pager.page(
      signature: siloPageSignature(_catalogPath, params),
      startIndex: start,
      limit: limit,
      fetch: ({cursor, seek, required limit}) async {
        final response = await _dio.get<dynamic>(
          _catalogPath,
          queryParameters: {
            for (final e in params.entries)
              if (e.value != null) e.key: e.value,
            'limit': limit,
            'cursor': ?cursor,
            'seek': ?seek,
          },
        );
        final json = asJsonMap(response.data);
        if (json == null) {
          throw FormatException(
            'Expected a catalog page from Silo, got '
            '${response.data.runtimeType}',
          );
        }
        return SiloPage.fromJson(json);
      },
    );
  }

  /// Silo catalog items as Jellyfin items, minus those [keep] refuses.
  List<Map<String, dynamic>> _mapPage(
    List<Map<String, dynamic>> raw, {
    bool Function(Map<String, dynamic> item)? keep,
    String? libraryId,
  }) {
    final items = <Map<String, dynamic>>[];
    for (final entry in raw) {
      final item = siloItemToBaseItemDto(entry, images: images);
      if (item == null) continue;
      if (keep != null && !keep(item)) continue;
      _rememberSeries(item);
      if (libraryId != null) {
        _rememberLibrary(item['Id'] as String, libraryId);
        item['ParentId'] ??= libraryId;
      }
      items.add(item);
    }
    return items;
  }

  static Map<String, dynamic> _empty(int? startIndex) => {
    'Items': const <Map<String, dynamic>>[],
    'TotalRecordCount': 0,
    'StartIndex': startIndex ?? 0,
  };

  /// [parentId] when it is a library id (Silo's are plain numbers), else
  /// null.
  static String? _libraryIdOf(String? parentId) {
    if (parentId == null) return null;
    final id = parentId.trim();
    return RegExp(r'^\d+$').hasMatch(id) ? id : null;
  }

  /// One item's page: `GET /catalog/items/{id}` at the detail
  /// artwork size, with its file versions.
  ///
  /// Silo's detail answer embeds `versions` for playable items. When it
  /// doesn't (an older server, a trimmed answer), they are read from
  /// `/catalog/items/{id}/versions` and merged, so `MediaSources` are there
  /// in either case. `mediaSourceId` is sent as `file_id`, which makes that
  /// version the item's effective one.
  ///
  /// A library id answers the library's view from the libraries list.
  /// `fields` is ignored: Silo has no field selection, and the detail
  /// answer is always whole.
  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    final library = _libraryIdOf(itemId);
    if (library != null) {
      // Library and person ids are both numbers: a library the profile can
      // see, else a person.
      try {
        return await _library(library);
      } on StateError {
        return _person(library);
      }
    }
    if (siloTypeOfId(itemId) == 'season') return _season(itemId);
    if (siloGenreNameOf(itemId) case final genre?) {
      return siloNamedItem(genre, studio: false);
    }
    if (siloStudioNameOf(itemId) case final studio?) {
      return siloNamedItem(studio, studio: true);
    }
    if (parseSiloCollectionId(itemId) != null) return _collection(itemId);

    final json = await detailJson(itemId, mediaSourceId: mediaSourceId);
    final item = siloItemToBaseItemDto(json, images: images);
    if (item == null) {
      throw StateError('Silo item $itemId has a type Moonfin cannot show');
    }
    _rememberSeries(item);
    return _withKnownLibrary(item);
  }

  /// [itemId]'s detail as Silo answers it (`GET /catalog/items/{id}`, its
  /// versions merged in), a copy of its own to change.
  ///
  /// A detail page asks for the same title several times as it loads (the
  /// page, its trailers, its extras, its theme songs, the media info), so a
  /// read is kept for [_listReadLifetime] and shared, until anything about
  /// the catalog or the profile's user data changes ([noteCatalogChanged]).
  Future<Map<String, dynamic>> detailJson(
    String itemId, {
    String? mediaSourceId,
  }) async => _copyJson(
    await _details.get(
      '$itemId#${mediaSourceId ?? ''}',
      () => _readDetail(itemId, mediaSourceId),
    ),
  );

  Future<Map<String, dynamic>> _readDetail(
    String itemId,
    String? mediaSourceId,
  ) async {
    final path = '/api/v2/catalog/items/${Uri.encodeComponent(itemId)}';
    final query = {
      'image_size': siloDetailImageSize,
      'file_id': ?mediaSourceId,
    };
    final response = await _dio.get<dynamic>(path, queryParameters: query);
    final json = asJsonMap(response.data);
    if (json == null) {
      throw FormatException(
        'Expected an item from Silo, got ${response.data.runtimeType}',
      );
    }
    final type = siloItemTypeOf(json['type'] ?? siloTypeOfId(itemId));
    if (type != null && !type.isFolder && json['versions'] is! List) {
      final versions = await _dio.get<dynamic>(
        '$path/versions',
        queryParameters: query,
      );
      final list = asJsonMap(versions.data)?['items'];
      if (list is List) json['versions'] = list;
    }
    return json;
  }

  /// How long a title's detail, a series' seasons and a season's episodes
  /// are reused: long enough for one page's requests to share a read, short
  /// enough that a change elsewhere shows on the next visit.
  static const _listReadLifetime = Duration(seconds: 10);

  late final _details = SiloKeptReads<String, Map<String, dynamic>>(
    lifetime: _listReadLifetime,
    maxKeys: 32,
    clock: _clock,
  );
  late final _seasonLists = SiloKeptReads<String, List<Map<String, dynamic>>>(
    lifetime: _listReadLifetime,
    maxKeys: 16,
    clock: _clock,
  );
  late final _episodeLists = SiloKeptReads<String, List<Map<String, dynamic>>>(
    lifetime: _listReadLifetime,
    maxKeys: 32,
    clock: _clock,
  );

  /// A copy of a kept JSON object, so a caller never changes what is kept.
  static Map<String, dynamic> _copyJson(Map<String, dynamic> json) =>
      json.map((key, value) => MapEntry(key, _copyValue(value)));

  static List<Map<String, dynamic>> _copyList(
    List<Map<String, dynamic>> list,
  ) => [for (final json in list) _copyJson(json)];

  static Object? _copyValue(Object? value) => switch (value) {
    final Map map => _copyJson(map.cast<String, dynamic>()),
    final List list => [for (final v in list) _copyValue(v)],
    _ => value,
  };

  /// A list answer's `items`, each a JSON object.
  static List<Map<String, dynamic>> _itemsOf(Response<dynamic> response) {
    final raw = asJsonMap(response.data)?['items'];
    return [
      if (raw is List)
        for (final entry in raw)
          if (asJsonMap(entry) case final json?) json,
    ];
  }

  Future<Map<String, dynamic>> _library(String libraryId) async {
    final views = await userViews?.call().getUserViews(includeHidden: true);
    final items = (views?['Items'] as List?) ?? const [];
    for (final view in items) {
      if (view is Map && view['Id'] == libraryId) {
        return view.cast<String, dynamic>();
      }
    }
    throw StateError('Silo library $libraryId is not visible to this profile');
  }

  /// Several items by id, in the order asked. Silo has no "these ids"
  /// list query, so each is its own detail read, six at a time, and ids it
  /// doesn't know are left out.
  ///
  /// When only user data is asked for ([userDataOnly], the refresh after a
  /// change), a season's episodes come from one read of the
  /// season's list and seasons from their series' list, which carry the
  /// same watched state, instead of a detail read each.
  Future<Map<String, dynamic>> _byIds(
    List<String> ids, {
    int? startIndex,
    int? limit,
    bool userDataOnly = false,
  }) async {
    final start = startIndex ?? 0;
    final wanted = ids.skip(start).take(limit ?? ids.length).toList();
    final found = userDataOnly
        ? await _fromLists(wanted)
        : <String, Map<String, dynamic>>{};
    final rest = [
      for (final id in wanted)
        if (!found.containsKey(id)) id,
    ];
    for (var i = 0; i < rest.length; i += 6) {
      await Future.wait([
        for (final id in rest.skip(i).take(6))
          () async {
            try {
              found[id] = await getItem(id);
            } catch (_) {
              // Unknown to Silo, or not visible to this profile: left out.
            }
          }(),
      ]);
    }
    return {
      'Items': [for (final id in wanted) ?found[id]],
      'TotalRecordCount': ids.length,
      'StartIndex': start,
    };
  }

  /// Of [ids], the episodes (two or more of a season) and seasons that their
  /// season's or series' list answers, by id.
  Future<Map<String, Map<String, dynamic>>> _fromLists(List<String> ids) async {
    final episodesBySeason = <String, int>{};
    final seriesOfSeasons = <String>{};
    for (final id in ids) {
      if (parseSiloEpisodeId(id) case final e?) {
        final season = siloSeasonId(e.seriesId, e.seasonNumber);
        if (season != null) {
          episodesBySeason[season] = (episodesBySeason[season] ?? 0) + 1;
        }
      } else if (parseSiloSeasonId(id) case final season?) {
        seriesOfSeasons.add(season.seriesId);
      }
    }
    final lists = await Future.wait([
      for (final MapEntry(key: season, value: count)
          in episodesBySeason.entries)
        if (count > 1)
          getEpisodes(season, seasonId: season).then(
            (page) => page['Items'] as List,
            onError: (Object _) => const [],
          ),
      for (final series in seriesOfSeasons)
        getSeasons(series).then(
          (page) => page['Items'] as List,
          onError: (Object _) => const [],
        ),
    ]);
    final wanted = ids.toSet();
    return {
      for (final list in lists)
        for (final item in list.cast<Map<String, dynamic>>())
          if (item['Id'] case final String id when wanted.contains(id))
            id: item,
    };
  }

  /// Which library each item was last listed in. Silo's item answers don't
  /// name their library, so the grid's `parentId` is remembered here for
  /// `ParentId` and the ancestors.
  final Map<String, String> _libraryOfItem = {};

  void _rememberLibrary(String itemId, String libraryId) {
    _libraryOfItem.remove(itemId);
    _libraryOfItem[itemId] = libraryId;
    if (_libraryOfItem.length > 5000) {
      _libraryOfItem.remove(_libraryOfItem.keys.first);
    }
  }

  /// The library [itemId] was listed in, if any.
  String? libraryOf(String itemId) => _libraryOfItem[itemId];

  Map<String, dynamic> _withKnownLibrary(Map<String, dynamic> item) {
    final id = item['Id'] as String?;
    final library = id == null ? null : _libraryOfItem[id];
    if (library != null && item['ParentId'] == null) item['ParentId'] = library;
    return item;
  }

  /// Series titles seen in item answers, for the season and episode list
  /// entries that don't repeat them (`SeriesName`).
  final Map<String, String> _seriesNames = {};

  void _rememberSeries(Map<String, dynamic> item) {
    if (item['Type'] == 'Series' && item['Id'] is String) {
      _seriesNames[item['Id'] as String] = item['Name'] as String? ?? '';
    }
  }

  SiloSeriesRef _seriesRef(String seriesId) =>
      SiloSeriesRef(id: seriesId, name: _seriesNames[seriesId]);

  /// A series' seasons: `GET /catalog/series/{id}/seasons`, with
  /// their posters (`include_artwork`), in Silo's order (specials first when
  /// the series has them, as on Emby).
  ///
  /// Season entries carry no type and no series fields, so they're mapped as
  /// seasons of [seriesId]. The series' artwork fills their parent fields
  /// once the series itself has been read.
  @override
  Future<Map<String, dynamic>> getSeasons(
    String seriesId, {
    String? fields,
  }) async {
    final raw = _copyList(
      await _seasonLists.get(
        seriesId,
        () async => _itemsOf(
          await _dio.get<dynamic>(
            '/api/v2/catalog/series/${Uri.encodeComponent(seriesId)}/seasons',
            queryParameters: {
              'image_size': siloListImageSize,
              'include_artwork': true,
            },
          ),
        ),
      ),
    );
    final series = _seriesRef(seriesId);
    final seasons = <Map<String, dynamic>>[
      for (final season in raw)
        if (siloItemToBaseItemDto(
              season,
              images: images,
              type: 'season',
              series: series,
            )
            case final mapped?)
          mapped,
    ];
    return {
      'Items': seasons,
      'TotalRecordCount': seasons.length,
      'StartIndex': 0,
    };
  }

  /// A season by id, from its series' season list: the list carries what a
  /// season page shows, and Silo's item endpoint is for titles.
  Future<Map<String, dynamic>> _season(String seasonId) async {
    final parsed = parseSiloSeasonId(seasonId);
    if (parsed == null) {
      throw StateError('$seasonId is not a Silo season id');
    }
    final seasons = await getSeasons(parsed.seriesId);
    for (final season in (seasons['Items'] as List).cast<Map>()) {
      if (season['Id'] == seasonId) return season.cast<String, dynamic>();
    }
    throw StateError('Silo has no season $seasonId');
  }

  /// A season's episodes, or every episode of the series.
  ///
  /// With a `seasonId`: `GET /catalog/items/{season_id}/episodes`, the call
  /// Silo's own web app uses. Without one: every season's episodes in season
  /// order, read four seasons at a time. Episode entries carry no type and
  /// no series fields, so they're mapped as episodes of [seriesId]. Each
  /// carries a lightweight `MediaSources` entry from its `files` for the
  /// quality badges.
  @override
  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  }) async {
    final series = _seriesRef(
      siloTypeOfId(seriesId) == 'series'
          ? seriesId
          : parseSiloSeasonId(seasonId ?? seriesId)?.seriesId ?? seriesId,
    );
    final List<Map<String, dynamic>> episodes;
    if (seasonId != null || siloTypeOfId(seriesId) == 'season') {
      episodes = await _seasonEpisodes(seasonId ?? seriesId, series);
    } else {
      final seasons = (await getSeasons(series.id))['Items'] as List;
      final ids = [
        for (final season in seasons.cast<Map>()) season['Id'] as String,
      ];
      episodes = [];
      for (var i = 0; i < ids.length; i += 4) {
        final batch = await Future.wait([
          for (final id in ids.skip(i).take(4)) _seasonEpisodes(id, series),
        ]);
        for (final list in batch) {
          episodes.addAll(list);
        }
      }
    }
    return {
      'Items': episodes,
      'TotalRecordCount': episodes.length,
      'StartIndex': 0,
    };
  }

  /// A series' episodes for an item query with the series as parent and
  /// episodes as the type: every season's, in Silo's order (season, then
  /// episode), `IsPlayed`/`IsUnplayed` applied, then sliced. The sort asked
  /// for is ignored: Moonfin asks this for "the first episode" or "any
  /// unwatched one", and the natural order answers both.
  Future<Map<String, dynamic>> _seriesEpisodes(
    String seriesId, {
    List<String>? filters,
    int? startIndex,
    int? limit,
  }) async {
    final flags = {
      for (final f in filters ?? const <String>[]) f.toLowerCase(),
    };
    final all = (await getEpisodes(seriesId))['Items'] as List;
    final episodes = [
      for (final e in all.cast<Map<String, dynamic>>())
        if (_matchesPlayedFilter(e, flags)) e,
    ];
    return _slice(episodes, startIndex: startIndex, limit: limit);
  }

  static bool _matchesPlayedFilter(
    Map<String, dynamic> item,
    Set<String> flags,
  ) {
    final played = (item['UserData'] as Map?)?['Played'] == true;
    if (flags.contains('isplayed') && !played) return false;
    if (flags.contains('isunplayed') && played) return false;
    return true;
  }

  Future<List<Map<String, dynamic>>> _seasonEpisodes(
    String seasonId,
    SiloSeriesRef series,
  ) async {
    final raw = _copyList(
      await _episodeLists.get(
        seasonId,
        () async => _itemsOf(
          await _dio.get<dynamic>(
            '/api/v2/catalog/items/${Uri.encodeComponent(seasonId)}/episodes',
            queryParameters: {'image_size': siloListImageSize},
          ),
        ),
      ),
    );
    return [
      for (final episode in raw)
        if (siloItemToBaseItemDto(
              episode,
              images: images,
              type: 'episode',
              series: series,
            )
            case final mapped?)
          mapped,
    ];
  }

  /// An item's parents, nearest first, as Jellyfin lists them: an episode's
  /// season, series and library, a season's series and library, and a
  /// film's or series' library.
  ///
  /// Silo has no ancestors call, and needs none: the parents are in the ids
  /// (`episode-<key>-<s>-<e>`, `season-<key>-<s>`, `series-<key>`).
  /// Names come from what this session has read (series titles), and
  /// a season is named "Season <n>" ("Specials" for 0). The library is the
  /// one the item, or its series, was listed in, and is left out when
  /// unknown. No request is made.
  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async {
    String? seriesId;
    final ancestors = <Map<String, dynamic>>[];
    final episode = parseSiloEpisodeId(itemId);
    final season = parseSiloSeasonId(itemId);
    if (episode != null) {
      seriesId = episode.seriesId;
      final seasonId = siloSeasonId(seriesId, episode.seasonNumber);
      if (seasonId != null) {
        ancestors.add(_seasonStub(seasonId, episode.seasonNumber, seriesId));
      }
    } else if (season != null) {
      seriesId = season.seriesId;
    }
    if (seriesId != null) {
      ancestors.add({
        'Id': seriesId,
        'Name': _seriesNames[seriesId] ?? '',
        'Type': 'Series',
        'IsFolder': true,
      });
    }
    final library =
        _libraryOfItem[itemId] ??
        (seriesId == null ? null : _libraryOfItem[seriesId]);
    if (library != null) {
      ancestors.add({
        'Id': library,
        'Name': await _libraryName(library),
        'Type': 'CollectionFolder',
        'IsFolder': true,
      });
    }
    // The personal collections holding the item, which is what
    // Moonfin's detail page looks for among the ancestors.
    try {
      ancestors.addAll(await _personalCollections(containing: itemId));
    } catch (_) {}
    return ancestors;
  }

  Map<String, dynamic> _seasonStub(
    String seasonId,
    int number,
    String seriesId,
  ) => {
    'Id': seasonId,
    'Name': number == 0 ? 'Specials' : 'Season $number',
    'Type': 'Season',
    'IsFolder': true,
    'IndexNumber': number,
    'SeriesId': seriesId,
    'SeriesName': ?_seriesNames[seriesId],
  };

  Future<String> _libraryName(String libraryId) async {
    try {
      return (await _library(libraryId))['Name'] as String? ?? '';
    } catch (_) {
      return '';
    }
  }

  /// The filter values a library holds: `GET /catalog/filters`
  /// with its `library_id` and type scope.
  @override
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  }) async {
    final types = siloTypesForQuery(includeItemTypes: includeItemTypes);
    final scope = types == null || types.isEmpty
        ? null
        : siloCatalogScopeFor(types);
    final response = await _dio.get<dynamic>(
      '/api/v2/catalog/filters',
      queryParameters: {'library_id': ?_libraryIdOf(parentId), 'type': ?scope},
    );
    final json = asJsonMap(response.data);
    return json == null
        ? QueryFilterValues.empty
        : siloFiltersToQueryFilterValues(json);
  }

  /// Jellyfin's `NameStartsWith` as Silo's `name_prefix`. Both
  /// match the start of the sort title. Moonfin's `#` bucket (titles not
  /// starting with a letter) has no prefix equivalent and is left out.
  static String? _namePrefix(String? nameStartsWith) {
    final prefix = nameStartsWith?.trim();
    if (prefix == null || prefix.isEmpty || prefix == '#') return null;
    return prefix;
  }

  /// The last name-sorted catalog query read for each parent, for
  /// [letterPosition]. Any other query for that parent forgets it.
  final Map<
    String,
    ({
      String? libraryId,
      String? scope,
      List<Map<String, Object?>> groups,
      bool descending,
    })
  >
  _titleQueries = {};

  void _rememberTitleQuery(
    String? parentId, {
    required String? sort,
    required bool plainCatalog,
    required String? libraryId,
    required String? scope,
    required List<Map<String, Object?>> groups,
  }) {
    if (parentId == null) return;
    if (!plainCatalog || (sort != 'title' && sort != '-title')) {
      _titleQueries.remove(parentId);
      return;
    }
    _titleQueries[parentId] = (
      libraryId: libraryId,
      scope: scope,
      groups: groups,
      descending: sort == '-title',
    );
  }

  /// Where [letter]'s titles start in the list last read for [parentId],
  /// from Silo's letter index for the same library, scope and filters. Null
  /// when that list wasn't sorted by name, or Silo files no title under the
  /// letter. Positions count Silo's whole result, so the app loads up to it
  /// and then finds the letter among what it has.
  @override
  Future<int?> letterPosition(String letter, {required String parentId}) async {
    final query = _titleQueries[parentId];
    if (query == null) return null;
    final index = await _letterIndex(
      libraryId: query.libraryId,
      scope: query.scope,
      groups: query.groups,
      descending: query.descending,
    );
    return index.positionOf(letter);
  }

  /// Silo's letter index for a title-ordered list (`POST /catalog/letters`):
  /// which letters have titles, how many, and where each starts. A position
  /// sent as `seek` with the list's window cursor loads that letter's
  /// window directly.
  ///
  /// Moonfin's jump bar asks [letterPosition], which reads this for the
  /// list on screen.
  Future<SiloLetterIndex> letters({
    String? libraryId,
    List<String>? includeItemTypes,
    bool descending = false,
  }) async {
    final types = siloTypesForQuery(includeItemTypes: includeItemTypes);
    final scope = types == null || types.isEmpty
        ? null
        : siloCatalogScopeFor(types);
    return _letterIndex(
      libraryId: libraryId,
      scope: scope,
      groups: const [],
      descending: descending,
    );
  }

  Future<SiloLetterIndex> _letterIndex({
    required String? libraryId,
    required String? scope,
    required List<Map<String, Object?>> groups,
    required bool descending,
  }) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/catalog/letters',
      data: {
        'library_id': ?libraryId,
        'type': ?scope,
        if (groups.isNotEmpty) 'groups': groups,
        'order': descending ? 'desc' : 'asc',
      },
    );
    return SiloLetterIndex.fromJson(
      asJsonMap(response.data) ?? const <String, dynamic>{},
    );
  }

  /// The genres of a library, or of the whole catalog, as Jellyfin `Genre`
  /// items with synthetic ids, from `GET /catalog/filters`.
  /// Silo lists genre names only: no counts and no artwork, so Moonfin
  /// keeps every genre and builds its cards from the genre's titles.
  /// `startIndex`/`limit` slice the list.
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
    final values = await getQueryFilters(
      parentId: parentId,
      includeItemTypes: includeItemTypes,
    );
    return _namedList(
      values.genres,
      studio: false,
      descending: sortOrder?.toLowerCase() == 'descending',
      startIndex: startIndex,
      limit: limit,
    );
  }

  static Map<String, dynamic> _namedList(
    Iterable<String> names, {
    required bool studio,
    bool descending = false,
    int? startIndex,
    int? limit,
  }) {
    final sorted = {...names}.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    final ordered = descending ? sorted.reversed.toList() : sorted;
    final start = startIndex ?? 0;
    final page = ordered.skip(start).take(limit ?? ordered.length);
    return {
      'Items': [for (final n in page) siloNamedItem(n, studio: studio)],
      'TotalRecordCount': ordered.length,
      'StartIndex': start,
    };
  }

  /// The studios of a library, or of the whole catalog, as Jellyfin `Studio`
  /// items with synthetic ids: Silo's studios and networks
  /// together, as Moonfin shows a series' network as its studio. Same shape
  /// and rules as [getGenres].
  @override
  Future<Map<String, dynamic>> getStudios({
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
    final types = siloTypesForQuery(includeItemTypes: includeItemTypes);
    final scope = types == null || types.isEmpty
        ? null
        : siloCatalogScopeFor(types);
    final response = await _dio.get<dynamic>(
      '/api/v2/catalog/filters',
      queryParameters: {
        'library_id': ?_libraryIdOf(parentId),
        'type': ?scope,
        'skip_technical': true,
      },
    );
    final json = asJsonMap(response.data) ?? const <String, dynamic>{};
    final names = [
      for (final key in const ['networks', 'studios'])
        if (json[key] case final List list)
          for (final n in list) ?jsonText(n),
    ];
    return _namedList(
      names,
      studio: true,
      descending: sortOrder?.toLowerCase() == 'descending',
      startIndex: startIndex,
      limit: limit,
    );
  }

  /// A person's page: `GET /catalog/people/{id}` as a Jellyfin
  /// `Person` item, its photo registered. Their titles are
  /// `getItems(personIds: [id])`, which pages Silo's `source=person`.
  Future<Map<String, dynamic>> _person(String personId) async {
    final response = await _dio.get<dynamic>(
      '/api/v2/catalog/people/${Uri.encodeComponent(personId)}',
    );
    final json = asJsonMap(response.data);
    if (json == null) {
      throw FormatException(
        'Expected a person from Silo, got ${response.data.runtimeType}',
      );
    }
    return siloPersonToBaseItemDto(json, images: images);
  }

  /// People by name: `GET /catalog/people?q=`, Silo's people
  /// search (each word must start a word of the name, exact matches first),
  /// as Jellyfin `Person` items with their photos registered.
  ///
  /// - Credits are limited to what Moonfin shows (`media_scope`): films,
  ///   series and episodes (`video_with_episodes`) when the search
  ///   capabilities offer that scope, else films and series (`video`), and
  ///   none when Silo takes no scope.
  /// - Nothing is asked when the capabilities say search isn't available.
  /// - `limit` is capped at Silo's 100, and none asks for Silo's default (20).
  /// - A blank `searchTerm` lists the first people, as on Jellyfin.
  /// - `fields` and `enableImageTypes` are ignored: a person always comes
  ///   whole, photo included.
  @override
  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  }) async {
    final search = await searchCapabilities();
    if (!search.canSearch) return _empty(0);
    final response = await _dio.get<dynamic>(
      '/api/v2/catalog/people',
      queryParameters: {
        'q': ?_searchTextOf(searchTerm),
        'limit': ?(limit == null || limit <= 0 ? null : limit.clamp(1, 100)),
        if (search.peopleMediaScope)
          'media_scope': search.videoWithEpisodes
              ? 'video_with_episodes'
              : 'video',
      },
    );
    final raw = asJsonMap(response.data)?['items'];
    final people = [
      if (raw is List)
        for (final entry in raw)
          if (asJsonMap(entry) case final json?)
            if (siloIdOf(json['id']) != null)
              siloPersonToBaseItemDto(json, images: images),
    ];
    return {
      'Items': people,
      'TotalRecordCount': people.length,
      'StartIndex': 0,
    };
  }

  /// Whether a query asks for collections only: `BoxSet` and nothing else
  /// Silo can list (a library grid that groups collections asks for
  /// `Movie, BoxSet` and gets the films).
  static bool _asksForCollections(List<String>? includeItemTypes) {
    if (includeItemTypes == null) return false;
    final lower = includeItemTypes.map((t) => t.toLowerCase()).toSet();
    if (!lower.contains('boxset')) return false;
    final others = siloTypesForQuery(includeItemTypes: includeItemTypes);
    return others == null || others.isEmpty;
  }

  /// Collections as Jellyfin `BoxSet`s: a library's curated collections
  /// (`GET /library/{id}/collections`) when [libraryId] is given, else every
  /// collection the profile can see: its personal ones
  /// (`GET /collections`) and those of each library it shows, as Emby lists
  /// every collection for Home's Collections row.
  ///
  /// Silo returns each list in its own order. A name sort is applied here
  /// (the rows' usual `SortName`), and any other sort keeps that order.
  Future<Map<String, dynamic>> _collections({
    String? libraryId,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
  }) async {
    final all = libraryId == null
        ? [...await _personalCollections(), ...await _everyLibraryCollections()]
        : await _libraryCollections(libraryId);
    final first = sortBy?.split(',').first.trim().toLowerCase();
    if (first == 'sortname' || first == 'name') {
      int byName(Map<String, dynamic> a, Map<String, dynamic> b) =>
          (a['Name'] as String? ?? '').toLowerCase().compareTo(
            (b['Name'] as String? ?? '').toLowerCase(),
          );
      final descending =
          sortOrder?.split(',').first.trim().toLowerCase() == 'descending';
      all.sort(descending ? (a, b) => byName(b, a) : byName);
    }
    final start = startIndex ?? 0;
    return {
      'Items': all.skip(start).take(limit ?? all.length).toList(),
      'TotalRecordCount': all.length,
      'StartIndex': start,
    };
  }

  Future<List<Map<String, dynamic>>> _personalCollections({
    String? containing,
  }) async {
    final response = await _dio.get<dynamic>(
      '/api/v2/collections',
      queryParameters: {'contains_item': ?containing},
    );
    final raw = asJsonMap(response.data)?['items'];
    return [
      if (raw is List)
        for (final c in raw)
          if (asJsonMap(c) case final json?)
            if (containing == null || json['contains'] == true)
              if (siloCollectionToBoxSet(json, images: images) case final box?)
                box,
    ];
  }

  /// The curated collections of every library the profile shows (hidden
  /// libraries left out), read together. A library whose list can't be
  /// read is skipped, and so is the lot when the library list can't be.
  Future<List<Map<String, dynamic>>> _everyLibraryCollections() async {
    Map<String, dynamic>? views;
    try {
      views = await userViews?.call().getUserViews();
    } catch (_) {
      return const [];
    }
    final ids = [
      for (final view in (views?['Items'] as List?) ?? const [])
        if (view is Map && view['Id'] is String) view['Id'] as String,
    ];
    final lists = await Future.wait([
      for (final id in ids)
        _libraryCollections(id).then<List<Map<String, dynamic>>>(
          (list) => list,
          onError: (Object _) => const <Map<String, dynamic>>[],
        ),
    ]);
    return [for (final list in lists) ...list];
  }

  Future<List<Map<String, dynamic>>> _libraryCollections(
    String libraryId,
  ) async {
    final response = await _dio.get<dynamic>(
      '/api/v2/library/${Uri.encodeComponent(libraryId)}/collections',
    );
    final raw = asJsonMap(response.data)?['collections'];
    return [
      if (raw is List)
        for (final c in raw)
          if (asJsonMap(c) case final json?)
            if (siloCollectionToBoxSet(
                  json,
                  libraryId: libraryId,
                  images: images,
                )
                case final box?)
              box,
    ];
  }

  /// The profile's own manual collections, by name: the ones Silo lets it
  /// add to and remove from (`GET /collections`, kept by
  /// [canEditCollection]). Like Silo's web app, nothing is listed while the
  /// acting profile isn't known.
  @override
  Future<List<Map<String, dynamic>>> getEditableCollections() async {
    final own = [
      for (final box in await _personalCollections())
        if (canEditCollection(box)) box,
    ];
    own.sort(
      (a, b) => (a['Name'] as String? ?? '').toLowerCase().compareTo(
        (b['Name'] as String? ?? '').toLowerCase(),
      ),
    );
    return own;
  }

  /// Silo's rule, as its web app applies it: a personal collection
  /// (`silo-collection:`) that is `manual` (smart and imported ones fill
  /// themselves) and that the acting profile created. A library's
  /// collections are the administrator's, and another profile's shared one
  /// is read-only.
  @override
  bool canEditCollection(Map<String, dynamic> collection) {
    final id = collection['Id'];
    final parsed = id is String ? parseSiloCollectionId(id) : null;
    if (parsed == null || parsed.libraryId != null) return false;
    final silo = asJsonMap(collection[siloOriginalKey]);
    final me = profileId?.call();
    return silo != null &&
        me != null &&
        silo['collection_type'] == 'manual' &&
        silo['creator_profile_id'] == me;
  }

  /// `POST /collections` with the name: a manual collection for the acting
  /// profile, private to it (Silo's default), then [itemIds] added. Answers
  /// the new collection as a `BoxSet` (the add-to-collection dialog reads its
  /// `Id`).
  ///
  /// Not idempotent on Silo: a retry after a lost answer makes a second
  /// collection, so it is sent once.
  @override
  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/collections',
      data: {'name': name.trim(), 'collection_type': 'manual'},
    );
    final json = asJsonMap(response.data);
    final box = json == null
        ? null
        : siloCollectionToBoxSet(json, images: images);
    if (box == null) {
      throw FormatException(
        'Expected the new collection from Silo, got '
        '${response.data.runtimeType}',
      );
    }
    noteUserDataChanged();
    if (itemIds != null && itemIds.isNotEmpty) {
      await addToCollection(box['Id'] as String, itemIds);
    }
    return box;
  }

  /// `PUT /collections/{id}/items/{item_id}` for each title, at position 0
  /// as Silo's web app adds them. A title already there stays where it is.
  @override
  Future<void> addToCollection(String collectionId, List<String> itemIds) =>
      _editCollection(collectionId, itemIds, (path) {
        return _dio.put<void>(path, data: {'position': 0});
      });

  /// `DELETE /collections/{id}/items/{item_id}` for each title.
  @override
  Future<void> removeFromCollection(
    String collectionId,
    List<String> itemIds,
  ) => _editCollection(collectionId, itemIds, _dio.delete<void>);

  /// One request per title, in turn (Silo has no batch membership change),
  /// stopping at the first Silo refuses. Only a personal collection can be
  /// edited here: a library collection is refused before any request.
  Future<void> _editCollection(
    String collectionId,
    List<String> itemIds,
    Future<void> Function(String path) send,
  ) async {
    final parsed = parseSiloCollectionId(collectionId);
    if (parsed == null || parsed.libraryId != null) {
      throw UnsupportedError(
        'Only your own collections can be changed on Silo; '
        '$collectionId is a library\'s',
      );
    }
    final collection = Uri.encodeComponent(parsed.id);
    try {
      for (final itemId in itemIds) {
        await send(
          '/api/v2/collections/$collection/items/'
          '${Uri.encodeComponent(itemId)}',
        );
      }
    } finally {
      noteUserDataChanged();
    }
  }

  /// A collection's page: found in its list (Silo has no single-collection
  /// read for a viewer).
  Future<Map<String, dynamic>> _collection(String collectionId) async {
    final parsed = parseSiloCollectionId(collectionId)!;
    final list = parsed.libraryId == null
        ? await _personalCollections()
        : await _libraryCollections(parsed.libraryId!);
    for (final box in list) {
      if (box['Id'] == collectionId) return box;
    }
    throw StateError('Silo has no collection $collectionId for this profile');
  }

  /// "More like this": `GET /recommendations/similar/{id}`,
  /// Silo's own recommendations for the title, mapped like a grid.
  /// `bypass` (Moonfin's cache-buster) has nothing to bypass on Silo.
  @override
  Future<Map<String, dynamic>> getSimilarItems(
    String itemId, {
    int? limit,
    String? bypass,
  }) async {
    final response = await _dio.get<dynamic>(
      '/api/v2/recommendations/similar/${Uri.encodeComponent(itemId)}',
      queryParameters: {'limit': ?limit},
    );
    final raw = asJsonMap(response.data)?['items'];
    final items = <Map<String, dynamic>>[
      if (raw is List)
        for (final entry in raw)
          if (asJsonMap(entry) case final json?)
            if (siloItemToBaseItemDto(json, images: images) case final item?)
              if (siloSupportedTypes.contains(json['type'])) item,
    ];
    for (final item in items) {
      _rememberSeries(item);
    }
    return {'Items': items, 'TotalRecordCount': items.length, 'StartIndex': 0};
  }

  /// The title's local trailers and teasers, from its detail's
  /// `extras`. Remote (YouTube) trailers are the item's `RemoteTrailers`.
  /// None while Moonfin can't play them ([siloLocalTrailersPlayable]), so
  /// the trailer button opens the YouTube trailer instead.
  @override
  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId) async {
    if (!siloLocalTrailersPlayable) return const [];
    return _extras(itemId, trailers: true);
  }

  /// The title's other local extras: featurettes, clips, behind the scenes,
  /// bloopers, deleted scenes.
  @override
  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId) =>
      _extras(itemId, trailers: false);

  /// Silo plays no intros before a title.
  @override
  Future<List<Map<String, dynamic>>> getIntros(String itemId) async => const [];

  Future<List<Map<String, dynamic>>> _extras(
    String itemId, {
    required bool trailers,
  }) async {
    final item = await getItem(itemId);
    final detail = asJsonMap(item[siloOriginalKey]);
    if (detail == null) return const [];
    return siloExtrasOf(detail, trailers: trailers, ownerId: itemId);
  }

  /// The search text of a `searchTerm`, or null for none (blank).
  static String? _searchTextOf(String? searchTerm) {
    final text = searchTerm?.trim();
    return text == null || text.isEmpty ? null : text;
  }

  static const _searchCapabilitiesTtl = Duration(minutes: 10);
  late final _searchCapabilities =
      SiloKeptReads<String, SiloSearchCapabilities>(
        lifetime: _searchCapabilitiesTtl,
        clock: _clock,
      );

  /// What Silo says about search for this profile
  /// (`GET /catalog/search/capabilities`), read once and kept for
  /// [_searchCapabilitiesTtl].
  ///
  /// When the document can't be read (an error, an older server), searches
  /// go ahead without the optional scopes ([SiloSearchCapabilities.unknown])
  /// and it is read again next time.
  Future<SiloSearchCapabilities> searchCapabilities() => _searchCapabilities
      .get('capabilities', _readSearchCapabilities)
      .catchError((Object _) => SiloSearchCapabilities.unknown);

  Future<SiloSearchCapabilities> _readSearchCapabilities() async {
    final response = await _dio.get<dynamic>(
      '/api/v2/catalog/search/capabilities',
    );
    final json = asJsonMap(response.data);
    if (json == null) {
      throw FormatException(
        'Expected search capabilities from Silo, got '
        '${response.data.runtimeType}',
      );
    }
    return SiloSearchCapabilities.fromJson(json);
  }

  /// Called after every user-data write this client makes (favorite,
  /// played, rating, collection membership, a hidden card), and for each
  /// change Silo's events report from elsewhere. Forgets the reads
  /// that may now be out of date, so the rows Moonfin reloads show the
  /// change: Home's and the libraries' sections (Continue Watching, Next Up,
  /// Silo's own rows, kept 5 s), the read-once lists (2 min), the runtime
  /// counts and the pager's cursors and pages. It also remembers [itemId] for
  /// [userDataMayHaveChanged].
  void noteUserDataChanged([String? itemId]) {
    noteCatalogChanged();
    if (itemId == null || itemId.isEmpty) return;
    final now = _clock();
    _changedItems.remove(itemId);
    _changedItems[itemId] = now;
    if (_seriesOfTitle(itemId) case final series?) {
      _changedSeries.remove(series);
      _changedSeries[series] = now;
    }
    for (final map in [_changedItems, _changedSeries]) {
      while (map.length > _changedMax) {
        map.remove(map.keys.first);
      }
    }
  }

  /// Called when Silo says a library's contents changed (an item's metadata,
  /// a scan), or that this client may have missed such a change (a
  /// reconnect). Forgets the same reads [noteUserDataChanged] does, so the
  /// lists Moonfin reloads show the change, and nothing about user data.
  void noteCatalogChanged() {
    homeSections.clear();
    _details.forget();
    _seasonLists.forget();
    _episodeLists.forget();
    _filteredLists.clear();
    _runtimeCounts.forget();
    pager.clear();
  }

  /// Called when the client starts acting as another household profile:
  /// what this client read belongs to the profile it was read as
  /// (its rows, its libraries' lists, its "hide watched" setting, what it
  /// changed), so all of it is forgotten. The catalog itself is the same.
  void noteProfileChanged() {
    noteCatalogChanged();
    _hideWatched.forget();
    _changedItems.clear();
    _changedSeries.clear();
  }

  /// Of [itemIds], those whose user data may have changed: one this client
  /// changed in the last [_changedTtl], or a season or episode of a show
  /// that had something changed (marking an episode moves the season's and
  /// the show's counts, and marking a show marks every episode).
  ///
  /// Silo has no batch read, so `UserDataSync.refreshFromServer` would
  /// otherwise read every card a screen holds one by one after any change: a
  /// library grid of 300 titles would be 300 detail reads. Changes made on
  /// another device come in through Silo's events, which note them here too.
  @override
  List<String> userDataMayHaveChanged(Iterable<String> itemIds) {
    final cutoff = _clock().subtract(_changedTtl);
    _changedItems.removeWhere((_, at) => at.isBefore(cutoff));
    _changedSeries.removeWhere((_, at) => at.isBefore(cutoff));
    if (_changedItems.isEmpty) return const [];
    return [
      for (final id in itemIds)
        if (_changedItems.containsKey(id) ||
            _changedSeries.containsKey(_seriesOfTitle(id)))
          id,
    ];
  }

  /// The show a series, season or episode id belongs to, or null for
  /// anything else.
  static String? _seriesOfTitle(String id) => switch (siloTypeOfId(id)) {
    'series' => id,
    'season' => parseSiloSeasonId(id)?.seriesId,
    'episode' => parseSiloEpisodeId(id)?.seriesId,
    _ => null,
  };

  static const _changedTtl = Duration(minutes: 10);
  static const _changedMax = 200;
  final LinkedHashMap<String, DateTime> _changedItems = LinkedHashMap();
  final LinkedHashMap<String, DateTime> _changedSeries = LinkedHashMap();

  /// `PUT /home/dismissals/continue_watching/{id}` with the card's
  /// `progress_updated_at`, which Silo requires: the dismissal holds until
  /// the item is played again. An episode drops its whole show from
  /// Continue Watching and Next Up until any episode of it is played.
  ///
  /// A card from Continue Watching carries the time, and one from elsewhere (a
  /// library grid offers the action on anything part way through) is looked
  /// up in Silo's Continue Watching. Throws [StateError] when Silo has no
  /// resume point for it.
  @override
  Future<void> hideFromContinueWatching(Map<String, dynamic> item) async {
    final id = _titleIdOf(item);
    final stamp =
        _progressUpdatedAt(item) ?? await _progressUpdatedAtFromHome(id);
    if (stamp == null) {
      throw StateError('Silo has no resume point for $id to hide');
    }
    await _dio.put<void>(
      '/api/v2/home/dismissals/continue_watching/${Uri.encodeComponent(id)}',
      data: {'progress_updated_at': stamp},
    );
    noteUserDataChanged(id);
  }

  /// `PUT /home/dismissals/next_up/{id}` with the episode's `series_id`,
  /// which Silo requires. The show leaves Next Up and Continue Watching
  /// until one of its episodes is played.
  @override
  Future<void> hideFromNextUp(Map<String, dynamic> item) async {
    final id = _titleIdOf(item);
    final series =
        item['SeriesId'] as String? ?? parseSiloEpisodeId(id)?.seriesId;
    if (series == null || series.isEmpty) {
      throw StateError('$id is not an episode of a show');
    }
    await _dio.put<void>(
      '/api/v2/home/dismissals/next_up/${Uri.encodeComponent(id)}',
      data: {'series_id': series},
    );
    noteUserDataChanged(id);
  }

  static String _titleIdOf(Map<String, dynamic> item) {
    final id = item['Id'];
    if (id is! String || id.isEmpty) {
      throw ArgumentError.value(item, 'item', 'has no Id');
    }
    return id;
  }

  /// The card's own `progress_updated_at` (a Continue Watching card),
  /// as Silo sent it: Silo compares it to the second.
  static String? _progressUpdatedAt(Map<String, dynamic> item) {
    final stamp = asJsonMap(item[siloOriginalKey])?['progress_updated_at'];
    return stamp is String && stamp.isNotEmpty ? stamp : null;
  }

  Future<String?> _progressUpdatedAtFromHome(String id) async {
    final cards = await homeSections.cardsOf('continue_watching') ?? const [];
    for (final card in cards) {
      if (card['content_id'] == id) {
        final stamp = card['progress_updated_at'];
        if (stamp is String && stamp.isNotEmpty) return stamp;
      }
    }
    return null;
  }

  /// The sections of Silo's home and library pages, which the Continue
  /// Watching and Next Up rows read.
  late final SiloHomeSections homeSections = SiloHomeSections(
    _dio,
    clock: _clock,
  );

  /// What Continue Watching can hold: films and episodes. Audiobooks resume
  /// too on Silo, but Moonfin doesn't show them yet.
  static const _resumableTypes = {'movie', 'episode'};

  /// Continue Watching: what the profile is part way through,
  /// most recent first.
  ///
  /// Silo assembles this per profile as the `continue_watching` section of
  /// its home page (or of a library's page, for a library `parentId`), so
  /// the cards come from there: they carry the resume point
  /// (`position_seconds`, `duration_seconds`), skip what the profile
  /// dismissed from the row, and are in Silo's order. By default Silo also
  /// puts each show's next episode in that section (`item_source: next_up`),
  /// and those are left for Next Up.
  ///
  /// A page without the section (the profile removed it in Silo's web app)
  /// falls back to the resume points themselves, `GET /progress?status=
  /// in_progress`, each item read from the catalog. That list doesn't know
  /// about dismissals.
  ///
  /// `includeItemTypes`/`mediaTypes` narrow the row (Audio finds nothing,
  /// with no request) and `startIndex`/`limit` slice it. `fields` and the
  /// image options are ignored, as Silo's cards are always whole.
  @override
  Future<Map<String, dynamic>> getResumeItems({
    String? parentId,
    List<String>? includeItemTypes,
    String? mediaTypes,
    int? startIndex,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
  }) async {
    final types =
        siloTypesForQuery(
          includeItemTypes: includeItemTypes,
          mediaTypes: mediaTypes,
          supported: _resumableTypes,
        ) ??
        _resumableTypes;
    if (types.isEmpty) return _empty(startIndex);
    final libraryId = _libraryIdOf(parentId);
    // Silo resumes titles, not folders: only a library narrows the row.
    if (parentId != null && libraryId == null) return _empty(startIndex);

    final cards = await homeSections.cardsOf(
      'continue_watching',
      libraryId: libraryId,
    );
    final List<Map<String, dynamic>> items;
    if (cards != null) {
      items = [
        for (final card in cards)
          if (card['item_source'] != 'next_up' && types.contains(card['type']))
            if (siloItemToBaseItemDto(card, images: images) case final item?)
              item,
      ];
    } else {
      items = await _resumeFromProgress(
        libraryId: libraryId,
        types: types,
        wanted: (startIndex ?? 0) + (limit ?? 50),
      );
    }
    _rememberRow(items, libraryId);
    return _slice(items, startIndex: startIndex, limit: limit);
  }

  /// Next Up: the next episode of each show the profile is
  /// watching, or of one series.
  ///
  /// - **The row** (no `seriesId`): Silo works these out per profile and, by
  ///   default, puts them in its Continue Watching section as
  ///   `item_source: next_up` cards (its `ui.next_up_mode` setting
  ///   `combined`). With the setting `separate` they come as a `next_up`
  ///   section instead. Both are read from the page (the sections Continue
  ///   Watching reads), so either setting works, and a page with neither
  ///   answers empty. A library `parentId` reads the library's page.
  /// - **One series** (`seriesId`, the series page's "next up"): the series'
  ///   `play_content_id`, the episode Silo's own Play button starts, when it
  ///   is an episode not yet watched.
  ///
  /// `enableResumable: false` leaves out an episode already started (it is
  /// in Continue Watching). `nextUpDateCutoff` is ignored: Silo decides
  /// which shows are current. `startIndex`/`limit` slice the row.
  @override
  Future<Map<String, dynamic>> getNextUp({
    String? seriesId,
    String? parentId,
    int? startIndex,
    int? limit,
    String? fields,
    bool? enableResumable,
    DateTime? nextUpDateCutoff,
    String? enableImageTypes,
    int? imageTypeLimit,
  }) async {
    bool keep(Map<String, dynamic> item) {
      final data = item['UserData'] as Map?;
      if (data?['Played'] == true) return false;
      final position = data?['PlaybackPositionTicks'];
      return enableResumable != false || position is! num || position <= 0;
    }

    if (seriesId != null) {
      final episode = await _seriesNextEpisode(seriesId);
      return _slice(
        [if (episode != null && keep(episode)) episode],
        startIndex: startIndex,
        limit: limit,
      );
    }

    final libraryId = _libraryIdOf(parentId);
    if (parentId != null && libraryId == null) return _empty(startIndex);
    final lists = await Future.wait([
      homeSections.cardsOf('continue_watching', libraryId: libraryId),
      homeSections.cardsOf('next_up', libraryId: libraryId),
    ]);
    final seen = <String>{};
    final items = [
      for (final card in [
        for (final c in lists[0] ?? const <Map<String, dynamic>>[])
          if (c['item_source'] == 'next_up') c,
        ...?lists[1],
      ])
        if (card['type'] == 'episode' && seen.add(card['content_id'] as String))
          if (siloItemToBaseItemDto(card, images: images) case final item?)
            if (keep(item)) item,
    ];
    _rememberRow(items, libraryId);
    return _slice(items, startIndex: startIndex, limit: limit);
  }

  /// The episode Silo would play next for [seriesId] (its
  /// `play_content_id`), or null when it names none or not an episode.
  Future<Map<String, dynamic>?> _seriesNextEpisode(String seriesId) async {
    if (siloTypeOfId(seriesId) != 'series') return null;
    final series = await getItem(seriesId);
    final next = (series[siloOriginalKey] as Map?)?['play_content_id'];
    if (next is! String || siloTypeOfId(next) != 'episode') return null;
    return getItem(next);
  }

  /// Silo's own home rows: the sections of the profile's Silo
  /// home page (`GET /home/layout`), for Moonfin to offer as extra rows.
  ///
  /// Continue Watching and Next Up are left out, as Moonfin builds those
  /// rows itself from the same sections. Errors reach the caller,
  /// so a failed read isn't taken for a home with no rows.
  @override
  Future<List<ServerHomeSection>> getServerHomeSections() async {
    final layout = await homeSections.layout();
    return [
      for (final s in layout)
        if (!_moonfinOwnSections.contains(s.sectionType))
          ServerHomeSection(
            id: s.id,
            title: s.title.isEmpty ? s.sectionType : s.title,
            kind: s.sectionType,
          ),
    ];
  }

  /// Section types Moonfin builds its own rows from.
  static const _moonfinOwnSections = {'continue_watching', 'next_up'};

  /// One of Silo's home rows: the section's cards
  /// (`GET /home/sections/{id}/items`) as Jellyfin items, in Silo's order,
  /// types Moonfin can't show left out. A section no longer in the layout
  /// answers empty. Silo caps a section at its `item_limit`, so the whole
  /// row comes at once and `startIndex`/`limit` slice it.
  @override
  Future<Map<String, dynamic>> getServerHomeSectionItems(
    String sectionId, {
    int? startIndex,
    int? limit,
  }) async {
    final layout = await homeSections.layout();
    // Moonbase's admin defaults can't know this server's section ids, so
    // they name a row by its type ("type:hidden_gems"): the first such row.
    SiloSectionEntry? section;
    for (final s in layout) {
      if (s.id == sectionId || 'type:${s.sectionType}' == sectionId) {
        section = s;
        break;
      }
    }
    if (section == null) return _empty(startIndex);
    final cards = await homeSections.items(section);
    final items = [
      for (final card in cards)
        if (siloSupportedTypes.contains(card['type']))
          ?siloItemToBaseItemDto(card, images: images),
    ];
    _rememberRow(items, null);
    return _slice(items, startIndex: startIndex, limit: limit);
  }

  /// Latest: the newest arrivals in a library, or across the
  /// server for the asked types, as Jellyfin's `/Items/Latest`.
  ///
  /// One catalog page through the pager, newest first:
  ///
  /// - films by `added_at`, when the file arrived.
  /// - series by `latest_episode_added`, when their newest episode arrived,
  ///   so a show with a new episode comes back to the front. Jellyfin groups
  ///   a show's new episodes into the show the same way, and Moonfin turns a
  ///   TV library's Latest into series cards anyway.
  /// - a mixed library's films and series together by `added_at` (a series
  ///   by when it was first added: Silo has one sort for both).
  ///
  /// The kind comes from `includeItemTypes` (episodes and seasons count as
  /// their series), else from the library's `CollectionType`. Watched titles
  /// stay unless the profile hides them from Silo's Home
  /// ([_hidesWatchedOnHome]), as Silo's own Recently Added does. A
  /// `parentId` that isn't a library answers empty. `limit` defaults to
  /// Jellyfin's 20, and like Jellyfin, the answer is one list, with no total
  /// beyond its length.
  @override
  Future<Map<String, dynamic>> getLatestItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
  }) async {
    final libraryId = _libraryIdOf(parentId);
    if (parentId != null && libraryId == null) return _empty(0);
    final scope = await _newestRowScope(
      libraryId: libraryId,
      includeItemTypes: includeItemTypes,
      episodesAsSeries: true,
    );
    if (scope == null) return _empty(0);
    final hideWatched = await _hidesWatchedOnHome();
    final page = await _page(
      {
        'library_id': ?libraryId,
        'type': scope,
        'sort': scope == 'series' ? '-latest_episode_added' : '-added_at',
        if (hideWatched)
          'groups': jsonEncode(siloRuleGroups(filters: const ['IsUnplayed'])),
        'image_size': siloListImageSize,
      },
      limit: limit == null || limit <= 0 ? 20 : limit,
      libraryId: libraryId,
    );
    final items = page['Items'] as List;
    return {'Items': items, 'TotalRecordCount': items.length, 'StartIndex': 0};
  }

  /// Recently released: titles by release date, newest first,
  /// released by today, as Moonfin's `/Users/{id}/Items` query with
  /// `SortBy=PremiereDate`, `MaxPremiereDate=now` does on Jellyfin and Emby.
  ///
  /// One catalog page through the pager, `sort=-release_date` with the rule
  /// `release_date lt <tomorrow>` (Silo compares calendar dates, and its
  /// `release_date` is a film's release, a series' first air date, an
  /// episode's air date). The kind comes from `includeItemTypes` (an episode
  /// stays an episode here, and a season, which the catalog doesn't list,
  /// counts as its series), else from the library, as in Latest. Watched titles
  /// stay unless the profile hides them from Silo's Home
  /// ([_hidesWatchedOnHome]), as Silo's own Recently Released does.
  /// `recursive` changes nothing: the catalog always lists a library's
  /// titles at every depth.
  @override
  Future<Map<String, dynamic>> getRecentlyReleasedItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
    bool recursive = false,
  }) async {
    final libraryId = _libraryIdOf(parentId);
    if (parentId != null && libraryId == null) return _empty(0);
    final scope = await _newestRowScope(
      libraryId: libraryId,
      includeItemTypes: includeItemTypes,
      episodesAsSeries: false,
    );
    if (scope == null) return _empty(0);
    final today = _clock().toLocal();
    final tomorrow = DateTime(today.year, today.month, today.day + 1);
    final hideWatched = await _hidesWatchedOnHome();
    return _page(
      {
        'library_id': ?libraryId,
        'type': scope,
        'sort': '-release_date',
        'groups': jsonEncode([
          {
            'match': 'all',
            'rules': [
              {
                'field': 'release_date',
                'op': 'lt',
                'value': _isoDate(tomorrow),
              },
            ],
          },
          if (hideWatched) ...siloRuleGroups(filters: const ['IsUnplayed']),
        ]),
        'image_size': siloListImageSize,
      },
      limit: limit == null || limit <= 0 ? 20 : limit,
      libraryId: libraryId,
    );
  }

  static String _isoDate(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  /// Silo's per-profile setting `home.hide_watched_items` ("Hide watched
  /// items from Home", off by default): when on, Silo leaves watched titles
  /// out of its ordinary Home sections, Recently Added and Recently Released
  /// among them, and Moonfin's matching rows do the same.
  ///
  /// Read from the effective settings once a minute. A setting that can't
  /// be read counts as off, as Silo itself fails open, so nothing disappears
  /// because of an error.
  Future<bool> _hidesWatchedOnHome() => _hideWatched
      .get(_hideWatchedKey, _readHideWatched)
      .catchError((Object _) => false);

  static const _hideWatchedKey = 'home.hide_watched_items';
  late final _hideWatched = SiloKeptReads<String, bool>(
    lifetime: const Duration(minutes: 1),
    clock: _clock,
  );

  Future<bool> _readHideWatched() async {
    final response = await _dio.get<dynamic>(
      '/api/v2/settings/values/effective',
      queryParameters: const {'keys': _hideWatchedKey},
    );
    final items = asJsonMap(response.data)?['items'];
    if (items is! List) {
      throw FormatException(
        'Expected settings from Silo, got ${response.data.runtimeType}',
      );
    }
    for (final item in items) {
      final setting = asJsonMap(item);
      if (setting?['key'] == _hideWatchedKey) return setting?['value'] == true;
    }
    return false;
  }

  /// The catalog `type` scope for a row of the newest titles (Latest,
  /// Recently released): from [includeItemTypes] when given, else from the
  /// library's kind (`movie` for `movies`, `series` for `tvshows`, `video`
  /// for mixed or unknown). Null when the types are all ones Silo can't list.
  ///
  /// A season always counts as its series (the catalog doesn't list
  /// seasons), and an episode does too when [episodesAsSeries].
  Future<String?> _newestRowScope({
    required String? libraryId,
    required List<String>? includeItemTypes,
    required bool episodesAsSeries,
  }) async {
    final types = siloTypesForQuery(includeItemTypes: includeItemTypes);
    if (types != null) {
      final listed = {
        for (final t in types)
          t == 'season' || (episodesAsSeries && t == 'episode') ? 'series' : t,
      };
      if (listed.isEmpty) return null;
      return siloCatalogScopeFor(listed) ?? 'video';
    }
    if (libraryId == null) return 'video';
    Object? collectionType;
    try {
      collectionType = (await _library(libraryId))['CollectionType'];
    } catch (_) {}
    return switch (collectionType) {
      'movies' => 'movie',
      'tvshows' => 'series',
      _ => 'video',
    };
  }

  /// Continue Watching from the resume points (`GET /progress`), for a page
  /// with no Continue Watching section: each item read from the catalog, its
  /// `UserData` from the entry ([siloProgressToUserData]).
  Future<List<Map<String, dynamic>>> _resumeFromProgress({
    required String? libraryId,
    required Set<String> types,
    required int wanted,
  }) async {
    final response = await _dio.get<dynamic>(
      '/api/v2/progress',
      queryParameters: {
        'status': 'in_progress',
        'library_id': ?libraryId,
        'limit': wanted.clamp(1, 200),
      },
    );
    final raw = asJsonMap(response.data)?['items'];
    final entries = <String, Map<String, dynamic>>{
      if (raw is List)
        for (final e in raw)
          if (asJsonMap(e) case final entry?)
            if (entry['media_item_id'] case final String id) id: entry,
    };
    final found = await _byIds(entries.keys.toList());
    return [
      for (final item in (found['Items'] as List).cast<Map<String, dynamic>>())
        if (entries[item['Id']] case final entry?)
          if (types.contains(
            (item[siloOriginalKey] as Map?)?['type'] ??
                siloTypeOfId(item['Id'] as String),
          ))
            {
              ...item,
              'UserData': {
                ...?(item['UserData'] as Map?)?.cast<String, dynamic>(),
                ...siloProgressToUserData(entry),
              },
            },
    ];
  }

  /// Notes the series and, for a library's row, the library of a row's
  /// items, as a grid page does.
  void _rememberRow(List<Map<String, dynamic>> items, String? libraryId) {
    for (final item in items) {
      _rememberSeries(item);
      if (libraryId != null) {
        _rememberLibrary(item['Id'] as String, libraryId);
        item['ParentId'] ??= libraryId;
      }
    }
  }

  /// [items] from [startIndex], at most [limit] of them, as Jellyfin's
  /// `{Items, TotalRecordCount, StartIndex}`.
  static Map<String, dynamic> _slice(
    List<Map<String, dynamic>> items, {
    int? startIndex,
    int? limit,
  }) {
    final start = (startIndex ?? 0).clamp(0, items.length);
    final end = limit == null || limit <= 0
        ? items.length
        : (start + limit).clamp(start, items.length);
    return {
      'Items': items.sublist(start, end),
      'TotalRecordCount': items.length,
      'StartIndex': startIndex ?? 0,
    };
  }

  static const _emptyList = <String, dynamic>{
    'Items': <Map<String, dynamic>>[],
    'TotalRecordCount': 0,
    'StartIndex': 0,
  };

  /// Silo has no playlists or music (the app hides them). These answer
  /// empty, like Live TV, so a shared row renders nothing.
  @override
  Future<Map<String, dynamic>> getPlaylists() async => _emptyList;

  @override
  Future<Map<String, dynamic>> getPlaylistItems(
    String playlistId, {
    int? startIndex,
    int? limit,
  }) async => _emptyList;

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
  }) async => _emptyList;

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
  }) async => _emptyList;

  @override
  Future<Map<String, dynamic>> getLyrics(String itemId) async => const {};

  /// The skip segments of [itemId]: Silo's markers of the file
  /// that plays, as Jellyfin's `MediaSegmentDto`s (see [SiloMarkers]).
  @override
  Future<List<Map<String, dynamic>>> getMediaSegments(String itemId) =>
      markers.segmentsOf(itemId);

  /// The seek previews of file [mediaSourceId] of [itemId], as
  /// Jellyfin's `Trickplay` field (see [SiloTrickplay]).
  @override
  Future<Map<String, dynamic>?> getTrickplayManifest(
    String itemId, {
    required String mediaSourceId,
  }) => trickplay.manifest(itemId, mediaSourceId);

  /// [itemId]'s local theme songs, as Jellyfin's answer. Silo lists a
  /// title's own (an episode's or season's caller asks for its series, as on
  /// Jellyfin).
  @override
  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  }) => themes.themeMedia(itemId);

  /// A fresh grant for theme song [songId] of [ownerId].
  @override
  Future<String?> themeSongStreamUrl(
    String ownerId,
    String songId, {
    List<ThemeAudioFormat> accepts = const [],
  }) => themes.streamUrl(
    ownerId,
    songId,
    accepts,
    baseUrl: baseUrl?.call() ?? '',
  );

  /// Called by the Silo resolver when [itemId] starts playing [fileId], so
  /// the player's extras (markers…) come from that file. [source] is the
  /// file's mapped media source, whose track map a series' track choice is
  /// written with.
  void notePlayingFile(
    String itemId,
    String fileId, {
    num? runTimeSeconds,
    Map<String, dynamic>? source,
  }) {
    markers.notePlayingFile(itemId, fileId, runTimeSeconds: runTimeSeconds);
    if (source != null) _playingSources[itemId] = source;
  }

  @override
  Future<bool> canShuffle(Map<String, dynamic> item) =>
      shuffles.canShuffle(item);

  @override
  Future<ServerShuffle> startShuffle(Map<String, dynamic> item) =>
      shuffles.start(item);

  @override
  Future<ServerShuffle?> advanceShuffle(
    String shuffleId, {
    required String fromItemId,
  }) => shuffles.advance(shuffleId, fromItemId);

  @override
  Future<SeriesTrackChoice?> getSeriesAudioChoice(String seriesId) =>
      trackPreferences.audioChoice(seriesId);

  @override
  Future<SeriesTrackChoice?> getSeriesSubtitleChoice(String seriesId) =>
      trackPreferences.subtitleChoice(seriesId);

  @override
  Future<void> setSeriesAudioChoice(
    String seriesId, {
    required String itemId,
    required int streamIndex,
  }) => trackPreferences.setAudio(
    seriesId,
    itemId: itemId,
    streamIndex: streamIndex,
  );

  @override
  Future<void> setSeriesSubtitleChoice(
    String seriesId, {
    required String itemId,
    required int streamIndex,
  }) => trackPreferences.setSubtitle(
    seriesId,
    itemId: itemId,
    streamIndex: streamIndex,
  );

  /// A film split across files (DVD1, DVD2) is one Silo title whose files
  /// are versions, not parts, so there are none.
  @override
  Future<List<Map<String, dynamic>>> getAdditionalParts(String itemId) async =>
      const [];

  /// Searches the file [itemId] plays, or its default version when it isn't
  /// playing. Silo has nothing like [isPerfectMatch].
  @override
  Future<List<Map<String, dynamic>>> searchRemoteSubtitles(
    String itemId, {
    required String language,
    bool? isPerfectMatch,
  }) async {
    var fileId = siloIdOf(_playingSources[itemId]?['Id']);
    if (fileId == null) {
      final sources = (await getItem(itemId))['MediaSources'] as List?;
      fileId = siloIdOf((sources?.firstOrNull as Map?)?['Id']);
    }
    if (fileId == null) {
      throw StateError('Silo item $itemId has no file to find subtitles for');
    }
    return remoteSubtitles.search(fileId, language);
  }

  /// Saves the subtitle on the server for the file it was found for.
  @override
  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId) async {
    await remoteSubtitles.download(subtitleId);
    noteCatalogChanged();
  }

  /// What Silo has no counterpart for: playlist changes, deleting items.
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      siloUnsupported('ItemsApi', invocation);
}

/// Silo's letter index for a title-ordered list ([SiloItemsApi.letters]).
class SiloLetterIndex {
  const SiloLetterIndex({required this.total, required this.letters});

  factory SiloLetterIndex.fromJson(Map<String, dynamic> json) {
    final raw = json['letters'];
    final total = json['total'];
    return SiloLetterIndex(
      total: total is num ? total.toInt() : 0,
      letters: [
        if (raw is List)
          for (final entry in raw)
            if (asJsonMap(entry) case final l?)
              if (l['letter'] case final String letter)
                (
                  letter: letter,
                  count: (l['count'] as num?)?.toInt() ?? 0,
                  position: (l['position'] as num?)?.toInt() ?? 0,
                ),
      ],
    );
  }

  /// Titles in the whole list.
  final int total;

  /// The letters with titles, in list order (`#` for anything else).
  final List<({String letter, int count, int position})> letters;

  /// Where [letter]'s titles start, or null when it has none.
  int? positionOf(String letter) {
    final upper = letter.toUpperCase();
    for (final l in letters) {
      if (l.letter.toUpperCase() == upper) return l.position;
    }
    return null;
  }
}

/// What Silo's `GET /catalog/search/capabilities` says.
class SiloSearchCapabilities {
  const SiloSearchCapabilities({
    required this.state,
    required this.allowed,
    this.videoWithEpisodes = false,
    this.peopleMediaScope = false,
    this.provider,
    this.resultWindowLimit,
  });

  factory SiloSearchCapabilities.fromJson(Map<String, dynamic> json) {
    final window = json['result_window_limit'];
    final provider = json['provider'];
    return SiloSearchCapabilities(
      state: json['state'] is String ? json['state'] as String : '',
      allowed: json['allowed'] == true,
      videoWithEpisodes: json['video_with_episodes_scope'] == true,
      peopleMediaScope: json['people_media_scope'] == true,
      provider: provider is String ? provider : null,
      resultWindowLimit: window is num ? window.toInt() : null,
    );
  }

  /// Assumed when the document can't be read: search is tried, with no
  /// optional scope.
  static const unknown = SiloSearchCapabilities(
    state: 'available',
    allowed: true,
  );

  /// `available`, `disabled`, `not_configured` or `unsupported`.
  final String state;

  /// Whether this profile may search.
  final bool allowed;

  /// `type=video_with_episodes` on catalog searches (movies, series and
  /// episodes in one ranked list), and as the people search's
  /// `media_scope`.
  final bool videoWithEpisodes;

  /// People search takes `media_scope` ([SiloItemsApi.getPersons]).
  final bool peopleMediaScope;

  /// `postgres` or `meilisearch`.
  final String? provider;

  /// How far a Meilisearch result can be paged, or null for PostgreSQL.
  final int? resultWindowLimit;

  /// Whether to send searches at all.
  bool get canSearch => allowed && state == 'available';
}
