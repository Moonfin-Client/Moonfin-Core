import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinSystemApi implements SystemApi {
  final Dio _dio;

  JellyfinSystemApi(this._dio);

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
      // The body is only ever thrown away, and Jellyfin answers with the bare
      // text `Jellyfin Server` under a json content type, which the default
      // transformer would fail to decode.
      final response = await _dio.get(
        '/System/Ping',
        options: Options(responseType: ResponseType.plain),
      );
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
