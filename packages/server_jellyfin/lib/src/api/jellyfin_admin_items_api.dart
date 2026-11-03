import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinAdminItemsApi implements AdminItemsApi {
  final Dio _dio;

  JellyfinAdminItemsApi(this._dio);

  @override
  Future<void> updateItem(String itemId, Map<String, dynamic> itemData) async {
    await _dio.post('/Items/$itemId', data: itemData);
  }

  @override
  Future<Map<String, dynamic>> getMetadataEditor(String itemId) async {
    final response = await _dio.get('/Items/$itemId/MetadataEditor');
    final data = response.data;
    return data is Map<String, dynamic> ? data : const {};
  }

  /// An empty [contentType] removes the override, which is how the server
  /// offers "Inherit".
  @override
  Future<void> updateContentType(String itemId, String contentType) async {
    await _dio.post(
      '/Items/$itemId/ContentType',
      queryParameters: {'ContentType': contentType},
    );
  }

  /// The server has no Recursive parameter, so sending it changes nothing.
  @override
  Future<void> refreshItem(
    String itemId, {
    bool? recursive,
    bool? replaceAllMetadata,
    bool? replaceAllImages,
    bool? regenerateTrickplay,
    MetadataRefreshMode metadataRefreshMode = MetadataRefreshMode.defaultRefresh,
    MetadataRefreshMode imageRefreshMode = MetadataRefreshMode.defaultRefresh,
  }) async {
    await _dio.post(
      '/Items/$itemId/Refresh',
      queryParameters: {
        'Recursive': ?recursive,
        'MetadataRefreshMode': metadataRefreshMode.toServerString(),
        'ImageRefreshMode': imageRefreshMode.toServerString(),
        'ReplaceAllMetadata': ?replaceAllMetadata,
        'ReplaceAllImages': ?replaceAllImages,
        'RegenerateTrickplay': ?regenerateTrickplay,
      },
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getExternalIdInfos(String itemId) async {
    final response = await _dio.get('/Items/$itemId/ExternalIdInfos');
    return _asList(response.data);
  }

  /// The server has a search route per type it can identify (Movie, Trailer,
  /// MusicVideo, Series, BoxSet, MusicArtist, MusicAlbum, Person, Book).
  @override
  Future<List<Map<String, dynamic>>> searchRemote(
    String searchType,
    Map<String, dynamic> query,
  ) async {
    final normalized = switch (searchType.toLowerCase()) {
      'movie' => 'Movie',
      'trailer' => 'Trailer',
      'musicvideo' => 'MusicVideo',
      'series' => 'Series',
      'boxset' => 'BoxSet',
      'person' => 'Person',
      'musicalbum' => 'MusicAlbum',
      'musicartist' => 'MusicArtist',
      'book' => 'Book',
      _ => searchType,
    };
    final response =
        await _dio.post('/Items/RemoteSearch/$normalized', data: query);
    return _asList(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> searchRemotePerson(
    Map<String, dynamic> query,
  ) =>
      searchRemote('Person', query);

  @override
  Future<String?> applyRemoteSearchResult(
    String itemId,
    Map<String, dynamic> result, {
    bool replaceAllImages = true,
  }) async {
    await _dio.post(
      '/Items/RemoteSearch/Apply/$itemId',
      queryParameters: {'replaceAllImages': replaceAllImages},
      data: result,
    );
    return null;
  }

  @override
  Future<Map<String, dynamic>> getRemoteImages(
    String itemId, {
    required ImageType imageType,
    int? startIndex,
    int? limit,
    String? providerName,
    bool? includeAllLanguages,
  }) async {
    final response = await _dio.get(
      '/Items/$itemId/RemoteImages',
      queryParameters: {
        'Type': imageType.toServerString(),
        'StartIndex': ?startIndex,
        'Limit': ?limit,
        if (providerName != null && providerName.isNotEmpty)
          'ProviderName': providerName,
        'IncludeAllLanguages': ?includeAllLanguages,
      },
    );
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      return const {
        'Images': <Map<String, dynamic>>[],
        'Providers': <String>[],
        'TotalRecordCount': 0,
      };
    }
    return {
      'Images': _asList(data['Images']),
      'Providers': (data['Providers'] is List)
          ? (data['Providers'] as List)
              .map((entry) => entry.toString())
              .where((entry) => entry.isNotEmpty)
              .toList()
          : const <String>[],
      'TotalRecordCount': data['TotalRecordCount'] ?? 0,
    };
  }

  @override
  Future<void> downloadRemoteImage(
    String itemId, {
    required ImageType imageType,
    required String imageUrl,
  }) async {
    await _dio.post(
      '/Items/$itemId/RemoteImages/Download',
      queryParameters: {
        'Type': imageType.toServerString(),
        'ImageUrl': imageUrl,
      },
    );
  }

  @override
  Future<void> uploadItemImage(
    String itemId, {
    required ImageType imageType,
    required List<int> bytes,
    required String contentType,
  }) async {
    await _dio.post(
      '/Items/$itemId/Images/${imageType.toServerString()}',
      data: base64Encode(bytes),
      options: Options(contentType: contentType),
    );
  }

  @override
  Future<void> deleteItemImage(
    String itemId, {
    required ImageType imageType,
    int? imageIndex,
  }) async {
    await _dio.delete(
      '/Items/$itemId/Images/${imageType.toServerString()}',
      queryParameters: {
        'ImageIndex': ?imageIndex,
      },
    );
  }

  List<Map<String, dynamic>> _asList(dynamic data) {
    if (data is List) {
      return data.whereType<Map>().map((e) => e.cast<String, dynamic>()).toList();
    }
    if (data is Map<String, dynamic>) {
      final items =
          data['Items'] ?? data['items'] ?? data['Results'] ?? data['results'];
      if (items is List) {
        return items
            .whereType<Map>()
            .map((e) => e.cast<String, dynamic>())
            .toList();
      }
    }
    return const [];
  }
}
