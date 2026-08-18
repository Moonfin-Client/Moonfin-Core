import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'media_server_client_factory.dart';

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

  Map<String, dynamic> toServerJson() => {
        'positionMs': positionMs,
        'label': label,
        'createdAt': createdAt.toIso8601String(),
      };

  factory AudiobookBookmark.fromJson(Map<String, dynamic> json) {
    return AudiobookBookmark(
      positionMs: (json['p'] as num?)?.toInt() ?? (json['positionMs'] as num?)?.toInt() ?? 0,
      label: json['l'] as String? ?? json['label'] as String? ?? '',
      createdAt: DateTime.tryParse(json['c'] as String? ?? json['createdAt'] as String? ?? '') ?? DateTime.now(),
    );
  }
}

/// Persists bookmarks per server+item using [SharedPreferences] and syncs with Moonbase server.
class AudiobookBookmarksService {
  static String _key(String serverId, String itemId) =>
      'audiobook_bookmarks_${serverId}_$itemId';

  final _controllers = <String, StreamController<List<AudiobookBookmark>>>{};

  MediaServerClient? _resolveClient(String serverId) {
    try {
      final factory = GetIt.instance<MediaServerClientFactory>();
      return factory.getClientIfExists(serverId) ?? GetIt.instance<MediaServerClient>();
    } catch (_) {
      return null;
    }
  }

  Future<List<AudiobookBookmark>> load(String serverId, String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key(serverId, itemId)) ?? const <String>[];
    final localList = <AudiobookBookmark>[];
    for (final s in raw) {
      try {
        final map = jsonDecode(s) as Map<String, dynamic>;
        localList.add(AudiobookBookmark.fromJson(map));
      } catch (_) {
        continue;
      }
    }
    localList.sort((a, b) => a.positionMs.compareTo(b.positionMs));

    // Background sync from Moonbase server
    unawaited(_syncFromMoonbase(serverId, itemId, localList));

    return localList;
  }

  Stream<List<AudiobookBookmark>> watch(String serverId, String itemId) {
    final key = _key(serverId, itemId);
    final controller = _controllers.putIfAbsent(
      key,
      () => StreamController<List<AudiobookBookmark>>.broadcast(),
    );
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

    final client = _resolveClient(serverId);
    if (client != null) {
      unawaited(_syncToMoonbase(client, itemId, next));
    }
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

    final client = _resolveClient(serverId);
    if (client != null) {
      unawaited(_syncToMoonbase(client, itemId, next));
    }
  }

  Future<void> _syncFromMoonbase(
    String serverId,
    String itemId,
    List<AudiobookBookmark> localList,
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
        serverRaw = (response.data as Map)['bookmarks'] as List<dynamic>?;
      } else if (response.data is List) {
        serverRaw = response.data as List<dynamic>?;
      }
      if (serverRaw == null) return;

      final serverBookmarks = <AudiobookBookmark>[];
      for (final item in serverRaw) {
        if (item is Map<String, dynamic>) {
          serverBookmarks.add(AudiobookBookmark.fromJson(item));
        }
      }

      final mergedMap = <int, AudiobookBookmark>{};
      for (final b in localList) {
        mergedMap[b.positionMs] = b;
      }
      for (final b in serverBookmarks) {
        if (!mergedMap.containsKey(b.positionMs)) {
          mergedMap[b.positionMs] = b;
        }
      }

      final mergedList = mergedMap.values.toList()
        ..sort((a, b) => a.positionMs.compareTo(b.positionMs));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        _key(serverId, itemId),
        mergedList.map((b) => jsonEncode(b.toJson())).toList(),
      );
      _notify(serverId, itemId, mergedList);

      if (mergedList.length > serverBookmarks.length) {
        await _syncToMoonbase(client, itemId, mergedList);
      }
    } catch (_) {
      // Gracefully ignore offline/unreachable network errors
    } finally {
      dio.close();
    }
  }

  Future<void> _syncToMoonbase(
    MediaServerClient client,
    String itemId,
    List<AudiobookBookmark> list,
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
        '${client.baseUrl}/Moonfin/Bookmarks/$itemId',
        data: list.map((b) => b.toServerJson()).toList(),
      );
    } catch (_) {
    } finally {
      dio.close();
    }
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
