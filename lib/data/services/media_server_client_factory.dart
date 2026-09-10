import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_jellyfin/server_jellyfin.dart';

import '../../util/server_url.dart';
import '../offline/connectivity_aware_media_server_client.dart';
import '../offline/offline_catalog.dart';
import '../repositories/offline_repository.dart';
import 'pending_rating_store.dart';
import 'storage_path_service.dart';

class MediaServerClientFactory {
  final DeviceInfo deviceInfo;
  final Map<String, MediaServerClient> _clients = {};

  MediaServerClientFactory({required this.deviceInfo});

  Map<String, MediaServerClient> get clients => Map.unmodifiable(_clients);

  /// The server id [client] was created under, or its base URL for a client
  /// this factory did not create.
  ///
  /// Callers hold either the connectivity wrapper this factory stores or
  /// the raw client inside it, so both sides are unwrapped before
  /// comparing. Matching only the wrapper falls through to the base URL,
  /// which changes whenever the server address is edited.
  String serverIdOf(MediaServerClient client) {
    final target = _unwrapped(client);
    for (final entry in _clients.entries) {
      if (identical(_unwrapped(entry.value), target)) return entry.key;
    }
    return client.baseUrl;
  }

  static MediaServerClient _unwrapped(MediaServerClient client) =>
      client is ConnectivityAwareMediaServerClient
      ? client.onlineClient
      : client;

  MediaServerClient getClient({
    required String serverId,
    required ServerType serverType,
    required String baseUrl,
  }) {
    final normalizedBaseUrl = normalizeServerBaseUrl(baseUrl);
    return _clients.putIfAbsent(serverId, () {
      return _createClient(
        serverType: serverType,
        baseUrl: normalizedBaseUrl,
      );
    });
  }

  MediaServerClient? getClientIfExists(String serverId) {
    final client = _clients[serverId];
    if (client != null) return client;

    if (serverId.contains('://')) {
      final normalizedInput = normalizeServerBaseUrl(serverId);
      if (normalizedInput.isNotEmpty) {
        for (final activeClient in _clients.values) {
          if (normalizeServerBaseUrl(activeClient.baseUrl) == normalizedInput) {
            return activeClient;
          }
        }
      }
    }
    return null;
  }

  /// The loaded client for [serverId], or the active client when it is empty or
  /// that server is not loaded.
  MediaServerClient clientForServerOrActive(String? serverId) {
    final active = GetIt.instance<MediaServerClient>();
    if (serverId == null || serverId.isEmpty) return active;
    return getClientIfExists(serverId) ?? active;
  }

  MediaServerClient getActiveClient() {
    if (_clients.isEmpty) throw StateError('No active server clients');
    return _clients.values.last;
  }

  MediaServerClient _createClient({
    required ServerType serverType,
    required String baseUrl,
  }) {
    final raw = _createRawClient(serverType: serverType, baseUrl: baseUrl);
    final getIt = GetIt.instance;
    // Background isolates skip the offline stack, so there's nothing to route
    // to and the raw client is all they need.
    if (!getIt.isRegistered<OfflineCatalog>() ||
        !getIt.isRegistered<StoragePathService>() ||
        !getIt.isRegistered<PendingRatingStore>()) {
      return raw;
    }
    return ConnectivityAwareMediaServerClient(
      raw,
      useOffline: shouldUseOfflineCatalog,
      catalog: getIt<OfflineCatalog>(),
      storagePath: getIt<StoragePathService>(),
      pendingRatings: getIt<PendingRatingStore>(),
      offlineRepo: getIt<OfflineRepository>(),
    );
  }

  MediaServerClient _createRawClient({
    required ServerType serverType,
    required String baseUrl,
  }) {
    switch (serverType) {
      case ServerType.jellyfin:
        return JellyfinMediaServerClient(
          baseUrl: baseUrl,
          deviceInfo: deviceInfo,
        );
      case ServerType.emby:
        return EmbyMediaServerClient(
          baseUrl: baseUrl,
          deviceInfo: deviceInfo,
        );
    }
  }

  void removeClient(String serverId) {
    _clients.remove(serverId)?.dispose();
  }

  void disposeAll() {
    for (final client in _clients.values) {
      client.dispose();
    }
    _clients.clear();
  }
}
