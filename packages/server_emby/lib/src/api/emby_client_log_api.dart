import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// Emby has no client log endpoint, so reports go to the Moonfin plugin, which
/// writes them into the server's log folder. The route is only there when the
/// plugin is, so callers check `PluginSyncService.clientLogSupported` first.
class EmbyClientLogApi implements ClientLogApi {
  final Dio _dio;

  EmbyClientLogApi(this._dio);

  @override
  Future<String?> uploadDocument(String content) async {
    final response = await _dio.post(
      '/Moonfin/ClientLog/Document',
      data: content,
      options: Options(
        contentType: 'text/plain; charset=utf-8',
        responseType: ResponseType.json,
      ),
    );
    final data = response.data;
    if (data is Map && data['FileName'] != null) {
      return data['FileName'].toString();
    }
    return null;
  }
}
