import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';

/// The item's chapters as `{title, startMs}`, for the chapter menu, the seek
/// bar marks and the transport buttons.
///
/// An offline item keeps its copy on the manager, since there's no route left
/// to ask the server for one.
List<Map<String, dynamic>> chaptersForItem(
  dynamic item,
  Map<String, dynamic>? offlineMetadata,
) {
  List<Map<String, dynamic>>? raw;
  if (item is AggregatedItem) {
    raw = item.chapters;
  } else if (item is String) {
    raw = (offlineMetadata?['Chapters'] as List?)?.cast<Map<String, dynamic>>();
  }
  if (raw == null) return const [];

  final chapters = <Map<String, dynamic>>[];
  for (var i = 0; i < raw.length; i++) {
    final title = (raw[i]['Name'] as String?)?.trim();
    chapters.add({
      'title': (title != null && title.isNotEmpty) ? title : 'Chapter ${i + 1}',
      'startMs': ((raw[i]['StartPositionTicks'] as int?) ?? 0) ~/ 10000,
    });
  }
  return chapters;
}

/// Chapters the server holds for an item that arrived without them, which is
/// what a row query returns. Empty when it genuinely has none.
///
/// Names no fields on purpose. Jellyfin's default list leads with Chapters,
/// and Emby returns them on a single item either way.
Future<List<Map<String, dynamic>>> fetchChapters(
  MediaServerClient client,
  String itemId,
) async {
  try {
    final data = await client.itemsApi.getItem(itemId);
    return (data['Chapters'] as List?)?.cast<Map<String, dynamic>>() ??
        const [];
  } catch (_) {
    return const [];
  }
}

/// Every chapter start of an item, in order, with duplicates collapsed.
///
/// Unlike [chapterMarkerPositions] this keeps the runtime's own bounds, since
/// stepping back to a chapter at 0:00 means something where drawing a mark on
/// it doesn't.
List<int> chapterStartsMs(List<Map<String, dynamic>> chapters) {
  final starts = <int>{};
  for (final chapter in chapters) {
    final startMs = chapter['startMs'];
    if (startMs is! int || startMs < 0) continue;
    starts.add(startMs);
  }
  return starts.toList()..sort();
}

/// Where the seek bar draws a chapter mark, in milliseconds.
List<int> chapterMarkerPositions(
  List<Map<String, dynamic>> chapters,
  int durationMs,
) {
  if (durationMs <= 0) return const [];
  return [
    // A mark at either end sits under the thumb where it rests and reads as
    // an artifact rather than a chapter.
    for (final ms in chapterStartsMs(chapters))
      if (ms > 0 && ms < durationMs) ms,
  ];
}
