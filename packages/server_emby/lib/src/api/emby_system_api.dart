import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbySystemApi implements SystemApi {
  final Dio _dio;

  EmbySystemApi(this._dio);

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
      // Only the status matters, and a proxy can label the plain text body
      // as json, which would fail to decode.
      final response = await _dio.get(
        '/System/Ping',
        options: Options(
          responseType: ResponseType.plain,
          receiveTimeout: SystemApi.pingTimeout,
        ),
      );
      return response.statusCode == 200;
    } catch (e) {
      // Emby turns down a ping from outside its own network when it carries
      // no valid token, and that refusal still came from the server.
      return pingAnsweredDespite(e);
    }
  }
}
