import 'package:dio/dio.dart';

import '../api/display_preferences_api.dart';
import '../models/system_models.dart';
import '../server_dialect.dart';

class ServerDisplayPreferencesApi implements DisplayPreferencesApi {
  final Dio _dio;
  final ServerDialect _dialect;
  final Map<String, _CacheEntry> _cache = {};
  static const _cacheDuration = Duration(minutes: 5);

  ServerDisplayPreferencesApi(this._dio, this._dialect);

  String _client(String? client) => client ?? _dialect.displayPrefsClient;

  @override
  Future<DisplayPreferences> getDisplayPreferences(
    String id, {
    String? client,
  }) async {
    final cacheKey = '$id:${_client(client)}';
    final entry = _cache[cacheKey];
    if (entry != null &&
        DateTime.now().difference(entry.cachedAt) < _cacheDuration) {
      return entry.prefs;
    }

    final response = await _dio.get(
      '/DisplayPreferences/$id',
      queryParameters: {'client': _client(client)},
    );
    final prefs =
        DisplayPreferences.fromJson(response.data as Map<String, dynamic>);
    _cache[cacheKey] = _CacheEntry(prefs, DateTime.now());
    return prefs;
  }

  @override
  Future<void> saveDisplayPreferences(
    String id,
    DisplayPreferences prefs, {
    String? client,
  }) async {
    await _dio.post(
      '/DisplayPreferences/$id',
      data: prefs.toJson(),
      queryParameters: {'client': _client(client)},
    );
    _cache['$id:${_client(client)}'] = _CacheEntry(prefs, DateTime.now());
  }

  void invalidateCache() => _cache.clear();
}

class _CacheEntry {
  final DisplayPreferences prefs;
  final DateTime cachedAt;
  _CacheEntry(this.prefs, this.cachedAt);
}
