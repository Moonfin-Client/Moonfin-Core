import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'api/silo_account_api.dart';
import 'api/silo_admin_items_api.dart';
import 'api/silo_instant_mix_api.dart';
import 'api/silo_items_api.dart';
import 'api/silo_user_library_api.dart';
import 'api/silo_live_tv_api.dart';
import 'api/silo_auth_api.dart';
import 'api/silo_image_api.dart';
import 'api/silo_display_preferences_api.dart';
import 'api/silo_downloads_api.dart';
import 'api/silo_events_api.dart';
import 'api/silo_watch_party_api.dart';
import 'api/silo_images_api.dart';
import 'api/silo_unsupported.dart';
import 'api/silo_playback_api.dart';
import 'api/silo_profiles_api.dart';
import 'api/silo_system_api.dart';
import 'api/silo_user_views_api.dart';
import 'api/silo_users_api.dart';
import 'mappers/silo_ids.dart';
import 'silo_image_registry.dart';
import 'silo_image_resolver.dart';
import 'silo_problem.dart';
import 'silo_session.dart';
import 'silo_session_interceptor.dart';

/// Moonfin's client for a Silo server, speaking Silo's native `/api/v2`.
///
/// [baseUrl] is the server origin (plus any reverse-proxy prefix) without
/// `/api/v2`. Each API class adds the full path itself.
///
/// Every request carries Silo's headers (see [buildSiloRequestHeaders]): the
/// bearer token once signed in, the household profile, and this device and
/// app. On Silo, Moonfin's user is a household profile, so [userId] and
/// [profileId] normally hold the same id. They're kept apart because
/// signing in happens before a profile is chosen.
///
/// Live TV and Instant Mix are permanently empty, and the session API throws
/// [UnsupportedError]: Silo has none of them.
class SiloMediaServerClient extends MediaServerClient
    implements ProfileAwareClient, ServerDownloadsProvider {
  final Dio _dio;

  /// Sends refreshes and sign-in. It has the same headers,
  /// error parsing and redirect rule as [_dio] but no session interceptor, so
  /// a refresh never re-enters the request pipeline it is repairing.
  final Dio _authDio;

  @override
  final DeviceInfo deviceInfo;

  /// The platform name sent as `X-Silo-Device-Platform` (e.g. `macOS`,
  /// `Android TV`). Supplied by the app, which knows the platform.
  final String? platform;

  /// Sign-in state: the account's token pair (see [SiloSession]).
  final SiloSession session;

  /// [httpClientAdapter] replaces the network transport, and tests use it to
  /// answer from captured server responses. [clock] lets tests move time.
  SiloMediaServerClient({
    required String baseUrl,
    required this.deviceInfo,
    this.platform,
    HttpClientAdapter? httpClientAdapter,
    DateTime Function()? clock,
  }) : session = SiloSession(clock: clock),
       _dio = _newDio(baseUrl),
       _authDio = _newDio(baseUrl) {
    _baseUrl = baseUrl;
    // The profile selection and its PIN proof belong to the login they were
    // made under, so they go when that login is replaced or ends. Callers
    // pick a profile after setting tokens.
    session.addAccountChangedListener(() {
      _profileId = null;
      _profileToken = null;
      (usersApi as SiloUsersApi).forgetAccount();
      _forgetProfileReads();
    });
    for (final dio in [_dio, _authDio]) {
      configureServerDio(dio);
      if (httpClientAdapter != null) dio.httpClientAdapter = httpClientAdapter;
    }
    _setupInterceptors();
    SiloImageResolution.register(imageResolver);
  }

  static Dio _newDio(String baseUrl) => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      followRedirects: false,
      // Only the connect. Waiting for a free slot happens before this
      // starts, so it can stay short enough to give up on a hung host.
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(minutes: 3),
    ),
  );

  late String _baseUrl;
  String? _userId;
  String? _profileId;
  String? _profileToken;

  /// The household profile requests act as (`X-Profile-Id`).
  @override
  String? get profileId => _profileId;

  @override
  set profileId(String? id) {
    if (id == _profileId) return;
    final previous = _profileId;
    _profileId = id;
    session.identityChanged();
    // Another profile of the same login: the reads kept for the
    // previous one (its rows, libraries, settings, permissions) don't
    // apply. Picking a first profile has nothing to forget.
    if (previous != null) _forgetProfileReads();
  }

  void _forgetProfileReads() {
    userViewsApi.invalidateCache();
    itemsApi.noteProfileChanged();
    downloadsApi.invalidateCapability();
    playbackApi.forgetCapabilities();
  }

  /// Proof that a PIN-locked profile was unlocked (`X-Profile-Token`).
  @override
  String? get profileToken => _profileToken;

  @override
  set profileToken(String? token) {
    if (token == _profileToken) return;
    _profileToken = token;
    session.identityChanged();
  }

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

  /// The headers Silo expects on every request, for the current sign-in and
  /// profile.
  Map<String, String> get requestHeaders => buildSiloRequestHeaders(
    deviceInfo: deviceInfo,
    platform: platform,
    accessToken: session.accessToken,
    profileId: _profileId,
    profileToken: _profileToken,
  );

  /// This client's HTTP stack, for app code that calls Silo routes no API
  /// class covers (Moonfin's request screens). Requests get the session's
  /// headers and token refresh, and errors carry Silo's problem. Paths start
  /// at `/api/v2`.
  Dio get dio => _dio;

  /// The same headers as [requestHeaders], for requests made outside this
  /// client's own HTTP stack (see [serverAuthHeaders]).
  @override
  Map<String, String> authHeaders() => requestHeaders;

  void _setupInterceptors() {
    for (final dio in [_dio, _authDio]) {
      // Requests carry the bearer token (and, at sign-in, the password), so
      // redirects are only followed within the same origin.
      dio.interceptors.add(redirectInterceptor(dio, sameOriginOnly: true));
      // Added before the logger so a failure is logged with Silo's problem
      // code and text (error interceptors run in the order they were added).
      dio.interceptors.add(siloProblemInterceptor());
      if (identical(dio, _dio)) {
        // Before the header interceptor, so a refresh made before sending is
        // in place when the bearer token is written into the request.
        dio.interceptors.add(SiloSessionInterceptor(_dio, _authDio, session));
      }
      dio.interceptors.add(_headersAndLogging());
    }
  }

  InterceptorsWrapper _headersAndLogging() => InterceptorsWrapper(
    onRequest: (options, handler) {
      final headers = requestHeaders;
      if (options.extra[siloNoAuthExtra] == true) {
        headers.remove('Authorization');
      }
      if (options.extra[siloNoProfileExtra] == true) {
        headers
          ..remove('X-Profile-Id')
          ..remove('X-Profile-Token');
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

  /// Refreshes the session's tokens now, through the refresh client. The
  /// interceptor does this on its own. This is for the app when it restores
  /// a session whose access token has already expired.
  Future<bool> refreshSession() => session.refresh(_authDio);

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

  /// The account's current access token. Setting it from outside (the
  /// generic sign-in path) keeps the refresh token when the value matches the
  /// session's pair. Restore a full pair with [SiloSession.setTokens].
  @override
  String? get accessToken => session.accessToken;

  @override
  set accessToken(String? token) => session.setAccessToken(token);

  @override
  String? get userId => _userId;

  @override
  set userId(String? id) => _userId = id;

  @override
  late final AuthApi authApi = SiloAuthApi(
    _dio,
    _authDio,
    session,
    deviceName: deviceInfo.name,
    devicePlatform: platform,
  );

  @override
  late final UsersApi usersApi = SiloUsersApi(
    _dio,
    profilesApi,
    () => _profileId,
    images: images,
    onConfigurationUpdated: () => userViewsApi.invalidateCache(),
    downloads: downloadsApi,
  );

  /// Silo's downloads: the capability and the device's managed
  /// download entries.
  late final SiloDownloadsApi downloadsApi = SiloDownloadsApi(
    _dio,
    baseUrl: () => _baseUrl,
    headers: () => requestHeaders,
    clock: () => session.now,
  );

  /// Downloads go through Silo's registry.
  @override
  ServerDownloadsApi get serverDownloads => downloadsApi;

  /// The artwork URLs seen in Silo's answers, by item and image type (see
  /// [SiloImageRegistry]), which [imageApi] answers from.
  late final SiloImageRegistry images = SiloImageRegistry(() => _baseUrl);

  /// Resolves the placeholder URLs [imageApi] hands out for items not read
  /// yet, by loading them.
  late final SiloImageResolver imageResolver = SiloImageResolver(
    registry: images,
    baseUrl: () => _baseUrl,
    load: _loadArtwork,
  );

  /// Reads what Silo has on [id] so its artwork is registered: a catalog
  /// item by its content id, otherwise a library, a profile (avatars) or a
  /// person, which have plain ids.
  Future<void> _loadArtwork(String id) async {
    if (parseSiloCollectionId(id) != null || siloTypeOfId(id) != null) {
      // Reading the item registers its artwork: a title's detail (shared
      // with its page, if that is loading too), a season from its series'
      // list, a collection with its list.
      await itemsApi.getItem(id);
      return;
    }
    // Library posters register as the list is read (kept five minutes).
    await userViewsApi.getUserViews(includeHidden: true);
    if (images.knows(id)) return;
    if (id.contains('-')) {
      // Profile ids are UUIDs, and person and library ids are numbers.
      for (final profile in await profilesApi.list()) {
        images.note(profile.id);
        images.register(
          profile.id,
          SiloImageType.primary,
          profile.json['avatar_url'] as String?,
        );
      }
      return;
    }
    final person = await _dio.get<dynamic>(
      '/api/v2/catalog/people/${Uri.encodeComponent(id)}',
    );
    final json = asJsonMap(person.data);
    if (json != null) {
      images.note(id);
      images.register(id, SiloImageType.primary, json['photo_url'] as String?);
    }
  }

  @override
  late final SystemApi systemApi = SiloSystemApi(_dio);

  /// Silo's household profiles (no Moonfin interface, see [SiloProfilesApi]).
  late final SiloProfilesApi profilesApi = SiloProfilesApi(_dio);

  /// The signed-in account's own password (no Moonfin interface, see
  /// [SiloAccountApi]).
  late final SiloAccountApi accountApi = SiloAccountApi(_dio);

  /// Silo's image endpoints: the size buckets (no Moonfin interface, see
  /// [SiloImagesApi]).
  late final SiloImagesApi imagesApi = SiloImagesApi(_dio);

  /// Silo's realtime events socket: its capability and tickets (no Moonfin
  /// interface, see [SiloEventsApi]).
  late final SiloEventsApi eventsApi = SiloEventsApi(
    _dio,
    baseUrl: () => _baseUrl,
  );

  /// Silo's Watch Party rooms (no Moonfin interface, see
  /// [SiloWatchPartyApi]).
  late final SiloWatchPartyApi watchPartyApi = SiloWatchPartyApi(
    _dio,
    baseUrl: () => _baseUrl,
  );

  @override
  late final SiloItemsApi itemsApi = SiloItemsApi(
    _dio,
    images: images,
    userViews: () => userViewsApi,
    profileId: () => _profileId,
    baseUrl: () => _baseUrl,
    clock: () => session.now,
  );

  @override
  late final SiloUserViewsApi userViewsApi = SiloUserViewsApi(
    _dio,
    usersApi: () => usersApi,
    images: images,
  );

  @override
  late final UserLibraryApi userLibraryApi = SiloUserLibraryApi(itemsApi, _dio);

  @override
  final DisplayPreferencesApi displayPreferencesApi =
      SiloDisplayPreferencesApi();

  @override
  late final SiloPlaybackApi playbackApi = SiloPlaybackApi(
    itemsApi,
    _dio,
    clock: () => session.now,
  );

  @override
  final SessionApi sessionApi = const SiloSessionApi();

  @override
  late final ImageApi imageApi = SiloImageApi(
    images,
    baseUrl: () => _baseUrl,
    onTrickplaySheet: (fileId) => itemsApi.trickplay.touch(fileId),
  );

  @override
  final LiveTvApi liveTvApi = const SiloLiveTvApi();

  @override
  final InstantMixApi instantMixApi = const SiloInstantMixApi();

  // Silo's admin API is unrelated to Jellyfin's, and Silo is administered
  // from its own web app (FeatureDetector.supportsAdmin hides Moonfin's
  // panel). Only an item's identify, refresh and artwork are mapped.
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
  late final AdminItemsApi adminItemsApi = SiloAdminItemsApi(_dio, itemsApi);

  final _ownUserDataChanges = StreamController<String>.broadcast();

  /// Items whose user data this client's own playback changed. Silo's
  /// events socket says nothing when a playback session stops (only the
  /// `/progress` and mark-watched routes publish `user_state.changed`), so
  /// the app's events socket turns these into the `UserDataChanged` Silo
  /// would have caused, and the lists showing the item pick up its new
  /// watched state and resume point.
  Stream<String> get ownUserDataChanges => _ownUserDataChanges.stream;

  /// Called when a playback session of [itemId] has stopped: its resume
  /// point, and its watched state if it was finished, are now Silo's.
  void notePlaybackEnded(String itemId) {
    if (itemId.isEmpty) return;
    itemsApi.noteUserDataChanged(itemId);
    if (!_ownUserDataChanges.isClosed) _ownUserDataChanges.add(itemId);
  }

  @override
  void dispose() {
    unawaited(_ownUserDataChanges.close());
    SiloImageResolution.unregister(imageResolver);
    _dio.close();
    _authDio.close();
  }
}
