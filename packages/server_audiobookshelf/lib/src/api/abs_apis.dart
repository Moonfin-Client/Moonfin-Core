import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../abs_ids.dart';
import '../abs_item_mapper.dart';
import '../abs_progress.dart';
import 'abs_items_api.dart';

/// Where a user's [UserConfiguration] and favorites are kept, by user id.
/// Audiobookshelf has no place for either, so the app keeps them on the
/// device.
typedef AbsUserStore = ({
  Map<String, dynamic>? Function(String userId) read,
  Future<void> Function(String userId, Map<String, dynamic> json) write,
});

const _favoritesKey = 'MoonfinFavorites';

/// The signed in user's favorites, kept with their configuration.
class AbsFavorites {
  AbsFavorites(this._store, this._userId);

  final AbsUserStore? _store;
  final String? Function() _userId;
  final _session = <String>{};

  Set<String> get ids {
    final userId = _userId();
    final stored = userId == null ? null : _store?.read(userId)?[_favoritesKey];
    return {
      ..._session,
      for (final id in stored as List? ?? const []) if (id is String) id,
    };
  }

  Future<void> set(String itemId, bool favorite) async {
    final next = ids;
    favorite ? next.add(itemId) : next.remove(itemId);
    _session
      ..clear()
      ..addAll(next);
    final userId = _userId();
    final store = _store;
    if (userId == null || store == null) return;
    await store.write(userId, {
      ...?store.read(userId),
      _favoritesKey: next.toList(),
    });
  }
}

class AbsAuthApi implements AuthApi {
  AbsAuthApi(this._dio);

  final Dio _dio;

  static Map<String, dynamic> policyJson(Map<String, dynamic> user) {
    final permissions = (user['permissions'] as Map?) ?? const {};
    final type = user['type'];
    final admin = type == 'root' || type == 'admin';
    return {
      // Admins manage Audiobookshelf from its own web app. Taken for an admin
      // here, the app would offer metadata and artwork tools that don't work
      // on it.
      'IsAdministrator': false,
      'EnableContentDownloading': permissions['download'] == true,
      'EnableContentDeletion': false,
      'EnableCollectionManagement': admin || permissions['update'] == true,
    };
  }

