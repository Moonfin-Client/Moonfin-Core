import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import 'moonbase_endpoint.dart';
import 'plugin_sync_service.dart' show pluginRequestOptions;

/// What takes [client]'s diagnostic and crash reports. Plex and Silo have no
/// client log endpoint of their own, so theirs go to Moonbase.
ClientLogApi? clientLogApiOf(MediaServerClient client) =>
    client.clientLogApi ??
    (client.features.supportsMoonfinPlugin
        ? MoonbaseClientLogApi(client)
        : null);

/// Posts reports to Moonbase's `/Moonfin/ClientLog/Document`, which writes them
/// to Moonbase's log. Moonbase only takes them when its ping says
/// `clientLogSupported`, so callers check `PluginSyncService.clientLogSupported`
/// first.
class MoonbaseClientLogApi implements ClientLogApi {
  MoonbaseClientLogApi(this._client, {@visibleForTesting Dio? dio})
    : _dio = dio ?? _uploadDio;

  final MediaServerClient _client;
  final Dio _dio;

  @override
  Future<String?> uploadDocument(String content) async {
    final ep = await moonbaseEndpoint(_client, _dio);
    if (ep == null) throw StateError('Moonbase could not be reached.');
    final response = await _dio.post(
      '${ep.base}/Moonfin/ClientLog/Document',
      data: content,
      options: Options(
        headers: ep.headers,
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

final Dio _uploadDio = () {
  final dio = Dio(pluginRequestOptions());
  configureServerDio(dio);
  dio.interceptors.add(redirectInterceptor(dio));
  return dio;
}();
