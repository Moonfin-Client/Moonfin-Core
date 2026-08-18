import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'media_server_client_factory.dart';

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

  Map<String, dynamic> toServerJson() => {
        'id': id,
        'positionMs': positionMs,
        'body': body,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory AudiobookNote.fromJson(Map<String, dynamic> json) {
    return AudiobookNote(
      id: json['id'] as String? ?? DateTime.now().microsecondsSinceEpoch.toString(),
      positionMs: (json['p'] as num?)?.toInt() ?? (json['positionMs'] as num?)?.toInt() ?? 0,
      body: json['b'] as String? ?? json['body'] as String? ?? '',
      updatedAt: DateTime.tryParse(json['u'] as String? ?? json['updatedAt'] as String? ?? '') ?? DateTime.now(),
    );
  }
}

/// Persists notes per server+item using [SharedPreferences] and syncs with Moonbase server.
class AudiobookNotesService {
  static String _key(String serverId, String itemId) =>
      'audiobook_notes_${serverId}_$itemId';

  final _controllers = <String, StreamController<List<AudiobookNote>>>{};

  MediaServerClient? _resolveClient(String serverId) {
    try {
      final factory = GetIt.instance<MediaServerClientFactory>();
      return factory.getClientIfExists(serverId) ?? GetIt.instance<MediaServerClient>();
    } catch (_) {
      return null;
    }
  }

  Future<List<AudiobookNote>> load(String serverId, String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key(serverId, itemId)) ?? const <String>[];
    final localList = <AudiobookNote>[];
    for (final s in raw) {
      try {
        final map = jsonDecode(s) as Map<String, dynamic>;
        localList.add(AudiobookNote.fromJson(map));
      } catch (_) {
        continue;
      }
    }
    localList.sort((a, b) => a.positionMs.compareTo(b.positionMs));

    // Background sync from Moonbase server
    unawaited(_syncFromMoonbase(serverId, itemId, localList));

    return localList;
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

    final client = _resolveClient(serverId);
    if (client != null) {
      unawaited(_syncToMoonbase(client, itemId, notes));
    }
  }

  Future<void> _syncFromMoonbase(
    String serverId,
    String itemId,
    List<AudiobookNote> localList,
  ) async {
    final client = _resolveClient(serverId);
    if (client == null) return;
    final token = client.accessToken;
    if (token == null || token.isEmpty) return;

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Authorization': buildServerAuthorizationHeader(
            scheme: 'MediaBrowser',
            deviceInfo: client.deviceInfo,
            accessToken: token,
          ),
          'Accept': 'application/json',
        },
      ),
    );
    configureServerDio(dio);

    try {
      final response = await dio.get<dynamic>('${client.baseUrl}/Moonfin/Bookmarks/$itemId');
      if (response.data == null) return;

      List<dynamic>? serverRaw;
      if (response.data is Map) {
        serverRaw = (response.data as Map)['notes'] as List<dynamic>?;
      }
      if (serverRaw == null) return;

      final serverNotes = <AudiobookNote>[];
      for (final item in serverRaw) {
        if (item is Map<String, dynamic>) {
          serverNotes.add(AudiobookNote.fromJson(item));
        }
      }

      final mergedMap = <String, AudiobookNote>{};
      for (final n in localList) {
        mergedMap[n.id] = n;
      }
      for (final n in serverNotes) {
        if (!mergedMap.containsKey(n.id)) {
          mergedMap[n.id] = n;
        }
      }

      final mergedList = mergedMap.values.toList()
        ..sort((a, b) => a.positionMs.compareTo(b.positionMs));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        _key(serverId, itemId),
        mergedList.map((n) => jsonEncode(n.toJson())).toList(),
      );
      final controller = _controllers[_key(serverId, itemId)];
      if (controller != null && !controller.isClosed) controller.add(mergedList);

      if (mergedList.length > serverNotes.length) {
        await _syncToMoonbase(client, itemId, mergedList);
      }
    } catch (_) {
      // Gracefully ignore network errors
    } finally {
      dio.close();
    }
  }

  Future<void> _syncToMoonbase(
    MediaServerClient client,
    String itemId,
    List<AudiobookNote> notes,
  ) async {
    final token = client.accessToken;
    if (token == null || token.isEmpty) return;

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Authorization': buildServerAuthorizationHeader(
            scheme: 'MediaBrowser',
            deviceInfo: client.deviceInfo,
            accessToken: token,
          ),
          'Content-Type': 'application/json',
        },
      ),
    );
    configureServerDio(dio);

    try {
      await dio.post<dynamic>(
        '${client.baseUrl}/Moonfin/Bookmarks/$itemId/Notes',
        data: notes.map((n) => n.toServerJson()).toList(),
      );
    } catch (_) {
    } finally {
      dio.close();
    }
  }

  void dispose() {
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();
  }
}
