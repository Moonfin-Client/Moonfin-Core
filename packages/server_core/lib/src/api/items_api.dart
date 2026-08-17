import '../models/query_filter_models.dart';

abstract class ItemsApi {
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
  });

  /// The values a library actually holds for the facet filters, so the picker
  /// only offers years, ratings, tags and languages that match something.
  /// Missing keys come back empty rather than absent, since a server that does
  /// not know a facet says nothing about it.
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  });

  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  });

  /// Full metadata by default. Pass [fields] to request a leaner set, e.g. an
  /// empty string when only the default DTO members like Name are needed.
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  });
  Future<List<Map<String, dynamic>>> getAncestors(String itemId);
  Future<Map<String, dynamic>> getSimilarItems(String itemId, {int? limit});

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
  });

  Future<Map<String, dynamic>> getResumeItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? startIndex,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
  });

  Future<Map<String, dynamic>> getLatestItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
  });

  /// Set [recursive] when there is no [parentId], or when [includeItemTypes]
  /// narrows what comes back. A recursive parent query without a type filter
  /// returns seasons and episodes alongside the series.
  Future<Map<String, dynamic>> getRecentlyReleasedItems({
    String? parentId,
    List<String>? includeItemTypes,
    int? limit,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
    bool recursive = false,
  });

  Future<Map<String, dynamic>> getSeasons(String seriesId);

  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  });

  Future<Map<String, dynamic>> getThemeMedia(
    String itemId, {
    bool inheritFromParent = true,
  });

  Future<Map<String, dynamic>> getPlaylists();

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
  });

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
  });

  Future<Map<String, dynamic>> getPlaylistItems(
    String playlistId, {
    int? startIndex,
    int? limit,
  });

  Future<Map<String, dynamic>> createPlaylist({
    required String name,
    List<String>? itemIds,
  });

  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  });

  Future<void> addToPlaylist(String playlistId, List<String> itemIds);

  Future<void> addToCollection(String collectionId, List<String> itemIds);

  Future<void> removeFromPlaylist(String playlistId, List<String> entryIds);

  Future<void> movePlaylistItem(
    String playlistId,
    String playlistItemId,
    int newIndex,
  );

  Future<void> renamePlaylist(String playlistId, String name);

  Future<void> deleteItem(String itemId);

  Future<void> deletePlaylist(String playlistId);

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
  });

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
  });

  Future<Map<String, dynamic>> getLyrics(String itemId);

  Future<List<Map<String, dynamic>>> getLocalTrailers(String itemId);

  Future<List<Map<String, dynamic>>> getIntros(String itemId);

  Future<List<Map<String, dynamic>>> getSpecialFeatures(String itemId);

  Future<List<Map<String, dynamic>>> getMediaSegments(String itemId);

  Future<List<Map<String, dynamic>>> searchRemoteSubtitles(
    String itemId, {
    required String language,
    bool? isPerfectMatch,
  });

  Future<void> downloadRemoteSubtitle(String itemId, String subtitleId);
}
