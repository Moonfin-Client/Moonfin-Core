import 'dart:convert';
import 'preference_constants.dart';

/// Categorizes a [HomeSectionConfig].
///
/// `builtin` entries map to a [HomeSectionType] handled natively by the app.
/// `pluginDynamic` entries are dynamic rows discovered from a third-party
/// Jellyfin plugin and are scoped to a specific server. The originating
/// plugin is identified by [HomeSectionPluginSource].
enum HomeSectionKind {
  builtin('builtin'),
  pluginDynamic('pluginDynamic');

  const HomeSectionKind(this.serializedName);
  final String serializedName;

  static HomeSectionKind fromSerialized(String? value) {
    for (final v in HomeSectionKind.values) {
      if (v.serializedName == value) return v;
    }
    return HomeSectionKind.builtin;
  }
}

/// Identifies which third-party plugin produced a `pluginDynamic` entry so
/// row loading can dispatch to the correct backend.
enum HomeSectionPluginSource {
  /// IAmParadox27 "Home Screen Sections" plugin.
  hss('hss'),

  collections('collections'),

  genres('genres'),

  playlists('playlists');

  const HomeSectionPluginSource(this.serializedName);
  final String serializedName;

  static HomeSectionPluginSource fromSerialized(String? value) {
    for (final v in HomeSectionPluginSource.values) {
      if (v.serializedName == value) return v;
    }
    return HomeSectionPluginSource.hss;
  }
}

class HomeSectionConfig {
  final HomeSectionKind kind;
  final HomeSectionType type;
  final bool enabled;
  final int order;

  // pluginDynamic-only fields. Always null for builtin entries.
  final String? serverId;
  final String? pluginSection;
  final String? pluginAdditionalData;
  final String? pluginDisplayText;
  final HomeSectionPluginSource pluginSource;

  const HomeSectionConfig({
    this.kind = HomeSectionKind.builtin,
    this.type = HomeSectionType.none,
    this.enabled = true,
    this.order = 0,
    this.serverId,
    this.pluginSection,
    this.pluginAdditionalData,
    this.pluginDisplayText,
    this.pluginSource = HomeSectionPluginSource.hss,
  });

  factory HomeSectionConfig.pluginDynamic({
    required String serverId,
    required String pluginSection,
    String? pluginAdditionalData,
    String? pluginDisplayText,
    bool enabled = true,
    int order = 0,
    HomeSectionPluginSource pluginSource = HomeSectionPluginSource.hss,
  }) => HomeSectionConfig(
    kind: HomeSectionKind.pluginDynamic,
    type: HomeSectionType.none,
    enabled: enabled,
    order: order,
    serverId: serverId,
    pluginSection: pluginSection,
    pluginAdditionalData: pluginAdditionalData,
    pluginDisplayText: pluginDisplayText,
    pluginSource: pluginSource,
  );

