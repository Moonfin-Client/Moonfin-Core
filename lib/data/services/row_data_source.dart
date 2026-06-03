import 'dart:async';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:dio/dio.dart';

import '../../preference/home_section_config.dart';
import '../../preference/user_preferences.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/current_app_localizations.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/latest_media_row_normalizer.dart';
import '../utils/genre_browse_utils.dart';
import '../utils/playlist_utils.dart';

class RowDataSource {
  final MediaServerClient _client;

  static const _defaultLimit = 15;
  static const _maxItems = 100;
  static const _defaultSortBy = 'SortName';
  static const _defaultSortOrder = 'Ascending';
  static const _genreArtworkConcurrency = 6;

  static const _fields =
      'Type,UserData,Overview,Genres,CommunityRating,CriticRating,'
      'OfficialRating,RunTimeTicks,ProductionYear,SeriesName,'
      'ParentIndexNumber,IndexNumber,Status,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,'
      'ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,'
      'ParentLogoItemId,ParentLogoImageTag';
  static const _fallbackFields =
      'Type,UserData,OfficialRating,RunTimeTicks,ProductionYear,SeriesName,'
      'ParentIndexNumber,IndexNumber,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,'
      'ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,'
      'ParentLogoItemId,ParentLogoImageTag';
  static const _minimalFields =
      'Type,UserData,RunTimeTicks,ProductionYear,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,SeriesId';

  // Cap image tags to one per type (server returns all by default)
  static const _imageTypes = 'Primary,Backdrop,Thumb';
  static const _imageTypeLimit = 1;

  RowDataSource(this._client);

  ImageApi get imageApi => _client.imageApi;
  AppLocalizations get _l10n => currentAppLocalizations();

  Future<bool> hasLiveTvChannels() async {
    final response = await _client.liveTvApi.getChannels(
      limit: 1,
      enableTotalRecordCount: true,
    );
    final total = response['TotalRecordCount'] as int? ?? 0;
    return total > 0;
  }

  Future<HomeRow> loadOnNow(String serverId) async {
    final response = await _client.liveTvApi.getRecommendedPrograms(
      limit: _defaultLimit,
    );
    return _buildRow(
      id: 'liveTvOnNow',
      title: _l10n.onNow,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.liveTvOnNow,
    );
  }

