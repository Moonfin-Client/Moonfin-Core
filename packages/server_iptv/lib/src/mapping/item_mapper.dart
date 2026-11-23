import '../db/iptv_database.dart';
import '../ids.dart';
import '../iptv_labels.dart';
import '../repositories/watch_state_repository.dart' show WatchStateRepository;
import '../services/vod_title.dart' show splitGenres, splitTitleYear;

/// Translates IPTV catalog rows into the raw item maps the rest of the app
/// consumes.
///
/// Contract notes:
/// - Every `Id` value is a string.
/// - Image URLs travel inside `ImageTags` as absolute `http(s)` URLs, and the
///   IPTV image API returns a tag verbatim when it starts with `http`.
/// - Dates are ISO-8601 UTC with a trailing Z.
class IptvItemMapper {
  static const ticksPerMs = 10000;

  static Map<String, dynamic> emptyItemsResult() => {
    'Items': <Map<String, dynamic>>[],
    'TotalRecordCount': 0,
  };

  static Map<String, dynamic> itemsResult(
    List<Map<String, dynamic>> items, {
    int? totalRecordCount,
  }) {
    return {
      'Items': items,
      'TotalRecordCount': totalRecordCount ?? items.length,
    };
  }

  static String _utc(DateTime value) => value.toUtc().toIso8601String();

  static Map<String, dynamic> channelToMap(
    Channel channel, {
    bool isFavorite = false,
    EpgProgram? currentProgram,
  }) {
    final id = IptvChannelId(
      playlistId: channel.playlistId,
      channelRowId: channel.id,
    ).encode();
    final logo = channel.logoUrl;
    return {
      'Id': id,
      'Name': channel.name,
      'Type': 'TvChannel',
      'MediaType': 'Video',
      'ChannelType': 'TV',
      if (channel.channelNumber != null)
        'ChannelNumber': channel.channelNumber.toString(),
      if (channel.channelNumber != null)
        'Number': channel.channelNumber.toString(),
      'ImageTags': {if (logo != null && logo.isNotEmpty) 'Primary': logo},
      'UserData': {
        'IsFavorite': isFavorite,
        'Played': false,
        'PlaybackPositionTicks': 0,
      },
      if (currentProgram != null)
        'CurrentProgram': programToMap(currentProgram, channel: channel),
    };
  }

  static Map<String, dynamic> programToMap(
    EpgProgram program, {
    required Channel channel,
    bool supportsCatchup = false,
    String? timerId,
  }) {
    return {
      'Id': IptvProgramId(
        programRowId: program.id,
        channelRowId: channel.id,
      ).encode(),
      'ChannelId': IptvChannelId(
        playlistId: channel.playlistId,
        channelRowId: channel.id,
      ).encode(),
      'ChannelName': channel.name,
      'SupportsCatchup': supportsCatchup,
      'TimerId': ?timerId,
      'Name': program.title,
      'Type': 'Program',
      'Overview': ?program.description,
      'StartDate': _utc(program.startTime),
      'EndDate': _utc(program.endTime),
      'IsMovie': program.isMovie,
      'IsSeries': program.isSeries,
      'IsSports': program.isSports,
      'IsNews': program.isNews,
      'IsKids': program.isKids,
      'IsPremiere': false,
      'IsLive': true,
      'EpisodeTitle': ?program.episodeTitle,
      if (program.icon != null && program.icon!.isNotEmpty)
        'ImageTags': {'Primary': program.icon},
      'UserData': {
        'IsFavorite': false,
        'Played': false,
        'PlaybackPositionTicks': 0,
      },
    };
  }

  /// An M3U playlist entry auto-detected as a movie file (a channel row with
  /// `isVod`), surfaced as a `Movie` item. Its id stays a channel id, which
  /// the playback API resolves to the row's direct stream URL.
  static Map<String, dynamic> vodChannelToMap(
    Channel channel, {
    bool isFavorite = false,
  }) {
    final logo = channel.logoUrl;
    final title = splitTitleYear(channel.name);
    return {
      'Id': IptvChannelId(
        playlistId: channel.playlistId,
        channelRowId: channel.id,
      ).encode(),
      'Name': title.title,
      'ProductionYear': ?title.year,
      'Type': 'Movie',
      'MediaType': 'Video',
      'ImageTags': {if (logo != null && logo.isNotEmpty) 'Primary': logo},
      'UserData': userData(isFavorite: isFavorite),
    };
  }

