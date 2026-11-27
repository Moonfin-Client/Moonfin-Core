import 'package:server_core/server_core.dart';

import 'aggregated_item.dart';

enum HomeRowType {
  resume,
  resumeAudio,
  nextUp,
  latestMedia,
  recentlyReleased,
  favorites,
  collections,
  genres,
  studios,
  libraryTiles,
  libraryTilesSmall,
  playlists,
  audioArtists,
  audioAlbums,
  audioPlaylists,
  liveTv,
  liveTvOnNow,
  activeRecordings,
  mediaBar,
  pluginDynamic,
  liveTvFavorites,

  /// Watch Parties, shown first while rooms exist. Not a layout section.
  watchParties,
}

class HomeRow {
  final String id;
  final String title;
  final String? subtitle;
  final List<AggregatedItem> items;
  final HomeRowType rowType;
  final bool isLoading;
  final int totalCount;
  final bool isAudio;

  /// The server's own row (Silo's home section) this row shows, kept so its
  /// title follows the app's language when that changes after the row loaded.
  final ServerHomeSection? serverSection;

  const HomeRow({
    required this.id,
    required this.title,
    this.subtitle,
    this.items = const [],
    required this.rowType,
    this.isLoading = false,
    this.totalCount = 0,
    this.isAudio = false,
    this.serverSection,
  });

  HomeRow copyWith({
    String? id,
    String? title,
    String? subtitle,
    List<AggregatedItem>? items,
    HomeRowType? rowType,
    bool? isLoading,
    int? totalCount,
    bool? isAudio,
    ServerHomeSection? serverSection,
  }) =>
      HomeRow(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        items: items ?? this.items,
        rowType: rowType ?? this.rowType,
        isLoading: isLoading ?? this.isLoading,
        totalCount: totalCount ?? this.totalCount,
        isAudio: isAudio ?? this.isAudio,
        serverSection: serverSection ?? this.serverSection,
      );

  bool get isEmpty => items.isEmpty && !isLoading;
  bool get hasMore => items.length < totalCount;
}
