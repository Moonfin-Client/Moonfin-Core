import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_library.dart';

class UserViewsRepository extends ChangeNotifier {
  final MediaServerClient _client;
  UserConfiguration? _cachedConfig;

  UserViewsRepository(this._client);

  Future<List<AggregatedLibrary>> getAllViews() async {
    final response = await _client.userViewsApi.getUserViews();
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

  Future<List<AggregatedLibrary>> getAllViewsIncludingHidden() async {
    try {
      final foldersFuture = _client.adminLibraryApi.getMediaFolders();
      final userViewsFuture = getAllViews();

      final folders = await foldersFuture;
      final userViews = await userViewsFuture;

      final result = folders.map((folder) {
        final matchingView = userViews.where((v) {
          if (folder.collectionType != null && folder.collectionType!.isNotEmpty) {
            return v.collectionType == folder.collectionType;
          }
          return v.name == folder.name;
        }).firstOrNull;

        return AggregatedLibrary(
          id: matchingView?.id ?? folder.itemId,
          name: folder.name,
          collectionType: folder.collectionType ?? '',
          serverId: '',
        );
      }).toList();

      final existingIds = result.map((l) => l.id).toSet();
      for (final view in userViews) {
        if (!existingIds.contains(view.id)) {
          result.add(view);
        }
      }
      return result;
    } catch (_) {
      return getAllViews();
    }
  }

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
