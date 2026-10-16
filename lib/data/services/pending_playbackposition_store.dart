import 'dart:convert';

import 'package:jellyfin_preference/jellyfin_preference.dart';

/// A userdata update set while the server was unreachable, waiting to be pushed.
class PendingPlaybackPosition {
  final String serverId;
  final String itemId;
  final num? value;

  const PendingPlaybackPosition({
    required this.serverId,
    required this.itemId,
    this.value,
  });

  Map<String, dynamic> toJson() => {
    'serverId': serverId,
    'itemId': itemId,
    'UserData': {
                  'PlaybackPositionTicks': value,
                },
  };

  static PendingPlaybackPosition? fromJson(Map<String, dynamic> json) {
    final serverId = json['serverId'] as String?;
    final itemId = json['itemId'] as String?;
    if (serverId == null || itemId == null) return null;
    return PendingPlaybackPosition(
      serverId: serverId,
      itemId: itemId,
      value: json['UserData']['PlaybackPositionTicks'] as num?,
    );
  }
}

/// Holds new userdata set offline until [SyncService] replays them. One entry per
/// item, so updating twice offline pushes only the final value.
class PendingPlaybackPositionStore {
  static const _storageKey = 'pending_userdata_v1';

  final PreferenceStore _store;

  PendingPlaybackPositionStore(this._store);

  List<PendingPlaybackPosition> get all {
    final raw = _store.getStringList(_storageKey) ?? const <String>[];
    final entries = <PendingPlaybackPosition>[];
    for (final line in raw) {
      try {
        final decoded = jsonDecode(line);
        if (decoded is! Map<String, dynamic>) continue;
        final entry = PendingPlaybackPosition.fromJson(decoded);
        if (entry != null) entries.add(entry);
      } catch (_) {}
    }
    return entries;
  }

  Future<void> put(PendingPlaybackPosition entry) async {
    final next = [
      for (final existing in all)
        if (existing.serverId != entry.serverId ||
            existing.itemId != entry.itemId)
          existing,
      entry,
    ];
    await _save(next);
  }

  Future<void> remove(String serverId, String itemId) async {
    final next = all
    .where((e) => e.serverId != serverId || e.itemId != itemId)
    .toList();
    await _save(next);
  }

  Future<void> _save(List<PendingPlaybackPosition> entries) async {
    await _store.setStringList(_storageKey, [
      for (final entry in entries) jsonEncode(entry.toJson()),
    ]);
  }
}
