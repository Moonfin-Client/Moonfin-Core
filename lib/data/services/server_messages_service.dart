import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../models/server_message.dart';
import 'storage_path_service.dart';

/// Holds the admin messages for the server the user is signed in to, and which
/// ones this user has already read.
/// Messages are cached on disk so the list still opens offline, and so a message
/// posted while the app was closed is there on the next launch. The live event
/// only reaches clients that are running.
class ServerMessagesService extends ChangeNotifier {
  final PreferenceStore _store;
  final Dio _dio;

  List<ServerMessage> _messages = const [];
  Set<String> _readIds = <String>{};
  String? _scopeKey;
  bool _supported = false;

  ServerMessagesService(this._store, {@visibleForTesting Dio? dio})
    : _dio = dio ?? Dio() {
    if (dio == null) {
      configureServerDio(_dio);
      _dio.interceptors.add(redirectInterceptor(_dio));
    }
  }

  /// True when the server plugin has the messages endpoints.
  bool get supported => _supported;

  /// Messages to show, in the order the admin arranged them in Moonbase.
  List<ServerMessage> get messages => _messages;

  int get unreadCount =>
      _messages.where((message) => !_readIds.contains(message.id)).length;

  bool isRead(String id) => _readIds.contains(id);

  /// True when at least one message has not been read yet.
  bool get hasUnread => unreadCount > 0;

  /// Unread messages the admin marked as "open the window".
  List<ServerMessage> get pendingPopups => _messages
      .where(
        (message) =>
            message.delivery == ServerMessageDelivery.popup &&
            !_readIds.contains(message.id),
      )
      .toList();

  void setSupported(bool value) {
    if (_supported == value) return;
    _supported = value;
    notifyListeners();
  }

  /// Loads the cached list, then asks the server for a fresh one.
  Future<void> refresh(MediaServerClient client, {String? serverId}) async {
    _scopeKey = _scopeKeyFor(client, serverId: serverId);
    _readIds = _loadReadIds();

    if (_messages.isEmpty) {
      final cached = await _readCache();
      if (cached.isNotEmpty) {
        _messages = cached;
        notifyListeners();
      }
    }

    if (!_supported) {
      // No plugin, or one without the messages endpoints. The cache above is all
      // we can show.
      return;
    }

    final fetched = await _fetch(client);
    if (fetched == null) {
      // Server unreachable. Keep whatever the cache gave us.
      return;
    }

    _messages = fetched;
    _pruneReadIds();
    await _writeCache(fetched);
    notifyListeners();
  }

  Future<void> markRead(String id) async {
    if (_readIds.contains(id)) return;
    _readIds = {..._readIds, id};
    await _saveReadIds();
    notifyListeners();
  }

  /// Marks the "open the window" messages as read in one go. Showing them counts
  /// as reading them, otherwise the window would open again on every refresh.
  Future<void> markPopupsRead() async {
    final ids = pendingPopups.map((message) => message.id).toSet();
    if (ids.isEmpty) return;
    _readIds = {..._readIds, ...ids};
    await _saveReadIds();
    notifyListeners();
  }

  Future<void> markAllRead() async {
    final all = _messages.map((message) => message.id).toSet();
    if (all.difference(_readIds).isEmpty) return;
    _readIds = {..._readIds, ...all};
    await _saveReadIds();
    notifyListeners();
  }

  /// Forgets everything. Called on sign out, so the next user does not inherit
  /// another user's messages.
  void clear() {
    _messages = const [];
    _readIds = <String>{};
    _scopeKey = null;
    _supported = false;
    notifyListeners();
  }

  // Network
  Future<List<ServerMessage>?> _fetch(MediaServerClient client) async {
    final token = client.accessToken;
    if (token == null || token.isEmpty) return null;

    try {
      final response = await _dio.get(
        '${client.baseUrl}/Moonfin/Messages',
        options: Options(
          headers: {
            'Authorization': buildServerAuthorizationHeader(
              scheme: 'MediaBrowser',
              deviceInfo: client.deviceInfo,
              accessToken: token,
            ),
          },
        ),
      );

      return _parse(response.data);
    } catch (_) {
      return null;
    }
  }

  static List<ServerMessage> _parse(dynamic payload) {
    final raw = switch (payload) {
      List() => payload,
      Map() => payload['items'] ?? payload['Items'] ?? const [],
      _ => const [],
    };

    if (raw is! List) return const [];

    final messages = <ServerMessage>[];
    for (final entry in raw) {
      if (entry is! Map) continue;
      final message = ServerMessage.fromJson(Map<String, dynamic>.from(entry));
      if (message != null) messages.add(message);
    }

    return messages;
  }

  // Read state
  /// One key per server and user, so messages read on one server do not look
  /// read on another.
  String _scopeKeyFor(MediaServerClient client, {String? serverId}) {
    final resolvedServer = (serverId?.trim().isNotEmpty ?? false)
        ? serverId!.trim()
        : client.baseUrl.toLowerCase().trim().replaceAll(
            RegExp(r'[^a-z0-9]+'),
            '_',
          );
    final userId = (_store.getString('pref_last_user_id') ?? '').trim();
    return userId.isEmpty ? resolvedServer : '${resolvedServer}_$userId';
  }

  String get _readIdsKey => 'pref_server_messages_read_$_scopeKey';

  Set<String> _loadReadIds() {
    if (_scopeKey == null) return <String>{};
    return (_store.getStringList(_readIdsKey) ?? const <String>[]).toSet();
  }

  Future<void> _saveReadIds() async {
    if (_scopeKey == null) return;
    await _store.setStringList(_readIdsKey, _readIds.toList());
  }

  /// Drops read IDs for messages the server no longer sends, so the list does
  /// not grow forever.
  void _pruneReadIds() {
    final live = _messages.map((message) => message.id).toSet();
    final kept = _readIds.intersection(live);
    if (kept.length == _readIds.length) return;
    _readIds = kept;
    unawaited(_saveReadIds());
  }

  // Disk cache
  Future<File?> _cacheFile() async {
    if (_scopeKey == null) return null;
    try {
      final dir = await GetIt.instance<StoragePathService>()
          .getMessageCacheDir();
      return File('${dir.path}/$_scopeKey.json');
    } catch (_) {
      return null;
    }
  }

  Future<List<ServerMessage>> _readCache() async {
    try {
      final file = await _cacheFile();
      if (file == null || !await file.exists()) return const [];
      return _parse(jsonDecode(await file.readAsString()));
    } catch (_) {
      return const [];
    }
  }

  Future<void> _writeCache(List<ServerMessage> messages) async {
    try {
      final file = await _cacheFile();
      if (file == null) return;
      await file.writeAsString(
        jsonEncode(messages.map((message) => message.toJson()).toList()),
      );
    } catch (_) {}
  }
}
