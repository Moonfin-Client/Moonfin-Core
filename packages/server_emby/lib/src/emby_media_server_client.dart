import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

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

  EmbyMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
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
  late final UsersApi usersApi = EmbyUsersApi(_dio, _requireUserId);

  @override
  late final ClientLogApi clientLogApi = EmbyClientLogApi(_dio);

  @override
  AdminSystemApi get adminSystemApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminUsersApi get adminUsersApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminLibraryApi get adminLibraryApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminEnvironmentApi get adminEnvironmentApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminTasksApi get adminTasksApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminPluginsApi get adminPluginsApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminDevicesApi get adminDevicesApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminApiKeysApi get adminApiKeysApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminBackupApi get adminBackupApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminLiveTvApi get adminLiveTvApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  AdminItemsApi get adminItemsApi =>
      throw UnsupportedError('Admin not supported on Emby yet');

  @override
  late final GamesApi gamesApi = MoonbaseGamesApi(
      _dio, () => _baseUrl, () => _accessToken, ServerType.emby);

  @override
  void dispose() {
    _dio.close();
  }
}
