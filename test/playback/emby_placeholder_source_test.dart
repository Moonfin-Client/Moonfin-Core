import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_emby/playback_emby.dart';
import 'package:server_core/server_core.dart';

const _placeholderId = '3';
const _probedId = '12:1:0:3507857533895181475';
const _remotePath = 'http://192.168.100.50:8115/s/abc';

Map<String, dynamic> _placeholder() => <String, dynamic>{
      'Id': _placeholderId,
      'Protocol': 'Http',
      'IsRemote': true,
      'Path': _remotePath,
      'Container': 'mkv',
      'SupportsDirectPlay': false,
      'SupportsDirectStream': false,
      'SupportsTranscoding': true,
      'TranscodingUrl': '/videos/620157/master.m3u8?MediaSourceId=3',
      'MediaStreams': <Map<String, dynamic>>[],
    };

Map<String, dynamic> _probed() => <String, dynamic>{
      'Id': _probedId,
      'Protocol': 'Http',
      'IsRemote': true,
      'Path': _remotePath,
      'Container': 'mkv',
      'SupportsDirectPlay': true,
      'SupportsDirectStream': true,
      'SupportsTranscoding': true,
      'MediaStreams': <Map<String, dynamic>>[
        <String, dynamic>{'Type': 'Video', 'Codec': 'h264', 'Index': 0},
        <String, dynamic>{'Type': 'Audio', 'Codec': 'aac', 'Index': 1},
      ],
    };

/// Answers the way Emby does for a channel item: the placeholder alone when
/// it is asked for by id, the probed source ahead of it otherwise.
class _ChannelPlaybackApi extends Fake implements PlaybackApi {
  _ChannelPlaybackApi({this.probes = true});

  final bool probes;
  final List<String?> requestedSourceIds = [];

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    final sourceId = requestBody?['MediaSourceId'] as String?;
    requestedSourceIds.add(sourceId);
    return <String, dynamic>{
      'PlaySessionId': 'ps1',
      'MediaSources': <Map<String, dynamic>>[
        if (sourceId == null && probes) _probed(),
        if (sourceId == null || sourceId == _placeholderId) _placeholder(),
        if (sourceId == _probedId) _probed(),
      ],
    };
  }

  @override
  String getStreamUrl(
    String itemId, {
    String? mediaSourceId,
    String? audioStreamIndex,
    String? subtitleStreamIndex,
    String? liveStreamId,
  }) =>
      'https://server/Videos/$itemId/stream?MediaSourceId=$mediaSourceId';
}

class _FakeClient extends Fake implements MediaServerClient {
  _FakeClient(this.playbackApi);

  @override
  final PlaybackApi playbackApi;
  @override
  String get baseUrl => 'http://192.168.100.50:8096';
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
  group('EmbyMediaStreamResolver.resolve with a channel placeholder source',
      () {
    test('leaves the placeholder id off and plays the probed source',
        () async {
      final api = _ChannelPlaybackApi();
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        <String, dynamic>{
          'Id': '620157',
          'Type': 'Movie',
          'MediaSources': [
            {'Id': _placeholderId, 'MediaStreams': <dynamic>[]},
          ],
        },
        mediaSourceId: _placeholderId,
      );

      expect(api.requestedSourceIds, [null]);
      expect(result.mediaSourceId, _probedId);
      expect(result.playMethod, StreamPlayMethod.directPlay);
      expect(result.streamUrl, _remotePath);
      expect(result.mediaStreams, hasLength(2));
    });

    test('asks again without the id when the item came without its sources',
        () async {
      final api = _ChannelPlaybackApi();
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        <String, dynamic>{'Id': '620157', 'Type': 'Movie'},
        mediaSourceId: _placeholderId,
      );

      expect(api.requestedSourceIds, [_placeholderId, null]);
      expect(result.mediaSourceId, _probedId);
      expect(result.playMethod, StreamPlayMethod.directPlay);
    });

    test('keeps the placeholder when the server has nothing better', () async {
      final api = _ChannelPlaybackApi(probes: false);
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        <String, dynamic>{'Id': '620157', 'Type': 'Movie'},
        mediaSourceId: _placeholderId,
      );

      expect(result.mediaSourceId, _placeholderId);
      expect(result.playMethod, StreamPlayMethod.transcode);
    });

    test('keeps a picked version of an item that has other versions',
        () async {
      final api = _ChannelPlaybackApi();
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        <String, dynamic>{
          'Id': '620157',
          'Type': 'Movie',
          'MediaSources': [
            {
              'Id': _probedId,
              'MediaStreams': [
                {'Type': 'Video'},
              ],
            },
            {'Id': _placeholderId, 'MediaStreams': <dynamic>[]},
          ],
        },
        mediaSourceId: _placeholderId,
      );

      expect(api.requestedSourceIds, [_placeholderId]);
      expect(result.mediaSourceId, _placeholderId);
    });

    test('still sends a picked version that lists its streams', () async {
      final api = _ChannelPlaybackApi();
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        <String, dynamic>{
          'Id': '620157',
          'Type': 'Movie',
          'MediaSources': [
            {
              'Id': _probedId,
              'MediaStreams': [
                {'Type': 'Video'},
              ],
            },
          ],
        },
        mediaSourceId: _probedId,
      );

      expect(api.requestedSourceIds, [_probedId]);
      expect(result.mediaSourceId, _probedId);
    });
  });
}
