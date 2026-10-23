import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../plex_item_mapper.dart';
import 'plex_apis.dart';

class PlexItemsApi implements ItemsApi {
  final Dio _dio;
  final bool Function() _mayDeleteMedia;
  String? _machineId;

  PlexItemsApi(this._dio, {bool Function()? mayDeleteMedia})
    : _mayDeleteMedia = mayDeleteMedia ?? (() => false);

  /// Stands in for a collection made with nothing in it yet.
  static const _newCollectionPrefix = 'new-collection:';

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

  static String? _anyOf(List<Object>? values) =>
      values == null || values.isEmpty ? null : values.join(',');

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

  static String? _keyOf(String? id, String prefix) =>
      id != null && id.startsWith(prefix) ? id.substring(prefix.length) : null;

  static String? _sectionKey(String? id) => _keyOf(id, plexSectionPrefix);

  static String? _personKey(String? id) => _keyOf(id, plexPersonPrefix);

  static String? _genreKey(String? id) => _keyOf(id, plexGenrePrefix);

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
          seriesStatus,
          videoTypes,
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
          is3D,
        ].any((value) => value != null) ||
        (is4K == true && isHd == false) ||
        (artistIds?.length ?? 0) > 1 ||
        (personIds ?? const []).any((id) => _personKey(id) == null) ||
        (genreIds ?? const []).any((id) => _genreKey(id) == null) ||
        (filters ?? const []).any((f) => !_filters.containsKey(f));
    if (unsupported) return plexItemsResult([]);

    if (ids != null && ids.isNotEmpty) {
      final container = await plexContainer(
        _dio,
        '/library/metadata/${ids.join(',')}',
      );
      return plexItemsResult(_items(container['Metadata']));
    }

    // Everything a person is in, acting or not. This list ignores sorting, so
    // the newest come first here.
    final personKey = _personKey(personIds?.singleOrNull);
    if (parentId == null && personKey != null) {
      final container = await plexContainer(
        _dio,
        '/library/people/$personKey/media',
      );
      final items = _ofTypes(_items(container['Metadata']), includeItemTypes)
        ..sort(
          (a, b) => (b['ProductionYear'] as int? ?? 0).compareTo(
            a['ProductionYear'] as int? ?? 0,
          ),
        );
      return plexItemsResult(items);
    }

    // An artist's albums are its children and its tracks are its leaves.
    final parent = artistIds?.singleOrNull ?? parentId;

    // A search across every library goes through Plex's hub search, which
    // also lists titles it matched through their cast, artist or genre. Those
    // carry a reason and are left out, so only titles that match the query
    // stay.
    if (parent == null && searchTerm != null && searchTerm.isNotEmpty) {
      // Without the flag, a collection comes back as a tag and not the item.
      final container = await plexContainer(_dio, '/hubs/search', {
        'query': searchTerm,
        'includeCollections': 1,
        'limit': ?limit,
      });
      final matches = _items([
        for (final hub in container['Hub'] as List? ?? const [])
          for (final item in hub['Metadata'] as List? ?? const [])
            if (item['reason'] == null) item,
      ]);
      return plexItemsResult(_ofTypes(matches, includeItemTypes));
    }

    // Plex lists across libraries only by type, so favorites of every kind
    // ask for every type.
    final types = includeItemTypes == null || includeItemTypes.isEmpty
        ? [if (isFavorite == true) ...plexTypeNumbers.values]
        : [for (final type in includeItemTypes) ?plexTypeNumbers[type]];
    final sectionKey = _sectionKey(parent);
    final String path;
    // Playlists sit outside the libraries, filed by where their items live.
    if (includeItemTypes?.singleOrNull == 'Playlist') {
      path = '/playlists';
    } else if (parent == null) {
      if (types.isEmpty) return plexItemsResult([]);
      path = '/library/all';
    } else if (sectionKey != null) {
      path = '/library/sections/$sectionKey/all';
    } else {
      final leaves =
          recursive == true &&
          (types.contains(plexTypeNumbers['Episode']) ||
              types.contains(plexTypeNumbers['Audio']));
      path = '/library/metadata/$parent/${leaves ? 'allLeaves' : 'children'}';
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
    // Each repeated genre param must match, while commas match any one.
    final genreFilters = [
      ?_anyOf(genres),
      ?_anyOf(genreIds?.map(_genreKey).nonNulls.toList()),
    ];
    final container = await plexContainer(_dio, path, {
      if (types.isNotEmpty && path.endsWith('/all')) 'type': types.join(','),
      if (path == '/playlists') 'sectionID': ?sectionKey,
      if (sort.isNotEmpty) 'sort': sort,
      if (searchTerm != null && searchTerm.isNotEmpty) 'title': searchTerm,
      for (final filter in filters ?? const <String>[]) ..._filters[filter]!,
      if (genreFilters.isNotEmpty) 'genre': genreFilters,
      'year': ?_anyOf(years),
      'contentRating': ?_anyOf(officialRatings),
      'label': ?_anyOf(tags),
      'studio': ?_anyOf(studios),
      'actor': ?_anyOf(personIds?.map(_personKey).nonNulls.toList()),
      'audioLanguage': ?_anyOf(audioLanguages),
      'subtitleLanguage': ?_anyOf(subtitleLanguages),
      if (is4K == true)
        'resolution': '4k'
      else if (isHd != null)
        'resolution': isHd ? '720,1080,4k' : 'sd,480,576',
      if (isFavorite == true) 'userRating': '$plexFavoriteRating',
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

  /// The values a library's filter picker offers, read from Plex's own lists
  /// for that library.
  @override
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  }) async {
    final section = _sectionKey(parentId);
    if (section == null) return QueryFilterValues.empty;
    final type = plexTypeNumbers[includeItemTypes?.firstOrNull];
    Future<List<Map>> values(String filter) async {
      try {
        final container = await plexContainer(
          _dio,
          '/library/sections/$section/$filter',
          {'type': ?type},
        );
        return (container['Directory'] as List? ?? const [])
            .whereType<Map>()
            .toList();
      } catch (_) {
        // A library without this filter just leaves its section hidden.
        return const [];
      }
    }

    final [
      genres,
      years,
      ratings,
      labels,
      audio,
      subtitles,
    ] = await Future.wait([
      for (final filter in const [
        'genre',
        'year',
        'contentRating',
        'label',
        'audioLanguage',
        'subtitleLanguage',
      ])
        values(filter),
    ]);
    List<String> titles(List<Map> list) => [
      for (final value in list)
        if (value['title'] case final String title) title,
    ];
    List<NamedFilterValue> languages(List<Map> list) => [
      for (final value in list)
        if (value['key'] case final String key)
          NamedFilterValue(name: '${value['title'] ?? key}', value: key),
    ];
    return QueryFilterValues(
      genres: titles(genres),
      years: [for (final year in years) ?int.tryParse('${year['key']}')],
      officialRatings: titles(ratings),
      tags: titles(labels),
      audioLanguages: languages(audio),
      subtitleLanguages: languages(subtitles),
    );
  }

  @override
  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  }) async {
    final container = await plexContainer(_dio, '/hubs/search', {
      'query': searchTerm,
      'limit': ?limit,
    });
    // Plex lists a person once per library and role, so each name is kept once.
    final names = <Object?>{};
    return plexItemsResult([
      for (final hub in container['Hub'] as List? ?? const [])
        if (const {'actor', 'director', 'writer'}.contains(hub['type']))
          for (final person in hub['Directory'] as List? ?? const [])
            if (person is Map && names.add(person['tag']))
              plexPersonToJellyfin(person),
    ]);
  }

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
    if (_personKey(itemId) case final key?) {
      final people = await plexContainer(_dio, '/library/people/$key');
      final person = (people['Directory'] as List? ?? const []).firstOrNull;
      if (person is! Map) throw StateError('No Plex person $key');
      return plexPersonToJellyfin(person);
    }
    if (plexPartOf(itemId) case (final key, final mediaIndex, final part)) {
      return plexPartItem(await _plexItem(key), mediaIndex, part);
    }
    final container = await plexContainer(_dio, '/library/metadata/$itemId', {
      'includeGuids': 1,
      'includeChapters': 1,
    });
    final items = _items(container['Metadata']);
    if (items.isEmpty) throw StateError('No Plex item $itemId');
    return {...items.first, if (_mayDeleteMedia()) 'CanDelete': true};
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

  /// A Plex show keeps one theme song, played straight from its own path,
  /// which is what the song's id holds.
  @override
  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  }) async {
    final item = await _plexItem(itemId);
    final theme =
        item['theme'] ??
        (inheritFromParent
            ? item['grandparentTheme'] ?? item['parentTheme']
            : null);
    return {
      'ThemeSongsResult': plexItemsResult([
        if (theme is String) {'Id': theme, 'Type': 'Audio'},
      ]),
    };
  }

  /// The playlists something can be added to, which leaves out smart ones
  /// since Plex fills those itself.
  @override
  Future<Map<String, dynamic>> getPlaylists() async {
    final container = await plexContainer(_dio, '/playlists', {'smart': 0});
    return plexItemsResult(_items(container['Metadata']));
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
  }) => getItems(
    parentId: parentId,
    includeItemTypes: const ['MusicArtist'],
    sortBy: sortBy,
    sortOrder: sortOrder,
    startIndex: startIndex,
    limit: limit,
    nameStartsWith: nameStartsWith,
    nameLessThan: nameLessThan,
    isFavorite: isFavorite,
  );

  /// Plex has only album artists. A featured artist is just a name on the
  /// track, so both lists are the same.
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
  }) async {
    final container = await plexContainer(
      _dio,
      '/playlists/$playlistId/items',
      _paging(startIndex, limit),
    );
    return plexItemsResult(
      _items(container['Metadata']),
      total: container['totalSize'] as int?,
      startIndex: startIndex ?? 0,
    );
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
  }) => _libraryTags(
    'genre',
    plexGenrePrefix,
    'Genre',
    parentId: parentId,
    includeItemTypes: includeItemTypes,
    sortBy: sortBy,
    sortOrder: sortOrder,
    startIndex: startIndex,
    limit: limit,
  );

  /// Studio pages filter by name, so the id just has to be unique and free of
  /// commas, since the home row saves its picked studios as a comma list.
  /// Plex's encoded key is both.
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
  }) => _libraryTags(
    'studio',
    'studio-',
    'Studio',
    parentId: parentId,
    includeItemTypes: includeItemTypes,
    sortBy: sortBy,
    sortOrder: sortOrder,
    startIndex: startIndex,
    limit: limit,
  );

  /// Plex lists genres and studios per library, under the same key in every
  /// library, so a server-wide list merges each library's list. Only name
  /// and random order apply, since these tags carry nothing else to sort by.
  Future<Map<String, dynamic>> _libraryTags(
    String filter,
    String prefix,
    String type, {
    String? parentId,
    List<String>? includeItemTypes,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
  }) async {
    final sections = parentId != null
        ? [?_sectionKey(parentId)]
        : [
            for (final s
                in (await plexContainer(_dio, '/library/sections'))['Directory']
                        as List? ??
                    const [])
              if (s is Map) s['key'],
          ];
    // A library with none of these types answers with an empty list.
    final types = [
      for (final t in includeItemTypes ?? const <String>[]) ?plexTypeNumbers[t],
    ];
    final lists = await Future.wait([
      for (final key in sections)
        plexContainer(_dio, '/library/sections/$key/$filter', {
          'type': ?_anyOf(types),
        }),
    ]);
    final byId = {
      for (final list in lists)
        for (final tag in list['Directory'] as List? ?? const [])
          if (tag is Map && tag['title'] is String)
            '$prefix${tag['key']}': <String, dynamic>{
              'Id': '$prefix${tag['key']}',
              'Name': tag['title'],
              'Type': type,
            },
    };
    final direction = sortOrder == 'Descending' ? -1 : 1;
    final items = byId.values.toList()
      ..sort(
        (a, b) =>
            direction *
            (a['Name'] as String).toLowerCase().compareTo(
              (b['Name'] as String).toLowerCase(),
            ),
      );
    if (sortBy == 'Random') items.shuffle();
    final start = startIndex ?? 0;
    return plexItemsResult(
      items.skip(start).take(limit ?? items.length).toList(),
      total: items.length,
      startIndex: start,
    );
  }

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

  /// What Plex keeps alongside an item. A trailer Plex streams itself, like a
  /// show's, only comes as the item's primary extra.
  Future<List<Map<String, dynamic>>> _extras(String itemId) async {
    final container = await plexContainer(_dio, '/library/metadata/$itemId', {
      'includeExtras': 1,
    });
    final item = (container['Metadata'] as List?)?.firstOrNull as Map?;
    final extras = _items((item?['Extras'] as Map?)?['Metadata']);
    final primary = item?['primaryExtraKey'];
    if (primary is String &&
        !extras.any((e) => primary == '/library/metadata/${e['Id']}')) {
      extras.insertAll(
        0,
        _items((await plexContainer(_dio, primary))['Metadata']),
      );
    }
    return extras;
  }

  @override
  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId) async => [
    for (final extra in await _extras(itemId))
      if (extra['ExtraType'] == 'Trailer') extra,
  ];

  /// Plex hands out its cinema trailers and the server's pre-roll only in a
  /// play queue that asks for them, where they come ahead of the item.
  @override
  Future<List<Map<String, dynamic>>> getIntros(String itemId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/playQueues',
      queryParameters: {
        'type': 'video',
        'uri': await _itemsUri([itemId]),
        'extrasPrefixCount': _cinemaTrailerCount,
      },
    );
    return _items(
      response.data?['MediaContainer']?['Metadata'],
    ).takeWhile((item) => item['Id'] != itemId).toList();
  }

  /// How many cinema trailers come before a movie, on top of any pre-roll.
  static const _cinemaTrailerCount = 2;

  /// Trailers stay in, since the app finds an item's trailer in this list.
  @override
  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId) =>
      _extras(itemId);

  @override
  Future<List<Map<String, dynamic>>> getAdditionalParts(String itemId) async {
    final (key, mediaIndex) = plexSourceOf(itemId);
    return plexAdditionalParts(await _plexItem(key), mediaIndex);
  }

  @override
  Future<List<Map<String, dynamic>>> getMediaSegments(String itemId) async {
    // A split movie's markers count from the start of the whole movie.
    if (plexPartOf(itemId) != null) return const [];
    final container = await plexContainer(_dio, '/library/metadata/$itemId', {
      'includeMarkers': 1,
    });
    final item = (container['Metadata'] as List? ?? const []).firstOrNull;
    return [
      for (final marker in item?['Marker'] as List? ?? const [])
        if ((_segmentTypes[marker['type']], marker) case (
          final type?,
          {'startTimeOffset': final int start, 'endTimeOffset': final int end},
        ))
          {
            'Id': '$itemId-${marker['type']}-$start',
            'ItemId': itemId,
            'Type': type,
            'StartTicks': start * 10000,
            'EndTicks': end * 10000,
          },
    ];
  }

  /// Plex's markers as the app's segment types. A bookmark is a spot a user
  /// saved, not something to skip.
  static const _segmentTypes = {
    'intro': 'Intro',
    'credits': 'Outro',
    'commercial': 'Commercial',
  };

  static final _twoLetterLanguages = {
    for (final entry in kIso6391To6392.entries) entry.value: entry.key,
  };

  /// Plex searches OpenSubtitles itself. It only takes two letter language
  /// codes and fails outright on three.
  @override
  Future<List<Map<String, dynamic>>> searchRemoteSubtitles(
    String itemId, {
    required String language,
    bool? isPerfectMatch,
  }) async {
    final container = await plexContainer(
      _dio,
      '/library/metadata/$itemId/subtitles',
      {'language': _twoLetterLanguages[language] ?? language},
    );
    return [
      for (final result in container['Stream'] as List? ?? const [])
        if (result is Map)
          {
            'Id': '${result['id']}',
            'Name': ?result['title'],
            'ThreeLetterISOLanguageName': ?result['languageCode'],
            'ProviderName': ?result['providerTitle'],
            'Format': ?result['format'],
            'HearingImpaired': result['hearingImpaired'] == true,
          },
    ];
  }

  Future<Map<String, dynamic>> _plexItem(String id) async =>
      (await plexContainer(_dio, '/library/metadata/$id'))['Metadata'][0]
          as Map<String, dynamic>;

  /// Plex takes the items to add as one URI naming them on this server.
  Future<String> _itemsUri(List<String> itemIds) async {
    _machineId ??=
        (await plexContainer(_dio, '/identity'))['machineIdentifier'] as String;
    return 'server://$_machineId/com.plexapp.plugins.library'
        '/library/metadata/${itemIds.join(',')}';
  }

  Future<Map<String, dynamic>> _create(
    String path,
    Map<String, dynamic> query,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      path,
      queryParameters: query,
    );
    return _items(response.data?['MediaContainer']?['Metadata']).first;
  }

  /// A Plex playlist holds one kind of media, which its first item decides.
  @override
  Future<Map<String, dynamic>> createPlaylist({
    required String name,
    List<String>? itemIds,
  }) async {
    final ids = itemIds ?? const [];
    final first = ids.isEmpty ? null : await _plexItem(ids.first);
    return _create('/playlists', {
      'type': switch (first?['type']) {
        'artist' || 'album' || 'track' => 'audio',
        'photo' => 'photo',
        _ => 'video',
      },
      'title': name,
      'smart': 0,
      if (ids.isNotEmpty) 'uri': await _itemsUri(ids),
    });
  }

  /// Plex files a collection under the library and type of what's in it, so
  /// one made empty is only created once its first items arrive.
  @override
  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) async => itemIds == null || itemIds.isEmpty
      ? {'Id': '$_newCollectionPrefix$name'}
      : _createCollection(name, itemIds);

  Future<Map<String, dynamic>> _createCollection(
    String name,
    List<String> itemIds,
  ) async {
    final first = await _plexItem(itemIds.first);
    return _create('/library/collections', {
      'type': plexTypeNumbers[plexItemToJellyfin(first)['Type']],
      'title': name,
      'smart': 0,
      'sectionId': first['librarySectionID'],
      'uri': await _itemsUri(itemIds),
    });
  }

  @override
  Future<void> addToPlaylist(String playlistId, List<String> itemIds) async {
    await _dio.put(
      '/playlists/$playlistId/items',
      queryParameters: {'uri': await _itemsUri(itemIds)},
    );
  }

  @override
  Future<void> addToCollection(
    String collectionId,
    List<String> itemIds,
  ) async {
    if (_keyOf(collectionId, _newCollectionPrefix) case final name?) {
      await _createCollection(name, itemIds);
      return;
    }
    await _dio.put(
      '/library/collections/$collectionId/items',
      queryParameters: {'uri': await _itemsUri(itemIds)},
    );
  }

  @override
  Future<void> removeFromCollection(
    String collectionId,
    List<String> itemIds,
  ) async {
    for (final id in itemIds) {
      await _dio.delete('/library/collections/$collectionId/items/$id');
    }
  }

  @override
  Future<void> removeFromPlaylist(
    String playlistId,
    List<String> entryIds,
  ) async {
    for (final entry in entryIds) {
      await _dio.delete('/playlists/$playlistId/items/$entry');
    }
  }

  /// Plex moves an entry to just after another one, or to the top without one.
  @override
  Future<void> movePlaylistItem(
    String playlistId,
    String playlistItemId,
    int newIndex,
  ) async {
    final others = [
      for (final item in (await getPlaylistItems(playlistId))['Items'] as List)
        if (item['PlaylistItemId'] != playlistItemId) item['PlaylistItemId'],
    ];
    await _dio.put(
      '/playlists/$playlistId/items/$playlistItemId/move',
      queryParameters: {if (newIndex > 0) 'after': others[newIndex - 1]},
    );
  }

  @override
  Future<void> renamePlaylist(String playlistId, String name) async {
    await _dio.put('/playlists/$playlistId', queryParameters: {'title': name});
  }

  /// Removing a playlist or collection only drops the list. Anything else
  /// deletes its files, which Plex allows only the owner with the server's
  /// own setting on.
  @override
  Future<void> deleteItem(String itemId) async {
    switch ((await _plexItem(itemId))['type']) {
      case 'playlist':
        await deletePlaylist(itemId);
      case 'collection':
        await _dio.delete('/library/collections/$itemId');
      default:
        await _dio.delete('/library/metadata/$itemId');
    }
  }

  @override
  Future<void> deletePlaylist(String playlistId) async {
    await _dio.delete('/playlists/$playlistId');
  }

  /// Plex fetches the result and adds it to the item as a sidecar stream.
  @override
  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId) async {
    await _dio.put<void>(
      '/library/metadata/$itemId/subtitles',
      queryParameters: {'key': '/library/streams/$subtitleId'},
    );
  }
}
