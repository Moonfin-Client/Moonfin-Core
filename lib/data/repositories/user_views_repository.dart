import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_library.dart';

/// The user's own views, which leave out anything hidden from My Media.
Future<List<AggregatedLibrary>> loadUserViews(MediaServerClient client) async {
  final response = await client.userViewsApi.getUserViews();
  final items = response['Items'] as List? ?? [];

  return items.map((item) {
    final data = item as Map<String, dynamic>;
    return AggregatedLibrary(
      id: data['Id']?.toString() ?? '',
      name: data['Name'] as String,
      collectionType: data['CollectionType'] as String? ?? '',
      serverId: data['ServerId']?.toString() ?? '',
      primaryImageAspectRatio: (data['PrimaryImageAspectRatio'] as num?)
          ?.toDouble(),
      imageTags: data['ImageTags'] != null
          ? Map<String, dynamic>.from(data['ImageTags'] as Map)
          : null,
      backdropImageTags: (data['BackdropImageTags'] as List?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }).toList();
}

/// Every library the user can reach, including ones hidden from My Media, so
/// the recently added rows stay independent of the navigation toggle.
///
/// Media folders come from an admin endpoint, so a regular user falls back to
/// their own views and only sees libraries they haven't hidden. Folders match
/// views by name, because a collection type is shared by every library of that
/// kind and matching on it would give two movie libraries the same id.
Future<List<AggregatedLibrary>> loadAllViewsIncludingHidden(
  MediaServerClient client,
) async {
  final userViewsFuture = loadUserViews(client);
  final foldersFuture = client.adminLibraryApi
      .getMediaFolders()
      .then<List<VirtualFolderInfo>?>((folders) => folders)
      .catchError((_) => null);

  final userViews = await userViewsFuture;
  final folders = await foldersFuture;
  if (folders == null) return userViews;

  final viewsByName = <String, AggregatedLibrary>{
    for (final view in userViews) view.name: view,
  };

  final result = folders.map((folder) {
    final match = viewsByName[folder.name];
    return AggregatedLibrary(
      id: match?.id ?? folder.itemId,
      name: folder.name,
      collectionType: folder.collectionType ?? '',
      serverId: match?.serverId ?? '',
    );
  }).toList();

  // Virtual views such as Playlists have no media folder behind them, so they
  // only arrive through the user's own views.
  final seenIds = result.map((l) => l.id).toSet();
  for (final view in userViews) {
    if (seenIds.add(view.id)) result.add(view);
  }
  return result;
}

class UserViewsRepository extends ChangeNotifier {
  final MediaServerClient _client;
  UserConfiguration? _cachedConfig;

  UserViewsRepository(this._client);

  Future<List<AggregatedLibrary>> getAllViews() => loadUserViews(_client);

  Future<List<AggregatedLibrary>> getAllViewsIncludingHidden() =>
      loadAllViewsIncludingHidden(_client);

  Future<List<AggregatedLibrary>> getUserViews() async {
    final views = await getAllViews();
    try {
      final config = await _getUserConfig();
      final excludes = config.myMediaExcludes.toSet();
      if (excludes.isEmpty) return views;
      return views.where((v) => !excludes.contains(v.id)).toList();
    } catch (_) {
      return views;
    }
  }

  Future<UserConfiguration> _getUserConfig() async {
    _cachedConfig ??= await _client.usersApi.getUserConfiguration();
    return _cachedConfig!;
  }

  Future<UserConfiguration> getUserConfiguration() async {
    _cachedConfig = await _client.usersApi.getUserConfiguration();
    return _cachedConfig!;
  }

  Future<void> updateUserConfiguration(UserConfiguration config) async {
    await _client.usersApi.updateUserConfiguration(config);
    _cachedConfig = config;
    notifyListeners();
  }

  void invalidateConfigCache() => _cachedConfig = null;
}
