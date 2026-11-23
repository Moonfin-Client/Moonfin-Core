import 'package:server_core/server_core.dart';

/// IPTV images are absolute provider URLs carried through `ImageTags`.
/// A tag that starts with `http` is returned verbatim, anything else has no
/// image.
class IptvImageApi implements ImageApi {
  String _fromTag(String? tag) {
    if (tag != null &&
        (tag.startsWith('http://') || tag.startsWith('https://'))) {
      return tag;
    }
    return '';
  }

  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => _fromTag(tag);

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => _fromTag(tag);

  @override
  String getLogoImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      _fromTag(tag);

  @override
  String getBannerImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      _fromTag(tag);

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      _fromTag(tag);

  @override
  String getChapterImageUrl(
    String itemId, {
    required int index,
    int? maxWidth,
    String? tag,
  }) => '';

  @override
  String getUserImageUrl(String userId) => '';

  @override
  String getTrickplayTileImageUrl(
    String itemId, {
    required int width,
    required int index,
    String? mediaSourceId,
  }) => '';
}
