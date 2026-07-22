import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'api/jellyfin_admin_system_api.dart';
import 'api/jellyfin_admin_users_api.dart';
import 'api/jellyfin_admin_library_api.dart';
import 'api/jellyfin_admin_environment_api.dart';
import 'api/jellyfin_admin_tasks_api.dart';
import 'api/jellyfin_admin_plugins_api.dart';
import 'api/jellyfin_admin_devices_api.dart';
import 'api/jellyfin_admin_api_keys_api.dart';
import 'api/jellyfin_admin_backup_api.dart';
import 'api/jellyfin_admin_live_tv_api.dart';
import 'api/jellyfin_admin_items_api.dart';
import 'api/jellyfin_client_log_api.dart';
import 'api/jellyfin_syncplay_api.dart';

class JellyfinMediaServerClient extends MediaServerClient {
  final Dio _dio;

  static const _dialect = ServerDialect.jellyfin;

  @override
  final DeviceInfo deviceInfo;

  JellyfinMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
  }) : _dio = Dio(BaseOptions(
         baseUrl: baseUrl,
         followRedirects: false,
         connectTimeout: const Duration(seconds: 30),
         receiveTimeout: const Duration(seconds: 30),
       )) {
    _baseUrl = baseUrl;
    configureServerDio(_dio);
    attachServerInterceptors(
      _dio,
      deviceInfo: deviceInfo,
      authScheme: _dialect.authScheme,
      getAccessToken: () => _accessToken,
    );
  }

  late String _baseUrl;
  String? _accessToken;
  String? _userId;

  @override
  ServerType get serverType => ServerType.jellyfin;

  @override
  String get baseUrl => _baseUrl;

  @override
  set baseUrl(String url) {
    _baseUrl = url;
    _dio.options.baseUrl = url;
  }

  @override
  String? get accessToken => _accessToken;

  @override
  set accessToken(String? token) => _accessToken = token;

  @override
  String? get userId => _userId;

  @override
  set userId(String? id) => _userId = id;

  String _requireUserId() {
    final id = _userId;
    if (id == null) throw StateError('userId not configured');
    return id;
  }

  @override
  late final AuthApi authApi = ServerAuthApi(_dio, _dialect);

  @override
  late final ItemsApi itemsApi = ServerItemsApi(_dio, _dialect, _requireUserId);

  @override
  late final PlaybackApi playbackApi = ServerPlaybackApi(_dio, () => _baseUrl);

  @override
  late final ImageApi imageApi =
      ServerImageApi(() => _baseUrl, () => _accessToken, _dialect);

  @override
  late final SessionApi sessionApi = ServerSessionApi(_dio, _dialect);

  @override
  late final SystemApi systemApi = ServerSystemApi(_dio);

  @override
  late final UserLibraryApi userLibraryApi =
      ServerUserLibraryApi(_dio, _dialect, _requireUserId);

  @override
  late final UserViewsApi userViewsApi =
      ServerUserViewsApi(_dio, _dialect, _requireUserId);

  @override
  late final LiveTvApi liveTvApi = ServerLiveTvApi(_dio);

  @override
  late final InstantMixApi instantMixApi = ServerInstantMixApi(_dio);

  @override
  late final DisplayPreferencesApi displayPreferencesApi =
      ServerDisplayPreferencesApi(_dio, _dialect);

  @override
  late final UsersApi usersApi = ServerUsersApi(_dio, _dialect, _requireUserId);

  @override
  late final AdminSystemApi adminSystemApi = JellyfinAdminSystemApi(_dio);

  @override
  late final AdminUsersApi adminUsersApi = JellyfinAdminUsersApi(_dio);

  @override
  late final AdminLibraryApi adminLibraryApi = JellyfinAdminLibraryApi(_dio);

  @override
  late final AdminEnvironmentApi adminEnvironmentApi =
      JellyfinAdminEnvironmentApi(_dio);

  @override
  late final AdminTasksApi adminTasksApi = JellyfinAdminTasksApi(_dio);

  @override
  late final AdminPluginsApi adminPluginsApi = JellyfinAdminPluginsApi(_dio);

  @override
  late final AdminDevicesApi adminDevicesApi = JellyfinAdminDevicesApi(_dio);

  @override
  late final AdminApiKeysApi adminApiKeysApi = JellyfinAdminApiKeysApi(_dio);

  @override
  late final AdminBackupApi adminBackupApi = JellyfinAdminBackupApi(_dio);

  @override
  late final AdminLiveTvApi adminLiveTvApi = JellyfinAdminLiveTvApi(_dio);

  @override
  late final AdminItemsApi adminItemsApi = JellyfinAdminItemsApi(_dio);

  @override
  late final SyncPlayApi syncPlayApi = JellyfinSyncPlayApi(_dio);

  @override
  late final ClientLogApi clientLogApi = JellyfinClientLogApi(_dio);

  @override
  late final GamesApi gamesApi = MoonbaseGamesApi(
      _dio, () => _baseUrl, () => _accessToken, ServerType.jellyfin);

  @override
  void dispose() {
    _dio.close();
  }
}
