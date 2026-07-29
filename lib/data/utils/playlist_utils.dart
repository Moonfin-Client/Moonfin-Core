import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';

bool isPlaylistNonEmpty(
  AggregatedItem item, {
  bool assumeNonEmptyWhenUnknown = false,
}) {
  final count = item.childCount ?? item.recursiveItemCount;
  if (count == null) {
    return assumeNonEmptyWhenUnknown;
  }
  return count > 0;
}

bool isAudioPlaylistSummary(AggregatedItem item) {
  final resolved = resolveItemMediaType(item.rawData);
  return resolved == 'Audio';
}

bool hasPlaylistEntryId(AggregatedItem item) {
  final entryId = item.rawData['PlaylistItemId']?.toString();
  return entryId != null && entryId.isNotEmpty;
}

/// Resolves the media type category of an individual item.
/// Concrete `Type` (`Movie`, `Episode`, `MusicVideo`, `Video`, `AudioBook`, etc.)
/// takes precedence over `MediaType` to handle Jellyfin metadata mismatches.
String resolveItemMediaType(Map<String, dynamic> raw) {
  final itemType = raw['Type'] as String?;
  if (itemType == 'Movie' ||
      itemType == 'Episode' ||
      itemType == 'Video' ||
      itemType == 'MusicVideo' ||
      itemType == 'Trailer' ||
      itemType == 'Clip') {
    return 'Video';
  }
  if (itemType == 'AudioBook') {
    return 'AudioBook';
  }
  if (itemType == 'Audio') {
    return 'Audio';
  }
  if (itemType == 'Book') {
    return 'Book';
  }
  if (itemType == 'Game') {
    return 'Game';
  }
  if (itemType == 'Photo') {
    return 'Photo';
  }

  final summaryMediaType = raw['MediaType'] as String?;
  if (summaryMediaType != null &&
      summaryMediaType.isNotEmpty &&
      summaryMediaType != 'Unknown') {
    if (summaryMediaType == 'Video') return 'Video';
    if (summaryMediaType == 'Audio') return 'Audio';
    if (summaryMediaType == 'Book') return 'Book';
    if (summaryMediaType == 'Game') return 'Game';
    if (summaryMediaType == 'Photo') return 'Photo';
  }

  return 'Unknown';
}

bool playlistItemMatchesMediaType(Map<String, dynamic> raw, String mediaType) {
  return resolveItemMediaType(raw) == mediaType;
}

/// Resolves the playlist category (`Video`, `Audio`, `AudioBook`, `Book`, `Game`, `Photo`, or `Mixed`).
Future<String> resolvePlaylistCategory(
  MediaServerClient client,
  AggregatedItem item, {
  bool assumeNonEmptyWhenUnknown = false,
}) async {
  if (item.type != 'Playlist') {
    return resolveItemMediaType(item.rawData);
  }

  if (!isPlaylistNonEmpty(
    item,
    assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
  )) {
    return 'Mixed';
  }

  try {
    final response = await client.itemsApi.getPlaylistItems(item.id);
    final rawItems = ((response['Items'] as List?) ?? const [])
        .cast<Map<String, dynamic>>();
    if (rawItems.isEmpty) {
      return 'Mixed';
    }

    final categories = rawItems.map(resolveItemMediaType).toSet();
    if (categories.length == 1) {
      return categories.first != 'Unknown' ? categories.first : 'Mixed';
    }
    return 'Mixed';
  } catch (_) {
    final summaryMediaType = item.rawData['MediaType'] as String?;
    if (summaryMediaType != null &&
        summaryMediaType.isNotEmpty &&
        summaryMediaType != 'Unknown') {
      return summaryMediaType;
    }
    return 'Mixed';
  }
}

Future<bool> playlistContainsOnlyMediaType(
  MediaServerClient client,
  AggregatedItem item,
  String mediaType, {
  bool assumeNonEmptyWhenUnknown = false,
}) async {
  final category = await resolvePlaylistCategory(
    client,
    item,
    assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
  );
  return category == mediaType;
}

Future<bool> playlistHasBrowsableItems(
  MediaServerClient client,
  AggregatedItem item, {
  bool assumeNonEmptyWhenUnknown = false,
}) async {
  if (item.type != 'Playlist') return true;
  return isPlaylistNonEmpty(
    item,
    assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
  );
}

Future<List<AggregatedItem>> filterBrowsablePlaylists(
  MediaServerClient client,
  List<AggregatedItem> items, {
  String? mediaType,
  bool assumeNonEmptyWhenUnknown = false,
}) async {
  final filtered = await Future.wait(
    items.map((item) async {
      if (item.type != 'Playlist') {
        return item;
      }

      final keep = mediaType == null
          ? await playlistHasBrowsableItems(
              client,
              item,
              assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
            )
          : await playlistContainsOnlyMediaType(
              client,
              item,
              mediaType,
              assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
            );
      return keep ? item : null;
    }),
  );

  return filtered.whereType<AggregatedItem>().toList();
}