  /// [episodes] counts a series' cached episodes. The detail screen reads a
  /// series' watched state from them, and home drops a series that reports
  /// none, so a series without a cache leaves them out.
  static Map<String, dynamic> vodToMap(
    VodItem item, {
    bool isFavorite = false,
    int positionMs = 0,
    bool played = false,
    ({int total, int played})? episodes,
  }) {
    final isSeries = item.isSeries;
    final id = isSeries
        ? IptvSeriesId(playlistId: item.playlistId, vodRowId: item.id).encode()
        : IptvVodId(playlistId: item.playlistId, vodRowId: item.id).encode();

    final runtimeTicks = item.durationSeconds != null
        ? item.durationSeconds! * 1000 * ticksPerMs
        : null;

    return {
      'Id': id,
      'Name': item.name,
      'Type': isSeries ? 'Series' : 'Movie',
      'MediaType': 'Video',
      'Overview': ?item.plot,
      if (item.year != null) 'ProductionYear': item.year,
      if (item.rating != null) 'CommunityRating': item.rating,
      'RunTimeTicks': ?runtimeTicks,
      if (splitGenres(item.genre) case final genres when genres.isNotEmpty)
        'Genres': genres,
      if (item.tagline != null) 'Taglines': [item.tagline],
      'ImageTags': {
        if (item.streamIcon != null && item.streamIcon!.isNotEmpty)
          'Primary': item.streamIcon,
        if (item.logoUrl != null && item.logoUrl!.isNotEmpty)
          'Logo': item.logoUrl,
      },
      if (item.backdropUrl != null && item.backdropUrl!.isNotEmpty)
        'BackdropImageTags': [item.backdropUrl],
      if (item.tmdbId != null) 'ProviderIds': {'Tmdb': item.tmdbId.toString()},
      if (episodes != null && episodes.total > 0)
        'RecursiveItemCount': episodes.total,
      'UserData': {
        ...userData(
          positionMs: positionMs,
          durationMs: item.durationSeconds != null
              ? item.durationSeconds! * 1000
              : null,
          played:
              played ||
              (episodes != null &&
                  episodes.total > 0 &&
                  episodes.played >= episodes.total),
          isFavorite: isFavorite,
        ),
        if (episodes != null && episodes.total > 0)
          'UnplayedItemCount': episodes.total - episodes.played,
      },
      'DateCreated': _utc(item.addedAt),
    };
  }

  static Map<String, dynamic> seasonToMap(
    SeriesSeason season, {
    required VodItem series,
    required IptvLabels labels,
    int? unplayedCount,
  }) {
    return {
      'Id': IptvSeasonId(
        playlistId: series.playlistId,
        vodRowId: series.id,
        seasonNumber: season.seasonNumber,
      ).encode(),
      'Name': labels.season(season.seasonNumber),
      'Type': 'Season',
      'IndexNumber': season.seasonNumber,
      'SeriesId': IptvSeriesId(
        playlistId: series.playlistId,
        vodRowId: series.id,
      ).encode(),
      'SeriesName': series.name,
      'ImageTags': {
        if (season.coverUrl != null && season.coverUrl!.isNotEmpty)
          'Primary': season.coverUrl
        else if (series.streamIcon != null && series.streamIcon!.isNotEmpty)
          'Primary': series.streamIcon,
      },
      if (season.episodeCount != null) 'ChildCount': season.episodeCount,
      'UserData': {
        ...userData(played: unplayedCount == 0),
        'UnplayedItemCount': ?unplayedCount,
      },
    };
  }

