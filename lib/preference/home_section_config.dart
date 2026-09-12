import 'dart:convert';
import '../data/services/seerr/seerr_slider_catalog.dart';
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

  /// A `homeRowOrder` / JSON `type` string. Old Seerr names become sliders.
  /// Unknown names are dropped.
  static HomeSectionConfig? tryFromTypeName(
    String typeName, {
    required bool enabled,
    required int order,
  }) {
    final cfg = tryFromJson({
      'type': typeName,
      'enabled': enabled,
      'order': order,
    });
    if (cfg == null) return null;
    if (cfg.isBuiltin && cfg.type == HomeSectionType.none) return null;
    return cfg;
  }

  factory HomeSectionConfig.seerrSlider({
    String? sliderId,
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
    final typeName = json['type'] as String? ?? 'none';
    if (kindRaw == HomeSectionKind.seerrSlider.serializedName ||
        typeName == seerrSliderSerializedType) {
      final id = json['sliderId']?.toString();
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
    final enabled = json['enabled'] as bool? ?? true;
    final order = json['order'] as int? ?? 0;
    final kind = kindRaw == null
        ? HomeSectionKind.builtin
        : HomeSectionKind.fromSerialized(kindRaw);
    final pluginSource = HomeSectionPluginSource.fromSerialized(
      json['pluginSource'] as String?,
    );
    return HomeSectionConfig(
      kind: kind,
      type: HomeSectionType.fromSerialized(typeName),
      enabled: enabled,
      order: order,
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
      if (sliderId != null && sliderId!.isNotEmpty) {
        json['sliderId'] = sliderId;
      }
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
  ) =>
      (serverId == null || serverId.isEmpty) &&
              source == HomeSectionPluginSource.custom
          ? 'custom'
          : serverId;

  /// Stable identifier suitable for use as a row id / list key. Plugin
  /// entries combine the originating plugin, server, section and additional
  /// data so multiple instances of the same section can coexist.
  String get stableId {
    if (kind == HomeSectionKind.seerrSlider) {
      if (sliderId != null && sliderId!.isNotEmpty) {
        return 'seerrSlider:$sliderId';
      }
      if (sliderType != null) return 'seerrSlider:type:$sliderType';
      return 'seerrSlider:';
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

  bool get isSeerrShortcutsSlider =>
      isSeerrSlider && isSeerrShortcutsSliderId(sliderId);

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

  /// Ingest entry. Null for unknown plugin sources, builtin [HomeSectionType.none],
  /// and sliders with no identity (id or type).
  static HomeSectionConfig? tryFromJson(Map<String, dynamic> json) {
    if (!_isKnownJsonKind(json)) return null;
    final cfg = HomeSectionConfig.fromJson(json);
    if (cfg.isBuiltin && cfg.type == HomeSectionType.none) return null;
    if (cfg.isSeerrSlider) {
      final id = cfg.sliderId;
      final hasId = id != null && id.isNotEmpty;
      if (!hasId && cfg.sliderType == null) return null;
    }
    return cfg;
  }

  /// Known kinds/sources only. Instance fields are validated in [tryFromJson].
  static bool _isKnownJsonKind(Map<String, dynamic> json) {
    final kind = json['kind'] as String?;
    if (kind == HomeSectionKind.seerrSlider.serializedName) return true;
    if (json['type'] == seerrSliderSerializedType) return true;
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
        if (e is! Map) continue;
        final cfg = tryFromJson(Map<String, dynamic>.from(e));
        if (cfg != null) parsed.add(cfg);
      }
      return _appendMissingBuiltins(parsed);
    } catch (_) {
      return defaults();
    }
  }

  /// Adds any built-in sections missing from a user's saved config so they
  /// show up without needing a reset. New sections keep their default enabled
  /// state and go at the end to keep the user's existing order.
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

  /// One-shot rewrite of stored home JSON. Old `seerr_trending` types become
  /// sliders, leftover `legacy:` ids unbind, [seerrHomeRowEnabledBySliderType]
  /// ANDs onto pending rows, and a pending row plus a live slider of the same
  /// type collapse. Live ingest does not call this.
  static String migrateLegacySeerrHomeJson(
    String jsonString, {
    Map<int, bool>? seerrHomeRowEnabledBySliderType,
    bool? seerrShortcutsHomeRowEnabled,
  }) {
    if (jsonString.isEmpty) return jsonString;
    try {
      final list = jsonDecode(jsonString) as List;
      final parsed = <HomeSectionConfig>[];
      for (final e in list) {
        if (e is! Map) continue;
        final cfg = tryFromJson(
          _rewriteLegacySeerrHomeJson(Map<String, dynamic>.from(e)),
        );
        if (cfg != null) parsed.add(cfg);
      }
      final unbound = [
        for (final section in parsed) _unbindOldPlaceholderSliderId(section),
      ];
      final gated = [
        for (final section in unbound)
          _applyMigratedSeerrHomeRowEnabled(
            section,
            seerrHomeRowEnabledBySliderType,
            seerrShortcutsHomeRowEnabled,
          ),
      ];
      return toJsonString(
        _appendMissingBuiltins(_collapseDuplicateSeerrDiscoverTypes(gated)),
      );
    } catch (_) {
      return jsonString;
    }
  }

  static Map<String, dynamic> _rewriteLegacySeerrHomeJson(
    Map<String, dynamic> json,
  ) {
    if (json['kind'] == HomeSectionKind.seerrSlider.serializedName ||
        json['type'] == seerrSliderSerializedType) {
      return json;
    }
    final typeName = json['type'] as String? ?? '';
    const prefix = 'seerr_';
    if (!typeName.startsWith(prefix)) return json;
    final row = SeerrRowType.tryFromSerialized(typeName.substring(prefix.length));
    if (row == null) return json;
    final enabled = json['enabled'] as bool? ?? true;
    final order = json['order'] as int? ?? 0;
    if (row == SeerrRowType.shortcuts) {
      return HomeSectionConfig.seerrSlider(
        sliderId: seerrShortcutsSliderId,
        pluginDisplayText:
            json['pluginDisplayText'] as String? ?? 'Seerr Browse',
        enabled: enabled,
        order: order,
      ).toJson();
    }
    return HomeSectionConfig.seerrSlider(
      sliderType: row.discoverSliderType,
      pluginDisplayText: json['pluginDisplayText'] as String?,
      enabled: enabled,
      order: order,
    ).toJson();
  }

  static const _oldPlaceholderPrefix = 'legacy:';

  /// One-shot: persisted `legacy:<n>` becomes sliderType-only.
  static HomeSectionConfig _unbindOldPlaceholderSliderId(
    HomeSectionConfig section,
  ) {
    final id = section.sliderId;
    if (id == null || !id.startsWith(_oldPlaceholderPrefix)) return section;
    final fromId = int.tryParse(id.substring(_oldPlaceholderPrefix.length));
    final type = section.sliderType ?? fromId;
    return HomeSectionConfig.seerrSlider(
      sliderType: type,
      pluginDisplayText: section.pluginDisplayText,
      enabled: section.enabled,
      order: section.order,
    );
  }

  static HomeSectionConfig _applyMigratedSeerrHomeRowEnabled(
    HomeSectionConfig section,
    Map<int, bool>? seerrHomeRowEnabledBySliderType,
    bool? seerrShortcutsHomeRowEnabled,
  ) {
    if (section.isSeerrShortcutsSlider) {
      if (seerrShortcutsHomeRowEnabled == false) {
        return section.copyWith(enabled: false);
      }
      return section;
    }
    if (!section.isSeerrSlider || seerrHomeRowEnabledBySliderType == null) {
      return section;
    }
    if (section.seerrSliderId != null) return section;
    final type = section.sliderType;
    if (type == null) return section;
    if (seerrHomeRowEnabledBySliderType[type] == false) {
      return section.copyWith(enabled: false);
    }
    return section;
  }

  static List<HomeSectionConfig> _collapseDuplicateSeerrDiscoverTypes(
    List<HomeSectionConfig> sections,
  ) {
    final numericByType = <int, int>{};
    for (var i = 0; i < sections.length; i++) {
      final section = sections[i];
      if (!section.isSeerrSlider) continue;
      final type = section.sliderType;
      if (type == null) continue;
      if (section.seerrSliderId == null) continue;
      numericByType.putIfAbsent(type, () => i);
    }

    final drop = <int>{};
    final overlay = <int, HomeSectionConfig>{};
    for (var i = 0; i < sections.length; i++) {
      final section = sections[i];
      if (!section.isSeerrSlider || section.isSeerrShortcutsSlider) continue;
      if (section.seerrSliderId != null) continue;
      final type = section.sliderType;
      if (type == null) continue;
      final numericIndex = numericByType[type];
      if (numericIndex == null) continue;
      drop.add(i);
      final numeric = overlay[numericIndex] ?? sections[numericIndex];
      overlay[numericIndex] = numeric.copyWith(
        enabled: section.enabled,
        order: section.order,
      );
    }
    if (drop.isEmpty && overlay.isEmpty) return sections;

    final collapsed = <HomeSectionConfig>[];
    for (var i = 0; i < sections.length; i++) {
      if (drop.contains(i)) continue;
      collapsed.add(overlay[i] ?? sections[i]);
    }
    return collapsed;
  }

  static String toJsonString(List<HomeSectionConfig> configs) =>
      jsonEncode(configs.map((c) => c.toJson()).toList());

  static int? _sliderTypeFromJson(Map<String, dynamic> json) {
    final raw = json['sliderType'];
    if (raw is num) return raw.toInt();
    if (raw is String) return int.tryParse(raw);
    return null;
  }
}
