import 'dart:convert';
import 'preference_constants.dart';

/// Categorizes a [HomeSectionConfig].
///
/// `builtin` entries map to a [HomeSectionType] handled natively by the app.
/// `pluginDynamic` entries are dynamic rows discovered from a third-party
/// Jellyfin plugin and are scoped to a specific server. The originating
/// plugin is identified by [HomeSectionPluginSource].
/// `seerrSlider` entries are Seerr `GET /settings/discover` sliders.
/// Identity is [HomeSectionConfig.sliderId]. [type] is [HomeSectionType.none],
/// same as [pluginDynamic]; JSON still writes `seerr_slider` so Plugin can
/// tell them apart from other `none` rows.
enum HomeSectionKind {
  builtin('builtin'),
  pluginDynamic('pluginDynamic'),
  seerrSlider('seerrSlider');

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
  collections('collections'),

  genres('genres'),

  playlists('playlists'),

  custom('custom');

  const HomeSectionPluginSource(this.serializedName);
  final String serializedName;

  static HomeSectionPluginSource fromSerialized(String? value) {
    for (final v in HomeSectionPluginSource.values) {
      if (v.serializedName == value) return v;
    }
    return HomeSectionPluginSource.collections;
  }
}

class HomeSectionConfig {
  final HomeSectionKind kind;
  final HomeSectionType type;
  final bool enabled;
  final int order;

  // pluginDynamic-only fields. Always null for builtin entries.
  // seerrSlider reuses pluginDisplayText for the persisted label.
  final String? serverId;
  final String? pluginSection;
  final String? pluginAdditionalData;
  final String? pluginDisplayText;
  final HomeSectionPluginSource pluginSource;

  /// seerrSlider identity. Null for every other kind.
  final String? sliderId;

  /// Raw Seerr `DiscoverSliderType`. Null for every other kind.
  final int? sliderType;

  const HomeSectionConfig({
    this.kind = HomeSectionKind.builtin,
    this.type = HomeSectionType.none,
    this.enabled = true,
    this.order = 0,
    this.serverId,
    this.pluginSection,
    this.pluginAdditionalData,
    this.pluginDisplayText,
    this.pluginSource = HomeSectionPluginSource.collections,
    this.sliderId,
    this.sliderType,
  });

