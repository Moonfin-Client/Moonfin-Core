import 'dart:convert';

import 'package:audio_service/audio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'car_artwork.dart';

/// Snapshot of the most recent audio queue, persisted across process death.
class LastPlaybackSession {
  final String serverId;
  final List<String> itemIds;
  final int index;
  final int positionMs;
  final String title;
  final String? artist;
  final String? artUri;
  final bool isAudiobook;

  const LastPlaybackSession({
    required this.serverId,
    required this.itemIds,
    required this.index,
    required this.positionMs,
    required this.title,
    this.artist,
    this.artUri,
    this.isAudiobook = false,
  });

  Map<String, dynamic> toJson() => {
        'serverId': serverId,
        'itemIds': itemIds,
        'index': index,
        'positionMs': positionMs,
        'title': title,
        'artist': artist,
        'artUri': artUri,
        'isAudiobook': isAudiobook,
      };

  static LastPlaybackSession? fromJson(Map<String, dynamic> json) {
    final serverId = json['serverId'] as String?;
    final itemIds =
        (json['itemIds'] as List?)?.whereType<String>().toList() ?? const [];
    if (serverId == null || serverId.isEmpty || itemIds.isEmpty) return null;
    return LastPlaybackSession(
      serverId: serverId,
      itemIds: itemIds,
      index: (json['index'] as num?)?.toInt() ?? 0,
      positionMs: (json['positionMs'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      artist: json['artist'] as String?,
      artUri: json['artUri'] as String?,
      isAudiobook: json['isAudiobook'] as bool? ?? false,
    );
  }

  String get currentItemId =>
      itemIds[index.clamp(0, itemIds.length - 1).toInt()];
}

/// Persists the last audio queue so Android Auto's media-resumption card and
/// an empty-queue play command (steering wheel / Bluetooth) can restore
/// playback after the process dies.
class LastPlaybackSessionStore {
  static const _key = 'last_playback_session';
  static const _maxQueueIds = 100;

  Future<void> save(LastPlaybackSession session) async {
    final prefs = await SharedPreferences.getInstance();
    var toStore = session;
    if (session.itemIds.length > _maxQueueIds) {
      // Keep a window around the current index so resume stays meaningful.
      final start = (session.index - _maxQueueIds ~/ 2)
          .clamp(0, session.itemIds.length - _maxQueueIds)
          .toInt();
      toStore = LastPlaybackSession(
        serverId: session.serverId,
        itemIds: session.itemIds.sublist(start, start + _maxQueueIds),
        index: session.index - start,
        positionMs: session.positionMs,
        title: session.title,
        artist: session.artist,
        artUri: session.artUri,
        isAudiobook: session.isAudiobook,
      );
    }
    await prefs.setString(_key, jsonEncode(toStore.toJson()));
  }

  Future<LastPlaybackSession?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return null;
    try {
      return LastPlaybackSession.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  /// The 0..1 playable items served for the `recent` browse root, which
  /// Android's media-resumption card queries after process death.
  Future<List<MediaItem>> asRecentMediaItems() async {
    final session = await load();
    if (session == null) return const [];
    return [
      MediaItem(
        id: session.isAudiobook
            ? 'book|${session.serverId}|${session.currentItemId}'
            : 'track|${session.serverId}|${session.currentItemId}|-|-',
        title: session.title,
        artist: session.artist,
        artUri: CarArtwork.instance.wrap(session.artUri),
        playable: true,
        extras: {'serverId': session.serverId},
      ),
    ];
  }
}
