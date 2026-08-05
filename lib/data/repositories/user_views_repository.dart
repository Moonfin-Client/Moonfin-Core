import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_library.dart';

/// The user's own views. Anything hidden from My Media is left out unless
/// [includeHidden] is set, which callers that apply their own exclude
/// filtering pass so the list isn't filtered twice.
Future<List<AggregatedLibrary>> loadUserViews(
  MediaServerClient client, {
  bool includeHidden = false,
}) async {
  final response =
      await client.userViewsApi.getUserViews(includeHidden: includeHidden);
  final items = response['Items'] as List? ?? [];

  return items.whereType<Map>().map((item) {
    final data = item.cast<String, dynamic>();
    return AggregatedLibrary(
      id: data['Id']?.toString() ?? '',
      name: data['Name']?.toString() ?? '',
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

/// The My Media exclude list, or null when it can't be read.
Future<Set<String>?> _excludesFrom(Future<UserConfiguration> config) async {
  try {
    return (await config).myMediaExcludes.toSet();
  } catch (_) {
    return null;
  }
}

/// The views response with anything hidden from My Media removed. The server
/// filters by the exclude list itself, so ask for the full list and apply it
/// here instead. If the list can't be read, let the server filter so hidden
/// libraries don't leak through.
Future<Map<String, dynamic>> loadVisibleUserViews(
  MediaServerClient client,
) async {
  final viewsFuture = client.userViewsApi.getUserViews(includeHidden: true);
  final excludes = await _excludesFrom(client.usersApi.getUserConfiguration());
  final response = await viewsFuture;

  if (excludes == null) return client.userViewsApi.getUserViews();
  if (excludes.isEmpty) return response;

  final items = (response['Items'] as List? ?? [])
      .where(
        (item) => !excludes.contains(
          (item as Map<String, dynamic>)['Id']?.toString() ?? '',
        ),
      )
      .toList();
  return {...response, 'Items': items};
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
    final excludes = await _excludesFrom(_getUserConfig());
    if (excludes == null) return getAllViews();

    final views = await getAllViewsIncludingHidden();
    if (excludes.isEmpty) return views;
    return views.where((v) => !excludes.contains(v.id)).toList();
  }

  Future<UserConfiguration> _getUserConfig() async {
    _cachedConfig ??= await _client.usersApi.getUserConfiguration();
    return _cachedConfig!;
  }

  /// What the user hid from My Media, read from the cached configuration so a
  /// caller can ask on every row without a round trip each time. Empty when
  /// nothing is hidden or the list cant be read.
  Future<Set<String>> getMyMediaExcludes() async =>
      await _excludesFrom(_getUserConfig()) ?? const {};

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
