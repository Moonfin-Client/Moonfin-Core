import 'package:server_core/server_core.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../widgets/seerr/seerr_image_urls.dart';

/// The poster or primary image for [item], with the TMDB fallbacks a
/// Seerr-only item needs.
String? spotlightItemImageUrl(ImageApi imageApi, AggregatedItem item) {
  final isLibraryItem =
      item.serverId != 'seerr' && !item.id.startsWith('tmdb:');
  final tag = item.primaryImageTag ?? item.primaryImageTagField;
  if (isLibraryItem && tag != null) {
    return imageApi.getPrimaryImageUrl(item.id, maxHeight: 360, tag: tag);
  }
  final seerrArt =
      spotlightSeerrPosterUrl(item.rawData['PosterPath'] as String?) ??
      spotlightPersonImageUrl(
        imageApi,
        profilePath: item.rawData['ProfilePath'] as String?,
        maxHeight: 360,
        tmdbProfileBase: seerrProfileLargeBase,
      );
  if (seerrArt != null) return seerrArt;
  // A collection built from an ancestor record can arrive without its image
  // tag while the server still holds a primary image for it. Only box sets
  // get the tagless request: any folder with children would qualify
  // otherwise, and one with no image at all would fetch a 404 in place of
  // its placeholder.
  if (isLibraryItem && item.type == 'BoxSet') {
    return imageApi.getPrimaryImageUrl(item.id, maxHeight: 360);
  }
  return null;
}

/// A person's portrait: the server image when [id] and [tag] name a library
/// person, else the TMDB profile at [tmdbProfileBase], else null.
String? spotlightPersonImageUrl(
  ImageApi imageApi, {
  String? id,
  String? tag,
  String? profilePath,
  required int maxHeight,
  String tmdbProfileBase = seerrProfileBase,
}) {
  if (id != null && tag != null && !id.startsWith('tmdb:')) {
    return imageApi.getPrimaryImageUrl(id, maxHeight: maxHeight, tag: tag);
  }
  if (profilePath != null && profilePath.isNotEmpty) {
    return '$tmdbProfileBase$profilePath';
  }
  return null;
}

/// A landscape thumbnail or backdrop for [item], prioritizing 16:9 artwork
/// (Thumb, then Backdrop) over posters.
String? spotlightLandscapeImageUrl(
  ImageApi imageApi,
  AggregatedItem item, {
  int maxWidth = 640,
  String? fallbackUrl,
}) {
  final thumbTag = item.thumbImageTag;
  if (thumbTag != null && !item.id.startsWith('tmdb:')) {
    return imageApi.getThumbImageUrl(item.id, maxWidth: maxWidth, tag: thumbTag);
  }
  if (item.backdropImageTags.isNotEmpty && !item.id.startsWith('tmdb:')) {
    return imageApi.getBackdropImageUrl(
      item.id,
      maxWidth: maxWidth,
      tag: item.backdropImageTags.first,
    );
  }
  final parentBackdropId = item.parentBackdropItemId;
  if (parentBackdropId != null &&
      item.parentBackdropImageTags.isNotEmpty &&
      !parentBackdropId.startsWith('tmdb:')) {
    return imageApi.getBackdropImageUrl(
      parentBackdropId,
      maxWidth: maxWidth,
      tag: item.parentBackdropImageTags.first,
    );
  }
  final seerrBackdrop =
      spotlightSeerrBackdropUrl(item.rawData['BackdropPath'] as String?);
  if (seerrBackdrop != null) return seerrBackdrop;

  return fallbackUrl;
}

/// A Seerr poster path as a TMDB URL, or null when Seerr sent none.
String? spotlightSeerrPosterUrl(String? posterPath) =>
    posterPath == null || posterPath.isEmpty
    ? null
    : '$seerrPosterBase$posterPath';

/// A Seerr backdrop path as a TMDB URL, or null when Seerr sent none.
String? spotlightSeerrBackdropUrl(String? backdropPath) =>
    backdropPath == null || backdropPath.isEmpty
    ? null
    : '$seerrBackdropBase$backdropPath';
