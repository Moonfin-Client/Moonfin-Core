import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../services/user_data_sync.dart';

class ItemMutationRepository {
  final MediaServerClient _client;

  ItemMutationRepository(this._client);

  static final _favoriteSyncs = <String, Future<void>>{};

  /// Shows [isFavorite] at once, then brings the server to the newest choice
  /// one request at a time, so a quick run of toggles ends where the user
  /// left it. Work left over from before a sign-out or user switch stops.
  ///
  /// When a request fails, only the calls asking for something other than
  /// what the server holds throw, so a caller undoing its own toggle on error
  /// lands on the server's value whichever order the callers run in.
  Future<void> setFavorite(String itemId, {required bool isFavorite}) async {
    userDataSync.requestFavorite(itemId, isFavorite);
    final session = userDataSync.session;
    final key = '$session:$itemId';
    try {
      await (_favoriteSyncs[key] ??= _syncFavorite(itemId, session, key));
    } on _FavoriteSyncFailure catch (failure) {
      if (failure.confirmed == isFavorite) return;
      Error.throwWithStackTrace(failure.error, failure.stackTrace);
    }
  }

  Future<void> _syncFavorite(String itemId, int session, String key) async {
    try {
      // Lets setFavorite store this run before it can finish and remove it.
      await Future<void>.value();
      while (userDataSync.session == session) {
        final wanted = userDataSync.pendingFavorite(itemId);
        if (wanted == null) return;
        if (wanted == userDataSync.confirmedFavorite(itemId)) {
          userDataSync.confirmFavorite(itemId, wanted);
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
          final confirmed = userDataSync.confirmedFavorite(itemId) ?? !wanted;
          userDataSync.failFavoriteChange(itemId);
          throw _FavoriteSyncFailure(error, stackTrace, confirmed: confirmed);
        }
        if (userDataSync.session != session) return;
        userDataSync.confirmFavorite(itemId, wanted);
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

/// A failed favorite request and the value the server still holds.
class _FavoriteSyncFailure {
  _FavoriteSyncFailure(this.error, this.stackTrace, {required this.confirmed});

  final Object error;
  final StackTrace stackTrace;
  final bool confirmed;
}
