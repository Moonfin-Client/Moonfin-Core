import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_library.dart';

/// The user's own views. Anything hidden from My Media is left out unless
/// [includeHidden] is set, which the rows that should stay independent of that
/// toggle use to see every library the user can reach.
Future<List<AggregatedLibrary>> loadUserViews(
  MediaServerClient client, {
  bool includeHidden = false,
}) async {
  final response =
      await client.userViewsApi.getUserViews(includeHidden: includeHidden);
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

class UserViewsRepository extends ChangeNotifier {
  final MediaServerClient _client;
  UserConfiguration? _cachedConfig;

  // Concurrent callers share one in-flight request so a burst of reloads
  // costs a single round trip.
  Future<List<AggregatedLibrary>>? _inFlightViews;
  Future<List<AggregatedLibrary>>? _inFlightViewsIncludingHidden;

  UserViewsRepository(this._client);

  Future<List<AggregatedLibrary>> getAllViews() =>
      _inFlightViews ??= loadUserViews(
        _client,
      ).whenComplete(() => _inFlightViews = null);

  Future<List<AggregatedLibrary>> getAllViewsIncludingHidden() =>
      _inFlightViewsIncludingHidden ??= loadUserViews(
        _client,
        includeHidden: true,
      ).whenComplete(() => _inFlightViewsIncludingHidden = null);

  Future<List<AggregatedLibrary>> getUserViews() async {
    final views = await getAllViewsIncludingHidden();
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
