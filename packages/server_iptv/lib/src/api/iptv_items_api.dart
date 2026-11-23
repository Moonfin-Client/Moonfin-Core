import 'package:drift/drift.dart' show Value;
import 'package:server_core/server_core.dart';

import '../db/iptv_database.dart';
import '../ids.dart';
import '../iptv_backend.dart';
import '../mapping/item_mapper.dart';
import '../models/xtream_models.dart';
import '../repositories/vod_repository.dart'
    show CatalogPlayed, VodCatalogQuery, VodCatalogSort;
import '../repositories/watch_state_repository.dart'
    show IptvContentType, IptvItemKind;
import '../services/vod_title.dart'
    show episodeTitleOnly, genreHash, splitGenres;
import '../services/xtream_api_client.dart';

class IptvItemsApi implements ItemsApi {
  final IptvBackend _backend;

  IptvItemsApi(this._backend);

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
      return IptvItemMapper.itemsResult(await _itemsByIds(ids));
    }

    final types = includeItemTypes ?? const [];
    final wantsMovies = types.isEmpty || types.contains('Movie');
    final wantsSeries = types.isEmpty || types.contains('Series');

    // Music, collections, playlists and similar don't exist in an IPTV
    // catalog.
    const unsupportedTypes = {
      'Audio',
      'MusicAlbum',
      'MusicArtist',
      'MusicVideo',
      'Playlist',
      'BoxSet',
      'Book',
      'AudioBook',
      'Photo',
      'Game',
    };
    if (types.isNotEmpty && types.every(unsupportedTypes.contains)) {
      return IptvItemMapper.emptyItemsResult();
    }

    final noParent = parentId == null || parentId.isEmpty;
    final bool? isSeries;
    if (parentId == IptvLibraryIds.movies ||
        (noParent && wantsMovies && !wantsSeries)) {
      isSeries = false;
    } else if (parentId == IptvLibraryIds.shows ||
        (noParent && wantsSeries && !wantsMovies)) {
      isSeries = true;
    } else if (noParent && wantsMovies) {
      // Both kinds, since the branches above took the single-kind cases.
      isSeries = null;
    } else {
      // The parent belongs to another server or library, or neither movies
      // nor series were asked for.
      return IptvItemMapper.emptyItemsResult();
    }

    final wanted = {...?filters};
    // The catalog keeps no ratings or air status, so nothing matches these.
    if (wanted.contains('Likes') ||
        wanted.contains('Dislikes') ||
        (seriesStatus?.isNotEmpty ?? false)) {
      return IptvItemMapper.emptyItemsResult();
    }
    final favoritesOnly = isFavorite == true || wanted.contains('IsFavorite');
    final played = wanted.contains('IsResumable')
        ? CatalogPlayed.resumable
        : wanted.contains('IsPlayed')
        ? CatalogPlayed.played
        : wanted.contains('IsUnplayed')
        ? CatalogPlayed.unplayed
        : null;

    final playlistIds = await _backend.allPlaylistIds();
    final profileId = _backend.activeProfileId;
    if (playlistIds.isEmpty ||
        (profileId == null && (favoritesOnly || played != null))) {
      return IptvItemMapper.emptyItemsResult();
    }

    List<String>? genreValues;
    if ((genres?.isNotEmpty ?? false) || (genreIds?.isNotEmpty ?? false)) {
      final wantedNames = {
        for (final g in genres ?? const <String>[]) g.toLowerCase(),
      };
      final wantedIds = {...?genreIds};
      bool wanted(String genre) =>
          wantedNames.contains(genre.toLowerCase()) ||
          wantedIds.contains(_genreId(genre));
      genreValues = [
        for (final value in await _backend.vod.getDistinctGenreValues(
          playlistIds,
        ))
          if (splitGenres(value).any(wanted)) value,
      ];
      if (genreValues.isEmpty) return IptvItemMapper.emptyItemsResult();
    }

    final term = searchTerm?.trim();
    final searching = term != null && term.isNotEmpty;
    final query = VodCatalogQuery(
      playlistIds: playlistIds,
      isSeries: isSeries,
      // M3U movie files carry no genre metadata, so a genre filter drops them.
      withChannelMovies:
          wantsMovies &&
          genreValues == null &&
          (parentId == null ||
              parentId.isEmpty ||
              parentId == IptvLibraryIds.movies),
      profileId: profileId,
      favoritesOnly: favoritesOnly,
      played: played,
      genreValues: genreValues,
      nameContains: searching ? term : null,
    );

    final total = enableTotalRecordCount == false && limit != 0
        ? null
        : await _backend.vod.countCatalog(query);
    if (limit == 0) {
      return IptvItemMapper.itemsResult([], totalRecordCount: total);
    }

    final page = await _backend.vod.getCatalogPage(
      query,
      sort: switch (sortBy?.split(',').first) {
        'DateCreated' || 'DateLastContentAdded' => VodCatalogSort.added,
        'ProductionYear' || 'PremiereDate' => VodCatalogSort.year,
        'CommunityRating' => VodCatalogSort.rating,
        _ => VodCatalogSort.name,
      },
      descending: sortOrder?.split(',').first.toLowerCase() == 'descending',
      offset: startIndex ?? 0,
      // A search with no limit would match most of a big catalog.
      limit: limit ?? (searching ? 80 : null),
    );

    final vodIds = [
      for (final row in page)
        if (!row.isChannel) row.id,
    ];
    final channelIds = [
      for (final row in page)
        if (row.isChannel) row.id,
    ];
    final vodMaps = await _vodMaps(await _backend.vod.getVodByIds(vodIds));
    final channelById = {
      for (final c in await _backend.channels.getChannelsByIds(channelIds))
        c.id: c,
    };
    final favoriteChannels = await _favoriteIds(
      IptvItemKind.channel,
      channelIds,
    );

    return IptvItemMapper.itemsResult([
      for (final row in page)
        if (!row.isChannel)
          ?vodMaps[row.id]
        else if (channelById[row.id] case final channel?)
          IptvItemMapper.vodChannelToMap(
            channel,
            isFavorite: favoriteChannels.contains(channel.id),
          ),
    ], totalRecordCount: total);
  }

  /// Movie and series maps keyed by row id, in the order given, with the
  /// active profile's favorites, resume points and episode counts.
  Future<Map<int, Map<String, dynamic>>> _vodMaps(List<VodItem> items) async {
    if (items.isEmpty) return const {};
    final profileId = _backend.activeProfileId;
    final favorites = await _favoriteIds(IptvItemKind.vod, [
      for (final v in items) v.id,
    ]);
    final progress = profileId == null
        ? const <int, WatchHistoryData>{}
        : await _backend.watchState.getMovieProgressMap(profileId, [
            for (final v in items)
              if (!v.isSeries) v.id,
          ]);
    final episodes = await _backend.vod.getEpisodeCounts(
      items,
      profileId: profileId,
    );
    return {
      for (final v in items)
        v.id: IptvItemMapper.vodToMap(
          v,
          isFavorite: favorites.contains(v.id),
          positionMs: progress[v.id]?.positionMs ?? 0,
          played: progress[v.id]?.played ?? false,
          episodes: episodes[v.id],
        ),
    };
  }

  static String _genreId(String name) => 'iptv_genre_${genreHash(name)}';

  Future<Set<int>> _favoriteIds(String itemKind, List<int> among) async {
    final profileId = _backend.activeProfileId;
    if (profileId == null || among.isEmpty) return const {};
    return (await _backend.watchState.getFavoriteRefIds(
      profileId,
      itemKind,
      among: among,
    )).toSet();
  }

  /// [_tryGetItemMap] for a list of ids with batched lookups and no TMDB
  /// enrichment, in the order the ids came in.
  Future<List<Map<String, dynamic>>> _itemsByIds(List<String> ids) async {
    final parsed = {for (final id in ids) id: IptvId.tryParse(id)};
    final channelIds = [
      for (final p in parsed.values)
        if (p is IptvChannelId) p.channelRowId,
    ];
    final vodIds = [
      for (final p in parsed.values)
        if (p case IptvVodId(:final vodRowId) || IptvSeriesId(:final vodRowId))
          vodRowId,
    ];
    final episodeIds = [
      for (final p in parsed.values)
        if (p is IptvEpisodeId) p.episodeRowId,
    ];

    final channels = {
      for (final c in await _backend.channels.getChannelsByIds(channelIds))
        c.id: c,
    };
    final vodMaps = await _vodMaps(await _backend.vod.getVodByIds(vodIds));
    final episodes = {
      for (final e in await _backend.vod.getEpisodesByRowIds(episodeIds))
        e.id: e,
    };
    final seriesByKey = await _backend.vod.getSeriesByStreamIds({
      for (final e in episodes.values) (e.playlistId, e.seriesId),
    });

    final favoriteChannels = await _favoriteIds(
      IptvItemKind.channel,
      channelIds,
    );
    final profileId = _backend.activeProfileId;
    final episodeProgress = profileId == null
        ? const <int, WatchHistoryData>{}
        : await _backend.watchState.getEpisodeProgressMap(
            profileId,
            episodes.keys.toList(),
          );

    final items = <Map<String, dynamic>>[];
    for (final id in ids) {
      switch (parsed[id]) {
        case IptvChannelId(:final channelRowId):
          final channel = channels[channelRowId];
          if (channel == null) break;
          final favorite = favoriteChannels.contains(channel.id);
          items.add(
            channel.isVod
                ? IptvItemMapper.vodChannelToMap(channel, isFavorite: favorite)
                : IptvItemMapper.channelToMap(channel, isFavorite: favorite),
          );

        case IptvVodId(:final vodRowId) || IptvSeriesId(:final vodRowId):
          if (vodMaps[vodRowId] case final map?) items.add(map);

        case IptvEpisodeId(:final episodeRowId):
          final episode = episodes[episodeRowId];
          if (episode == null) break;
          final series = seriesByKey[(episode.playlistId, episode.seriesId)];
          if (series == null) break;
          final progress = episodeProgress[episodeRowId];
          items.add(
            IptvItemMapper.episodeToMap(
              episode,
              series: series,
              positionMs: progress?.positionMs ?? 0,
              played: progress?.played ?? false,
            ),
          );

        default:
          // Seasons and libraries are rare here, so they load one at a time.
          final item = await _tryGetItemMap(id);
          if (item != null) items.add(item);
      }
    }
    return items;
  }

  Future<Map<String, dynamic>?> _tryGetItemMap(String itemId) async {
    final parsed = IptvId.tryParse(itemId);
    final profileId = _backend.activeProfileId;

    switch (parsed) {
      case IptvChannelId(:final channelRowId):
        final channel = await _backend.channels.getChannelById(channelRowId);
        if (channel == null) return null;
        var favorite = false;
        if (profileId != null) {
          favorite = await _backend.watchState.isFavorite(
            profileId: profileId,
            itemKind: IptvItemKind.channel,
            refId: channel.id,
          );
        }
        if (channel.isVod) {
          return IptvItemMapper.vodChannelToMap(channel, isFavorite: favorite);
        }
        return IptvItemMapper.channelToMap(channel, isFavorite: favorite);

      case IptvVodId(:final vodRowId) || IptvSeriesId(:final vodRowId):
        var vodItem = await _backend.vod.getVodById(vodRowId);
        if (vodItem == null) return null;
        // Provider details go in first, and TMDB, when a key is set, replaces
        // them where it has its own and fills in the rest.
        if (vodItem.isSeries) {
          await _ensureSeriesDetails(vodItem);
        } else {
          await _ensureMovieDetails(vodItem);
        }
        vodItem = await _backend.vod.getVodById(vodRowId) ?? vodItem;
        final enricher = _backend.enricher;
        if (enricher != null) {
          vodItem = await enricher.enrich(vodItem);
        }
        return (await _vodMaps([vodItem]))[vodItem.id];

      case IptvEpisodeId(:final episodeRowId):
        WatchHistoryData? progress;
        if (profileId != null) {
          progress = (await _backend.watchState.getEpisodeProgressMap(
            profileId,
            [episodeRowId],
          ))[episodeRowId];
        }
        return _episodeMap(episodeRowId, progress);

      case IptvSeasonId(:final vodRowId, :final seasonNumber):
        final series = await _backend.vod.getVodById(vodRowId);
        if (series == null || !series.isSeries) return null;
        final seasons = await _backend.vod.getSeasonsForSeries(
          series.playlistId,
          series.streamId,
        );
        final season = seasons
            .where((s) => s.seasonNumber == seasonNumber)
            .firstOrNull;
        if (season == null) return null;
        return IptvItemMapper.seasonToMap(
          season,
          series: series,
          labels: _backend.labels(),
        );

      case IptvLibraryId(:final id):
        return IptvItemMapper.libraryToMap(id, _backend.labels());

      default:
        return null;
    }
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    final item = await _tryGetItemMap(itemId);
    if (item == null) {
      throw Exception('IPTV item not found: $itemId');
    }
    return item;
  }

  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async => [];

  @override
  Future<Map<String, dynamic>> getSimilarItems(
    String itemId, {
    int? limit,
    String? bypass,
  }) async {
    final rowId = switch (IptvId.tryParse(itemId)) {
      IptvVodId(:final vodRowId) || IptvSeriesId(:final vodRowId) => vodRowId,
      _ => null,
    };
    if (rowId == null) return IptvItemMapper.emptyItemsResult();
    final item = await _backend.vod.getVodById(rowId);
    final firstGenre = splitGenres(item?.genre).firstOrNull;
    if (item == null || firstGenre == null) {
      return IptvItemMapper.emptyItemsResult();
    }
    final playlistIds = await _backend.allPlaylistIds();
    final similar = await _backend.vod.getSimilarByGenreForPlaylists(
      playlistIds,
      firstGenre,
      item.id,
      limit: limit ?? 10,
    );
    return IptvItemMapper.itemsResult(
      (await _vodMaps(similar)).values.toList(),
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
    final profileId = _backend.activeProfileId;
    if (profileId == null) {
      return IptvItemMapper.emptyItemsResult();
    }
    // The catalog is video only, so an audio row gets nothing.
    if (mediaTypes != null && !mediaTypes.contains('Video')) {
      return IptvItemMapper.emptyItemsResult();
    }
    final types = includeItemTypes ?? const <String>[];
    final anyType = types.isEmpty || types.contains('Video');
    final movies = anyType || types.contains('Movie');
    final episodes = anyType || types.contains('Episode');
    if (!movies && !episodes) return IptvItemMapper.emptyItemsResult();

    final rows = await _backend.watchState.getContinueWatching(
      profileId,
      limit: limit ?? 20,
    );
    final items = <Map<String, dynamic>>[];
    for (final row in rows) {
      if (movies &&
          row.contentType == IptvContentType.movie &&
          row.vodItemId != null) {
        final vodItem = await _backend.vod.getVodById(row.vodItemId!);
        if (vodItem == null) continue;
        items.add(
          IptvItemMapper.vodToMap(
            vodItem,
            positionMs: row.positionMs,
            played: row.played,
          ),
        );
      } else if (episodes &&
          row.contentType == IptvContentType.episode &&
          row.episodeId != null) {
        final episodeMap = await _episodeMap(row.episodeId!, row);
        if (episodeMap != null) items.add(episodeMap);
      }
    }
    return IptvItemMapper.itemsResult(items);
  }

  Future<Map<String, dynamic>?> _episodeMap(
    int episodeRowId,
    WatchHistoryData? progress,
  ) async {
    final episode = await _backend.vod.getEpisodeByRowId(episodeRowId);
    if (episode == null) return null;
    final series = await _backend.vod.getSeriesByStreamId(
      episode.playlistId,
      episode.seriesId,
    );
    if (series == null) return null;
    return IptvItemMapper.episodeToMap(
      episode,
      series: series,
      positionMs: progress?.positionMs ?? 0,
      played: progress?.played ?? false,
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
    final profileId = _backend.activeProfileId;
    if (profileId == null) {
      return IptvItemMapper.emptyItemsResult();
    }

    final wanted = seriesId != null
        ? await _seriesFromEncodedId(seriesId)
        : null;
    if (seriesId != null && wanted == null) {
      return IptvItemMapper.emptyItemsResult();
    }

    final history = await _backend.watchState.getAllHistory(
      profileId,
      contentType: IptvContentType.episode,
    );
    final watchedEpisodes = {
      for (final e in await _backend.vod.getEpisodesByRowIds([
        for (final row in history) ?row.episodeId,
      ]))
        e.id: e,
    };

    // The newest history row per series, newest series first. A series is
    // keyed with its playlist, since two providers can reuse a series id.
    final latest = <(int, int), (WatchHistoryData, SeriesEpisode)>{};
    for (final row in history) {
      final episode = watchedEpisodes[row.episodeId];
      if (episode == null) continue;
      latest.putIfAbsent((
        episode.playlistId,
        episode.seriesId,
      ), () => (row, episode));
    }
    final wantedKey = wanted == null
        ? null
        : (wanted.playlistId, wanted.streamId);
    // A half-watched episode already shows under resume, so next up only
    // advances series whose latest episode is finished.
    final candidates = [
      for (final MapEntry(:key, value: (row, episode)) in latest.entries)
        if (row.played && (wantedKey == null || key == wantedKey))
          (key, episode),
    ];
    final seriesByKey = await _backend.vod.getSeriesByStreamIds({
      for (final (key, _) in candidates) key,
    });

    final items = <Map<String, dynamic>>[];
    for (final ((playlistId, seriesStreamId), watched) in candidates) {
      if (items.length >= (limit ?? 10)) break;
      final series = wanted ?? seriesByKey[(playlistId, seriesStreamId)];
      if (series == null) continue;
      final ordered = await _backend.vod.getEpisodesForSeries(
        playlistId,
        seriesStreamId,
      );
      final index = ordered.indexWhere((e) => e.id == watched.id);
      if (index < 0 || index + 1 >= ordered.length) continue;
      items.add(
        IptvItemMapper.episodeToMap(ordered[index + 1], series: series),
      );
    }
    return IptvItemMapper.itemsResult(items);
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
    final types = includeItemTypes ?? const [];
    final wantsMovies = types.isEmpty || types.contains('Movie');
    final wantsSeries = types.isEmpty || types.contains('Series');
    if (!wantsMovies && !wantsSeries) {
      return IptvItemMapper.emptyItemsResult();
    }
    if (parentId != null &&
        parentId.isNotEmpty &&
        parentId != IptvLibraryIds.movies &&
        parentId != IptvLibraryIds.shows) {
      return IptvItemMapper.emptyItemsResult();
    }

    final playlistIds = await _backend.allPlaylistIds();
    if (playlistIds.isEmpty) return IptvItemMapper.emptyItemsResult();

    final items = await _backend.vod.getRecentlyAddedForPlaylists(
      playlistIds,
      isSeries:
          parentId == IptvLibraryIds.shows || (wantsSeries && !wantsMovies)
          ? true
          : parentId == IptvLibraryIds.movies || (wantsMovies && !wantsSeries)
          ? false
          : null,
      limit: limit ?? 20,
    );

    return IptvItemMapper.itemsResult((await _vodMaps(items)).values.toList());
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
  }) async => IptvItemMapper.emptyItemsResult();

  static const _seriesDetailsTtl = Duration(hours: 24);

  /// Movies already asked for this session, so one without details on the
  /// panel isn't asked again on every open.
  final Set<int> _movieDetailsTried = {};

  Future<XtreamApiClient?> _xtreamClient(int playlistId) async {
    final creds = await _backend.xtreamCredentialsFor(playlistId);
    return creds == null ? null : XtreamApiClient(credentials: creds);
  }

  /// Movies arrive from the list call without their plot, runtime or art, so
  /// the first open asks the panel for them.
  Future<void> _ensureMovieDetails(VodItem movie) async {
    if (movie.plot != null || !_movieDetailsTried.add(movie.id)) return;
    try {
      final client = await _xtreamClient(movie.playlistId);
      final info = (await client?.getVodInfo(movie.streamId))?['info'];
      if (info is Map) {
        await _backend.vod.fillVodDetails(
          movie.id,
          XtreamDetails.fromJson(Map<String, dynamic>.from(info)),
        );
      }
    } catch (_) {}
  }

  /// Fetches running for a series, so the getItem, getSeasons and
  /// getEpisodes calls a series page makes all share one.
  final Map<int, Future<void>> _seriesFetches = {};

  /// Caches the series' details, seasons and episodes from the provider. A
  /// series with a cache is served from it at once, and a stale cache is
  /// refreshed in the background for the next visit.
  Future<void> _ensureSeriesDetails(VodItem series) async {
    final fetchedAt = await _backend.vod.getSeriesDetailsFetchedAt(
      series.playlistId,
      series.streamId,
    );
    if (fetchedAt != null &&
        DateTime.now().difference(fetchedAt) < _seriesDetailsTtl) {
      return;
    }
    // A block body, because remove returns this same future, and
    // whenComplete would then wait on it forever.
    final fetch = _seriesFetches[series.id] ??= _fetchSeriesDetails(series)
        .whenComplete(() {
          _seriesFetches.remove(series.id);
        });
    if (fetchedAt == null) await fetch;
  }

  /// A failed or empty answer leaves the cache as it was, so the UI serves
  /// whatever it already has.
  Future<void> _fetchSeriesDetails(VodItem series) async {
    try {
      final client = await _xtreamClient(series.playlistId);
      if (client == null) return;
      final data = await client.getSeriesInfo(series.streamId);
      if (data['info'] case final Map info) {
        await _backend.vod.fillVodDetails(
          series.id,
          XtreamDetails.fromJson(Map<String, dynamic>.from(info)),
        );
      }
      final seasonsMap = switch (data['episodes']) {
        final Map map => map,
        _ => const {},
      };
      final coverBySeason = <int, String>{};
      if (data['seasons'] case final List seasons) {
        for (final season in seasons.whereType<Map>()) {
          final number = int.tryParse('${season['season_number']}');
          final cover = _seasonCover(season);
          if (number != null && cover != null) coverBySeason[number] = cover;
        }
      }

      final seasons = <SeriesSeasonsCompanion>[];
      final episodes = <SeriesEpisodesCompanion>[];
      for (final entry in seasonsMap.entries) {
        final seasonNumber = int.tryParse('${entry.key}') ?? 0;
        final episodeList = (entry.value as List?) ?? const [];
        seasons.add(
          SeriesSeasonsCompanion.insert(
            playlistId: series.playlistId,
            seriesId: series.streamId,
            seasonNumber: seasonNumber,
            coverUrl: Value(coverBySeason[seasonNumber]),
            episodeCount: Value(episodeList.length),
          ),
        );
        for (final raw in episodeList) {
          if (raw is! Map) continue;
          final episode = Map<String, dynamic>.from(raw);
          final info = episode['info'] is Map
              ? Map<String, dynamic>.from(episode['info'] as Map)
              : const <String, dynamic>{};
          final episodeId = int.tryParse(episode['id']?.toString() ?? '');
          if (episodeId == null) continue;
          final episodeNumber = int.tryParse(
            episode['episode_num']?.toString() ?? '',
          );
          // Panels nest most details under info, older ones put them on the
          // episode itself.
          final fromInfo = XtreamDetails.fromJson(info);
          final fromEpisode = XtreamDetails.fromJson(episode);
          episodes.add(
            SeriesEpisodesCompanion.insert(
              playlistId: series.playlistId,
              seriesId: series.streamId,
              episodeId: episodeId,
              seasonNumber: seasonNumber,
              episodeNumber: Value(episodeNumber),
              title:
                  episodeTitleOnly(episode['title']?.toString() ?? '') ??
                  _backend.labels().episode(episodeNumber ?? 0),
              plot: Value(fromInfo.plot ?? fromEpisode.plot),
              durationSeconds: Value(
                fromInfo.durationSeconds ?? fromEpisode.durationSeconds,
              ),
              containerExtension: Value(
                episode['container_extension']?.toString(),
              ),
              stillUrl: Value(
                info['movie_image']?.toString() ?? episode['cover']?.toString(),
              ),
              rating: Value(fromInfo.rating ?? fromEpisode.rating),
              airDate: Value(
                DateTime.tryParse(info['releaseDate']?.toString() ?? ''),
              ),
            ),
          );
        }
      }

      // An answer without episodes is usually a refusal, and replacing the
      // cache with it would drop the saved episodes and their progress.
      if (episodes.isEmpty) return;
      await _backend.vod.replaceSeriesDetails(
        playlistId: series.playlistId,
        seriesId: series.streamId,
        seasons: seasons,
        episodes: episodes,
      );
    } catch (_) {}
  }

  static String? _seasonCover(Map season) {
    for (final key in const ['cover_big', 'cover']) {
      final url = season[key]?.toString().trim();
      if (url != null && url.isNotEmpty) return url;
    }
    return null;
  }

  Future<VodItem?> _seriesFromEncodedId(String encodedId) async {
    final parsed = IptvId.tryParse(encodedId);
    final rowId = switch (parsed) {
      IptvSeriesId(:final vodRowId) => vodRowId,
      IptvSeasonId(:final vodRowId) => vodRowId,
      _ => null,
    };
    if (rowId == null) return null;
    final item = await _backend.vod.getVodById(rowId);
    return (item != null && item.isSeries) ? item : null;
  }

  @override
  Future<Map<String, dynamic>> getSeasons(
    String seriesId, {
    String? fields,
  }) async {
    final series = await _seriesFromEncodedId(seriesId);
    if (series == null) return IptvItemMapper.emptyItemsResult();

    await _ensureSeriesDetails(series);
    final seasons = await _backend.vod.getSeasonsForSeries(
      series.playlistId,
      series.streamId,
    );
    final episodes = await _backend.vod.getEpisodesForSeries(
      series.playlistId,
      series.streamId,
    );
    final progress = await _episodeProgress(episodes);
    final unplayedBySeason = <int, int>{};
    for (final e in episodes) {
      final unplayed = progress[e.id]?.played == true ? 0 : 1;
      unplayedBySeason.update(
        e.seasonNumber,
        (count) => count + unplayed,
        ifAbsent: () => unplayed,
      );
    }
    final labels = _backend.labels();
    return IptvItemMapper.itemsResult([
      for (final season in seasons)
        IptvItemMapper.seasonToMap(
          season,
          series: series,
          labels: labels,
          unplayedCount: unplayedBySeason[season.seasonNumber],
        ),
    ]);
  }

  @override
  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  }) async {
    final series = await _seriesFromEncodedId(seriesId);
    if (series == null) return IptvItemMapper.emptyItemsResult();

    await _ensureSeriesDetails(series);

    List<SeriesEpisode> episodes;
    final parsedSeason = seasonId != null ? IptvId.tryParse(seasonId) : null;
    if (parsedSeason is IptvSeasonId) {
      episodes = await _backend.vod.getEpisodesForSeason(
        series.playlistId,
        series.streamId,
        parsedSeason.seasonNumber,
      );
    } else {
      episodes = await _backend.vod.getEpisodesForSeries(
        series.playlistId,
        series.streamId,
      );
    }

    final progress = await _episodeProgress(episodes);
    return IptvItemMapper.itemsResult([
      for (final episode in episodes)
        IptvItemMapper.episodeToMap(
          episode,
          series: series,
          positionMs: progress[episode.id]?.positionMs ?? 0,
          played: progress[episode.id]?.played ?? false,
        ),
    ]);
  }

  Future<Map<int, WatchHistoryData>> _episodeProgress(
    List<SeriesEpisode> episodes,
  ) async {
    final profileId = _backend.activeProfileId;
    if (profileId == null || episodes.isEmpty) return const {};
    return _backend.watchState.getEpisodeProgressMap(profileId, [
      for (final e in episodes) e.id,
    ]);
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
    final playlistIds = await _backend.allPlaylistIds();
    if (playlistIds.isEmpty) return IptvItemMapper.emptyItemsResult();
    final genres = await _backend.vod.getAllGenresForPlaylists(playlistIds);
    final start = (startIndex ?? 0).clamp(0, genres.length);
    final end = limit == null
        ? genres.length
        : (start + limit).clamp(start, genres.length);
    return IptvItemMapper.itemsResult([
      for (final name in genres.sublist(start, end))
        {
          // getItems maps the id back to the name through the same hash.
          'Id': _genreId(name),
          'Name': name,
          'Type': 'Genre',
          'ImageTags': const <String, dynamic>{},
        },
    ], totalRecordCount: genres.length);
  }

  @override
  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  }) async => IptvItemMapper.emptyItemsResult();

  @override
  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  }) async => {'ThemeSongsResult': IptvItemMapper.emptyItemsResult()};

  @override
  Future<Map<String, dynamic>> getPlaylists() async =>
      IptvItemMapper.emptyItemsResult();

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
  }) async => IptvItemMapper.emptyItemsResult();

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
  }) async => IptvItemMapper.emptyItemsResult();

  @override
  Future<Map<String, dynamic>> getPlaylistItems(
    String playlistId, {
    int? startIndex,
    int? limit,
    String? fields,
  }) async => IptvItemMapper.emptyItemsResult();

  @override
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  }) async => QueryFilterValues.empty;

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
  }) async => IptvItemMapper.emptyItemsResult();

  @override
  Future<List<Map<String, dynamic>>> getAdditionalParts(String itemId) async =>
      [];

  @override
  Future<Map<String, dynamic>> getLyrics(String itemId) async => {};

  @override
  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId) async =>
      [];

  @override
  Future<List<Map<String, dynamic>>> getIntros(String itemId) async => [];

  @override
  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId) async =>
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

  @override
  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId) async {}

  @override
  Future<Map<String, dynamic>> createPlaylist({
    required String name,
    List<String>? itemIds,
  }) => throw UnsupportedError('Playlists are not supported on IPTV');

  @override
  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) => throw UnsupportedError('Collections are not supported on IPTV');

  @override
  Future<void> addToPlaylist(String playlistId, List<String> itemIds) =>
      throw UnsupportedError('Playlists are not supported on IPTV');

  @override
  Future<void> addToCollection(String collectionId, List<String> itemIds) =>
      throw UnsupportedError('Collections are not supported on IPTV');

  @override
  Future<void> removeFromCollection(
    String collectionId,
    List<String> itemIds,
  ) => throw UnsupportedError('Collections are not supported on IPTV');

  @override
  Future<void> removeFromPlaylist(String playlistId, List<String> entryIds) =>
      throw UnsupportedError('Playlists are not supported on IPTV');

  @override
  Future<void> movePlaylistItem(
    String playlistId,
    String playlistItemId,
    int newIndex,
  ) => throw UnsupportedError('Playlists are not supported on IPTV');

  @override
  Future<void> renamePlaylist(String playlistId, String name) =>
      throw UnsupportedError('Playlists are not supported on IPTV');

  @override
  Future<void> deleteItem(String itemId) =>
      throw UnsupportedError('Deleting items is not supported on IPTV');

  @override
  Future<void> deletePlaylist(String playlistId) =>
      throw UnsupportedError('Playlists are not supported on IPTV');
}
