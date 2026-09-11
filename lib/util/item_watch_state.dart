import '../data/models/aggregated_item.dart';
import '../preference/preference_constants.dart';

typedef ItemWatchState = ({
  bool isFullyWatched,
  bool isFullyUnwatched,
  bool isPartiallyWatched,
  bool hasProgress,
});

/// How far through an item the user is. The watched flags come from unplayed
/// child counts on a container and from the item itself otherwise. Progress
/// follows the resume position, except on a series, which has no position of
/// its own and counts being part way through instead.
ItemWatchState watchStateOf(AggregatedItem item) {
  final isSeries = item.type == 'Series';
  final isContainer =
      item.type == 'Series' ||
      item.type == 'Season' ||
      item.type == 'BoxSet' ||
      item.type == 'MusicAlbum';
  if (!isContainer) {
    final hasProgress =
        (item.playedPercentage ?? 0) > 0 ||
        (item.playbackPosition?.inMilliseconds ?? 0) > 0;
    return (
      isFullyWatched: item.isPlayed,
      isFullyUnwatched: !item.isPlayed && !hasProgress,
      isPartiallyWatched: hasProgress,
      hasProgress: hasProgress,
    );
  }
  final totalEpisodes = isSeries
      ? (item.recursiveItemCount ?? 0)
      : (item.childCount ?? item.recursiveItemCount ?? 0);
  final unplayed = item.unplayedItemCount ?? totalEpisodes;
  final isFullyWatched = item.isPlayed || unplayed == 0;
  final isFullyUnwatched = unplayed == totalEpisodes;
  final isPartiallyWatched = !isFullyWatched && !isFullyUnwatched;
  final hasProgress = isSeries
      ? isPartiallyWatched
      : ((item.playedPercentage ?? 0) > 0 ||
            (item.playbackPosition?.inMilliseconds ?? 0) > 0);
  return (
    isFullyWatched: isFullyWatched,
    isFullyUnwatched: isFullyUnwatched,
    isPartiallyWatched: isPartiallyWatched,
    hasProgress: hasProgress,
  );
}

/// Whether a card shows its watched tick under [behavior]. Containers count as
/// watched-ish while they still have unplayed children, which is what puts the
/// remaining-episode badge on a season or series card.
bool showsWatchedIndicator({
  required WatchedIndicatorBehavior behavior,
  required bool isPlayed,
  required String? itemType,
  int? unplayedCount,
}) {
  final marked = isPlayed || (unplayedCount ?? 0) > 0;

  return switch (behavior) {
    WatchedIndicatorBehavior.always => marked,
    WatchedIndicatorBehavior.hideUnwatched => isPlayed,
    WatchedIndicatorBehavior.episodesOnly => itemType == 'Episode' && marked,
    WatchedIndicatorBehavior.never => false,
  };
}
