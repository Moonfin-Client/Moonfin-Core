import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbyTrickplayApi implements TrickplayApi {
  final Dio _dio;
  final String Function() _getBaseUrl;
  final String? Function() _getApiKey;

  EmbyTrickplayApi(this._dio, this._getBaseUrl, this._getApiKey);

  String _buildQuery(Map<String, String> params) {
    final apiKey = _getApiKey();
    if (apiKey != null) params['api_key'] = apiKey;
    return params.isEmpty
        ? ''
        : '?${params.entries.map((entry) => '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}').join('&')}';
  }

  @override
  Future<TrickplayThumbnailSet?> getThumbnailSet(
    String itemId, {
    required int width,
    String? mediaSourceId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/Items/$itemId/ThumbnailSet',
        queryParameters: {
          'Width': width,
          if (mediaSourceId != null && mediaSourceId.isNotEmpty)
            'MediaSourceId': mediaSourceId,
        },
      );
      final data = response.data;
      return data == null ? null : TrickplayThumbnailSet.fromJson(data);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  String getFrameImageUrl(
    String itemId, {
    required int width,
    required int positionTicks,
    required String imageTag,
    String? mediaSourceId,
  }) {
    final query = _buildQuery({
      'maxWidth': width.toString(),
      'tag': imageTag,
      'PositionTicks': positionTicks.toString(),
      if (mediaSourceId != null && mediaSourceId.isNotEmpty)
        'MediaSourceId': mediaSourceId,
      'quality': '90',
    });
    return '${_getBaseUrl()}/Items/$itemId/Images/Thumbnail$query';
  }
}
