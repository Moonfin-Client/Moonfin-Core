import '../models/aggregated_item.dart';
import '../models/download_source.dart';
import 'auto_download_planner.dart';

/// A completed download the remove-watched rule may consider, with what the
/// downloads database knows about it.
typedef RemoveWatchedCandidate = ({
  AggregatedItem item,
  DateTime? downloadedAt,
  bool progressSynced,
  DownloadSource source,
});

/// Item types the remove-watched rule touches. Music and books are listened
/// to or read again, so they stay.
const removeWatchedTypes = {'Episode', 'Movie'};

/// Decides which downloads the remove-watched rule deletes.
///
/// Pure: the caller snapshots one server's completed downloads after the
/// metadata refresh, so each item's played state is the server's.
///
/// - Only episodes and movies the user downloaded by hand are judged.
///   Smart downloads and followed series remove what they queued by their
///   own settings.
/// - They are deleted once the server says they are played and
///   [deleteAfter] has passed since the last play.
/// - A download whose offline progress has not reached the server yet waits:
///   the server is what says it was watched.
/// - The play has to come after the download finished, and after
///   [watchedAfter], when the setting was turned on, so turning it on never
///   empties what the user already watched and kept. Without both dates
///   there is no telling a fresh watch from a download kept to rewatch, so
///   it stays.
/// - Ids in [keptIds] stay: an item id keeps that item, a series id keeps
///   every episode of the series.
/// - The item in [playingItemId] waits for the next pass: servers flip
///   Played near the end of playback, while the file is open.
List<AggregatedItem> planRemoveWatched(
  List<RemoveWatchedCandidate> candidates, {
  required Duration deleteAfter,
  required DateTime now,
  DateTime? watchedAfter,
  Set<String> keptIds = const {},
  String? playingItemId,
}) => [
  for (final c in candidates)
    if (_removable(c, deleteAfter, now, watchedAfter, keptIds, playingItemId))
      c.item,
];

bool _removable(
  RemoveWatchedCandidate candidate,
  Duration deleteAfter,
  DateTime now,
  DateTime? watchedAfter,
  Set<String> keptIds,
  String? playingItemId,
) {
  final item = candidate.item;
  if (candidate.source != DownloadSource.manual) return false;
  if (!removeWatchedTypes.contains(item.type)) return false;
  if (!item.isPlayed || !candidate.progressSynced) return false;
  if (item.id == playingItemId || isKeptDownload(item, keptIds)) return false;
  final playedAt = item.lastPlayedDate;
  final downloadedAt = candidate.downloadedAt;
  if (playedAt == null ||
      downloadedAt == null ||
      !playedAt.isAfter(downloadedAt) ||
      (watchedAfter != null && !playedAt.isAfter(watchedAfter))) {
    return false;
  }
  return watchedLongEnough(item, deleteAfter, now);
}
