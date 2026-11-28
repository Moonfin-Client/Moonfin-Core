import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_plex/server_plex.dart';
import 'package:server_silo/server_silo.dart';
import 'package:server_audiobookshelf/server_audiobookshelf.dart';

import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import '../../util/server_url.dart';
import '../offline/connectivity_aware_media_server_client.dart';
import '../offline/offline_catalog.dart';
import '../repositories/offline_repository.dart';
import 'pending_rating_store.dart';
import 'plex_games_api.dart';
import 'storage_path_service.dart';

class MediaServerClientFactory {
  final DeviceInfo deviceInfo;
  final Map<String, MediaServerClient> _clients = {};

  /// Called when a Jellyfin server answers a request with 403.
  final void Function()? onForbidden;

  MediaServerClientFactory({required this.deviceInfo, this.onForbidden});

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
    // A server whose saved type was corrected needs the other kind of client.
    if (_clients[serverId]?.serverType case final cached?
        when cached != serverType) {
      removeClient(serverId);
    }
    return _clients.putIfAbsent(serverId, () {
      return _createClient(
        serverId: serverId,
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
    required String serverId,
    required ServerType serverType,
    required String baseUrl,
  }) {
    final raw = _createRawClient(
      serverId: serverId,
      serverType: serverType,
      baseUrl: baseUrl,
    );
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

  /// A client of its own for requests outside the app's session, such as
  /// ending a saved login of a server being removed. It isn't cached and has
  /// no 403 hook, and the caller disposes it.
  MediaServerClient createStandaloneClient({
    required String serverId,
    required ServerType serverType,
    required String baseUrl,
  }) => _createRawClient(
    serverId: serverId,
    serverType: serverType,
    baseUrl: baseUrl,
    forbiddenHook: false,
  );

  MediaServerClient _createRawClient({
    required String serverId,
    required ServerType serverType,
    required String baseUrl,
    bool forbiddenHook = true,
  }) {
    switch (serverType) {
      case ServerType.jellyfin:
        return JellyfinMediaServerClient(
          baseUrl: baseUrl,
          deviceInfo: deviceInfo,
          interceptors: [
            if (forbiddenHook && onForbidden != null)
              InterceptorsWrapper(
                onError: (error, handler) {
                  if (error.response?.statusCode == 403) onForbidden!();
                  handler.next(error);
                },
              ),
          ],
        );
      case ServerType.emby:
        return EmbyMediaServerClient(
          baseUrl: baseUrl,
          deviceInfo: deviceInfo,
        );
      case ServerType.plex:
        return PlexMediaServerClient(
          baseUrl: baseUrl,
          deviceInfo: deviceInfo,
          gamesApi: plexMoonbaseGamesApi,
          configStore: _plexConfigStore(serverId),
        );
      case ServerType.silo:
        return SiloMediaServerClient(
          baseUrl: baseUrl,
          deviceInfo: deviceInfo,
          platform: _siloDevicePlatform(),
        );
      case ServerType.audiobookshelf:
        return AbsMediaServerClient(
          baseUrl: baseUrl,
          deviceInfo: deviceInfo,
          store: _plexConfigStore(serverId),
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

/// Keeps each Plex or Audiobookshelf user's configuration in this device's
/// preferences, under [serverId].
PlexUserConfigurationStore _plexConfigStore(String serverId) {
  UserPreferences? prefs() => GetIt.instance.isRegistered<UserPreferences>()
      ? GetIt.instance<UserPreferences>()
      : null;
  return (
    read: (userId) {
      final json = prefs()?.get(
        UserPreferences.plexUserConfiguration(serverId, userId),
      );
      if (json == null || json.isEmpty) return null;
      return jsonDecode(json) as Map<String, dynamic>;
    },
    write: (userId, json) async => prefs()?.set(
      UserPreferences.plexUserConfiguration(serverId, userId),
      jsonEncode(json),
    ),
  );
}

/// The platform Silo records for this device (`X-Silo-Device-Platform`),
/// named the same way as the client name in `lib/di/injection.dart`.
String _siloDevicePlatform() {
  if (PlatformDetection.isAppleTV) return 'tvOS';
  if (PlatformDetection.isWeb) return 'Web';
  if (PlatformDetection.isAndroid) {
    return PlatformDetection.isTV ? 'Android TV' : 'Android';
  }
  if (PlatformDetection.isIOS) return 'iOS';
  if (PlatformDetection.isMacOS) return 'macOS';
  if (PlatformDetection.isWindows) return 'Windows';
  if (PlatformDetection.isLinux) return 'Linux';
  return 'Unknown';
}
