import 'dart:async';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:dio/dio.dart';

import '../../preference/home_section_config.dart';
import '../../preference/user_preferences.dart';
import '../../preference/preference_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/current_app_localizations.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/latest_media_row_normalizer.dart';
import '../utils/genre_browse_utils.dart';
import '../utils/next_up_cutoff.dart';
import '../utils/next_up_enrichment.dart';
import '../utils/playlist_utils.dart';
import 'package:flutter/foundation.dart';
import '../repositories/seerr_repository.dart';
import '../repositories/user_views_repository.dart';
import '../../preference/seerr_preferences.dart';
import '../viewmodels/seerr_discover_view_model.dart';
import '../viewmodels/live_tv_guide_view_model.dart';
import 'custom_external_lists_service.dart';
import 'plugin_sync_service.dart';

class RowDataSource {
  final MediaServerClient _client;

  static const _defaultLimit = 15;
  static const _maxItems = 100;
  static const _defaultSortBy = 'SortName';
  static const _defaultSortOrder = 'Ascending';
  static const _studioPageSize = 200;
  static const _genreArtworkConcurrency = 6;

  static const _fields =
      'DateCreated,Type,UserData,Overview,Genres,CommunityRating,CriticRating,'
      'OfficialRating,RunTimeTicks,ProductionYear,SeriesName,'
      'ParentIndexNumber,IndexNumber,Status,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,'
      'ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,'
      'ParentLogoItemId,ParentLogoImageTag,PrimaryImageTag,PrimaryImageAspectRatio';
  static const _fallbackFields =
      'DateCreated,Type,UserData,OfficialRating,RunTimeTicks,ProductionYear,SeriesName,'
      'ParentIndexNumber,IndexNumber,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,'
      'ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,'
      'ParentLogoItemId,ParentLogoImageTag';
  static const _minimalFields =
      'Type,UserData,RunTimeTicks,ProductionYear,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,SeriesId';

  // Cache for local recommendations to make them practically instantaneous
  static const int _recommendationCacheMaxEntries = 64;
  static final Map<String, List<Map<String, dynamic>>> _recommendationCache = {};
  static final Map<String, List<AggregatedItem>> _scoredRecommendationsCache = {};

  static void clearRecommendationCache() {
    _recommendationCache.clear();
    _scoredRecommendationsCache.clear();
  }

  static void _cacheRecommendations(String key, List<Map<String, dynamic>> items) {
    _recommendationCache.remove(key);
    _recommendationCache[key] = items;
    while (_recommendationCache.length > _recommendationCacheMaxEntries) {
      _recommendationCache.remove(_recommendationCache.keys.first);
    }
  }

  // Cap image tags to one per type (server returns all by default)
  static const _imageTypes = 'Primary,Backdrop,Thumb,Banner';
  static const _imageTypeLimit = 1;

  // ParentIds that returned 401/403 (no library access) this session. They are
  // skipped on later requests so a restricted user does not repeatedly hit the
  // server with 401s, which can trip reverse-proxy Fail2Ban jails (#635).
  final Set<String> _accessDeniedParentIds = <String>{};

  RowDataSource(this._client);

  ImageApi get imageApi => _client.imageApi;
  AppLocalizations get _l10n => currentAppLocalizations();

  bool _isAccessDenied(String? parentId) =>
      parentId != null && _accessDeniedParentIds.contains(parentId);

  void _recordIfAccessDenied(int statusCode, String? parentId) {
    if ((statusCode == 401 || statusCode == 403) && parentId != null) {
      _accessDeniedParentIds.add(parentId);
    }
  }

  /// A rejected request is worth one more try without the optional fields,
  /// since a server that has no name for one of them turns the whole call down
  /// rather than ignoring it.
  static bool _shouldRetryWithoutFields(int statusCode) =>
      statusCode == 400 || statusCode >= 500;

  Future<bool> hasLiveTvChannels() async {
    final response = await _client.liveTvApi.getChannels(
      limit: 1,
      enableTotalRecordCount: true,
    );
    final total = response['TotalRecordCount'] as int? ?? 0;
    return total > 0;
  }

  /// Ordered the same way as the guide, so a channel sits where the user
  /// expects to find it.
  Future<HomeRow> loadFavoritesChannels(String serverId) async {
    final response = await _client.liveTvApi.getChannels(
      fields: 'ImageTags,UserData',
    );
    final pairs = <(GuideChannel, AggregatedItem)>[];
    for (final item in _parseItems(response, serverId)) {
      if (!item.isFavorite) continue;
      pairs.add((GuideChannel.fromRawItem(item.rawData), item));
    }
    if (GetIt.instance.isRegistered<UserPreferences>()) {
      final prefs = GetIt.instance<UserPreferences>();
      final sortBy = prefs.get(UserPreferences.liveTvChannelSortBy);
      final channelCompare = LiveTvGuideViewModel.comparatorFor(sortBy);
      pairs.sort((a, b) => channelCompare(a.$1, b.$1));
    }
    final items = [for (final pair in pairs) pair.$2];
    return HomeRow(
      id: 'liveTvFavorites',
      title: _l10n.favoriteChannels,
      items: items,
      rowType: HomeRowType.liveTvFavorites,
      totalCount: items.length,
    );
  }

  Future<HomeRow> loadOnNow(String serverId) async {
    final response = await _client.liveTvApi.getRecommendedPrograms(
      limit: _defaultLimit,
      isAiring: true,
    );
    return _buildRow(
      id: 'liveTvOnNow',
      title: _l10n.onNow,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.liveTvOnNow,
    );
  }

  Future<HomeRow> loadResume(String serverId, {int? startIndex}) async {
    final response = await _getResumeItemsWithFallback(
      includeItemTypes: ['Movie', 'Episode'],
      startIndex: startIndex,
      limit: _defaultLimit,
    );
    return _buildRow(
      id: 'resume',
      title: _l10n.continueWatching,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.resume,
    );
  }

  Future<HomeRow> loadResumeAudio(String serverId) async {
    final response = await _getResumeItemsWithFallback(
      includeItemTypes: ['Audio'],
      limit: _defaultLimit,
    );
    return _buildRow(
      id: 'resumeAudio',
      title: _l10n.continueListening,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.resumeAudio,
    );
  }

  Future<HomeRow> loadNextUp(String serverId, {int? startIndex}) async {
    final response = await _getNextUpWithFallback(
      startIndex: startIndex,
      limit: _defaultLimit,
      enableResumable: false,
    );
    final row = _buildRow(
      id: 'nextUp',
      title: _l10n.nextUp,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.nextUp,
    );
    final enrichedItems = await _enrichNextUpItemsWithSeriesLastPlayed(
      row.items,
    );
    return row.copyWith(items: enrichedItems);
  }

  Future<HomeRow> loadResumeRelaxed(String serverId) async {
    final response = await getResumeItemsRelaxed(
      includeItemTypes: const ['Movie', 'Episode'],
      limit: _defaultLimit,
    );
    return _buildRow(
      id: 'resume',
      title: _l10n.continueWatching,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.resume,
    );
  }

  Future<HomeRow> loadNextUpRelaxed(String serverId) async {
    final response = await getNextUpRelaxed(limit: _defaultLimit);
    final row = _buildRow(
      id: 'nextUp',
      title: _l10n.nextUp,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.nextUp,
    );
    final enrichedItems = await _enrichNextUpItemsWithSeriesLastPlayed(
      row.items,
    );
    return row.copyWith(items: enrichedItems);
  }

  Future<HomeRow> loadLatestMedia(
    String parentId,
    String libraryName,
    String serverId, [
    String? collectionType,
  ]) async {
    final fetchLimit = latestMediaFetchLimitForCollection(
      collectionType,
      defaultLimit: _defaultLimit,
      maxLimit: _maxItems,
    );
    final response = await _getLatestItemsWithFallback(
      parentId: parentId,
      limit: fetchLimit,
    );
    final items = normalizeLatestMediaItems(
      _parseItems(response, serverId),
      collectionType: collectionType,
      limit: _defaultLimit,
    );
    return HomeRow(
      id: 'latest_$parentId',
      title: _l10n.latestLibraryName(libraryName),
      items: items,
      rowType: HomeRowType.latestMedia,
      totalCount: items.length < _defaultLimit ? items.length : _maxItems,
      isAudio: collectionType == 'music',
    );
  }

  /// Latest items of [includeItemTypes] across every library, used to feed the
  /// Android TV launcher channel rows where a single per library row does not
  /// make sense.
  Future<List<AggregatedItem>> loadLatestByType(
    String serverId,
    List<String> includeItemTypes, {
    int limit = _defaultLimit,
  }) async {
    final response = await _client.itemsApi.getLatestItems(
      includeItemTypes: includeItemTypes,
      limit: limit,
      fields: _fields,
      enableImageTypes: _imageTypes,
      imageTypeLimit: _imageTypeLimit,
    );
    return _parseItems(response, serverId);
  }

  /// Recently released items of [includeItemTypes] across every library, the
  /// "upcoming" companion to [loadLatestByType].
  Future<List<AggregatedItem>> loadRecentlyReleasedByType(
    String serverId,
    List<String> includeItemTypes, {
    int limit = _defaultLimit,
  }) async {
    final response = await _client.itemsApi.getRecentlyReleasedItems(
      includeItemTypes: includeItemTypes,
      limit: limit,
      fields: _fields,
      enableImageTypes: _imageTypes,
      imageTypeLimit: _imageTypeLimit,
      // No parent to scope to, so without recursion the server only offers
      // the library folders themselves.
      recursive: true,
    );
    return _parseItems(response, serverId);
  }

  Future<HomeRow> loadRecentlyReleased(
    String parentId,
    String libraryName,
    String serverId, [
    String? collectionType,
  ]) async {
    final fetchLimit = latestMediaFetchLimitForCollection(
      collectionType,
      defaultLimit: _defaultLimit,
      maxLimit: _maxItems,
    );
    List<String>? seriesType;
    var recursive = false;
    if (collectionType == 'tvshows') {
      final prefSeriesType = GetIt.instance<UserPreferences>().get(
        UserPreferences.recentlyReleasedSeriesType,
      );
      seriesType = switch (prefSeriesType) {
        RecentlyReleasedSeriesType.series => const ['Series'],
        RecentlyReleasedSeriesType.season => const ['Season'],
        RecentlyReleasedSeriesType.episode => const ['Episode'],
      };
      // Seasons and episodes sit below the library rather than directly in it.
      recursive = prefSeriesType != RecentlyReleasedSeriesType.series;
    }
    final response = await _getRecentlyReleasedItemsWithFallback(
      parentId: parentId,
      limit: fetchLimit,
      includeItemTypes: seriesType,
      recursive: recursive,
    );
    final items = normalizeLatestMediaItems(
      _parseItems(response, serverId),
      collectionType: collectionType,
      limit: _defaultLimit,
    );
    return HomeRow(
      id: 'recently_released_$parentId',
      title: _l10n.recentlyReleasedLibraryName(libraryName),
      items: items,
      rowType: HomeRowType.recentlyReleased,
      totalCount: items.length < _defaultLimit ? items.length : _maxItems,
      isAudio: collectionType == 'music',
    );
  }

  Future<HomeRow> loadPlaylists(
    String serverId, {
    String? mediaType,
    String? sortBy,
    String? sortOrder,
  }) async {
    final response = await _getItemsWithFallback(
      includeItemTypes: const ['Playlist'],
      sortBy: sortBy ?? 'SortName',
      sortOrder: sortOrder ?? 'Ascending',
      recursive: true,
      limit: _defaultLimit,
      fields: '$_fields,ChildCount,RecursiveItemCount',
    );
    var row = _buildRow(
      id: 'playlists',
      title: _l10n.playlists,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.playlists,
    );
    final playlistsOnly = row.items
        .where((item) => item.type == 'Playlist')
        .toList();
    row = row.copyWith(
      items: await filterBrowsablePlaylists(
        _client,
        playlistsOnly,
        mediaType: mediaType,
      ),
      isAudio: mediaType == 'Audio',
    );
    return row;
  }

