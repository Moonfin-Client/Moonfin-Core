import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../plex_item_mapper.dart';
import 'plex_apis.dart';

class PlexItemsApi implements ItemsApi {
  final Dio _dio;

  PlexItemsApi(this._dio);

  static const _sortFields = {
    'SortName': 'titleSort',
    'Name': 'titleSort',
    'DateCreated': 'addedAt',
    'PremiereDate': 'originallyAvailableAt',
    'ProductionYear': 'year',
    'CommunityRating': 'audienceRating',
    'CriticRating': 'rating',
    'DatePlayed': 'lastViewedAt',
    'Runtime': 'duration',
    'OfficialRating': 'contentRating',
    'Random': 'random',
  };

  static const _filters = {
    'IsPlayed': {'unwatched': '0'},
    'IsUnplayed': {'unwatched': '1'},
    'IsResumable': {'inProgress': '1'},
  };

  static List<Map<String, dynamic>> _items(Object? metadata) => [
    for (final m in metadata as List? ?? const [])
      if (m is Map<String, dynamic>) plexItemToJellyfin(m),
  ];

  static List<Map<String, dynamic>> _ofTypes(
    List<Map<String, dynamic>> items,
    List<String>? types,
  ) => types == null || types.isEmpty
      ? items
      : [
          for (final item in items)
            if (types.contains(item['Type'])) item,
        ];

  static Map<String, dynamic> _paging(int? startIndex, int? limit) => {
    if (limit != null) ...{
      'X-Plex-Container-Start': startIndex ?? 0,
      'X-Plex-Container-Size': limit,
    },
  };

  static String? _sectionKey(String? id) =>
      id != null && id.startsWith(plexSectionPrefix)
      ? id.substring(plexSectionPrefix.length)
      : null;

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
    // A filter Plex can't apply answers with nothing, since ignoring it
    // would show items the filter was meant to leave out.
    final unsupported =
        [
          personIds,
          artistIds,
          seriesStatus,
          genreIds,
          genres,
          tags,
          studios,
          officialRatings,
          years,
          videoTypes,
          audioLanguages,
          subtitleLanguages,
        ].any((list) => list != null && list.isNotEmpty) ||
        [
          nameStartsWith,
          nameLessThan,
          minPremiereDate,
          maxOfficialRating,
          hasParentalRating,
          anyProviderIdEquals,
          hasSubtitles,
          hasTrailer,
          hasSpecialFeature,
          hasThemeSong,
          hasThemeVideo,
          isHd,
          is4K,
          is3D,
        ].any((value) => value != null) ||
        isFavorite == true ||
        (filters ?? const []).any((f) => !_filters.containsKey(f));
    if (unsupported) return plexItemsResult([]);

    if (ids != null && ids.isNotEmpty) {
      final container = await plexContainer(
        _dio,
        '/library/metadata/${ids.join(',')}',
      );
      return plexItemsResult(_items(container['Metadata']));
    }

    // A search across every library goes through Plex's hub search, which
    // also lists titles it matched through their cast, artist or genre. Those
    // carry a reason and are left out, so only titles that match the query
    // stay.
    if (parentId == null && searchTerm != null && searchTerm.isNotEmpty) {
      final container = await plexContainer(_dio, '/hubs/search', {
        'query': searchTerm,
        'limit': ?limit,
      });
      final matches = _items([
        for (final hub in container['Hub'] as List? ?? const [])
          for (final item in hub['Metadata'] as List? ?? const [])
            if (item['reason'] == null) item,
      ]);
      return plexItemsResult(_ofTypes(matches, includeItemTypes));
    }

    final types = [
      for (final type in includeItemTypes ?? const <String>[])
        ?plexTypeNumbers[type],
    ];
    final sectionKey = _sectionKey(parentId);
    final String path;
    if (parentId == null) {
      if (types.isEmpty) return plexItemsResult([]);
      path = '/library/all';
    } else if (sectionKey != null) {
      path = '/library/sections/$sectionKey/all';
    } else {
      path = recursive == true && types.contains(plexTypeNumbers['Episode'])
          ? '/library/metadata/$parentId/allLeaves'
          : '/library/metadata/$parentId/children';
    }

