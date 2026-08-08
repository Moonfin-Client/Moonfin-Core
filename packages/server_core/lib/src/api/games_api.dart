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

  /// GET /Moonfin/Games/ArtworkCapabilities.
  ///
  /// The default preserves protocol-1 behavior for non-Moonfin and legacy
  /// implementations. A capable API overrides this with its server response.
  Future<GameArtworkCapabilities?> getArtworkCapabilities() async => null;

  /// GET /Moonfin/Games/{libraryId}/ArtworkManifest?system=...&generation=...
  ///
  /// Null represents an unsupported protocol or an unchanged (304) manifest.
  Future<GameArtworkManifest?> getArtworkManifest(
    String libraryId, {
    required String systemId,
    String? knownGeneration,
    Object? cancellationOwner,
  }) async => null;

  /// POST /Moonfin/Games/{libraryId}/ArtworkPriority.
  ///
  /// The ordered hint only promotes deduplicated server work. Legacy APIs
  /// intentionally ignore it.
  Future<void> submitArtworkPriority(
    String libraryId,
    GameArtworkPriorityRequest request, {
    Object? cancellationOwner,
  }) async {}

  /// Cancels active manifest and priority requests, when supported.
  ///
  /// Legacy implementations have no cancellable artwork metadata transport.
  void cancelArtworkRequests({Object? cancellationOwner}) {}

  /// Resolves a server-provided artwork path for an image loader.
  ///
  /// Versioned artwork resources are authenticated just like the legacy thumb
  /// endpoint, so implementations may append their access-token query value.
  ///
  /// This is legacy protocol-1 surface: it exists only for the unversioned
  /// `/Thumb/{gameId}`-style path a pre-manifest server or client still uses.
  /// Manifest-driven adapters (protocol 2+) must resolve artwork through
  /// [GameArtworkDescriptor.url] instead, not through this method — that
  /// descriptor URL is what carries the revision/versioning the manifest
  /// protocol depends on.
  String artworkUrl(String path) => path;

  /// GET /Moonfin/Games/{libraryId}/Games?system=...
  Future<List<GameSummary>> getGames(String libraryId, {String? system});

  /// GET /Moonfin/Games/{libraryId}/Games/{gameId}
  Future<GameDetail?> getGame(String libraryId, String gameId);

  /// PUT /Moonfin/Games/{libraryId}/Games/{gameId}/Core
  ///
  /// Stores the current user's arcade-core override. Passing null clears the
  /// override and returns to the server's recommended core. The returned
  /// detail includes the effective [GameDetail.core].
  Future<GameDetail?> setGameCoreOverride(
    String libraryId,
    String gameId, {
    String? core,
  });

  /// PUT /Moonfin/Games/{libraryId}/Games/{gameId}/Backend
  ///
  /// Stores the user's player backend preference. `emulatorjs` forces the
  /// EmulatorJS WebView; null restores normal native/fallback routing.
  Future<GameDetail?> setGameBackendOverride(
    String libraryId,
    String gameId, {
    String? backend,
  });

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
  ///
  /// When a state URL is included, [saveId] identifies its server-side save
  /// namespace. It defaults to [gameId] for callers that do not need a
  /// core-specific state.
  String playerUrl({
    required String libraryId,
    required String gameId,
    required String core,
    String? romFileName,
    String? biosId,
    String? gameName,
    bool includeSaveUrl = false,
    String? saveId,
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
