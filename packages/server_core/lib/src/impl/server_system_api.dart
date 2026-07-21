import 'package:dio/dio.dart';

import '../api/system_api.dart';

/// Shared system implementation; the endpoints are identical on Jellyfin
/// and Emby.
class ServerSystemApi implements SystemApi {
  final Dio _dio;

  ServerSystemApi(this._dio);

  @override
  Future<Map<String, dynamic>> getPublicSystemInfo() async {
    final response = await _dio.get('/System/Info/Public');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getSystemInfo() async {
    final response = await _dio.get('/System/Info');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<bool> ping() async {
    try {
      final response = await _dio.get('/System/Ping');
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
