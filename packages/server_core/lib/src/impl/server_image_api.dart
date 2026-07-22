import '../api/image_api.dart';
import '../server_dialect.dart';

class ServerImageApi implements ImageApi {
  final String Function() _getBaseUrl;
  final String? Function() _getApiKey;
  final ServerDialect _dialect;

  ServerImageApi(this._getBaseUrl, this._getApiKey, this._dialect);

  String _buildQuery(Map<String, String> params) {
    if (_dialect.includeApiKeyInImageUrls) {
      final apiKey = _getApiKey();
      if (apiKey != null) params['api_key'] = apiKey;
    }
    if (params.isEmpty) return '';
    return '?${params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')}';
  }

  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) {
    final query = _buildQuery({
      if (maxWidth != null) 'maxWidth': maxWidth.toString(),
      if (maxHeight != null) 'maxHeight': maxHeight.toString(),
      'tag': ?tag,
    });
    return '${_getBaseUrl()}/Items/$itemId/Images/Primary$query';
  }

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) {
    final idx = index ?? 0;
    final query = _buildQuery({
      if (maxWidth != null) 'maxWidth': maxWidth.toString(),
      'tag': ?tag,
    });
    return '${_getBaseUrl()}/Items/$itemId/Images/Backdrop/$idx$query';
  }

  @override
  String getLogoImageUrl(
    String itemId, {
    int? maxWidth,
    String? tag,
  }) {
    final query = _buildQuery({
      if (maxWidth != null) 'maxWidth': maxWidth.toString(),
      'tag': ?tag,
    });
    return '${_getBaseUrl()}/Items/$itemId/Images/Logo$query';
  }

  @override
  String getBannerImageUrl(
    String itemId, {
    int? maxWidth,
    String? tag,
  }) {
    final query = _buildQuery({
      if (maxWidth != null) 'maxWidth': maxWidth.toString(),
      'tag': ?tag,
    });
    return '${_getBaseUrl()}/Items/$itemId/Images/Banner$query';
  }

  @override
  String getThumbImageUrl(
    String itemId, {
    int? maxWidth,
    String? tag,
  }) {
    final query = _buildQuery({
      if (maxWidth != null) 'maxWidth': maxWidth.toString(),
      'tag': ?tag,
    });
    return '${_getBaseUrl()}/Items/$itemId/Images/Thumb$query';
  }

  @override
  String getChapterImageUrl(
    String itemId, {
    required int index,
    int? maxWidth,
    String? tag,
  }) {
    final query = _buildQuery({
      if (maxWidth != null) 'maxWidth': maxWidth.toString(),
      'tag': ?tag,
    });
    return '${_getBaseUrl()}/Items/$itemId/Images/Chapter/$index$query';
  }

  @override
  String getUserImageUrl(String userId) {
    final query = _buildQuery({});
    return '${_getBaseUrl()}/Users/$userId/Images/Primary$query';
  }

  @override
  String getTrickplayTileImageUrl(
    String itemId, {
    required int width,
    required int index,
    String? mediaSourceId,
  }) {
    final query = _buildQuery({
      'mediaSourceId': ?mediaSourceId,
    });
    return '${_getBaseUrl()}/Videos/$itemId/Trickplay/$width/$index.jpg$query';
  }
}
