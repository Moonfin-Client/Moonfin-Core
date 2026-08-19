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
  /// Set while a local edit hasn't reached the server. It decides which side
  /// wins the next sync, so an edit made offline isn't replaced by the older
  /// list the server still holds.
  static String _dirtyKey(String serverId, String itemId) =>
      'audiobook_notes_dirty_${serverId}_$itemId';

  static String _key(String serverId, String itemId) =>
      'audiobook_notes_${serverId}_$itemId';

  final _controllers = <String, StreamController<List<AudiobookNote>>>{};

  MediaServerClient? _resolveClient(String serverId) {
    try {
      return GetIt.instance<MediaServerClientFactory>().getClientIfExists(
        serverId,
      );
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
      await syncFromServer(serverId, itemId);
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

    unawaited(_pushToServer(serverId, itemId, notes));
  }

  Future<void> _pushToServer(
    String serverId,
    String itemId,
    List<AudiobookNote> list,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_dirtyKey(serverId, itemId), true);
    final client = _resolveClient(serverId);
    if (client == null) return;
    if (await _syncToMoonbase(client, itemId, list)) {
      await prefs.remove(_dirtyKey(serverId, itemId));
    }
  }

  /// Reconciles this device with the server for one item.
  ///
  /// The server holds a whole list per item, so what it returns is the state
  /// every device agreed on. Taking it as it stands is what lets a note deleted
  /// elsewhere stay deleted, which merging the two lists could never express.
  /// Local wins only while it holds an edit the server hasn't taken.
  Future<void> syncFromServer(String serverId, String itemId) async {
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

      final prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(_dirtyKey(serverId, itemId)) ?? false) {
        final localList = await load(serverId, itemId);
        if (await _syncToMoonbase(client, itemId, localList)) {
          await prefs.remove(_dirtyKey(serverId, itemId));
        }
        return;
      }

      serverNotes.sort((a, b) => a.positionMs.compareTo(b.positionMs));
      await prefs.setStringList(
        _key(serverId, itemId),
        serverNotes.map((n) => jsonEncode(n.toJson())).toList(),
      );
      final controller = _controllers[_key(serverId, itemId)];
      if (controller != null && !controller.isClosed) controller.add(serverNotes);
    } catch (_) {
      // Gracefully ignore network errors
    } finally {
      dio.close();
    }
  }

  Future<bool> _syncToMoonbase(
    MediaServerClient client,
    String itemId,
    List<AudiobookNote> notes,
  ) async {
    final token = client.accessToken;
    if (token == null || token.isEmpty) return false;

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
      return true;
    } catch (_) {
      return false;
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
