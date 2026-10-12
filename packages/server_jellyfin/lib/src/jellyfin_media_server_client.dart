import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'api/jellyfin_auth_api.dart';
import 'api/jellyfin_items_api.dart';
import 'api/jellyfin_playback_api.dart';
import 'api/jellyfin_image_api.dart';
import 'api/jellyfin_session_api.dart';
import 'api/jellyfin_system_api.dart';
import 'api/jellyfin_user_library_api.dart';
import 'api/jellyfin_user_views_api.dart';
import 'api/jellyfin_live_tv_api.dart';
import 'api/jellyfin_instant_mix_api.dart';
import 'api/jellyfin_display_preferences_api.dart';
import 'api/jellyfin_users_api.dart';
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
  @override
  Future<CinemaMedia?> resolveCinemaMedia(String itemId, {
    CinemaMediaType? expectedMediaType,
  }) async {
    final response = await _dio.get('/Moonfin/Cinema/ResolveMedia',
      queryParameters: {
        'itemId': itemId,
        if (expectedMediaType != null) 'expectedMediaType': expectedMediaType.name,
      },
      options: Options(receiveTimeout: const Duration(seconds: 10)),
    );
    final data = response.data;
    return data is Map ? CinemaMedia.fromJson(data) : null;
  }

  final Dio _dio;

  @override
  final DeviceInfo deviceInfo;

  JellyfinMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
  }) : _dio = Dio(BaseOptions(
         baseUrl: baseUrl,
         followRedirects: false,
         // Only the connect. Waiting for a free slot happens before this
         // starts, so it can stay short enough to give up on a hung host.
         connectTimeout: const Duration(seconds: 8),
         receiveTimeout: const Duration(seconds: 30),
       )) {
    _baseUrl = baseUrl;
    configureServerDio(_dio);
    _setupInterceptors();
  }

  late String _baseUrl;
  String? _accessToken;
  String? _userId;

  // Progress goes out every five seconds, and at two entries apiece those
  // fill the diagnostic report inside an hour, taking the start of the
  // playback with them. Only one answer a minute is kept, which still shows
  // the session is reporting, and a ping that fails goes through onError.
  static const _progressPingLogInterval = 12;
  int _progressPings = 0;

  bool _isProgressPing(Uri uri) =>
      uri.path.endsWith('/Sessions/Playing/Progress');

  bool _progressPingIsDue() {
    _progressPings++;
    return _progressPings % _progressPingLogInterval == 1;
  }

  void _setupInterceptors() {
    _dio.interceptors.add(redirectInterceptor(_dio));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = buildServerAuthorizationHeader(
          scheme: 'MediaBrowser',
          deviceInfo: deviceInfo,
          accessToken: _accessToken,
        );
        if (!_isProgressPing(options.uri)) {
          ServerLog.network('→ ${options.method} ${options.uri}');
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        final uri = response.requestOptions.uri;
        if (!_isProgressPing(uri) || _progressPingIsDue()) {
          ServerLog.network(
            '← ${response.statusCode} ${response.requestOptions.method} $uri',
          );
        }
        handler.next(response);
      },
      onError: (error, handler) {
        ServerLog.network(
          '✗ ${error.requestOptions.method} ${error.requestOptions.uri} '
          '(${error.response?.statusCode ?? error.type.name})',
          level: ServerLogLevel.error,
          error: error.message ?? error.toString(),
        );
        handler.next(error);
      },
    ));
  }

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
  late final AuthApi authApi = JellyfinAuthApi(_dio);

  @override
  late final ItemsApi itemsApi = JellyfinItemsApi(_dio, _requireUserId);

  @override
  late final PlaybackApi playbackApi = JellyfinPlaybackApi(_dio, _baseUrl);

  @override
  late final ImageApi imageApi = JellyfinImageApi(_baseUrl);

  @override
  late final SessionApi sessionApi = JellyfinSessionApi(_dio);

  @override
  late final SystemApi systemApi = JellyfinSystemApi(_dio);

  @override
  late final UserLibraryApi userLibraryApi = JellyfinUserLibraryApi(_dio);

  @override
  late final UserViewsApi userViewsApi = JellyfinUserViewsApi(_dio);

  @override
  late final LiveTvApi liveTvApi = JellyfinLiveTvApi(_dio);

  @override
  late final InstantMixApi instantMixApi = JellyfinInstantMixApi(_dio);

  @override
  late final DisplayPreferencesApi displayPreferencesApi =
      JellyfinDisplayPreferencesApi(_dio);

  @override
  late final UsersApi usersApi = JellyfinUsersApi(_dio);

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
