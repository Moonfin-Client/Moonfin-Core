import 'dart:math' as math;

import 'package:server_core/server_core.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
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

/// A backdrop a person's page could use, taken from their filmography.
class PersonBackdropCandidate {
  /// What marks this backdrop as already taken, in the form `local:id:tag` or
  /// `tmdb:path`.
  final String key;

  /// The wide copy the full screen hero draws.
  final String fullUrl;

  /// The narrower copy a summary card draws.
  final String cardUrl;

  const PersonBackdropCandidate({
    required this.key,
    required this.fullUrl,
    required this.cardUrl,
  });
}

/// The backdrops a person's library filmography can offer.
List<PersonBackdropCandidate> collectPersonLocalBackdrops(
  ItemDetailViewModel vm,
) {
  final results = <PersonBackdropCandidate>[];
  final seen = <String>{};
  // filmographyMovies and filmographySeries are filters over this same list.
  for (final item in vm.filmography) {
    if (item.backdropImageTags.isEmpty) continue;
    final tag = item.backdropImageTags.first;
    final key = 'local:${item.id}:$tag';
    if (!seen.add(key)) continue;
    results.add(
      PersonBackdropCandidate(
        key: key,
        fullUrl: vm.imageApi.getBackdropImageUrl(
          item.id,
          tag: tag,
          maxWidth: 1920,
        ),
        cardUrl: vm.imageApi.getBackdropImageUrl(
          item.id,
          tag: tag,
          maxWidth: 960,
        ),
      ),
    );
  }
  return results;
}

/// The backdrops a person's Seerr credits can offer.
List<PersonBackdropCandidate> collectPersonSeerrBackdrops(
  List<SeerrDiscoverItem> items,
) {
  final results = <PersonBackdropCandidate>[];
  final seen = <String>{};

  for (final item in items) {
    final path = item.backdropPath;
    if (path != null && path.isNotEmpty) {
      final key = 'tmdb:$path';
      if (seen.add(key)) {
        final url = spotlightSeerrBackdropUrl(path);
        if (url != null) {
          results.add(
            PersonBackdropCandidate(
              key: key,
              fullUrl: url,
              cardUrl: url,
            ),
          );
        }
      }
    }
  }
  return results;
}

/// A backdrop for one card, taken from [preferred] where it can be and from
/// [all] otherwise, and marked in [usedKeys] so the next card picks another.
///
/// Once every candidate is spoken for it repeats one rather than leaving the
/// card bare, which is why a person with a single backdrop still gets cards.
String? randomPickBackdrop({
  required List<PersonBackdropCandidate> preferred,
  required List<PersonBackdropCandidate> all,
  required Set<String> usedKeys,
  math.Random? random,
}) {
  final rng = random ?? math.Random();
  for (final pool in [preferred, all]) {
    final free = pool.where((c) => !usedKeys.contains(c.key)).toList();
    if (free.isEmpty) continue;
    final chosen = free[rng.nextInt(free.length)];
    usedKeys.add(chosen.key);
    return chosen.cardUrl;
  }
  for (final pool in [preferred, all]) {
    if (pool.isNotEmpty) return pool[rng.nextInt(pool.length)].cardUrl;
  }
  return null;
}

/// The backdrop for each of a person's cards, keyed by card id, with
/// [mainBackdropKey] held back so the hero keeps a picture of its own.
Map<String, String?> personCardBackdropsFor({
  required List<PersonBackdropCandidate> local,
  required List<PersonBackdropCandidate> appearances,
  required List<PersonBackdropCandidate> crew,
  String? mainBackdropKey,
  math.Random? random,
}) {
  final all = [...local, ...appearances, ...crew];
  final usedKeys = <String>{?mainBackdropKey};
  String? pick(List<PersonBackdropCandidate> preferred) => randomPickBackdrop(
    preferred: preferred,
    all: all,
    usedKeys: usedKeys,
    random: random,
  );
  return {
    'filmography': pick(local),
    'appearances': pick(appearances),
    'crew': pick(crew),
  };
}
