import 'package:server_core/server_core.dart';

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

/// getItem is served from the catalog. User-data mutations fail instantly
/// with the same DioException type callers already handle for network loss.
class OfflineUserLibraryApi implements UserLibraryApi {
  final OfflineCatalog _catalog;

  OfflineUserLibraryApi(this._catalog);

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
    throw offlineUnavailable('/UserItems/$itemId/Rating');
  }

  @override
  Future<void> deleteUserRating(String itemId) async {
    throw offlineUnavailable('/UserItems/$itemId/Rating');
  }
}
