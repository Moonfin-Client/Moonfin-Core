/// Numeric `type` values on `GET /settings/discover`, matching Seerr /
/// Foreseerr DiscoverSliderType.
abstract final class SeerrSliderType {
  static const tmdbMovieKeyword = 13;
  static const tmdbMovieGenre = 14;
  static const tmdbTvKeyword = 15;
  static const tmdbTvGenre = 16;
  static const tmdbSearch = 17;
  static const tmdbStudio = 18;
  static const tmdbNetwork = 19;
  static const tmdbMovieStreaming = 20;
  static const tmdbTvStreaming = 21;
  static const traktRecommendations = 22;
  static const traktWatchlist = 23;
  static const traktList = 24;
  static const traktHistory = 25;
  static const anilistTrending = 26;
  static const anilistSeason = 27;
  static const anilistWatching = 28;
  static const anilistPlanning = 29;
  static const anilistCompleted = 30;
  static const anilistList = 31;
  static const anilistPopular = 32;
  static const anilistTop = 33;
  static const anilistNextSeason = 34;
  static const mdblistList = 35;
  static const simklTrending = 36;
  static const simklPlanToWatch = 37;
  static const simklWatching = 44;
  static const simklOnHold = 45;
  static const simklCompleted = 46;
  static const simklDropped = 47;
}

/// Moonfin already renders types 1–12 as [SeerrRowType] rows.
bool seerrSliderIsLocalMoonfinBuiltin(int type) => type >= 1 && type <= 12;

/// Simkl Best/Premieres: no TMDB ids. Numbers stay reserved.
bool seerrSliderIsRetired(int type) => type >= 38 && type <= 43;

/// Admin-named rows (TMDB custom + list URLs). Built-ins use l10n instead.
bool seerrSliderUsesServerTitle(int type) =>
    (type >= SeerrSliderType.tmdbMovieKeyword &&
        type <= SeerrSliderType.tmdbTvStreaming) ||
    type == SeerrSliderType.traktList ||
    type == SeerrSliderType.anilistList ||
    type == SeerrSliderType.mdblistList;

/// English fallback when UI has no [AppLocalizations] yet. Keep in lockstep
/// with `app_en.arb` `seerr*` keys.
String seerrSliderFallbackTitle(int type) => switch (type) {
      SeerrSliderType.traktRecommendations => 'Trakt Recommendations',
      SeerrSliderType.traktWatchlist => 'Trakt Watchlist',
      SeerrSliderType.traktList => 'Trakt List',
      SeerrSliderType.traktHistory => 'Trakt History',
      SeerrSliderType.anilistTrending => 'AniList Trending',
      SeerrSliderType.anilistSeason => 'AniList This Season',
      SeerrSliderType.anilistWatching => 'AniList Watching',
      SeerrSliderType.anilistPlanning => 'AniList Planning',
      SeerrSliderType.anilistCompleted => 'AniList Completed',
      SeerrSliderType.anilistList => 'AniList List',
      SeerrSliderType.anilistPopular => 'AniList Popular',
      SeerrSliderType.anilistTop => 'AniList Top 100',
      SeerrSliderType.anilistNextSeason => 'AniList Next Season',
      SeerrSliderType.mdblistList => 'MDBList List',
      SeerrSliderType.simklTrending => 'Simkl Trending',
      SeerrSliderType.simklPlanToWatch => 'Simkl Plan to Watch',
      SeerrSliderType.simklWatching => 'Simkl Watching',
      SeerrSliderType.simklOnHold => 'Simkl On Hold',
      SeerrSliderType.simklCompleted => 'Simkl Completed',
      SeerrSliderType.simklDropped => 'Simkl Dropped',
      _ => '',
    };

class SeerrDiscoverSlider {
  final int id;
  final int type;
  final int order;
  final bool isBuiltIn;
  final bool enabled;
  final String? title;
  final String? data;
  final String? sort;

  const SeerrDiscoverSlider({
    required this.id,
    required this.type,
    this.order = 0,
    this.isBuiltIn = false,
    this.enabled = true,
    this.title,
    this.data,
    this.sort,
  });

  factory SeerrDiscoverSlider.fromJson(Map<String, dynamic> json) {
    return SeerrDiscoverSlider(
      id: (json['id'] as num?)?.toInt() ?? 0,
      type: (json['type'] as num?)?.toInt() ?? 0,
      order: (json['order'] as num?)?.toInt() ?? 0,
      isBuiltIn: json['isBuiltIn'] == true,
      enabled: json['enabled'] != false,
      title: json['title']?.toString(),
      data: json['data']?.toString(),
      sort: json['sort']?.toString(),
    );
  }
}

class SeerrSliderCatalog {
  final int type;
  final String path;
  final Map<String, String> query;
  final String title;
  final String? mediaTypeHint;

  const SeerrSliderCatalog({
    required this.type,
    required this.path,
    required this.query,
    required this.title,
    this.mediaTypeHint,
  });
}

/// Turns a discover slider into a catalog request, or `null` when this
/// client should skip the row.
SeerrSliderCatalog? resolveSeerrSliderCatalog(SeerrDiscoverSlider slider) {
  if (slider.id <= 0 || !slider.enabled) return null;
  if (seerrSliderIsLocalMoonfinBuiltin(slider.type)) return null;
  if (seerrSliderIsRetired(slider.type)) return null;

  final serverTitle = slider.title?.trim() ?? '';
  final data = slider.data?.trim() ?? '';
  final needsData = seerrSliderUsesServerTitle(slider.type);
  if (needsData && (serverTitle.isEmpty || data.isEmpty)) return null;

  final catalog = _catalogForType(
    slider.type,
    data,
    needsData ? serverTitle : seerrSliderFallbackTitle(slider.type),
  );
  if (catalog == null) return null;

  final sort = slider.sort?.trim();
  if (sort == null || sort.isEmpty) return catalog;

  return SeerrSliderCatalog(
    type: catalog.type,
    path: catalog.path,
    query: {...catalog.query, 'sort': sort},
    title: catalog.title,
    mediaTypeHint: catalog.mediaTypeHint,
  );
}