  /// The legacy token outlives a listening session and works in stream
  /// URLs, where the hour long access token would run out mid book.
  // shortcut: no refresh token handling, so sign-in starts over if the server
  // stops issuing legacy tokens.
  static String? tokenOf(Map<String, dynamic> user) {
    final legacy = user['token'];
    if (legacy is String && legacy.isNotEmpty) return legacy;
    final access = user['accessToken'];
    return access is String && access.isNotEmpty ? access : null;
  }

  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/login',
      data: {'username': username, 'password': password},
      options: Options(extra: {absNoAuthExtra: true}),
    );
    final user = _userOf(response.data);
    return _signedIn(user, tokenOf(user), fallbackName: username);
  }

  /// Signs in with an API key made in Audiobookshelf's settings. The key stays
  /// the token, since it works for every route, stream URLs and the socket.
  Future<Map<String, dynamic>> authenticateWithApiKey(String key) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/authorize',
      options: Options(
        headers: {'Authorization': 'Bearer $key'},
        extra: {absNoAuthExtra: true},
      ),
    );
    return _signedIn(_userOf(response.data), key);
  }

  /// The label of the server's OpenID button, empty when it has none of its
  /// own, or null when the server has OpenID turned off.
  Future<String?> openIdButtonText() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/status',
      options: Options(extra: {absNoAuthExtra: true}),
    );
    final data = response.data ?? const {};
    final methods = data['authMethods'] as List? ?? const [];
    if (!methods.contains('openid')) return null;
    final label = (data['authFormData'] as Map?)?['authOpenIDButtonText'];
    return label is String ? label.trim() : '';
  }

  ({String state, String verifier, String cookie})? _openId;

  /// Starts an OpenID sign-in and answers the page to open in a browser. The
  /// browser comes back to [redirectUri], which the server's admin has to
  /// allow, and that link goes to [finishOpenId].
  Future<Uri> startOpenId(String redirectUri) async {
    final verifier = _random(48);
    final state = _random(24);
    final challenge = base64Url
        .encode(sha256.convert(ascii.encode(verifier)).bytes)
        .replaceAll('=', '');
    final response = await _dio.get<String>(
      '/auth/openid',
      queryParameters: {
        'response_type': 'code',
        'client_id': 'Moonfin',
        'redirect_uri': redirectUri,
        'code_challenge': challenge,
        'code_challenge_method': 'S256',
        'state': state,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
        responseType: ResponseType.plain,
        extra: {absNoAuthExtra: true},
      ),
    );
    final page = response.headers.value('location');
    if (page == null || (response.statusCode ?? 0) ~/ 100 != 3) {
      throw AbsOpenIdRefused(response.data ?? '');
    }
    // The server keeps the attempt in its session, which only these cookies
    // name, so the code goes back with them.
    final cookie = [
      for (final header in response.headers['set-cookie'] ?? const <String>[])
        header.split(';').first,
    ].join('; ');
    _openId = (state: state, verifier: verifier, cookie: cookie);
    return Uri.parse(page);
  }

  /// Whether [link] is the browser coming back from [startOpenId].
  bool isOpenIdCallback(Uri link) =>
      _openId != null && link.queryParameters['state'] == _openId!.state;

  Future<Map<String, dynamic>> finishOpenId(Uri link) async {
    final attempt = _openId;
    final code = link.queryParameters['code'];
    if (attempt == null || code == null || !isOpenIdCallback(link)) {
      throw const AbsOpenIdRefused('state mismatch');
    }
    _openId = null;
    final response = await _dio.get<Map<String, dynamic>>(
      '/auth/openid/callback',
      queryParameters: {
        'state': attempt.state,
        'code': code,
        'code_verifier': attempt.verifier,
      },
      options: Options(
        headers: {'Cookie': attempt.cookie},
        followRedirects: false,
        extra: {absNoAuthExtra: true},
      ),
    );
    final user = _userOf(response.data);
    return _signedIn(user, tokenOf(user));
  }

  static Map<String, dynamic> _userOf(Map<String, dynamic>? data) =>
      (data?['user'] as Map?)?.cast<String, dynamic>() ?? const {};

  static Map<String, dynamic> _signedIn(
    Map<String, dynamic> user,
    String? token, {
    String fallbackName = '',
  }) => {
    'AccessToken': token,
    'User': {
      'Id': user['id'],
      'Name': user['username'] ?? fallbackName,
      'Policy': policyJson(user),
    },
  };

  static String _random(int bytes) {
    final random = Random.secure();
    return base64Url
        .encode([for (var i = 0; i < bytes; i++) random.nextInt(256)])
        .replaceAll('=', '');
  }

  @override
  Future<Map<String, dynamic>> initiateQuickConnect() async =>
      throw const QuickConnectUnavailableError();

  @override
  Future<Map<String, dynamic>> checkQuickConnect(String secret) async =>
      throw const QuickConnectUnavailableError();

  @override
  Future<bool> authorizeQuickConnect(String code, {String? userId}) async => false;

  @override
  Future<Map<String, dynamic>> authenticateWithQuickConnect(String secret) async =>
      throw const QuickConnectUnavailableError();

  @override
  Future<void> logout() async {
    try {
      await _dio.post<dynamic>('/logout');
    } on DioException {
      // Signing out of this device goes ahead whatever the server says.
    }
  }
}

/// The server wouldn't start an OpenID sign-in, usually because the redirect
/// address isn't on its allowed list.
class AbsOpenIdRefused implements Exception {
  const AbsOpenIdRefused(this.reason);

  final String reason;

  bool get redirectRefused => reason.contains('redirect_uri');

  @override
  String toString() => 'OpenID sign-in refused: $reason';
}

/// Marks a request that must go out without the stored token.
const absNoAuthExtra = 'absNoAuth';

class AbsSystemApi implements SystemApi {
  AbsSystemApi(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> getPublicSystemInfo() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/status',
      options: Options(extra: {absNoAuthExtra: true}),
    );
    return audiobookshelfPublicInfo(response.data ?? const {});
  }

  @override
  Future<Map<String, dynamic>> getSystemInfo() => getPublicSystemInfo();

  @override
  Future<bool> ping() async {
    try {
      await _dio.get<dynamic>(
        '/ping',
        options: Options(
          sendTimeout: SystemApi.pingTimeout,
          receiveTimeout: SystemApi.pingTimeout,
          extra: {absNoAuthExtra: true},
        ),
      );
      return true;
    } catch (e) {
      return pingAnsweredDespite(e);
    }
  }
}

class AbsUsersApi implements UsersApi {
  AbsUsersApi(this._progress, this._userId, {AbsUserStore? store})
    : _store = store;

  final AbsProgressCache _progress;
  final String? Function() _userId;
  final AbsUserStore? _store;

