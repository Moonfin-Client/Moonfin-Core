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

/// The category an individual item belongs to. Its concrete `Type` wins over
/// `MediaType`, which reports a music video as Audio and can't tell an audiobook
/// from a song.
String resolveItemMediaType(Map<String, dynamic> raw) {
  return switch (raw['Type'] as String?) {
    'MusicVideo' => 'MusicVideo',
    'Movie' || 'Episode' || 'Video' || 'Trailer' || 'Clip' => 'Video',
    'AudioBook' => 'AudioBook',
    'Audio' => 'Audio',
    'Book' => 'Book',
    'Photo' => 'Photo',
    _ => _categoryForMediaType(raw['MediaType'] as String?),
  };
}

/// A server `MediaType` mapped onto the same categories [resolveItemMediaType]
/// returns. The server only reports Video, Audio, Book or Photo here.
String _categoryForMediaType(String? mediaType) {
  return switch (mediaType) {
    'Video' => 'Video',
    'Audio' => 'Audio',
    'Book' => 'Book',
    'Photo' => 'Photo',
    _ => 'Unknown',
  };
}

/// The category a playlist belongs to, one of Video, MusicVideo, Audio, AudioBook,
/// Book, Photo or Mixed. Mixed also covers a playlist that's empty or unreadable.
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

  // Book and Photo summaries are specific enough to take at face value.
  // Video and Audio aren't, since the server calls both music and audiobooks
  // Audio, tags a playlist of music videos Audio or Video, and can't tell
  // music video playlists apart from movie or TV playlists without checking items.
  final summaryCategory = _categoryForMediaType(
    item.rawData['MediaType'] as String?,
  );
  if (summaryCategory == 'Book' || summaryCategory == 'Photo') {
    return summaryCategory;
  }

  try {
    final response = await client.itemsApi.getPlaylistItems(item.id);
    final rawItems = ((response['Items'] as List?) ?? const [])
        .cast<Map<String, dynamic>>();
    if (rawItems.isEmpty) {
      return 'Mixed';
    }

    final categories = rawItems.map(resolveItemMediaType).toSet();
    if (categories.contains('MusicVideo') &&
        categories.every((c) => c == 'MusicVideo' || c == 'Audio')) {
      return 'MusicVideo';
    }
    if (categories.length == 1) {
      return categories.first != 'Unknown' ? categories.first : 'Mixed';
    }
    return 'Mixed';
  } catch (_) {
    return summaryCategory != 'Unknown' ? summaryCategory : 'Mixed';
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

/// Whether a playlist belongs in a video playlist row. Audio only playlists are
/// left out because they have a row of their own, so counting them here would
/// list the same playlist twice on the home screen.
Future<bool> playlistHasBrowsableItems(
  MediaServerClient client,
  AggregatedItem item, {
  bool assumeNonEmptyWhenUnknown = false,
}) async {
  if (item.type != 'Playlist') return false;
  if (!isPlaylistNonEmpty(
    item,
    assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
  )) {
    return false;
  }

  final category = await resolvePlaylistCategory(
    client,
    item,
    assumeNonEmptyWhenUnknown: assumeNonEmptyWhenUnknown,
  );
  return category != 'Audio' && category != 'AudioBook';
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
