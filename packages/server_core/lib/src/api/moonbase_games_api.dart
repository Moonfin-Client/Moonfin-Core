import 'package:dio/dio.dart';

import 'games_api.dart';
import '../models/games_models.dart';
import '../models/server_type.dart';

/// Talks to the Moonbase plugin retro-games (EmulatorJS) endpoints under /Moonfin/Games and
/// /Moonfin/EmulatorJS. These endpoints are identical on Jellyfin and Emby (the Moonbase
/// plugin exposes the same routes on both), so this implementation is server-agnostic; the
/// Jellyfin and Emby clients each construct it with their own Dio + base URL + token.
///
/// ROM / BIOS / save / player URLs embed the access token as a query parameter (ApiKey on
/// Jellyfin, api_key on Emby) so the WebView's plain requests authenticate.
class MoonbaseGamesApi implements GamesApi {
  final Dio _dio;
  final String Function() _baseUrlProvider;
  final String? Function() _tokenProvider;
  final ServerType _serverType;

  MoonbaseGamesApi(
      this._dio, this._baseUrlProvider, this._tokenProvider, this._serverType);

  String get _base => _baseUrlProvider().replaceAll(RegExp(r'/+$'), '');

  String get _apiKeyQuery {
    final token = _tokenProvider();
    return token == null
        ? ''
        : '${_serverType.tokenQueryParam}=${Uri.encodeQueryComponent(token)}';
  }

  @override
  Future<List<GameLibrary>> getLibraries() async {
    final response = await _dio.get('/Moonfin/Games/Libraries');
    return _asList(response.data)
        .map((m) => GameLibrary.fromJson(m))
        .toList(growable: false);
  }

  @override
  Future<List<GameSystem>> getSystems(String libraryId) async {
    final response =
        await _dio.get('/Moonfin/Games/${Uri.encodeComponent(libraryId)}/Systems');
    return _asList(response.data)
        .map((m) => GameSystem.fromJson(m))
        .toList(growable: false);
  }

  @override
  Future<List<GameSummary>> getGames(String libraryId, {String? system}) async {
    final response = await _dio.get(
      '/Moonfin/Games/${Uri.encodeComponent(libraryId)}/Games',
      queryParameters:
          (system != null && system.isNotEmpty) ? {'system': system} : null,
    );
    return _asList(response.data)
        .map((m) => GameSummary.fromJson(m))
        .toList(growable: false);
  }

  @override
  Future<GameDetail?> getGame(String libraryId, String gameId) async {
    final response = await _dio.get(
      '/Moonfin/Games/${Uri.encodeComponent(libraryId)}/Games/${Uri.encodeComponent(gameId)}',
    );
    final data = response.data;
    if (data is Map) {
      return GameDetail.fromJson(data.cast<String, dynamic>());
    }
    return null;
  }

  @override
  String thumbUrl({
    required String libraryId,
    required String gameId,
    String kind = 'boxart',
  }) {
    final lib = Uri.encodeComponent(libraryId);
    final id = Uri.encodeComponent(gameId);
    // The image loader requests this without Dio, so the token rides in the query the
    // same way it does for ROMs.
    return _withApiKey(
      '$_base/Moonfin/Games/$lib/Thumb/$id?type=${Uri.encodeQueryComponent(kind)}',
    );
  }

  String _romUrl(String libraryId, String gameId) {
    final lib = Uri.encodeComponent(libraryId);
    final id = Uri.encodeComponent(gameId);
    return _withApiKey('$_base/Moonfin/Games/$lib/Rom/$id');
  }

  String _biosUrl(String libraryId, String biosId) {
    final lib = Uri.encodeComponent(libraryId);
    final id = Uri.encodeComponent(biosId);
    return _withApiKey('$_base/Moonfin/Games/$lib/Bios/$id');
  }

  @override
  Future<void> downloadRom(
    String libraryId,
    String gameId,
    String destPath, {
    void Function(int received, int total)? onProgress,
  }) async {
    final lib = Uri.encodeComponent(libraryId);
    final id = Uri.encodeComponent(gameId);
    await _dio.download(
      '/Moonfin/Games/$lib/Rom/$id',
      destPath,
      onReceiveProgress: onProgress,
    );
  }

  @override
  Future<void> downloadBios(
      String libraryId, String biosId, String destPath) async {
    final lib = Uri.encodeComponent(libraryId);
    final id = Uri.encodeComponent(biosId);
    await _dio.download('/Moonfin/Games/$lib/Bios/$id', destPath);
  }

  @override
  String playerUrl({
    required String libraryId,
    required String gameId,
    required String core,
    String? biosId,
    String? gameName,
    bool includeSaveUrl = false,
  }) {
    final params = <String, String>{
      'core': core,
      'rom': _romUrl(libraryId, gameId),
    };
    if (biosId != null && biosId.isNotEmpty) {
      params['bios'] = _biosUrl(libraryId, biosId);
    }
    if (gameName != null && gameName.isNotEmpty) {
      params['name'] = gameName;
    }
    if (includeSaveUrl) {
      params['save'] = _withApiKey(
        '$_base/Moonfin/Games/Saves/${Uri.encodeComponent(gameId)}?kind=state',
      );
    }
    final query = params.entries
        .map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');
    return '$_base/Moonfin/EmulatorJS/player.html?$query';
  }

  @override
  Future<List<int>?> getSave(String gameId, {String kind = 'state'}) async {
    try {
      final response = await _dio.get<List<int>>(
        '/Moonfin/Games/Saves/${Uri.encodeComponent(gameId)}',
        queryParameters: {'kind': kind},
        options: Options(responseType: ResponseType.bytes),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  Future<void> putSave(String gameId, List<int> data,
      {String kind = 'state'}) async {
    await _dio.put(
      '/Moonfin/Games/Saves/${Uri.encodeComponent(gameId)}',
      queryParameters: {'kind': kind},
      data: Stream.fromIterable([data]),
      options: Options(
        contentType: 'application/octet-stream',
        headers: {Headers.contentLengthHeader: data.length},
      ),
    );
  }

  String _withApiKey(String url) {
    final q = _apiKeyQuery;
    if (q.isEmpty) return url;
    return url.contains('?') ? '$url&$q' : '$url?$q';
  }

  List<Map<String, dynamic>> _asList(dynamic data) {
    if (data is List) {
      return data
          .whereType<Map>()
          .map((m) => m.cast<String, dynamic>())
          .toList(growable: false);
    }
    return const [];
  }
}
