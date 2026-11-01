import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:server_core/server_core.dart';

/// Answers like Jellyfin does for a recording that is still being written:
/// its playback source is the active recording, under an id of its own, so a
/// request pinned to the item's file source matches nothing.
class _RecordingPlaybackApi extends Fake implements PlaybackApi {
  final List<String?> requestedSourceIds = [];

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    final pinned = requestBody?['MediaSourceId'] as String?;
    requestedSourceIds.add(pinned);
    if (pinned != null && pinned != 'active') {
      return {
        'MediaSources': <Map<String, dynamic>>[],
        'ErrorCode': 'NoCompatibleStream',
      };
    }
    return {
      'PlaySessionId': 'ps1',
      'MediaSources': [
        {
          'Id': 'active',
          'Container': 'ts',
          'IsInfiniteStream': true,
          'SupportsDirectPlay': false,
          'SupportsDirectStream': true,
          'SupportsTranscoding': true,
          'TranscodingUrl': '/videos/$itemId/master.m3u8?MediaSourceId=active',
          'MediaStreams': [
            {'Type': 'Video', 'Codec': 'h264', 'Index': 0},
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
  String get baseUrl => 'https://server';
  @override
  String? get accessToken => 'token';
  @override
  String? get userId => 'u1';
  @override
  DeviceInfo get deviceInfo => const DeviceInfo(
    id: 'd',
    name: 'test',
    appName: 'Moonfin',
    appVersion: '1',
  );
}

void main() {
  test(
    'a recording still being written plays the server\'s active source',
    () async {
      final api = _RecordingPlaybackApi();
      final resolver = JellyfinMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(<String, dynamic>{
        'Id': 'rec1',
        'Type': 'Episode',
        'MediaSources': [
          {'Id': 'rec1'},
        ],
      }, mediaSourceId: 'rec1');

      expect(api.requestedSourceIds, ['rec1', null]);
      expect(result.mediaSourceId, 'active');
      expect(result.playMethod, isNot(StreamPlayMethod.directPlay));
    },
  );

}
