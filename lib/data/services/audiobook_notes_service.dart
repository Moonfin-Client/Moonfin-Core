import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// A timestamped freeform note attached to a position in an audiobook.
class AudiobookNote {
  final String id;
  final int positionMs;
  final String body;
  final DateTime updatedAt;

  const AudiobookNote({
    required this.id,
    required this.positionMs,
    required this.body,
    required this.updatedAt,
  });

  AudiobookNote copyWith({String? body, int? positionMs}) {
    return AudiobookNote(
      id: id,
      positionMs: positionMs ?? this.positionMs,
      body: body ?? this.body,
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'p': positionMs,
        'b': body,
        'u': updatedAt.toIso8601String(),
      };

  factory AudiobookNote.fromJson(Map<String, dynamic> json) {
    return AudiobookNote(
      id: json['id'] as String? ?? DateTime.now().microsecondsSinceEpoch.toString(),
      positionMs: (json['p'] as num?)?.toInt() ?? 0,
      body: json['b'] as String? ?? '',
      updatedAt: DateTime.tryParse(json['u'] as String? ?? '') ?? DateTime.now(),
    );
  }
}

/// Persists notes per server+item using [SharedPreferences].
class AudiobookNotesService {
  static String _key(String serverId, String itemId) =>
      'audiobook_notes_${serverId}_$itemId';

  final _controllers = <String, StreamController<List<AudiobookNote>>>{};

  Future<List<AudiobookNote>> load(String serverId, String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key(serverId, itemId)) ?? const <String>[];
    final out = <AudiobookNote>[];
    for (final s in raw) {
      try {
        final map = jsonDecode(s) as Map<String, dynamic>;
        out.add(AudiobookNote.fromJson(map));
      } catch (_) {
        continue;
      }
    }
    out.sort((a, b) => a.positionMs.compareTo(b.positionMs));
    return out;
  }

  Stream<List<AudiobookNote>> watch(String serverId, String itemId) {
    final key = _key(serverId, itemId);
    final controller = _controllers.putIfAbsent(
      key,
      () => StreamController<List<AudiobookNote>>.broadcast(),
    );
    Future.microtask(() async {
      final value = await load(serverId, itemId);
      if (!controller.isClosed) controller.add(value);
    });
    return controller.stream;
  }

  Future<AudiobookNote> add(
    String serverId,
    String itemId, {
    required int positionMs,
    required String body,
  }) async {
    final note = AudiobookNote(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      positionMs: positionMs,
      body: body,
      updatedAt: DateTime.now(),
    );
    final current = await load(serverId, itemId);
    final next = [...current, note]
      ..sort((a, b) => a.positionMs.compareTo(b.positionMs));
    await _persist(serverId, itemId, next);
    return note;
  }

  Future<void> update(
    String serverId,
    String itemId,
    String noteId, {
    required String body,
  }) async {
    final current = await load(serverId, itemId);
    final next = current
        .map((n) => n.id == noteId ? n.copyWith(body: body) : n)
        .toList(growable: false);
    await _persist(serverId, itemId, next);
  }

  Future<void> remove(String serverId, String itemId, String noteId) async {
    final current = await load(serverId, itemId);
    final next = current.where((n) => n.id != noteId).toList(growable: false);
    await _persist(serverId, itemId, next);
  }

  Future<void> _persist(
    String serverId,
    String itemId,
    List<AudiobookNote> notes,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _key(serverId, itemId),
      notes.map((n) => jsonEncode(n.toJson())).toList(),
    );
    final controller = _controllers[_key(serverId, itemId)];
    if (controller != null && !controller.isClosed) controller.add(notes);
  }

  void dispose() {
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();
  }
}
