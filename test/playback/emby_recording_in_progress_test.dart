import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_emby/playback_emby.dart';
import 'package:server_core/server_core.dart';

const _timerId = '254d0f02e3f94794b8d62380758983ff';

/// Answers the way Emby does for a recording it's still writing: a source
/// named after the timer, direct streamed from the growing file.
class _RecordingPlaybackApi extends Fake implements PlaybackApi {
  _RecordingPlaybackApi({required this.videoCodec});

  final String videoCodec;
  final List<String?> requestedSourceIds = [];

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    requestedSourceIds.add(requestBody?['MediaSourceId'] as String?);
    return <String, dynamic>{
      'PlaySessionId': 'ps1',
      'MediaSources': [
        <String, dynamic>{
          'Id': _timerId,
          'Protocol': 'File',
          'Container': 'mpegts',
          'IsInfiniteStream': true,
          'WallClockStart': '2026-11-28T12:51:14.0788679Z',
          'SupportsDirectPlay': false,
          'SupportsDirectStream': true,
          'SupportsTranscoding': true,
          'DirectStreamUrl':
              '/videos/106695/original.mpegts?MediaSourceId=$_timerId',
          'MediaStreams': [
            {'Type': 'Video', 'Codec': videoCodec, 'Index': 0},
            {'Type': 'Audio', 'Codec': 'aac', 'Index': 1},
          ],
        },
      ],
    };
  }
}

class _FakeClient extends Fake implements MediaServerClient {
  _FakeClient(this.playbackApi);

  @override
  final PlaybackApi playbackApi;
  @override
  String get baseUrl => 'http://emby:8096';
  @override
  String? get accessToken => 'token';
  @override
  String? get userId => 'u1';
}

Map<String, dynamic> _recording() => <String, dynamic>{
      'Id': '106695',
      'Type': 'Recording',
      'Status': 'InProgress',
      'StartDate': '2026-11-28T12:00:00.0000000Z',
      'EndDate': '2026-11-28T16:00:00.0000000Z',
      'MediaSources': [
        {'Id': 'mediasource_106695', 'MediaStreams': <dynamic>[]},
      ],
    };

void main() {
  group('EmbyMediaStreamResolver.resolve with a recording in progress', () {
    test('plays the recording buffer as HLS so it can seek', () async {
      final api = _RecordingPlaybackApi(videoCodec: 'h264');
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        _recording(),
        mediaSourceId: 'mediasource_106695',
      );

      expect(api.requestedSourceIds, [null]);
      expect(
        result.streamUrl,
        'http://emby:8096/LiveTv/LiveRecordings/$_timerId/hls/master.m3u8'
        '?api_key=token',
      );
      expect(result.playMethod, StreamPlayMethod.directStream);
      expect(
        result.declaredDuration,
        DateTime.utc(2026, 11, 28, 16)
            .difference(DateTime.utc(2026, 11, 28, 12, 51, 14, 78, 867)),
      );
    });

    test("keeps the direct stream for codecs HLS players can't take",
        () async {
      final api = _RecordingPlaybackApi(videoCodec: 'mpeg2video');
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(_recording());

      expect(result.streamUrl, contains('/original.mpegts'));
      expect(result.declaredDuration, isNull);
    });
  });
}
