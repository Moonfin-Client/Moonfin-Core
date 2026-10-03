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

/// One slider from Seerr's `GET /settings/discover`.
class SeerrDiscoverSlider {
  final int id;
  final int type;
  final bool enabled;
  final String title;
  final String data;

  const SeerrDiscoverSlider({
    required this.id,
    required this.type,
    this.enabled = true,
    this.title = '',
    this.data = '',
  });

  /// Null for an entry missing its id or type, so one bad row is skipped
  /// rather than failing the list.
  static SeerrDiscoverSlider? tryFromJson(Object? json) {
    if (json is! Map) return null;
    final id = json['id'];
    final type = json['type'];
    if (id is! num || type is! num) return null;
    return SeerrDiscoverSlider(
      id: id.toInt(),
      type: type.toInt(),
      enabled: json['enabled'] != false,
      title: json['title']?.toString().trim() ?? '',
      data: json['data']?.toString().trim() ?? '',
    );
  }

  /// The request behind this slider's results, or null when this client
  /// doesn't know the type. Mirrors the routes Seerr's own discover page uses.
  SeerrSliderQuery? get query {
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

  /// Whether this client can show the slider as a row. An admin slider always
  /// has a title, and one without has nothing to label its row with.
  bool get isSupported => enabled && title.isNotEmpty && query != null;
}

/// A Seerr API path and the query parameters for one slider's results.
class SeerrSliderQuery {
  final String path;
  final Map<String, String> params;

  const SeerrSliderQuery(this.path, this.params);
}

/// Home layout entries for Seerr sliders ride the existing `pluginDynamic`
/// shape, which every client and the Moonbase admin page already carry
/// through untouched when they don't recognize the source. The slider id goes
/// in `pluginSection` and its type in `pluginAdditionalData`, so a slider that
/// was deleted and replaced by one of another type isn't mistaken for it.
HomeSectionConfig seerrSliderSection(
  SeerrDiscoverSlider slider, {
  required String serverId,
}) => HomeSectionConfig.pluginDynamic(
  serverId: serverId,
  pluginSection: '${slider.id}',
  pluginAdditionalData: '${slider.type}',
  pluginDisplayText: slider.title,
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
