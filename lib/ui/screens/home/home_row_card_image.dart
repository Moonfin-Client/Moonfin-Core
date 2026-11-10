import 'package:server_core/server_core.dart' show ImageApi;

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/repositories/tmdb_repository.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/artwork_request_size.dart';
import '../../../util/platform_detection.dart';
import '../../../util/tmdb_thumb.dart';
import '../../navigation/destinations.dart';
import '../../widgets/modern_row.dart';
import 'home_view_model.dart';

/// The artwork a home row card paints and the size it paints it at.
typedef HomeRowCardImage = ({String? url, double width, double aspectRatio});

/// Looks up a card's artwork url. [resolveRowImageUrl] by default; the home
/// screen passes its cached lookup.
typedef HomeRowImageUrlResolver = String? Function(
  AggregatedItem item,
  ImageApi imageApi,
  double height,
  ImageType imageType,
  bool useSeriesThumbs,
  double requestScale, {
  bool isMyMediaRow,
});

/// How much the rows scale on this platform. TV draws them at 0.8 of the
/// desktop size.
double homeRowPlatformScale(double desktopScale) =>
    PlatformDetection.isTV ? 0.8 * desktopScale : desktopScale;

/// Seerr shortcut, genre, studio and network rows, which draw wide filter
/// cards.
bool isSeerrFilterRow(HomeRow row) =>
    row.id == 'seerr_shortcuts' ||
    row.id == 'seerr_movie_genres' ||
    row.id == 'seerr_series_genres' ||
    row.id == 'seerr_studios' ||
    row.id == 'seerr_networks';

/// Rows whose artwork is a wide logo rather than cover art. The modern style
/// draws every card portrait, which crops those, so these rows stay on the
/// classic layout whichever style is picked.
bool _isWideArtworkRow(HomeRow row) =>
    isSeerrFilterRow(row) ||
    row.id == 'mdblist_watching_now' ||
    (row.rowType == HomeRowType.studios && row.id == 'studios');

/// Whether [row] draws in the Modern style. Rows with wide logo artwork stay
/// Classic whichever style is picked.
bool isHomeRowModern(HomeRow row, UserPreferences prefs) {
  if (prefs.get(UserPreferences.homeRowsStyle) != HomeRowsStyle.v2) {
    return false;
  }
  if (_isWideArtworkRow(row)) {
    return false;
  }
  return true;
}

/// A My Media row in the Modern style whose cards stay static because Modern
/// cards are turned off for it.
bool isHomeRowModernMyMediaStatic(HomeRow row, UserPreferences prefs) {
  return isHomeRowModern(row, prefs) &&
      (row.rowType == HomeRowType.libraryTiles ||
          row.rowType == HomeRowType.libraryTilesSmall) &&
      !prefs.get(UserPreferences.modernCardsOnMyMediaRow);
}

/// A TMDB image at [width] for a stored Seerr path, which may already be a
/// full url.
String? seerrTmdbImageUrl(String? path, int width) {
  if (path == null || path.isEmpty) return null;
  if (path.startsWith('http')) return path;
  return 'https://image.tmdb.org/t/p/w$width$path';
}

/// [seerrThumbUrl] for a Seerr item. A numeric item id counts as its TMDB id.
String? seerrItemThumbUrl(AggregatedItem item) => seerrThumbUrl(
  type: item.seerrMediaType,
  tmdbId: item.tmdbId ?? (int.tryParse(item.id) != null ? item.id : null),
  imdbId: item.imdbId,
);

String? _resolveImageUrl(
  AggregatedItem item,
  ImageApi imageApi,
  double height,
  bool useSeriesThumbs,
  double requestScale,
) {
  final maxH = artworkRequestWidth(height, requestScale, ArtworkShape.poster);
  if (useSeriesThumbs && item.type == 'Episode') {
    final sId = item.seriesId ?? item.parentPrimaryImageItemId;
    final sTag = item.seriesPrimaryImageTag ?? item.parentPrimaryImageTag;
    if (sId != null) {
      return imageApi.getPrimaryImageUrl(sId, maxHeight: maxH, tag: sTag);
    }
  }
  return resolvePrimaryImageUrl(item, imageApi, maxHeight: maxH);
}