  Future<HomeRow> loadResume(String serverId) async {
    final response = await _getResumeItemsWithFallback(
      includeItemTypes: ['Movie', 'Episode'],
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

  Future<HomeRow> loadNextUp(String serverId) async {
    final response = await _getNextUpWithFallback(
      limit: _defaultLimit,
      enableResumable: false,
    );
    return _buildRow(
      id: 'nextUp',
      title: _l10n.nextUp,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.nextUp,
    );
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
    final response = await getNextUpRelaxed(
      limit: _defaultLimit,
    );
    return _buildRow(
      id: 'nextUp',
      title: _l10n.nextUp,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.nextUp,
    );
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
      totalCount: items.length,
    );
  }

  Future<HomeRow> loadPlaylists(String serverId, {String? mediaType}) async {
    final response = await _getItemsWithFallback(
      includeItemTypes: ['Playlist'],
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      recursive: true,
      limit: _defaultLimit,
    );
    var row = _buildRow(
      id: 'playlists',
      title: _l10n.playlists,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.playlists,
    );
    row = row.copyWith(
      items: await filterBrowsablePlaylists(
        _client,
        row.items,
        mediaType: mediaType,
      ),
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

  Future<HomeRow> loadGenres(
    String serverId, {
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    List<String>? includeItemTypes,
  }) async {
    final browseItemTypes = normalizeBrowsableGenreItemTypes(includeItemTypes);
    Map<String, dynamic> response;
    try {
      response = await _client.itemsApi.getGenres(
        sortBy: sortBy,
        sortOrder: sortOrder,
        recursive: true,
        limit: _defaultLimit,
        fields: 'ItemCounts',
        includeItemTypes: browseItemTypes,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      response = await _client.itemsApi.getGenres(
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

    return _buildRow(
      id: 'genres',
      title: _l10n.genres,
      response: enrichedResponse,
      serverId: serverId,
      rowType: HomeRowType.genres,
    );
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
    final genreId = genreData['Id'] as String?;
    if (genreId == null || genreId.isEmpty) {
      return null;
    }

    try {
      final response = await _getItemsWithFallback(
        genreIds: [genreId],
        includeItemTypes: includeItemTypes,
        excludeItemTypes: const ['Episode'],
        sortBy: _defaultSortBy,
        sortOrder: _defaultSortOrder,
        recursive: true,
        limit: 1,
      );

      final items = (response['Items'] as List?) ?? const [];
      if (items.isEmpty) {
        return null;
      }

      final representative = items.first;
      if (representative is! Map) {
        return null;
      }

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
        representativeItem: representative.cast<String, dynamic>(),
        itemCount: totalCount,
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
  }) async {
    final response = await _getItemsWithFallback(
      parentId: collectionId,
      sortBy: sortBy,
      sortOrder: sortOrder,
      recursive: true,
      limit: _defaultLimit,
    );
    return _buildRow(
      id: rowId,
      title: title,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.collections,
    );
  }

  Future<HomeRow> loadGenreRow(
    String serverId, {
    required String genreId,
    required String title,
    required String rowId,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    List<String>? includeItemTypes,
  }) async {
    final response = await _getItemsWithFallback(
      genreIds: [genreId],
      sortBy: sortBy,
      sortOrder: sortOrder,
      recursive: true,
      limit: _defaultLimit,
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
  }) async {
    final response = await _getItemsWithFallback(
      includeItemTypes: includeItemTypes,
      sortBy: sortBy,
      sortOrder: sortOrder,
      recursive: true,
      limit: _defaultLimit,
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
    final response = await _client.userViewsApi.getUserViews();
    return _buildRow(
      id:
          rowType == HomeRowType.libraryTilesSmall
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
    return _buildRow(
      id: 'nextUp_$parentId',
      title: _l10n.nextUp,
      response: response,
      serverId: serverId,
      rowType: HomeRowType.nextUp,
    );
  }

  Future<HomeRow> loadLibraryFavorites(
    String parentId,
    String serverId, {
    List<String>? includeItemTypes,
  }) async {
    final response = await _getItemsWithFallback(
      parentId: parentId,
      isFavorite: true,
      sortBy: 'SortName',
      sortOrder: 'Ascending',
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
    final response =
        isAlbumArtistBrowse
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

  Future<List<AggregatedItem>> loadMore({
    required HomeRow row,
    required String serverId,
  }) async {
    if (!row.hasMore || row.items.length >= _maxItems) return row.items;

    Map<String, dynamic> response;

    switch (row.rowType) {
      case HomeRowType.playlists:
        response = await _getItemsWithFallback(
          includeItemTypes: ['Playlist'],
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          startIndex: row.items.length,
          limit: _defaultLimit,
        );
      case HomeRowType.resume:
      case HomeRowType.resumeAudio:
      case HomeRowType.nextUp:
      case HomeRowType.latestMedia:
      case HomeRowType.favorites:
      case HomeRowType.collections:
      case HomeRowType.genres:
      case HomeRowType.libraryTiles:
      case HomeRowType.libraryTilesSmall:
      case HomeRowType.liveTv:
      case HomeRowType.liveTvOnNow:
      case HomeRowType.activeRecordings:
      case HomeRowType.mediaBar:
      case HomeRowType.pluginDynamic:
        return row.items;
    }

    final newItems =
        row.rowType == HomeRowType.playlists
            ? await filterBrowsablePlaylists(
              _client,
              _parseItems(response, serverId),
              mediaType:
                  row.items.isNotEmpty &&
                          row.items.every(isAudioPlaylistSummary)
                      ? 'Audio'
                      : null,
            )
            : _parseItems(response, serverId);
    return [...row.items, ...newItems];
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
  }) async {
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
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      );
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
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
        fields: _fallbackFields,
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
    required int limit,
  }) async {
    try {
      final response = await _client.itemsApi.getResumeItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        limit: limit,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      ).timeout(const Duration(seconds: 8));
      return response;
    } on TimeoutException {
      final response = await _client.itemsApi.getResumeItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        limit: limit,
        fields: _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      ).timeout(const Duration(seconds: 6));
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      final response = await _client.itemsApi.getResumeItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
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
    required int limit,
    bool? enableResumable,
  }) async {
    try {
      final response = await _client.itemsApi.getNextUp(
        parentId: parentId,
        limit: limit,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableResumable: enableResumable,
      ).timeout(const Duration(seconds: 8));
      return response;
    } on TimeoutException {
      final response = await _client.itemsApi.getNextUp(
        parentId: parentId,
        limit: limit,
        fields: _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableResumable: enableResumable,
      ).timeout(const Duration(seconds: 6));
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      final response = await _client.itemsApi.getNextUp(
        parentId: parentId,
        limit: limit,
        fields: _fallbackFields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableResumable: enableResumable,
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
      final response = await _client.itemsApi.getResumeItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        limit: limit,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      ).timeout(const Duration(seconds: 20));
      return response;
    } on TimeoutException {
      try {
        final response = await _client.itemsApi.getResumeItems(
          parentId: parentId,
          includeItemTypes: includeItemTypes,
          limit: limit,
          fields: _minimalFields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        ).timeout(const Duration(seconds: 12));
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
      final response = await _client.itemsApi.getNextUp(
        parentId: parentId,
        limit: limit,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableResumable: enableResumable,
      ).timeout(const Duration(seconds: 20));
      return response;
    } on TimeoutException {
      try {
        final response = await _client.itemsApi.getNextUp(
          parentId: parentId,
          limit: limit,
          fields: _minimalFields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
          enableResumable: enableResumable,
        ).timeout(const Duration(seconds: 12));
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

  /// Loads items for a dynamic section provided by a third-party plugin.
  /// Dispatches on [pluginSource] so callers can mix HSS rows (server-driven
  /// REST endpoint) and KefinTweaks rows (client-side spec issued against
  /// `/Items`).
  Future<HomeRow> loadDynamicSection({
    required String rowId,
    required String section,
    required String title,
    required String serverId,
    String? additionalData,
    HomeSectionPluginSource pluginSource = HomeSectionPluginSource.hss,
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
          var sortBy = _defaultSortBy;
          if (GetIt.instance.isRegistered<UserPreferences>()) {
            sortBy = GetIt.instance<UserPreferences>()
                .get(UserPreferences.collectionsRowSortBy)
                .apiValue;
          }
          final row = await loadCollectionRow(
            serverId,
            collectionId: collectionId,
            title: title,
            rowId: rowId,
            sortBy: sortBy,
            sortOrder: _defaultSortOrder,
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
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.genres,
          );
        }
        try {
          var sortBy = _defaultSortBy;
          List<String>? includeItemTypes;
          if (GetIt.instance.isRegistered<UserPreferences>()) {
            final prefs = GetIt.instance<UserPreferences>();
            sortBy = prefs.get(UserPreferences.genresRowSortBy).apiValue;
            includeItemTypes = prefs.get(UserPreferences.genresRowItemFilter).includeItemTypes;
          }
          final row = await loadGenreRow(
            serverId,
            genreId: genreId,
            title: title,
            rowId: rowId,
            sortBy: sortBy,
            sortOrder: _defaultSortOrder,
            includeItemTypes: includeItemTypes,
          );
          return row;
        } catch (_) {
          return HomeRow(
            id: rowId,
            title: title,
            rowType: HomeRowType.genres,
          );
        }
      case HomeSectionPluginSource.kefinTweaks:
        return _loadKefinSection(
          rowId: rowId,
          title: title,
          serverId: serverId,
          additionalData: additionalData,
        );
      case HomeSectionPluginSource.hss:
        return _loadHssSection(
          rowId: rowId,
          section: section,
          title: title,
          serverId: serverId,
          additionalData: additionalData,
        );
    }
  }

  Future<HomeRow> _loadHssSection({
    required String rowId,
    required String section,
    required String title,
    required String serverId,
    String? additionalData,
  }) async {
    final api = _client.homeScreenSectionsApi;
    if (api == null) {
      return HomeRow(
        id: rowId,
        title: title,
        rowType: HomeRowType.pluginDynamic,
      );
    }
    try {
      final response = await api.getSectionItems(
        section,
        additionalData: additionalData,
      );
      // The plugin endpoint omits expensive fields like Overview, so re-fetch
      // via /Items to populate the info overlay.
      final enriched = await _enrichItemsWithFields(response);
      return _buildRow(
        id: rowId,
        title: title,
        response: enriched,
        serverId: serverId,
        rowType: HomeRowType.pluginDynamic,
      );
    } catch (_) {
      return HomeRow(
        id: rowId,
        title: title,
        rowType: HomeRowType.pluginDynamic,
      );
    }
  }

  Future<HomeRow> _loadKefinSection({
    required String rowId,
    required String title,
    required String serverId,
    String? additionalData,
  }) async {
    Map<String, dynamic>? spec;
    if (additionalData != null && additionalData.isNotEmpty) {
      try {
        final decoded = jsonDecode(additionalData);
        if (decoded is Map<String, dynamic>) spec = decoded;
      } catch (_) {}
    }
    HomeRow emptyRow() => HomeRow(
          id: rowId,
          title: title,
          rowType: HomeRowType.pluginDynamic,
        );
    if (spec == null) return emptyRow();

    try {
      final response = await _runKefinSpec(spec);
      if (response == null) return emptyRow();
      return _buildRow(
        id: rowId,
        title: title,
        response: response,
        serverId: serverId,
        rowType: HomeRowType.pluginDynamic,
      );
    } catch (_) {
      return emptyRow();
    }
  }

  Future<Map<String, dynamic>?> _runKefinSpec(Map<String, dynamic> spec) async {
    final kind = spec['kind']?.toString() ?? '';
    final limit = (spec['limit'] as num?)?.toInt() ?? _defaultLimit;
    switch (kind) {
      case 'recentlyReleasedMovies':
        return _client.itemsApi.getItems(
          includeItemTypes: const ['Movie'],
          recursive: true,
          sortBy: 'PremiereDate',
          sortOrder: 'Descending',
          minPremiereDate:
              DateTime.now().subtract(const Duration(days: 7)),
          limit: limit,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
      case 'recentlyReleasedEpisodes':
        return _client.itemsApi.getItems(
          includeItemTypes: const ['Episode'],
          recursive: true,
          sortBy: 'PremiereDate',
          sortOrder: 'Descending',
          minPremiereDate:
              DateTime.now().subtract(const Duration(days: 7)),
          limit: limit,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
      case 'watchAgain':
        return _client.itemsApi.getItems(
          includeItemTypes: const ['Movie', 'Series'],
          recursive: true,
          filters: const ['IsPlayed'],
          sortBy: 'DatePlayed',
          sortOrder: 'Descending',
          limit: limit,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
      case 'recentlyAddedInLibrary':
        return _runKefinRecentlyAddedInLibrary(spec, limit);
      case 'custom':
        return _runKefinCustom(spec, limit);
    }
    return null;
  }

  Future<Map<String, dynamic>?> _runKefinRecentlyAddedInLibrary(
    Map<String, dynamic> spec,
    int limit,
  ) async {
    final libraryIds = (spec['libraryIds'] as List?)
            ?.map((e) => e?.toString())
            .whereType<String>()
            .toList() ??
        const <String>[];
    if (libraryIds.isEmpty) return null;
    final all = <Map<String, dynamic>>[];
    for (final id in libraryIds) {
      try {
        final response = await _client.itemsApi.getLatestItems(
          parentId: id,
          limit: limit,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
        final items = response['Items'];
        if (items is List) {
          all.addAll(items.whereType<Map>().map((m) => m.cast<String, dynamic>()));
        }
      } catch (_) {}
    }
    if (all.isEmpty) return null;
    final trimmed = all.take(limit).toList(growable: false);
    return {
      'Items': trimmed,
      'TotalRecordCount': trimmed.length,
    };
  }

  Future<Map<String, dynamic>?> _runKefinCustom(
    Map<String, dynamic> spec,
    int limit,
  ) async {
    final type = (spec['type']?.toString() ?? '').toLowerCase();
    final source = spec['source']?.toString() ?? '';
    if (source.isEmpty) return null;
    final includeItemTypes = (spec['includeItemTypes'] as List?)
            ?.map((e) => e?.toString())
            .whereType<String>()
            .toList() ??
        const ['Movie', 'Series'];
    final sortBy = _kefinSortBy(spec['sortBy']?.toString());
    final sortOrder = _kefinSortOrder(spec['sortOrderDirection']?.toString());

    switch (type) {
      case 'tag':
        return _client.itemsApi.getItems(
          includeItemTypes: includeItemTypes,
          recursive: true,
          sortBy: sortBy,
          sortOrder: sortOrder,
          tags: [source],
          limit: limit,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
      case 'genre':
        return _client.itemsApi.getItems(
          includeItemTypes: includeItemTypes,
          recursive: true,
          sortBy: sortBy,
          sortOrder: sortOrder,
          genres: [source],
          limit: limit,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
      case 'parent':
      case 'collection':
      case 'playlist':
        return _client.itemsApi.getItems(
          parentId: source,
          includeItemTypes: includeItemTypes,
          recursive: true,
          sortBy: sortBy,
          sortOrder: sortOrder,
          limit: limit,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
    }
    return null;
  }

  static String _kefinSortBy(String? value) {
    switch (value?.toLowerCase()) {
      case 'releasedate':
      case 'premieredate':
        return 'PremiereDate';
      case 'dateadded':
      case 'datecreated':
        return 'DateCreated';
      case 'name':
      case 'sortname':
        return 'SortName';
      case 'communityrating':
        return 'CommunityRating';
      case 'datelastcontentadded':
        return 'DateLastContentAdded';
      case 'random':
      case null:
      case '':
        return 'Random';
      default:
        return value!;
    }
  }

  static String _kefinSortOrder(String? value) {
    switch (value?.toLowerCase()) {
      case 'descending':
        return 'Descending';
      default:
        return 'Ascending';
    }
  }

  Future<Map<String, dynamic>> _enrichItemsWithFields(
    Map<String, dynamic> response,
  ) async {
    final items = response['Items'];
    if (items is! List || items.isEmpty) return response;

    Map<String, dynamic> mergeItemData(
      Map<String, dynamic> rawItem,
      Map<String, dynamic> enrichedItem,
    ) {
      final merged = <String, dynamic>{...rawItem, ...enrichedItem};

      final rawImageTags = rawItem['ImageTags'];
      final enrichedImageTags = enrichedItem['ImageTags'];
      if (rawImageTags is Map || enrichedImageTags is Map) {
        final rawTags =
            rawImageTags is Map
                ? rawImageTags.cast<String, dynamic>()
                : const <String, dynamic>{};
        final enrichedTags =
            enrichedImageTags is Map
                ? enrichedImageTags.cast<String, dynamic>()
                : const <String, dynamic>{};
        merged['ImageTags'] = {...rawTags, ...enrichedTags};
      }

      void restoreRawIfMissing(String key) {
        final rawValue = rawItem[key];
        final mergedValue = merged[key];
        final missing =
            mergedValue == null ||
            (mergedValue is String && mergedValue.isEmpty) ||
            (mergedValue is List && mergedValue.isEmpty);
        if (missing && rawValue != null) {
          merged[key] = rawValue;
        }
      }

      for (final key in const [
        'PrimaryImageTag',
        'PrimaryImageItemId',
        'ParentPrimaryImageTag',
        'ParentPrimaryImageItemId',
        'SeriesPrimaryImageTag',
        'SeriesId',
        'ParentThumbItemId',
        'ParentThumbImageTag',
        'BackdropImageTags',
        'ParentBackdropItemId',
        'ParentBackdropImageTags',
      ]) {
        restoreRawIfMissing(key);
      }

      return merged;
    }

    final ids = <String>[];
    for (final raw in items) {
      if (raw is Map && raw['Id'] is String) {
        ids.add(raw['Id'] as String);
      }
    }
    if (ids.isEmpty) return response;
    try {
      final full = await _client.itemsApi.getItems(
        ids: ids,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        limit: ids.length,
      );
      final fullItems = full['Items'];
      if (fullItems is! List || fullItems.isEmpty) return response;
      final byId = <String, Map<String, dynamic>>{};
      for (final raw in fullItems) {
        if (raw is Map && raw['Id'] is String) {
          byId[raw['Id'] as String] = raw.cast<String, dynamic>();
        }
      }
      final merged = <Map<String, dynamic>>[];
      for (final raw in items) {
        if (raw is Map && raw['Id'] is String) {
          final id = raw['Id'] as String;
          final rawMap = raw.cast<String, dynamic>();
          final enrichedMap = byId[id];
          if (enrichedMap != null) {
            merged.add(mergeItemData(rawMap, enrichedMap));
          } else {
            merged.add(rawMap);
          }
        } else if (raw is Map) {
          merged.add(raw.cast<String, dynamic>());
        }
      }
      return {
        ...response,
        'Items': merged,
      };
    } catch (_) {
      return response;
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
        id: data['Id'] as String,
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

  Set<String> _blockedParentalRatings() {
    if (!GetIt.instance.isRegistered<UserPreferences>()) return const {};
    final csv = GetIt.instance<UserPreferences>()
        .get(UserPreferences.blockedParentalRatings);
    if (csv.trim().isEmpty) return const {};
    return csv
        .split(',')
        .map((e) => e.trim().toUpperCase())
        .where((e) => e.isNotEmpty)
        .toSet();
  }
}
