import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../offline/connectivity_aware_media_server_client.dart';
import '../services/user_data_sync.dart';

class ItemMutationRepository {
  final MediaServerClient _client;

  ItemMutationRepository(this._client);

  /// The favorite changes in progress, one per server and item. Servers can
  /// hand out the same item id, and each still needs its own request.
  static final _favoriteSyncs = <_FavoriteSyncKey, _FavoriteSync>{};

  /// The server whose favorite change was the last one sent under an item id.
  static final _lastFavoriteServer =
      <String, ({int session, MediaServerClient server})>{};

  /// Shows [isFavorite] at once, then brings the server to the newest choice
  /// one request at a time, so a quick run of toggles ends where the user
  /// left it. Work left over from before a sign-out or user switch stops.
  ///
  /// When a request fails, only the calls asking for something other than
  /// what the server holds throw, so a caller undoing its own toggle on error
  /// lands on the server's value whichever order the callers run in.
  Future<void> setFavorite(String itemId, {required bool isFavorite}) async {
    userDataSync.requestFavorite(itemId, isFavorite);
    final key = (
      session: userDataSync.session,
      // The active client and the factory's can be two wrappers around one
      // server's client.
      server: onlineClientOf(_client),
      itemId: itemId,
    );
    var sync = _favoriteSyncs[key];
    if (sync == null) {
      // The flag [UserDataSync] remembers is the last server's to change this
      // id. When that was another server, this one is sent the change rather
      // than trusted to hold it already.
      final last = _lastFavoriteServer[itemId];
      final rememberedIsOthers =
          last != null &&
          last.session == key.session &&
          !identical(last.server, key.server);
      sync = _favoriteSyncs[key] = _FavoriteSync(
        wanted: isFavorite,
        held: rememberedIsOthers
            ? !isFavorite
            : userDataSync.confirmedFavorite(itemId) ?? !isFavorite,
      );
      sync.done = _syncFavorite(key, sync);
    } else {
      sync.wanted = isFavorite;
    }
    try {
      await sync.done;
    } on _FavoriteSyncFailure catch (failure) {
      if (failure.confirmed == isFavorite) return;
      Error.throwWithStackTrace(failure.error, failure.stackTrace);
    }
  }

  /// [UserDataSync] tracks a change by item id alone, so what this server is
  /// wanted to hold and what it does hold are kept in [sync]. Another
  /// server's change under the same id would otherwise end this one early.
  Future<void> _syncFavorite(_FavoriteSyncKey key, _FavoriteSync sync) async {
    final (:session, server: _, :itemId) = key;
    try {
      // Lets setFavorite store this run before it can finish and remove it.
      await Future<void>.value();
      while (userDataSync.session == session) {
        final wanted = sync.wanted;
        if (wanted == sync.held) {
          if (userDataSync.pendingFavorite(itemId) == wanted) {
            userDataSync.confirmFavorite(itemId, wanted);
          }
          return;
        }
        try {
          if (wanted) {
            await _client.userLibraryApi.markFavorite(itemId);
          } else {
            await _client.userLibraryApi.unmarkFavorite(itemId);
          }
        } catch (error, stackTrace) {
          if (userDataSync.session != session) return;
          userDataSync.failFavoriteChange(itemId);
          throw _FavoriteSyncFailure(error, stackTrace, confirmed: sync.held);
        }
        if (userDataSync.session != session) return;
        sync.held = wanted;
        _lastFavoriteServer[itemId] = (session: session, server: key.server);
        // Another server's run under the same id may have ended the change.
        if (userDataSync.favoriteChangePending(itemId)) {
          userDataSync.confirmFavorite(itemId, wanted);
        }
      }
    } finally {
      _favoriteSyncs.remove(key);
    }
  }

  Future<void> setPlayed(String itemId, {required bool isPlayed}) async {
    if (isPlayed) {
      await _client.userLibraryApi.markPlayed(itemId);
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.setItemSubtitleStreamIndex(itemId, null);
      await prefs.setItemAudioStreamIndex(itemId, null);
    } else {
      await _client.userLibraryApi.unmarkPlayed(itemId);
    }
    // Either way the server drops the resume point, so say so here too rather
    // than leave a progress bar under a watched tick.
    userDataSync.publish(itemId, {
      'Played': isPlayed,
      'PlayedPercentage': null,
      'PlaybackPositionTicks': 0,
    });
  }

  /// Asks the server to drop [itemId] from its resume list, leaving the played
  /// state and resume position alone. Returns false when the server has no
  /// way to do that (Jellyfin), so the caller can fall back to a local hide.
  Future<bool> hideFromResume(String itemId) async {
    if (_client.userLibraryApi case final ResumeVisibilityApi api) {
      await api.setHiddenFromResume(itemId, hidden: true);
      return true;
    }
    return false;
  }

  Future<void> setRating(String itemId, {required bool likes}) async {
    await _client.userLibraryApi.updateUserRating(itemId, likes: likes);
    userDataSync.publish(itemId, {'Likes': likes});
  }

  Future<void> setNumericRating(String itemId, {required double rating}) async {
    await _client.userLibraryApi.updateNumericUserRating(
      itemId,
      rating: rating,
    );
    userDataSync.publish(itemId, {'Rating': rating});
  }

  Future<void> clearRating(String itemId) async {
    await _client.userLibraryApi.deleteUserRating(itemId);
    userDataSync.publish(itemId, {'Rating': null, 'Likes': null});
  }

  Future<void> addToCollection(String collectionId, List<String> itemIds) async {
    await _client.itemsApi.addToCollection(collectionId, itemIds);
  }

  Future<Map<String, dynamic>> createCollection({
    required String name,
    List<String>? itemIds,
  }) async {
    return _client.itemsApi.createCollection(name: name, itemIds: itemIds);
  }

  Future<void> refreshMetadata(
    String itemId, {
    bool? recursive,
    bool? replaceAllMetadata,
    bool? replaceAllImages,
    MetadataRefreshMode metadataRefreshMode = MetadataRefreshMode.defaultRefresh,
    MetadataRefreshMode imageRefreshMode = MetadataRefreshMode.defaultRefresh,
  }) async {
    await _client.adminItemsApi.refreshItem(
      itemId,
      recursive: recursive,
      replaceAllMetadata: replaceAllMetadata,
      replaceAllImages: replaceAllImages,
      metadataRefreshMode: metadataRefreshMode,
      imageRefreshMode: imageRefreshMode,
    );
  }
}

typedef _FavoriteSyncKey = ({
  int session,
  MediaServerClient server,
  String itemId,
});

/// One server's favorite change in progress.
class _FavoriteSync {
  _FavoriteSync({required this.wanted, required this.held});

  /// The newest choice.
  bool wanted;

  /// What the server holds, as far as this client knows.
  bool held;

  late final Future<void> done;
}

/// A failed favorite request and the value the server still holds.
class _FavoriteSyncFailure {
  _FavoriteSyncFailure(this.error, this.stackTrace, {required this.confirmed});

  final Object error;
  final StackTrace stackTrace;
  final bool confirmed;
}
