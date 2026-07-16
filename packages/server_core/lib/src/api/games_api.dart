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

  /// GET /Moonfin/Games/{libraryId}/Thumb/{gameId}: the game's art, fetched and cached
  /// by the plugin. [kind] is `boxart` (the poster), `snap` (an in-game shot) or
  /// `title`. Returns a URL even when the game has no art, so callers still need an
  /// error fallback.
  String thumbUrl({
    required String libraryId,
    required String gameId,
    String kind = 'boxart',
  });

  /// Builds the authenticated EmulatorJS player shell URL with all params set.
  String playerUrl({
    required String libraryId,
    required String gameId,
    required String core,
    String? biosId,
    String? gameName,
    bool includeSaveUrl = false,
  });

  /// Streams GET /Moonfin/Games/{libraryId}/Rom/{gameId} to [destPath].
  /// Used by the native (non-WebView) player; ROMs can be large, so the bytes
  /// are written straight to disk.
  Future<void> downloadRom(
    String libraryId,
    String gameId,
    String destPath, {
    void Function(int received, int total)? onProgress,
  });

  /// Streams GET /Moonfin/Games/{libraryId}/Bios/{biosId} to [destPath].
  Future<void> downloadBios(String libraryId, String biosId, String destPath);

  /// GET /Moonfin/Games/Saves/{gameId}: returns the stored save blob or null.
  Future<List<int>?> getSave(String gameId, {String kind = 'state'});

  /// PUT /Moonfin/Games/Saves/{gameId}: stores a save blob for the user.
  Future<void> putSave(String gameId, List<int> data, {String kind = 'state'});
}
