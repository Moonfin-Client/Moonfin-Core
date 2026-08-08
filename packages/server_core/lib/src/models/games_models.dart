// Models for the Moonbase plugin retro-games (EmulatorJS) API.
// The plugin emits camelCase JSON (System.Text.Json [JsonPropertyName]).

/// A download target must be a single path segment. The server names these
/// files, so a traversal or absolute path here means the server is hostile or
/// compromised — reject rather than sanitize, matching the same decision made
/// for `game_id` in the native host's `lh_load`.
String sanitizeDownloadFileName(String raw) {
  final name = raw.trim();
  if (name.isEmpty || name == '.' || name == '..') {
    throw FormatException('Unusable download file name: "$raw"');
  }
  if (name.contains('/') || name.contains('\\') || name.contains('\u0000')) {
    throw FormatException(
        'Download file name must be a single segment: "$raw"');
  }
  return name;
}

class GameLibrary {
  final String id;
  final String name;

  const GameLibrary({required this.id, required this.name});

  factory GameLibrary.fromJson(Map<String, dynamic> json) => GameLibrary(
        id: (json['id'] as String?) ?? '',
        name: (json['name'] as String?) ?? 'Games',
      );
}

class GameSystem {
  final String id;
  final String name;
  final String core;
  final int gameCount;
  final GameSystemPreviewArtwork? previewArtwork;

  const GameSystem({
    required this.id,
    required this.name,
    required this.core,
    required this.gameCount,
    this.previewArtwork,
  });

  factory GameSystem.fromJson(Map<String, dynamic> json) => GameSystem(
    id: (json['id'] as String?) ?? '',
    name: (json['name'] as String?) ?? '',
    core: (json['core'] as String?) ?? '',
    gameCount: _intValue(json['gameCount']) ?? 0,
    previewArtwork: json['previewArtwork'] is Map
        ? GameSystemPreviewArtwork.fromJson(
            (json['previewArtwork'] as Map).cast<String, dynamic>(),
          )
        : null,
  );
}

/// Additive retro-artwork protocol support advertised by a Moonfin plugin.
/// A missing or malformed capability response is treated as protocol 1.
class GameArtworkCapabilities {
  final int protocolVersion;
  final bool manifest;
  final bool versionedAssets;
  final bool priorityHints;
  final bool systemPreviews;

  const GameArtworkCapabilities({
    this.protocolVersion = 1,
    this.manifest = false,
    this.versionedAssets = false,
    this.priorityHints = false,
    this.systemPreviews = false,
  });

  bool get supportsManifest => protocolVersion >= 2 && manifest;
  bool get supportsVersionedAssets => protocolVersion >= 2 && versionedAssets;
  bool get supportsPriorityHints => protocolVersion >= 2 && priorityHints;
  bool get supportsSystemPreviews => protocolVersion >= 2 && systemPreviews;

  factory GameArtworkCapabilities.fromJson(Map<String, dynamic> json) =>
      GameArtworkCapabilities(
        protocolVersion: _intValue(json['protocolVersion']) ?? 1,
        manifest: json['manifest'] is bool ? json['manifest'] as bool : false,
        versionedAssets: json['versionedAssets'] is bool
            ? json['versionedAssets'] as bool
            : false,
        priorityHints: json['priorityHints'] is bool
            ? json['priorityHints'] as bool
            : false,
        systemPreviews: json['systemPreviews'] is bool
            ? json['systemPreviews'] as bool
            : false,
      );
}

/// State and version of one server-owned game artwork artifact.
class GameArtworkDescriptor {
  final String state;
  final String? url;
  final String? revision;
  final int? retryAfterSeconds;
  final int? refreshAfterSeconds;

  const GameArtworkDescriptor({
    required this.state,
    this.url,
    this.revision,
    this.retryAfterSeconds,
    this.refreshAfterSeconds,
  });

  bool get isRenderable =>
      (state == 'thumbnailReady' || state == 'originalReady') &&
      url != null &&
      url!.isNotEmpty;

  factory GameArtworkDescriptor.fromJson(Map<String, dynamic> json) =>
      GameArtworkDescriptor(
        state: _stringValue(json['state']) ?? '',
        url: _stringValue(json['url']),
        revision: _stringValue(json['revision']),
        retryAfterSeconds: _intValue(json['retryAfterSeconds']),
        refreshAfterSeconds: _intValue(json['refreshAfterSeconds']),
      );
}

