import '../models/games_models.dart';

/// Client surface for the Moonbase plugin retro-games (EmulatorJS) API.
///
/// Returns null from [MediaServerClient.gamesApi] on servers without the plugin.
/// Methods may throw on transport / HTTP failures; callers should treat any
/// failure as "games unavailable".
abstract class GamesApi {
  /// GET /Moonfin/Games/Libraries
  Future<List<GameLibrary>> getLibraries();

  /// GET /Moonfin/Games/{libraryId}/Systems
  Future<List<GameSystem>> getSystems(String libraryId);

  /// GET /Moonfin/Games/{libraryId}/Games?system=...
  Future<List<GameSummary>> getGames(String libraryId, {String? system});

  /// GET /Moonfin/Games/{libraryId}/Games/{gameId}
  Future<GameDetail?> getGame(String libraryId, String gameId);

  /// Builds the authenticated EmulatorJS player shell URL with all params set.
  String playerUrl({
    required String libraryId,
    required String gameId,
    required String core,
    String? biosId,
    String? gameName,
    bool includeSaveUrl = false,
  });

  /// GET /Moonfin/Games/Saves/{gameId}: returns the stored save blob or null.
  Future<List<int>?> getSave(String gameId, {String kind = 'state'});

  /// PUT /Moonfin/Games/Saves/{gameId}: stores a save blob for the user.
  Future<void> putSave(String gameId, List<int> data, {String kind = 'state'});
}