/// The Primary image of [item], falling back to its representative item and
/// then its parent. A genre without portrait artwork of its own takes the
/// representative item's first.
String? resolvePrimaryImageUrl(
  AggregatedItem item,
  ImageApi imageApi, {
  int? maxHeight,
  int? maxWidth,
}) {
  String? primary(String? id, String? tag) {
    if (id == null || tag == null) return null;
    return imageApi.getPrimaryImageUrl(
      id,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      tag: tag,
    );
  }

  if (item.type == 'Genre' || item.type == 'MusicGenre') {
    final primaryAr = item.rawData['PrimaryImageAspectRatio'] as num?;
    if (primaryAr == null || primaryAr >= 1.0) {
      final repUrl = primary(
        item.primaryImageItemId,
        item.primaryImageTagField,
      );
      if (repUrl != null) return repUrl;
    }
  }

  return primary(item.id, item.primaryImageTag) ??
      primary(item.primaryImageItemId, item.primaryImageTagField) ??
      primary(item.parentPrimaryImageItemId, item.parentPrimaryImageTag);
}

String? _resolveLandscapeImageUrl(
  AggregatedItem item,
  ImageApi imageApi,
  double height,
  double requestScale,
) {
  final maxW = artworkRequestWidth(
    height * 16 / 9,
    requestScale,
    ArtworkShape.landscape,
  );
  if (item.backdropImageTags.isNotEmpty) {
    return imageApi.getBackdropImageUrl(
      item.id,
      maxWidth: maxW,
      tag: item.backdropImageTags.first,
    );
  }
  if (item.type != 'Video' && item.type != 'MusicVideo') {
    final parentId = item.parentBackdropItemId;
    final parentTags = item.parentBackdropImageTags;
    if (parentId != null && parentTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        parentId,
        maxWidth: maxW,
        tag: parentTags.first,
      );
    }
  }
  return resolvePrimaryImageUrl(item, imageApi, maxWidth: maxW);
}

/// The image type a Classic card in [row] asks for: forced for audio, Seerr
/// and music rows, else the universal override or the row's section setting.
ImageType homeRowImageTypeForRow(HomeRow row, UserPreferences prefs) {
  if (row.isAudio) {
    return ImageType.poster;
  }
  if (isSeerrFilterRow(row)) {
    return ImageType.thumb;
  }
  if (row.rowType == HomeRowType.latestMedia && _isLatestMusicRow(row)) {
    return ImageType.poster;
  }

  if (prefs.get(UserPreferences.homeRowsUniversalOverride)) {
    return prefs.get(UserPreferences.homeRowsUniversalImageType);
  }

  final sectionType = _sectionTypeForRow(row, prefs);
  if (sectionType == null) {
    return ImageType.poster;
  }
  return prefs.get(UserPreferences.homeRowImageType(sectionType));
}

HomeSectionType? _sectionTypeForRow(HomeRow row, UserPreferences prefs) =>
    HomeViewModel.sectionConfigForRow(row, prefs.homeSectionsConfig)?.type;

bool _isLatestMusicRow(HomeRow row) {
  if (row.rowType != HomeRowType.latestMedia || row.items.isEmpty) {
    return false;
  }
  return row.items.every(
    (item) =>
        item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'MusicArtist',
  );
}

