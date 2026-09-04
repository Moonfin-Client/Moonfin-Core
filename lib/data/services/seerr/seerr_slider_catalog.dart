/// Numeric `type` values on `GET /settings/discover`, matching Seerr's
/// DiscoverSliderType. Custom rows the client can render as a title list.
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
}

class SeerrDiscoverSlider {
  final int id;
  final int type;
  final int order;
  final bool isBuiltIn;
  final bool enabled;
  final String? title;
  final String? data;

  const SeerrDiscoverSlider({
    required this.id,
    required this.type,
    this.order = 0,
    this.isBuiltIn = false,
    this.enabled = true,
    this.title,
    this.data,
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
    );
  }
}

class SeerrSliderCatalog {
  final String path;
  final Map<String, String> query;
  final String title;
  final String? mediaTypeHint;

  const SeerrSliderCatalog({
    required this.path,
    required this.query,
    required this.title,
    this.mediaTypeHint,
  });
}

/// Turns a custom discover slider into a catalog request, or `null` when this
/// client should skip the row.
SeerrSliderCatalog? resolveSeerrSliderCatalog(SeerrDiscoverSlider slider) {
  if (slider.id <= 0 || !slider.enabled || slider.isBuiltIn) return null;
  final title = slider.title?.trim() ?? '';
  final data = slider.data?.trim() ?? '';
  if (title.isEmpty || data.isEmpty) return null;

  return _catalogForType(slider.type, data, title);
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
  switch (type) {
    case SeerrSliderType.tmdbMovieKeyword:
      return SeerrSliderCatalog(
        path: 'discover/movies',
        query: {'keywords': data},
        title: title,
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbTvKeyword:
      return SeerrSliderCatalog(
        path: 'discover/tv',
        query: {'keywords': data},
        title: title,
        mediaTypeHint: 'tv',
      );
    case SeerrSliderType.tmdbMovieGenre:
      return SeerrSliderCatalog(
        path: 'discover/movies',
        query: {'genre': data},
        title: title,
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbTvGenre:
      return SeerrSliderCatalog(
        path: 'discover/tv',
        query: {'genre': data},
        title: title,
        mediaTypeHint: 'tv',
      );
    case SeerrSliderType.tmdbSearch:
      return SeerrSliderCatalog(
        path: 'search',
        query: {'query': data},
        title: title,
      );
    case SeerrSliderType.tmdbStudio:
      return SeerrSliderCatalog(
        path: 'discover/movies/studio/$data',
        query: const {},
        title: title,
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbNetwork:
      return SeerrSliderCatalog(
        path: 'discover/tv/network/$data',
        query: const {},
        title: title,
        mediaTypeHint: 'tv',
      );
    case SeerrSliderType.tmdbMovieStreaming:
      return _streamingCatalog(
        path: 'discover/movies',
        data: data,
        title: title,
        mediaTypeHint: 'movie',
      );
    case SeerrSliderType.tmdbTvStreaming:
      return _streamingCatalog(
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
