import '../models/aggregated_item.dart';

/// Utilities for deduplicating media items across libraries and servers,
/// as well as formatting version labels based on library counts.
class MediaDeduplicationUtils {
  MediaDeduplicationUtils._();

  /// Returns a canonical deduplication key for an item.
  ///
  /// Prefers external provider IDs (IMDb, TMDb, TVDb). Fallbacks to
  /// `Type|NormalizedTitle|ProductionYear` if no external IDs are present.
  static String getDeduplicationKey(AggregatedItem item) {
    final imdb = item.imdbId?.trim().toLowerCase();
    if (imdb != null && imdb.isNotEmpty) {
      return 'imdb:$imdb';
    }

    final tmdb = item.tmdbId?.trim().toLowerCase();
    if (tmdb != null && tmdb.isNotEmpty) {
      return 'tmdb:$tmdb';
    }

    final tvdb = item.providerIds['Tvdb'] ??
        item.providerIds['tvdb'] ??
        item.providerIds['TVDB'];
    if (tvdb != null && tvdb.trim().isNotEmpty) {
      return 'tvdb:${tvdb.trim().toLowerCase()}';
    }

    final normType = (item.type ?? '').trim().toLowerCase();
    final normName = item.name.trim().toLowerCase();
    final year = item.productionYear ?? '';
    return '$normType|$normName|$year';
  }

  /// Deduplicates a list of [AggregatedItem]s based on their deduplication key.
  ///
  /// For items with duplicate keys, the representative item chosen is the one
  /// with the most recent playback progress (highest [playbackPositionTicks]),
  /// or marked played/favorite, preserving the original appearance order.
  static List<AggregatedItem> deduplicateMediaItems(List<AggregatedItem> items) {
    if (items.length <= 1) return items;

    final groups = <String, List<AggregatedItem>>{};
    final keyOrder = <String>[];

    for (final item in items) {
      final key = getDeduplicationKey(item);
      if (!groups.containsKey(key)) {
        groups[key] = [];
        keyOrder.add(key);
      }
      groups[key]!.add(item);
    }

    final result = <AggregatedItem>[];

    for (final key in keyOrder) {
      final group = groups[key]!;
      if (group.length == 1) {
        result.add(group.first);
      } else {
        // Pick best representative item: highest playback position or played status
        group.sort((a, b) {
          final aTicks = a.playbackPositionTicks ?? 0;
          final bTicks = b.playbackPositionTicks ?? 0;
          if (aTicks != bTicks) return bTicks.compareTo(aTicks);

          if (a.isPlayed != b.isPlayed) return a.isPlayed ? -1 : 1;
          if (a.isFavorite != b.isFavorite) return a.isFavorite ? -1 : 1;

          return 0;
        });
        result.add(group.first);
      }
    }

    return result;
  }

  /// Formats a version option label for the details screen version selector.
  ///
  /// If [hasMultipleLibrariesForType] is true and [libraryName] is provided,
  /// prefixes the label as `[Library Name] - [Version Name]`.
  /// Otherwise, returns just the version name (or 'Main' if version name is empty).
  static String formatVersionLabel({
    required String? libraryName,
    required String? versionLabel,
    required bool hasMultipleLibrariesForType,
  }) {
    final cleanVersion = (versionLabel != null && versionLabel.trim().isNotEmpty)
        ? versionLabel.trim()
        : 'Main';

    final cleanLib = libraryName?.trim();

    if (hasMultipleLibrariesForType && cleanLib != null && cleanLib.isNotEmpty) {
      if (cleanVersion == 'Main') {
        return cleanLib;
      }
      return '$cleanLib - $cleanVersion';
    }

    return cleanVersion;
  }
}