/// One game's artwork entry in a system-scoped manifest.
class GameArtworkManifestEntry {
  final String gameId;
  final Map<String, GameArtworkDescriptor> artwork;

  const GameArtworkManifestEntry({required this.gameId, required this.artwork});

  factory GameArtworkManifestEntry.fromJson(Map<String, dynamic> json) =>
      GameArtworkManifestEntry(
        gameId: _stringValue(json['gameId']) ?? '',
        artwork: _artworkByRole(json['artwork']),
      );
}

/// Current artwork state for one system and one externally visible generation.
class GameArtworkManifest {
  final String generation;
  final List<GameArtworkManifestEntry> entries;

  const GameArtworkManifest({required this.generation, required this.entries});

  factory GameArtworkManifest.fromJson(
    Map<String, dynamic> json,
  ) => GameArtworkManifest(
    generation: _stringValue(json['generation']) ?? '',
    entries: (_listValue(json['entries']) ?? const [])
        .whereType<Map>()
        .map(
          (entry) =>
              GameArtworkManifestEntry.fromJson(entry.cast<String, dynamic>()),
        )
        .toList(growable: false),
  );
}

/// Ordered client hint that promotes existing server artwork work.
class GameArtworkPriorityRequest {
  final String systemId;
  final String knownGeneration;
  final List<GameArtworkPriorityItem> items;

  const GameArtworkPriorityRequest({
    required this.systemId,
    required this.knownGeneration,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
    'systemId': systemId,
    'knownGeneration': knownGeneration,
    'items': items.map((item) => item.toJson()).toList(growable: false),
  };
}

/// One ordered game and its ordered semantic artwork roles in a priority hint.
class GameArtworkPriorityItem {
  final String gameId;
  final List<String> roles;

  const GameArtworkPriorityItem({required this.gameId, required this.roles});

  Map<String, dynamic> toJson() => {'gameId': gameId, 'roles': roles};
}

/// One ordered panel in a server-selected system preview.
class GameSystemPreviewPanel {
  final String gameId;
  final GameArtworkDescriptor artwork;

  const GameSystemPreviewPanel({required this.gameId, required this.artwork});

  factory GameSystemPreviewPanel.fromJson(Map<String, dynamic> json) =>
      GameSystemPreviewPanel(
        gameId: _stringValue(json['gameId']) ?? '',
        artwork: json['artwork'] is Map
            ? GameArtworkDescriptor.fromJson(
                (json['artwork'] as Map).cast<String, dynamic>(),
              )
            : const GameArtworkDescriptor(state: ''),
      );
}

/// Stable server-selected artwork panels for a system card.
class GameSystemPreviewArtwork {
  final String selectionGeneration;
  final List<GameSystemPreviewPanel> panels;

  const GameSystemPreviewArtwork({
    required this.selectionGeneration,
    required this.panels,
  });

  factory GameSystemPreviewArtwork.fromJson(
    Map<String, dynamic> json,
  ) => GameSystemPreviewArtwork(
    selectionGeneration: _stringValue(json['selectionGeneration']) ?? '',
    panels: (_listValue(json['panels']) ?? const [])
        .whereType<Map>()
        .map(
          (panel) =>
              GameSystemPreviewPanel.fromJson(panel.cast<String, dynamic>()),
        )
        .toList(growable: false),
  );
}

String? _stringValue(Object? value) => value is String ? value : null;

int? _intValue(Object? value) =>
    value is num && value.isFinite ? value.toInt() : null;

List? _listValue(Object? value) => value is List ? value : null;

Map<String, GameArtworkDescriptor> _artworkByRole(Object? value) {
  if (value is! Map) return const {};
  final artwork = <String, GameArtworkDescriptor>{};
  for (final entry in value.entries) {
    if (entry.key is String && entry.value is Map) {
      artwork[entry.key as String] = GameArtworkDescriptor.fromJson(
        (entry.value as Map).cast<String, dynamic>(),
      );
    }
  }
  return artwork;
}

class GameSummary {
  final String id;
  final String title;
  final String system;
  final String core;
  final String fileName;

  const GameSummary({
    required this.id,
    required this.title,
    required this.system,
    required this.core,
    required this.fileName,
  });

  factory GameSummary.fromJson(Map<String, dynamic> json) => GameSummary(
        id: (json['id'] as String?) ?? '',
        title: (json['title'] as String?) ?? '',
        system: (json['system'] as String?) ?? '',
        core: (json['core'] as String?) ?? '',
        fileName: (json['fileName'] as String?) ?? '',
      );
}

class GameBios {
  final String id;
  final String fileName;
  final int sizeBytes;

