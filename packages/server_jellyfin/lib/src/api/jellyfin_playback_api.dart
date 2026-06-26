import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinPlaybackApi implements PlaybackApi {
  final Dio _dio;
  final String _baseUrl;

  JellyfinPlaybackApi(this._dio, this._baseUrl);

  @override
  Future<void> reportPlaybackStart(Map<String, dynamic> info) async {
    await _dio.post('/Sessions/Playing', data: info);
  }

  @override
  Future<void> reportPlaybackProgress(Map<String, dynamic> info) async {
    await _dio.post('/Sessions/Playing/Progress', data: info);
  }

  @override
  Future<void> reportPlaybackStopped(Map<String, dynamic> info) async {
    await _dio.post('/Sessions/Playing/Stopped', data: info);
  }

  @override
  Future<void> closeLiveStream(String liveStreamId) async {
    await _dio.post(
      '/LiveStreams/Close',
      queryParameters: {'LiveStreamId': liveStreamId},
    );
  }

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
  }) async {
    final body = <String, dynamic>{
      'UserId': ?userId,
      ...?requestBody,
    };

    final audioStreamIndex = requestBody?['AudioStreamIndex'] ?? requestBody?['audioStreamIndex'];
    final subtitleStreamIndex = requestBody?['SubtitleStreamIndex'] ?? requestBody?['subtitleStreamIndex'];
    final mediaSourceId = requestBody?['MediaSourceId'] ?? requestBody?['mediaSourceId'];
    final maxStreamingBitrate = requestBody?['MaxStreamingBitrate'] ?? requestBody?['maxStreamingBitrate'];

    final query = <String, dynamic>{
      'userId': ?userId,
      'startTimeTicks': ?startTimeTicks,
      'audioStreamIndex': ?audioStreamIndex?.toString(),
      'subtitleStreamIndex': ?subtitleStreamIndex?.toString(),
      'mediaSourceId': ?mediaSourceId,
      'maxStreamingBitrate': ?maxStreamingBitrate?.toString(),
    };

    try {
      final response = await _dio.post(
        '/Items/$itemId/PlaybackInfo',
        data: body,
        queryParameters: query,
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode != 500) rethrow;
      try {
        final retry = await _dio.post(
          '/Items/$itemId/PlaybackInfo',
          data: <String, dynamic>{'UserId': ?userId},
          queryParameters: query,
        );
        return retry.data as Map<String, dynamic>;
      } on DioException catch (e2) {
        throw Exception(
          'PlaybackInfo failed for item $itemId: '
          'HTTP ${e2.response?.statusCode} ${e2.response?.data}',
        );
      }
    }
  }

  @override
  String getStreamUrl(
    String itemId, {
    String? mediaSourceId,
    String? audioStreamIndex,
    String? subtitleStreamIndex,
    String? liveStreamId,
  }) {
    final params = <String, String>{
      'MediaSourceId': ?mediaSourceId,
      'AudioStreamIndex': ?audioStreamIndex,
      'SubtitleStreamIndex': ?subtitleStreamIndex,
      'LiveStreamId': ?liveStreamId,
      'Static': 'true',
    };
    final query = params.entries.map((e) => '${e.key}=${e.value}').join('&');
    return '$_baseUrl/Videos/$itemId/stream?$query';
  }
}
