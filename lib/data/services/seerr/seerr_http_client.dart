import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../log_service.dart';
import 'seerr_error.dart';
import 'seerr_models.dart';

class SeerrHttpClient {
  final MoonfinProxyConfig proxyConfig;

  late final Dio _dio;

  SeerrHttpClient({required this.proxyConfig}) {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      followRedirects: true,
      validateStatus: (_) => true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        _log?.network('-> ${options.method} ${options.uri}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        _log?.network(
          '<- ${response.statusCode} ${response.requestOptions.method} '
          '${response.requestOptions.uri}',
        );
        handler.next(response);
      },
      onError: (error, handler) {
        _log?.network(
          'x ${error.requestOptions.method} ${error.requestOptions.uri} '
          '(${error.response?.statusCode ?? error.type.name})',
          level: LogLevel.error,
          error: error.message ?? error.toString(),
        );
        handler.next(error);
      },
    ));
    _dio.interceptors.add(_ProxyUnwrapInterceptor());
  }

  static LogService? get _log =>
      GetIt.instance.isRegistered<LogService>()
          ? GetIt.instance<LogService>()
          : null;

  static String _trimSlash(String path) =>
      path.startsWith('/') ? path.substring(1) : path;

  String _apiUrl(String path) {
    return '${proxyConfig.jellyfinBaseUrl}/Moonfin/Seerr/Api/${_trimSlash(path)}';
  }

  String _moonfinUrl(String path) {
    return '${proxyConfig.jellyfinBaseUrl}/Moonfin/Seerr/${_trimSlash(path)}';
  }

  Options _authOptions([Options? existing]) {
    final headers = <String, dynamic>{
      'Authorization': 'MediaBrowser Token="${proxyConfig.jellyfinToken}"',
    };
    if (existing != null) {
      return existing.copyWith(headers: {...?existing.headers, ...headers});
    }
    return Options(headers: headers);
  }

  Options _authJsonOptions([Options? existing]) {
    return _authOptions(existing).copyWith(
      contentType: Headers.jsonContentType,
    );
  }

  /// Turns the request mutation error codes Seerr uses, such as a 403 for a
  /// permission or quota refusal, into a typed exception the UI can localize.
  void _throwIfRequestError(Response response) {
    final requestError = SeerrRequestException.fromResponse(
      response.statusCode,
      response.data,
    );
    if (requestError != null) throw requestError;
  }

  void _requireSuccess(Response response, String context) {
    if (response.statusCode == null || response.statusCode! < 200 || response.statusCode! > 299) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: '$context: HTTP ${response.statusCode}',
      );
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    final response = await _dio.get(
      _apiUrl('auth/me'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getCurrentUser');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getRequests({
    String? filter,
    String? sort,
    int? requestedBy,
    int limit = 50,
    int offset = 0,
  }) async {
    final response = await _dio.get(
      _apiUrl('request'),
      queryParameters: {
        'skip': offset,
        'take': limit,
        'filter': ?filter,
        'sort': ?sort,
        'requestedBy': ?requestedBy,
      },
      options: _authOptions(),
    );
    _requireSuccess(response, 'getRequests');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getRequestCount() async {
    final response = await _dio.get(
      _apiUrl('request/count'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getRequestCount');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getUserQuota(int userId) async {
    final response = await _dio.get(
      _apiUrl('user/$userId/quota'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getUserQuota');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getCollectionDetails(int collectionId) async {
    final response = await _dio.get(
      _apiUrl('collection/$collectionId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getCollectionDetails');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> createIssue({
    required int issueType,
    required String message,
    required int mediaId,
    int problemSeason = 0,
    int problemEpisode = 0,
  }) async {
    final response = await _dio.post(
      _apiUrl('issue'),
      data: {
        'issueType': issueType,
        'message': message,
        'mediaId': mediaId,
        'problemSeason': problemSeason,
        'problemEpisode': problemEpisode,
      },
      options: _authJsonOptions(),
    );
    _requireSuccess(response, 'createIssue');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getIssues({
    String? filter,
    String? sort,
    int? createdBy,
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await _dio.get(
      _apiUrl('issue'),
      queryParameters: {
        'skip': offset,
        'take': limit,
        'filter': ?filter,
        'sort': ?sort,
        'createdBy': ?createdBy,
      },
      options: _authOptions(),
    );
    _requireSuccess(response, 'getIssues');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getIssueCount() async {
    final response = await _dio.get(
      _apiUrl('issue/count'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getIssueCount');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getIssue(int issueId) async {
    final response = await _dio.get(
      _apiUrl('issue/$issueId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getIssue');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> commentOnIssue(int issueId, String message) async {
    final response = await _dio.post(
      _apiUrl('issue/$issueId/comment'),
      data: {'message': message},
      options: _authJsonOptions(),
    );
    _requireSuccess(response, 'commentOnIssue');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> setIssueStatus(int issueId, String status) async {
    final response = await _dio.post(
      _apiUrl('issue/$issueId/$status'),
      options: _authJsonOptions(),
    );
    _requireSuccess(response, 'setIssueStatus');
    return response.data as Map<String, dynamic>;
  }

  Future<void> deleteIssue(int issueId) async {
    final response = await _dio.delete(
      _apiUrl('issue/$issueId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'deleteIssue');
  }

  Future<Map<String, dynamic>> getRequest(int requestId) async {
    final response = await _dio.get(
      _apiUrl('request/$requestId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getRequest');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> createRequest({
    required int mediaId,
    required String mediaType,
    List<int>? seasons,
    bool allSeasons = false,
    bool is4k = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
  }) async {
    final body = <String, dynamic>{
      'mediaId': mediaId,
      'mediaType': mediaType,
      'is4k': is4k,
      'profileId': ?profileId,
      'rootFolder': ?rootFolder,
      'serverId': ?serverId,
    };

    if (mediaType == 'tv') {
      if (allSeasons || seasons == null) {
        body['seasons'] = 'all';
      } else {
        body['seasons'] = seasons;
      }
    }

    final response = await _dio.post(
      _apiUrl('request'),
      data: body,
      options: _authJsonOptions(),
    );
    _throwIfRequestError(response);
    _requireSuccess(response, 'createRequest');
    return response.data as Map<String, dynamic>;
  }

  Future<void> deleteRequest(int requestId) async {
    final response = await _dio.delete(
      _apiUrl('request/$requestId'),
      options: _authOptions(),
    );
    _throwIfRequestError(response);
    _requireSuccess(response, 'deleteRequest');
  }

  Future<void> approveRequest(int requestId) async {
    await _postRequestAction(
      requestId,
      action: 'approve',
      opName: 'approveRequest',
    );
  }

  Future<void> declineRequest(int requestId) async {
    await _postRequestAction(
      requestId,
      action: 'decline',
      opName: 'declineRequest',
    );
  }

  Future<void> retryRequest(int requestId) async {
    await _postRequestAction(
      requestId,
      action: 'retry',
      opName: 'retryRequest',
    );
  }

  Future<void> _postRequestAction(
    int requestId, {
    required String action,
    required String opName,
  }) async {
    final endpoint = 'request/$requestId/$action';
    final response = await _dio.post(
      _apiUrl(endpoint),
      options: _authJsonOptions(),
    );
    _throwIfRequestError(response);
    _requireSuccess(response, opName);
  }

  Future<Map<String, dynamic>> getRecentlyAdded({int take = 20}) async {
    final response = await _dio.get(
      _apiUrl('media'),
      queryParameters: {'filter': 'allavailable', 'sort': 'mediaAdded', 'take': take},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getRecentlyAdded');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTrending({int limit = 20, int offset = 0}) async {
    final page = (offset ~/ limit) + 1;
    final response = await _dio.get(
      _apiUrl('discover/trending'),
      queryParameters: {'page': page, 'language': 'en'},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTrending');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTrendingMovies({int limit = 20, int offset = 0}) async {
    final page = (offset ~/ limit) + 1;
    final response = await _dio.get(
      _apiUrl('discover/movies'),
      queryParameters: {'page': page, 'language': 'en'},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTrendingMovies');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTrendingTv({int limit = 20, int offset = 0}) async {
    final page = (offset ~/ limit) + 1;
    final response = await _dio.get(
      _apiUrl('discover/tv'),
      queryParameters: {'page': page, 'language': 'en'},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTrendingTv');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTopMovies({int limit = 20, int offset = 0}) async {
    final response = await _dio.get(
      _apiUrl('discover/movies/top'),
      queryParameters: {'limit': limit, 'offset': offset},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTopMovies');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTopTv({int limit = 20, int offset = 0}) async {
    final response = await _dio.get(
      _apiUrl('discover/tv/top'),
      queryParameters: {'limit': limit, 'offset': offset},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTopTv');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final response = await _dio.get(
      _apiUrl('discover/movies/upcoming'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getUpcomingMovies');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getUpcomingTv() async {
    final response = await _dio.get(
      _apiUrl('discover/tv/upcoming'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getUpcomingTv');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> discoverMovies({
    int page = 1,
    String sortBy = 'popularity.desc',
    int? genre,
    int? studio,
    int? keywords,
    String language = 'en',
  }) async {
    final response = await _dio.get(
      _apiUrl('discover/movies'),
      queryParameters: {
        'page': page,
        'sortBy': sortBy,
        'language': language,
        'genre': ?genre,
        'studio': ?studio,
        'keywords': ?keywords,
      },
      options: _authOptions(),
    );
    _requireSuccess(response, 'discoverMovies');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> discoverTv({
    int page = 1,
    String sortBy = 'popularity.desc',
    int? genre,
    int? network,
    int? keywords,
    String language = 'en',
  }) async {
    final response = await _dio.get(
      _apiUrl('discover/tv'),
      queryParameters: {
        'page': page,
        'sortBy': sortBy,
        'language': language,
        'genre': ?genre,
        'network': ?network,
        'keywords': ?keywords,
      },
      options: _authOptions(),
    );
    _requireSuccess(response, 'discoverTv');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> search(
    String query, {
    String? mediaType,
    int limit = 20,
    int offset = 0,
  }) async {
    final page = (offset ~/ limit) + 1;
    final eq = Uri.encodeComponent(query);
    var url = '${_apiUrl('search')}?query=$eq&page=$page';
    if (mediaType != null) {
      url += '&type=${Uri.encodeComponent(mediaType)}';
    }
    final response = await _dio.get(
      url,
      options: _authOptions(),
    );
    _requireSuccess(response, 'search');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getMovieDetails(int tmdbId) async {
    final response = await _dio.get(
      _apiUrl('movie/$tmdbId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getMovieDetails');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTvDetails(int tmdbId) async {
    final response = await _dio.get(
      _apiUrl('tv/$tmdbId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTvDetails');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTvDetailsByTvdb(int tvdbId) async {
    final response = await _dio.get(
      _apiUrl('tv/tvdb/$tvdbId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTvDetailsByTvdb');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getSimilarMovies(int tmdbId, {int page = 1}) async {
    final response = await _dio.get(
      _apiUrl('movie/$tmdbId/similar'),
      queryParameters: {'page': page},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getSimilarMovies');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getSimilarTv(int tmdbId, {int page = 1}) async {
    final response = await _dio.get(
      _apiUrl('tv/$tmdbId/similar'),
      queryParameters: {'page': page},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getSimilarTv');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getMovieRecommendations(int tmdbId, {int page = 1}) async {
    final response = await _dio.get(
      _apiUrl('movie/$tmdbId/recommendations'),
      queryParameters: {'page': page},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getMovieRecommendations');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getTvRecommendations(int tmdbId, {int page = 1}) async {
    final response = await _dio.get(
      _apiUrl('tv/$tmdbId/recommendations'),
      queryParameters: {'page': page},
      options: _authOptions(),
    );
    _requireSuccess(response, 'getTvRecommendations');
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getGenreSliderMovies() async {
    final response = await _dio.get(
      _apiUrl('discover/genreslider/movie'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getGenreSliderMovies');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getGenreSliderTv() async {
    final response = await _dio.get(
      _apiUrl('discover/genreslider/tv'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getGenreSliderTv');
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> getPersonDetails(int personId) async {
    final response = await _dio.get(
      _apiUrl('person/$personId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getPersonDetails');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getPersonCombinedCredits(int personId) async {
    final response = await _dio.get(
      _apiUrl('person/$personId/combined_credits'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getPersonCombinedCredits');
    return response.data as Map<String, dynamic>;
  }

  Future<SeerrStatus> getStatus() async {
    final response = await _dio.get(
      _apiUrl('status'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getStatus');
    return SeerrStatus.fromJson(response.data as Map<String, dynamic>);
  }

  Future<bool> testConnection() async {
    try {
      final response = await _dio.get(
        _apiUrl('status'),
        options: _authOptions(),
      );
      return response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300;
    } catch (_) {
      return false;
    }
  }

  Future<List<dynamic>> getRadarrServers() async {
    final response = await _dio.get(
      _apiUrl('service/radarr'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getRadarrServers');
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> getRadarrServerDetails(int serverId) async {
    final response = await _dio.get(
      _apiUrl('service/radarr/$serverId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getRadarrServerDetails');
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getSonarrServers() async {
    final response = await _dio.get(
      _apiUrl('service/sonarr'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getSonarrServers');
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> getSonarrServerDetails(int serverId) async {
    final response = await _dio.get(
      _apiUrl('service/sonarr/$serverId'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getSonarrServerDetails');
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getRadarrSettings() async {
    final response = await _dio.get(
      _apiUrl('settings/radarr'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getRadarrSettings');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getSonarrSettings() async {
    final response = await _dio.get(
      _apiUrl('settings/sonarr'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getSonarrSettings');
    return response.data as List<dynamic>;
  }

  Future<MoonfinStatusResponse> getMoonfinStatus() async {
    final response = await _dio.get(
      _moonfinUrl('Status'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'getMoonfinStatus');
    return MoonfinStatusResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<MoonfinLoginResponse> moonfinLogin({
    required String username,
    required String password,
    String authType = 'jellyfin',
  }) async {
    final response = await _dio.post(
      _moonfinUrl('Login'),
      data: MoonfinLoginRequest(
        username: username,
        password: password,
        authType: authType,
      ).toJson(),
      options: _authJsonOptions(),
    );
    _requireSuccess(response, 'moonfinLogin');
    final result = MoonfinLoginResponse.fromJson(response.data as Map<String, dynamic>);
    if (!result.success) {
      throw Exception(result.error ?? 'Moonfin login failed');
    }
    return result;
  }

  Future<void> moonfinLogout() async {
    final response = await _dio.delete(
      _moonfinUrl('Logout'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'moonfinLogout');
  }

  Future<MoonfinValidateResponse> moonfinValidate() async {
    final response = await _dio.get(
      _moonfinUrl('Validate'),
      options: _authOptions(),
    );
    _requireSuccess(response, 'moonfinValidate');
    return MoonfinValidateResponse.fromJson(response.data as Map<String, dynamic>);
  }

  void close() {
    _dio.close();
  }
}

class _ProxyUnwrapInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final path = response.requestOptions.path;
    if (!path.contains('/Moonfin/Seerr/Api/')) {
      return handler.next(response);
    }

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      return handler.next(response);
    }

    final fileContents = data['FileContents'] as String?;
    if (fileContents == null) {
      return handler.next(response);
    }

    try {
      final decoded = utf8.decode(base64Decode(fileContents));
      final parsed = jsonDecode(decoded);
      response.data = parsed;
    } catch (e) {
      debugPrint('[Seerr] Failed to unwrap proxy envelope: $e');
    }

    handler.next(response);
  }
}