  static Map<String, dynamic> episodeToMap(
    SeriesEpisode episode, {
    required VodItem series,
    int positionMs = 0,
    bool played = false,
  }) {
    final runtimeTicks = episode.durationSeconds != null
        ? episode.durationSeconds! * 1000 * ticksPerMs
        : null;
    return {
      'Id': IptvEpisodeId(
        playlistId: episode.playlistId,
        episodeRowId: episode.id,
      ).encode(),
      'Name': episode.title,
      'Type': 'Episode',
      'MediaType': 'Video',
      'SeriesId': IptvSeriesId(
        playlistId: series.playlistId,
        vodRowId: series.id,
      ).encode(),
      'SeriesName': series.name,
      'SeasonId': IptvSeasonId(
        playlistId: series.playlistId,
        vodRowId: series.id,
        seasonNumber: episode.seasonNumber,
      ).encode(),
      'ParentIndexNumber': episode.seasonNumber,
      if (episode.episodeNumber != null) 'IndexNumber': episode.episodeNumber,
      'Overview': ?episode.plot,
      if (episode.rating != null) 'CommunityRating': episode.rating,
      'RunTimeTicks': ?runtimeTicks,
      if (episode.airDate != null) 'PremiereDate': _utc(episode.airDate!),
      'ImageTags': {
        if (episode.stillUrl != null && episode.stillUrl!.isNotEmpty)
          'Primary': episode.stillUrl
        else if (series.streamIcon != null && series.streamIcon!.isNotEmpty)
          'Primary': series.streamIcon,
      },
      'UserData': userData(
        positionMs: positionMs,
        durationMs: episode.durationSeconds != null
            ? episode.durationSeconds! * 1000
            : null,
        played: played,
      ),
    };
  }

  static Map<String, dynamic> recordingToMap(Recording recording) {
    final durationTicks = recording.durationMs != null
        ? recording.durationMs! * ticksPerMs
        : null;
    return {
      'Id': IptvRecordingId(recordingRowId: recording.id).encode(),
      'Name': recording.title,
      'Type': 'Recording',
      'MediaType': 'Video',
      'Path': recording.filePath,
      'RunTimeTicks': ?durationTicks,
      'StartDate': _utc(recording.startedAt),
      'DateCreated': _utc(recording.startedAt),
      'Status': recording.status,
      'ImageTags': const <String, dynamic>{},
      'UserData': userData(),
    };
  }

  static Map<String, dynamic> timerToMap(
    ScheduledRecording schedule, {
    String? channelName,
  }) {
    return {
      'Id': IptvTimerId(scheduleRowId: schedule.id).encode(),
      'Name': schedule.title,
      'Type': 'Timer',
      'ChannelId': IptvChannelId(
        playlistId: schedule.playlistId,
        channelRowId: schedule.channelId,
      ).encode(),
      'ChannelName': ?channelName,
      'StartDate': _utc(schedule.programStart),
      'EndDate': _utc(schedule.programEnd),
      'Status': schedule.status,
    };
  }

  static Map<String, dynamic> libraryToMap(
    String libraryId,
    IptvLabels labels,
  ) {
    final (name, collectionType) = switch (libraryId) {
      IptvLibraryIds.live => (labels.liveTv, 'livetv'),
      IptvLibraryIds.movies => (labels.movies, 'movies'),
      IptvLibraryIds.shows => (labels.shows, 'tvshows'),
      _ => ('Unknown', 'mixed'),
    };
    return {
      'Id': libraryId,
      'Name': name,
      'Type': 'CollectionFolder',
      'CollectionType': collectionType,
      'ImageTags': const <String, dynamic>{},
    };
  }

  static Map<String, dynamic> userData({
    int positionMs = 0,
    int? durationMs,
    bool played = false,
    bool isFavorite = false,
  }) {
    final effectivePlayed =
        played ||
        (durationMs != null &&
            durationMs > 0 &&
            positionMs / durationMs >= WatchStateRepository.watchedThreshold);
    return {
      'PlaybackPositionTicks': effectivePlayed ? 0 : positionMs * ticksPerMs,
      'Played': effectivePlayed,
      'IsFavorite': isFavorite,
      'PlayCount': effectivePlayed ? 1 : 0,
    };
  }
}