  @override
  Future<ServerUser> getCurrentUser() async {
    _progress.invalidate();
    final user = await _progress.user();
    final policy = UserPolicy.fromJson(AbsAuthApi.policyJson(user));
    return ServerUser(
      id: user['id'] as String? ?? _userId() ?? '',
      name: user['username'] as String?,
      policy: policy,
      raw: user,
    );
  }

  @override
  Future<List<AccessSchedule>?> getAccessSchedules(String userId) async => const [];

  @override
  Future<AccessWindow?> getAccessWindow() async => null;

  @override
  Future<UserConfiguration> getUserConfiguration() async {
    final userId = _userId();
    final json = userId == null ? null : _store?.read(userId);
    return json == null
        ? const UserConfiguration(hidePlayedInLatest: false)
        : UserConfiguration.fromJson(json);
  }

  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {
    final userId = _userId();
    final store = _store;
    if (userId == null || store == null) return;
    final favorites = store.read(userId)?[_favoritesKey];
    await store.write(userId, {
      ...config.toJson(),
      _favoritesKey: ?favorites,
    });
  }
}

class AbsUserViewsApi implements UserViewsApi {
  AbsUserViewsApi(this._items, this._config);

  final AbsItemsApi _items;
  final Future<UserConfiguration> Function() _config;

  @override
  Future<Map<String, dynamic>> getUserViews({bool includeHidden = false}) async {
    final libraries = [...await _items.libraries()]
      ..sort(
        (a, b) => ((a['displayOrder'] as num?) ?? 0).compareTo(
          (b['displayOrder'] as num?) ?? 0,
        ),
      );
    final views = [for (final library in libraries) absLibraryToView(library)];
    final config = await _config();
    final order = config.orderedViews;
    final shown = [
      for (final view in views)
        if (includeHidden || !config.myMediaExcludes.contains(view['Id'])) view,
    ];
    return absItemsResult([
      for (final id in order) ...shown.where((view) => view['Id'] == id),
      ...shown.where((view) => !order.contains(view['Id'])),
    ]);
  }
}

class AbsUserLibraryApi implements UserLibraryApi, ResumeVisibilityApi {
  AbsUserLibraryApi(this._dio, this._items, this._progress, this._favorites);

  final Dio _dio;
  final AbsItemsApi _items;
  final AbsProgressCache _progress;
  final AbsFavorites _favorites;

  Future<void> _patch(String itemId, Map<String, dynamic> body) async {
    await _dio.patch<dynamic>(absProgressPath(itemId), data: body);
    _progress.invalidate();
  }

  @override
  bool get supportsNumericUserRatings => false;

  @override
  Future<void> markFavorite(String itemId) => _favorites.set(itemId, true);

  @override
  Future<void> unmarkFavorite(String itemId) => _favorites.set(itemId, false);

  @override
  Future<void> markPlayed(String itemId) => _patch(itemId, {'isFinished': true});

  @override
  Future<void> unmarkPlayed(String itemId) => _patch(itemId, {
    'isFinished': false,
    'currentTime': 0,
    'progress': 0,
    'ebookProgress': 0,
  });

  /// An ebook position comes in the reader's units: a share of one second's
  /// ticks for an EPUB, or the zero based page times [absTicksPerPage].
  @override
  Future<void> updatePlayedPosition(
    String itemId, {
    required int positionTicks,
  }) async {
    final item = await _items.getItem(itemId);
    if (item['Type'] == 'Book') {
      final format = item['AbsEbookFormat'] as String?;
      if (format == 'epub') {
        final share = (positionTicks / absEbookRunTimeTicks).clamp(0.0, 1.0);
        await _patch(itemId, {'ebookProgress': share});
      } else {
        final page = positionTicks ~/ absTicksPerPage + 1;
        await _patch(itemId, {'ebookLocation': '$page'});
      }
      return;
    }
    final duration = item['RunTimeTicks'] is int
        ? absSeconds(item['RunTimeTicks'] as int)
        : null;
    await _patch(itemId, absPositionBody(absSeconds(positionTicks), duration));
  }

  @override
  Future<void> setHiddenFromResume(String itemId, {required bool hidden}) async {
    if (hidden) {
      final progress = await _progress.of(
        absItemIdOf(itemId),
        absEpisodeKey(itemId)?.episodeId,
      );
      final progressId = progress?['id'];
      if (progressId == null) return;
      await _dio.get<dynamic>(
        '/api/me/progress/$progressId/remove-from-continue-listening',
      );
      _progress.invalidate();
      return;
    }
    await _patch(itemId, {'hideFromContinueListening': false});
  }

