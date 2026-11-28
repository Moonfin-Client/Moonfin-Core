import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../abs_ids.dart';
import '../abs_item_mapper.dart';
import '../abs_progress.dart';

class AbsItemsApi implements ItemsApi {
  AbsItemsApi(this._dio, this._progress, {Set<String> Function()? favorites})
    : _favorites = favorites ?? (() => const {});

  final Dio _dio;
  final AbsProgressCache _progress;
  final Set<String> Function() _favorites;

  List<Map<String, dynamic>> _withFavorites(List<Map<String, dynamic>> items) {
    final favorites = _favorites();
    if (favorites.isEmpty) return items;
    return [for (final item in items) _withFavorite(item, favorites)];
  }

  static Map<String, dynamic> _withFavorite(
    Map<String, dynamic> item,
    Set<String> favorites,
  ) {
    if (!favorites.contains(item['Id'])) return item;
    return {
      ...item,
      'UserData': {...?(item['UserData'] as Map?), 'IsFavorite': true},
    };
  }

  /// Series ids are global, but their books are listed per library.
  final _seriesLibrary = <String, String>{};
  List<Map<String, dynamic>>? _libraries;

  static const _sortFields = {
    'SortName': 'media.metadata.title',
    'Name': 'media.metadata.title',
    'AlbumArtist': 'media.metadata.authorNameLF',
    'Artist': 'media.metadata.authorNameLF',
    'DateCreated': 'addedAt',
    'DateLastContentAdded': 'addedAt',
    'PremiereDate': 'media.metadata.publishedYear',
    'ProductionYear': 'media.metadata.publishedYear',
    'Runtime': 'media.duration',
    'DatePlayed': 'progress',
  };

  static const _progressFilters = {
    'IsPlayed': 'finished',
    'IsUnplayed': 'not-started',
    'IsResumable': 'in-progress',
  };

  static String _encode(String value) => base64.encode(utf8.encode(value));

