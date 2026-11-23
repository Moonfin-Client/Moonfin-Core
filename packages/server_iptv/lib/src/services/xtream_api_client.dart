import 'package:dio/dio.dart';

import '../models/xtream_models.dart';

class XtreamApiClient {
  final XtreamCredentials credentials;
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  XtreamApiClient({required this.credentials});

  Future<dynamic> _get([
    String? action,
    Map<String, String> extra = const {},
  ]) async {
    final response = await _dio.get(
      credentials.baseUrl,
      queryParameters: {
        'username': credentials.username,
        'password': credentials.password,
        'action': ?action,
        ...extra,
      },
    );
    return response.data;
  }

  /// Whether the panel accepts these credentials. Panels that turn an account
  /// away often answer with text or an empty list instead of user info.
  Future<bool> signIn() async {
    final userInfo = _map(await _get())['user_info'];
    return userInfo is Map && '${userInfo['auth']}' == '1';
  }

  /// The panel reports its local time and the Unix time together, and the
  /// gap between them is its offset from UTC, rounded to the quarter hour
  /// since the two can be read a second apart.
  Future<Duration?> serverUtcOffset() async {
    final info = _map(await _get())['server_info'];
    if (info is! Map) return null;
    final local = DateTime.tryParse('${info['time_now']}Z');
    final unix = int.tryParse('${info['timestamp_now']}');
    if (local == null || unix == null) return null;
    final minutes = (local.millisecondsSinceEpoch ~/ 1000 - unix) / 60;
    return Duration(minutes: (minutes / 15).round() * 15);
  }

  Future<List<XtreamCategory>> getLiveCategories() async =>
      _list(await _get('get_live_categories'), XtreamCategory.fromJson);

  Future<List<XtreamStream>> getLiveStreams() async =>
      _list(await _get('get_live_streams'), XtreamStream.fromJson);

  Future<List<XtreamStream>> getVodStreams() async =>
      _list(await _get('get_vod_streams'), XtreamStream.fromJson);

  Future<List<XtreamStream>> getSeries() async =>
      _list(await _get('get_series'), XtreamStream.fromJson);

  Future<Map<String, dynamic>> getSeriesInfo(int seriesId) async =>
      _map(await _get('get_series_info', {'series_id': '$seriesId'}));

  Future<Map<String, dynamic>> getVodInfo(int vodId) async =>
      _map(await _get('get_vod_info', {'vod_id': '$vodId'}));

  String xmltvUrl() {
    return '${credentials.normalizedUrl}/xmltv.php?username=${Uri.encodeComponent(credentials.username)}&password=${Uri.encodeComponent(credentials.password)}';
  }

  static Map<String, dynamic> _map(dynamic data) =>
      data is Map<String, dynamic> ? data : const {};

  // One odd entry shouldn't sink the whole list.
  static List<T> _list<T>(
    dynamic data,
    T Function(Map<String, dynamic>) parse,
  ) => [
    if (data is List)
      for (final entry in data)
        if (entry is Map<String, dynamic>) parse(entry),
  ];
}
