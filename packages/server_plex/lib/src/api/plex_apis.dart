import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../plex_item_mapper.dart';

Future<Map<String, dynamic>> plexContainer(
  Dio dio,
  String path, [
  Map<String, dynamic>? query,
]) async {
  final response = await dio.get<Map<String, dynamic>>(
    path,
    queryParameters: query,
  );
  return response.data?['MediaContainer'] as Map<String, dynamic>? ?? const {};
}

class PlexImageApi implements ImageApi {
  final String Function() _baseUrl;
  final String? Function() _accessToken;

  PlexImageApi(this._baseUrl, this._accessToken);

  /// [tag] is the Plex image path the item mapper stored, or a full URL for
  /// cast photos, which are served from plex.tv.
  String _image(String? tag, String fallback, {int? width, int? height}) {
    if (tag != null && tag.startsWith('http')) return tag;
    final path = tag != null && tag.startsWith('/') ? tag : fallback;
    final token = _accessToken();
    final auth = token == null ? '' : 'X-Plex-Token=$token';
    if (width == null && height == null) {
      return '${_baseUrl()}$path${auth.isEmpty ? '' : '?$auth'}';
    }
    // The transcoder wants both sides and fits the image inside them, so a
    // generous other side leaves the given one in charge.
    return '${_baseUrl()}/photo/:/transcode'
        '?width=${width ?? height! * 4}&height=${height ?? width! * 4}'
        '&url=${Uri.encodeQueryComponent(path)}${auth.isEmpty ? '' : '&$auth'}';
  }

  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => _image(
    tag,
    '/library/metadata/$itemId/thumb',
    width: maxWidth,
    height: maxHeight,
  );

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => _image(tag, '/library/metadata/$itemId/art', width: maxWidth);

  @override
  String getLogoImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      _image(tag, '/library/metadata/$itemId/clearLogo', width: maxWidth);

  @override
  String getBannerImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      _image(tag, '/library/metadata/$itemId/banner', width: maxWidth);

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      _image(tag, '/library/metadata/$itemId/art', width: maxWidth);

  @override
  String getChapterImageUrl(
    String itemId, {
    required int index,
    int? maxWidth,
    String? tag,
  }) => _image(tag, '/library/metadata/$itemId/thumb', width: maxWidth);

  @override
  String getUserImageUrl(String userId) =>
      'https://plex.tv/users/$userId/avatar';

  @override
  String getTrickplayTileImageUrl(
    String itemId, {
    required int width,
    required int index,
    String? mediaSourceId,
  }) => '';
}

/// Plex ends its version with the build's hash, which means nothing to a
/// reader.
String? plexVersion(Object? version) =>
    version is String ? version.split('-').first : null;

class PlexSystemApi implements SystemApi {
  final Dio _dio;

  PlexSystemApi(this._dio);

  @override
  Future<Map<String, dynamic>> getPublicSystemInfo() async {
    final identity = await plexContainer(_dio, '/identity');
    return {
      'Id': identity['machineIdentifier'],
      'Version': plexVersion(identity['version']),
      'ProductName': 'Plex Media Server',
    };
  }

  @override
  Future<Map<String, dynamic>> getSystemInfo() async {
    final root = await plexContainer(_dio, '/');
    return {
      'Id': root['machineIdentifier'],
      'ServerName': root['friendlyName'],
      'Version': plexVersion(root['version']),
      'OperatingSystem': root['platform'],
      'ProductName': 'Plex Media Server',
    };
  }

  @override
  Future<bool> ping() async {
    try {
      await _dio.get<dynamic>('/identity');
      return true;
    } catch (_) {
      return false;
    }
  }
}

class PlexUsersApi implements UsersApi {
  final Dio _dio;
  final String Function() _userId;
  final void Function(UserPolicy policy) _onPolicy;

  PlexUsersApi(this._dio, this._userId, this._onPolicy);

