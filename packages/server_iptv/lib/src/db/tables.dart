import 'package:drift/drift.dart';

class Playlists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get sourceType => text()();
  TextColumn get url => text().nullable()();
  TextColumn get filePath => text().nullable()();
  TextColumn get epgUrl => text().nullable()();
  IntColumn get refreshIntervalMs =>
      integer().withDefault(const Constant(86400000))();
  DateTimeColumn get lastRefreshed => dateTime().nullable()();
}

class ChannelGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  TextColumn get name => text()();

  /// The name the provider uses, which a refresh matches on, so a group
  /// renamed in the editor keeps its id and allowlist.
  TextColumn get providerName => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

@TableIndex(name: 'idx_channels_playlist_vod', columns: {#playlistId, #isVod})
@TableIndex(name: 'idx_channels_group', columns: {#groupId})
@TableIndex(name: 'idx_channels_tvg', columns: {#tvgId})
@TableIndex(name: 'idx_channels_name', columns: {#name})
class Channels extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  IntColumn get groupId =>
      integer().nullable().references(ChannelGroups, #id)();
  TextColumn get name => text()();
  TextColumn get streamUrl => text()();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get tvgId => text().nullable()();
  IntColumn get channelNumber => integer().nullable()();
  BoolColumn get isVod => boolean().withDefault(const Constant(false))();
  TextColumn get catchupMode => text().nullable()();
  TextColumn get catchupSource => text().nullable()();
  IntColumn get catchupDays => integer().nullable()();
}

/// Changes made in the playlist editor, keyed by stream so a refresh can put
/// them back on the provider's fresh rows. [removed] keeps a channel that was
/// removed or merged away from coming back.
class ChannelEdits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  TextColumn get streamUrl => text()();
  TextColumn get name => text().nullable()();
  BoolColumn get numberEdited => boolean().withDefault(const Constant(false))();
  IntColumn get channelNumber => integer().nullable()();
  BoolColumn get removed => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>> get uniqueKeys => [
    {playlistId, streamUrl},
  ];
}

@TableIndex(name: 'idx_epg_channel_start', columns: {#channelTvgId, #startTime})
class EpgPrograms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get channelTvgId => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get category => text().nullable()();
  TextColumn get icon => text().nullable()();
  TextColumn get episodeTitle => text().nullable()();
  BoolColumn get isMovie => boolean().withDefault(const Constant(false))();
  BoolColumn get isSeries => boolean().withDefault(const Constant(false))();
  BoolColumn get isSports => boolean().withDefault(const Constant(false))();
  BoolColumn get isNews => boolean().withDefault(const Constant(false))();
  BoolColumn get isKids => boolean().withDefault(const Constant(false))();
}

class EpgSources extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  TextColumn get url => text()();
  DateTimeColumn get lastFetched => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {playlistId},
  ];
}

/// Profile-scoped favorites over channels ([itemKind] == 'channel', [refId] is
/// a Channels.id) or VOD items ([itemKind] == 'vod', [refId] is a VodItems.id).
class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get profileId => text()();
  TextColumn get itemKind => text()();
  IntColumn get refId => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {profileId, itemKind, refId},
  ];
}

/// Profile-scoped playback history and resume state.
///
/// [contentType] is 'channel' | 'movie' | 'episode'.
@TableIndex(
  name: 'idx_watch_history_profile_type_time',
  columns: {#profileId, #contentType, #watchedAt},
)
@TableIndex(
  name: 'idx_watch_history_profile_vod',
  columns: {#profileId, #vodItemId},
)
@TableIndex(
  name: 'idx_watch_history_profile_episode',
  columns: {#profileId, #episodeId},
)
class WatchHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get profileId => text()();
  TextColumn get contentType => text().withDefault(const Constant('channel'))();
  IntColumn get channelId => integer().nullable().references(Channels, #id)();
  IntColumn get vodItemId => integer().nullable()();
  IntColumn get episodeId => integer().nullable()();
  IntColumn get positionMs => integer().withDefault(const Constant(0))();
  IntColumn get durationMs => integer().nullable()();
  BoolColumn get played => boolean().withDefault(const Constant(false))();
  DateTimeColumn get watchedAt => dateTime().withDefault(currentDateAndTime)();
}

/// Per-profile allowlist of enabled channel groups. No rows for a profile
/// means every group is enabled, and a [groupId] of 0 alone means none are.
class EnabledGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get profileId => text()();
  IntColumn get groupId => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {profileId, groupId},
  ];
}

@TableIndex(name: 'idx_vod_playlist_series', columns: {#playlistId, #isSeries})
@TableIndex(name: 'idx_vod_playlist_stream', columns: {#playlistId, #streamId})
@TableIndex(name: 'idx_vod_added', columns: {#addedAt})
class VodItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  IntColumn get streamId => integer()();
  TextColumn get name => text()();
  TextColumn get streamIcon => text().nullable()();
  TextColumn get containerExtension => text().nullable()();
  TextColumn get plot => text().nullable()();
  TextColumn get genre => text().nullable()();
  IntColumn get year => integer().nullable()();
  RealColumn get rating => real().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  TextColumn get backdropUrl => text().nullable()();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get tagline => text().nullable()();
  IntColumn get tmdbId => integer().nullable()();
  BoolColumn get isSeries => boolean().withDefault(const Constant(false))();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}

/// Cached seasons for an Xtream series (from get_series_info).
class SeriesSeasons extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  IntColumn get seriesId => integer()();
  IntColumn get seasonNumber => integer()();
  TextColumn get coverUrl => text().nullable()();
  IntColumn get episodeCount => integer().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {playlistId, seriesId, seasonNumber},
  ];
}

/// Cached episodes for an Xtream series (from get_series_info).
@TableIndex(
  name: 'idx_series_episodes_series_season',
  columns: {#playlistId, #seriesId, #seasonNumber},
)
class SeriesEpisodes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  IntColumn get seriesId => integer()();
  IntColumn get episodeId => integer()();
  IntColumn get seasonNumber => integer()();
  IntColumn get episodeNumber => integer().nullable()();
  TextColumn get title => text()();
  TextColumn get plot => text().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  TextColumn get containerExtension => text().nullable()();
  TextColumn get stillUrl => text().nullable()();
  RealColumn get rating => real().nullable()();
  DateTimeColumn get airDate => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {playlistId, episodeId},
  ];
}

/// Marks when series details (seasons + episodes) were last fetched.
class SeriesDetailsCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer()();
  IntColumn get seriesId => integer()();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {playlistId, seriesId},
  ];
}

class Recordings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().nullable().references(Playlists, #id)();
  TextColumn get title => text()();
  TextColumn get filePath => text()();
  DateTimeColumn get startedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get durationMs => integer().nullable()();
  TextColumn get status => text().withDefault(const Constant('recording'))();
}

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get channelId => integer().nullable().references(Channels, #id)();
  TextColumn get title => text()();
  DateTimeColumn get programStart => dateTime()();
  IntColumn get notificationId => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {notificationId},
  ];
}

class ScheduledRecordings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(Playlists, #id)();
  IntColumn get channelId => integer().references(Channels, #id)();
  IntColumn get recordingId =>
      integer().nullable().references(Recordings, #id)();
  TextColumn get title => text()();
  DateTimeColumn get programStart => dateTime()();
  DateTimeColumn get programEnd => dateTime()();
  TextColumn get status => text().withDefault(const Constant('scheduled'))();
}
