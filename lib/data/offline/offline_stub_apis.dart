import 'package:server_core/server_core.dart';

import '../repositories/offline_repository.dart';
import '../services/pending_rating_store.dart';
import 'offline_catalog.dart';
import 'offline_errors.dart';

/// Returns benign defaults instantly so screens that await display prefs
/// before their first page (e.g. library browse) don't stall on a dio
/// connect timeout when the server is unreachable.
class OfflineDisplayPreferencesApi implements DisplayPreferencesApi {
  const OfflineDisplayPreferencesApi();

  @override
  Future<DisplayPreferences> getDisplayPreferences(
    String id, {
    String? client,
  }) async {
    return DisplayPreferences(id: id);
  }

  @override
  Future<void> saveDisplayPreferences(
    String id,
    DisplayPreferences prefs, {
    String? client,
  }) async {
    // Silently dropped while offline. Server prefs win on reconnect.
  }
}

class OfflineUsersApi implements UsersApi {
  const OfflineUsersApi();

  @override
  Future<ServerUser> getCurrentUser() async {
    throw offlineUnavailable('/Users/Me');
  }

  @override
  Future<UserConfiguration> getUserConfiguration() async {
    return const UserConfiguration();
  }

  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {
    throw offlineUnavailable('/Users/Configuration');
  }
}

/// getItem is served from the catalog. Ratings are accepted and queued for
/// the sync service to push on reconnect. Every other user-data mutation
/// fails instantly with the same DioException type callers already handle
/// for network loss.
class OfflineUserLibraryApi implements UserLibraryApi {
  final OfflineCatalog _catalog;
  final PendingRatingStore _pendingRatings;
  final OfflineRepository _offlineRepo;

  OfflineUserLibraryApi(
    this._catalog, {
    required PendingRatingStore pendingRatings,
    required OfflineRepository offlineRepo,
  }) : _pendingRatings = pendingRatings,
       _offlineRepo = offlineRepo;

  // Both server types take a numeric value once the queue replays, so the
  // rating dialog keeps the style the viewer chose while offline.
  @override
  bool get supportsNumericUserRatings => true;

  @override
  Future<Map<String, dynamic>> getItem(String itemId) async {
    final entry = _catalog.byId(itemId);
    if (entry != null) return entry.metadata;
    throw offlineUnavailable('/UserItems/$itemId');
  }

  @override
  Future<void> markFavorite(String itemId) async {
    throw offlineUnavailable('/UserFavoriteItems/$itemId');
  }

  @override
  Future<void> unmarkFavorite(String itemId) async {
    throw offlineUnavailable('/UserFavoriteItems/$itemId');
  }

  @override
  Future<void> markPlayed(String itemId) async {
    throw offlineUnavailable('/UserPlayedItems/$itemId');
  }

  @override
  Future<void> unmarkPlayed(String itemId) async {
    throw offlineUnavailable('/UserPlayedItems/$itemId');
  }

  @override
  Future<void> updateUserRating(String itemId, {required bool likes}) async {
    await _queueRating(
      itemId,
      entryOf: (serverId) =>
          PendingRating(serverId: serverId, itemId: itemId, likes: likes),
      userDataPatch: {'Likes': likes},
      unavailablePath: '/UserItems/$itemId/Rating',
    );
  }

  @override
  Future<void> updateNumericUserRating(
    String itemId, {
    required double rating,
  }) async {
    await _queueRating(
      itemId,
      entryOf: (serverId) =>
          PendingRating(serverId: serverId, itemId: itemId, rating: rating),
      // A stale thumb would contradict the new score, so it goes and the
      // display falls back to reading the thumb off the numeric value.
      userDataPatch: {'Rating': rating, 'Likes': null},
      unavailablePath: '/UserItems/$itemId/UserData',
    );
  }

  @override
  Future<void> deleteUserRating(String itemId) async {
    await _queueRating(
      itemId,
      entryOf: (serverId) =>
          PendingRating(serverId: serverId, itemId: itemId, clear: true),
      userDataPatch: {'Rating': null, 'Likes': null},
      unavailablePath: '/UserItems/$itemId/Rating',
    );
  }

  /// Queues the mutation for replay and mirrors it into the stored metadata
  /// so the offline UI shows the new state immediately. An item the catalog
  /// doesn't hold has no server to route the entry to later, so that still
  /// fails the way every offline mutation used to.
  Future<void> _queueRating(
    String itemId, {
    required PendingRating Function(String serverId) entryOf,
    required Map<String, dynamic> userDataPatch,
    required String unavailablePath,
  }) async {
    final serverId = _catalog.byId(itemId)?.row.serverId;
    if (serverId == null || serverId.isEmpty) {
      throw offlineUnavailable(unavailablePath);
    }
    await _pendingRatings.put(entryOf(serverId));
    await _offlineRepo.patchUserData(itemId, userDataPatch);
  }
}
