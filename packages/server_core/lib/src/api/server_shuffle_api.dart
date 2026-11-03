/// A running server-side shuffle: what plays now and what plays after it,
/// as Jellyfin-shaped items.
class ServerShuffle {
  const ServerShuffle({required this.id, required this.current, this.next});

  final String id;
  final Map<String, dynamic> current;

  /// Null when the shuffle has nothing else (its scope had one item).
  final Map<String, dynamic>? next;
}

/// Optional extra for an `ItemsApi` whose server shuffles a series, season,
/// library or collection itself, with no repeats until everything has played
/// (Silo's shuffles).
///
/// Moonfin otherwise loads every item and shuffles them on the device. With
/// this interface (`itemsApi is ServerShuffleApi`) a shuffle is the server's:
/// it hands out the next item as playback moves on, and the order carries on
/// across sessions and devices.
abstract interface class ServerShuffleApi {
  /// Whether the server can shuffle [item] (a Jellyfin-shaped series,
  /// season, library or collection).
  Future<bool> canShuffle(Map<String, dynamic> item);

  Future<ServerShuffle> startShuffle(Map<String, dynamic> item);

  /// Moves shuffle [shuffleId] on from [fromItemId], the item that was
  /// current. A repeat after a lost answer changes nothing. Null when the
  /// shuffle is gone.
  Future<ServerShuffle?> advanceShuffle(
    String shuffleId, {
    required String fromItemId,
  });
}