  factory HomeSectionConfig.pluginDynamic({
    required String serverId,
    required String pluginSection,
    String? pluginAdditionalData,
    String? pluginDisplayText,
    bool enabled = true,
    int order = 0,
    HomeSectionPluginSource pluginSource = HomeSectionPluginSource.collections,
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

  /// Wire `type` for seerrSlider rows. Not a [HomeSectionType] value.
  static const seerrSliderSerializedType = 'seerr_slider';

  factory HomeSectionConfig.seerrSlider({
    required String sliderId,
    int? sliderType,
    String? pluginDisplayText,
    bool enabled = false,
    int order = 0,
  }) => HomeSectionConfig(
    kind: HomeSectionKind.seerrSlider,
    type: HomeSectionType.none,
    enabled: enabled,
    order: order,
    pluginDisplayText: pluginDisplayText,
    sliderId: sliderId,
    sliderType: sliderType,
  );

  factory HomeSectionConfig.fromJson(Map<String, dynamic> json) {
    final kindRaw = json['kind'] as String?;
    final pluginSourceRaw = json['pluginSource'] as String?;
    final typeName = json['type'] as String? ?? 'none';
    if (kindRaw == HomeSectionKind.seerrSlider.serializedName ||
        (kindRaw == HomeSectionKind.pluginDynamic.serializedName &&
            pluginSourceRaw == 'seerr') ||
        typeName == seerrSliderSerializedType ||
        _legacySeerrSliderTypeNames.containsKey(typeName)) {
      final id =
          json['sliderId']?.toString() ?? json['pluginAdditionalData']?.toString();
      return HomeSectionConfig(
        kind: HomeSectionKind.seerrSlider,
        type: HomeSectionType.none,
        enabled: json['enabled'] as bool? ?? true,
        order: json['order'] as int? ?? 0,
        pluginDisplayText: json['pluginDisplayText'] as String?,
        sliderId: id,
        sliderType: _sliderTypeFromJson(json),
      );
    }
    final kind = kindRaw == null
        ? HomeSectionKind.builtin
        : HomeSectionKind.fromSerialized(kindRaw);
    final pluginSource = HomeSectionPluginSource.fromSerialized(pluginSourceRaw);
    return HomeSectionConfig(
      kind: kind,
      type: HomeSectionType.fromSerialized(typeName),
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      serverId: _normalizedServerId(json['serverId']?.toString(), pluginSource),
      pluginSection: json['pluginSection'] as String?,
      pluginAdditionalData: json['pluginAdditionalData'] as String?,
      pluginDisplayText: json['pluginDisplayText'] as String?,
      pluginSource: pluginSource,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'type': type.serializedName,
      'enabled': enabled,
      'order': order,
    };
    if (kind == HomeSectionKind.seerrSlider) {
      json['kind'] = kind.serializedName;
      json['type'] = seerrSliderSerializedType;
      if (sliderId != null) json['sliderId'] = sliderId;
      if (sliderType != null) json['sliderType'] = sliderType;
      if (pluginDisplayText != null) {
        json['pluginDisplayText'] = pluginDisplayText;
      }
      return json;
    }
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
    String? sliderId,
    int? sliderType,
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
    sliderId: sliderId ?? this.sliderId,
    sliderType: sliderType ?? this.sliderType,
  );

  /// Custom rows belong to no server, and an empty serverId coming back from a saved
  /// layout would give the same row a second identity, so both ends use this placeholder.
  static String? _normalizedServerId(
    String? serverId,
    HomeSectionPluginSource source,
  ) {
    if (serverId != null && serverId.isNotEmpty) return serverId;
    return switch (source) {
      HomeSectionPluginSource.custom => 'custom',
      _ => serverId,
    };
  }

  /// Stable identifier suitable for use as a row id / list key. Plugin
  /// entries combine the originating plugin, server, section and additional
  /// data so multiple instances of the same section can coexist.
  String get stableId {
    if (kind == HomeSectionKind.seerrSlider) {
      return 'seerrSlider:${sliderId ?? ''}';
    }
    if (kind == HomeSectionKind.pluginDynamic) {
      final effectiveServerId =
          _normalizedServerId(serverId, pluginSource) ?? '';
      return 'pluginDynamic:${pluginSource.serializedName}:$effectiveServerId:${pluginSection ?? ''}:${pluginAdditionalData ?? ''}';
    }
    return 'builtin:${type.serializedName}';
  }

  bool get isBuiltin => kind == HomeSectionKind.builtin;
  bool get isPluginDynamic => kind == HomeSectionKind.pluginDynamic;
  bool get isSeerrSlider => kind == HomeSectionKind.seerrSlider;

  /// False for slider rows with no id, and for builtin [HomeSectionType.none]
  /// leftovers from legacy `homeRowOrder` pollution.
  bool get isPersistable {
    if (isSeerrSlider) {
      return sliderId != null && sliderId!.isNotEmpty;
    }
    if (isBuiltin && type == HomeSectionType.none) {
      return false;
    }
    return true;
  }

  int? get seerrSliderId => int.tryParse(sliderId ?? '');

  /// Legacy `homeRowOrder` is builtin types only. Plugin JS already filters
  /// this way; sliders live in `homeSections`.
  static List<String> homeRowOrderNames(List<HomeSectionConfig> configs) =>
      configs
          .where(
            (c) =>
                c.enabled &&
                c.isBuiltin &&
                c.type != HomeSectionType.none,
          )
          .map((c) => c.type.serializedName)
          .toList();

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
      type: HomeSectionType.studios,
      enabled: false,
      order: 21,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrShortcuts,
      enabled: false,
      order: 22,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrRecentRequests,
      enabled: false,
      order: 21,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrWatchlist,
      enabled: false,
      order: 22,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrRecentlyAdded,
      enabled: false,
      order: 23,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrPopularMovies,
      enabled: false,
      order: 24,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrUpcomingMovies,
      enabled: false,
      order: 25,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrPopularSeries,
      enabled: false,
      order: 26,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrUpcomingSeries,
      enabled: false,
      order: 27,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrTrending,
      enabled: false,
      order: 28,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrMovieGenres,
      enabled: false,
      order: 29,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrStudios,
      enabled: false,
      order: 30,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrSeriesGenres,
      enabled: false,
      order: 31,
    ),
    HomeSectionConfig(
      type: HomeSectionType.seerrNetworks,
      enabled: false,
      order: 32,
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
    // These carry a toggle preference too, but they still need a section entry.
    // Without one there was nowhere for turning the row off to persist, so the
    // next sync kept bringing it back.
    HomeSectionConfig(
      type: HomeSectionType.sinceYouWatched1,
      enabled: false,
      order: 40,
    ),
    HomeSectionConfig(
      type: HomeSectionType.sinceYouWatched2,
      enabled: false,
      order: 41,
    ),
    HomeSectionConfig(
      type: HomeSectionType.sinceYouWatched3,
      enabled: false,
      order: 42,
    ),
    HomeSectionConfig(
      type: HomeSectionType.sinceYouWatched4,
      enabled: false,
      order: 43,
    ),
    HomeSectionConfig(
      type: HomeSectionType.sinceYouWatched5,
      enabled: false,
      order: 44,
    ),
    HomeSectionConfig(
      type: HomeSectionType.rewatch,
      enabled: false,
      order: 45,
    ),
  ];

  static bool isSupportedJson(Map<String, dynamic> json) {
    final kind = json['kind'] as String?;
    if (kind == HomeSectionKind.seerrSlider.serializedName) return true;
    if (kind == HomeSectionKind.pluginDynamic.serializedName &&
        json['pluginSource'] == 'seerr') {
      return true;
    }
    final typeName = json['type'] as String?;
    if (typeName == seerrSliderSerializedType ||
        _legacySeerrSliderTypeNames.containsKey(typeName)) {
      return true;
    }
    if (kind != HomeSectionKind.pluginDynamic.serializedName) return true;
    final source = json['pluginSource'] as String?;
    return HomeSectionPluginSource.values.any((s) => s.serializedName == source);
  }

  static List<HomeSectionConfig> fromJsonString(String jsonString) {
    if (jsonString.isEmpty) return defaults();
    try {
      final list = jsonDecode(jsonString) as List;
      final parsed = <HomeSectionConfig>[];
      for (final e in list) {
        if (e is Map<String, dynamic> && isSupportedJson(e)) {
          final cfg = HomeSectionConfig.fromJson(e);
          if (!cfg.isPersistable) continue;
          parsed.add(cfg);
        }
      }
      return _appendMissingBuiltins(parsed);
    } catch (_) {
      return defaults();
    }
  }

  /// Adds any built-in sections missing from a user's saved config, like the
  /// Seerr watchlist, so they show up without needing a reset. New sections
  /// keep their default enabled state and go at the end to keep the user's
  /// existing order.
  static List<HomeSectionConfig> _appendMissingBuiltins(
    List<HomeSectionConfig> parsed,
  ) {
    final presentTypes = parsed
        .where((c) => c.isBuiltin)
        .map((c) => c.type)
        .toSet();
    final merged = List<HomeSectionConfig>.of(parsed);
    var order = parsed.fold<int>(-1, (m, c) => c.order > m ? c.order : m) + 1;
    for (final def in defaults()) {
      if (def.isBuiltin && !presentTypes.contains(def.type)) {
        merged.add(def.copyWith(order: order++));
      }
    }
    return merged;
  }

  static String toJsonString(List<HomeSectionConfig> configs) =>
      jsonEncode(configs.map((c) => c.toJson()).toList());

  static int? _sliderTypeFromJson(Map<String, dynamic> json) {
    final raw = json['sliderType'];
    if (raw is num) return raw.toInt();
    if (raw is String) {
      final parsed = int.tryParse(raw);
      if (parsed != null) return parsed;
    }
    return _legacySeerrSliderTypeNames[json['type'] as String?];
  }
}

/// Serialized names from the short-lived per-slider HomeSectionType values.
const _legacySeerrSliderTypeNames = {
  'seerr_tmdb_movie_keyword': 13,
  'seerr_tmdb_movie_genre': 14,
  'seerr_tmdb_tv_keyword': 15,
  'seerr_tmdb_tv_genre': 16,
  'seerr_tmdb_search': 17,
  'seerr_tmdb_studio': 18,
  'seerr_tmdb_network': 19,
  'seerr_tmdb_movie_streaming': 20,
  'seerr_tmdb_tv_streaming': 21,
  'seerr_trakt_recommendations': 22,
  'seerr_trakt_watchlist': 23,
  'seerr_trakt_list': 24,
  'seerr_trakt_history': 25,
  'seerr_anilist_trending': 26,
  'seerr_anilist_season': 27,
  'seerr_anilist_watching': 28,
  'seerr_anilist_planning': 29,
  'seerr_anilist_completed': 30,
  'seerr_anilist_list': 31,
  'seerr_anilist_popular': 32,
  'seerr_anilist_top': 33,
  'seerr_anilist_next_season': 34,
  'seerr_mdblist_list': 35,
  'seerr_simkl_trending': 36,
  'seerr_simkl_plan_to_watch': 37,
  'seerr_simkl_watching': 44,
  'seerr_simkl_on_hold': 45,
  'seerr_simkl_completed': 46,
  'seerr_simkl_dropped': 47,
};