  Future<Map<String, dynamic>> _get(
    String path, [
    Map<String, dynamic>? query,
  ]) async {
    final response = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: query,
    );
    return response.data ?? const {};
  }

  Future<List<Map<String, dynamic>>> libraries() async {
    final cached = _libraries;
    if (cached != null) return cached;
    final data = await _get('/api/libraries');
    return _libraries = absMaps(data['libraries']);
  }

  Future<List<String>> _libraryIds({bool booksOnly = false}) async => [
    for (final library in await libraries())
      if (!booksOnly || library['mediaType'] != 'podcast')
        library['id'] as String,
  ];

  Future<String?> _libraryMediaType(String libraryId) async {
    for (final library in await libraries()) {
      if (library['id'] == libraryId) return library['mediaType'] as String?;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> mapItems(Iterable<Map<String, dynamic>> raw) async {
    final progress = await _progressByKey();
    return _withFavorites([
      for (final item in raw)
        if (item['id'] is String)
          absItemToJellyfin(
            item,
            progress: progress[AbsProgressCache.key(item['id'] as String)],
          ),
    ]);
  }

  Future<Map<String, Map<String, dynamic>>> _progressByKey() async {
    try {
      return {
        for (final entry in await _progress.all())
          AbsProgressCache.key(
            entry['libraryItemId'] as String,
            entry['episodeId'] as String?,
          ): entry,
      };
    } on DioException {
      return const {};
    }
  }

  static List<Map<String, dynamic>> _ofTypes(
    List<Map<String, dynamic>> items,
    List<String>? include,
    List<String>? exclude,
  ) => [
    for (final item in items)
      if ((include == null || include.isEmpty || include.contains(item['Type'])) &&
          (exclude == null || !exclude.contains(item['Type'])))
        item,
  ];

  /// Whether a type filter leaves out every kind of library item.
  static bool _excludesBooks(List<String>? include) =>
      include != null &&
      include.isNotEmpty &&
      !include.any(const {'AudioBook', 'Book', 'Audio', 'MusicAlbum'}.contains);

  static Map<String, dynamic> _page(
    List<Map<String, dynamic>> items, {
    int? startIndex,
    int? limit,
  }) {
    final start = min(startIndex ?? 0, items.length);
    final end = limit == null ? items.length : min(start + limit, items.length);
    return absItemsResult(
      items.sublist(start, end),
      total: items.length,
      startIndex: start,
    );
  }

  String? _filterFor({
    List<String>? filters,
    List<String>? genres,
    List<String>? genreIds,
    List<String>? personIds,
    List<String>? artistIds,
    List<String>? tags,
    List<String>? studios,
  }) {
    for (final filter in filters ?? const <String>[]) {
      final progress = _progressFilters[filter];
      if (progress != null) return 'progress.${_encode(progress)}';
    }
    final genre =
        genres?.firstOrNull ??
        genreIds?.map(absGenreKey).nonNulls.firstOrNull;
    if (genre != null) return 'genres.${_encode(genre)}';
    final author = [
      ...?personIds,
      ...?artistIds,
    ].map(absAuthorKey).nonNulls.firstOrNull;
    if (author != null) return 'authors.${_encode(author)}';
    final tag = tags?.firstOrNull;
    if (tag != null) return 'tags.${_encode(tag)}';
    final publisher = studios?.firstOrNull;
    if (publisher != null) return 'publishers.${_encode(publisher)}';
    return null;
  }

  /// One page of a library's items. Audiobookshelf pages by page number, so
  /// a start that isn't on a page boundary reads from the top and cuts.
  Future<Map<String, dynamic>> _libraryItems(
    String libraryId, {
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    String? filter,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
  }) async {
    final sortKey = sortBy?.split(',').map((s) => _sortFields[s.trim()]).nonNulls.firstOrNull;
    final descending = sortOrder?.split(',').first.trim() == 'Descending';
    final start = startIndex ?? 0;
    final aligned = limit != null && limit > 0 && start % limit == 0;
    // A type filter narrower than the library is applied here, so the
    // server's page can't be trusted to hold a full page of matches.
    final typed = _narrowsTypes(includeItemTypes, excludeItemTypes);
    final query = <String, dynamic>{
      'minified': 1,
      if (sortKey != null) 'sort': sortKey,
      if (sortKey != null) 'desc': descending ? 1 : 0,
      'filter': ?filter,
      if (!typed && limit != null && limit > 0) ...{
        'limit': aligned ? limit : start + limit,
        'page': aligned ? start ~/ limit : 0,
      },
    };
    final data = await _get('/api/libraries/$libraryId/items', query);
    final mapped = _ofTypes(
      await mapItems(absMaps(data['results'])),
      includeItemTypes,
      excludeItemTypes,
    );
    if (sortBy == 'Random') mapped.shuffle();
    if (typed) return _page(mapped, startIndex: start, limit: limit);
    final total = data['total'] as int? ?? mapped.length;
    if (aligned || limit == null || limit <= 0) {
      return absItemsResult(mapped, total: total, startIndex: start);
    }
    final cut = mapped.skip(start).take(limit).toList();
    return absItemsResult(cut, total: total, startIndex: start);
  }

  static bool _narrowsTypes(List<String>? include, List<String>? exclude) {
    if (exclude != null &&
        exclude.any(const {'AudioBook', 'Book', 'MusicAlbum'}.contains)) {
      return true;
    }
    if (include == null || include.isEmpty) return false;
    final books = include.contains('AudioBook') && include.contains('Book');
    return !books && !include.contains('MusicAlbum');
  }

  Future<List<Map<String, dynamic>>> _search(
    String term, {
    String? libraryId,
    int? limit,
  }) async {
    final ids = libraryId != null ? [libraryId] : await _libraryIds();
    final results = await Future.wait(
      ids.map(
        (id) => _get('/api/libraries/$id/search', {
          'q': term,
          'limit': limit ?? 25,
        }),
      ),
    );
    final items = <Map<String, dynamic>>[];
    final authors = <Map<String, dynamic>>[];
    final series = <Map<String, dynamic>>[];
    for (final result in results) {
      for (final hit in [...absMaps(result['book']), ...absMaps(result['podcast'])]) {
        if (hit['libraryItem'] case final Map item) {
          items.add(item.cast<String, dynamic>());
        }
      }
      authors.addAll(absMaps(result['authors']));
      for (final hit in absMaps(result['series'])) {
        if (hit['series'] case final Map s) {
          series.add({...s.cast<String, dynamic>(), 'books': hit['books']});
        }
      }
    }
    return [
      ...await mapItems(items),
      for (final author in authors) absAuthorToJellyfin(author),
      for (final s in series) absSeriesToJellyfin(s),
    ];
  }

  Future<List<Map<String, dynamic>>> _itemsByIds(List<String> ids) async {
    final itemIds = {for (final id in ids) absItemIdOf(id)}.toList();
    if (itemIds.isEmpty) return const [];
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/items/batch/get',
      data: {'libraryItemIds': itemIds},
    );
    final raw = {
      for (final item in absMaps(response.data?['libraryItems']))
        item['id']: item,
    };
    final progress = await _progressByKey();
    final out = <Map<String, dynamic>>[];
    for (final id in ids) {
      final episode = absEpisodeKey(id);
      final item = raw[episode?.itemId ?? id];
      if (item == null) continue;
      if (episode == null) {
        out.add(
          absItemToJellyfin(
            item,
            progress: progress[AbsProgressCache.key(id)],
          ),
        );
        continue;
      }
      final found = _episodesOf(item).where((e) => e['id'] == episode.episodeId);
      if (found.isEmpty) continue;
      out.add(
        absEpisodeToJellyfin(
          item,
          found.first,
          progress: progress[AbsProgressCache.key(episode.itemId, episode.episodeId)],
        ),
      );
    }
    return _withFavorites(out);
  }

  static List<Map<String, dynamic>> _episodesOf(Map<String, dynamic> podcast) =>
      absMaps((podcast['media'] as Map?)?['episodes']);

  Future<List<Map<String, dynamic>>> _episodes(String podcastId) async {
    final item = await _get('/api/items/$podcastId', {'expanded': 1});
    final progress = await _progressByKey();
    final episodes = _episodesOf(item)
      ..sort(
        (a, b) => ((b['publishedAt'] as num?) ?? 0).compareTo(
          (a['publishedAt'] as num?) ?? 0,
        ),
      );
    return _withFavorites([
      for (final episode in episodes)
        absEpisodeToJellyfin(
          item,
          episode,
          progress: progress[AbsProgressCache.key(podcastId, episode['id'] as String?)],
        ),
    ]);
  }

  Future<List<Map<String, dynamic>>> _seriesBooks(String seriesId) async {
    var libraryId = _seriesLibrary[seriesId];
    if (libraryId == null) {
      final series = await _get('/api/series/$seriesId');
      libraryId = series['libraryId'] as String?;
      if (libraryId == null) return const [];
      _seriesLibrary[seriesId] = libraryId;
    }
    final data = await _get('/api/libraries/$libraryId/items', {
      'minified': 1,
      'filter': 'series.${_encode(seriesId)}',
    });
    final books = await mapItems(absMaps(data['results']));
    books.sort((a, b) {
      final x = num.tryParse('${a['AbsSequence'] ?? ''}');
      final y = num.tryParse('${b['AbsSequence'] ?? ''}');
      if (x != null && y != null) return x.compareTo(y);
      if ((x == null) != (y == null)) return x == null ? 1 : -1;
      return '${a['SortName']}'.compareTo('${b['SortName']}');
    });
    return books;
  }

  Future<List<Map<String, dynamic>>> _authorBooks(String authorId) async {
    final author = await _get('/api/authors/$authorId', {'include': 'items'});
    return mapItems(absMaps(author['libraryItems']));
  }

  Future<List<Map<String, dynamic>>> _collectionBooks(String collectionId) async {
    final collection = await _get('/api/collections/$collectionId');
    return mapItems(absMaps(collection['books']));
  }

  Future<List<Map<String, dynamic>>> _playlistEntries(String playlistId) async {
    final playlist = await _get('/api/playlists/$playlistId');
    final progress = await _progressByKey();
    final out = <Map<String, dynamic>>[];
    for (final entry in absMaps(playlist['items'])) {
      final item = entry['libraryItem'];
      if (item is! Map) continue;
      final libraryItem = item.cast<String, dynamic>();
      final itemId = libraryItem['id'] as String;
      final episodeId = entry['episodeId'] as String?;
      final Map<String, dynamic> mapped;
      if (episodeId == null) {
        mapped = absItemToJellyfin(
          libraryItem,
          progress: progress[AbsProgressCache.key(itemId)],
        );
      } else {
        final episode = entry['episode'] is Map
            ? (entry['episode'] as Map).cast<String, dynamic>()
            : _episodesOf(libraryItem).where((e) => e['id'] == episodeId).firstOrNull;
        if (episode == null) continue;
        mapped = absEpisodeToJellyfin(
          libraryItem,
          episode,
          progress: progress[AbsProgressCache.key(itemId, episodeId)],
        );
      }
      // The playlist entry id the app removes and moves entries by.
      out.add({...mapped, 'PlaylistItemId': mapped['Id']});
    }
    return _withFavorites(out);
  }

  Future<List<Map<String, dynamic>>> _collections({String? libraryId}) async {
    final ids = libraryId != null ? [libraryId] : await _libraryIds();
    final results = await Future.wait(
      ids.map((id) => _get('/api/libraries/$id/collections', {'limit': 0})),
    );
    return [
      for (final result in results)
        for (final collection in absMaps(result['results']))
          absCollectionToJellyfin(collection),
    ];
  }

  Future<List<Map<String, dynamic>>> _playlists({String? libraryId}) async {
    final data = await _get('/api/playlists');
    return [
      for (final playlist in absMaps(data['playlists']))
        if (libraryId == null || playlist['libraryId'] == libraryId)
          absPlaylistToJellyfin(playlist),
    ];
  }

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
    bool? enableUserData,
  }) async {
    if (ids != null && ids.isNotEmpty) {
      return absItemsResult(
        _ofTypes(await _itemsByIds(ids), includeItemTypes, excludeItemTypes),
      );
    }
    if (isFavorite == true || (filters?.contains('IsFavorite') ?? false)) {
      return _page(
        await _favoritesIn(parentId, includeItemTypes, excludeItemTypes),
        startIndex: startIndex,
        limit: limit,
      );
    }
    // None of the video filters mean anything for books, so a query that
    // needs one matches nothing.
    final unsupported =
        [
          seriesStatus,
          videoTypes,
          officialRatings,
          audioLanguages,
          subtitleLanguages,
        ].any((list) => list != null && list.isNotEmpty) ||
        [hasSubtitles, hasTrailer, hasSpecialFeature, hasThemeSong, hasThemeVideo, isHd, is4K, is3D]
            .any((flag) => flag == true) ||
        anyProviderIdEquals != null;
    if (unsupported) return absItemsResult(const []);

    final types = includeItemTypes;
    if (types != null && types.contains('BoxSet')) {
      return _page(
        await _collections(libraryId: absLibraryKey(parentId)),
        startIndex: startIndex,
        limit: limit,
      );
    }
    if (types != null && types.contains('Playlist')) {
      return _page(
        await _playlists(libraryId: absLibraryKey(parentId)),
        startIndex: startIndex,
        limit: limit,
      );
    }
    if (types != null && types.contains('MusicArtist')) {
      return getArtists(
        parentId: parentId,
        sortOrder: sortOrder,
        startIndex: startIndex,
        limit: limit,
      );
    }

    final term = searchTerm?.trim();
    if (term != null && term.isNotEmpty) {
      final hits = await _search(
        term,
        libraryId: absLibraryKey(parentId),
        limit: limit,
      );
      return _page(
        _ofTypes(hits, includeItemTypes, excludeItemTypes),
        startIndex: startIndex,
        limit: limit,
      );
    }

    if (_excludesBooks(types)) return absItemsResult(const []);

    final filter = _filterFor(
      filters: filters,
      genres: genres,
      genreIds: genreIds,
      personIds: personIds,
      artistIds: artistIds,
      tags: tags,
      studios: studios,
    );

    final libraryId = absLibraryKey(parentId);
    if (libraryId != null) {
      return _libraryItems(
        libraryId,
        sortBy: sortBy,
        sortOrder: sortOrder,
        startIndex: startIndex,
        limit: limit,
        filter: filter,
        includeItemTypes: types,
        excludeItemTypes: excludeItemTypes,
      );
    }

    final List<Map<String, dynamic>> children;
    if (absSeriesKey(parentId) case final seriesId?) {
      children = await _seriesBooks(seriesId);
    } else if (absAuthorKey(parentId) case final authorId?) {
      children = await _authorBooks(authorId);
    } else if (absCollectionKey(parentId) case final collectionId?) {
      children = await _collectionBooks(collectionId);
    } else if (absPlaylistKey(parentId) case final playlistId?) {
      children = await _playlistEntries(playlistId);
    } else if (absGenreKey(parentId) case final genre?) {
      children = await _acrossLibraries(
        filter: 'genres.${_encode(genre)}',
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
    } else if (parentId != null && absIsLibraryItemId(parentId)) {
      children = await _episodes(parentId);
    } else if (parentId == null) {
      final authorFilter = [
        ...?personIds,
        ...?artistIds,
      ].map(absAuthorKey).nonNulls.firstOrNull;
      if (authorFilter != null) {
        final books = await _authorBooks(authorFilter);
        // An author opens as an artist, whose page lists albums. Its books
        // are what belongs there.
        return _page(
          types != null && types.contains('MusicAlbum')
              ? books
              : _ofTypes(books, includeItemTypes, excludeItemTypes),
          startIndex: startIndex,
          limit: limit,
        );
      }
      children = await _acrossLibraries(
        filter: filter,
        sortBy: sortBy,
        sortOrder: sortOrder,
        limit: limit == null ? null : (startIndex ?? 0) + limit,
      );
    } else {
      children = const [];
    }
    return _page(
      _ofTypes(children, includeItemTypes, excludeItemTypes),
      startIndex: startIndex,
      limit: limit,
    );
  }

  Future<List<Map<String, dynamic>>> _favoritesIn(
    String? parentId,
    List<String>? include,
    List<String>? exclude,
  ) async {
    final ids = [
      for (final id in _favorites())
        if (absIsLibraryItemId(id) || absEpisodeKey(id) != null) id,
    ];
    if (ids.isEmpty) return const [];
    final libraryId = absLibraryKey(parentId);
    return _ofTypes(
      [
        for (final item in await _itemsByIds(ids))
          if (libraryId == null || item['AbsLibraryId'] == libraryId) item,
      ],
      include,
      exclude,
    );
  }

  /// The same query on every book library, merged.
  Future<List<Map<String, dynamic>>> _acrossLibraries({
    String? filter,
    String? sortBy,
    String? sortOrder,
    int? limit,
  }) async {
    final ids = await _libraryIds(booksOnly: true);
    final pages = await Future.wait(
      ids.map(
        (id) => _libraryItems(
          id,
          filter: filter,
          sortBy: sortBy,
          sortOrder: sortOrder,
          limit: limit,
        ),
      ),
    );
    return [
      for (final page in pages) ...absMaps(page['Items']),
    ];
  }

  @override
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  }) async {
    final libraryId = absLibraryKey(parentId);
    if (libraryId == null) return QueryFilterValues.empty;
    final data = await _get('/api/libraries/$libraryId/filterdata');
    List<String> names(Object? list) => [
      for (final entry in list as List? ?? const [])
        if (entry is String) entry else if (entry is Map && entry['name'] is String) entry['name'] as String,
    ];
    return QueryFilterValues(
      genres: names(data['genres']),
      tags: names(data['tags']),
    );
  }

  /// Authors are artists here, and a search already lists them as such.
  @override
  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  }) async => absItemsResult(const []);

  Future<Map<String, dynamic>> _view(String libraryId) async {
    for (final library in await libraries()) {
      if (library['id'] == libraryId) return absLibraryToView(library);
    }
    _libraries = null;
    final data = await _get('/api/libraries/$libraryId');
    return absLibraryToView(data);
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    if (absLibraryKey(itemId) case final libraryId?) return _view(libraryId);
    if (absSeriesKey(itemId) case final seriesId?) {
      final series = await _get('/api/series/$seriesId');
      if (series['libraryId'] case final String libraryId) {
        _seriesLibrary[seriesId] = libraryId;
      }
      return absSeriesToJellyfin({
        ...series,
        'books': [
          for (final book in await _seriesBooks(seriesId))
            {
              'id': book['Id'],
              'updatedAt': (book['ImageTags'] as Map?)?['Primary'],
              'media': {'coverPath': (book['ImageTags'] as Map?)?['Primary']},
            },
        ],
      });
    }
    if (absAuthorKey(itemId) case final authorId?) {
      return absAuthorToJellyfin(await _get('/api/authors/$authorId'));
    }
    if (absCollectionKey(itemId) case final collectionId?) {
      return absCollectionToJellyfin(await _get('/api/collections/$collectionId'));
    }
    if (absPlaylistKey(itemId) case final playlistId?) {
      return absPlaylistToJellyfin(await _get('/api/playlists/$playlistId'));
    }
    if (absGenreKey(itemId) case final genre?) return absGenreToJellyfin(genre);
    if (absEpisodeKey(itemId) case final episode?) {
      final podcast = await _get('/api/items/${episode.itemId}', {'expanded': 1});
      final found = _episodesOf(podcast).where((e) => e['id'] == episode.episodeId);
      if (found.isEmpty) {
        final request = RequestOptions(path: '/api/items/${episode.itemId}');
        throw DioException.badResponse(
          statusCode: 404,
          requestOptions: request,
          response: Response(requestOptions: request, statusCode: 404),
        );
      }
      return _withFavorite(
        absEpisodeToJellyfin(
          podcast,
          found.first,
          progress: await _progress.of(episode.itemId, episode.episodeId),
        ),
        _favorites(),
      );
    }
    final item = await _get('/api/items/$itemId', {
      'expanded': 1,
      'include': 'progress',
    });
    return _withFavorite(
      absItemToJellyfin(
        item,
        progress:
            (item['userMediaProgress'] as Map?)?.cast<String, dynamic>() ??
            await _progress.of(itemId),
      ),
      _favorites(),
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async {
    if (!absIsLibraryItemId(itemId) && absEpisodeKey(itemId) == null) return [];
    try {
      final item = await getItem(itemId);
      final libraryId = absLibraryKey(item['ParentId'] as String?) ??
          item['AbsLibraryId'] as String?;
      if (libraryId == null) return [];
      return [await _view(libraryId)];
    } on DioException {
      return [];
    }
  }

  /// More of the same series, then more by the same author.
  @override
  Future<Map<String, dynamic>> getSimilarItems(
    String itemId, {
    int? limit,
    String? bypass,
  }) async {
    if (!absIsLibraryItemId(itemId)) return absItemsResult(const []);
    final item = await getItem(itemId);
    final similar = <Map<String, dynamic>>[];
    final seen = {itemId};
    if (absSeriesKey(item['SeriesId'] as String?) case final seriesId?) {
      for (final book in await _seriesBooks(seriesId)) {
        if (seen.add(book['Id'] as String)) similar.add(book);
      }
    }
    for (final author in item['AlbumArtists'] as List? ?? const []) {
      final authorId = absAuthorKey((author as Map)['Id'] as String?);
      if (authorId == null) continue;
      for (final book in await _authorBooks(authorId)) {
        if (seen.add(book['Id'] as String)) similar.add(book);
      }
    }
    return absItemsResult(limit == null ? similar : similar.take(limit).toList());
  }

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
  }) async => absItemsResult(const []);

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
    final libraryId = absLibraryKey(parentId);
    if (parentId != null && libraryId == null) return absItemsResult(const []);
    final data = await _get('/api/me/items-in-progress', {'limit': 100});
    final progress = await _progressByKey();
    final items = <Map<String, dynamic>>[];
    for (final item in absMaps(data['libraryItems'])) {
      if (libraryId != null && item['libraryId'] != libraryId) continue;
      final itemId = item['id'] as String;
      if (item['recentEpisode'] case final Map episode) {
        final episodeId = episode['id'] as String?;
        final entry = progress[AbsProgressCache.key(itemId, episodeId)];
        if (entry?['hideFromContinueListening'] == true) continue;
        items.add(
          absEpisodeToJellyfin(item, episode.cast<String, dynamic>(), progress: entry),
        );
        continue;
      }
      final entry = progress[AbsProgressCache.key(itemId)];
      if (entry?['hideFromContinueListening'] == true) continue;
      items.add(absItemToJellyfin(item, progress: entry));
    }
    return _page(
      _ofTypes(items, includeItemTypes, null),
      startIndex: startIndex,
      limit: limit,
    );
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
    final libraryId = absLibraryKey(parentId);
    if (libraryId == null) return {'Items': <Map<String, dynamic>>[]};
    if (await _libraryMediaType(libraryId) == 'podcast') {
      final data = await _get('/api/libraries/$libraryId/recent-episodes', {
        'limit': limit ?? 20,
      });
      final progress = await _progressByKey();
      return {
        'Items': [
          for (final episode in absMaps(data['episodes']))
            if (episode['libraryItemId'] case final String podcastId)
              absEpisodeToJellyfin(
                {
                  'id': podcastId,
                  'libraryId': libraryId,
                  'updatedAt': episode['updatedAt'],
                  'media': {
                    'coverPath': episode['podcast']?['coverPath'] ?? '',
                    'metadata': episode['podcast']?['metadata'] ?? const {},
                  },
                },
                episode,
                progress: progress[AbsProgressCache.key(podcastId, episode['id'] as String?)],
              ),
        ],
      };
    }
    final page = await _libraryItems(
      libraryId,
      sortBy: 'DateCreated',
      sortOrder: 'Descending',
      limit: limit ?? 20,
      includeItemTypes: includeItemTypes,
    );
    return {'Items': page['Items']};
  }

  @override
  Future<Map<String, dynamic>> getRecentlyReleasedItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
    bool recursive = false,
    bool? hideWatched,
  }) async {
    final libraryId = absLibraryKey(parentId);
    if (libraryId == null) return absItemsResult(const []);
    return _libraryItems(
      libraryId,
      sortBy: 'ProductionYear',
      sortOrder: 'Descending',
      limit: limit ?? 20,
      includeItemTypes: includeItemTypes,
      filter: hideWatched == true ? 'progress.${_encode('not-started')}' : null,
    );
  }

  @override
  Future<Map<String, dynamic>> getSeasons(String seriesId, {String? fields}) async =>
      absItemsResult(const []);

  @override
  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  }) async => absItemsResult(const []);

  @override
  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  }) async => {
    'ThemeSongsResult': absItemsResult(const []),
    'ThemeVideosResult': absItemsResult(const []),
  };

  @override
  Future<Map<String, dynamic>> getPlaylists() async =>
      absItemsResult(await _playlists());

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
    final libraryId = absLibraryKey(parentId);
    final ids = libraryId != null
        ? [libraryId]
        : parentId != null
        ? const <String>[]
        : await _libraryIds(booksOnly: true);
    final results = await Future.wait(
      ids.map((id) async {
        if (await _libraryMediaType(id) == 'podcast') return const <String, dynamic>{};
        return _get('/api/libraries/$id/authors');
      }),
    );
    final seen = <String>{};
    var authors = [
      for (final result in results)
        for (final author in absMaps(result['authors']))
          if (seen.add(author['id'] as String)) absAuthorToJellyfin(author),
    ];
    if (nameStartsWith != null && nameStartsWith.isNotEmpty) {
      final prefix = nameStartsWith.toLowerCase();
      authors = [
        for (final author in authors)
          if ('${author['SortName']}'.toLowerCase().startsWith(prefix)) author,
      ];
    }
    if (nameLessThan != null && nameLessThan.isNotEmpty) {
      final bound = nameLessThan.toLowerCase();
      authors = [
        for (final author in authors)
          if ('${author['SortName']}'.toLowerCase().compareTo(bound) < 0) author,
      ];
    }
    authors.sort(
      (a, b) => '${a['SortName']}'.toLowerCase().compareTo('${b['SortName']}'.toLowerCase()),
    );
    if (isFavorite == true) {
      final favorites = _favorites();
      authors = [
        for (final author in authors)
          if (favorites.contains(author['Id'])) author,
      ];
    }
    if (sortOrder == 'Descending') authors = authors.reversed.toList();
    return _page(_withFavorites(authors), startIndex: startIndex, limit: limit);
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
  }) => getArtists(
    parentId: parentId,
    sortBy: sortBy,
    sortOrder: sortOrder,
    startIndex: startIndex,
    limit: limit,
    nameStartsWith: nameStartsWith,
    nameLessThan: nameLessThan,
    isFavorite: isFavorite,
  );

  @override
  Future<Map<String, dynamic>> getPlaylistItems(
    String playlistId, {
    int? startIndex,
    int? limit,
    String? fields,
  }) async {
    final key = absPlaylistKey(playlistId);
    if (key == null) return absItemsResult(const []);
    return _page(await _playlistEntries(key), startIndex: startIndex, limit: limit);
  }

  static Map<String, dynamic> _playlistEntry(String id) {
    final episode = absEpisodeKey(id);
    return episode == null
        ? {'libraryItemId': id}
        : {'libraryItemId': episode.itemId, 'episodeId': episode.episodeId};
  }

  Future<String> _libraryOf(List<String>? itemIds) async {
    final first = itemIds?.firstOrNull;
    if (first != null) {
      final item = await _get('/api/items/${absItemIdOf(first)}');
      if (item['libraryId'] case final String libraryId) return libraryId;
    }
    final books = await _libraryIds(booksOnly: true);
    if (books.isEmpty) throw StateError('No Audiobookshelf library to hold it');
    return books.first;
  }

  @override
  Future<Map<String, dynamic>> createPlaylist({
    required String name,
    List<String>? itemIds,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/playlists',
      data: {
        'libraryId': await _libraryOf(itemIds),
        'name': name,
        'items': [for (final id in itemIds ?? const <String>[]) _playlistEntry(id)],
      },
    );
    return {'Id': absPlaylistId(response.data?['id'] as String)};
  }

  @override
  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/collections',
      data: {
        'libraryId': await _libraryOf(itemIds),
        'name': name,
        'books': [...?itemIds],
      },
    );
    return {'Id': absCollectionId(response.data?['id'] as String)};
  }

  static String _require(String? key, String id) =>
      key ?? (throw ArgumentError.value(id, 'id', 'Not an Audiobookshelf id'));

  @override
  Future<void> addToPlaylist(String playlistId, List<String> itemIds) =>
      _dio.post<dynamic>(
        '/api/playlists/${_require(absPlaylistKey(playlistId), playlistId)}/batch/add',
        data: {'items': [for (final id in itemIds) _playlistEntry(id)]},
      );

  @override
  Future<void> addToCollection(String collectionId, List<String> itemIds) =>
      _dio.post<dynamic>(
        '/api/collections/${_require(absCollectionKey(collectionId), collectionId)}/batch/add',
        data: {'books': itemIds},
      );

  @override
  Future<void> removeFromCollection(String collectionId, List<String> itemIds) =>
      _dio.post<dynamic>(
        '/api/collections/${_require(absCollectionKey(collectionId), collectionId)}/batch/remove',
        data: {'books': itemIds},
      );

  @override
  Future<void> removeFromPlaylist(String playlistId, List<String> entryIds) =>
      _dio.post<dynamic>(
        '/api/playlists/${_require(absPlaylistKey(playlistId), playlistId)}/batch/remove',
        data: {'items': [for (final id in entryIds) _playlistEntry(id)]},
      );

  @override
  Future<void> movePlaylistItem(
    String playlistId,
    String playlistItemId,
    int newIndex,
  ) async {
    final key = _require(absPlaylistKey(playlistId), playlistId);
    final entries = [
      for (final entry in await _playlistEntries(key)) entry['Id'] as String,
    ];
    if (!entries.remove(playlistItemId)) return;
    entries.insert(newIndex.clamp(0, entries.length), playlistItemId);
    await _dio.patch<dynamic>(
      '/api/playlists/$key',
      data: {'items': [for (final id in entries) _playlistEntry(id)]},
    );
  }

  @override
  Future<void> renamePlaylist(String playlistId, String name) =>
      _dio.patch<dynamic>(
        '/api/playlists/${_require(absPlaylistKey(playlistId), playlistId)}',
        data: {'name': name},
      );

  @override
  Future<void> deleteItem(String itemId) async {
    if (absCollectionKey(itemId) case final collectionId?) {
      await _dio.delete<dynamic>('/api/collections/$collectionId');
      return;
    }
    throw UnsupportedError("Moonfin doesn't delete Audiobookshelf media");
  }

  @override
  Future<void> deletePlaylist(String playlistId) => _dio.delete<dynamic>(
    '/api/playlists/${_require(absPlaylistKey(playlistId), playlistId)}',
  );

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
    final libraryId = absLibraryKey(parentId);
    final ids = libraryId != null ? [libraryId] : await _libraryIds();
    final results = await Future.wait(
      ids.map((id) => _get('/api/libraries/$id/filterdata')),
    );
    final names = {
      for (final data in results)
        for (final genre in data['genres'] as List? ?? const [])
          if (genre is String) genre,
    };
    final genres = [for (final name in names) absGenreToJellyfin(name)]
      ..sort((a, b) => '${a['Name']}'.toLowerCase().compareTo('${b['Name']}'.toLowerCase()));
    return _page(genres, startIndex: startIndex, limit: limit);
  }

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
  }) async => absItemsResult(const []);

  @override
  Future<Map<String, dynamic>> getLyrics(String itemId) async => const {};

  @override
  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId) async => [];

  @override
  Future<List<Map<String, dynamic>>> getIntros(String itemId) async => [];

  @override
  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId) async => [];

  @override
  Future<List<Map<String, dynamic>>> getAdditionalParts(String itemId) async => [];

  @override
  Future<List<Map<String, dynamic>>> getMediaSegments(String itemId) async => [];

  @override
  Future<List<Map<String, dynamic>>> searchRemoteSubtitles(
    String itemId, {
    required String language,
    bool? isPerfectMatch,
  }) async => [];

  @override
  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId) async =>
      throw UnsupportedError('Audiobookshelf has no subtitles');
}
