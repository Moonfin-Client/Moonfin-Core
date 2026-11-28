import 'package:server_core/server_core.dart' show ImageApi;

/// Pick a video's Now Playing artwork, skipping logos: its own image, thumb,
/// backdrop, then the series' thumb, backdrop and poster, in that order.
/// Without [maxWidth], size thumbs and backdrops 16:9 from [maxHeight].
String? nowPlayingArtworkUrl(
  ImageApi imageApi,
  Map<String, dynamic> raw, {
  String? itemId,
  int? maxWidth,
  int? maxHeight,
}) {
  String? text(Object? value) {
    final s = value?.toString().trim();
    return (s == null || s.isEmpty) ? null : s;
  }

  String? firstTag(Object? tags) =>
      tags is List && tags.isNotEmpty ? text(tags.first) : null;

  final wideWidth =
      maxWidth ?? (maxHeight != null ? (maxHeight * 16 / 9).round() : 800);
  final id = text(itemId) ?? text(raw['Id']) ?? text(raw['id']);
  final imageTags = raw['ImageTags'];
  final tags = imageTags is Map ? imageTags : const {};

  if (id != null) {
    if (text(tags['Primary']) case final tag?) {
      return imageApi.getPrimaryImageUrl(
        id,
        maxWidth: maxHeight == null ? wideWidth : null,
        maxHeight: maxHeight,
        tag: tag,
      );
    }
    if (text(tags['Thumb']) case final tag?) {
      return imageApi.getThumbImageUrl(id, maxWidth: wideWidth, tag: tag);
    }
    if (firstTag(raw['BackdropImageTags']) case final tag?) {
      return imageApi.getBackdropImageUrl(id, maxWidth: wideWidth, tag: tag);
    }
  }

  if ((text(raw['ParentThumbItemId']), text(raw['ParentThumbImageTag']))
      case (final parent?, final tag?)) {
    return imageApi.getThumbImageUrl(parent, maxWidth: wideWidth, tag: tag);
  }
  if ((
    text(raw['ParentBackdropItemId']),
    firstTag(raw['ParentBackdropImageTags']),
  ) case (final parent?, final tag?)) {
    return imageApi.getBackdropImageUrl(parent, maxWidth: wideWidth, tag: tag);
  }
  if ((text(raw['SeriesId']), text(raw['SeriesPrimaryImageTag']))
      case (final series?, final tag?)) {
    return imageApi.getPrimaryImageUrl(
      series,
      maxWidth: maxHeight == null ? wideWidth : null,
      maxHeight: maxHeight,
      tag: tag,
    );
  }
  return null;
}
