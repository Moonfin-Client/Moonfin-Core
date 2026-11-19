import 'package:server_core/server_core.dart';

class JellyfinImageApi implements ImageApi {
  /// Read on every call, so image URLs follow a client moved to a new
  /// address without it being recreated.
  final String Function() _baseUrlOf;
  String get _baseUrl => _baseUrlOf();

  JellyfinImageApi(this._baseUrlOf);

  /// Left out, the server encodes artwork at quality 100, three times the
  /// bytes of 90 for no difference at the sizes the app paints.
  static const _artworkQuality = '90';

  String _buildQuery(Map<String, String> params) {
    if (params.isEmpty) return '';
    return '?${params.entries.map((e) => '${e.key}=${e.value}').join('&')}';
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
      'quality': _artworkQuality,
      'tag': ?tag,
    });
    return '$_baseUrl/Items/$itemId/Images/Primary$query';
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
      'quality': _artworkQuality,
      'tag': ?tag,
    });
    return '$_baseUrl/Items/$itemId/Images/Backdrop/$idx$query';
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
    return '$_baseUrl/Items/$itemId/Images/Logo$query';
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
    return '$_baseUrl/Items/$itemId/Images/Banner$query';
  }

  @override
  String getThumbImageUrl(
    String itemId, {
    int? maxWidth,
    String? tag,
  }) {
    final query = _buildQuery({
      if (maxWidth != null) 'maxWidth': maxWidth.toString(),
      'quality': _artworkQuality,
      'tag': ?tag,
    });
    return '$_baseUrl/Items/$itemId/Images/Thumb$query';
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
    return '$_baseUrl/Items/$itemId/Images/Chapter/$index$query';
  }

  @override
  String getUserImageUrl(String userId) {
    return '$_baseUrl/Users/$userId/Images/Primary';
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
    return '$_baseUrl/Videos/$itemId/Trickplay/$width/$index.jpg$query';
  }
}
