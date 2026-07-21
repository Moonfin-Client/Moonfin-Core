import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbyMediaServerClient extends MediaServerClient {
  final Dio _dio;

  static const _dialect = ServerDialect.emby;

  @override
  final DeviceInfo deviceInfo;

  EmbyMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
  }) : _dio = Dio(BaseOptions(
         baseUrl: baseUrl,
         followRedirects: false,
         connectTimeout: const Duration(seconds: 30),
         receiveTimeout: const Duration(minutes: 3),
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
