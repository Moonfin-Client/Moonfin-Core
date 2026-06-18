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
  return (item.rawData['MediaType'] as String?) == 'Audio';
}

bool hasPlaylistEntryId(AggregatedItem item) {
  final entryId = item.rawData['PlaylistItemId']?.toString();
  return entryId != null && entryId.isNotEmpty;
}

bool playlistItemMatchesMediaType(Map<String, dynamic> raw, String mediaType) {
  final itemMediaType = raw['MediaType'] as String?;
  if (itemMediaType != null) {
    return itemMediaType == mediaType;
  }

  final itemType = raw['Type'] as String?;
  return switch (mediaType) {
    'Audio' => itemType == 'Audio',
    'Video' =>
      itemType == 'Video' ||
          itemType == 'Movie' ||
          itemType == 'Episode' ||
          itemType == 'MusicVideo' ||
          itemType == 'Trailer' ||
          itemType == 'Clip',
    _ => false,
  };
}

Future<bool> playlistContainsOnlyMediaType(
  MediaServerClient client,
  AggregatedItem item,
  String mediaType, {
  bool assumeNonEmptyWhenUnknown = false,
}) async {
  if (item.type != 'Playlist') {
    return false;
  }

  final count = item.childCount ?? item.recursiveItemCount;
  if (count == 0) {
    return false;
  }

  final summaryMediaType = item.rawData['MediaType'] as String?;
  if (summaryMediaType != null && summaryMediaType != mediaType) {
    return false;
  }

  try {
    final response = await client.itemsApi.getPlaylistItems(item.id);
    final rawItems = ((response['Items'] as List?) ?? const [])
        .cast<Map<String, dynamic>>();
    if (rawItems.isEmpty) {
      return false;
    }
    return rawItems.every(
      (raw) => playlistItemMatchesMediaType(raw, mediaType),
    );
  } catch (_) {
    if (count == null) {
      return assumeNonEmptyWhenUnknown && summaryMediaType == mediaType;
    }
    return summaryMediaType == mediaType;
  }
}

Future<bool> playlistHasBrowsableItems(
  MediaServerClient client,
  AggregatedItem item, {
  bool assumeNonEmptyWhenUnknown = false,
}) async {
  if (item.type != 'Playlist' ||
      !isPlaylistNonEmpty(
        item,
        assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
      )) {
    return false;
  }

  final summaryMediaType = item.rawData['MediaType'] as String?;
  if (summaryMediaType != null &&
      summaryMediaType != 'Audio' &&
      summaryMediaType != 'Unknown') {
    return true;
  }

  try {
    final response = await client.itemsApi.getPlaylistItems(item.id);
    final rawItems = ((response['Items'] as List?) ?? const [])
        .cast<Map<String, dynamic>>();
    if (rawItems.isEmpty) {
      return false;
    }
    return rawItems.any((raw) => !playlistItemMatchesMediaType(raw, 'Audio'));
  } catch (_) {
    if (summaryMediaType != null) {
      return summaryMediaType != 'Audio' && summaryMediaType != 'Unknown';
    }
    return isPlaylistNonEmpty(
      item,
      assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
    );
  }
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