/// The image an unfocused card in [row] paints for [item], with the width
/// it paints it at. The item builder and the row prefetch both read this,
/// so the prefetch always warms the entry the card looks up.
HomeRowCardImage homeRowCardImage(
  HomeRow row,
  AggregatedItem item, {
  required UserPreferences prefs,
  required PosterSize posterSize,
  required bool useSeriesThumbs,
  required double requestScale,
  required double platformScale,
  required ImageApi imageApi,
  HomeRowImageUrlResolver resolveUrl = resolveRowImageUrl,
}) {
  final isRowsV2 = isHomeRowModern(row, prefs);
  final isModernMyMediaStatic = isHomeRowModernMyMediaStatic(row, prefs);
  final rowImageType = isSeerrFilterRow(row)
      ? ImageType.thumb
      : (isRowsV2
            ? (isModernMyMediaStatic ? ImageType.thumb : ImageType.poster)
            : homeRowImageTypeForRow(row, prefs));
  final isMyMediaRow = row.rowType == HomeRowType.libraryTiles;
  if (row.id == 'mdblist_watching_now') {
    final height = posterSize.landscapeHeight.toDouble() * platformScale;
    return (
      url: item.rawData['BackdropPath'] as String?,
      width: height * (16 / 9),
      aspectRatio: 16 / 9,
    );
  }
  if (isRowsV2 && !isModernMyMediaStatic) {
    final v2ImageHeight = modernImageHeight(posterSize, platformScale);
    final aspect = row.isAudio ? 1.0 : 2 / 3;
    final url = resolveUrl(
      item,
      imageApi,
      v2ImageHeight,
      ImageType.poster,
      item.type == 'Episode' ? true : useSeriesThumbs,
      requestScale,
      isMyMediaRow: isMyMediaRow,
    );
    return (url: url, width: v2ImageHeight * aspect, aspectRatio: aspect);
  }
  if (isModernMyMediaStatic) {
    // Home draws these at the Modern height with the focused card's 16:9.
    // Phones cap that width at the row width, which this can't see.
    final v2ImageHeight = modernImageHeight(posterSize, platformScale);
    final url = resolveUrl(
      item,
      imageApi,
      v2ImageHeight,
      ImageType.thumb,
      false,
      requestScale,
      isMyMediaRow: true,
    );
    return (url: url, width: v2ImageHeight * 16 / 9, aspectRatio: 16 / 9);
  }
  final ar = aspectRatioForRowItem(item, row, rowImageType);
  final height =
      (ar > 1
          ? posterSize.landscapeHeight.toDouble()
          : posterSize.portraitHeight.toDouble()) *
      platformScale;
  final url = resolveUrl(
    item,
    imageApi,
    height,
    rowImageType,
    useSeriesThumbs,
    requestScale,
    isMyMediaRow: isMyMediaRow,
  );
  return (url: url, width: height * ar, aspectRatio: ar);
}

/// The aspect ratio a Classic card in [row] draws [item] at for [imageType].
double aspectRatioForRowItem(
  AggregatedItem item,
  HomeRow row,
  ImageType imageType,
) {
  if (row.id == 'mdblist_watching_now') {
    return 16 / 9;
  }
  if (row.isAudio) {
    return 1.0;
  }
  if (row.rowType == HomeRowType.liveTvFavorites) {
    return 1.0;
  }
  if (isSeerrFilterRow(row)) {
    return 16 / 9;
  }
  double thumbAspectRatio() {
    return switch (item.type) {
      'MusicAlbum' || 'MusicArtist' || 'Audio' || 'Playlist' || 'Person' => 1,
      _ => 16 / 9,
    };
  }

  return switch (imageType) {
    ImageType.thumb => thumbAspectRatio(),
    ImageType.banner => kBannerAspectRatio,
    ImageType.poster => switch (item.type) {
      'MusicAlbum' || 'MusicArtist' || 'Audio' || 'Playlist' || 'Person' => 1.0,
      'Studio' || 'Network' => 16 / 9,
      _ => 2 / 3,
    },
  };
}

