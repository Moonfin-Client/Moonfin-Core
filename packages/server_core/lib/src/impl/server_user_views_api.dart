import 'package:dio/dio.dart';

import '../api/user_views_api.dart';
import '../server_dialect.dart';

class ServerUserViewsApi implements UserViewsApi {
  final Dio _dio;
  final ServerDialect _dialect;
  final String Function() _getUserId;
  Map<String, dynamic>? _cached;
  DateTime? _cachedAt;
  static const _cacheDuration = Duration(minutes: 5);

  ServerUserViewsApi(this._dio, this._dialect, this._getUserId);

  @override
  Future<Map<String, dynamic>> getUserViews() async {
    if (_cached != null &&
        _cachedAt != null &&
        DateTime.now().difference(_cachedAt!) < _cacheDuration) {
      return _cached!;
    }
    final response = await _dio.get(_dialect.userViewsPath(_getUserId()));
    _cached = response.data as Map<String, dynamic>;
    _cachedAt = DateTime.now();
    return _cached!;
  }

  void invalidateCache() {
    _cached = null;
    _cachedAt = null;
  }
}
