import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';

/// The thumb endpoint only takes a width, so a card that reserves its space by
/// height asks for the 16:9 width that fills it.
int landscapeWidthFor(int height) => (height * 16 / 9).round();

/// The parent series artwork, for standing in where an episode still or a
/// chapter frame would give something away. Null when the series offers nothing
/// to show, which leaves the caller on the picture it would have used.
///
/// Often the only picture a special has, since episodes outside a numbered
/// season carry no still of their own while still naming their parent.
String? resolveSeriesLandscapeThumbnailUrl(
  AggregatedItem item,
  ImageApi imageApi, {
  required int maxWidth,
}) {
  final thumbId = item.parentThumbItemId ?? item.seriesId;
  final thumbTag = item.parentThumbImageTag ?? item.seriesThumbImageTag;
  if (thumbId != null &&
      thumbId.isNotEmpty &&
      thumbTag != null &&
      thumbTag.isNotEmpty) {
    return imageApi.getThumbImageUrl(
      thumbId,
      maxWidth: maxWidth,
      tag: thumbTag,
    );
  }

  final seriesId = item.seriesId ?? item.parentPrimaryImageItemId;
  final seriesPrimaryTag =
      item.seriesPrimaryImageTag ?? item.parentPrimaryImageTag;
  if (seriesId != null &&
      seriesId.isNotEmpty &&
      seriesPrimaryTag != null &&
      seriesPrimaryTag.isNotEmpty) {
    return imageApi.getPrimaryImageUrl(
      seriesId,
      maxWidth: maxWidth,
      tag: seriesPrimaryTag,
    );
  }

  return null;
}
