import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../services/user_data_sync.dart';

class ItemMutationRepository {
  final MediaServerClient _client;

  ItemMutationRepository(this._client);

  Future<void> setFavorite(String itemId, {required bool isFavorite}) async {
    if (isFavorite) {
      await _client.userLibraryApi.markFavorite(itemId);
    } else {
      await _client.userLibraryApi.unmarkFavorite(itemId);
    }
    userDataSync.publish(itemId, {'IsFavorite': isFavorite});
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
