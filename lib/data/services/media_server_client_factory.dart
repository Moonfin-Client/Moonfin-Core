import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_jellyfin/server_jellyfin.dart';

import '../../util/server_url.dart';
import '../offline/connectivity_aware_media_server_client.dart';
import '../offline/offline_catalog.dart';
import 'storage_path_service.dart';

class MediaServerClientFactory {
  final DeviceInfo deviceInfo;
  final Map<String, MediaServerClient> _clients = {};

  MediaServerClientFactory({required this.deviceInfo});

  Map<String, MediaServerClient> get clients => Map.unmodifiable(_clients);

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
        !getIt.isRegistered<StoragePathService>()) {
      return raw;
    }
    return ConnectivityAwareMediaServerClient(
      raw,
      useOffline: shouldUseOfflineCatalog,
      catalog: getIt<OfflineCatalog>(),
      storagePath: getIt<StoragePathService>(),
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
