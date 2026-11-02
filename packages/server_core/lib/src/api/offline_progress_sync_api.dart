/// A server that takes progress recorded offline in one request (Silo's
/// `POST /sync/progress`), instead of a stop report or a "played" call per
/// item.
abstract interface class OfflineProgressSyncApi {
  /// Applies [entries], in order. Answers, per entry and in the same order,
  /// whether the server took it. A request that fails as a whole throws.
  Future<List<bool>> syncOfflineProgress(List<OfflineProgressEntry> entries);

  /// Most entries one call takes.
  int get offlineProgressBatchLimit;
}

/// Progress on one item, recorded while offline.
class OfflineProgressEntry {
  const OfflineProgressEntry({
    required this.itemId,
    required this.position,
    required this.runtime,
    required this.played,
    required this.recordedAt,
  });

  final String itemId;

  /// Where playback stopped. Ignored when [played].
  final Duration position;

  /// The item's length, which a played item needs (it is sent as having
  /// reached the end).
  final Duration runtime;

  /// Played to the end.
  final bool played;

  /// When the progress was recorded, or as near as is known.
  final DateTime recordedAt;
}
