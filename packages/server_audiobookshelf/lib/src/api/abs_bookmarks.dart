import 'package:dio/dio.dart';

import '../abs_ids.dart';

/// Audiobookshelf's own bookmarks, which its other apps show too. It keeps
/// them per book at a time in seconds, and each one needs a title.
class AbsBookmarks {
  AbsBookmarks(this._dio);

  final Dio _dio;

  /// The book's bookmarks as `{positionMs, label, createdAt}`, or null for an
  /// id Audiobookshelf keeps none for, such as a podcast episode.
  Future<List<Map<String, dynamic>>?> list(String itemId) async {
    if (!absIsLibraryItemId(itemId)) return null;
    return [
      for (final bookmark in await _ofItem(itemId))
        {
          'positionMs': _ms(bookmark['time']),
          'label': _label(bookmark),
          if (bookmark['createdAt'] case final num created)
            'createdAt': DateTime.fromMillisecondsSinceEpoch(
              created.toInt(),
            ).toIso8601String(),
        },
    ];
  }

  /// Makes the server hold exactly [bookmarks], given as [list] answers them.
  /// False for an id Audiobookshelf keeps no bookmarks for.
  Future<bool> replace(
    String itemId,
    List<Map<String, dynamic>> bookmarks,
  ) async {
    if (!absIsLibraryItemId(itemId)) return false;
    final current = {
      for (final bookmark in await _ofItem(itemId)) _ms(bookmark['time']): bookmark,
    };
    final wanted = {
      for (final bookmark in bookmarks)
        (bookmark['positionMs'] as num).toInt():
            bookmark['label'] as String? ?? '',
    };
    final path = '/api/me/item/$itemId/bookmark';
    for (final MapEntry(key: ms, value: bookmark) in current.entries) {
      if (!wanted.containsKey(ms)) {
        await _dio.delete<dynamic>('$path/${bookmark['time']}');
      }
    }
    for (final MapEntry(key: ms, value: label) in wanted.entries) {
      final title = label.isEmpty ? absBookmarkTitle(ms) : label;
      final existing = current[ms];
      if (existing == null) {
        await _dio.post<dynamic>(path, data: {'time': ms / 1000, 'title': title});
      } else if (existing['title'] != title) {
        await _dio.patch<dynamic>(
          path,
          data: {'time': existing['time'], 'title': title},
        );
      }
    }
    return true;
  }

  Future<List<Map<String, dynamic>>> _ofItem(String itemId) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/me');
    return [
      for (final bookmark in response.data?['bookmarks'] as List? ?? const [])
        if (bookmark is Map && bookmark['libraryItemId'] == itemId)
          bookmark.cast<String, dynamic>(),
    ];
  }

  static int _ms(Object? seconds) =>
      seconds is num ? (seconds * 1000).round() : 0;

  /// A bookmark saved without a label gets its time as the title, and reads
  /// back without a label again.
  static String _label(Map<String, dynamic> bookmark) {
    final title = bookmark['title'] as String? ?? '';
    return title == absBookmarkTitle(_ms(bookmark['time'])) ? '' : title;
  }
}

/// The title a bookmark without a label is saved under, like `1:02:03`.
String absBookmarkTitle(int positionMs) {
  final total = positionMs ~/ 1000;
  final hours = total ~/ 3600;
  final minutes = (total ~/ 60) % 60;
  final seconds = (total % 60).toString().padLeft(2, '0');
  return hours > 0
      ? '$hours:${minutes.toString().padLeft(2, '0')}:$seconds'
      : '$minutes:$seconds';
}
