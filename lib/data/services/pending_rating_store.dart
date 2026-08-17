import 'dart:convert';

import 'package:jellyfin_preference/jellyfin_preference.dart';

/// A rating set while the server was unreachable, waiting to be pushed.
///
/// Exactly one of the shapes applies: [clear] removes the rating, [rating]
/// carries a numeric score out of 10, and [likes] carries a thumbs value.
class PendingRating {
  final String serverId;
  final String itemId;
  final bool? likes;
  final double? rating;
  final bool clear;

  const PendingRating({
    required this.serverId,
    required this.itemId,
    this.likes,
    this.rating,
    this.clear = false,
  });

  Map<String, dynamic> toJson() => {
    'serverId': serverId,
    'itemId': itemId,
    if (likes != null) 'likes': likes,
    if (rating != null) 'rating': rating,
    if (clear) 'clear': clear,
  };

  static PendingRating? fromJson(Map<String, dynamic> json) {
    final serverId = json['serverId'] as String?;
    final itemId = json['itemId'] as String?;
    if (serverId == null || itemId == null) return null;
    return PendingRating(
      serverId: serverId,
      itemId: itemId,
      likes: json['likes'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      clear: json['clear'] as bool? ?? false,
    );
  }
}

/// Holds ratings set offline until [SyncService] replays them. One entry per
/// item, so rating twice offline pushes only the final value.
class PendingRatingStore {
  static const _storageKey = 'pending_ratings_v1';

  final PreferenceStore _store;

  PendingRatingStore(this._store);

  List<PendingRating> get all {
    final raw = _store.getStringList(_storageKey) ?? const <String>[];
    final entries = <PendingRating>[];
    for (final line in raw) {
      try {
        final decoded = jsonDecode(line);
        if (decoded is! Map<String, dynamic>) continue;
        final entry = PendingRating.fromJson(decoded);
        if (entry != null) entries.add(entry);
      } catch (_) {}
    }
    return entries;
  }

  Future<void> put(PendingRating entry) async {
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

  Future<void> _save(List<PendingRating> entries) async {
    await _store.setStringList(_storageKey, [
      for (final entry in entries) jsonEncode(entry.toJson()),
    ]);
  }
}
