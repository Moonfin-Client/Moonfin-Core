import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'api/plex_admin_items_api.dart';
import 'api/plex_apis.dart';
import 'api/plex_items_api.dart';
import 'api/plex_live_tv_api.dart';
import 'api/plex_playback_api.dart';
import 'api/plex_trickplay_api.dart';

/// The X-Plex identity every Plex request carries. Plex takes it as query
/// parameters too, which keeps non-ASCII device names out of the headers.
Map<String, String> plexIdentity(DeviceInfo deviceInfo) => {
  'X-Plex-Product': deviceInfo.appName,
  'X-Plex-Version': deviceInfo.appVersion,
  'X-Plex-Client-Identifier': deviceInfo.id,
  'X-Plex-Device-Name': deviceInfo.name,
};

class PlexMediaServerClient extends MediaServerClient {
  final Dio _dio;

  @override
  final DeviceInfo deviceInfo;

  String _baseUrl;
  String? _accessToken;
  String? _userId;

  PlexMediaServerClient({required String baseUrl, required this.deviceInfo})
    : _baseUrl = baseUrl,
      _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 8),
          receiveTimeout: const Duration(seconds: 30),
          headers: {'Accept': 'application/json'},
        ),
      ) {
    configureServerDio(_dio);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters.addAll(plexIdentity(deviceInfo));
          if (_accessToken != null) {
            options.headers['X-Plex-Token'] = _accessToken;
          }
          ServerLog.network('→ ${options.method} ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          ServerLog.network(
            '← ${response.statusCode} ${response.requestOptions.method} '
            '${response.requestOptions.uri}',
          );
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
      ),
    );
  }

  String _requireUserId() {
    final id = _userId;
    if (id == null) throw StateError('userId not configured');
    return id;
  }

  @override
  ServerType get serverType => ServerType.plex;

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
  late final AuthApi authApi = PlexAuthApi();

  /// Set each time the user is checked, since a Home member can't delete.
  bool _mayDeleteMedia = false;

  @override
  late final ItemsApi itemsApi = PlexItemsApi(
    _dio,
    mayDeleteMedia: () => _mayDeleteMedia,
  );

  @override
  late final PlaybackApi playbackApi = PlexPlaybackApi(
    _dio,
    plexIdentity(deviceInfo),
  );

  @override
  late final TrickplayApi trickplayApi = PlexTrickplayApi(
    _dio,
    () => _baseUrl,
    () => _accessToken,
  );

  @override
  late final ImageApi imageApi = PlexImageApi(
    () => _baseUrl,
    () => _accessToken,
  );

  @override
  late final SessionApi sessionApi = PlexSessionApi();

  @override
  late final SystemApi systemApi = PlexSystemApi(_dio);

  @override
  late final UserLibraryApi userLibraryApi = PlexUserLibraryApi(_dio, itemsApi);

  @override
  late final UserViewsApi userViewsApi = PlexUserViewsApi(_dio);

  @override
  late final LiveTvApi liveTvApi = PlexLiveTvApi(_dio);

  @override
  late final InstantMixApi instantMixApi = PlexInstantMixApi(_dio);

  @override
  late final DisplayPreferencesApi displayPreferencesApi =
      PlexDisplayPreferencesApi();

  @override
  late final UsersApi usersApi = PlexUsersApi(
    _dio,
    _requireUserId,
    (policy) => _mayDeleteMedia = policy.enableContentDeletion,
  );

  static Never _noAdmin() =>
      throw UnsupportedError("Admin isn't supported on Plex");

  @override
  AdminSystemApi get adminSystemApi => _noAdmin();

  @override
  AdminUsersApi get adminUsersApi => _noAdmin();

  @override
  AdminLibraryApi get adminLibraryApi => _noAdmin();

  @override
  AdminEnvironmentApi get adminEnvironmentApi => _noAdmin();

  @override
  AdminTasksApi get adminTasksApi => _noAdmin();

  @override
  AdminPluginsApi get adminPluginsApi => _noAdmin();

  @override
  AdminDevicesApi get adminDevicesApi => _noAdmin();

  @override
  AdminApiKeysApi get adminApiKeysApi => _noAdmin();

  @override
  AdminBackupApi get adminBackupApi => _noAdmin();

  @override
  AdminLiveTvApi get adminLiveTvApi => _noAdmin();

  @override
  late final AdminItemsApi adminItemsApi = PlexAdminItemsApi(_dio, imageApi);

  @override
  void dispose() {
    _dio.close();
  }
}
