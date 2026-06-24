import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'jellyfin_item_fields.dart';

class JellyfinItemsApi implements ItemsApi {
  final Dio _dio;
  final String Function() _getUserId;

  JellyfinItemsApi(this._dio, this._getUserId);

  bool _shouldRetryCollectionFallback(int statusCode) {
    return statusCode == 400 ||
        statusCode == 404 ||
        statusCode == 405 ||
        statusCode == 415 ||
        statusCode == 422;
  }

  @override
  Future<Map<String, dynamic>> getItems({
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
  }) async {
    final response = await _dio.get(
      '/Items',
      queryParameters: {
        'ParentId': ?parentId,
        if (ids != null) 'Ids': ids.join(','),
        if (includeItemTypes != null)
          'IncludeItemTypes': includeItemTypes.join(','),
        if (excludeItemTypes != null)
          'ExcludeItemTypes': excludeItemTypes.join(','),
        'SortBy': ?sortBy,
        'SortOrder': ?sortOrder,
        'StartIndex': ?startIndex,
        'Limit': ?limit,
        'Recursive': ?recursive,
        'SearchTerm': ?searchTerm,
        'Fields': ?fields,
        if (personIds != null) 'PersonIds': personIds.join(','),
        if (artistIds != null) 'ArtistIds': artistIds.join(','),
        if (filters != null) 'Filters': filters.join(','),
        if (seriesStatus != null) 'SeriesStatus': seriesStatus.join(','),
        'NameStartsWith': ?nameStartsWith,
        'NameLessThan': ?nameLessThan,
        if (genreIds != null) 'GenreIds': genreIds.join(','),
        if (genres != null) 'Genres': genres.join(','),
        'IsFavorite': ?isFavorite,
        'CollapseBoxSetItems': ?collapseBoxSetItems,
        'EnableTotalRecordCount': ?enableTotalRecordCount,
        'EnableImageTypes': ?enableImageTypes,
        'ImageTypeLimit': ?imageTypeLimit,
        if (tags != null && tags.isNotEmpty) 'Tags': tags.join('|'),
        if (studios != null && studios.isNotEmpty) 'Studios': studios.join('|'),
        if (minPremiereDate != null)
          'MinPremiereDate': minPremiereDate.toUtc().toIso8601String(),
        'MaxOfficialRating': ?maxOfficialRating,
        'HasParentalRating': ?hasParentalRating,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getItem(String itemId) async {
    final userId = _getUserId();
    final response = await _dio.get(
      '/Users/$userId/Items/$itemId',
      queryParameters: {'Fields': kItemFields},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async {
    final response = await _dio.get('/Items/$itemId/Ancestors');
    return ((response.data as List?) ?? const [])
        .whereType<Map>()
        .map((e) => e.cast<String, dynamic>())
        .toList(growable: false);
  }

  @override
  Future<Map<String, dynamic>> getSimilarItems(
    String itemId, {
    int? limit,
  }) async {
    final response = await _dio.get(
      '/Items/$itemId/Similar',
      queryParameters: {'Limit': ?limit},
    );
    return response.data as Map<String, dynamic>;
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
    final userId = _getUserId();
    final response = await _dio.get(
      '/Shows/NextUp',
      queryParameters: {
        'UserId': userId,
        'SeriesId': ?seriesId,
        'ParentId': ?parentId,
        'Limit': ?limit,
        'Fields': ?fields,
        'EnableResumable': ?enableResumable,
        'EnableImageTypes': ?enableImageTypes,
        'ImageTypeLimit': ?imageTypeLimit,
      },
    );
    return response.data as Map<String, dynamic>;
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
    final response = await _dio.get(
      '/UserItems/Resume',
      queryParameters: {
        'ParentId': ?parentId,
        if (includeItemTypes != null)
          'IncludeItemTypes': includeItemTypes.join(','),
        'Limit': ?limit,
        'Fields': ?fields,
        'EnableImageTypes': ?enableImageTypes,
        'ImageTypeLimit': ?imageTypeLimit,
      },
    );
    return response.data as Map<String, dynamic>;
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
    final response = await _dio.get(
      '/Items/Latest',
      queryParameters: {
        'ParentId': ?parentId,
        if (includeItemTypes != null)
          'IncludeItemTypes': includeItemTypes.join(','),
        'Limit': ?limit,
        'Fields': ?fields,
        'EnableImageTypes': ?enableImageTypes,
        'ImageTypeLimit': ?imageTypeLimit,
      },
    );
    final data = response.data;
    if (data is List) return {'Items': data, 'TotalRecordCount': data.length};
    return data as Map<String, dynamic>;
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
    final userId = _getUserId();
    final response = await _dio.get(
      '/Users/$userId/Items',
      queryParameters: {
        'ParentId': ?parentId,
        if (includeItemTypes != null)
          'IncludeItemTypes': includeItemTypes.join(','),
        'Limit': ?limit,
        'Fields': ?fields,
        'EnableImageTypes': ?enableImageTypes,
        'ImageTypeLimit': ?imageTypeLimit,
        'SortBy': 'PremiereDate',
        'SortOrder': 'Descending',
         'MaxPremiereDate': DateTime.now().toUtc().toIso8601String(),
      },
    );
    final data = response.data;
    if (data is List) return {'Items': data, 'TotalRecordCount': data.length};
    return data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getSeasons(String seriesId) async {
    final response = await _dio.get('/Shows/$seriesId/Seasons');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  }) async {
    final response = await _dio.get(
      '/Shows/$seriesId/Episodes',
      queryParameters: {'SeasonId': ?seasonId, 'Fields': ?fields},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  }) async {
    final response = await _dio.get(
      '/Items/$itemId/ThemeMedia',
      queryParameters: {'InheritFromParent': inheritFromParent},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getPlaylists() async {
    final response = await _dio.get(
      '/Items',
      queryParameters: {
        'IncludeItemTypes': 'Playlist',
        'Recursive': true,
        'SortBy': 'SortName',
        'SortOrder': 'Ascending',
      },
    );
    return response.data as Map<String, dynamic>;
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
    final response = await _dio.get(
      '/Artists',
      queryParameters: {
        'ParentId': ?parentId,
        'UserId': ?userId,
        'SortBy': ?sortBy,
        'SortOrder': ?sortOrder,
        'StartIndex': ?startIndex,
        'Limit': ?limit,
        'Recursive': ?recursive,
        'Fields': ?fields,
        'NameStartsWith': ?nameStartsWith,
        'NameLessThan': ?nameLessThan,
        'IsFavorite': ?isFavorite,
      },
    );
    return response.data as Map<String, dynamic>;
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
    final response = await _dio.get(
      '/Artists/AlbumArtists',
      queryParameters: {
        'ParentId': ?parentId,
        'UserId': ?userId,
        'SortBy': ?sortBy,
        'SortOrder': ?sortOrder,
        'StartIndex': ?startIndex,
        'Limit': ?limit,
        'Recursive': ?recursive,
        'Fields': ?fields,
        'NameStartsWith': ?nameStartsWith,
        'NameLessThan': ?nameLessThan,
        'IsFavorite': ?isFavorite,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getPlaylistItems(String playlistId) async {
    final response = await _dio.get(
      '/Playlists/$playlistId/Items',
      queryParameters: {
        'Fields':
            'BasicSyncInfo,PrimaryImageAspectRatio,RunTimeTicks,Artists,AlbumArtist,IndexNumber,MediaType,PlaylistItemId,BackdropImageTags,ParentBackdropImageTags,ParentBackdropItemId,SeriesName,ParentIndexNumber,Genres',
        'EnableImageTypes': 'Primary,Backdrop,Logo,Thumb',
        'ImageTypeLimit': 1,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> createPlaylist({
    required String name,
    List<String>? itemIds,
  }) async {
    final response = await _dio.post(
      '/Playlists',
      data: {'Name': name, 'Ids': ?itemIds},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) async {
    final hasItems = itemIds != null && itemIds.isNotEmpty;
    final ids = hasItems ? itemIds.join(',') : null;
    final queryParameters = <String, dynamic>{
      'name': name,
      'Name': name,
      if (ids != null) 'ids': ids,
      if (ids != null) 'Ids': ids,
    };

    Response<dynamic> response;
    try {
      response = await _dio.post(
        '/Collections',
        queryParameters: queryParameters,
      );
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode ?? 0;
      if (!_shouldRetryCollectionFallback(statusCode)) {
        rethrow;
      }

      response = await _dio.post(
        '/Collections',
        queryParameters: queryParameters,
        data: {
          'Name': name,
          if (hasItems) 'Ids': itemIds,
        },
      );
    }

    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is Map) {
      return data.cast<String, dynamic>();
    }
    return <String, dynamic>{};
  }

  @override
  Future<void> addToPlaylist(String playlistId, List<String> itemIds) async {
    await _dio.post(
      '/Playlists/$playlistId/Items',
      queryParameters: {'Ids': itemIds.join(',')},
    );
  }

  @override
  Future<void> addToCollection(String collectionId, List<String> itemIds) async {
    final ids = itemIds.join(',');
    final path = '/Collections/$collectionId/Items';

    Future<void> send({
      String? queryKey,
      bool includeBody = false,
    }) async {
      await _dio.post(
        path,
        queryParameters: queryKey == null ? null : {queryKey: ids},
        data: includeBody
            ? {
                'Ids': itemIds,
                'ids': ids,
              }
            : null,
      );
    }

    for (final queryKey in const ['Ids', 'ids']) {
      try {
        await send(queryKey: queryKey);
        return;
      } on DioException catch (error) {
        final statusCode = error.response?.statusCode ?? 0;
        if (!_shouldRetryCollectionFallback(statusCode)) {
          rethrow;
        }
      }
    }

    await send(includeBody: true);
  }

  @override
  Future<void> removeFromPlaylist(
    String playlistId,
    List<String> entryIds,
  ) async {
    await _dio.delete(
      '/Playlists/$playlistId/Items',
      queryParameters: {'EntryIds': entryIds.join(',')},
    );
  }

  @override
  Future<void> movePlaylistItem(
    String playlistId,
    String playlistItemId,
    int newIndex,
  ) async {
    await _dio.post(
      '/Playlists/$playlistId/Items/$playlistItemId/Move/$newIndex',
    );
  }

  @override
  Future<void> renamePlaylist(String playlistId, String name) async {
    await _dio.post('/Playlists/$playlistId', data: {'Name': name});
  }

  @override
  Future<void> deleteItem(String itemId) async {
    await _dio.delete('/Items/$itemId');
  }

  @override
  Future<void> deletePlaylist(String playlistId) async {
    await deleteItem(playlistId);
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
    final response = await _dio.get(
      '/Genres',
      queryParameters: {
        'ParentId': ?parentId,
        'UserId': ?userId,
        'SortBy': ?sortBy,
        'SortOrder': ?sortOrder,
        'StartIndex': ?startIndex,
        'Limit': ?limit,
        'Recursive': ?recursive,
        'Fields': ?fields,
        if (includeItemTypes != null && includeItemTypes.isNotEmpty)
          'IncludeItemTypes': includeItemTypes.join(','),
      },
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getLyrics(String itemId) async {
    final response = await _dio.get('/Audio/$itemId/Lyrics');
    return response.data as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> _parseItemListResponse(dynamic data) {
    if (data is List) return data.cast<Map<String, dynamic>>();
    if (data is Map<String, dynamic>) {
      final items = data['Items'] as List?;
      if (items == null) return const [];
      return items
          .whereType<Map>()
          .map((e) => e.cast<String, dynamic>())
          .toList(growable: false);
    }
    return const [];
  }

  @override
  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId) async {
    final userId = _getUserId();
    final response = await _dio.get(
      '/Users/$userId/Items/$itemId/LocalTrailers',
    );
    return _parseItemListResponse(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> getIntros(String itemId) async {
    final userId = _getUserId();
    final response = await _dio.get('/Users/$userId/Items/$itemId/Intros');
    return _parseItemListResponse(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId) async {
    final response = await _dio.get('/Items/$itemId/SpecialFeatures');
    final data = response.data;
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    }
    return const [];
  }

  @override
  Future<List<Map<String, dynamic>>> getMediaSegments(String itemId) async {
    final response = await _dio.get('/MediaSegments/$itemId');
    final data = response.data as Map<String, dynamic>;
    final items = data['Items'] as List? ?? [];
    return items.cast<Map<String, dynamic>>();
  }

  @override
  Future<List<Map<String, dynamic>>> searchRemoteSubtitles(
    String itemId, {
    required String language,
    bool? isPerfectMatch,
  }) async {
    final response = await _dio.get(
      '/Items/$itemId/RemoteSearch/Subtitles/$language',
      queryParameters: {'IsPerfectMatch': ?isPerfectMatch},
    );
    return ((response.data as List?) ?? const [])
        .whereType<Map>()
        .map((e) => e.cast<String, dynamic>())
        .toList(growable: false);
  }

  @override
  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId) async {
    await _dio.post('/Items/$itemId/RemoteSearch/Subtitles/$subtitleId');
  }
}
