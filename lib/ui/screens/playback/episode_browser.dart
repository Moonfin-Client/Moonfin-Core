import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/utils/blocked_ratings.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/episode_playability.dart';
import '../../../util/season_queue_context.dart';

const _episodeFields = '$kSeasonQueueEpisodeFields,Overview';

/// Only an episode of a series has a season to browse, so a movie, a channel
/// or a track never gets the button. Nor does a download playing offline, or a
/// SyncPlay group, which never hears about a pick that restarts the queue.
bool canBrowseEpisodes(
  dynamic item, {
  bool offline = false,
  bool inSyncPlay = false,
}) =>
    !offline &&
    !inSyncPlay &&
    item is AggregatedItem &&
    item.type == 'Episode' &&
    (item.seriesId?.isNotEmpty ?? false);

/// The seasons of the series that is playing and the episodes of the open
/// one, for the player's episode browser.
///
/// One lives as long as playback stays on the same series, so opening the
/// browser again draws at once from what it holds while the server is asked
/// again, since watched marks move as the viewer watches.
class EpisodeBrowserController extends ChangeNotifier {
  EpisodeBrowserController({
    required this.client,
    required AggregatedItem playing,
  }) : serverId = playing.serverId,
       seriesId = playing.seriesId ?? '',
       _playing = playing,
       _selectedSeasonId = _seasonIdOf(playing);

  final MediaServerClient client;
  final String serverId;
  final String seriesId;

  AggregatedItem _playing;
  String? _selectedSeasonId;
  List<AggregatedItem>? _seasons;
  final _episodesBySeason = <String, List<AggregatedItem>>{};
  final _failedSeasons = <String>{};
  final _requestedSeasons = <String>{};
  // Bumped on every open and close, so an answer to an earlier request is
  // dropped rather than replacing a list a newer one fetched.
  int _generation = 0;
  bool _disposed = false;

  AggregatedItem get playing => _playing;
  String? get selectedSeasonId => _selectedSeasonId;
  List<AggregatedItem>? get seasons => _seasons;

  /// The open season's episodes without the ones a blocked rating hides, or
  /// null while they're still on their way.
  List<AggregatedItem>? get episodes {
    final list = _episodesBySeason[_selectedSeasonId];
    if (list == null) return null;
    return withoutBlockedItems(list, fallbackRating: _playing.officialRating);
  }

  bool get failed =>
      !_episodesBySeason.containsKey(_selectedSeasonId) &&
      _failedSeasons.contains(_selectedSeasonId);

  bool isFor(AggregatedItem item) =>
      item.serverId == serverId && item.seriesId == seriesId;

  void open(AggregatedItem playing) {
    _generation++;
    _requestedSeasons.clear();
    _failedSeasons.clear();
    _playing = playing;
    _selectedSeasonId = _seasonIdOf(playing) ?? _selectedSeasonId;
    notifyListeners();
    _loadSeason(_selectedSeasonId);
    unawaited(_loadSeasons(_generation));
  }

  void close() => _generation++;

  void selectSeason(String seasonId) {
    if (seasonId == _selectedSeasonId) return;
    _selectedSeasonId = seasonId;
    notifyListeners();
    _loadSeason(seasonId);
  }

  /// Plays [episode] in place of what's on, with the rest of its season queued
  /// behind it. One the viewer was part way through carries on from there.
  /// Returns false for the episode that's already playing, or one that's no
  /// longer listed, since either only needs the browser closed.
  Future<bool> play(PlaybackManager manager, AggregatedItem episode) async {
    if (episode.id == _playing.id) return false;
    final season = episodes ?? const <AggregatedItem>[];
    final index = season.indexWhere((candidate) => candidate.id == episode.id);
    if (index < 0) return false;
    await manager.playItems(
      season,
      startIndex: index,
      startPosition: episode.playbackPosition ?? Duration.zero,
      carryTrackSelections: true,
    );
    return true;
  }

  Future<void> _loadSeasons(int generation) async {
    try {
      final data = await client.itemsApi.getSeasons(seriesId);
      if (generation != _generation || _disposed) return;
      final seasons = _mapItems(data);
      _seasons = seasons;
      // The playing season stays open unless the server no longer lists it.
      if (seasons.isNotEmpty &&
          !seasons.any((season) => season.id == _selectedSeasonId)) {
        _selectedSeasonId = seasons.first.id;
        _loadSeason(_selectedSeasonId);
      }
      notifyListeners();
    } catch (_) {
      // The tabs stay hidden and the playing season still shows.
    }
  }

  void _loadSeason(String? seasonId) {
    if (seasonId == null || !_requestedSeasons.add(seasonId)) return;
    final generation = _generation;
    unawaited(() async {
      try {
        final data = await client.itemsApi.getEpisodes(
          seriesId,
          seasonId: seasonId,
          fields: _episodeFields,
        );
        if (generation != _generation || _disposed) return;
        _episodesBySeason[seasonId] = orderSeasonEpisodes(
          _mapItems(data).where(isEligibleNextEpisodeCandidate).toList(),
        );
        _failedSeasons.remove(seasonId);
      } catch (_) {
        if (generation != _generation || _disposed) return;
        _failedSeasons.add(seasonId);
      }
      notifyListeners();
    }());
  }

  List<AggregatedItem> _mapItems(Map<String, dynamic> data) => [
    for (final raw
        in ((data['Items'] as List?) ?? const [])
            .whereType<Map<String, dynamic>>())
      if (raw['Id'] != null)
        AggregatedItem(
          id: raw['Id'].toString(),
          serverId: serverId,
          rawData: raw,
        ),
  ];

  static String? _seasonIdOf(AggregatedItem item) =>
      item.seasonId ?? item.rawData['ParentId']?.toString();

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}

/// "Season 2 · Episode 5", leaving out whichever number the server has none for.
String episodeBrowserLine(AppLocalizations l10n, AggregatedItem episode) {
  final season = episode.parentIndexNumber;
  final number = episode.indexNumber;
  return [
    if (season != null) season == 0 ? l10n.specials : l10n.seasonNumber(season),
    if (number != null) l10n.episodeNumber(number),
  ].join(' · ');
}

String episodeBrowserSeasonLabel(AppLocalizations l10n, AggregatedItem season) {
  if (season.name.isNotEmpty) return season.name;
  final number = season.indexNumber ?? 0;
  return number == 0 ? l10n.specials : l10n.seasonNumber(number);
}

String? episodeStillUrl(
  ImageApi imageApi,
  AggregatedItem episode, {
  required int maxWidth,
}) {
  final tag = episode.primaryImageTag;
  if (tag == null || tag.isEmpty) return null;
  return imageApi.getPrimaryImageUrl(episode.id, maxWidth: maxWidth, tag: tag);
}

/// How far through an episode is, from 0 to 1. The position over the runtime
/// stands in when the server sends no percentage.
double episodeProgress(AggregatedItem episode) {
  var percent = episode.playedPercentage ?? 0;
  final position = episode.playbackPositionTicks ?? 0;
  final runtime = episode.runTimeTicks ?? 0;
  if (percent <= 0 && position > 0 && runtime > 0) {
    percent = position / runtime * 100;
  }
  return (percent / 100).clamp(0.0, 1.0);
}