  /// Plex has no route for the signed in user, so this checks the token
  /// against the server and answers with the id the session already has.
  /// The server's allowSync is whether this account may download. Plex says
  /// nothing about subtitle search up front, so it's offered and the server
  /// answers for the account when it runs. Only the owner can edit the
  /// library or open the server's account route, and deleting media also
  /// needs the server's own setting on. The two requests go one after the
  /// other so a dead token reaches sign in as the plain 401 it watches for.
  @override
  Future<ServerUser> getCurrentUser() async {
    final root = await plexContainer(_dio, '/');
    final owner = await _owner();
    final policy = UserPolicy(
      isAdministrator: owner,
      enableContentDownloading: root['allowSync'] == true,
      enableContentDeletion: owner && root['allowMediaDeletion'] == true,
      enableSubtitleDownloading: true,
    );
    _onPolicy(policy);
    return ServerUser(id: _userId(), policy: policy);
  }

  Future<bool> _owner() async {
    try {
      await _dio.get<dynamic>('/myplex/account');
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) return false;
      rethrow;
    }
  }

  @override
  Future<List<AccessSchedule>?> getAccessSchedules(String userId) async =>
      const [];

  @override
  Future<UserConfiguration> getUserConfiguration() async =>
      const UserConfiguration();

  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {}
}

class PlexUserViewsApi implements UserViewsApi {
  final Dio _dio;

  PlexUserViewsApi(this._dio);

  @override
  Future<Map<String, dynamic>> getUserViews({
    bool includeHidden = false,
  }) async {
    final sections = await plexContainer(_dio, '/library/sections');
    final views = [
      for (final section in sections['Directory'] as List? ?? const [])
        if (section is Map<String, dynamic> &&
            (includeHidden || (section['hidden'] ?? 0) == 0))
          plexSectionToView(section),
      // Every Plex account has the free channels, and the app opens the guide
      // from a livetv view.
      {
        'Id': 'livetv',
        'Name': 'Live TV',
        'Type': 'CollectionFolder',
        'CollectionType': 'livetv',
        'IsFolder': true,
        'ImageTags': <String, dynamic>{},
      },
    ];
    return plexItemsResult(views);
  }
}

class PlexUserLibraryApi implements UserLibraryApi, ResumeVisibilityApi {
  final Dio _dio;
  final ItemsApi _itemsApi;

  PlexUserLibraryApi(this._dio, this._itemsApi);

  /// Plex keeps one watched state and rating for a movie split over several
  /// files, so a file's id stands for the movie.
  static String _key(String itemId) => plexPartOf(itemId)?.$1 ?? itemId;

  Future<void> _scrobble(String path, String itemId) => _dio.get<dynamic>(
    path,
    queryParameters: {
      'key': _key(itemId),
      'identifier': 'com.plexapp.plugins.library',
    },
  );

  @override
  bool get supportsNumericUserRatings => false;

  @override
  Future<void> markPlayed(String itemId) => _scrobble('/:/scrobble', itemId);

  @override
  Future<void> unmarkPlayed(String itemId) =>
      _scrobble('/:/unscrobble', itemId);

  /// Plex keeps the resume position. Nothing but playing the item again
  /// brings it back.
  @override
  Future<void> setHiddenFromResume(
    String itemId, {
    required bool hidden,
  }) async {
    if (!hidden) {
      throw UnsupportedError(
        "Plex can't put an item back on Continue Watching",
      );
    }
    await _dio.put<dynamic>(
      '/actions/removeFromContinueWatching',
      queryParameters: {'ratingKey': _key(itemId)},
    );
  }

  @override
  Future<void> updatePlayedPosition(
    String itemId, {
    required int positionTicks,
  }) => _dio.put<dynamic>(
    '/:/progress',
    queryParameters: {
      'key': itemId,
      'identifier': 'com.plexapp.plugins.library',
      'time': positionTicks ~/ 10000,
      'state': 'stopped',
    },
  );