/// The artwork url a card in a Home row asks for, or null when there is
/// nothing to show. A My Media poster card gets null when the library's
/// Primary is wide.
String? resolveRowImageUrl(
  AggregatedItem item,
  ImageApi imageApi,
  double height,
  ImageType imageType,
  bool useSeriesThumbs,
  double requestScale, {
  bool isMyMediaRow = false,
}) {
  if (imageType == ImageType.poster && isMyMediaRow) {
    final primaryAr = item.rawData['PrimaryImageAspectRatio'] as num?;
    if (primaryAr != null && primaryAr >= 1.0) {
      return null;
    }
  }

  final studioLogo = item.rawData[studioLogoUrlKey];
  if (studioLogo is String) return studioLogo;

  if (item.type == 'Studio' || item.type == 'Network') {
    final maxW = artworkRequestWidth(
      height * (imageType == ImageType.banner ? kBannerAspectRatio : 16 / 9),
      requestScale,
      ArtworkShape.landscape,
    );
    final primaryUrl = resolvePrimaryImageUrl(
      item,
      imageApi,
      maxHeight: artworkRequestWidth(height, requestScale, ArtworkShape.poster),
      maxWidth: maxW,
    );
    if (primaryUrl != null) return primaryUrl;
    // Jellyfin studios usually have only a Thumb, so a poster row would
    // otherwise have nothing to show. Thumb and banner rows reach it below.
    if (imageType == ImageType.poster) {
      final thumbTag = tagForType(item, 'Thumb');
      if (thumbTag != null) {
        return imageApi.getThumbImageUrl(
          item.id,
          maxWidth: maxW,
          tag: thumbTag,
        );
      }
    }
  }

  if (item.serverId == 'seerr') {
    final backdrop = seerrTmdbImageUrl(
      item.rawData['BackdropPath'] as String?,
      1280,
    );
    final poster = seerrTmdbImageUrl(
      item.rawData['PosterPath'] as String?,
      300,
    );
    if (imageType == ImageType.thumb) {
      return seerrItemThumbUrl(item) ?? backdrop ?? poster;
    }
    if (imageType == ImageType.banner) return backdrop ?? poster;
    return poster ?? backdrop;
  }

  if (Destinations.isLiveTvChannelType(item.type)) {
    final logoTag = item.logoImageTag;
    if (logoTag != null) {
      return imageApi.getLogoImageUrl(
        item.id,
        maxWidth: artworkRequestWidth(
          height,
          requestScale,
          ArtworkShape.poster,
        ),
        tag: logoTag,
      );
    }
  }

  final itemThumbTag = tagForType(item, 'Thumb');
  final itemBannerTag = tagForType(item, 'Banner');
  final parentThumbItemId = item.rawData['ParentThumbItemId']?.toString();
  final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;

  // Episodes have no poster of their own, so a poster row falls back to the
  // series poster even when the series-thumb preference is off.
  if (item.type == 'Episode' &&
      (useSeriesThumbs || imageType == ImageType.poster)) {
    final seriesImage = _resolveSeriesImageForRowType(
      item,
      imageApi,
      height,
      imageType,
      requestScale,
    );
    if (seriesImage != null) {
      return seriesImage;
    }
  }

  if (imageType == ImageType.banner) {
    // Ask for the banner ratio. At 16/9 the artwork comes back about three
    // times too narrow for the card and has to be upscaled.
    final maxW = artworkRequestWidth(
      height * kBannerAspectRatio,
      requestScale,
      ArtworkShape.landscape,
    );
    if (isMyMediaRow) {
      final myMediaPrimary = resolvePrimaryImageUrl(
        item,
        imageApi,
        maxWidth: maxW,
      );
      if (myMediaPrimary != null) {
        return myMediaPrimary;
      }
    }
    if (itemBannerTag != null) {
      return imageApi.getBannerImageUrl(
        item.id,
        maxWidth: maxW,
        tag: itemBannerTag,
      );
    }
    if (itemThumbTag != null) {
      return imageApi.getThumbImageUrl(
        item.id,
        maxWidth: maxW,
        tag: itemThumbTag,
      );
    }
    if (item.backdropImageTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        item.id,
        maxWidth: maxW,
        tag: item.backdropImageTags.first,
      );
    }
    return _resolveImageUrl(
      item,
      imageApi,
      height,
      useSeriesThumbs,
      requestScale,
    );
  }

  if (imageType == ImageType.thumb) {
    final maxW = artworkRequestWidth(
      height * 16 / 9,
      requestScale,
      ArtworkShape.landscape,
    );
    final maxH = artworkRequestWidth(height, requestScale, ArtworkShape.poster);
    if (!useSeriesThumbs || item.type == 'Video' || item.type == 'MusicVideo') {
      if (item.type == 'Episode' ||
          item.type == 'Video' ||
          item.type == 'MusicVideo') {
        final videoPrimary = resolvePrimaryImageUrl(
          item,
          imageApi,
          maxHeight: maxH,
          maxWidth: maxW,
        );
        if (videoPrimary != null) {
          return videoPrimary;
        }
      }
    }
    if (itemThumbTag != null) {
      return imageApi.getThumbImageUrl(
        item.id,
        maxWidth: maxW,
        tag: itemThumbTag,
      );
    }
    if (item.backdropImageTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        item.id,
        maxWidth: maxW,
        tag: item.backdropImageTags.first,
      );
    }
    if (useSeriesThumbs || item.type != 'Episode') {
      if (parentThumbItemId != null && parentThumbTag != null) {
        return imageApi.getThumbImageUrl(
          parentThumbItemId,
          maxWidth: maxW,
          tag: parentThumbTag,
        );
      }
      if (item.parentBackdropItemId != null &&
          item.parentBackdropImageTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          item.parentBackdropItemId!,
          maxWidth: maxW,
          tag: item.parentBackdropImageTags.first,
        );
      }
    }
    return _resolveLandscapeImageUrl(item, imageApi, height, requestScale);
  }

  return _resolveImageUrl(
    item,
    imageApi,
    height,
    useSeriesThumbs,
    requestScale,
  );
}

