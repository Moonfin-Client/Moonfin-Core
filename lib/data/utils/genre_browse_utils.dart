import 'package:server_core/server_core.dart';

/// Every item type a genre row can be built from, across all the libraries
/// that have one. Callers that only want part of this pass their own list,
/// which [normalizeBrowsableGenreItemTypes] narrows against this.
const List<String> kBrowsableGenreItemTypes = [
  'Movie',
  'Series',
  'Audio',
  'MusicAlbum',
];

/// Types that carry a genre or studio tag from their parent rather than
/// standing on their own. Leaving them in a browse is what makes the page
/// disagree with the count on the tile that opened it.
const List<String> kNonRootBrowseItemTypes = [
  'Playlist',
  'Episode',
  'Season',
  'Folder',
];

List<String> normalizeBrowsableGenreItemTypes(List<String>? includeItemTypes) {
  final requested =
      includeItemTypes
          ?.map((type) => type.trim())
          .where((type) => type.isNotEmpty)
          .toList(growable: false) ??
      const [];

  final normalized = requested
      .where((type) => kBrowsableGenreItemTypes.contains(type))
      .toSet()
      .toList(growable: true);

  if (normalized.isEmpty) {
    return List<String>.from(kBrowsableGenreItemTypes);
  }

  normalized.sort(
    (a, b) => kBrowsableGenreItemTypes
        .indexOf(a)
        .compareTo(kBrowsableGenreItemTypes.indexOf(b)),
  );
  return normalized;
}

int browsableGenreCount(
  Map<String, dynamic> genreData, {
  List<String>? includeItemTypes,
  List<String>? normalizedItemTypes,
}) {
  final browseTypes =
      normalizedItemTypes ?? normalizeBrowsableGenreItemTypes(includeItemTypes);
  var hasDetailedCounts = false;
  var total = 0;

  for (final type in browseTypes) {
    final countField = switch (type) {
      'Movie' => 'MovieCount',
      'Series' => 'SeriesCount',
      'Audio' => 'SongCount',
      'MusicAlbum' => 'AlbumCount',
      _ => null,
    };

    if (countField == null) {
      continue;
    }

    final raw = genreData[countField];
    if (raw != null) {
      hasDetailedCounts = true;
    }
    total += _asInt(raw);
  }

  if (hasDetailedCounts) {
    return total;
  }

  return _asInt(genreData['ChildCount']);
}

Map<String, dynamic> mergeGenreWithRepresentativeItem({
  required Map<String, dynamic> genreData,
  required Map<String, dynamic> representativeItem,
  required int itemCount,
  Map<String, dynamic>? backdropRepresentativeItem,
}) {
  final merged = Map<String, dynamic>.from(genreData);
  merged['ChildCount'] = itemCount;

  final representativeId = representativeItem['Id']?.toString();
  if (representativeId != null && representativeId.isNotEmpty) {
    final imageTags = representativeItem['ImageTags'];
    String? primaryTag = representativeItem['PrimaryImageTag'] as String?;
    if ((primaryTag == null || primaryTag.isEmpty) && imageTags is Map) {
      final rawPrimary = imageTags['Primary'];
      if (rawPrimary is String && rawPrimary.isNotEmpty) {
        primaryTag = rawPrimary;
      }
    }

    if (primaryTag != null && primaryTag.isNotEmpty) {
      merged['PrimaryImageItemId'] = representativeId;
      merged['PrimaryImageTag'] = primaryTag;
    }
  }

  final backdropItem = backdropRepresentativeItem ?? representativeItem;
  final backdropId = backdropItem['Id']?.toString();
  if (backdropId != null && backdropId.isNotEmpty) {
    final imageTags = backdropItem['ImageTags'];
    if (imageTags is Map) {
      final rawThumb = imageTags['Thumb'];
      if (rawThumb is String && rawThumb.isNotEmpty) {
        merged['ParentThumbItemId'] = backdropId;
        merged['ParentThumbImageTag'] = rawThumb;
      }
    }

    final rawBackdropTags = backdropItem['BackdropImageTags'];
    if (rawBackdropTags is List) {
      final backdropTags = rawBackdropTags
          .whereType<String>()
          .where((tag) => tag.isNotEmpty)
          .toList();
      if (backdropTags.isNotEmpty) {
        merged['ParentBackdropItemId'] = backdropId;
        merged['ParentBackdropImageTags'] = backdropTags;
      }
    }
  }

  return merged;
}

