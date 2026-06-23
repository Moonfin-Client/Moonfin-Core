import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// A single user-saved position inside an audiobook.
class AudiobookBookmark {
  final int positionMs;
  final String label;
  final DateTime createdAt;

  const AudiobookBookmark({
    required this.positionMs,
    required this.label,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'p': positionMs,
        'l': label,
        'c': createdAt.toIso8601String(),
      };

  factory AudiobookBookmark.fromJson(Map<String, dynamic> json) {
    return AudiobookBookmark(
      positionMs: (json['p'] as num?)?.toInt() ?? 0,
      label: json['l'] as String? ?? '',
      createdAt: DateTime.tryParse(json['c'] as String? ?? '') ?? DateTime.now(),
    );
  }
}

/// Persists bookmarks per server+item using [SharedPreferences].
///
/// Storage layout mirrors the existing book reader bookmark format: one
/// `StringList` per item, each entry a JSON object.
class AudiobookBookmarksService {
  static String _key(String serverId, String itemId) =>
      'audiobook_bookmarks_${serverId}_$itemId';

  final _controllers = <String, StreamController<List<AudiobookBookmark>>>{};

  Future<List<AudiobookBookmark>> load(String serverId, String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key(serverId, itemId)) ?? const <String>[];
    final out = <AudiobookBookmark>[];
    for (final s in raw) {
      try {
        final map = jsonDecode(s) as Map<String, dynamic>;
        out.add(AudiobookBookmark.fromJson(map));
      } catch (_) {
        continue;
      }
    }
    out.sort((a, b) => a.positionMs.compareTo(b.positionMs));
    return out;
  }

  Stream<List<AudiobookBookmark>> watch(String serverId, String itemId) {
    final key = _key(serverId, itemId);
    final controller = _controllers.putIfAbsent(
      key,
      () => StreamController<List<AudiobookBookmark>>.broadcast(),
    );
    // Emit current value asynchronously to new subscribers.
    Future.microtask(() async {
      final value = await load(serverId, itemId);
      if (!controller.isClosed) controller.add(value);
    });
    return controller.stream;
  }

  Future<void> add(
    String serverId,
    String itemId, {
    required int positionMs,
    required String label,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _key(serverId, itemId);
    final current = await load(serverId, itemId);
    final next = [
      ...current,
      AudiobookBookmark(
        positionMs: positionMs,
        label: label,
        createdAt: DateTime.now(),
      ),
    ]..sort((a, b) => a.positionMs.compareTo(b.positionMs));
    await prefs.setStringList(
      key,
      next.map((b) => jsonEncode(b.toJson())).toList(),
    );
    _notify(serverId, itemId, next);
  }

  Future<void> removeAt(String serverId, String itemId, int positionMs) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _key(serverId, itemId);
    final current = await load(serverId, itemId);
    final next =
        current.where((b) => b.positionMs != positionMs).toList(growable: false);
    await prefs.setStringList(
      key,
      next.map((b) => jsonEncode(b.toJson())).toList(),
    );
    _notify(serverId, itemId, next);
  }

  void _notify(String serverId, String itemId, List<AudiobookBookmark> value) {
    final controller = _controllers[_key(serverId, itemId)];
    if (controller != null && !controller.isClosed) controller.add(value);
  }

  void dispose() {
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();
  }
}
