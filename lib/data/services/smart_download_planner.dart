import 'dart:math' as math;

import '../../util/season_queue_context.dart';
import '../models/aggregated_item.dart';
import 'auto_download_planner.dart';

/// Decides what smart downloads should do in one series: keep the episodes
/// after the furthest one watched downloaded, and delete downloaded episodes
/// once they are watched.
///
/// Pure, like [planAutoDownload]: the caller snapshots the server's
/// episodes, the downloads database and the queue.
///
/// - [finishedRecently] says an episode of the series, streamed or
///   downloaded, was finished since the last check. That is what starts a
///   top-up; nothing is queued for a series nobody is watching.
/// - [downloadedAt] maps each completed download of the series to when it
///   finished. A download is swapped out once the server says it was played
///   after that and after [since] (when smart downloads was turned on), so a
///   download of something already watched, kept to rewatch, stays.
/// - The episode in [playingItemId] counts as unwatched until the next
///   check: servers flip Played near the end of playback, while the file is
///   open. Specials are left alone.
/// - The series is topped up to [keepReady] unwatched episodes downloaded or
///   in flight after the furthest episode watched, and each download watched
///   after [playedSince] (the last top-up) is replaced at least one for one;
///   one watched before it was already replaced and is only deleted.
AutoDownloadPlan planSmartDownload({
  required List<AggregatedItem> episodes,
  required Map<String, DateTime?> downloadedAt,
  required Set<String> inFlightIds,
  required int keepReady,
  required int? storageBudgetBytes,
  required int Function(AggregatedItem episode) sizeOf,
  required DateTime since,
  DateTime? playedSince,
  bool finishedRecently = false,
  String? playingItemId,
}) {
  final ordered = [
    for (final episode in episodes)
      if (!isSpecialEpisode(episode)) episode,
  ]..sort(airedOrder);
  bool played(AggregatedItem e) => e.isPlayed && e.id != playingItemId;

  final watched = [
    for (final episode in ordered)
      if (played(episode) &&
          downloadedAt.containsKey(episode.id) &&
          watchedSinceDownload(episode, downloadedAt[episode.id], since))
        episode,
  ];
  final replacing = playedSince == null
      ? watched.length
      : watched.where((e) => e.lastPlayedDate!.isAfter(playedSince)).length;
  final furthest = ordered.lastIndexWhere(played);
  if (furthest < 0 || (watched.isEmpty && !finishedRecently)) {
    return AutoDownloadPlan(toDelete: watched);
  }

  var held = 0;
  final queueable = <AggregatedItem>[];
  for (final episode in ordered.skip(furthest + 1)) {
    if (played(episode)) continue;
    if (downloadedAt.containsKey(episode.id) ||
        inFlightIds.contains(episode.id)) {
      held++;
    } else if (isDownloadableEpisode(episode)) {
      queueable.add(episode);
    }
  }

  // The swapped episodes are deleted before anything is queued, so their
  // space counts toward the budget.
  final budget = storageBudgetBytes == null
      ? null
      : storageBudgetBytes + watched.fold<int>(0, (sum, e) => sum + sizeOf(e));
  final (toQueue, blocked) = fitStorageBudget(
    queueable.take(math.max(replacing, keepReady - held)).toList(),
    budgetBytes: budget,
    sizeOf: sizeOf,
  );

  return AutoDownloadPlan(
    toQueue: toQueue,
    toDelete: watched,
    blocked: blocked,
  );
}

/// Played, and last played after the download finished and after [since].
/// Without either date there is no telling a fresh watch from a rewatch, so
/// it stays.
bool watchedSinceDownload(
  AggregatedItem episode,
  DateTime? downloadedAt,
  DateTime since,
) {
  final playedAt = episode.lastPlayedDate;
  return episode.isPlayed &&
      playedAt != null &&
      downloadedAt != null &&
      playedAt.isAfter(downloadedAt) &&
      playedAt.isAfter(since);
}
