import '../data/models/aggregated_item.dart';

/// What an episode needs to stand in a playback queue: its streams, so audio
/// and subtitle picks carry over onto it, and its chapters for the player.
const kSeasonQueueEpisodeFields =
    'Type,UserData,SeriesName,ParentIndexNumber,IndexNumber,SeriesId,SeasonId,'
    'MediaSources,MediaStreams,RunTimeTicks,Chapters';

/// Servers file specials under season 0, but a special with AirsBefore/AirsAfter
/// metadata is displayed — and played — inside another season once the library
/// has DisplaySpecialsWithinSeasons on. Its own SeasonId therefore says nothing
/// about which season's queue it belongs to.
bool isSpecialEpisode(AggregatedItem item) => item.parentIndexNumber == 0;

/// Prerolls are stitched into the queue alongside the episodes and say nothing
/// about which season it represents.
bool isPrerollQueueItem(AggregatedItem item) =>
    item.rawData['__moonfinIsPreroll'] == true;

bool _isEpisode(AggregatedItem item) =>
    item.type?.trim().toLowerCase() == 'episode';

/// The `seasonContext` a link should carry: nothing when the season is the
/// episode's own, since that is what the item already resolves to.
String? seasonContextParam({
  required String? contextSeasonId,
  required String? episodeSeasonId,
}) {
  if (contextSeasonId == null || contextSeasonId.isEmpty) return null;
  if (contextSeasonId == episodeSeasonId) return null;
  return contextSeasonId;
}

/// The season a queue actually represents, read off its first regular episode.
/// Null when the queue holds nothing but specials, which is what playing from
/// the Specials season itself produces.
({String seasonId, int seasonNumber})? resolveQueueSeason(
  List<AggregatedItem> queueItems,
) {
  for (final item in queueItems) {
    if (isPrerollQueueItem(item)) continue;
    if (!_isEpisode(item) || isSpecialEpisode(item)) continue;
    final seasonId = item.seasonId;
    final seasonNumber = item.parentIndexNumber;
    if (seasonId == null || seasonId.isEmpty || seasonNumber == null) continue;
    return (seasonId: seasonId, seasonNumber: seasonNumber);
  }
  return null;
}

/// Whether every item is an episode of this one season. Specials count as
/// members wherever they are inlined, so a queue of [S2E1 … S2E13, special]
/// still reads as season 2 and can roll over into season 3.
bool isSeasonScopedEpisodeQueue(
  List<AggregatedItem> queueItems, {
  required String seriesId,
  required String seasonId,
  required int seasonNumber,
}) {
  if (queueItems.isEmpty) return false;

  var sawEpisode = false;
  for (final item in queueItems) {
    if (isPrerollQueueItem(item)) continue;
    if (!_isEpisode(item)) return false;
    sawEpisode = true;
    if (item.seriesId != seriesId) return false;
    if (isSpecialEpisode(item)) continue;

    final itemSeasonId = item.seasonId;
    if (itemSeasonId != null && itemSeasonId.isNotEmpty) {
      if (itemSeasonId != seasonId) return false;
      continue;
    }

    if (item.parentIndexNumber != seasonNumber) return false;
  }

  return sawEpisode;
}

/// Ordering for a season-scoped episode list.
///
/// Where a special sits among regular episodes is the air order the server
/// worked out from its AirsBefore/AirsAfter metadata, so a mixed list is left
/// exactly as it arrived — sorting by season number would drag the special to
/// the front, which is not where an airs-after one belongs. Every other list
/// keeps the defensive sort, including the Specials season itself: specials
/// with no placement carry nothing to preserve, and not every backend
/// guarantees an order.
List<AggregatedItem> orderSeasonEpisodes(List<AggregatedItem> episodes) {
  final ordered = List<AggregatedItem>.from(episodes);
  final inlinesSpecials =
      ordered.any(isSpecialEpisode) &&
      ordered.any((episode) => !isSpecialEpisode(episode));
  if (inlinesSpecials) return ordered;

  ordered.sort((a, b) {
    final seasonCmp = (a.parentIndexNumber ?? 0).compareTo(
      b.parentIndexNumber ?? 0,
    );
    if (seasonCmp != 0) return seasonCmp;
    final episodeCmp = (a.indexNumber ?? 0).compareTo(b.indexNumber ?? 0);
    if (episodeCmp != 0) return episodeCmp;
    return a.id.compareTo(b.id);
  });
  return ordered;
}

/// Whether [completedItem] was the last thing this season had to play, which
/// is what lets playback roll on into the next one.
bool isSeasonFinale(
  AggregatedItem completedItem,
  List<AggregatedItem> seasonEpisodes,
) {
  if (seasonEpisodes.isEmpty) return false;

  final completedId = completedItem.id;
  if (seasonEpisodes.last.id == completedId) return true;

  final completedAt = seasonEpisodes.indexWhere((e) => e.id == completedId);
  if (completedAt >= 0) {
    // Only a regular episode still to come holds the season open. A trailing
    // special is an inlined extra, and the queue reached its end without it,
    // so waiting on it would strand playback here instead of moving on.
    return seasonEpisodes.skip(completedAt + 1).every(isSpecialEpisode);
  }

  // A special numbers itself against the Specials season, so its IndexNumber
  // carries no meaning next to this season's episode numbers.
  if (isSpecialEpisode(completedItem)) return false;

  final completedIndex = completedItem.indexNumber;
  if (completedIndex == null) return false;

  int? maxEpisodeIndex;
  for (final episode in seasonEpisodes) {
    final idx = episode.indexNumber;
    if (idx == null) continue;
    if (maxEpisodeIndex == null || idx > maxEpisodeIndex) {
      maxEpisodeIndex = idx;
    }
  }

  return maxEpisodeIndex != null && completedIndex >= maxEpisodeIndex;
}