  static Never _noRatings() =>
      throw UnsupportedError('Audiobookshelf has no personal ratings');

  @override
  Future<void> updateUserRating(String itemId, {required bool likes}) async =>
      _noRatings();

  @override
  Future<void> updateNumericUserRating(
    String itemId, {
    required double rating,
  }) async => _noRatings();

  @override
  Future<void> deleteUserRating(String itemId) async => _noRatings();

  @override
  Future<Map<String, dynamic>> getItem(String itemId) => _items.getItem(itemId);
}

class AbsImageApi implements ImageApi {
  AbsImageApi(this._baseUrl, this._accessToken);

  final String Function() _baseUrl;
  final String? Function() _accessToken;

  String _cover(String itemId, {int? width, int? height, String? tag}) {
    final query = {
      'width': ?(width ?? height)?.toString(),
      'ts': ?tag,
    };
    final qs = query.entries
        .map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');
    return '${_baseUrl()}/api/items/$itemId/cover${qs.isEmpty ? '' : '?$qs'}';
  }

  String _image(String itemId, {int? width, int? height, String? tag}) {
    if (absAuthorKey(itemId) case final authorId?) {
      final token = _accessToken();
      return '${_baseUrl()}/api/authors/$authorId/image'
          '?width=${width ?? height ?? 400}'
          '${token == null ? '' : '&token=${Uri.encodeQueryComponent(token)}'}';
    }
    if (absBorrowedCover(tag) case final borrowed?) {
      return _cover(borrowed.itemId, width: width, height: height, tag: borrowed.tag);
    }
    if (absEpisodeKey(itemId) case final episode?) {
      return _cover(episode.itemId, width: width, height: height, tag: tag);
    }
    if (!absIsLibraryItemId(itemId)) return '';
    return _cover(itemId, width: width, height: height, tag: tag);
  }

  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => _image(itemId, width: maxWidth, height: maxHeight, tag: tag);

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => _image(itemId, width: maxWidth, tag: tag);

  @override
  String getLogoImageUrl(String itemId, {int? maxWidth, String? tag}) => '';

  @override
  String getBannerImageUrl(String itemId, {int? maxWidth, String? tag}) => '';

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      _image(itemId, width: maxWidth, tag: tag);

  @override
  String getChapterImageUrl(
    String itemId, {
    required int index,
    int? maxWidth,
    String? tag,
  }) => '';

  @override
  String getUserImageUrl(String userId) => '';

  @override
  String getTrickplayTileImageUrl(
    String itemId, {
    required int width,
    required int index,
    String? mediaSourceId,
  }) => '';
}

/// Audiobookshelf keeps no client view settings, so these last for the
/// session.
class AbsDisplayPreferencesApi implements DisplayPreferencesApi {
  final _prefs = <String, DisplayPreferences>{};

  @override
  Future<DisplayPreferences> getDisplayPreferences(
    String id, {
    String? client,
  }) async => _prefs[id] ?? DisplayPreferences(id: id);

  @override
  Future<void> saveDisplayPreferences(
    String id,
    DisplayPreferences prefs, {
    String? client,
  }) async => _prefs[id] = prefs;
}

class AbsSessionApi implements SessionApi {
  static Never _noRemote() =>
      throw UnsupportedError("Remote control isn't supported on Audiobookshelf");

  @override
  Future<void> reportCapabilities(Map<String, dynamic> capabilities) async {}

  @override
  Future<List<Map<String, dynamic>>> getSessions({
    String? controllableByUserId,
    int? activeWithinSeconds,
  }) async => [];

  @override
  Future<void> sendPlayCommand(
    String sessionId, {
    required String playCommand,
    required List<String> itemIds,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startIndex,
  }) async => _noRemote();

  @override
  Future<void> sendPlayStateCommand(
    String sessionId,
    String command, {
    int? seekPositionTicks,
  }) async => _noRemote();

  @override
  Future<void> sendMessage(
    String sessionId,
    String text, {
    String? header,
    int? timeoutMs,
  }) async => _noRemote();

  @override
  Future<void> sendGeneralCommand(
    String sessionId,
    String commandName, {
    Map<String, String>? arguments,
  }) async => _noRemote();
}

class AbsInstantMixApi implements InstantMixApi {
  @override
  Future<Map<String, dynamic>> getInstantMix(String itemId, {int? limit}) async =>
      absItemsResult(const []);
}
