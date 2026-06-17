import 'aggregated_item.dart';

enum HomeRowType {
  resume,
  resumeAudio,
  nextUp,
  latestMedia,
  favorites,
  collections,
  genres,
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
}

class HomeRow {
  final String id;
  final String title;
  final List<AggregatedItem> items;
  final HomeRowType rowType;
  final bool isLoading;
  final int totalCount;
  final bool isAudio;

  const HomeRow({
    required this.id,
    required this.title,
    this.items = const [],
    required this.rowType,
    this.isLoading = false,
    this.totalCount = 0,
    this.isAudio = false,
  });

  HomeRow copyWith({
    String? id,
    String? title,
    List<AggregatedItem>? items,
    HomeRowType? rowType,
    bool? isLoading,
    int? totalCount,
    bool? isAudio,
  }) =>
      HomeRow(
        id: id ?? this.id,
        title: title ?? this.title,
        items: items ?? this.items,
        rowType: rowType ?? this.rowType,
        isLoading: isLoading ?? this.isLoading,
        totalCount: totalCount ?? this.totalCount,
        isAudio: isAudio ?? this.isAudio,
      );

  bool get isEmpty => items.isEmpty && !isLoading;
  bool get hasMore => items.length < totalCount;
}
