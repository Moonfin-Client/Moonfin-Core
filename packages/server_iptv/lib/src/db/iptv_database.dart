import 'package:drift/drift.dart';

import 'tables.dart';

part 'iptv_database.g.dart';

@DriftDatabase(
  tables: [
    Playlists,
    ChannelGroups,
    Channels,
    ChannelEdits,
    EpgPrograms,
    EpgSources,
    Favorites,
    WatchHistory,
    EnabledGroups,
    VodItems,
    SeriesSeasons,
    SeriesEpisodes,
    SeriesDetailsCache,
    Recordings,
    ScheduledRecordings,
    Reminders,
  ],
)
class IptvDatabase extends _$IptvDatabase {
  /// The host opens the platform's sqlite and passes it in.
  IptvDatabase.withExecutor(super.executor);

  @override
  int get schemaVersion => 1;
}
