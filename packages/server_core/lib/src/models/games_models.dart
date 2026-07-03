// Models for the Moonbase plugin retro-games (EmulatorJS) API.
// The plugin emits camelCase JSON (System.Text.Json [JsonPropertyName]).

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

  const GameSystem({
    required this.id,
    required this.name,
    required this.core,
    required this.gameCount,
  });

  factory GameSystem.fromJson(Map<String, dynamic> json) => GameSystem(
        id: (json['id'] as String?) ?? '',
        name: (json['name'] as String?) ?? '',
        core: (json['core'] as String?) ?? '',
        gameCount: (json['gameCount'] as num?)?.toInt() ?? 0,
      );
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
    this.genre,
    this.developer,
    this.publisher,
    this.franchise,
    this.region,
    this.year,
    this.players,
    this.overview,
    this.rating,
  });

  factory GameDetail.fromJson(Map<String, dynamic> json) => GameDetail(
        id: (json['id'] as String?) ?? '',
        title: (json['title'] as String?) ?? '',
        system: (json['system'] as String?) ?? '',
        core: (json['core'] as String?) ?? '',
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