    // Later fields only break ties, so the sort stops at the first one Plex
    // can't do. With nothing left, Plex keeps its own order, which is disc
    // and track order for an album.
    final sort = (sortBy ?? '')
        .split(',')
        .map((field) => _sortFields[field.trim()])
        .takeWhile((field) => field != null)
        .map((field) => sortOrder == 'Descending' ? '$field:desc' : field)
        .join(',');
    final container = await plexContainer(_dio, path, {
      if (types.isNotEmpty && path.endsWith('/all')) 'type': types.join(','),
      if (sort.isNotEmpty) 'sort': sort,
      if (searchTerm != null && searchTerm.isNotEmpty) 'title': searchTerm,
      for (final filter in filters ?? const <String>[]) ..._filters[filter]!,
      ..._paging(startIndex, limit),
    });

    // Children and leaves come back unfiltered, so the type check happens here.
    final items = _ofTypes(_items(container['Metadata']), includeItemTypes);
    return plexItemsResult(
      items,
      total: container['totalSize'] as int?,
      startIndex: startIndex ?? 0,
    );
  }

  @override
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  }) async => QueryFilterValues.empty;

  @override
  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  }) async => plexItemsResult([]);

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    final sectionKey = _sectionKey(itemId);
    if (sectionKey != null) {
      final sections = await plexContainer(_dio, '/library/sections');
      for (final section in sections['Directory'] as List? ?? const []) {
        if (section is Map<String, dynamic> &&
            '${section['key']}' == sectionKey) {
          return plexSectionToView(section);
        }
      }
      throw StateError('No Plex library $sectionKey');
    }
    final container = await plexContainer(_dio, '/library/metadata/$itemId', {
      'includeGuids': 1,
    });
    final items = _items(container['Metadata']);
    if (items.isEmpty) throw StateError('No Plex item $itemId');
    return items.first;
  }

  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async => [];

  @override
  Future<Map<String, dynamic>> getSimilarItems(
    String itemId, {
    int? limit,
    String? bypass,
  }) async {
    final container = await plexContainer(
      _dio,
      '/library/metadata/$itemId/similar',
      _paging(0, limit),
    );
    return plexItemsResult(_items(container['Metadata']));
  }

  /// Plex's Continue Watching mixes started items with the next episode of
  /// each show, which are Jellyfin's resume and next up rows.
  Future<List<Map<String, dynamic>>> _continueWatching({
    String? parentId,
    required bool started,
  }) async {
    final container = await plexContainer(_dio, '/hubs/continueWatching/items');
    final sectionKey = _sectionKey(parentId);
    return [
      for (final m in container['Metadata'] as List? ?? const [])
        if (m is Map<String, dynamic> &&
            (m['viewOffset'] != null) == started &&
            (sectionKey == null || '${m['librarySectionID']}' == sectionKey))
          plexItemToJellyfin(m),
    ];
  }

  static Map<String, dynamic> _page(
    List<Map<String, dynamic>> items,
    int? startIndex,
    int? limit,
  ) {
    final start = (startIndex ?? 0).clamp(0, items.length);
    final end = limit == null
        ? items.length
        : (start + limit).clamp(start, items.length);
    return plexItemsResult(
      items.sublist(start, end),
      total: items.length,
      startIndex: start,
    );
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
  }) async {
    if (seriesId != null) {
      final container = await plexContainer(
        _dio,
        '/library/metadata/$seriesId',
        {'includeOnDeck': 1},
      );
      final show = (container['Metadata'] as List? ?? const []).firstOrNull;
      final onDeck = show is Map ? show['OnDeck'] : null;
      final episode = onDeck is Map ? onDeck['Metadata'] : null;
      return plexItemsResult([
        if (episode is Map<String, dynamic>) plexItemToJellyfin(episode),
      ]);
    }
    return _page(
      await _continueWatching(parentId: parentId, started: false),
      startIndex,
      limit,
    );
  }

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
    var items = await _continueWatching(parentId: parentId, started: true);
    if (includeItemTypes != null && includeItemTypes.isNotEmpty) {
      items = [
        for (final item in items)
          if (includeItemTypes.contains(item['Type'])) item,
      ];
    }
    return _page(items, startIndex, limit);
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
    final sectionKey = _sectionKey(parentId);
    if (sectionKey == null) return {'Items': <Map<String, dynamic>>[]};
    final container = await plexContainer(
      _dio,
      '/library/sections/$sectionKey/recentlyAdded',
      _paging(0, limit ?? 20),
    );
    return {'Items': _items(container['Metadata'])};
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
  }) => getItems(
    parentId: parentId,
    includeItemTypes: includeItemTypes,
    sortBy: 'PremiereDate',
    sortOrder: 'Descending',
    limit: limit,
    recursive: recursive,
  );

  @override
  Future<Map<String, dynamic>> getSeasons(
    String seriesId, {
    String? fields,
  }) async {
    final container = await plexContainer(
      _dio,
      '/library/metadata/$seriesId/children',
    );
    return plexItemsResult([
      for (final item in _items(container['Metadata']))
        if (item['Type'] == 'Season') item,
    ]);
  }

  @override
  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  }) async {
    final container = await plexContainer(
      _dio,
      seasonId != null
          ? '/library/metadata/$seasonId/children'
          : '/library/metadata/$seriesId/allLeaves',
    );
    return plexItemsResult(_items(container['Metadata']));
  }

  @override
  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  }) async => {};

  @override
  Future<Map<String, dynamic>> getPlaylists() async => plexItemsResult([]);

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
  }) async => plexItemsResult([]);

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
  }) async => plexItemsResult([]);

  @override
  Future<Map<String, dynamic>> getPlaylistItems(
    String playlistId, {
    int? startIndex,
    int? limit,
  }) async => plexItemsResult([]);

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
  }) async => plexItemsResult([]);

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
  }) async => plexItemsResult([]);

  /// Plex lists a track's lyric file as stream type 4 and reads it into lines
  /// with millisecond offsets, which become Jellyfin's lines with start ticks.
  @override
  Future<Map<String, dynamic>> getLyrics(String itemId) async {
    final container = await plexContainer(_dio, '/library/metadata/$itemId');
    final lyricStream = [
      for (final item in container['Metadata'] as List? ?? const [])
        for (final media in item['Media'] as List? ?? const [])
          for (final part in media['Part'] as List? ?? const [])
            for (final stream in part['Stream'] as List? ?? const [])
              if (stream['streamType'] == 4) stream,
    ].firstOrNull;
    if (lyricStream == null) return {'Lyrics': const []};

    final lyrics = await plexContainer(_dio, '${lyricStream['key']}');
    final lyric = (lyrics['Lyrics'] as List?)?.firstOrNull;
    final timed = lyric?['timed'] == true;
    return {
      'Lyrics': [
        for (final line in lyric?['Line'] as List? ?? const [])
          {
            if (timed) 'Start': (line['startOffset'] as int? ?? 0) * 10000,
            'Text': [
              for (final span in line['Span'] as List? ?? const [])
                span['text'],
            ].join(),
          },
      ],
    };
  }

  @override
  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId) async =>
      [];

  @override
  Future<List<Map<String, dynamic>>> getIntros(String itemId) async => [];

  @override
  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId) async =>
      [];

  @override
  Future<List<Map<String, dynamic>>> getAdditionalParts(String itemId) async =>
      [];

  @override
  Future<List<Map<String, dynamic>>> getMediaSegments(String itemId) async =>
      [];

  @override
  Future<List<Map<String, dynamic>>> searchRemoteSubtitles(
    String itemId, {
    required String language,
    bool? isPerfectMatch,
  }) async => [];

  static Never _readOnly() =>
      throw UnsupportedError('Plex libraries are read only in Moonfin');

  @override
  Future<Map<String, dynamic>> createPlaylist({
    required String name,
    List<String>? itemIds,
  }) async => _readOnly();

  @override
  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) async => _readOnly();

  @override
  Future<void> addToPlaylist(String playlistId, List<String> itemIds) async =>
      _readOnly();

  @override
  Future<void> addToCollection(
    String collectionId,
    List<String> itemIds,
  ) async => _readOnly();

  @override
  Future<void> removeFromCollection(
    String collectionId,
    List<String> itemIds,
  ) async => _readOnly();

  @override
  Future<void> removeFromPlaylist(
    String playlistId,
    List<String> entryIds,
  ) async => _readOnly();

  @override
  Future<void> movePlaylistItem(
    String playlistId,
    String playlistItemId,
    int newIndex,
  ) async => _readOnly();

  @override
  Future<void> renamePlaylist(String playlistId, String name) async =>
      _readOnly();

  @override
  Future<void> deleteItem(String itemId) async => _readOnly();

  @override
  Future<void> deletePlaylist(String playlistId) async => _readOnly();

  @override
  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId) async =>
      _readOnly();
}
