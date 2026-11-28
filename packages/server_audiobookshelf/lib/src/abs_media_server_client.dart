import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'abs_ids.dart';
import 'abs_progress.dart';
import 'api/abs_apis.dart';
import 'api/abs_bookmarks.dart';
import 'api/abs_items_api.dart';
import 'api/abs_playback_api.dart';

class AbsMediaServerClient extends MediaServerClient {
  final Dio _dio;

  @override
  final DeviceInfo deviceInfo;

  String _baseUrl;
  String? _accessToken;
  String? _userId;
  final AbsUserStore? _store;

  AbsMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
    AbsUserStore? store,
  }) : _baseUrl = baseUrl,
       _store = store,
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
          final token = _accessToken;
          if (token != null && options.extra[absNoAuthExtra] != true) {
            options.headers['Authorization'] = 'Bearer $token';
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

  @override
  ServerType get serverType => ServerType.audiobookshelf;

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
  set accessToken(String? token) {
    if (token != _accessToken) _progress.invalidate();
    _accessToken = token;
  }

  @override
  String? get userId => _userId;

  @override
  set userId(String? id) {
    if (id != _userId) _progress.invalidate();
    _userId = id;
  }

  late final AbsProgressCache _progress = AbsProgressCache(_dio);

  late final AbsFavorites _favorites = AbsFavorites(_store, () => _userId);

  late final AbsItemsApi _items = AbsItemsApi(
    _dio,
    _progress,
    favorites: () => _favorites.ids,
  );

  @override
  late final AbsAuthApi authApi = AbsAuthApi(_dio);

  late final AbsBookmarks bookmarks = AbsBookmarks(_dio);

  /// Applies an event from Audiobookshelf's socket to what this client has
  /// read, and answers the ids of the items whose progress it changed.
  Set<String> applySocketEvent(String event, Object? data) {
    switch (event) {
      case 'user_item_progress_updated':
        final progress = data is Map ? data['data'] : null;
        if (progress is! Map) return const {};
        final entry = progress.cast<String, dynamic>();
        final itemId = entry['libraryItemId'];
        if (itemId is! String) return const {};
        _progress.put(entry);
        final episodeId = entry['episodeId'];
        return {episodeId is String ? absEpisodeId(itemId, episodeId) : itemId};
      case 'user_updated':
        if (data is! Map || data['id'] != _userId) return const {};
        return {
          for (final key in _progress.replaceFrom(data.cast<String, dynamic>()))
            switch (key.split('/')) {
              [final itemId, final episodeId] => absEpisodeId(itemId, episodeId),
              _ => key,
            },
        };
    }
    return const {};
  }

  @override
  ItemsApi get itemsApi => _items;

  @override
  late final PlaybackApi playbackApi = AbsPlaybackApi(
    _dio,
    deviceInfo,
    () => _baseUrl,
    () => _accessToken,
    _progress,
  );

  @override
  late final ImageApi imageApi = AbsImageApi(() => _baseUrl, () => _accessToken);

  @override
  late final SessionApi sessionApi = AbsSessionApi();

  @override
  late final SystemApi systemApi = AbsSystemApi(_dio);

  @override
  late final UserLibraryApi userLibraryApi = AbsUserLibraryApi(
    _dio,
    _items,
    _progress,
    _favorites,
  );

  @override
  late final UsersApi usersApi = AbsUsersApi(
    _progress,
    () => _userId,
    store: _store,
  );

  @override
  late final UserViewsApi userViewsApi = AbsUserViewsApi(
    _items,
    usersApi.getUserConfiguration,
  );

  @override
  LiveTvApi get liveTvApi => const NoLiveTvApi();

  @override
  late final InstantMixApi instantMixApi = AbsInstantMixApi();

  @override
  late final DisplayPreferencesApi displayPreferencesApi =
      AbsDisplayPreferencesApi();

  static Never _noAdmin() => throw UnsupportedError(
    'Audiobookshelf is administered from its own web app',
  );

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
  AdminItemsApi get adminItemsApi => _noAdmin();

  @override
  void dispose() {
    _dio.close();
  }
}
