import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/session_repository.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/seerr/seerr_http_client.dart';
import '../services/seerr/seerr_models.dart';

class SeerrRepository {
  final PreferenceStore _store;
  final SessionRepository _session;
  final MediaServerClient _client;

  SeerrHttpClient? _httpClient;
  bool _initialized = false;
  String? _lastUserId;

  bool _isAvailable = false;
  bool _isMoonfinMode = false;

  int _lastSessionCheckMs = 0;
  int _lastInitAttemptMs = 0;
  bool _lastSessionValid = false;
  static const _sessionCacheDurationMs = 5 * 60 * 1000;

  int _lastBadgeCountMs = 0;
  int _cachedBadgeCount = 0;
  static const _badgeCountCacheDurationMs = 60 * 1000;

  final Map<String, SeerrMediaSummary> _mediaSummaryCache = {};

  bool get isAvailable => _isAvailable;
  bool get isMoonfinMode => _isMoonfinMode;

  SeerrRepository(this._store, this._session, this._client);

  String _userKey(String key) {
    final uid = _session.activeUserId ?? '';
    return 'seerr_${key}_$uid';
  }

  String get _enabledKey => _userKey('enabled');
  String get _authMethodKey => _userKey('auth_method');
  String get _moonfinModeKey => _userKey('moonfin_mode');
  String get _moonfinDisplayNameKey => _userKey('moonfin_display_name');
  String get _moonfinUserIdKey => _userKey('moonfin_user_id');
  String get _lastConnectionSuccessKey => _userKey('last_connection_success');
  String get _autoLoginFailedKey => _userKey('moonfin_autologin_failed');

  void _invalidateSessionCache() {
    _lastSessionCheckMs = 0;
    _lastSessionValid = false;
  }

