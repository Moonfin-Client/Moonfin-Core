import 'package:server_core/server_core.dart';

import '../services/storage_path_service.dart';
import 'offline_catalog.dart';
import 'offline_image_api.dart';
import 'offline_items_api.dart';
import 'offline_stub_apis.dart';
import 'offline_user_views_api.dart';

/// Wraps the active server client and routes the browse/read APIs to the
/// offline downloads catalog whenever the server is unreachable, so the
/// regular UI renders offline with downloaded content only.
///
/// Everything not offline-capable (auth, playback info, sockets, admin,
/// live TV, ...) always forwards to the real client: playback and downloads
/// have their own offline paths and need the raw client untouched. Routing is
/// per-call, so user-scoped singletons that captured this wrapper at
/// construction keep working across connectivity flips.
class ConnectivityAwareMediaServerClient implements MediaServerClient {
  final MediaServerClient _online;
  final bool Function() _useOffline;

  final OfflineItemsApi _offlineItems;
  final OfflineImageApi _offlineImages;
  final OfflineUserViewsApi _offlineViews;
  final OfflineUserLibraryApi _offlineUserLibrary;
  static const _offlineDisplayPrefs = OfflineDisplayPreferencesApi();
  static const _offlineUsers = OfflineUsersApi();

  ConnectivityAwareMediaServerClient(
    this._online, {
    required bool Function() useOffline,
    required OfflineCatalog catalog,
    required StoragePathService storagePath,
  }) : _useOffline = useOffline,
       _offlineItems = OfflineItemsApi(catalog, storagePath),
       _offlineImages = OfflineImageApi(catalog, _online.imageApi),
       _offlineViews = OfflineUserViewsApi(catalog),
       _offlineUserLibrary = OfflineUserLibraryApi(catalog);

  /// The wrapped online client, for callers that must never be routed
  /// offline (downloads, sockets, resolvers).
  MediaServerClient get onlineClient => _online;

  @override
  ItemsApi get itemsApi => _useOffline() ? _offlineItems : _online.itemsApi;

  @override
  ImageApi get imageApi => _useOffline() ? _offlineImages : _online.imageApi;

  @override
  UserViewsApi get userViewsApi =>
      _useOffline() ? _offlineViews : _online.userViewsApi;

  @override
  UserLibraryApi get userLibraryApi =>
      _useOffline() ? _offlineUserLibrary : _online.userLibraryApi;

  @override
  DisplayPreferencesApi get displayPreferencesApi =>
      _useOffline() ? _offlineDisplayPrefs : _online.displayPreferencesApi;

  @override
  UsersApi get usersApi => _useOffline() ? _offlineUsers : _online.usersApi;

  @override
  ServerType get serverType => _online.serverType;

  @override
  DeviceInfo get deviceInfo => _online.deviceInfo;

  @override
  String get baseUrl => _online.baseUrl;

  @override
  set baseUrl(String url) => _online.baseUrl = url;

  @override
  String? get accessToken => _online.accessToken;

  @override
  set accessToken(String? token) => _online.accessToken = token;

  @override
  String? get userId => _online.userId;

  @override
  set userId(String? id) => _online.userId = id;

  @override
  AuthApi get authApi => _online.authApi;

  @override
  PlaybackApi get playbackApi => _online.playbackApi;

  @override
  SessionApi get sessionApi => _online.sessionApi;

  @override
  SystemApi get systemApi => _online.systemApi;

  @override
  LiveTvApi get liveTvApi => _online.liveTvApi;

  @override
  InstantMixApi get instantMixApi => _online.instantMixApi;

  @override
  AdminSystemApi get adminSystemApi => _online.adminSystemApi;

  @override
  AdminUsersApi get adminUsersApi => _online.adminUsersApi;

  @override
  AdminLibraryApi get adminLibraryApi => _online.adminLibraryApi;

  @override
  AdminEnvironmentApi get adminEnvironmentApi => _online.adminEnvironmentApi;

  @override
  AdminTasksApi get adminTasksApi => _online.adminTasksApi;

  @override
  AdminPluginsApi get adminPluginsApi => _online.adminPluginsApi;

  @override
  AdminDevicesApi get adminDevicesApi => _online.adminDevicesApi;

  @override
  AdminApiKeysApi get adminApiKeysApi => _online.adminApiKeysApi;

  @override
  AdminBackupApi get adminBackupApi => _online.adminBackupApi;

  @override
  AdminLiveTvApi get adminLiveTvApi => _online.adminLiveTvApi;

  @override
  AdminItemsApi get adminItemsApi => _online.adminItemsApi;

  @override
  SyncPlayApi? get syncPlayApi => _online.syncPlayApi;

  @override
  ClientLogApi? get clientLogApi => _online.clientLogApi;

  @override
  GamesApi? get gamesApi => _online.gamesApi;

  @override
  void dispose() => _online.dispose();
}
