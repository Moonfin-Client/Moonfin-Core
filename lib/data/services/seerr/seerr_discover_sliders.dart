import '../../../preference/home_section_config.dart';

/// The `type` values Seerr gives the discover sliders an admin creates. Types
/// 1 to 12 are Seerr's own rows, which Moonfin already draws itself, so only
/// these are read from the server.
abstract final class SeerrSliderType {
  static const movieKeyword = 13;
  static const movieGenre = 14;
  static const tvKeyword = 15;
  static const tvGenre = 16;
  static const search = 17;
  static const studio = 18;
  static const network = 19;
  static const movieStreaming = 20;
  static const tvStreaming = 21;
}

/// The slider types Foreseerr, a Seerr fork, adds in its own band from 1001.
/// Foreseerr says where each one loads from and gives its rows an English
/// name, so these are only needed to name the rows it ships with in the
/// user's language. The list types are admin-named and kept for reference.
/// The numbers skipped are Simkl rows Foreseerr retired.
abstract final class ForeseerrSliderType {
  static const traktRecommendations = 1001;
  static const traktWatchlist = 1002;
  static const traktList = 1003;
  static const traktHistory = 1004;
  static const anilistTrending = 1005;
  static const anilistSeason = 1006;
  static const anilistWatching = 1007;
  static const anilistPlanning = 1008;
  static const anilistCompleted = 1009;
  static const anilistList = 1010;
  static const anilistPopular = 1011;
  static const anilistTop = 1012;
  static const anilistNextSeason = 1013;
  static const mdblistList = 1014;
  static const simklTrending = 1015;
  static const simklPlanToWatch = 1016;
  static const simklWatching = 1023;
  static const simklOnHold = 1024;
  static const simklCompleted = 1025;
  static const simklDropped = 1026;
}

/// One slider from Seerr's `GET /settings/discover`.
class SeerrDiscoverSlider {
  final int id;
  final int type;
  final bool enabled;
  final String title;
  final String data;

  /// Where Foreseerr serves this slider's results: an `/api/v1/` path and
  /// query, without the page. Stock Seerr doesn't send one.
  final String endpoint;

  /// The English name Foreseerr gives a row it ships with, which comes without
  /// a title of its own.
  final String defaultTitle;

  const SeerrDiscoverSlider({
    required this.id,
    required this.type,
    this.enabled = true,
    this.title = '',
    this.data = '',
    this.endpoint = '',
    this.defaultTitle = '',
  });

  /// Null for an entry missing its id or type, so one bad row is skipped
  /// rather than failing the list.
  static SeerrDiscoverSlider? tryFromJson(Object? json) {
    if (json is! Map) return null;
    final id = json['id'];
    final type = json['type'];
    if (id is! num || type is! num) return null;
    String text(String key) => json[key]?.toString().trim() ?? '';
    return SeerrDiscoverSlider(
      id: id.toInt(),
      type: type.toInt(),
      enabled: json['enabled'] != false,
      title: text('title'),
      data: text('data'),
      endpoint: text('endpoint'),
      defaultTitle: text('defaultTitle'),
    );
  }

  /// The request behind this slider's results, or null when this client
  /// can't load it. Foreseerr's endpoint wins. Stock Seerr sends none, so its
  /// types map to the routes Seerr's own discover page uses.
  SeerrSliderQuery? get query => _endpointQuery ?? _seerrQuery;

  // Only a path under the Seerr API is taken from Foreseerr's endpoint,
  // checked after `..` is resolved, so a server can't point the request,
  // which carries the user's token, anywhere else.
  SeerrSliderQuery? get _endpointQuery {
    final uri = Uri.tryParse(endpoint);
    if (uri == null || uri.hasScheme || uri.hasAuthority) return null;
    if (!uri.path.startsWith('/api/v1/')) return null;
    final segments = uri.pathSegments.skip(2).toList();
    if (segments.isEmpty || segments.any((s) => s.isEmpty)) return null;
    return SeerrSliderQuery(segments.map(Uri.encodeComponent).join('/'), {
      for (final entry in uri.queryParameters.entries)
        if (entry.key != 'page') entry.key: entry.value,
    });
  }

  SeerrSliderQuery? get _seerrQuery {
    if (data.isEmpty) return null;
    switch (type) {
      case SeerrSliderType.movieKeyword:
        return SeerrSliderQuery('discover/movies', {'keywords': data});
      case SeerrSliderType.tvKeyword:
        return SeerrSliderQuery('discover/tv', {'keywords': data});
      case SeerrSliderType.movieGenre:
        return SeerrSliderQuery('discover/movies', {'genre': data});
      case SeerrSliderType.tvGenre:
        return SeerrSliderQuery('discover/tv', {'genre': data});
      case SeerrSliderType.search:
        return SeerrSliderQuery('search', {'query': data});
      case SeerrSliderType.studio:
        return SeerrSliderQuery(
          'discover/movies/studio/${Uri.encodeComponent(data)}',
          const {},
        );
      case SeerrSliderType.network:
        return SeerrSliderQuery(
          'discover/tv/network/${Uri.encodeComponent(data)}',
          const {},
        );
      case SeerrSliderType.movieStreaming:
        return _streaming('discover/movies');
      case SeerrSliderType.tvStreaming:
        return _streaming('discover/tv');
      default:
        return null;
    }
  }

