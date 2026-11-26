import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/aggregated_library.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../util/artwork_request_size.dart';
import '../offline_aware_image.dart';

ImageApi? _imageApi(String serverId) {
  try {
    return GetIt.instance<MediaServerClientFactory>()
        .clientForServerOrActive(serverId)
        .imageApi;
  } catch (_) {
    return null;
  }
}

/// Wide art for an item: its thumb, an episode's own still, its parent's
/// thumb, then its own or its parent's backdrop, and last its poster.
String? navWideArtUrl(AggregatedItem item, {int maxWidth = 480}) {
  final api = _imageApi(item.serverId);
  if (api == null) return null;
  if (item.thumbImageTag case final tag?) {
    return api.getThumbImageUrl(item.id, maxWidth: maxWidth, tag: tag);
  }
  if (item.type == 'Episode' && item.primaryImageTag != null) {
    return api.getPrimaryImageUrl(
      item.id,
      maxWidth: maxWidth,
      tag: item.primaryImageTag,
    );
  }
  final parentThumbId = item.parentThumbItemId;
  final parentThumbTag = item.parentThumbImageTag;
  if (parentThumbId != null && parentThumbTag != null) {
    return api.getThumbImageUrl(
      parentThumbId,
      maxWidth: maxWidth,
      tag: parentThumbTag,
    );
  }
  if (item.backdropImageTags.firstOrNull case final tag?) {
    return api.getBackdropImageUrl(item.id, maxWidth: maxWidth, tag: tag);
  }
  final parentBackdropId = item.parentBackdropItemId;
  if (parentBackdropId != null) {
    if (item.parentBackdropImageTags.firstOrNull case final tag?) {
      return api.getBackdropImageUrl(
        parentBackdropId,
        maxWidth: maxWidth,
        tag: tag,
      );
    }
  }
  return navPosterArtUrl(item, maxWidth: maxWidth);
}

/// Poster art for an item, falling back to its series or album poster.
String? navPosterArtUrl(AggregatedItem item, {int maxWidth = 300}) {
  final api = _imageApi(item.serverId);
  if (api == null) return null;
  if (item.primaryImageTag case final tag?) {
    return api.getPrimaryImageUrl(item.id, maxWidth: maxWidth, tag: tag);
  }
  final seriesId = item.seriesId;
  final seriesTag = item.seriesPrimaryImageTag;
  if (seriesId != null && seriesTag != null) {
    return api.getPrimaryImageUrl(seriesId, maxWidth: maxWidth, tag: seriesTag);
  }
  final albumId = item.albumId;
  final albumTag = item.albumPrimaryImageTag;
  if (albumId != null && albumTag != null) {
    return api.getPrimaryImageUrl(albumId, maxWidth: maxWidth, tag: albumTag);
  }
  return null;
}

/// A library's own cover, or the cover of the library a merged one borrows
/// its artwork from.
String? _libraryCoverUrl(AggregatedLibrary lib, {required int maxWidth}) {
  final api = _imageApi(lib.serverId);
  if (api == null) return null;
  final tag = lib.imageTags?['Primary'] as String?;
  if (tag == null) return null;
  return api.getPrimaryImageUrl(
    lib.imageItemId ?? lib.id,
    maxWidth: maxWidth,
    tag: tag,
  );
}

/// The widths a 16:9 library cover filling [box] is asked for and decoded
/// at, in the screen's real pixels.
({int request, int decode}) navLibraryCoverSize(
  Size box,
  double devicePixelRatio,
) {
  final pixels = math.max(box.width, box.height * 16 / 9) * devicePixelRatio;
  return (
    request: artworkRequestWidth(pixels, 1, ArtworkShape.landscape),
    decode: ArtworkDecode.stepUp(pixels.ceil()),
  );
}

/// A library's cover filling its box. Covers carry the library's name as
/// text, which the 2x cap on artwork visibly blurs on denser screens.
class NavLibraryCover extends StatelessWidget {
  const NavLibraryCover({
    super.key,
    required this.library,
    required this.fallback,
  });

  final AggregatedLibrary library;

  /// Shown when the library has no cover or it fails to load.
  final Widget fallback;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) {
      final size = navLibraryCoverSize(
        box.biggest,
        MediaQuery.devicePixelRatioOf(context),
      );
      final url = _libraryCoverUrl(library, maxWidth: size.request);
      if (url == null) return fallback;
      return OfflineAwareImage(
        imageUrl: url,
        fit: BoxFit.cover,
        memCacheWidth: size.decode,
        errorWidget: (_, _, _) => fallback,
      );
    },
  );
}
