import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'plex_apis.dart';

/// Library edits for the server's owner, through Plex's own refresh, match
/// and artwork routes.
class PlexAdminItemsApi implements AdminItemsApi {
  final Dio _dio;
  final ImageApi _images;

  PlexAdminItemsApi(this._dio, this._images);

  /// The artwork kinds Plex keeps more than one of, by the list it keeps
  /// them in and the route that picks one.
  static const _artwork = {
    ImageType.primary: (list: 'posters', pick: 'poster'),
    ImageType.backdrop: (list: 'arts', pick: 'art'),
    ImageType.logo: (list: 'clearLogos', pick: 'clearLogo'),
  };

  static Never _noEditor() =>
      throw UnsupportedError("Plex metadata can't be edited here yet");

  @override
  Future<Map<String, dynamic>> getMetadataEditor(String itemId) async =>
      _noEditor();

  @override
  Future<void> updateItem(String itemId, Map<String, dynamic> itemData) async =>
      _noEditor();

  @override
  Future<void> updateContentType(String itemId, String contentType) async =>
      _noEditor();

  /// A full refresh asks the agents again for everything, not just what's
  /// missing.
  @override
  Future<void> refreshItem(
    String itemId, {
    bool? recursive,
    bool? replaceAllMetadata,
    bool? replaceAllImages,
    bool? regenerateTrickplay,
    MetadataRefreshMode metadataRefreshMode =
        MetadataRefreshMode.defaultRefresh,
    MetadataRefreshMode imageRefreshMode = MetadataRefreshMode.defaultRefresh,
  }) => _dio.put<dynamic>(
    '/library/metadata/$itemId/refresh',
    queryParameters: {
      if (replaceAllMetadata == true ||
          metadataRefreshMode == MetadataRefreshMode.fullRefresh)
        'force': 1,
    },
  );

  /// Plex matches by its own guid, so there are no provider ids to type in.
  @override
  Future<List<Map<String, dynamic>>> getExternalIdInfos(String itemId) async =>
      const [];

  @override
  Future<List<Map<String, dynamic>>> searchRemote(
    String searchType,
    Map<String, dynamic> query,
  ) async {
    final info = query['SearchInfo'] as Map? ?? const {};
    final container = await plexContainer(
      _dio,
      '/library/metadata/${query['ItemId']}/matches',
      {'manual': 1, 'title': ?info['Name'], 'year': ?info['Year']},
    );
    return [
      for (final match in container['SearchResult'] as List? ?? const [])
        if (match is Map && match['guid'] is String)
          {
            'Name': ?match['name'],
            'ProductionYear': ?match['year'],
            'Overview': ?match['summary'],
            'ImageUrl': ?match['thumb'],
            'SearchProviderName': 'Plex',
            'PlexGuid': match['guid'],
          },
    ];
  }

  @override
  Future<List<Map<String, dynamic>>> searchRemotePerson(
    Map<String, dynamic> query,
  ) async => const [];

  /// Plex always brings the match's artwork along.
  @override
  Future<String?> applyRemoteSearchResult(
    String itemId,
    Map<String, dynamic> result, {
    bool replaceAllImages = true,
  }) async {
    await _dio.put<dynamic>(
      '/library/metadata/$itemId/match',
      queryParameters: {
        'guid': result['PlexGuid'],
        'name': ?result['Name'],
        'year': ?result['ProductionYear'],
      },
    );
    return null;
  }

  /// Every choice Plex has for one kind of artwork, the one in use included.
  /// The choice's own key is what picking it sends back.
  @override
  Future<Map<String, dynamic>> getRemoteImages(
    String itemId, {
    required ImageType imageType,
    int? startIndex,
    int? limit,
    String? providerName,
    bool? includeAllLanguages,
  }) async {
    final artwork = _artwork[imageType];
    if (artwork == null) return {'Images': const [], 'TotalRecordCount': 0};
    final container = await plexContainer(
      _dio,
      '/library/metadata/$itemId/${artwork.list}',
    );
    final images = [
      for (final image in container['Metadata'] as List? ?? const [])
        if (image is Map && image['ratingKey'] is String)
          {
            'Url': image['ratingKey'],
            'ThumbnailUrl': _images.getPrimaryImageUrl(
              itemId,
              maxWidth: 300,
              tag: image['thumb'] as String?,
            ),
            'ProviderName': ?image['provider'],
            'Type': imageType.name,
          },
    ];
    return {'Images': images, 'TotalRecordCount': images.length};
  }

  @override
  Future<void> downloadRemoteImage(
    String itemId, {
    required ImageType imageType,
    required String imageUrl,
  }) => _dio.put<dynamic>(
    '/library/metadata/$itemId/${_artworkOf(imageType).pick}',
    queryParameters: {'url': imageUrl},
  );

  @override
  Future<void> uploadItemImage(
    String itemId, {
    required ImageType imageType,
    required List<int> bytes,
    required String contentType,
  }) => _dio.post<dynamic>(
    '/library/metadata/$itemId/${_artworkOf(imageType).list}',
    data: Stream.value(bytes),
    options: Options(
      contentType: contentType,
      headers: {Headers.contentLengthHeader: bytes.length},
    ),
  );

  @override
  Future<void> deleteItemImage(
    String itemId, {
    required ImageType imageType,
    int? imageIndex,
  }) async =>
      throw UnsupportedError("Plex can't delete artwork, only pick another");

  static ({String list, String pick}) _artworkOf(ImageType type) =>
      _artwork[type] ??
      (throw UnsupportedError("Plex doesn't keep ${type.name} artwork"));
}
