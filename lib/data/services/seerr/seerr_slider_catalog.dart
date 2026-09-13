/// Numeric `type` values on `GET /settings/discover`, matching Seerr
/// DiscoverSliderType. Unknown types resolve to null so later providers can
/// extend [_catalogForType] without changing ingest.
abstract final class SeerrSliderType {
  static const recentlyAdded = 1;
  static const recentRequests = 2;
  static const plexWatchlist = 3;
  static const trending = 4;
  static const popularMovies = 5;
  static const movieGenres = 6;
  static const upcomingMovies = 7;
  static const studios = 8;
  static const popularTv = 9;
  static const tvGenres = 10;
  static const upcomingTv = 11;
  static const networks = 12;
  static const tmdbMovieKeyword = 13;
  static const tmdbMovieGenre = 14;
  static const tmdbTvKeyword = 15;
  static const tmdbTvGenre = 16;
  static const tmdbSearch = 17;
  static const tmdbStudio = 18;
  static const tmdbNetwork = 19;
  static const tmdbMovieStreaming = 20;
  static const tmdbTvStreaming = 21;
}

/// Moonfin jump-tile row. Not a Seerr DiscoverSliderType; merge must not drop it.
const seerrShortcutsSliderId = 'shortcuts';

bool isSeerrShortcutsSliderId(String? sliderId) =>
    sliderId == seerrShortcutsSliderId;

/// Admin-named keyword/genre/studio/search/streaming sliders keep the
/// server title. Stock types 1–12 use localized/fallback titles.
bool seerrSliderUsesServerTitle(int type) {
  switch (type) {
    case SeerrSliderType.tmdbMovieKeyword:
    case SeerrSliderType.tmdbMovieGenre:
    case SeerrSliderType.tmdbTvKeyword:
    case SeerrSliderType.tmdbTvGenre:
    case SeerrSliderType.tmdbSearch:
    case SeerrSliderType.tmdbStudio:
    case SeerrSliderType.tmdbNetwork:
    case SeerrSliderType.tmdbMovieStreaming:
    case SeerrSliderType.tmdbTvStreaming:
      return true;
    default:
      return false;
  }
}

/// English titles for known slider types that are not admin-named.
String seerrSliderFallbackTitle(int type) => switch (type) {
      SeerrSliderType.recentlyAdded => 'Recently Added',
      SeerrSliderType.recentRequests => 'Recent Requests',
      SeerrSliderType.plexWatchlist => 'Your Watchlist',
      SeerrSliderType.trending => 'Trending',
      SeerrSliderType.popularMovies => 'Popular Movies',
      SeerrSliderType.movieGenres => 'Movie Genres',
      SeerrSliderType.upcomingMovies => 'Upcoming Movies',
      SeerrSliderType.studios => 'Studios',
      SeerrSliderType.popularTv => 'Popular Series',
      SeerrSliderType.tvGenres => 'Series Genres',
      SeerrSliderType.upcomingTv => 'Upcoming Series',
      SeerrSliderType.networks => 'Networks',
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

  final serverTitle = slider.title?.trim() ?? '';
  final data = slider.data?.trim() ?? '';
  final needsData = seerrSliderUsesServerTitle(slider.type);
  if (needsData && (serverTitle.isEmpty || data.isEmpty)) return null;

  final fallback = seerrSliderFallbackTitle(slider.type);
  final catalog = _catalogForType(
    slider.type,
    data,
    needsData ? serverTitle : (fallback.isNotEmpty ? fallback : serverTitle),
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

List<(SeerrDiscoverSlider, SeerrSliderCatalog)> resolveSeerrSliders(
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
    case SeerrSliderType.recentlyAdded:
      return row('media', query: const {'filter': 'allavailable'});
    case SeerrSliderType.recentRequests:
      return row('request');
    case SeerrSliderType.plexWatchlist:
      return row('discover/watchlist');
    case SeerrSliderType.trending:
      return row('discover/trending');
    case SeerrSliderType.popularMovies:
      return row('discover/movies', mediaTypeHint: 'movie');
    case SeerrSliderType.movieGenres:
      return row('discover/genreslider/movie', mediaTypeHint: 'movie');
    case SeerrSliderType.upcomingMovies:
      return row('discover/movies/upcoming', mediaTypeHint: 'movie');
    case SeerrSliderType.studios:
      return row('discover/movies', mediaTypeHint: 'movie');
    case SeerrSliderType.popularTv:
      return row('discover/tv', mediaTypeHint: 'tv');
    case SeerrSliderType.tvGenres:
      return row('discover/genreslider/tv', mediaTypeHint: 'tv');
    case SeerrSliderType.upcomingTv:
      return row('discover/tv/upcoming', mediaTypeHint: 'tv');
    case SeerrSliderType.networks:
      return row('discover/tv', mediaTypeHint: 'tv');
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