  const GameBios({
    required this.id,
    required this.fileName,
    required this.sizeBytes,
  });

  factory GameBios.fromJson(Map<String, dynamic> json) => GameBios(
        id: (json['id'] as String?) ?? '',
        fileName: (json['fileName'] as String?) ?? '',
        sizeBytes: (json['sizeBytes'] as num?)?.toInt() ?? 0,
      );
}

class GameDetail {
  final String id;
  final String title;
  final String system;
  final String core;

  /// Server-selected core for this game before any per-user override is applied.
  /// Present for arcade games when the server has compatibility data.
  final String? recommendedCore;

  /// Compatible arcade cores the user may select. Empty on servers that do not
  /// expose alternate-core support, and for non-arcade games.
  final List<String> availableCores;

  /// Whether the server explicitly advertised core-override support for this
  /// detail response. Older plugins omit [availableCores], while a supporting
  /// server can legitimately supply an empty list for a non-arcade game.
  final bool? _coreOverridesAdvertised;

  bool get supportsCoreOverrides =>
      _coreOverridesAdvertised ?? availableCores.isNotEmpty;

  /// The server explicitly supports a per-game player choice between the
  /// native libretro host and EmulatorJS. This is unrelated to the arcade-only
  /// [availableCores] response field.
  final bool supportsBackendOverrides;

  /// The current user's explicit core choice, or null when following the
  /// server recommendation.
  final String? userCoreOverride;

  /// Explicit player backend selection. `emulatorjs` forces the WebView even
  /// when a native libretro core is available; null follows normal routing.
  final String? userBackendOverride;

  /// Server-provided explanation for why [recommendedCore] (or the sole
  /// available core) was chosen, e.g. "Validated against both installed
  /// FBNeo and MAME DATs; FBNeo is preferred." Null when the server has no
  /// compatibility data or doesn't expose this field.
  final String? coreCompatibilityReason;
  final String fileName;
  final int sizeBytes;
  final List<GameBios> bios;

  // Optional libretro-database metadata; any field may be null (coverage is uneven).
  final String? genre;
  final String? developer;
  final String? publisher;
  final String? franchise;
  final String? region;
  final int? year;
  final int? players;
  final String? overview;
  final double? rating;

  const GameDetail({
    required this.id,
    required this.title,
    required this.system,
    required this.core,
    required this.fileName,
    required this.sizeBytes,
    required this.bios,
    this.recommendedCore,
    this.availableCores = const [],
    bool? supportsCoreOverrides,
    this.supportsBackendOverrides = false,
    this.userCoreOverride,
    this.userBackendOverride,
    this.coreCompatibilityReason,
    this.genre,
    this.developer,
    this.publisher,
    this.franchise,
    this.region,
    this.year,
    this.players,
    this.overview,
    this.rating,
  }) : _coreOverridesAdvertised = supportsCoreOverrides;

  factory GameDetail.fromJson(Map<String, dynamic> json) => GameDetail(
    id: (json['id'] as String?) ?? '',
    title: (json['title'] as String?) ?? '',
    system: (json['system'] as String?) ?? '',
    core: (json['core'] as String?) ?? '',
    recommendedCore: json['recommendedCore'] as String?,
    availableCores: ((json['availableCores'] as List?) ?? const [])
        .whereType<String>()
        .toList(growable: false),
    supportsCoreOverrides: json.containsKey('availableCores'),
    supportsBackendOverrides: json['backendOverrideSupported'] is bool
        ? json['backendOverrideSupported'] as bool
        : false,
    userCoreOverride: json['userCoreOverride'] as String?,
    userBackendOverride: json['userBackendOverride'] as String?,
    coreCompatibilityReason: json['coreCompatibilityReason'] as String?,
    fileName: (json['fileName'] as String?) ?? '',
    sizeBytes: (json['sizeBytes'] as num?)?.toInt() ?? 0,
    bios: ((json['bios'] as List?) ?? const [])
        .whereType<Map>()
        .map((m) => GameBios.fromJson(m.cast<String, dynamic>()))
        .toList(growable: false),
    genre: json['genre'] as String?,
    developer: json['developer'] as String?,
    publisher: json['publisher'] as String?,
    franchise: json['franchise'] as String?,
    region: json['region'] as String?,
    year: (json['year'] as num?)?.toInt(),
    players: (json['players'] as num?)?.toInt(),
    overview: json['overview'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
  );
}