int _asInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// Picks the tile and backdrop art for a genre with no art of its own.
///
/// [selectedId] is the item the tile art came from, so a screen drawing a whole
/// grid of genres can pass it back as [avoidIds] and get a different picture on
/// the next tile.
(String? imageUrl, String? backdropUrl, String? selectedId)
resolveGenreFallbackArtwork({
  required List<Map<String, dynamic>> items,
  required ImageApi imageApi,
  required int maxWidth,
  Set<String> avoidIds = const {},
}) {
  if (items.isEmpty) {
    return (null, null, null);
  }

  // Art another tile already took drops to the back rather than out, so a
  // genre whose every item is spoken for still gets a picture.
  final candidates = avoidIds.isEmpty
      ? items
      : [
          ...items.where((i) => !avoidIds.contains(i['Id']?.toString())),
          ...items.where((i) => avoidIds.contains(i['Id']?.toString())),
        ];

  String? tileUrl;
  Map<String, dynamic>? selectedItem;

  // 1. Try Backdrop (always landscape)
  for (final item in candidates) {
    final bTags = item['BackdropImageTags'] as List?;
    if (bTags != null && bTags.isNotEmpty) {
      tileUrl = imageApi.getBackdropImageUrl(
        item['Id']?.toString() ?? '',
        tag: bTags.first.toString(),
        maxWidth: maxWidth,
      );
      selectedItem = item;
      break;
    }
  }

  // 2. Try Primary if it is landscape/square
  if (tileUrl == null) {
    for (final item in candidates) {
      final pTag = item['PrimaryImageTag'] as String?;
      final pAr = item['PrimaryImageAspectRatio'] as num?;
      if (pTag != null && pAr != null && pAr >= 1.0) {
        tileUrl = imageApi.getPrimaryImageUrl(
          item['Id']?.toString() ?? '',
          tag: pTag,
          maxWidth: maxWidth,
        );
        selectedItem = item;
        break;
      }
    }
  }

  // 3. Fall back to any Primary (even portrait) if nothing else is available
  if (tileUrl == null) {
    for (final item in candidates) {
      final pTag = item['PrimaryImageTag'] as String?;
      if (pTag != null) {
        tileUrl = imageApi.getPrimaryImageUrl(
          item['Id']?.toString() ?? '',
          tag: pTag,
          maxWidth: maxWidth,
        );
        selectedItem = item;
        break;
      }
    }
  }

  String? backdropUrl;
  for (final item in candidates) {
    if (item == selectedItem && candidates.length > 1) continue;
    final bTags = item['BackdropImageTags'] as List?;
    if (bTags != null && bTags.isNotEmpty) {
      backdropUrl = imageApi.getBackdropImageUrl(
        item['Id']?.toString() ?? '',
        tag: bTags.first.toString(),
        maxWidth: 960,
      );
      break;
    }
  }

  if (backdropUrl == null && selectedItem != null) {
    final bTags = selectedItem['BackdropImageTags'] as List?;
    if (bTags != null && bTags.isNotEmpty) {
      backdropUrl = imageApi.getBackdropImageUrl(
        selectedItem['Id']?.toString() ?? '',
        tag: bTags.first.toString(),
        maxWidth: 960,
      );
    }
  }

  return (tileUrl, backdropUrl ?? tileUrl, selectedItem?['Id']?.toString());
}
