import 'package:server_core/server_core.dart';

import 'offline_catalog.dart';

/// Resolves image "URLs" to downloaded local file paths when available,
/// falling back to the network URL builder (whose result may still be served
/// from the image disk cache, or fail into the widget's placeholder).
class OfflineImageApi implements ImageApi {
  final OfflineCatalog _catalog;
  final ImageApi _network;

  OfflineImageApi(this._catalog, this._network);

  OfflineEntry? _entry(String itemId) => _catalog.byId(itemId);

  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) {
    final entry = _entry(itemId);
    final own = entry?.row.posterPath;
    if (own != null && own.isNotEmpty) return own;
    // Episodes and tracks fall back to their series/album poster.
    final parentId =
        entry?.row.seriesId ??
        entry?.metadata['AlbumId']?.toString() ??
        entry?.metadata['SeasonId']?.toString();
    if (parentId != null) {
      final parent = _entry(parentId)?.row.posterPath;
      if (parent != null && parent.isNotEmpty) return parent;
    }
    return _network.getPrimaryImageUrl(
      itemId,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      tag: tag,
    );
  }

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) {
    final entry = _entry(itemId);
    final backdrop = entry?.row.backdropPath;
    if (backdrop != null && backdrop.isNotEmpty) return backdrop;
    final seriesId = entry?.row.seriesId;
    if (seriesId != null) {
      final parent = _entry(seriesId)?.row.backdropPath;
      if (parent != null && parent.isNotEmpty) return parent;
    }
    final poster = entry?.row.posterPath;
    if (poster != null && poster.isNotEmpty) return poster;
    return _network.getBackdropImageUrl(
      itemId,
      maxWidth: maxWidth,
      index: index,
      tag: tag,
    );
  }

  @override
  String getLogoImageUrl(String itemId, {int? maxWidth, String? tag}) {
    final entry = _entry(itemId);
    final logo = entry?.row.logoPath;
    if (logo != null && logo.isNotEmpty) return logo;
    final seriesId = entry?.row.seriesId;
    if (seriesId != null) {
      final parent = _entry(seriesId)?.row.logoPath;
      if (parent != null && parent.isNotEmpty) return parent;
    }
    return _network.getLogoImageUrl(itemId, maxWidth: maxWidth, tag: tag);
  }

  @override
  String getBannerImageUrl(String itemId, {int? maxWidth, String? tag}) {
    return _network.getBannerImageUrl(itemId, maxWidth: maxWidth, tag: tag);
  }

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) {
    final entry = _entry(itemId);
    final thumb = entry?.row.thumbPath;
    if (thumb != null && thumb.isNotEmpty) return thumb;
    final backdrop = entry?.row.backdropPath;
    if (backdrop != null && backdrop.isNotEmpty) return backdrop;
    final seriesId = entry?.row.seriesId;
    if (seriesId != null) {
      final parentRow = _entry(seriesId)?.row;
      final parent = parentRow?.thumbPath ?? parentRow?.backdropPath;
      if (parent != null && parent.isNotEmpty) return parent;
    }
    return _network.getThumbImageUrl(itemId, maxWidth: maxWidth, tag: tag);
  }

  @override
  String getChapterImageUrl(
    String itemId, {
    required int index,
    int? maxWidth,
    String? tag,
  }) {
    return _network.getChapterImageUrl(
      itemId,
      index: index,
      maxWidth: maxWidth,
      tag: tag,
    );
  }

  @override
  String getUserImageUrl(String userId) => _network.getUserImageUrl(userId);

  @override
  String getTrickplayTileImageUrl(
    String itemId, {
    required int width,
    required int index,
    String? mediaSourceId,
  }) {
    return _network.getTrickplayTileImageUrl(
      itemId,
      width: width,
      index: index,
      mediaSourceId: mediaSourceId,
    );
  }
}