  // Seerr stores these as "<region>,<provider ids>".
  SeerrSliderQuery? _streaming(String path) {
    final parts = data.split(',');
    if (parts.length < 2) return null;
    final region = parts[0].trim();
    final providers = parts[1].trim();
    if (region.isEmpty || providers.isEmpty) return null;
    return SeerrSliderQuery(path, {
      'watchRegion': region,
      'watchProviders': providers,
    });
  }

  /// Whether this client can show the slider as a row, which needs somewhere
  /// to load it from and a name to label it with. Foreseerr's built-in rows
  /// have no title and are named by [defaultTitle].
  bool get isSupported =>
      enabled &&
      (title.isNotEmpty || defaultTitle.isNotEmpty) &&
      query != null;
}

/// A Seerr API path and the query parameters for one slider's results.
class SeerrSliderQuery {
  final String path;
  final Map<String, String> params;

  const SeerrSliderQuery(this.path, this.params);
}

/// Reads one page of a slider's results. Seerr counts its pages, while a
/// list row that can't know its total, like Foreseerr's, says whether there
/// is another. Only movies and series are kept, since a search slider also
/// finds people.
Map<String, dynamic> readSeerrSliderPage(
  Map<String, dynamic> body, {
  required int page,
}) {
  final currentPage = (body['page'] as num?)?.toInt() ?? page;
  var totalPages = (body['totalPages'] as num?)?.toInt() ?? 0;
  if (totalPages <= 0) {
    totalPages = body['hasMore'] == true ? currentPage + 1 : currentPage;
  }
  return {
    ...body,
    'page': currentPage,
    'totalPages': totalPages,
    'results': [
      for (final item in body['results'] as List? ?? const [])
        if (item is Map &&
            (item['mediaType'] == 'movie' || item['mediaType'] == 'tv'))
          Map<String, dynamic>.from(item),
    ],
  };
}

/// Home layout entries for Seerr sliders ride the existing `pluginDynamic`
/// shape, which every client and the Moonbase admin page already carry
/// through untouched when they don't recognize the source. The slider id goes
/// in `pluginSection` and its type in `pluginAdditionalData`, so a slider that
/// was deleted and replaced by one of another type isn't mistaken for it.
/// [title] is what other clients label the row with, the name this client
/// gives it.
HomeSectionConfig seerrSliderSection(
  SeerrDiscoverSlider slider, {
  required String serverId,
  required String title,
}) => HomeSectionConfig.pluginDynamic(
  serverId: serverId,
  pluginSection: '${slider.id}',
  pluginAdditionalData: '${slider.type}',
  pluginDisplayText: title,
  pluginSource: HomeSectionPluginSource.seerr,
);

bool isSeerrSliderSection(HomeSectionConfig cfg) =>
    cfg.isPluginDynamic && cfg.pluginSource == HomeSectionPluginSource.seerr;

/// [sections] with the slider row [entry] stands for put on Home or taken off.
/// A new row goes last. One taken off keeps its entry, switched off, since a
/// layout synced from a device that still has the entry would bring back one
/// that was removed.
List<HomeSectionConfig> setSeerrSliderShown(
  List<HomeSectionConfig> sections,
  HomeSectionConfig entry, {
  required bool shown,
}) {
  final idx = sections.indexWhere((s) => s.stableId == entry.stableId);
  if (idx < 0) {
    if (!shown) return sections;
    return [
      ...sections,
      entry.copyWith(enabled: true, order: sections.length),
    ];
  }
  return List.of(sections)..[idx] = sections[idx].copyWith(enabled: shown);
}

/// The live slider a layout entry stands for, or null when Seerr no longer
/// has it.
SeerrDiscoverSlider? findSeerrSliderFor(
  HomeSectionConfig cfg,
  Iterable<SeerrDiscoverSlider> sliders,
) {
  if (!isSeerrSliderSection(cfg)) return null;
  final id = int.tryParse(cfg.pluginSection ?? '');
  final type = int.tryParse(cfg.pluginAdditionalData ?? '');
  if (id == null || type == null) return null;
  for (final slider in sliders) {
    if (slider.id == id && slider.type == type) return slider;
  }
  return null;
}