  Future<void> _rate(String itemId, int rating) => _dio.put<dynamic>(
    '/:/rate',
    queryParameters: {
      'key': _key(itemId),
      'identifier': 'com.plexapp.plugins.library',
      'rating': rating,
    },
  );

  static Never _noRatings() => throw UnsupportedError(
    'Plex has no likes, and its rating stands in for favorites',
  );

  @override
  Future<void> markFavorite(String itemId) => _rate(itemId, plexFavoriteRating);

  /// Clearing the rating is all Plex offers, so a rating given in another
  /// Plex app goes too.
  @override
  Future<void> unmarkFavorite(String itemId) => _rate(itemId, -1);

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
  Future<Map<String, dynamic>> getItem(String itemId) =>
      _itemsApi.getItem(itemId);
}

/// Plex keeps no client view settings, so these last for the session.
class PlexDisplayPreferencesApi implements DisplayPreferencesApi {
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

class PlexSessionApi implements SessionApi {
  static Never _noRemote() =>
      throw UnsupportedError("Remote control isn't supported on Plex");

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

class PlexAuthApi implements AuthApi {
  static Never _plexTvOnly() =>
      throw UnsupportedError('Plex servers sign in through plex.tv');

  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) async => _plexTvOnly();

  @override
  Future<Map<String, dynamic>> initiateQuickConnect() async => _plexTvOnly();

  @override
  Future<Map<String, dynamic>> checkQuickConnect(String secret) async =>
      _plexTvOnly();

  @override
  Future<bool> authorizeQuickConnect(String code, {String? userId}) async =>
      _plexTvOnly();

  @override
  Future<Map<String, dynamic>> authenticateWithQuickConnect(
    String secret,
  ) async => _plexTvOnly();

  @override
  Future<void> logout() async {}
}

/// The tracks that sound most like the seed, when a Plex Pass server has
/// analyzed them. Otherwise random tracks from the seed's library that share
/// its genres.
class PlexInstantMixApi implements InstantMixApi {
  final Dio _dio;

  PlexInstantMixApi(this._dio);

  Future<Map?> _metadata(Object? key) async {
    final container = await plexContainer(_dio, '/library/metadata/$key');
    return (container['Metadata'] as List?)?.firstOrNull as Map?;
  }

  static List<Object?> _genres(Map? item) => [
    for (final genre in item?['Genre'] as List? ?? const []) genre['id'],
  ];

  static Map<String, dynamic> _tracks(Map container) => plexItemsResult([
    for (final track in container['Metadata'] as List? ?? const [])
      plexItemToJellyfin(track as Map<String, dynamic>),
  ]);

  @override
  Future<Map<String, dynamic>> getInstantMix(
    String itemId, {
    int? limit,
  }) async {
    try {
      final nearest = _tracks(
        await plexContainer(_dio, '/library/metadata/$itemId/nearest', {
          'limit': limit ?? 100,
        }),
      );
      if ((nearest['Items'] as List).isNotEmpty) return nearest;
    } on DioException {
      // A server without Plex Pass refuses, so the genre mix stands in.
    }
    final seed = await _metadata(itemId);
    final section = seed?['librarySectionID'];
    if (section == null) return plexItemsResult([]);
    // A track often has no genre of its own, while its album does.
    var genres = _genres(seed);
    if (genres.isEmpty && seed!['parentRatingKey'] != null) {
      genres = _genres(await _metadata(seed['parentRatingKey']));
    }
    final container =
        await plexContainer(_dio, '/library/sections/$section/all', {
          'type': plexTypeNumbers['Audio'],
          'sort': 'random',
          if (genres.isNotEmpty) 'album.genre': genres.join(','),
          'X-Plex-Container-Start': 0,
          'X-Plex-Container-Size': limit ?? 100,
        });
    return _tracks(container);
  }
}
