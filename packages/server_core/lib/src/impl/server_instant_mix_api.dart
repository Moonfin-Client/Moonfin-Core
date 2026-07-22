import 'package:dio/dio.dart';

import '../api/instant_mix_api.dart';

/// Shared instant-mix implementation; the endpoint is identical on Jellyfin
/// and Emby.
class ServerInstantMixApi implements InstantMixApi {
  final Dio _dio;

  ServerInstantMixApi(this._dio);

  @override
  Future<Map<String, dynamic>> getInstantMix(
    String itemId, {
    int? limit,
  }) async {
    final response =
        await _dio.get('/Items/$itemId/InstantMix', queryParameters: {
      'Limit': ?limit,
    });
    return response.data as Map<String, dynamic>;
  }
}