List<(SeerrDiscoverSlider, SeerrSliderCatalog)> resolveSeerrCustomSliders(
  Iterable<SeerrDiscoverSlider> sliders,
) {
  final resolved = <(SeerrDiscoverSlider, SeerrSliderCatalog)>[];
  final ordered = sliders.toList()..sort((a, b) => a.order.compareTo(b.order));
  for (final slider in ordered) {
    final catalog = resolveSeerrSliderCatalog(slider);
    if (catalog == null) continue;
    resolved.add((slider, catalog));
  }
  return resolved;
}

SeerrSliderCatalog? _catalogForType(int type, String data, String title) {
  SeerrSliderCatalog row(
    String path, {
    Map<String, String> query = const {},
    String? mediaTypeHint,
  }) =>
      SeerrSliderCatalog(
        type: type,
        path: path,
        query: query,
        title: title,
        mediaTypeHint: mediaTypeHint,
      );

  switch (type) {
    case SeerrSliderType.tmdbMovieKeyword:
      return row(
        'discover/movies',
        query: {'keywords': data},
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbTvKeyword:
      return row(
        'discover/tv',
        query: {'keywords': data},
        mediaTypeHint: 'tv',
      );
    case SeerrSliderType.tmdbMovieGenre:
      return row(
        'discover/movies',
        query: {'genre': data},
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbTvGenre:
      return row(
        'discover/tv',
        query: {'genre': data},
        mediaTypeHint: 'tv',
      );
    case SeerrSliderType.tmdbSearch:
      return row('search', query: {'query': data});
    case SeerrSliderType.tmdbStudio:
      return row(
        'discover/movies/studio/$data',
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbNetwork:
      return row(
        'discover/tv/network/$data',
        mediaTypeHint: 'tv',
      );
    case SeerrSliderType.tmdbMovieStreaming:
      return _streamingCatalog(
        type: type,
        path: 'discover/movies',
        data: data,
        title: title,
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbTvStreaming:
      return _streamingCatalog(
        type: type,
        path: 'discover/tv',
        data: data,
        title: title,
        mediaTypeHint: 'tv',
      );
    case SeerrSliderType.traktRecommendations:
      return row('discover/trakt/recommendations');
    case SeerrSliderType.traktWatchlist:
      return row('discover/trakt/watchlist');
    case SeerrSliderType.traktList:
      return row('discover/trakt/list', query: {'url': data});
    case SeerrSliderType.traktHistory:
      return row('discover/trakt/history');
    case SeerrSliderType.anilistTrending:
      return row('discover/anilist/trending');
    case SeerrSliderType.anilistSeason:
      return row('discover/anilist/season');
    case SeerrSliderType.anilistWatching:
      return row('discover/anilist/watching');
    case SeerrSliderType.anilistPlanning:
      return row('discover/anilist/planning');
    case SeerrSliderType.anilistCompleted:
      return row('discover/anilist/completed');
    case SeerrSliderType.anilistList:
      return row('discover/anilist/list', query: {'name': data});
    case SeerrSliderType.anilistPopular:
      return row('discover/anilist/popular');
    case SeerrSliderType.anilistTop:
      return row('discover/anilist/top');
    case SeerrSliderType.anilistNextSeason:
      return row('discover/anilist/next-season');
    case SeerrSliderType.mdblistList:
      return row('discover/mdblist/list', query: {'url': data});
    case SeerrSliderType.simklTrending:
      return row('discover/simkl/trending');
    case SeerrSliderType.simklPlanToWatch:
      return row(
        'discover/simkl/library',
        query: const {'status': 'plantowatch'},
      );
    case SeerrSliderType.simklWatching:
      return row(
        'discover/simkl/library',
        query: const {'status': 'watching'},
      );
    case SeerrSliderType.simklOnHold:
      return row(
        'discover/simkl/library',
        query: const {'status': 'hold'},
      );
    case SeerrSliderType.simklCompleted:
      return row(
        'discover/simkl/library',
        query: const {'status': 'completed'},
      );
    case SeerrSliderType.simklDropped:
      return row(
        'discover/simkl/library',
        query: const {'status': 'dropped'},
      );
    default:
      return null;
  }
}

SeerrSliderCatalog? _streamingCatalog({
  required int type,
  required String path,
  required String data,
  required String title,
  required String mediaTypeHint,
}) {
  final parts = data.split(',');
  if (parts.length < 2) return null;
  final region = parts[0].trim();
  final provider = parts[1].trim();
  if (region.isEmpty || provider.isEmpty) return null;
  return SeerrSliderCatalog(
    type: type,
    path: path,
    query: {'watchRegion': region, 'watchProviders': provider},
    title: title,
    mediaTypeHint: mediaTypeHint,
  );
}

/// Stable D-pad column id. Index is not part of this: custom rows
/// appearing or vanishing would otherwise reuse another row's memory.
String seerrDiscoverFocusHubKey({int? sliderId, String? typeName}) {
  if (sliderId != null) return 'seerr_discover_slider_$sliderId';
  if (typeName != null) return 'seerr_discover_$typeName';
  return 'seerr_discover_unknown';
}