  factory HomeSectionConfig.fromJson(Map<String, dynamic> json) {
    final kindRaw = json['kind'] as String?;
    final kind = kindRaw == null
        ? HomeSectionKind.builtin
        : HomeSectionKind.fromSerialized(kindRaw);
    final typeName = json['type'] as String? ?? 'none';
    return HomeSectionConfig(
      kind: kind,
      type: HomeSectionType.fromSerialized(typeName),
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      serverId: json['serverId']?.toString(),
      pluginSection: json['pluginSection'] as String?,
      pluginAdditionalData: json['pluginAdditionalData'] as String?,
      pluginDisplayText: json['pluginDisplayText'] as String?,
      pluginSource: HomeSectionPluginSource.fromSerialized(
        json['pluginSource'] as String?,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'type': type.serializedName,
      'enabled': enabled,
      'order': order,
    };
    if (kind != HomeSectionKind.builtin) {
      json['kind'] = kind.serializedName;
      json['pluginSource'] = pluginSource.serializedName;
      if (serverId != null) json['serverId'] = serverId;
      if (pluginSection != null) json['pluginSection'] = pluginSection;
      if (pluginAdditionalData != null) {
        json['pluginAdditionalData'] = pluginAdditionalData;
      }
      if (pluginDisplayText != null) {
        json['pluginDisplayText'] = pluginDisplayText;
      }
    }
    return json;
  }

  HomeSectionConfig copyWith({
    HomeSectionKind? kind,
    HomeSectionType? type,
    bool? enabled,
    int? order,
    String? serverId,
    String? pluginSection,
    String? pluginAdditionalData,
    String? pluginDisplayText,
    HomeSectionPluginSource? pluginSource,
  }) => HomeSectionConfig(
    kind: kind ?? this.kind,
    type: type ?? this.type,
    enabled: enabled ?? this.enabled,
    order: order ?? this.order,
    serverId: serverId ?? this.serverId,
    pluginSection: pluginSection ?? this.pluginSection,
    pluginAdditionalData: pluginAdditionalData ?? this.pluginAdditionalData,
    pluginDisplayText: pluginDisplayText ?? this.pluginDisplayText,
    pluginSource: pluginSource ?? this.pluginSource,
  );

  /// Stable identifier suitable for use as a row id / list key. Plugin
  /// entries combine the originating plugin, server, section and additional
  /// data so multiple instances of the same section can coexist.
  String get stableId {
    if (kind == HomeSectionKind.pluginDynamic) {
      return 'pluginDynamic:${pluginSource.serializedName}:${serverId ?? ''}:${pluginSection ?? ''}:${pluginAdditionalData ?? ''}';
    }
    return 'builtin:${type.serializedName}';
  }

  bool get isBuiltin => kind == HomeSectionKind.builtin;
  bool get isPluginDynamic => kind == HomeSectionKind.pluginDynamic;

  static List<HomeSectionConfig> defaults() => const [
    HomeSectionConfig(
      type: HomeSectionType.libraryTilesSmall,
      enabled: true,
      order: 0,
    ),
    HomeSectionConfig(type: HomeSectionType.resume, enabled: true, order: 1),
    HomeSectionConfig(type: HomeSectionType.nextUp, enabled: true, order: 2),
    HomeSectionConfig(
      type: HomeSectionType.latestMedia,
      enabled: true,
      order: 3,
    ),
    HomeSectionConfig(
      type: HomeSectionType.recentlyReleased,
      enabled: false,
      order: 4,
    ),
    HomeSectionConfig(type: HomeSectionType.liveTv, enabled: false, order: 5),
    HomeSectionConfig(
      type: HomeSectionType.libraryButtons,
      enabled: false,
      order: 6,
    ),
    HomeSectionConfig(
      type: HomeSectionType.resumeAudio,
      enabled: false,
      order: 7,
    ),
    HomeSectionConfig(
      type: HomeSectionType.resumeBook,
      enabled: false,
      order: 8,
    ),
    HomeSectionConfig(
      type: HomeSectionType.activeRecordings,
      enabled: false,
      order: 9,
    ),
    HomeSectionConfig(
      type: HomeSectionType.collections,
      enabled: false,
      order: 10,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoriteMovies,
      enabled: false,
      order: 11,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoriteSeries,
      enabled: false,
      order: 12,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoriteEpisodes,
      enabled: false,
      order: 13,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoritePeople,
      enabled: false,
      order: 14,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoriteArtists,
      enabled: false,
      order: 15,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoriteMusicVideos,
      enabled: false,
      order: 16,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoriteAlbums,
      enabled: false,
      order: 17,
    ),
    HomeSectionConfig(
      type: HomeSectionType.favoriteSongs,
      enabled: false,
      order: 18,
    ),
    HomeSectionConfig(type: HomeSectionType.genres, enabled: false, order: 19),
    HomeSectionConfig(
      type: HomeSectionType.playlists,
      enabled: false,
      order: 20,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrRecentRequests,
      enabled: false,
      order: 21,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrRecentlyAdded,
      enabled: false,
      order: 22,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrPopularMovies,
      enabled: false,
      order: 23,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrUpcomingMovies,
      enabled: false,
      order: 24,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrPopularSeries,
      enabled: false,
      order: 25,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrUpcomingSeries,
      enabled: false,
      order: 26,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrTrending,
      enabled: false,
      order: 27,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrMovieGenres,
      enabled: false,
      order: 28,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrStudios,
      enabled: false,
      order: 29,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrSeriesGenres,
      enabled: false,
      order: 30,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrNetworks,
      enabled: false,
      order: 31,
    ),
    HomeSectionConfig(
      type: HomeSectionType.imdbTop250Movies,
      enabled: false,
      order: 32,
    ),
    HomeSectionConfig(
      type: HomeSectionType.imdbTop250TvShows,
      enabled: false,
      order: 33,
    ),
    HomeSectionConfig(
      type: HomeSectionType.imdbMostPopularMovies,
      enabled: false,
      order: 34,
    ),
    HomeSectionConfig(
      type: HomeSectionType.imdbMostPopularTvShows,
      enabled: false,
      order: 35,
    ),
    HomeSectionConfig(
      type: HomeSectionType.imdbLowestRatedMovies,
      enabled: false,
      order: 36,
    ),
    HomeSectionConfig(
      type: HomeSectionType.imdbTopEnglishMovies,
      enabled: false,
      order: 37,
    ),
    HomeSectionConfig(
      type: HomeSectionType.radarrCalendar,
      enabled: false,
      order: 38,
    ),
    HomeSectionConfig(
      type: HomeSectionType.sonarrCalendar,
      enabled: false,
      order: 39,
    ),
  ];

  static List<HomeSectionConfig> fromJsonString(String jsonString) {
    if (jsonString.isEmpty) return defaults();
    try {
      final list = jsonDecode(jsonString) as List;
      return list
          .map((e) => HomeSectionConfig.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return defaults();
    }
  }

  static String toJsonString(List<HomeSectionConfig> configs) =>
      jsonEncode(configs.map((c) => c.toJson()).toList());
}
