import '../../util/episode_playability.dart';
import '../../util/season_queue_context.dart';
import '../models/aggregated_item.dart';

/// What one auto-download check decided for a single series.
class AutoDownloadPlan {
  const AutoDownloadPlan({
    this.toQueue = const [],
    this.toDelete = const [],
    this.blocked = const [],
  });

  /// Unwatched episodes to download, oldest first.
  final List<AggregatedItem> toQueue;

  /// Auto-downloaded episodes the user has since watched.
  final List<AggregatedItem> toDelete;

  /// Episodes that were in line but did not fit the storage budget, in
  /// order; nothing after the first misfit is queued, so the order holds.
  final List<AggregatedItem> blocked;

  /// The storage budget left no room for the next episode in line.
  bool get storageFull => blocked.isNotEmpty;
}

/// Decides what an auto-download subscription should queue and delete.
///
/// Pure: every input is a snapshot the caller took from the server, the
/// downloads database and the download queue, so two checks that run at the
/// same time from different processes reach the same answer.
///
/// - Only episodes that reached the server (or aired) after [newSince] are
///   candidates: following a series is about what comes next, and the
///   backlog belongs to the manual "all unwatched episodes" download.
/// - Specials (season 0) and missing or unaired episodes are never queued.
/// - [keepUnwatched] caps how many unwatched episodes of the series may be
///   downloaded or in flight at once, backlog the user fetched by hand
///   included; null means no cap.
/// - Episodes are queued oldest first (season, then episode number).
/// - [storageBudgetBytes] is the space still allowed under the storage limit,
///   null when unlimited. Queueing stops at the first episode that does not
///   fit rather than skipping ahead to smaller ones, so the order stays
///   chronological.
/// - Only episodes in [autoOwnedIds] are ever deleted: those the server says
///   are played, once [deleteAfter] has passed since the last play (null
///   never deletes). The one in [playingItemId] waits for the next check:
///   servers flip Played near the end of playback, while the file is open.
AutoDownloadPlan planAutoDownload({
  required List<AggregatedItem> episodes,
  required int? keepUnwatched,
  required Duration? deleteAfter,
  required DateTime now,
  required Set<String> downloadedIds,
  required Set<String> inFlightIds,
  required Set<String> autoOwnedIds,
  required int? storageBudgetBytes,
  required int Function(AggregatedItem episode) sizeOf,
  required DateTime newSince,
  String? playingItemId,
}) {
  final toDelete = <AggregatedItem>[];
  if (deleteAfter != null) {
    for (final episode in episodes) {
      if (episode.isPlayed &&
          episode.id != playingItemId &&
          autoOwnedIds.contains(episode.id) &&
          downloadedIds.contains(episode.id) &&
          _watchedLongEnough(episode, deleteAfter, now)) {
        toDelete.add(episode);
      }
    }
  }

  var held = 0;
  final queueable = <AggregatedItem>[];
  for (final episode in episodes) {
    if (episode.isPlayed) continue;
    if (downloadedIds.contains(episode.id) ||
        inFlightIds.contains(episode.id)) {
      held++;
    } else if (_isDownloadable(episode) && _isNew(episode, newSince)) {
      queueable.add(episode);
    }
  }
  queueable.sort(_airedOrder);

  final slots = keepUnwatched == null
      ? queueable.length
      : (keepUnwatched - held).clamp(0, queueable.length);

  final wanted = queueable.take(slots).toList();
  final toQueue = <AggregatedItem>[];
  var blocked = const <AggregatedItem>[];
  var budget = storageBudgetBytes;
  for (var i = 0; i < wanted.length; i++) {
    final size = sizeOf(wanted[i]);
    if (budget != null && size > budget) {
      blocked = wanted.sublist(i);
      break;
    }
    if (budget != null) budget -= size;
    toQueue.add(wanted[i]);
  }

  return AutoDownloadPlan(
    toQueue: toQueue,
    toDelete: toDelete,
    blocked: blocked,
  );
}

/// Specials are never queued; placeholders, unaired episodes and episodes
/// without a playable source use the same rule as next-up.
bool _isDownloadable(AggregatedItem episode) =>
    !isSpecialEpisode(episode) && isEligibleNextEpisodeCandidate(episode);

/// Played at least [delay] ago. Without a last-played date only an
/// immediate delete can be decided; a delayed one waits for the date.
bool _watchedLongEnough(AggregatedItem episode, Duration delay, DateTime now) {
  if (delay == Duration.zero) return true;
  final playedAt = episode.lastPlayedDate;
  return playedAt != null &&
      !now.difference(playedAt).isNegative &&
      now.difference(playedAt) >= delay;
}

/// Added to the library, or aired, at or after [since]. An episode with
/// neither date is treated as backlog.
bool _isNew(AggregatedItem episode, DateTime since) {
  final added = episode.dateCreated ?? episode.premiereDate;
  return added != null && !added.isBefore(since);
}

int _airedOrder(AggregatedItem a, AggregatedItem b) {
  final season = _compareNullable(a.parentIndexNumber, b.parentIndexNumber);
  if (season != 0) return season;
  final episode = _compareNullable(a.indexNumber, b.indexNumber);
  if (episode != 0) return episode;
  return a.id.compareTo(b.id);
}

/// Nulls sort last so numbered episodes always come first.
int _compareNullable(int? a, int? b) {
  if (a == null && b == null) return 0;
  if (a == null) return 1;
  if (b == null) return -1;
  return a.compareTo(b);
}