  Future<void> ensureInitialized({bool force = false}) async {
    final currentUserId = _session.activeUserId;

    if (force) {
      _initialized = false;
      _httpClient?.close();
      _httpClient = null;
      _isAvailable = false;
      _invalidateSessionCache();
    }

    if (_initialized && currentUserId != null && currentUserId != _lastUserId) {
      _initialized = false;
      _httpClient?.close();
      _httpClient = null;
      _isAvailable = false;
      _invalidateSessionCache();
    }

    if (_initialized && _httpClient == null) {
      _initialized = false;
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    if (_initialized && !_isAvailable) {
      if (now - _lastInitAttemptMs > 30000) {
        _initialized = false;
        _httpClient?.close();
        _httpClient = null;
      }
    }

    if (_initialized) return;
    if (_httpClient != null && _isAvailable) {
      _initialized = true;
      return;
    }
    _lastInitAttemptMs = now;

    try {
      if (currentUserId == null) {
        _isAvailable = false;
        _initialized = true;
        return;
      }

      _lastUserId = currentUserId;

      await _initMoonfinMode();
      _initialized = true;
    } catch (_) {
      _isAvailable = false;
      _initialized = true;
    }
  }

  Future<void> _initMoonfinMode() async {
    final baseUrl = _client.baseUrl;
    final token = _client.accessToken;
    if (baseUrl.isEmpty || token == null || token.isEmpty) {
      _isAvailable = false;
      return;
    }

    _initClient(MoonfinProxyConfig(
      jellyfinBaseUrl: baseUrl,
      jellyfinToken: token,
    ));
    _isMoonfinMode = true;

    try {
      final status = await _httpClient!.getMoonfinStatus();
      _isAvailable = status.authenticated;
    } catch (_) {
      _isAvailable = false;
    }
  }

  void _initClient(MoonfinProxyConfig proxyConfig) {
    _httpClient?.close();
    _httpClient = SeerrHttpClient(proxyConfig: proxyConfig);
  }

  Future<T> _withClient<T>(
    Future<T> Function(SeerrHttpClient client) fn,
  ) async {
    await ensureInitialized();
    final client = _httpClient;
    if (client == null) throw StateError('Seerr HTTP client not initialized');
    return fn(client);
  }

  Future<bool> testConnection() => _withClient((c) => c.testConnection());

  Future<bool> isSessionValid() async {
    try {
      await _withClient((c) => c.getCurrentUser());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> isSessionValidCached() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    if ((now - _lastSessionCheckMs) < _sessionCacheDurationMs &&
        _lastSessionValid) {
      return true;
    }
    final valid = await isSessionValid();
    _lastSessionCheckMs = DateTime.now().millisecondsSinceEpoch;
    _lastSessionValid = valid;
    return valid;
  }

  Future<SeerrUser> getCurrentUser() =>
      _withClient((c) async => SeerrUser.fromJson(await c.getCurrentUser()));

  Future<MoonfinStatusResponse> configureWithMoonfin({
    required String jellyfinBaseUrl,
    required String jellyfinToken,
  }) async {
    final userId = _session.activeUserId;
    if (userId == null) throw StateError('No active user');
    _lastUserId = userId;

    _initClient(MoonfinProxyConfig(
      jellyfinBaseUrl: jellyfinBaseUrl,
      jellyfinToken: jellyfinToken,
    ));

    final status = await _httpClient!.getMoonfinStatus();
    final effectiveEnabled = status.enabled && status.authenticated;

    await _store.setBool(_moonfinModeKey, true);
    await _store.setBool(_enabledKey, effectiveEnabled);
    await _store.setString(_authMethodKey, 'moonfin');
    _isMoonfinMode = true;

    if (effectiveEnabled) {
      if (status.seerrUserId != null) {
        await _store.setString(
          _moonfinUserIdKey,
          status.seerrUserId.toString(),
        );
      }
      _isAvailable = true;
    } else {
      _isAvailable = false;
    }

    return status;
  }

  Future<MoonfinStatusResponse> checkMoonfinStatus() =>
      _withClient((c) => c.getMoonfinStatus());

  Future<void> bootstrapMoonfinSso({
    required String jellyfinBaseUrl,
    required String jellyfinToken,
    String? username,
    String? password,
  }) async {
    final status = await configureWithMoonfin(
      jellyfinBaseUrl: jellyfinBaseUrl,
      jellyfinToken: jellyfinToken,
    );

    if (status.authenticated) {
      await _store.setBool(_autoLoginFailedKey, false);
      return;
    }

    if (!status.enabled ||
        username == null ||
        username.isEmpty ||
        password == null ||
        password.isEmpty) {
      return;
    }

    if (_store.getBool(_autoLoginFailedKey) ?? false) return;

    try {
      await loginWithMoonbase(username: username, password: password);
      await _store.setBool(_autoLoginFailedKey, false);
    } catch (_) {
      await _store.setBool(_autoLoginFailedKey, true);
    }
  }

  Future<MoonfinLoginResponse> loginWithMoonbase({
    required String username,
    required String password,
    String authType = 'jellyfin',
  }) async {
    await ensureInitialized();
    if (_httpClient == null) {
      await _initMoonfinMode();
    }
    final client = _httpClient;
    if (client == null) {
      throw StateError(
        'Moonfin plugin proxy unavailable (no active Jellyfin session)',
      );
    }

    final response = await client.moonfinLogin(
      username: username,
      password: password,
      authType: authType,
    );

    await _store.setString(
      _moonfinDisplayNameKey,
      response.displayName ?? '',
    );
    await _store.setString(
      _moonfinUserIdKey,
      response.seerrUserId?.toString() ?? '',
    );
    await _store.setString(_authMethodKey, 'moonfin');
    await _store.setBool(_enabledKey, true);
    await _store.setBool(_lastConnectionSuccessKey, true);
    await _store.setBool(_autoLoginFailedKey, false);
    _isMoonfinMode = true;
    _isAvailable = true;
    _invalidateSessionCache();

    return response;
  }

  Future<void> logoutMoonfin() async {
    final client = _httpClient;
    if (client != null) {
      try {
        await client.moonfinLogout();
      } catch (_) {}
    }

    await _store.setString(_moonfinDisplayNameKey, '');
    await _store.setString(_moonfinUserIdKey, '');
    await _store.setBool(_enabledKey, false);
    await _store.setString(_authMethodKey, 'moonfin');
    await _store.setBool(_moonfinModeKey, true);

    _isMoonfinMode = true;
    _isAvailable = false;
    _invalidateSessionCache();
  }

  Future<SeerrDiscoverPage> getTrending({int limit = 20, int offset = 0}) =>
      _withClient(
        (c) async => SeerrDiscoverPage.fromJson(
          await c.getTrending(limit: limit, offset: offset),
        ),
      );

  Future<SeerrDiscoverPage> getTrendingMovies({
    int limit = 20,
    int offset = 0,
  }) => _withClient(
    (c) async => SeerrDiscoverPage.fromJson(
      await c.getTrendingMovies(limit: limit, offset: offset),
    ),
  );

  Future<SeerrDiscoverPage> getTrendingTv({int limit = 20, int offset = 0}) =>
      _withClient(
        (c) async => SeerrDiscoverPage.fromJson(
          await c.getTrendingTv(limit: limit, offset: offset),
        ),
      );

  Future<SeerrDiscoverPage> getTopMovies({int limit = 20, int offset = 0}) =>
      _withClient(
        (c) async => SeerrDiscoverPage.fromJson(
          await c.getTopMovies(limit: limit, offset: offset),
        ),
      );

  Future<SeerrDiscoverPage> getTopTv({int limit = 20, int offset = 0}) =>
      _withClient(
        (c) async => SeerrDiscoverPage.fromJson(
          await c.getTopTv(limit: limit, offset: offset),
        ),
      );

  Future<SeerrDiscoverPage> getUpcomingMovies() => _withClient(
    (c) async => SeerrDiscoverPage.fromJson(await c.getUpcomingMovies()),
  );

  Future<SeerrDiscoverPage> getUpcomingTv() => _withClient(
    (c) async => SeerrDiscoverPage.fromJson(await c.getUpcomingTv()),
  );

  Future<SeerrDiscoverPage> discoverMovies({
    int page = 1,
    String sortBy = 'popularity.desc',
    int? genre,
    int? studio,
    int? keywords,
    String language = 'en',
  }) => _withClient(
    (c) async => SeerrDiscoverPage.fromJson(
      await c.discoverMovies(
        page: page,
        sortBy: sortBy,
        genre: genre,
        studio: studio,
        keywords: keywords,
        language: language,
      ),
    ),
  );

  Future<SeerrDiscoverPage> discoverTv({
    int page = 1,
    String sortBy = 'popularity.desc',
    int? genre,
    int? network,
    int? keywords,
    String language = 'en',
  }) => _withClient(
    (c) async => SeerrDiscoverPage.fromJson(
      await c.discoverTv(
        page: page,
        sortBy: sortBy,
        genre: genre,
        network: network,
        keywords: keywords,
        language: language,
      ),
    ),
  );

  Future<SeerrDiscoverPage> search(
    String query, {
    String? mediaType,
    int limit = 20,
    int offset = 0,
  }) => _withClient(
    (c) async => SeerrDiscoverPage.fromJson(
      await c.search(query, mediaType: mediaType, limit: limit, offset: offset),
    ),
  );

  Future<SeerrMovieDetails> getMovieDetails(int tmdbId) => _withClient(
    (c) async => SeerrMovieDetails.fromJson(await c.getMovieDetails(tmdbId)),
  );

  Future<SeerrTvDetails> getTvDetails(int tmdbId) => _withClient(
    (c) async => SeerrTvDetails.fromJson(await c.getTvDetails(tmdbId)),
  );

  Future<SeerrTvDetails> getTvDetailsByTvdb(int tvdbId) => _withClient(
    (c) async => SeerrTvDetails.fromJson(await c.getTvDetailsByTvdb(tvdbId)),
  );

  Future<SeerrDiscoverPage> getSimilarMovies(int tmdbId, {int page = 1}) =>
      _withClient(
        (c) async => SeerrDiscoverPage.fromJson(
          await c.getSimilarMovies(tmdbId, page: page),
        ),
      );

  Future<SeerrDiscoverPage> getSimilarTv(int tmdbId, {int page = 1}) =>
      _withClient(
        (c) async => SeerrDiscoverPage.fromJson(
          await c.getSimilarTv(tmdbId, page: page),
        ),
      );

  Future<SeerrDiscoverPage> getMovieRecommendations(
    int tmdbId, {
    int page = 1,
  }) => _withClient(
    (c) async => SeerrDiscoverPage.fromJson(
      await c.getMovieRecommendations(tmdbId, page: page),
    ),
  );

  Future<SeerrDiscoverPage> getTvRecommendations(int tmdbId, {int page = 1}) =>
      _withClient(
        (c) async => SeerrDiscoverPage.fromJson(
          await c.getTvRecommendations(tmdbId, page: page),
        ),
      );

  Future<SeerrPersonDetails> getPersonDetails(int personId) => _withClient(
    (c) async =>
        SeerrPersonDetails.fromJson(await c.getPersonDetails(personId)),
  );

  Future<SeerrPersonCombinedCredits> getPersonCombinedCredits(int personId) =>
      _withClient(
        (c) async => SeerrPersonCombinedCredits.fromJson(
          await c.getPersonCombinedCredits(personId),
        ),
      );

  Future<List<SeerrGenre>> getGenreSliderMovies() => _withClient(
    (c) async => (await c.getGenreSliderMovies())
        .cast<Map<String, dynamic>>()
        .map(SeerrGenre.fromJson)
        .toList(),
  );

  Future<List<SeerrGenre>> getGenreSliderTv() => _withClient(
    (c) async => (await c.getGenreSliderTv())
        .cast<Map<String, dynamic>>()
        .map(SeerrGenre.fromJson)
        .toList(),
  );

  Future<SeerrRequestListResponse> getRequests({
    String? filter,
    String? sort,
    int? requestedBy,
    int limit = 50,
    int offset = 0,
  }) => _withClient(
    (c) async => SeerrRequestListResponse.fromJson(
      await c.getRequests(
        filter: filter,
        sort: sort,
        requestedBy: requestedBy,
        limit: limit,
        offset: offset,
      ),
    ),
  );

  Future<SeerrRequest> getRequest(int requestId) => _withClient(
    (c) async => SeerrRequest.fromJson(await c.getRequest(requestId)),
  );

  Future<SeerrRequest> createRequest({
    required int mediaId,
    required String mediaType,
    List<int>? seasons,
    bool allSeasons = false,
    bool is4k = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
  }) => _withClient(
    (c) async => SeerrRequest.fromJson(
      await c.createRequest(
        mediaId: mediaId,
        mediaType: mediaType,
        seasons: seasons,
        allSeasons: allSeasons,
        is4k: is4k,
        profileId: profileId,
        rootFolder: rootFolder,
        serverId: serverId,
      ),
    ),
  );

  Future<void> deleteRequest(int requestId) =>
      _withClient((c) => c.deleteRequest(requestId));

  Future<List<SeerrMedia>> getRecentlyAdded({int limit = 20}) =>
      _withClient((c) async {
        final data = await c.getRecentlyAdded(take: limit);
        final results =
            (data['results'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        return results.map(SeerrMedia.fromJson).toList();
      });

  Future<void> approveRequest(int requestId) =>
      _withClient((c) => c.approveRequest(requestId));

  Future<void> declineRequest(int requestId) =>
      _withClient((c) => c.declineRequest(requestId));

  Future<void> retryRequest(int requestId) =>
      _withClient((c) => c.retryRequest(requestId));

  Future<SeerrRequestCounts> getRequestCount() => _withClient(
    (c) async => SeerrRequestCounts.fromJson(await c.getRequestCount()),
  );

  /// Pending requests plus open issues, for the discover entry badge.
  /// Cached briefly and only counted for users who can act on them.
  Future<int> getActionableBadgeCount({bool force = false}) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (!force && (now - _lastBadgeCountMs) < _badgeCountCacheDurationMs) {
      return _cachedBadgeCount;
    }

    var count = 0;
    try {
      final user = await getCurrentUser();
      if (user.hasPermission(SeerrPermission.manageRequests)) {
        try {
          count += (await getRequestCount()).pending;
        } catch (_) {}
      }
      if (user.canManageIssues) {
        try {
          count += (await getIssueCount()).open;
        } catch (_) {}
      }
    } catch (_) {}

    _cachedBadgeCount = count;
    _lastBadgeCountMs = DateTime.now().millisecondsSinceEpoch;
    return count;
  }

  void invalidateBadgeCount() {
    _lastBadgeCountMs = 0;
  }

  /// Title and poster for a card, since the request and issue lists only
  /// carry media ids. Cached for the session.
  Future<SeerrMediaSummary?> getMediaSummary(
    int tmdbId,
    String mediaType,
  ) async {
    final key = '$mediaType:$tmdbId';
    final cached = _mediaSummaryCache[key];
    if (cached != null) return cached;

    try {
      final SeerrMediaSummary summary;
      if (mediaType == 'tv') {
        final details = await getTvDetails(tmdbId);
        summary = SeerrMediaSummary(
          title: details.displayTitle,
          posterPath: details.posterPath,
        );
      } else {
        final details = await getMovieDetails(tmdbId);
        summary = SeerrMediaSummary(
          title: details.title,
          posterPath: details.posterPath,
        );
      }
      _mediaSummaryCache[key] = summary;
      return summary;
    } catch (_) {
      return null;
    }
  }

  Future<SeerrQuota> getUserQuota(int userId) => _withClient(
    (c) async => SeerrQuota.fromJson(await c.getUserQuota(userId)),
  );

  Future<SeerrCollection> getCollectionDetails(int collectionId) => _withClient(
    (c) async => SeerrCollection.fromJson(
      await c.getCollectionDetails(collectionId),
    ),
  );

  Future<SeerrIssue> createIssue({
    required int issueType,
    required String message,
    required int mediaId,
    int problemSeason = 0,
    int problemEpisode = 0,
  }) => _withClient(
    (c) async => SeerrIssue.fromJson(
      await c.createIssue(
        issueType: issueType,
        message: message,
        mediaId: mediaId,
        problemSeason: problemSeason,
        problemEpisode: problemEpisode,
      ),
    ),
  );

  Future<SeerrIssueListResponse> getIssues({
    String? filter,
    String? sort,
    int? createdBy,
    int limit = 20,
    int offset = 0,
  }) => _withClient(
    (c) async => SeerrIssueListResponse.fromJson(
      await c.getIssues(
        filter: filter,
        sort: sort,
        createdBy: createdBy,
        limit: limit,
        offset: offset,
      ),
    ),
  );

  Future<SeerrIssueCounts> getIssueCount() => _withClient(
    (c) async => SeerrIssueCounts.fromJson(await c.getIssueCount()),
  );

  Future<SeerrIssue> getIssue(int issueId) => _withClient(
    (c) async => SeerrIssue.fromJson(await c.getIssue(issueId)),
  );

  Future<SeerrIssue> commentOnIssue(int issueId, String message) => _withClient(
    (c) async => SeerrIssue.fromJson(await c.commentOnIssue(issueId, message)),
  );

  Future<SeerrIssue> setIssueStatus(int issueId, String status) => _withClient(
    (c) async => SeerrIssue.fromJson(await c.setIssueStatus(issueId, status)),
  );

  Future<void> deleteIssue(int issueId) =>
      _withClient((c) => c.deleteIssue(issueId));

  Future<List<SeerrServiceServer>> getRadarrServers() => _withClient(
    (c) async => (await c.getRadarrServers())
        .cast<Map<String, dynamic>>()
        .map(SeerrServiceServer.fromJson)
        .toList(),
  );

  Future<SeerrServiceServerDetails> getRadarrServerDetails(int serverId) =>
      _withClient(
        (c) async => SeerrServiceServerDetails.fromJson(
          await c.getRadarrServerDetails(serverId),
        ),
      );

  Future<List<SeerrServiceServer>> getSonarrServers() => _withClient(
    (c) async => (await c.getSonarrServers())
        .cast<Map<String, dynamic>>()
        .map(SeerrServiceServer.fromJson)
        .toList(),
  );

  Future<SeerrServiceServerDetails> getSonarrServerDetails(int serverId) =>
      _withClient(
        (c) async => SeerrServiceServerDetails.fromJson(
          await c.getSonarrServerDetails(serverId),
        ),
      );

  Future<List<SeerrRadarrSettings>> getRadarrSettings() => _withClient(
    (c) async => (await c.getRadarrSettings())
        .cast<Map<String, dynamic>>()
        .map(SeerrRadarrSettings.fromJson)
        .toList(),
  );

  Future<List<SeerrSonarrSettings>> getSonarrSettings() => _withClient(
    (c) async => (await c.getSonarrSettings())
        .cast<Map<String, dynamic>>()
        .map(SeerrSonarrSettings.fromJson)
        .toList(),
  );

  Future<List<dynamic>> getRadarrCalendar({String? start, String? end}) =>
      _withClient((c) => c.getRadarrCalendar(start: start, end: end));

  Future<List<dynamic>> getSonarrCalendar({String? start, String? end}) =>
      _withClient((c) => c.getSonarrCalendar(start: start, end: end));

  Future<SeerrStatus> getStatus() => _withClient((c) => c.getStatus());

  Future<void> logout() => logoutMoonfin();

  void close() {
    _httpClient?.close();
    _httpClient = null;
  }
}
