import '../models/aggregated_item.dart';

/// Collapses the same title arriving from more than one library or server into
/// a single card.
class MediaDeduplicationUtils {
  MediaDeduplicationUtils._();

  /// Matched in this order, and case insensitively, because the server spells
  /// them differently between versions.
  static const _providerPriority = ['imdb', 'tmdb', 'tvdb'];

  /// A key two items share only when they are certainly the same title.
  ///
  /// Only an external provider id can say that. Titles can't: every series has
  /// a Season 1, plenty of episodes are called Pilot, and Greatest Hits is a
  /// whole genre of album. So an item without one gets a key of its own and
  /// never merges.
  static String getDeduplicationKey(AggregatedItem item) {
    final providerIds = item.providerIds;
    for (final provider in _providerPriority) {
      for (final entry in providerIds.entries) {
        if (entry.key.trim().toLowerCase() != provider) continue;
        final value = entry.value.trim().toLowerCase();
        if (value.isNotEmpty) return '$provider:$value';
      }
    }
    return 'item:${item.serverId}:${item.id}';
  }

  /// Keeps one card per title, in the order the titles first appear.
  static List<AggregatedItem> deduplicateMediaItems(
    List<AggregatedItem> items,
  ) {
    // Replacing a value leaves the key where it was, so the map already holds
    // first-appearance order.
    final best = <String, AggregatedItem>{};
    for (final item in items) {
      final key = getDeduplicationKey(item);
      final incumbent = best[key];
      if (incumbent == null || _isBetterRepresentative(item, incumbent)) {
        best[key] = item;
      }
    }

    return best.values.toList();
  }

  /// Whether [candidate] should represent the title instead of [incumbent]. The
  /// copy the user is furthest through wins, then played, then favorite, so the
  /// card still reflects their state. Ties fall back to the ids so the winner is
  /// the same on every run.
  static bool _isBetterRepresentative(
    AggregatedItem candidate,
    AggregatedItem incumbent,
  ) {
    final candidateTicks = candidate.playbackPositionTicks ?? 0;
    final incumbentTicks = incumbent.playbackPositionTicks ?? 0;
    if (candidateTicks != incumbentTicks) return candidateTicks > incumbentTicks;

    if (candidate.isPlayed != incumbent.isPlayed) return candidate.isPlayed;
    if (candidate.isFavorite != incumbent.isFavorite) return candidate.isFavorite;

    final byServer = candidate.serverId.compareTo(incumbent.serverId);
    if (byServer != 0) return byServer < 0;
    return candidate.id.compareTo(incumbent.id) < 0;
  }
}