  Future<HomeRow> loadFavorites(
    String serverId, {
    required String rowId,
    required String title,
    List<String>? includeItemTypes,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    return _loadSortedItemsRow(
      serverId: serverId,
      id: rowId,
      title: title,
      rowType: HomeRowType.favorites,
      includeItemTypes: includeItemTypes,
      isFavorite: true,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  Future<HomeRow> loadCollections(
    String serverId, {
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    return _loadSortedItemsRow(
      serverId: serverId,
      id: 'collections',
      title: _l10n.collections,
      rowType: HomeRowType.collections,
      includeItemTypes: const ['BoxSet'],
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  Future<HomeRow> loadAudioArtists(
    String serverId, {
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    final row = await _loadSortedItemsRow(
      serverId: serverId,
      id: 'audioArtists',
      title: _l10n.artists,
      rowType: HomeRowType.audioArtists,
      includeItemTypes: const ['MusicArtist'],
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
    return row.copyWith(isAudio: true);
  }

  Future<HomeRow> loadAudioAlbums(
    String serverId, {
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    final row = await _loadSortedItemsRow(
      serverId: serverId,
      id: 'audioAlbums',
      title: _l10n.albums,
      rowType: HomeRowType.audioAlbums,
      includeItemTypes: const ['MusicAlbum'],
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
    return row.copyWith(isAudio: true);
  }

  Future<HomeRow> loadAudioPlaylists(
    String serverId, {
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    final row = await loadPlaylists(
      serverId,
      mediaType: 'Audio',
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
    return row.copyWith(
      id: 'audioPlaylists',
      title: _l10n.audioPlaylists,
      rowType: HomeRowType.audioPlaylists,
      isAudio: true,
    );
  }

  Future<HomeRow> loadGenres(
    String serverId, {
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    List<String>? includeItemTypes,
    String? parentId,
  }) async {
    final browseItemTypes = normalizeBrowsableGenreItemTypes(includeItemTypes);
    if (_isAccessDenied(parentId)) {
      return _buildRow(
        id: 'genres',
        title: _l10n.genres,
        response: const <String, dynamic>{'Items': <dynamic>[]},
        serverId: serverId,
        rowType: HomeRowType.genres,
      );
    }
    Map<String, dynamic> response;
    try {
      response = await _client.itemsApi.getGenres(
        parentId: parentId,
        sortBy: sortBy,
        sortOrder: sortOrder,
        recursive: true,
        limit: _defaultLimit,
        fields: 'ItemCounts,PrimaryImageAspectRatio',
        includeItemTypes: browseItemTypes,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      _recordIfAccessDenied(statusCode, parentId);
      if (!_shouldRetryWithoutFields(statusCode)) rethrow;
      response = await _client.itemsApi.getGenres(
        parentId: parentId,
        sortBy: sortBy,
        sortOrder: sortOrder,
        recursive: true,
        limit: _defaultLimit,
        includeItemTypes: browseItemTypes,
      );
    }

    final enrichedResponse = await _enrichGenreResponseForBrowse(
      response,
      includeItemTypes: browseItemTypes,
    );

    final row = _buildRow(
      id: 'genres',
      title: _l10n.genres,
      response: enrichedResponse,
      serverId: serverId,
      rowType: HomeRowType.genres,
    );
    final totalCount = row.items.length < _defaultLimit
        ? row.items.length
        : _maxItems;
    return row.copyWith(totalCount: totalCount);
  }

  Future<HomeRow> loadStudios(
    String serverId, {
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    String selectedIds = '',
    String? title,
    String? parentId,
  }) async {
    final rowTitle = title ?? _l10n.studios;
    if (_isAccessDenied(parentId)) {
      return _buildRow(
        id: 'studios',
        title: rowTitle,
        response: const <String, dynamic>{'Items': <dynamic>[]},
        serverId: serverId,
        rowType: HomeRowType.studios,
      );
    }
    final selectedSet = selectedIds
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toSet();

    Future<Map<String, dynamic>> fetchPage(int startIndex, int limit) async {
      try {
        return await _client.itemsApi.getStudios(
          parentId: parentId,
          userId: _client.userId,
          sortBy: sortBy,
          sortOrder: sortOrder,
          recursive: true,
          startIndex: startIndex,
          limit: limit,
          fields: 'ItemCounts,PrimaryImageAspectRatio',
        );
      } on DioException catch (e) {
        final statusCode = e.response?.statusCode ?? 0;
        _recordIfAccessDenied(statusCode, parentId);
        if (!_shouldRetryWithoutFields(statusCode)) rethrow;
        return _client.itemsApi.getStudios(
          parentId: parentId,
          userId: _client.userId,
          sortBy: sortBy,
          sortOrder: sortOrder,
          recursive: true,
          startIndex: startIndex,
          limit: limit,
        );
      }
    }

    final List<Map<String, dynamic>> items;
    if (selectedSet.isEmpty) {
      final page = await fetchPage(0, _defaultLimit);
      items = (page['Items'] as List? ?? []).cast<Map<String, dynamic>>();
    } else {
      items = await _collectStudios(selectedSet, fetchPage);
    }

    return _buildRow(
      id: 'studios',
      title: rowTitle,
      response: {'Items': items},
      serverId: serverId,
      rowType: HomeRowType.studios,
    );
  }

  /// Walks the studio list a page at a time until every id in [wanted] has
  /// turned up.
  ///
  /// The endpoint has no way to ask for particular studios and a library can
  /// report well over a thousand of them, so reading the lot to keep a handful
  /// is a heavy call to make on every home load. Stopping once the selection is
  /// accounted for usually means one page.
  Future<List<Map<String, dynamic>>> _collectStudios(
    Set<String> wanted,
    Future<Map<String, dynamic>> Function(int startIndex, int limit) fetchPage,
  ) async {
    final outstanding = wanted.toSet();
    final found = <Map<String, dynamic>>[];
    var startIndex = 0;

    while (outstanding.isNotEmpty) {
      final response = await fetchPage(startIndex, _studioPageSize);
      final page = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();
      if (page.isEmpty) break;
      for (final studio in page) {
        if (outstanding.remove(studio['Id']?.toString() ?? '')) {
          found.add(studio);
        }
      }
      if (page.length < _studioPageSize) break;
      startIndex += _studioPageSize;
    }

    return found;
  }

  Future<Map<String, dynamic>> _enrichGenreResponseForBrowse(
    Map<String, dynamic> response, {
    required List<String> includeItemTypes,
  }) async {
    final rawItems = response['Items'] as List? ?? const [];
    final genres = rawItems
        .whereType<Map>()
        .map((item) => item.cast<String, dynamic>())
        .where(
          (genre) =>
              browsableGenreCount(
                genre,
                normalizedItemTypes: includeItemTypes,
              ) >
              0,
        )
        .toList(growable: false);

    if (genres.isEmpty) {
      return {
        ...response,
        'Items': const <Map<String, dynamic>>[],
        'TotalRecordCount': 0,
      };
    }

    final resolved = await mapBounded(
      genres,
      _genreArtworkConcurrency,
      (genre) => _enrichSingleGenreForBrowse(
        genre,
        includeItemTypes: includeItemTypes,
      ),
    );
    final enriched = resolved.whereType<Map<String, dynamic>>().toList();

    return {
      ...response,
      'Items': enriched,
      'TotalRecordCount': enriched.length,
    };
  }

  Future<Map<String, dynamic>?> _enrichSingleGenreForBrowse(
    Map<String, dynamic> genreData, {
    required List<String> includeItemTypes,
  }) async {
    final genreId = genreData['Id']?.toString();
    if (genreId == null || genreId.isEmpty) {
      return null;
    }

    try {
      final response = await _getItemsWithFallback(
        genreIds: [genreId],
        includeItemTypes: includeItemTypes,
        excludeItemTypes: const ['Episode'],
        sortBy: 'Random',
        sortOrder: 'Ascending',
        recursive: true,
        limit: 10,
      );

      final items = (response['Items'] as List?) ?? const [];
      final maps = List<Map<String, dynamic>>.from(
        items.whereType<Map>().map((item) => item.cast<String, dynamic>()),
      );
      if (maps.isEmpty) {
        return null;
      }

      maps.shuffle();
      final representative = maps[0];
      final backdropRepresentative = maps.length > 1 ? maps[1] : null;

      final rawTotalCount = response['TotalRecordCount'];
      final totalCount = rawTotalCount is num
          ? rawTotalCount.toInt()
          : browsableGenreCount(
              genreData,
              normalizedItemTypes: includeItemTypes,
            );
      if (totalCount <= 0) {
        return null;
      }

      return mergeGenreWithRepresentativeItem(
        genreData: genreData,
        representativeItem: representative,
        itemCount: totalCount,
        backdropRepresentativeItem: backdropRepresentative,
      );
    } catch (_) {
      return null;
    }
  }

  Future<HomeRow> loadCollectionRow(
    String serverId, {
    required String collectionId,
    required String title,
    required String rowId,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    bool usePlaylistOrder = false,
    bool showEpisodes = false,
    int startIndex = 0,
    int limit = _defaultLimit,
  }) async {
    // A stored order is the only thing the flat fetch below is for, so it is
    // asked for first. Servers without the plugin have none, and rebuilding
    // series cards out of episodes for a row that never needed them read is
    // what leaves episodes in it.
    final customOrder = usePlaylistOrder
        ? await _customCollectionOrder(collectionId)
        : null;
    if (customOrder != null) {
      // The order stores episode ids rather than series ids, so a non-recursive
      // fetch returns a series whose id is never in the order and it sinks to
      // the end. Fetching recursively gives the flat movie and episode list the
      // order was built against, which is then collapsed back to series cards
      // unless the caller wants episodes.
      final response = await _getItemsWithFallback(
        parentId: collectionId,
        recursive: true,
        startIndex: 0,
        limit: _fullRowFetchLimit,
      );
      final flatItems = _parseItems(response, serverId);

      final orderMap = {
        for (var i = 0; i < customOrder.length; i++) customOrder[i]: i,
      };
      flatItems.sort((a, b) {
        final ai = orderMap[a.id];
        final bi = orderMap[b.id];
        if (ai == null && bi == null) return 0;
        if (ai == null) return 1;
        if (bi == null) return -1;
        return ai.compareTo(bi);
      });

      final displayItems = showEpisodes
          ? _capItems(flatItems)
          : _collapseEpisodesToSeries(flatItems, serverId);

      return HomeRow(
        id: rowId,
        title: title,
        items: displayItems,
        rowType: HomeRowType.collections,
        // The row holds everything it will ever hold, so paging stays off it.
        totalCount: displayItems.length,
      );
    }

    // Expansion multiplies every series into its episodes, so the top level is
    // fetched narrower to keep the result within reach of low memory devices.
    final fetchLimit = showEpisodes ? _expandSourceFetchLimit : limit;
    final response = await _getItemsWithFallback(
      parentId: collectionId,
      // Playlist Order with nothing stored still means the collection's own
      // order, so the server is left to it rather than told to sort by name.
      sortBy: usePlaylistOrder ? null : sortBy,
      sortOrder: sortOrder,
      recursive: false,
      startIndex: startIndex,
      limit: fetchLimit,
    );
    var row = _buildRow(
      id: rowId,
      title: title,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.collections,
    );

    if (!showEpisodes) return row;
    final expanded = await _expandSeriesItems(row.items, serverId);
    return row.copyWith(items: expanded, totalCount: expanded.length);
  }

  /// The stored order for a collection, or null when there is none to apply.
  /// An empty answer counts as none, since sorting against it would leave every
  /// item unplaced.
  Future<List<String>?> _customCollectionOrder(String collectionId) async {
    try {
      final order = await GetIt.instance<PluginSyncService>()
          .fetchCustomCollectionOrder(
            _client,
            collectionId,
            requireAvailable: false,
          );
      return (order == null || order.isEmpty) ? null : order;
    } catch (_) {
      return null;
    }
  }

  Future<HomeRow> loadPlaylistRow(
    String serverId, {
    required String playlistId,
    required String title,
    required String rowId,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    bool usePlaylistOrder = false,
    bool showEpisodes = false,
  }) async {
    // Collapsing dedupes across the whole playlist, so the list is pulled up
    // front either way. Paging can't help here, since the lazy load path keeps
    // only items of type Playlist, which a playlist's own contents never are.
    final response = usePlaylistOrder
        ? await _client.itemsApi.getPlaylistItems(
            playlistId,
            limit: _fullRowFetchLimit,
          )
        : await _getItemsWithFallback(
            parentId: playlistId,
            sortBy: sortBy,
            sortOrder: sortOrder,
            recursive: false,
            limit: _fullRowFetchLimit,
          );
    final row = _buildRow(
      id: rowId,
      title: title,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.playlists,
    );
    final items = showEpisodes
        ? _capItems(row.items)
        : _collapseEpisodesToSeries(row.items, serverId);
    return row.copyWith(items: items, totalCount: items.length);
  }

  Future<HomeRow> loadGenreRow(
    String serverId, {
    required String genreId,
    required String title,
    required String rowId,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    List<String>? includeItemTypes,
    int startIndex = 0,
    int limit = _defaultLimit,
  }) async {
    final response = await _getItemsWithFallback(
      genreIds: [genreId],
      sortBy: sortBy,
      sortOrder: sortOrder,
      recursive: true,
      startIndex: startIndex,
      limit: limit,
      includeItemTypes: includeItemTypes,
      excludeItemTypes: const ['Episode'],
    );
    return _buildRow(
      id: rowId,
      title: title,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.genres,
    );
  }

  Future<HomeRow> _loadSortedItemsRow({
    required String serverId,
    required String id,
    required String title,
    required HomeRowType rowType,
    List<String>? includeItemTypes,
    bool? isFavorite,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    int limit = _defaultLimit,
  }) async {
    final response = await _getItemsWithFallback(
      includeItemTypes: includeItemTypes,
      sortBy: sortBy,
      sortOrder: sortOrder,
      recursive: true,
      limit: limit,
      isFavorite: isFavorite,
    );
    return _buildRow(
      id: id,
      title: title,
      response: response,
      serverId: serverId,
      rowType: rowType,
    );
  }

  Future<HomeRow> loadLibraryTiles(
    String serverId, [
    HomeRowType rowType = HomeRowType.libraryTiles,
  ]) async {
    final response = await loadVisibleUserViews(_client);

    return _buildRow(
      id: rowType == HomeRowType.libraryTilesSmall
          ? 'libraryTilesSmall'
          : 'libraryTiles',
      title: _l10n.myMedia,
      response: response,
      serverId: serverId,
      rowType: rowType,
    );
  }

  Future<HomeRow> loadLibraryResume(String parentId, String serverId) async {
    final response = await _getResumeItemsWithFallback(
      parentId: parentId,
      includeItemTypes: ['Video'],
      limit: _defaultLimit,
    );
    return _buildRow(
      id: 'resume_$parentId',
      title: _l10n.continueWatching,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.resume,
    );
  }

  Future<HomeRow> loadLibraryNextUp(String parentId, String serverId) async {
    final response = await _getNextUpWithFallback(
      parentId: parentId,
      limit: _defaultLimit,
    );
    final row = _buildRow(
      id: 'nextUp_$parentId',
      title: _l10n.nextUp,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.nextUp,
    );
    final enrichedItems = await _enrichNextUpItemsWithSeriesLastPlayed(
      row.items,
    );
    return row.copyWith(items: enrichedItems);
  }

  Future<HomeRow> loadLibraryFavorites(
    String parentId,
    String serverId, {
    List<String>? includeItemTypes,
    String sortBy = 'SortName',
    String sortOrder = 'Ascending',
  }) async {
    final response = await _getItemsWithFallback(
      parentId: parentId,
      isFavorite: true,
      sortBy: sortBy,
      sortOrder: sortOrder,
      recursive: true,
      limit: _defaultLimit,
      includeItemTypes: includeItemTypes,
    );
    return _buildRow(
      id: 'favorites_$parentId',
      title: _l10n.favorites,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.latestMedia,
    );
  }

  Future<HomeRow> loadLibraryCollections(
    String parentId,
    String serverId,
  ) async {
    final response = await _getItemsWithFallback(
      parentId: parentId,
      includeItemTypes: ['BoxSet'],
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      recursive: true,
      limit: _defaultLimit,
    );
    return _buildRow(
      id: 'collections_$parentId',
      title: _l10n.collections,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.latestMedia,
    );
  }

  Future<HomeRow> loadLibraryLastPlayed(
    String parentId,
    String serverId, {
    List<String>? includeItemTypes,
  }) async {
    final response = await _getItemsWithFallback(
      parentId: parentId,
      sortBy: 'DatePlayed',
      sortOrder: 'Descending',
      filters: ['IsPlayed'],
      recursive: true,
      limit: _defaultLimit,
      includeItemTypes: includeItemTypes,
    );
    return _buildRow(
      id: 'lastPlayed_$parentId',
      title: _l10n.lastPlayed,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.latestMedia,
    );
  }

  Future<HomeRow> loadLibraryItemsByType(
    String parentId,
    String serverId, {
    required String title,
    required List<String> includeItemTypes,
    String sortBy = 'SortName',
    String sortOrder = 'Ascending',
  }) async {
    final isAlbumArtistBrowse =
        includeItemTypes.length == 1 && includeItemTypes.first == 'AlbumArtist';
    final response = isAlbumArtistBrowse
        ? await _client.itemsApi.getAlbumArtists(
            parentId: parentId,
            userId: _client.userId,
            sortBy: sortBy,
            sortOrder: sortOrder,
            recursive: true,
            limit: _defaultLimit,
            fields: 'PrimaryImageAspectRatio,SortName',
          )
        : await _getItemsWithFallback(
            parentId: parentId,
            includeItemTypes: includeItemTypes,
            sortBy: sortBy,
            sortOrder: sortOrder,
            recursive: true,
            limit: _defaultLimit,
          );
    return _buildRow(
      id: '${includeItemTypes.first.toLowerCase()}_$parentId',
      title: title,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.latestMedia,
    );
  }

  /// Continue row for book/audiobook libraries. The Resume endpoint omits
  /// Book items on some servers, so an empty result retries with the
  /// IsResumable items filter.
  Future<HomeRow> loadBookResume(
    String parentId,
    String serverId, {
    required List<String> includeItemTypes,
    required String title,
  }) async {
    Map<String, dynamic> response;
    try {
      response = await _getResumeItemsWithFallback(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        limit: _defaultLimit,
      );
    } catch (_) {
      response = const <String, dynamic>{'Items': <dynamic>[]};
    }
    var row = _buildRow(
      id: 'bookResume_$parentId',
      title: title,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.resume,
    );
    if (row.items.isEmpty) {
      try {
        final fallback = await _getItemsWithFallback(
          parentId: parentId,
          includeItemTypes: includeItemTypes,
          filters: ['IsResumable'],
          sortBy: 'DatePlayed',
          sortOrder: 'Descending',
          recursive: true,
          limit: _defaultLimit,
        );
        row = _buildRow(
          id: 'bookResume_$parentId',
          title: title,
          response: fallback,
          serverId: serverId,
          rowType: HomeRowType.resume,
        );
      } catch (_) {}
    }
    return row;
  }

  /// Book/audiobook authors. Jellyfin indexes book authors as artists, so
  /// /Artists scoped to the library returns them; servers that don't index
  /// them return an empty row and the caller hides it.
  Future<HomeRow> loadBookAuthors(String parentId, String serverId) async {
    Map<String, dynamic> response;
    try {
      response = await _client.itemsApi.getArtists(
        parentId: parentId,
        userId: _client.userId,
        sortBy: _defaultSortBy,
        sortOrder: _defaultSortOrder,
        recursive: true,
        limit: _defaultLimit,
        fields: 'PrimaryImageAspectRatio,SortName',
      );
    } catch (_) {
      response = const <String, dynamic>{'Items': <dynamic>[]};
    }
    return _buildRow(
      id: 'bookAuthors_$parentId',
      title: _l10n.authors,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.audioArtists,
    );
  }

  _ParsedStableId? _parseStableId(String id) {
    if (!id.startsWith('pluginDynamic:')) return null;
    final lastColon = id.lastIndexOf(':');
    if (lastColon < 0) return null;
    final additionalData = id.substring(lastColon + 1);

    final rest = id.substring(0, lastColon);
    final secondLastColon = rest.lastIndexOf(':');
    if (secondLastColon < 0) return null;
    final section = rest.substring(secondLastColon + 1);

    final rest2 = rest.substring(0, secondLastColon);
    const prefix = 'pluginDynamic:';
    if (rest2.length <= prefix.length) return null;
    final sub = rest2.substring(prefix.length);
    final sourceEnd = sub.indexOf(':');
    if (sourceEnd < 0) return null;
    final sourceName = sub.substring(0, sourceEnd);
    final serverIdPart = sub.substring(sourceEnd + 1);

    return _ParsedStableId(
      source: HomeSectionPluginSource.fromSerialized(sourceName),
      serverId: serverIdPart,
      section: section,
      additionalData: additionalData,
    );
  }

  Future<(List<AggregatedItem>, int)> loadMore({
    required HomeRow row,
    required String serverId,
    int? offset,
  }) async {
    if (!row.hasMore || row.items.length >= _maxItems) {
      return (row.items, row.totalCount);
    }

    final prefs = GetIt.instance.isRegistered<UserPreferences>()
        ? GetIt.instance<UserPreferences>()
        : null;
    Map<String, dynamic> response;
    final currentOffset = offset ?? row.items.length;

    switch (row.rowType) {
      case HomeRowType.playlists:
        final parsed = _parseStableId(row.id);
        if (parsed != null &&
            parsed.source == HomeSectionPluginSource.playlists) {
          final playlistId = parsed.additionalData;
          final sortPref = prefs?.get(UserPreferences.playlistsRowSortBy) ??
              LibrarySortBy.playlistOrder;
          final usePlaylistOrder = sortPref.usesDedicatedEndpoint;
          if (usePlaylistOrder) {
            response = await _client.itemsApi.getPlaylistItems(
              playlistId,
              startIndex: currentOffset,
              limit: _defaultLimit,
            );
          } else {
            final sortOrder =
                prefs?.get(UserPreferences.playlistsRowSortOrder).apiValue ??
                _defaultSortOrder;
            response = await _getItemsWithFallback(
              parentId: playlistId,
              sortBy: sortPref.apiValue,
              sortOrder: sortOrder,
              recursive: false,
              startIndex: currentOffset,
              limit: _defaultLimit,
            );
          }
        } else {
          final pageCount = (currentOffset / _defaultLimit).ceil();
          final startIndex = pageCount * _defaultLimit;
          final sortOpt = prefs?.get(UserPreferences.audioSortOption) ?? 'name';
          final (querySortBy, querySortOrder) = _resolveAudioSort(
            sortOpt,
            'Playlist',
          );
          response = await _getItemsWithFallback(
            includeItemTypes: const ['Playlist'],
            sortBy: querySortBy,
            sortOrder: querySortOrder,
            recursive: true,
            startIndex: startIndex,
            limit: _defaultLimit,
            fields: '$_fields,ChildCount,RecursiveItemCount',
          );
        }
      case HomeRowType.favorites:
        final sortBy =
            prefs?.get(UserPreferences.favoritesRowSortBy).apiValue ??
            _defaultSortBy;
        final sortOrder =
            prefs?.get(UserPreferences.favoritesRowSortOrder).apiValue ??
            _defaultSortOrder;
        response = await _getItemsWithFallback(
          includeItemTypes: FavoriteTypeFilter.fromRowId(row.id).itemTypes,
          sortBy: sortBy,
          sortOrder: sortOrder,
          recursive: true,
          startIndex: currentOffset,
          limit: _defaultLimit,
          isFavorite: true,
        );
      case HomeRowType.collections:
        final sortPref = prefs?.get(UserPreferences.collectionsRowSortBy) ??
            LibrarySortBy.playlistOrder;
        final parsed = _parseStableId(row.id);
        final isPinnedCollection =
            parsed != null &&
            parsed.source == HomeSectionPluginSource.collections;
        final parentId = isPinnedCollection
            ? parsed.additionalData
            : (row.id == 'collections' ? null : row.id);
        final includeItemTypes = row.id == 'collections'
            ? const ['BoxSet']
            : null;
        // Playlist Order for a specific pinned collection: fetch without a
        // server sort so the Items API returns items in native linked-children
        // order. The custom plugin order is only applied at the initial load
        // (loadCollectionRow); lazy-load pages simply append in server order.
        final effectiveSortBy = (sortPref.usesDedicatedEndpoint && parentId != null)
            ? null
            : sortPref.apiValue;
        final sortOrder =
            prefs?.get(UserPreferences.collectionsRowSortOrder).apiValue ??
            _defaultSortOrder;
        response = await _getItemsWithFallback(
          parentId: parentId,
          includeItemTypes: includeItemTypes,
          sortBy: effectiveSortBy,
          sortOrder: sortOrder,
          // A pinned collection pages through its own children, the way its
          // first page was read. Walking it would hand back the episodes inside
          // each series instead.
          recursive: !isPinnedCollection,
          startIndex: currentOffset,
          limit: _defaultLimit,
        );
      case HomeRowType.audioArtists:
        final sortBy =
            prefs?.get(UserPreferences.audioRowsSortBy).apiValue ??
            _defaultSortBy;
        final audioSortOrder =
            prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
            _defaultSortOrder;
        response = await _getItemsWithFallback(
          includeItemTypes: const ['MusicArtist'],
          sortBy: sortBy,
          sortOrder: audioSortOrder,
          recursive: true,
          startIndex: currentOffset,
          limit: _defaultLimit,
        );
      case HomeRowType.audioAlbums:
        final sortBy =
            prefs?.get(UserPreferences.audioRowsSortBy).apiValue ??
            _defaultSortBy;
        final audioSortOrder =
            prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
            _defaultSortOrder;
        response = await _getItemsWithFallback(
          includeItemTypes: const ['MusicAlbum'],
          sortBy: sortBy,
          sortOrder: audioSortOrder,
          recursive: true,
          startIndex: currentOffset,
          limit: _defaultLimit,
        );
      case HomeRowType.audioPlaylists:
        final sortBy =
            prefs?.get(UserPreferences.audioRowsSortBy).apiValue ??
            _defaultSortBy;
        final audioSortOrder =
            prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
            _defaultSortOrder;
        final pageCount = (currentOffset / _defaultLimit).ceil();
        final startIndex = pageCount * _defaultLimit;
        response = await _getItemsWithFallback(
          includeItemTypes: const ['Playlist'],
          sortBy: sortBy,
          sortOrder: audioSortOrder,
          recursive: true,
          startIndex: startIndex,
          limit: _defaultLimit,
          fields: '$_fields,ChildCount,RecursiveItemCount',
        );
      case HomeRowType.genres:
        final sortBy =
            prefs?.get(UserPreferences.genresRowSortBy).apiValue ??
            _defaultSortBy;
        final genresSortOrder =
            prefs?.get(UserPreferences.genresRowSortOrder).apiValue ??
            _defaultSortOrder;
        final includeItemTypes = prefs
            ?.get(UserPreferences.genresRowItemFilter)
            .includeItemTypes;
        final parsed = _parseStableId(row.id);
        if (row.id == 'genres') {
          final browseItemTypes = normalizeBrowsableGenreItemTypes(
            includeItemTypes,
          );
          final pageCount = (currentOffset / _defaultLimit).ceil();
          final startIndex = pageCount * _defaultLimit;
          try {
            response = await _client.itemsApi.getGenres(
              sortBy: sortBy,
              sortOrder: genresSortOrder,
              recursive: true,
              startIndex: startIndex,
              limit: _defaultLimit,
              fields: 'ItemCounts',
              includeItemTypes: browseItemTypes,
            );
          } on DioException catch (e) {
            final statusCode = e.response?.statusCode ?? 0;
            if (statusCode < 500) rethrow;
            response = await _client.itemsApi.getGenres(
              sortBy: sortBy,
              sortOrder: genresSortOrder,
              recursive: true,
              startIndex: startIndex,
              limit: _defaultLimit,
              includeItemTypes: browseItemTypes,
            );
          }
          final enrichedResponse = await _enrichGenreResponseForBrowse(
            response,
            includeItemTypes: browseItemTypes,
          );
          final newItems = _parseItems(enrichedResponse, serverId);
          final totalCount =
              enrichedResponse['TotalRecordCount'] as int? ??
              (row.items.length + newItems.length);
          return ([...row.items, ...newItems], totalCount);
        } else {
          final genreId =
              (parsed != null &&
                  parsed.source == HomeSectionPluginSource.genres)
              ? parsed.additionalData
              : row.id;
          response = await _getItemsWithFallback(
            genreIds: [genreId],
            sortBy: sortBy,
            sortOrder: genresSortOrder,
            recursive: true,
            startIndex: currentOffset,
            limit: _defaultLimit,
            includeItemTypes: includeItemTypes,
            excludeItemTypes: const ['Episode'],
          );
        }
      case HomeRowType.studios:
        // The row holds exactly the studios the viewer picked, so it arrives
        // complete and there is no next page to ask the server for.
        return (row.items, row.totalCount);
      case HomeRowType.latestMedia:
        // Stitched from several libraries at load time, so the id names a media
        // kind rather than a parent the server would recognise.
        if (isMergedTypeRowId(row.id)) {
          return (row.items, row.totalCount);
        }
        if (row.id.startsWith('latest_')) {
          final parentId = row.id.substring('latest_'.length);
          final response = await _getLatestItemsWithFallback(
            parentId: parentId,
            limit: currentOffset + _defaultLimit,
          );
          final items = normalizeLatestMediaItems(
            _parseItems(response, serverId),
            limit: currentOffset + _defaultLimit,
          );
          final totalCount = items.length <= row.items.length
              ? items.length
              : _maxItems;
          return (items, totalCount);
        } else if (row.id.startsWith('favorites_')) {
          final parentId = row.id.substring('favorites_'.length);
          final sortOpt = prefs?.get(UserPreferences.audioSortOption) ?? 'name';
          final (querySortBy, querySortOrder) = _resolveAudioSort(
            sortOpt,
            'Favorites',
          );
          response = await _getItemsWithFallback(
            parentId: parentId,
            isFavorite: true,
            sortBy: querySortBy,
            sortOrder: querySortOrder,
            recursive: true,
            startIndex: currentOffset,
            limit: _defaultLimit,
          );
        } else if (row.id.startsWith('collections_')) {
          final parentId = row.id.substring('collections_'.length);
          response = await _getItemsWithFallback(
            parentId: parentId,
            includeItemTypes: const ['BoxSet'],
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            recursive: true,
            startIndex: currentOffset,
            limit: _defaultLimit,
          );
        } else if (row.id.startsWith('lastPlayed_')) {
          final parentId = row.id.substring('lastPlayed_'.length);
          response = await _getItemsWithFallback(
            parentId: parentId,
            sortBy: 'DatePlayed',
            sortOrder: 'Descending',
            filters: const ['IsPlayed'],
            recursive: true,
            startIndex: currentOffset,
            limit: _defaultLimit,
          );
        } else if (row.id.startsWith('albumartist_')) {
          final parentId = row.id.substring('albumartist_'.length);
          final sortOpt = prefs?.get(UserPreferences.audioSortOption) ?? 'name';
          final (querySortBy, querySortOrder) = _resolveAudioSort(
            sortOpt,
            'AlbumArtist',
          );
          response = await _client.itemsApi.getAlbumArtists(
            parentId: parentId,
            userId: _client.userId,
            sortBy: querySortBy,
            sortOrder: querySortOrder,
            recursive: true,
            startIndex: currentOffset,
            limit: _defaultLimit,
            fields: 'PrimaryImageAspectRatio,SortName',
          );
        } else {
          if (row.id.startsWith('sinceYouWatched')) {
            final cached = _scoredRecommendationsCache[row.id];
            if (cached != null) {
              final nextItems = cached.take(currentOffset + _defaultLimit).toList();
              return (nextItems, cached.length);
            }
            return (row.items, row.totalCount);
          }
          final underscoreIndex = row.id.indexOf('_');
          if (underscoreIndex >= 0) {
            final type = row.id.substring(0, underscoreIndex);
            final parentId = row.id.substring(underscoreIndex + 1);
            var itemType = type.isEmpty
                ? ''
                : '${type[0].toUpperCase()}${type.substring(1)}';
            if (itemType == 'Musicartist') itemType = 'MusicArtist';
            if (itemType == 'Musicalbum') itemType = 'MusicAlbum';

            final sortOpt =
                prefs?.get(UserPreferences.audioSortOption) ?? 'name';
            final (querySortBy, querySortOrder) = _resolveAudioSort(
              sortOpt,
              itemType,
            );

            response = await _getItemsWithFallback(
              parentId: parentId,
              includeItemTypes: [itemType],
              sortBy: querySortBy,
              sortOrder: querySortOrder,
              recursive: true,
              startIndex: currentOffset,
              limit: _defaultLimit,
            );
          } else {
            return (row.items, row.totalCount);
          }
        }
      case HomeRowType.resume:
        response = await _getResumeItemsWithFallback(
          includeItemTypes: const ['Movie', 'Episode'],
          startIndex: currentOffset,
          limit: _defaultLimit,
        );
      case HomeRowType.resumeAudio:
        response = await _getResumeItemsWithFallback(
          includeItemTypes: const ['Audio'],
          startIndex: currentOffset,
          limit: _defaultLimit,
        );
      case HomeRowType.nextUp:
        response = await _getNextUpWithFallback(
          startIndex: currentOffset,
          limit: _defaultLimit,
          enableResumable: false,
        );
      case HomeRowType.recentlyReleased:
      case HomeRowType.libraryTiles:
      case HomeRowType.libraryTilesSmall:
      case HomeRowType.liveTv:
      case HomeRowType.liveTvOnNow:
      case HomeRowType.liveTvFavorites:
      case HomeRowType.activeRecordings:
      case HomeRowType.mediaBar:
      case HomeRowType.pluginDynamic:
        return (row.items, row.totalCount);
    }

    final newItems =
        (row.rowType == HomeRowType.playlists ||
            row.rowType == HomeRowType.audioPlaylists)
        ? await filterBrowsablePlaylists(
            _client,
            _parseItems(
              response,
              serverId,
            ).where((item) => item.type == 'Playlist').toList(),
            mediaType: row.rowType == HomeRowType.audioPlaylists || row.isAudio
                ? 'Audio'
                : null,
          )
        : _parseItems(response, serverId);
    final totalCount =
        response['TotalRecordCount'] as int? ??
        (row.items.length + newItems.length);
    return ([...row.items, ...newItems], totalCount);
  }

  Future<Map<String, dynamic>> _getItemsWithFallback({
    String? parentId,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    List<String>? genreIds,
    List<String>? filters,
    String? sortBy,
    String? sortOrder,
    bool? recursive,
    int? startIndex,
    int? limit,
    bool? isFavorite,
    String? fields,
  }) async {
    if (_isAccessDenied(parentId)) {
      return const <String, dynamic>{'Items': <dynamic>[], 'TotalRecordCount': 0};
    }
    try {
      final response = await _client.itemsApi.getItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        excludeItemTypes: excludeItemTypes,
        genreIds: genreIds,
        filters: filters,
        sortBy: sortBy,
        sortOrder: sortOrder,
        recursive: recursive,
        startIndex: startIndex,
        limit: limit,
        isFavorite: isFavorite,
        fields: fields ?? _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      );
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      _recordIfAccessDenied(statusCode, parentId);
      if (statusCode < 500) rethrow;

      final fallbackSort = (sortBy ?? '').toLowerCase().contains('isfolder')
          ? 'SortName'
          : sortBy;

      final response = await _client.itemsApi.getItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        excludeItemTypes: excludeItemTypes,
        genreIds: genreIds,
        filters: filters,
        sortBy: fallbackSort,
        sortOrder: sortOrder,
        recursive: recursive,
        startIndex: startIndex,
        limit: limit,
        isFavorite: isFavorite,
        fields: fields ?? _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableTotalRecordCount: false,
      );
      return response;
    }
  }

  Future<Map<String, dynamic>> _getResumeItemsWithFallback({
    String? parentId,
    List<String>? includeItemTypes,
    int? startIndex,
    required int limit,
  }) async {
    try {
      final response = await _client.itemsApi
          .getResumeItems(
            parentId: parentId,
            includeItemTypes: includeItemTypes,
            startIndex: startIndex,
            limit: limit,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          )
          .timeout(const Duration(seconds: 8));
      return response;
    } on TimeoutException {
      final response = await _client.itemsApi
          .getResumeItems(
            parentId: parentId,
            includeItemTypes: includeItemTypes,
            startIndex: startIndex,
            limit: limit,
            fields: _fallbackFields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          )
          .timeout(const Duration(seconds: 6));
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      final response = await _client.itemsApi.getResumeItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        startIndex: startIndex,
        limit: limit,
        fields: _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      );
      return response;
    }
  }

  Future<Map<String, dynamic>> _getNextUpWithFallback({
    String? parentId,
    int? startIndex,
    required int limit,
    bool? enableResumable,
  }) async {
    try {
      final response = await _client.itemsApi
          .getNextUp(
            parentId: parentId,
            startIndex: startIndex,
            limit: limit,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
            enableResumable: enableResumable,
            nextUpDateCutoff: nextUpDateCutoff,
          )
          .timeout(const Duration(seconds: 8));
      return response;
    } on TimeoutException {
      final response = await _client.itemsApi
          .getNextUp(
            parentId: parentId,
            startIndex: startIndex,
            limit: limit,
            fields: _fallbackFields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
            enableResumable: enableResumable,
            nextUpDateCutoff: nextUpDateCutoff,
          )
          .timeout(const Duration(seconds: 6));
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      final response = await _client.itemsApi.getNextUp(
        parentId: parentId,
        startIndex: startIndex,
        limit: limit,
        fields: _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableResumable: enableResumable,
        nextUpDateCutoff: nextUpDateCutoff,
      );
      return response;
    }
  }

  Future<Map<String, dynamic>> getResumeItemsRelaxed({
    String? parentId,
    List<String>? includeItemTypes,
    required int limit,
  }) async {
    try {
      final response = await _client.itemsApi
          .getResumeItems(
            parentId: parentId,
            includeItemTypes: includeItemTypes,
            limit: limit,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          )
          .timeout(const Duration(seconds: 20));
      return response;
    } on TimeoutException {
      try {
        final response = await _client.itemsApi
            .getResumeItems(
              parentId: parentId,
              includeItemTypes: includeItemTypes,
              limit: limit,
              fields: _minimalFields,
              enableImageTypes: _imageTypes,
              imageTypeLimit: _imageTypeLimit,
            )
            .timeout(const Duration(seconds: 12));
        return response;
      } catch (e) {
        return {'Items': []};
      }
    } catch (e) {
      return {'Items': []};
    }
  }

  Future<Map<String, dynamic>> getNextUpRelaxed({
    String? parentId,
    required int limit,
    bool? enableResumable,
  }) async {
    try {
      final response = await _client.itemsApi
          .getNextUp(
            parentId: parentId,
            limit: limit,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
            enableResumable: enableResumable,
            nextUpDateCutoff: nextUpDateCutoff,
          )
          .timeout(const Duration(seconds: 20));
      return response;
    } on TimeoutException {
      try {
        final response = await _client.itemsApi
            .getNextUp(
              parentId: parentId,
              limit: limit,
              fields: _minimalFields,
              enableImageTypes: _imageTypes,
              imageTypeLimit: _imageTypeLimit,
              enableResumable: enableResumable,
              nextUpDateCutoff: nextUpDateCutoff,
            )
            .timeout(const Duration(seconds: 12));
        return response;
      } catch (e) {
        return {'Items': []};
      }
    } catch (e) {
      return {'Items': []};
    }
  }

  Future<Map<String, dynamic>> _getLatestItemsWithFallback({
    required String parentId,
    required int limit,
  }) async {
    try {
      final response = await _client.itemsApi.getLatestItems(
        parentId: parentId,
        limit: limit,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      );
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      final response = await _client.itemsApi.getLatestItems(
        parentId: parentId,
        limit: limit,
        fields: _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      );
      return response;
    }
  }

  HomeRow _buildRow({
    required String id,
    required String title,
    required Map<String, dynamic> response,
    required String serverId,
    required HomeRowType rowType,
  }) {
    final items = _parseItems(response, serverId);
    final totalCount = response['TotalRecordCount'] as int? ?? items.length;
    return HomeRow(
      id: id,
      title: title,
      items: items,
      rowType: rowType,
      totalCount: totalCount,
    );
  }

  Future<Map<String, dynamic>> _getRecentlyReleasedItemsWithFallback({
    required String parentId,
    required int limit,
    List<String>? includeItemTypes,
    bool recursive = false,
  }) async {
    try {
      final response = await _client.itemsApi.getRecentlyReleasedItems(
        parentId: parentId,
        limit: limit,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        includeItemTypes: includeItemTypes,
        recursive: recursive,
      );
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      final response = await _client.itemsApi.getRecentlyReleasedItems(
        parentId: parentId,
        limit: limit,
        fields: _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        includeItemTypes: includeItemTypes,
        recursive: recursive,
      );
      return response;
    }
  }

  /// Loads items for a dynamic section provided by a third-party plugin or dynamic source.
  /// Dispatches on [pluginSource] so callers can mix HSS rows (server-driven
  /// REST endpoint) and other dynamic source rows (like collections, genres, or playlists).
  Future<HomeRow> loadDynamicSection({
    required String rowId,
    required String section,
    required String title,
    required String serverId,
    String? additionalData,
    HomeSectionPluginSource pluginSource = HomeSectionPluginSource.collections,
    bool forceRefresh = false,
  }) async {
    switch (pluginSource) {
      case HomeSectionPluginSource.collections:
        final collectionId = additionalData?.trim();
        if (collectionId == null || collectionId.isEmpty) {
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.collections,
          );
        }
        try {
          final prefs = GetIt.instance.isRegistered<UserPreferences>()
              ? GetIt.instance<UserPreferences>()
              : null;
          final sortPref = prefs?.get(UserPreferences.collectionsRowSortBy) ??
              LibrarySortBy.playlistOrder;
          final collectionsSortOrder =
              prefs?.get(UserPreferences.collectionsRowSortOrder).apiValue ??
              _defaultSortOrder;
          final usePlaylistOrder = sortPref.usesDedicatedEndpoint;
          final showEpisodes =
              prefs?.get(UserPreferences.collectionsRowShowEpisodes) ?? false;
          final row = await loadCollectionRow(
            serverId,
            collectionId: collectionId,
            title: title,
            rowId: rowId,
            sortBy: usePlaylistOrder ? _defaultSortBy : sortPref.apiValue,
            sortOrder: collectionsSortOrder,
            usePlaylistOrder: usePlaylistOrder,
            showEpisodes: showEpisodes,
          );
          return row;
        } catch (_) {
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.collections,
          );
        }
      case HomeSectionPluginSource.genres:
        final genreId = additionalData?.trim();
        if (genreId == null || genreId.isEmpty) {
          return HomeRow(id: rowId, title: title, rowType: HomeRowType.genres);
        }
        try {
          var sortBy = _defaultSortBy;
          var sortOrder = _defaultSortOrder;
          List<String>? includeItemTypes;
          if (GetIt.instance.isRegistered<UserPreferences>()) {
            final prefs = GetIt.instance<UserPreferences>();
            sortBy = prefs.get(UserPreferences.genresRowSortBy).apiValue;
            sortOrder = prefs.get(UserPreferences.genresRowSortOrder).apiValue;
            includeItemTypes = prefs
                .get(UserPreferences.genresRowItemFilter)
                .includeItemTypes;
          }
          final row = await loadGenreRow(
            serverId,
            genreId: genreId,
            title: title,
            rowId: rowId,
            sortBy: sortBy,
            sortOrder: sortOrder,
            includeItemTypes: includeItemTypes,
          );
          return row;
        } catch (_) {
          return HomeRow(id: rowId, title: title, rowType: HomeRowType.genres);
        }
      case HomeSectionPluginSource.playlists:
        final playlistId = additionalData?.trim();
        if (playlistId == null || playlistId.isEmpty) {
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.playlists,
          );
        }
        try {
          final prefs = GetIt.instance.isRegistered<UserPreferences>()
              ? GetIt.instance<UserPreferences>()
              : null;
          final sortPref = prefs?.get(UserPreferences.playlistsRowSortBy) ??
              LibrarySortBy.playlistOrder;
          final playlistsSortOrder =
              prefs?.get(UserPreferences.playlistsRowSortOrder).apiValue ??
              _defaultSortOrder;
          final usePlaylistOrder = sortPref.usesDedicatedEndpoint;
          final showEpisodes =
              prefs?.get(UserPreferences.playlistsRowShowEpisodes) ?? false;
          final row = await loadPlaylistRow(
            serverId,
            playlistId: playlistId,
            title: title,
            rowId: rowId,
            sortBy: usePlaylistOrder ? _defaultSortBy : sortPref.apiValue,
            sortOrder: playlistsSortOrder,
            usePlaylistOrder: usePlaylistOrder,
            showEpisodes: showEpisodes,
          );
          return row;
        } catch (_) {
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.playlists,
          );
        }

      case HomeSectionPluginSource.custom:
        try {
          final customService = GetIt.instance<CustomExternalListsService>();
          final config = HomeSectionConfig.pluginDynamic(
            serverId: serverId,
            pluginSection: section,
            pluginAdditionalData: additionalData,
            pluginDisplayText: title,
            pluginSource: pluginSource,
          );
          List<ImdbExternalListItem> items;
          if (forceRefresh) {
            items = await customService.fetchCustomRow(config, forceRefresh: true);
          } else {
            items = await customService.loadCustomRowFromCache(config);
            if (items.isEmpty) {
              items = await customService.fetchCustomRow(config);
            }
          }
          Map<String, dynamic> rowConfig = {};
          try {
            rowConfig = jsonDecode(additionalData ?? '{}') as Map<String, dynamic>;
          } catch (_) {}
          final showUserRatings = rowConfig['show_user_ratings'] == true;

          final aggregatedItems = items.map((item) {
            return AggregatedItem(
              id: item.imdbId.isNotEmpty ? item.imdbId : item.tmdbId,
              serverId: 'seerr',
              rawData: {
                'Name': item.title,
                'Type': item.type,
                'Overview': '',
                'PosterPath': item.posterUrl ?? '',
                'BackdropPath': item.backdropUrl ?? item.posterUrl ?? '',
                'ProductionYear': item.year,
                'SeerrMediaType': item.type == 'Series' ? 'tv' : 'movie',
                'UserRating': item.userRating ?? '',
                'ShowUserRatings': showUserRatings,
                'ProviderIds': {
                  if (item.imdbId.isNotEmpty) 'Imdb': item.imdbId,
                  if (item.tmdbId.isNotEmpty) 'Tmdb': item.tmdbId,
                },
              },
            );
          }).toList();
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.pluginDynamic,
            items: aggregatedItems,
          );
        } catch (e) {
          debugPrint('[RowDataSource] Failed to load custom dynamic section: $e');
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.pluginDynamic,
          );
        }
    }
  }


  List<AggregatedItem> _parseItems(
    Map<String, dynamic> response,
    String serverId,
  ) {
    final rawItems = response['Items'] as List? ?? [];
    final blocked = _blockedParentalRatings();
    final items = rawItems.map((item) {
      final data = item as Map<String, dynamic>;
      return AggregatedItem(
        id: data['Id']?.toString() ?? '',
        serverId: serverId,
        rawData: data,
      );
    });
    if (blocked.isEmpty) return items.toList();
    return items.where((item) {
      final rating = item.officialRating?.trim().toUpperCase();
      if (rating == null || rating.isEmpty) return true;
      return !blocked.contains(rating);
    }).toList();
  }

  // Ceilings that keep a row within reach of low memory devices like the
  // Firestick when a collection expands into episodes.
  static const int _maxExpandedItems = 200;
  static const int _maxEpisodesPerSeries = 100;
  // How many items a row pulls when it has to see the whole list at once.
  static const int _fullRowFetchLimit = 500;
  // Narrower, since every series here turns into a run of episodes.
  static const int _expandSourceFetchLimit = 100;
  // How many series are asked for their episodes at once.
  static const int _expandBatchSize = 8;

  static List<AggregatedItem> _capItems(List<AggregatedItem> items) =>
      items.length > _maxExpandedItems
      ? items.sublist(0, _maxExpandedItems)
      : items;

  /// Replaces every series in [items] with its episodes in season and episode
  /// order, leaving anything else alone. A series whose episodes fail to load
  /// stays as its own card.
  ///
  /// The result is capped at [_maxExpandedItems], so a long collection loses
  /// its tail rather than the device losing the row.
  Future<List<AggregatedItem>> _expandSeriesItems(
    List<AggregatedItem> items,
    String serverId,
  ) async {
    // A batch at a time. One by one would put a round trip per series in front
    // of the row appearing, and all at once would open a request per series.
    final result = <AggregatedItem>[];
    for (var i = 0; i < items.length; i += _expandBatchSize) {
      if (result.length >= _maxExpandedItems) break;
      final end = i + _expandBatchSize;
      final batch = items.sublist(i, end < items.length ? end : items.length);
      final lists = await Future.wait(
        batch.map((item) => _episodesForSeries(item, serverId)),
      );
      result.addAll(lists.expand((e) => e));
    }
    return _capItems(result);
  }

  /// The episodes of [item] in season and episode order, or [item] on its own
  /// when it is not a series or its episodes are out of reach.
  Future<List<AggregatedItem>> _episodesForSeries(
    AggregatedItem item,
    String serverId,
  ) async {
    if (item.type != 'Series') return [item];
    try {
      final episodeData = await _client.itemsApi.getEpisodes(item.id);
      final rawEpisodes = (episodeData['Items'] as List?) ?? const [];
      final episodes = rawEpisodes
          .whereType<Map<String, dynamic>>()
          .map((data) => AggregatedItem(
                id: data['Id']?.toString() ?? '',
                serverId: serverId,
                rawData: data,
              ))
          .toList()
        ..sort((a, b) {
          // Season 0 holds the specials, which belong after the rest.
          int seasonKey(int s) => s == 0 ? 0x7FFFFFFF : s;
          final aSeason = seasonKey(a.rawData['ParentIndexNumber'] as int? ?? 0);
          final bSeason = seasonKey(b.rawData['ParentIndexNumber'] as int? ?? 0);
          if (aSeason != bSeason) return aSeason.compareTo(bSeason);
          final aEp = a.rawData['IndexNumber'] as int? ?? 0;
          final bEp = b.rawData['IndexNumber'] as int? ?? 0;
          return aEp.compareTo(bEp);
        });
      if (episodes.isEmpty) return [item];
      return episodes.length > _maxEpisodesPerSeries
          ? episodes.sublist(0, _maxEpisodesPerSeries)
          : episodes;
    } catch (_) {
      return [item];
    }
  }

  /// Replaces the episodes in [items] with one card for each series they came
  /// from, sitting where that series first appeared. Anything else is left
  /// alone, including an episode with no series to fold into.
  List<AggregatedItem> _collapseEpisodesToSeries(
    List<AggregatedItem> items,
    String serverId,
  ) {
    final result = <AggregatedItem>[];
    final seenSeriesIds = <String>{};
    for (final item in items) {
      // Track series that arrive whole too, so a playlist holding both a series
      // and one of its episodes still shows a single card.
      if (item.type == 'Series') {
        if (seenSeriesIds.add(item.id)) result.add(item);
        continue;
      }
      if (item.type != 'Episode') {
        result.add(item);
        continue;
      }
      final seriesId = item.seriesId;
      if (seriesId == null || seriesId.isEmpty) {
        result.add(item);
        continue;
      }
      if (!seenSeriesIds.add(seriesId)) continue;
      // Only the fields an episode carries about its series are safe to lift.
      // Anything describing the episode itself, its watched state above all,
      // would read as the whole series being part watched.
      result.add(AggregatedItem(
        id: seriesId,
        serverId: serverId,
        rawData: {
          'Id': seriesId,
          'Name': item.rawData['SeriesName'] ?? '',
          'Type': 'Series',
          'ImageTags': {
            if (item.seriesPrimaryImageTag != null)
              'Primary': item.seriesPrimaryImageTag,
          },
          'BackdropImageTags':
              item.rawData['ParentBackdropImageTags'] ?? const <dynamic>[],
        },
      ));
    }
    return result;
  }

  Set<String> _blockedParentalRatings() {
    if (!GetIt.instance.isRegistered<UserPreferences>()) return const {};
    final csv = GetIt.instance<UserPreferences>().get(
      UserPreferences.blockedParentalRatings,
    );
    if (csv.trim().isEmpty) return const {};
    return csv
        .split(',')
        .map((e) => e.trim().toUpperCase())
        .where((e) => e.isNotEmpty)
        .toSet();
  }

  Future<List<AggregatedItem>> _enrichNextUpItemsWithSeriesLastPlayed(
    List<AggregatedItem> items,
  ) => enrichNextUpItemsWithSeriesLastPlayed(items, _client);

  (String, String) _resolveAudioSort(String? sortOpt, String itemType) {
    if (sortOpt == 'release_year' &&
        (itemType == 'MusicAlbum' || itemType == 'Favorites')) {
      return ('ProductionYear,SortName', 'Descending');
    } else if (sortOpt == 'date_added') {
      return ('DateCreated', 'Descending');
    }
    return ('SortName', 'Ascending');
  }

  int? _extractYear(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    final parsed = DateTime.tryParse(dateString);
    return parsed?.year;
  }

  int _getRatingLevel(String? rating) {
    if (rating == null || rating.isEmpty) return 100;
    final clean = rating.trim().toUpperCase();

    // Movies (US/Global)
    if (clean == 'G') return 1;
    if (clean == 'PG') return 2;
    if (clean == 'PG-13') return 3;
    if (clean == 'R') return 4;
    if (clean == 'NC-17') return 5;

    // TV Shows (US/Global)
    if (clean == 'TV-Y' || clean == 'TV-Y7') return 1;
    if (clean == 'TV-G') return 1;
    if (clean == 'TV-PG') return 2;
    if (clean == 'TV-14') return 3;
    if (clean == 'TV-MA') return 4;

    // UK Ratings
    if (clean == 'U' || clean == 'UC') return 1;
    if (clean == 'PG') return 2;
    if (clean == '12' || clean == '12A') return 3;
    if (clean == '15') return 4;
    if (clean == '18') return 5;

    // Fallback: parse numbers if found (e.g. "12", "16", "18")
    final match = RegExp(r'\d+').firstMatch(clean);
    if (match != null) {
      final age = int.tryParse(match.group(0)!);
      if (age != null) {
        if (age <= 7) return 1;
        if (age <= 12) return 2;
        if (age <= 15) return 3;
        if (age <= 17) return 4;
        return 5;
      }
    }

    return 3; // Default intermediate severity level
  }

  Future<HomeRow> loadSinceYouWatchedRow(String serverId, int rowIndex) async {
    final prefs = GetIt.instance<UserPreferences>();
    final sourceType = prefs.get(UserPreferences.sinceYouWatchedSourceType);
    final sourceItemType = prefs.get(UserPreferences.sinceYouWatchedSourceItem);
    final isLocal = prefs.get(UserPreferences.sinceYouWatchedSource) == SinceYouWatchedSource.local;

    final List<String> queryItemTypes;
    if (sourceItemType == SinceYouWatchedSourceItem.recentlyWatched) {
      if (sourceType == SinceYouWatchedSourceType.movies) {
        queryItemTypes = const ['Movie'];
      } else if (sourceType == SinceYouWatchedSourceType.shows) {
        queryItemTypes = const ['Episode'];
      } else {
        queryItemTypes = const ['Movie', 'Episode'];
      }
    } else {
      if (sourceType == SinceYouWatchedSourceType.movies) {
        queryItemTypes = const ['Movie'];
      } else if (sourceType == SinceYouWatchedSourceType.shows) {
        queryItemTypes = const ['Series'];
      } else {
        queryItemTypes = const ['Movie', 'Series'];
      }
    }

    final List<String> candidateItemTypes = switch (sourceType) {
      SinceYouWatchedSourceType.movies => const ['Movie'],
      SinceYouWatchedSourceType.shows => const ['Series'],
      SinceYouWatchedSourceType.both => const ['Movie', 'Series'],
    };

    // Fetch the list of possible base items (specifying Tags and People fields to avoid subsequent detail calls)
    List<AggregatedItem> baseItems = [];
    if (sourceItemType == SinceYouWatchedSourceItem.recentlyWatched) {
      final rawBaseItems = await _searchVisibleLibraryItems(
        serverId,
        queryItemTypes,
        (parentId) => _getItemsWithFallback(
          parentId: parentId,
          sortBy: 'DatePlayed',
          sortOrder: 'Descending',
          filters: const ['IsPlayed'],
          recursive: true,
          includeItemTypes: queryItemTypes,
          limit: 30, // Query more items to ensure we get enough unique shows
          fields: '$_fields,Tags,People,SeriesId',
        ),
        merge: _byLastPlayed,
      );
      
      // Resolve Episode items to their parent Series (Show) items
      final resolvedBaseItems = <AggregatedItem>[];
      final seenSeriesIds = <String>{};
      final episodeToSeriesMap = <String, String>{}; // Episode ID -> Series ID
      final seriesIdsToFetch = <String>[];
      
      for (final item in rawBaseItems) {
        if (item.type == 'Movie') {
          resolvedBaseItems.add(item);
        } else if (item.type == 'Episode') {
          final sId = item.rawData['SeriesId']?.toString();
          if (sId != null && sId.isNotEmpty) {
            episodeToSeriesMap[item.id] = sId;
            if (!seenSeriesIds.contains(sId)) {
              seenSeriesIds.add(sId);
              seriesIdsToFetch.add(sId);
            }
          }
        } else if (item.type == 'Series') {
          resolvedBaseItems.add(item);
        }
      }
      
      if (seriesIdsToFetch.isNotEmpty) {
        try {
          final seriesRes = await _client.itemsApi.getItems(
            ids: seriesIdsToFetch,
            fields: '$_fields,Tags,People',
          );
          final fetchedSeries = _parseItems(seriesRes, serverId);
          final seriesMap = {for (final s in fetchedSeries) s.id: s};
          
          final finalItems = <AggregatedItem>[];
          final addedSeriesIds = <String>{};
          
          for (final item in rawBaseItems) {
            if (item.type == 'Movie') {
              finalItems.add(item);
            } else if (item.type == 'Episode') {
              final sId = episodeToSeriesMap[item.id];
              if (sId != null) {
                final seriesItem = seriesMap[sId];
                if (seriesItem != null && !addedSeriesIds.contains(sId)) {
                  addedSeriesIds.add(sId);
                  finalItems.add(seriesItem);
                }
              }
            } else if (item.type == 'Series') {
              if (!addedSeriesIds.contains(item.id)) {
                addedSeriesIds.add(item.id);
                finalItems.add(item);
              }
            }
          }
          baseItems = finalItems;
        } catch (_) {
          baseItems = rawBaseItems;
        }
      } else {
        baseItems = resolvedBaseItems;
      }
    } else if (sourceItemType == SinceYouWatchedSourceItem.favorites) {
      final res = await _getItemsWithFallback(
        isFavorite: true,
        filters: const ['IsPlayed'],
        recursive: true,
        includeItemTypes: queryItemTypes,
        limit: 30,
        fields: '$_fields,Tags,People',
      );
      baseItems = _parseItems(res, serverId);
    } else {
      // Random
      final res = await _getItemsWithFallback(
        sortBy: 'Random',
        filters: const ['IsPlayed'],
        recursive: true,
        includeItemTypes: queryItemTypes,
        limit: 30,
        fields: '$_fields,Tags,People',
      );
      baseItems = _parseItems(res, serverId);
    }

    final sourceIdx = rowIndex - 1;
    if (sourceIdx >= baseItems.length) {
      return HomeRow(
        id: 'sinceYouWatched$rowIndex',
        title: 'Since you watched',
        rowType: HomeRowType.latestMedia,
        items: const [],
      );
    }

    final baseItem = baseItems[sourceIdx];
    final baseItemName = baseItem.name;

    final recommendedItems = await getRecommendations(
      serverId: serverId,
      baseItem: baseItem,
      isLocal: isLocal,
      candidateItemTypes: candidateItemTypes,
      limit: 100,
    );

    final rowId = 'sinceYouWatched$rowIndex';
    _scoredRecommendationsCache[rowId] = recommendedItems;

    return HomeRow(
      id: rowId,
      title: 'Since you watched "$baseItemName"',
      rowType: HomeRowType.latestMedia,
      items: recommendedItems.take(15).toList(),
      totalCount: recommendedItems.length,
    );
  }

  Future<List<AggregatedItem>> getRecommendations({
    required String serverId,
    required AggregatedItem baseItem,
    required bool isLocal,
    List<String>? candidateItemTypes,
    int limit = 15,
    bool? includeWatched,
  }) async {
    final prefs = GetIt.instance<UserPreferences>();
    final itemDetail = baseItem.rawData;
    final types = candidateItemTypes ?? (baseItem.type == 'Series' ? const ['Series'] : const ['Movie']);
    List<AggregatedItem> recommendedItems = [];

    if (isLocal) {
      final genres = (itemDetail['Genres'] as List?)?.map((e) => e?.toString()).whereType<String>().toList() ?? const <String>[];
      final tags = (itemDetail['Tags'] as List?)?.map((e) => e?.toString()).whereType<String>().toList() ?? const <String>[];
      final people = (itemDetail['People'] as List?)?.map((e) => e is Map ? Map<String, dynamic>.from(e) : null).whereType<Map<String, dynamic>>().toList() ?? const <Map<String, dynamic>>[];
      final baseStudios = (itemDetail['Studios'] as List?)?.map((e) => e is Map ? e['Name']?.toString() : e?.toString()).whereType<String>().toList() ?? const <String>[];
      final baseYear = itemDetail['ProductionYear'] as int?;

      final actorNames = people
          .where((p) => p['Type'] == 'Actor')
          .map((p) => p['Name']?.toString())
          .whereType<String>()
          .toList();
      final directorNames = people
          .where((p) => p['Type'] == 'Director')
          .map((p) => p['Name']?.toString())
          .whereType<String>()
          .toList();
      final writerNames = people
          .where((p) => p['Type'] == 'Writer')
          .map((p) => p['Name']?.toString())
          .whereType<String>()
          .toList();

      final actorIds = people
          .where((p) => p['Type'] == 'Actor')
          .map((p) => p['Id']?.toString())
          .whereType<String>()
          .toList();
      final directorIds = people
          .where((p) => p['Type'] == 'Director')
          .map((p) => p['Id']?.toString())
          .whereType<String>()
          .toList();
      final writerIds = people
          .where((p) => p['Type'] == 'Writer')
          .map((p) => p['Id']?.toString())
          .whereType<String>()
          .toList();

      // A pool gathered from a narrowed set of libraries is not the pool a
      // server wide sweep gives, so the scope belongs in the key or a toggled
      // library would keep answering from the cache.
      final parentIds = await _visibleLibraryIds(types);
      final scope = parentIds?.join(',') ?? '';

      final candidatesMap = <String, Map<String, dynamic>>{};
      final futures = <Future<void>>[];

      // Fetch candidates matching genres in parallel
      if (genres.isNotEmpty) {
        futures.add(() async {
          try {
            final cacheKey = '$serverId:$scope:genres:${types.join(",")}:${genres.join(",")}';
            if (_recommendationCache.containsKey(cacheKey)) {
              final cached = _recommendationCache[cacheKey]!;
              for (final item in cached) {
                final id = item['Id']?.toString() ?? '';
                if (id.isNotEmpty) candidatesMap[id] = item;
              }
              return;
            }
            final responses = await _searchLibraries(
              parentIds,
              (parentId) => _client.itemsApi.getItems(
                parentId: parentId,
                includeItemTypes: types,
                genres: genres,
                recursive: true,
                limit: 40,
                fields: 'Genres,Tags,People,UserData,OfficialRating,ProductionYear,CommunityRating,Studios',
              ),
            );
            final items = [
              for (final response in responses) ..._rawItems(response),
            ];
            _cacheRecommendations(cacheKey, items);
            for (final item in items) {
              final id = item['Id']?.toString() ?? '';
              if (id.isNotEmpty) candidatesMap[id] = item;
            }
          } catch (_) {}
        }());
      }

      // Fetch candidates matching tags in parallel
      if (tags.isNotEmpty) {
        futures.add(() async {
          try {
            final cacheKey = '$serverId:$scope:tags:${types.join(",")}:${tags.join(",")}';
            if (_recommendationCache.containsKey(cacheKey)) {
              final cached = _recommendationCache[cacheKey]!;
              for (final item in cached) {
                final id = item['Id']?.toString() ?? '';
                if (id.isNotEmpty) candidatesMap[id] = item;
              }
              return;
            }
            final responses = await _searchLibraries(
              parentIds,
              (parentId) => _client.itemsApi.getItems(
                parentId: parentId,
                includeItemTypes: types,
                tags: tags,
                recursive: true,
                limit: 40,
                fields: 'Genres,Tags,People,UserData,OfficialRating,ProductionYear,CommunityRating,Studios',
              ),
            );
            final items = [
              for (final response in responses) ..._rawItems(response),
            ];
            _cacheRecommendations(cacheKey, items);
            for (final item in items) {
              final id = item['Id']?.toString() ?? '';
              if (id.isNotEmpty) candidatesMap[id] = item;
            }
          } catch (_) {}
        }());
      }

      // Fetch candidates matching any directors, writers, or actors in parallel using a single combined query
      final allPersonIds = [
        ...directorIds,
        ...writerIds,
        ...actorIds.take(10),
      ];
      if (allPersonIds.isNotEmpty) {
        futures.add(() async {
          try {
            final cacheKey = '$serverId:$scope:people:${types.join(",")}:${allPersonIds.join(",")}';
            if (_recommendationCache.containsKey(cacheKey)) {
              final cached = _recommendationCache[cacheKey]!;
              for (final item in cached) {
                final id = item['Id']?.toString() ?? '';
                if (id.isNotEmpty) candidatesMap[id] = item;
              }
              return;
            }
            final responses = await _searchLibraries(
              parentIds,
              (parentId) => _client.itemsApi.getItems(
                parentId: parentId,
                includeItemTypes: types,
                personIds: allPersonIds,
                recursive: true,
                limit: 40,
                fields: 'Genres,Tags,People,UserData,OfficialRating,ProductionYear,CommunityRating,Studios',
              ),
            );
            final items = [
              for (final response in responses) ..._rawItems(response),
            ];
            _cacheRecommendations(cacheKey, items);
            for (final item in items) {
              final id = item['Id']?.toString() ?? '';
              if (id.isNotEmpty) candidatesMap[id] = item;
            }
          } catch (_) {}
        }());
      }

      await Future.wait(futures);

      final bool effectiveIncludeWatched = includeWatched ?? prefs.get(UserPreferences.sinceYouWatchedIncludeWatched);
      final bool applyRatingCap = prefs.get(UserPreferences.recommendationsApplyParentalRatingCap);
      final sourceRating = baseItem.officialRating;
      final sourceRatingLevel = _getRatingLevel(sourceRating);

      final scoredCandidates = <MapEntry<Map<String, dynamic>, double>>[];

      for (final candidate in candidatesMap.values) {
        final id = candidate['Id']?.toString() ?? '';
        if (id.isEmpty || id == baseItem.id) continue;

        // Played check
        final userData = candidate['UserData'] as Map?;
        final isPlayed = userData?['Played'] as bool? ?? false;
        if (!effectiveIncludeWatched && isPlayed) continue;

        // Parental rating constraint upper bound
        if (applyRatingCap) {
          final candRating = candidate['OfficialRating'] as String?;
          if (_getRatingLevel(candRating) > sourceRatingLevel) continue;
        }

        final score = _scoreCandidate(
          candidate,
          genres: genres,
          tags: tags,
          actorNames: actorNames,
          directorNames: directorNames,
          writerNames: writerNames,
          baseStudios: baseStudios,
          baseYear: baseYear,
          baseName: baseItem.name,
        );
        scoredCandidates.add(MapEntry(candidate, score));
      }

      // If we have fewer than 15 items after candidate scoring and filtering, fetch filler items
      if (scoredCandidates.length < 15) {
        try {
          final fallbackCacheKey = '$serverId:fallback:${types.join(",")}:${genres.join(",")}';
          final List<Map<String, dynamic>> items;
          if (_recommendationCache.containsKey(fallbackCacheKey)) {
            items = _recommendationCache[fallbackCacheKey]!;
          } else {
            final res = await _client.itemsApi.getItems(
              includeItemTypes: types,
              genres: genres.isNotEmpty ? genres : null,
              recursive: true,
              limit: 30,
              sortBy: 'ProductionYear,SortName',
              sortOrder: 'Descending',
              fields: 'Genres,Tags,People,UserData,OfficialRating,ProductionYear,CommunityRating,Studios',
            );
            items = (res['Items'] as List? ?? [])
                .map((e) => e is Map ? Map<String, dynamic>.from(e) : null)
                .whereType<Map<String, dynamic>>()
                .toList();
            _cacheRecommendations(fallbackCacheKey, items);
          }
          for (final item in items) {
            final id = item['Id']?.toString() ?? '';
            if (id.isNotEmpty && !candidatesMap.containsKey(id) && id != baseItem.id) {
              final userData = item['UserData'] as Map?;
              final isPlayed = userData?['Played'] as bool? ?? false;
              if (!effectiveIncludeWatched && isPlayed) continue;

              if (applyRatingCap) {
                final candRating = item['OfficialRating'] as String?;
                if (_getRatingLevel(candRating) > sourceRatingLevel) continue;
              }

              final score = _scoreCandidate(
                item,
                genres: genres,
                tags: tags,
                actorNames: actorNames,
                directorNames: directorNames,
                writerNames: writerNames,
                baseStudios: baseStudios,
                baseYear: baseYear,
                baseName: baseItem.name,
              );

              candidatesMap[id] = item;
              scoredCandidates.add(MapEntry(item, score));

              // Cap the extra items to prevent bloating
              if (scoredCandidates.length >= 30) {
                break;
              }
            }
          }
        } catch (_) {}
      }

      // Sort by score desc, then by premiere date desc
      scoredCandidates.sort((a, b) {
        final scoreCompare = b.value.compareTo(a.value);
        if (scoreCompare != 0) return scoreCompare;
        final dateA = a.key['PremiereDate'] as String? ?? '';
        final dateB = b.key['PremiereDate'] as String? ?? '';
        return dateB.compareTo(dateA);
      });

      recommendedItems = scoredCandidates
          .take(limit)
          .map((e) => AggregatedItem(
                id: e.key['Id']?.toString() ?? '',
                serverId: serverId,
                rawData: e.key,
              ))
          .toList();
    } else {
      // Online
      var tmdbId = baseItem.tmdbId;
      if (tmdbId == null || tmdbId.isEmpty) {
        try {
          final details = await _client.itemsApi.getItem(baseItem.id);
          final pIds = details['ProviderIds'] as Map?;
          tmdbId = pIds?['Tmdb']?.toString();
          if (tmdbId == null || tmdbId.isEmpty) {
            final imdbId = pIds?['Imdb']?.toString();
            if (imdbId != null && imdbId.isNotEmpty) {
              try {
                final repo = await GetIt.instance.getAsync<SeerrRepository>();
                await repo.ensureInitialized();
                if (repo.isAvailable) {
                  final searchPage = await repo.search(imdbId);
                  if (searchPage.results.isNotEmpty) {
                    tmdbId = searchPage.results.first.id.toString();
                  }
                }
              } catch (_) {}
            }
          }
        } catch (e) {
          print('[RowDataSource] Failed to resolve TMDB ID for online recommendations: $e');
        }
      }

      if (tmdbId != null && tmdbId.isNotEmpty) {
        final tmdbIdInt = int.tryParse(tmdbId);
        if (tmdbIdInt != null) {
          // Seerr goes first. Its results carry the server's mediaInfo, which
          // is what lets the blocklist apply, including tags the server has
          // blocklisted by keyword. Direct TMDB is the fallback and can't
          // honor any of that.
          try {
            final repo = await GetIt.instance.getAsync<SeerrRepository>();
            await repo.ensureInitialized();
            if (repo.isAvailable) {
              final isTv = baseItem.type == 'Series';
              final page = isTv
                  ? await repo.getTvRecommendations(tmdbIdInt)
                  : await repo.getMovieRecommendations(tmdbIdInt);

              final blockNsfw = GetIt.instance<SeerrPreferences>().blockNsfw;

              final filtered = page.results.where((item) {
                if (item.isBlacklisted) return false;
                if (blockNsfw) {
                  if (item.adult) return false;
                  final text = '${item.displayTitle} ${item.overview ?? ''}';
                  if (SeerrDiscoverViewModel.nsfwPatterns.any((p) => p.hasMatch(text))) {
                    return false;
                  }
                }
                return true;
              }).toList();

              recommendedItems = filtered.map((item) {
                return AggregatedItem(
                  id: item.id.toString(),
                  serverId: 'seerr',
                  rawData: {
                    'Name': item.displayTitle,
                    'Type': item.mediaType == 'tv' ? 'Series' : 'Movie',
                    'Overview': item.overview ?? '',
                    'PosterPath': item.posterPath ?? '',
                    'BackdropPath': item.backdropPath ?? '',
                    'ProductionYear': _extractYear(item.releaseDate ?? item.firstAirDate),
                    'SeerrMediaType': item.mediaType,
                  },
                );
              }).take(limit).toList();
            }
          } catch (_) {}

          final apiKey = prefs.get(UserPreferences.tmdbApiKey);
          if (recommendedItems.isEmpty && apiKey.isNotEmpty) {
            try {
              final dio = Dio(BaseOptions(
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
              ));
              final isTv = baseItem.type == 'Series';
              final path = isTv
                  ? 'tv/$tmdbIdInt/recommendations'
                  : 'movie/$tmdbIdInt/recommendations';
              final url = 'https://api.themoviedb.org/3/$path';
              final response = await dio.get(
                url,
                queryParameters: {
                  'api_key': apiKey,
                  'language': 'en-US',
                  'page': 1,
                },
              );
              if (response.statusCode == 200 && response.data != null) {
                final results = response.data['results'] as List? ?? [];
                recommendedItems = results.map((res) {
                  final idVal = res['id'];
                  final id = idVal?.toString() ?? '';
                  final title = (res['title'] as String?) ?? (res['name'] as String?) ?? 'Unknown';
                  final posterPath = res['poster_path'] as String? ?? '';
                  final backdropPath = res['backdrop_path'] as String? ?? '';
                  
                  final dateStr = (res['release_date'] as String?) ?? (res['first_air_date'] as String?);
                  int? year;
                  if (dateStr != null && dateStr.length >= 4) {
                    year = int.tryParse(dateStr.substring(0, 4));
                  }
                  
                  final mediaTypeRaw = res['media_type'] as String?;
                  final String type;
                  if (mediaTypeRaw != null) {
                    type = mediaTypeRaw == 'tv' ? 'Series' : 'Movie';
                  } else {
                    type = isTv ? 'Series' : 'Movie';
                  }
                  
                  return AggregatedItem(
                    id: id,
                    serverId: 'seerr',
                    rawData: {
                      'Name': title,
                      'Type': type,
                      'Overview': res['overview'] as String? ?? '',
                      'PosterPath': posterPath,
                      'BackdropPath': backdropPath,
                      'ProductionYear': year,
                      'SeerrMediaType': type == 'Series' ? 'tv' : 'movie',
                    },
                  );
                }).take(limit).toList();
              }
            } catch (e) {
              print('[RowDataSource] Direct TMDB recommendation query failed: $e');
            }
          }
        }
      }
    }

    return recommendedItems;
  }

  /// Collection types that can hold each item type, so a search only visits
  /// the libraries worth visiting. A library that declares no type holds
  /// anything, so it is always worth a look.
  static const _libraryTypesByItemType = <String, String>{
    'Movie': 'movies',
    'Series': 'tvshows',
    'Episode': 'tvshows',
  };

  /// Runs [search] once for every library that could hold [includeItemTypes],
  /// or once across the whole server when the user has hidden nothing, and
  /// hands back every answer.
  ///
  /// Neither server leaves a hidden library out of a search, since hiding one
  /// is a display choice rather than a permission, so a row that would sweep
  /// everything has to narrow the search itself.
  Future<List<Map<String, dynamic>>> _searchVisibleLibraries(
    List<String> includeItemTypes,
    Future<Map<String, dynamic>> Function(String? parentId) search,
  ) async =>
      _searchLibraries(await _visibleLibraryIds(includeItemTypes), search);

  /// The same fan out against libraries already resolved, so a caller making
  /// several searches at one scope resolves it once.
  Future<List<Map<String, dynamic>>> _searchLibraries(
    List<String>? parentIds,
    Future<Map<String, dynamic>> Function(String? parentId) search,
  ) async {
    if (parentIds == null) return [await search(null)];

    Future<Map<String, dynamic>?> attempt(String parentId) async {
      try {
        return await search(parentId);
      } catch (_) {
        return null;
      }
    }

    final responses = await Future.wait(parentIds.map(attempt));
    return responses.whereType<Map<String, dynamic>>().toList(growable: false);
  }

  /// The same search parsed into items, ordered by [merge] when more than one
  /// library answered and their separate orderings have to become one.
  Future<List<AggregatedItem>> _searchVisibleLibraryItems(
    String serverId,
    List<String> includeItemTypes,
    Future<Map<String, dynamic>> Function(String? parentId) search, {
    Comparator<AggregatedItem>? merge,
  }) async {
    final responses = await _searchVisibleLibraries(includeItemTypes, search);
    final items = [
      for (final response in responses) ..._parseItems(response, serverId),
    ];
    if (merge != null && responses.length > 1) items.sort(merge);
    return items;
  }

  static String _lastPlayedOf(AggregatedItem item) =>
      item.rawData['UserData']?['LastPlayedDate']?.toString() ?? '';

  /// Newest play first, the order a DatePlayed sort gives, so libraries
  /// answering separately still read as one list.
  static int _byLastPlayed(AggregatedItem a, AggregatedItem b) =>
      _lastPlayedOf(b).compareTo(_lastPlayedOf(a));

  static List<Map<String, dynamic>> _rawItems(Map<String, dynamic> response) =>
      ((response['Items'] as List?) ?? const [])
          .whereType<Map>()
          .map((item) => item.cast<String, dynamic>())
          .toList(growable: false);

  /// The libraries to search, or null when one sweep of the server is still
  /// right because nothing is hidden.
  Future<List<String>?> _visibleLibraryIds(List<String> includeItemTypes) async {
    if (!GetIt.instance.isRegistered<UserViewsRepository>()) return null;
    try {
      final repo = GetIt.instance<UserViewsRepository>();
      if ((await repo.getMyMediaExcludes()).isEmpty) return null;

      final wanted = includeItemTypes
          .map((type) => _libraryTypesByItemType[type])
          .whereType<String>()
          .toSet();
      final ids = <String>[];
      for (final view in await repo.getUserViews()) {
        final type = view.collectionType.toLowerCase();
        if (view.id.isEmpty) continue;
        if (type.isEmpty || wanted.isEmpty || wanted.contains(type)) {
          ids.add(view.id);
        }
      }
      // Nothing left to search would empty the row, so let the sweep stand and
      // show something rather than nothing.
      return ids.isEmpty ? null : ids;
    } catch (_) {
      return null;
    }
  }

  Future<HomeRow> loadRewatchRow(String serverId) async {
    final prefs = GetIt.instance<UserPreferences>();
    final includeMovies = prefs.get(UserPreferences.rewatchIncludeMovies);
    final includeShows = prefs.get(UserPreferences.rewatchIncludeShows);
    final includeCollections = prefs.get(UserPreferences.rewatchIncludeCollections);
    final sortBy = prefs.get(UserPreferences.rewatchSortBy);

    final watchedItems = <AggregatedItem>[];
    final seriesLastPlayedDates = <String, String>{};

    // 1. Movies
    if (includeMovies) {
      try {
        watchedItems.addAll(
          await _searchVisibleLibraryItems(
            serverId,
            const ['Movie'],
            (parentId) => _getItemsWithFallback(
              parentId: parentId,
              includeItemTypes: const ['Movie'],
              filters: const ['IsPlayed'],
              sortBy: 'DatePlayed',
              sortOrder: 'Descending',
              recursive: true,
              limit: 50,
              fields: '$_fields,UserData',
            ),
            merge: _byLastPlayed,
          ),
        );
      } catch (_) {}
    }

    // 2. Shows
    if (includeShows) {
      try {
        final episodes = await _searchVisibleLibraryItems(
          serverId,
          const ['Episode'],
          (parentId) => _getItemsWithFallback(
            parentId: parentId,
            includeItemTypes: const ['Episode'],
            filters: const ['IsPlayed'],
            sortBy: 'DatePlayed',
            sortOrder: 'Descending',
            recursive: true,
            limit: 100,
            fields: 'SeriesId,UserData',
          ),
          merge: _byLastPlayed,
        );
        final seriesIds = <String>[];
        
        for (final ep in episodes) {
          final sId = ep.rawData['SeriesId']?.toString();
          if (sId != null && sId.isNotEmpty) {
            final lpDate = ep.rawData['UserData']?['LastPlayedDate']?.toString() ?? '';
            if (lpDate.isNotEmpty) {
              final existing = seriesLastPlayedDates[sId] ?? '';
              if (lpDate.compareTo(existing) > 0) {
                seriesLastPlayedDates[sId] = lpDate;
              }
            }
            if (!seriesIds.contains(sId)) {
              seriesIds.add(sId);
            }
          }
        }
            
        if (seriesIds.isNotEmpty) {
          final seriesRes = await _client.itemsApi.getItems(
            ids: seriesIds,
            fields: '$_fields,UserData',
          );
          final parsedSeries = _parseItems(seriesRes, serverId);
          
          final checkFutures = parsedSeries.map((s) async {
            final userData = s.rawData['UserData'] as Map?;
            final isPlayed = userData?['Played'] as bool? ?? false;
            final unplayedCount = s.rawData['UnplayedItemCount'] as int? ?? userData?['UnplayedItemCount'] as int? ?? 0;
            
            if (!isPlayed || unplayedCount > 0) return null;
            
            try {
              final episodesRes = await _client.itemsApi.getItems(
                parentId: s.id,
                includeItemTypes: const ['Episode'],
                recursive: true,
                filters: const ['IsUnplayed'],
                limit: 1,
              );
              final itemsCount = episodesRes['TotalRecordCount'] as int? ?? (episodesRes['Items'] as List?)?.length ?? 0;
              if (itemsCount == 0) {
                return s;
              }
            } catch (_) {
              return s;
            }
            return null;
          }).toList();
          
          final checkedResults = await Future.wait(checkFutures);
          final filteredSeries = checkedResults.whereType<AggregatedItem>().toList();
          watchedItems.addAll(filteredSeries);
        }
      } catch (_) {}
    }

    // 3. Collections
    final collectionLastPlayedDates = <String, String>{};
    if (includeCollections) {
      try {
        final res = await _getItemsWithFallback(
          includeItemTypes: const ['BoxSet'],
          recursive: true,
          limit: 50,
          fields: '$_fields',
        );
        final collections = _parseItems(res, serverId);
        
        final collectionFutures = collections.map((col) async {
          try {
            final childrenRes = await _client.itemsApi.getItems(
              parentId: col.id,
              recursive: true,
              fields: 'UserData',
            );
            final children = childrenRes['Items'] as List? ?? [];
            if (children.isNotEmpty && children.every((c) => (c['UserData']?['Played'] as bool?) == true)) {
              // Find max LastPlayedDate of children to assign to the collection
              String maxLp = '';
              for (final c in children) {
                final lp = c['UserData']?['LastPlayedDate']?.toString() ?? '';
                if (lp.compareTo(maxLp) > 0) maxLp = lp;
              }
              return {
                'col': col,
                'isPlayed': true,
                'lastPlayed': maxLp,
              };
            }
          } catch (_) {}
          return {
            'col': col,
            'isPlayed': false,
            'lastPlayed': '',
          };
        }).toList();

        final collectionInfos = await Future.wait(collectionFutures);
        for (final info in collectionInfos) {
          if (info['isPlayed'] as bool) {
            watchedItems.add(info['col'] as AggregatedItem);
            collectionLastPlayedDates[(info['col'] as AggregatedItem).id] = info['lastPlayed'] as String;
          }
        }
      } catch (_) {}
    }

    // Sort the watchedItems
    if (sortBy == RewatchSortBy.recentlyWatched) {
      watchedItems.sort((a, b) {
        String lpA = _lastPlayedOf(a);
        if (a.type == 'BoxSet' && collectionLastPlayedDates.containsKey(a.id)) {
          lpA = collectionLastPlayedDates[a.id]!;
        } else if (a.type == 'Series' && seriesLastPlayedDates.containsKey(a.id)) {
          lpA = seriesLastPlayedDates[a.id]!;
        }
        
        String lpB = _lastPlayedOf(b);
        if (b.type == 'BoxSet' && collectionLastPlayedDates.containsKey(b.id)) {
          lpB = collectionLastPlayedDates[b.id]!;
        } else if (b.type == 'Series' && seriesLastPlayedDates.containsKey(b.id)) {
          lpB = seriesLastPlayedDates[b.id]!;
        }
        return lpB.compareTo(lpA);
      });
    } else {
      watchedItems.shuffle();
    }

    // Take top 15 and resolve rewatch entries in parallel
    final resolveFutures = watchedItems.take(15).map((item) async {
      if (item.type == 'Movie') {
        return item;
      } else if (item.type == 'BoxSet') {
        return item;
      } else if (item.type == 'Series') {
        // Fetch first episode of this series
        try {
          final epRes = await _getItemsWithFallback(
            parentId: item.id,
            includeItemTypes: const ['Episode'],
            recursive: true,
            sortBy: 'SortName,ProductionYear',
            sortOrder: 'Ascending',
            limit: 1,
          );
          final eps = _parseItems(epRes, serverId);
          if (eps.isNotEmpty) {
            return eps.first;
          }
        } catch (_) {}
        return item;
      }
      return item;
    }).toList();

    final resolvedItems = await Future.wait(resolveFutures);

    return HomeRow(
      id: 'rewatch',
      title: 'Rewatch',
      rowType: HomeRowType.latestMedia,
      items: resolvedItems,
    );
  }

  double _scoreCandidate(
    Map<String, dynamic> candidate, {
    required List<String> genres,
    required List<String> tags,
    required List<String> actorNames,
    required List<String> directorNames,
    required List<String> writerNames,
    required List<String> baseStudios,
    required int? baseYear,
    required String baseName,
  }) {
    double score = 0.0;

    final cGenres = (candidate['Genres'] as List?)?.map((e) => e?.toString()).whereType<String>().toList() ?? const <String>[];
    for (final g in genres) {
      if (cGenres.contains(g)) score += 3.0;
    }

    final cTags = (candidate['Tags'] as List?)?.map((e) => e?.toString()).whereType<String>().toList() ?? const <String>[];
    for (final t in tags) {
      if (cTags.contains(t)) score += 3.0;
    }

    final cPeople = (candidate['People'] as List?)?.map((e) => e is Map ? Map<String, dynamic>.from(e) : null).whereType<Map<String, dynamic>>().toList() ?? const <Map<String, dynamic>>[];
    final cActors = cPeople.where((p) => p['Type'] == 'Actor').map((p) => p['Name']?.toString()).whereType<String>().toSet();
    final cDirectors = cPeople.where((p) => p['Type'] == 'Director').map((p) => p['Name']?.toString()).whereType<String>().toSet();
    final cWriters = cPeople.where((p) => p['Type'] == 'Writer').map((p) => p['Name']?.toString()).whereType<String>().toSet();
    for (final a in actorNames) {
      if (cActors.contains(a)) score += 5.0;
    }
    for (final d in directorNames) {
      if (cDirectors.contains(d)) score += 6.0;
    }
    for (final w in writerNames) {
      if (cWriters.contains(w)) score += 6.0;
    }

    final cStudios = (candidate['Studios'] as List?)?.map((e) => e is Map ? e['Name']?.toString() : e?.toString()).whereType<String>().toSet() ?? const <String>{};
    for (final s in baseStudios) {
      if (cStudios.contains(s)) score += 3.0;
    }

    final candYear = candidate['ProductionYear'] as int?;
    if (candYear != null && baseYear != null) {
      if (candYear == baseYear) {
        score += 2.0;
      } else if ((candYear - baseYear).abs() <= 3) {
        score += 1.0;
      }
    }

    if (_isSequelOrSimilarTitle(baseName, candidate['Name']?.toString() ?? '')) {
      score += 10.0;
    }

    final candCommRating = (candidate['CommunityRating'] as num?)?.toDouble();
    if (candCommRating != null) {
      score += candCommRating / 10.0;
    }

    return score;
  }

  bool _isSequelOrSimilarTitle(String titleA, String titleB) {
    const stopWords = {'the', 'and', 'with', 'from', 'under', 'over', 'about', 'chapter', 'part', 'movie', 'film'};

    List<String> keyWords(String s) => s
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), ' ')
        .split(RegExp(r'\s+'))
        .where((w) => w.length >= 4 && !stopWords.contains(w))
        .toList();

    final a = keyWords(titleA);
    final b = keyWords(titleB);
    if (a.isEmpty || b.isEmpty) return false;

    final setA = a.toSet();
    final setB = b.toSet();

    // If one title's meaningful words all show up in the other, call it related.
    // That catches "Predator" and "The Predator", "Iron Man" and "Iron Man 2",
    // or "The Dark Knight" and "The Dark Knight Rises", while a single word
    // shared between "Dark Knight" and "Dark Waters" is not enough.
    if (setA.containsAll(setB) || setB.containsAll(setA)) return true;

    // A single subject word that only differs by a short suffix, so pluralized
    // sequels like "Alien" and "Aliens" or "Predator" and "Predators" still
    // count without matching something unrelated like "Alien" and "Alienist".
    if (setA.length == 1 && setB.length == 1) {
      final short = a.first.length <= b.first.length ? a.first : b.first;
      final long = a.first.length <= b.first.length ? b.first : a.first;
      return long.startsWith(short) && long.length - short.length <= 2;
    }

    return false;
  }
}

class _ParsedStableId {
  final HomeSectionPluginSource source;
  final String serverId;
  final String section;
  final String additionalData;

  _ParsedStableId({
    required this.source,
    required this.serverId,
    required this.section,
    required this.additionalData,
  });
}
