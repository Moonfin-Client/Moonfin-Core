import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'api/emby_admin_api_keys_api.dart';
import 'api/emby_admin_devices_api.dart';
import 'api/emby_admin_environment_api.dart';
import 'api/emby_admin_extras_api.dart';
import 'api/emby_admin_items_api.dart';
import 'api/emby_admin_library_api.dart';
import 'api/emby_admin_live_tv_api.dart';
import 'api/emby_admin_plugins_api.dart';
import 'api/emby_admin_system_api.dart';
import 'api/emby_admin_tasks_api.dart';
import 'api/emby_admin_users_api.dart';
import 'api/emby_auth_api.dart';
import 'api/emby_client_log_api.dart';
import 'api/emby_items_api.dart';
import 'api/emby_playback_api.dart';
import 'api/emby_image_api.dart';
import 'api/emby_session_api.dart';
import 'api/emby_system_api.dart';
import 'api/emby_user_library_api.dart';
import 'api/emby_user_views_api.dart';
import 'api/emby_live_tv_api.dart';
import 'api/emby_instant_mix_api.dart';
import 'api/emby_display_preferences_api.dart';
import 'api/emby_users_api.dart';
import 'api/emby_trickplay_api.dart';

class EmbyMediaServerClient extends MediaServerClient {
  final Dio _dio;

  @override
  final DeviceInfo deviceInfo;

  /// [interceptors] run after the client's own, so a test or a diagnostics
  /// harness sees each request as sent, auth header included.
  EmbyMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
    List<Interceptor> interceptors = const [],
  }) : _dio = Dio(BaseOptions(
         baseUrl: baseUrl,
         followRedirects: false,
         // Only the connect. Waiting for a free slot happens before this
         // starts, so it can stay short enough to give up on a hung host.
         connectTimeout: const Duration(seconds: 8),
         receiveTimeout: const Duration(minutes: 3),
       )) {
    _baseUrl = baseUrl;
    configureServerDio(_dio);
    _setupInterceptors();
    _dio.interceptors.addAll(interceptors);
  }

  late String _baseUrl;
  String? _accessToken;
  String? _userId;

  // Progress goes out every five seconds and would fill the report inside an
  // hour, so only one answer a minute is kept. A ping that fails still goes
  // through onError.
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
          scheme: 'Emby',
          deviceInfo: deviceInfo,
          accessToken: _accessToken,
        );
        // Emby documents the access token as arriving in X-Emby-Token, and a
        // deployment that only implements that half of the contract answers
        // "Access token required" to everything carrying the Authorization
        // form alone. Sending both costs one header, servers that read either
        // one ignore the other, and download_service already does the same.
        final token = _accessToken;
        if (token != null && token.isNotEmpty) {
          options.headers['X-Emby-Token'] = token;
        }
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

  String _requireUserId() {
    final id = _userId;
    if (id == null) throw StateError('userId not configured');
    return id;
  }

  @override
  ServerType get serverType => ServerType.emby;

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

  @override
  late final AuthApi authApi = EmbyAuthApi(_dio);

  @override
  late final ItemsApi itemsApi = EmbyItemsApi(_dio, _requireUserId);

  @override
  late final PlaybackApi playbackApi =
      EmbyPlaybackApi(_dio, () => _baseUrl);

  @override
  late final ImageApi imageApi =
      EmbyImageApi(() => _baseUrl, () => _accessToken);

  @override
  late final TrickplayApi trickplayApi =
      EmbyTrickplayApi(_dio, () => _baseUrl, () => _accessToken);

  @override
  late final SessionApi sessionApi = EmbySessionApi(_dio);

  @override
  late final SystemApi systemApi = EmbySystemApi(_dio);

  @override
  late final UserLibraryApi userLibraryApi =
      EmbyUserLibraryApi(_dio, _requireUserId);

  @override
  late final EmbyUserViewsApi userViewsApi =
      EmbyUserViewsApi(_dio, _requireUserId, () => usersApi);

  @override
  late final LiveTvApi liveTvApi = EmbyLiveTvApi(_dio);

  @override
  late final InstantMixApi instantMixApi = EmbyInstantMixApi(_dio);

  @override
  late final EmbyDisplayPreferencesApi displayPreferencesApi =
      EmbyDisplayPreferencesApi(_dio);

  @override
  late final UsersApi usersApi = EmbyUsersApi(
    _dio,
    _requireUserId,
    onConfigurationUpdated: () => userViewsApi.invalidateCache(),
  );

  @override
  late final ClientLogApi clientLogApi = EmbyClientLogApi(_dio);

  @override
  late final AdminSystemApi adminSystemApi = EmbyAdminSystemApi(_dio);

  @override
  late final AdminUsersApi adminUsersApi = EmbyAdminUsersApi(_dio);

  @override
  late final AdminLibraryApi adminLibraryApi = EmbyAdminLibraryApi(_dio);

  @override
  late final AdminEnvironmentApi adminEnvironmentApi = EmbyAdminEnvironmentApi(_dio);

  @override
  late final AdminTasksApi adminTasksApi = EmbyAdminTasksApi(_dio);

  @override
  late final AdminPluginsApi adminPluginsApi = EmbyAdminPluginsApi(_dio);

  @override
  late final AdminDevicesApi adminDevicesApi = EmbyAdminDevicesApi(_dio);

  @override
  late final AdminApiKeysApi adminApiKeysApi = EmbyAdminApiKeysApi(_dio);

  /// Emby's backups come from a plugin, through [embyAdminApi].
  @override
  AdminBackupApi get adminBackupApi =>
      throw UnsupportedError('Emby has no built-in backups');

  @override
  late final EmbyAdminApi embyAdminApi = EmbyAdminExtrasApi(_dio);

  @override
  late final AdminLiveTvApi adminLiveTvApi = EmbyAdminLiveTvApi(_dio);

  @override
  late final AdminItemsApi adminItemsApi = EmbyAdminItemsApi(_dio);

  @override
  late final GamesApi gamesApi = MoonbaseGamesApi(
      _dio, () => _baseUrl, () => _accessToken, ServerType.emby);

  @override
  void dispose() {
    _dio.close();
  }
}