String? _resolveSeriesImageForRowType(
  AggregatedItem item,
  ImageApi imageApi,
  double height,
  ImageType imageType,
  double requestScale,
) {
  // The banner branch below shares this width, so it has to account for the
  // banner ratio or that artwork comes back too narrow.
  final maxW =
      (height *
              (imageType == ImageType.banner ? kBannerAspectRatio : 16 / 9) *
              requestScale)
          .toInt();
  final maxH = artworkRequestWidth(height, requestScale, ArtworkShape.poster);
  final seriesId = item.seriesId;
  final seriesPrimaryTag = item.seriesPrimaryImageTag;
  final parentThumbItemId = item.rawData['ParentThumbItemId']?.toString();
  final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;
  final parentBackdropItemId = item.parentBackdropItemId;
  final parentBackdropTags = item.parentBackdropImageTags;

  if (imageType == ImageType.poster) {
    final sId = seriesId ?? item.parentPrimaryImageItemId;
    final sTag = seriesPrimaryTag ?? item.parentPrimaryImageTag;
    if (sId != null) {
      return imageApi.getPrimaryImageUrl(sId, maxHeight: maxH, tag: sTag);
    }
    return null;
  }

  if (imageType == ImageType.thumb) {
    if (parentThumbItemId != null && parentThumbTag != null) {
      return imageApi.getThumbImageUrl(
        parentThumbItemId,
        maxWidth: maxW,
        tag: parentThumbTag,
      );
    }
    if (parentBackdropItemId != null && parentBackdropTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        parentBackdropItemId,
        maxWidth: maxW,
        tag: parentBackdropTags.first,
      );
    }
    if (seriesId != null && seriesPrimaryTag != null) {
      return imageApi.getPrimaryImageUrl(
        seriesId,
        maxWidth: maxW,
        tag: seriesPrimaryTag,
      );
    }
    return null;
  }

  if (imageType == ImageType.banner) {
    final seriesBannerTag =
        (item.rawData['SeriesImageTags'] as Map?)?['Banner'] as String?;
    if (seriesId != null && seriesBannerTag != null) {
      return imageApi.getBannerImageUrl(
        seriesId,
        maxWidth: maxW,
        tag: seriesBannerTag,
      );
    }
    if (parentThumbItemId != null && parentThumbTag != null) {
      return imageApi.getThumbImageUrl(
        parentThumbItemId,
        maxWidth: maxW,
        tag: parentThumbTag,
      );
    }
    if (parentBackdropItemId != null && parentBackdropTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        parentBackdropItemId,
        maxWidth: maxW,
        tag: parentBackdropTags.first,
      );
    }
    if (seriesId != null && seriesPrimaryTag != null) {
      return imageApi.getPrimaryImageUrl(
        seriesId,
        maxWidth: maxW,
        tag: seriesPrimaryTag,
      );
    }
    return null;
  }

  return null;
}

/// The image tag [item] has for [imageType], from its ImageTags map.
String? tagForType(AggregatedItem item, String imageType) {
  final tags = item.rawData['ImageTags'];
  if (tags is! Map) return null;
  return tags[imageType] as String?;
}
