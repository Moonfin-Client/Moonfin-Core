import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'api/silo_instant_mix_api.dart';
import 'api/silo_live_tv_api.dart';
import 'api/silo_pending_api.dart';
import 'api/silo_system_api.dart';
import 'silo_session.dart';
import 'silo_session_interceptor.dart';

/// Moonfin's client for a Silo server, speaking Silo's native `/api/v2`.
///
/// [baseUrl] is the server origin (plus any reverse-proxy prefix) without
/// `/api/v2`; every API class adds the full path itself.
///
/// Sign-in state lives in [session]: the account's token pair, refreshed
/// before it expires and once after a `401`. The app wires
/// [SiloSession.onTokensChanged] to persist a rotated pair and
/// [SiloSession.onSessionEnded] to return to sign-in.
class SiloMediaServerClient extends MediaServerClient
    implements ProfileAwareClient {
  final Dio _dio;

  /// Sends sign-in and refresh requests. It carries the device headers but no
  /// session interceptor, so a refresh never re-enters the request pipeline it
  /// is repairing.
  final Dio _authDio;

  @override
  final DeviceInfo deviceInfo;

  final SiloSession session;

  /// [httpClientAdapter] replaces the network transport; tests use it to
  /// answer from captured server responses. [clock] lets tests move time.
  SiloMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
    HttpClientAdapter? httpClientAdapter,
    DateTime Function()? clock,
  }) : _dio = _newDio(baseUrl),
       _authDio = _newDio(baseUrl),
       session = SiloSession(clock: clock) {
    _baseUrl = baseUrl;
    for (final dio in [_dio, _authDio]) {
      configureServerDio(dio);
      if (httpClientAdapter != null) dio.httpClientAdapter = httpClientAdapter;
    }
    _setupInterceptors();
  }

  static Dio _newDio(String baseUrl) => Dio(BaseOptions(
    baseUrl: baseUrl,
    followRedirects: false,
    // Only the connect. Waiting for a free slot happens before this
    // starts, so it can stay short enough to give up on a hung host.
    connectTimeout: const Duration(seconds: 8),
    receiveTimeout: const Duration(minutes: 3),
  ));

  late String _baseUrl;
  String? _userId;
  String? _profileId;
  String? _profileToken;
  String? _serverId;

  // Progress goes out every few seconds and would fill the report inside an
  // hour, so only one answer a minute is kept. A ping that fails still goes
  // through onError.
  static const _progressPingLogInterval = 12;
  int _progressPings = 0;

  static final _progressPath = RegExp(r'/api/v2/playback/[^/]+/progress$');

  bool _isProgressPing(Uri uri) => _progressPath.hasMatch(uri.path);

  bool _progressPingIsDue() {
    _progressPings++;
    return _progressPings % _progressPingLogInterval == 1;
  }

  void _setupInterceptors() {
    _dio.interceptors.add(redirectInterceptor(_dio, sameOriginOnly: true));
    // Refresh first, so the header interceptor below reads the new token.
    _dio.interceptors.add(SiloSessionInterceptor(_dio, _authDio, session));
    _dio.interceptors.add(_headersAndLogging());
    _authDio.interceptors.add(
      redirectInterceptor(_authDio, sameOriginOnly: true),
    );
    _authDio.interceptors.add(_headersAndLogging());
  }

  InterceptorsWrapper _headersAndLogging() => InterceptorsWrapper(
    onRequest: (options, handler) {
      final headers = authHeaders();
      if (options.extra[siloNoAuthExtra] == true) {
        headers.remove('Authorization');
      }
      options.headers.addAll(headers);
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
  );

  /// Silo's native server id (`/api/v2/system/identity`), fetched once.
  Future<String?> serverId() async {
    final cached = _serverId;
    if (cached != null) return cached;
    try {
      final response = await _authDio.get<dynamic>('/api/v2/system/identity');
      final id = asJsonMap(response.data)?['server_id'] as String?;
      if (id != null && id.isNotEmpty) _serverId = id;
      return id;
    } catch (_) {
      return null;
    }
  }

  @override
  ServerType get serverType => ServerType.silo;

  @override
  String get baseUrl => _baseUrl;

  @override
  set baseUrl(String url) {
    _baseUrl = url;
    _dio.options.baseUrl = url;
    _authDio.options.baseUrl = url;
  }

  /// The account's current access token. Setting it from outside (the generic
  /// sign-in path) keeps the refresh token when the value matches the
  /// session's pair; restore a full pair with [SiloSession.setTokens].
  @override
  String? get accessToken => session.accessToken;

  @override
  set accessToken(String? token) => session.setAccessToken(token);

  /// Moonfin's user id. On Silo this is the household profile id (plan §4.2,
  /// option A), so it normally equals [profileId].
  @override
  String? get userId => _userId;

  @override
  set userId(String? id) => _userId = id;

  @override
  String? get profileId => _profileId;

  @override
  set profileId(String? id) {
    if (id == _profileId) return;
    _profileId = id;
    session.identityChanged();
  }

  @override
  String? get profileToken => _profileToken;

  @override
  set profileToken(String? token) {
    if (token == _profileToken) return;
    _profileToken = token;
    session.identityChanged();
  }

  @override
  Map<String, String> authHeaders() => buildSiloRequestHeaders(
    deviceInfo: deviceInfo,
    accessToken: session.accessToken,
    profileId: _profileId,
    profileToken: _profileToken,
  );

  // Sign-in and the household profile API arrive in the next step.
  @override
  final AuthApi authApi = SiloPendingAuthApi();

  @override
  final UsersApi usersApi = SiloPendingUsersApi();

  @override
  late final SystemApi systemApi = SiloSystemApi(_dio);

  @override
  final LiveTvApi liveTvApi = const SiloLiveTvApi();

  @override
  final InstantMixApi instantMixApi = const SiloInstantMixApi();

  // Scaffolding until the step named in each class lands.
  @override
  final ItemsApi itemsApi = SiloPendingItemsApi();

  @override
  final PlaybackApi playbackApi = SiloPendingPlaybackApi();

  @override
  final ImageApi imageApi = const SiloPendingImageApi();

  @override
  final SessionApi sessionApi = SiloPendingSessionApi();

  @override
  final UserLibraryApi userLibraryApi = SiloPendingUserLibraryApi();

  @override
  final UserViewsApi userViewsApi = SiloPendingUserViewsApi();

  @override
  final DisplayPreferencesApi displayPreferencesApi =
      SiloPendingDisplayPreferencesApi();

  // Silo's admin API is unrelated to Jellyfin's; use Silo's own web admin.
  static Never _noAdmin() =>
      throw UnsupportedError('Admin is not supported on Silo');

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
    _authDio.close();
  }
}
