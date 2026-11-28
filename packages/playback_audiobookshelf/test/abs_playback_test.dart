import 'package:playback_audiobookshelf/playback_audiobookshelf.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

class _FakePlaybackApi implements PlaybackApi {
  _FakePlaybackApi(this.info);

  final Map<String, dynamic> info;
  Map<String, dynamic>? request;
  bool? committed;
  final reports = <(String, Map<String, dynamic>)>[];

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    request = requestBody;
    committed = waitForMediaProbe;
    return info;
  }

  @override
  Future<void> reportPlaybackStart(Map<String, dynamic> info) async =>
      reports.add(('start', info));

  @override
  Future<void> reportPlaybackProgress(Map<String, dynamic> info) async =>
      reports.add(('progress', info));

  @override
  Future<void> reportPlaybackStopped(Map<String, dynamic> info) async =>
      reports.add(('stop', info));

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.playbackApi);

  @override
  final _FakePlaybackApi playbackApi;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Map<String, dynamic> _info({required bool directPlay}) => {
  'PlaySessionId': 'session-1',
  'MediaSources': [
    {
      'Id': 'book-1',
      'Container': directPlay ? 'm4b' : 'aac',
      'Path': directPlay ? 'http://abs/api/items/book-1/file/9?token=t' : null,
      'TranscodingUrl': directPlay ? null : 'http://abs/hls/session-1/output.m3u8',
      'SupportsDirectPlay': directPlay,
      'MediaStreams': [
        {'Type': 'Audio', 'Index': 0, 'Codec': 'aac'},
      ],
    },
  ],
};

void main() {
  test('a single file plays its file directly and commits to playing', () async {
    final api = _FakePlaybackApi(_info(directPlay: true));
    final result = await AbsMediaStreamResolver(_FakeClient(api)).resolve(
      {'Id': 'book-1'},
      deviceProfile: {'DirectPlayProfiles': []},
    );

    expect(result.streamUrl, 'http://abs/api/items/book-1/file/9?token=t');
    expect(result.playMethod, StreamPlayMethod.directPlay);
    expect(result.playSessionId, 'session-1');
    expect(result.mediaType, 'Audio');
    expect(api.committed, isTrue);
    expect(api.request, {'DeviceProfile': {'DirectPlayProfiles': []}});
  });

  test('a book in several files plays the HLS stream', () async {
    final api = _FakePlaybackApi(_info(directPlay: false));
    final result = await AbsMediaStreamResolver(_FakeClient(api)).resolve(
      {'Id': 'book-1'},
    );

    expect(result.streamUrl, 'http://abs/hls/session-1/output.m3u8');
    expect(result.playMethod, StreamPlayMethod.transcode);
  });

  test('no stream is an error instead of a blank player', () async {
    final api = _FakePlaybackApi({'MediaSources': []});
    expect(
      () => AbsMediaStreamResolver(_FakeClient(api)).resolve({'Id': 'book-1'}),
      throwsStateError,
    );
  });

  test('reports carry the session and positions in ticks', () async {
    final api = _FakePlaybackApi(_info(directPlay: true));
    final client = _FakeClient(api);
    final resolution = await AbsMediaStreamResolver(client).resolve(
      {'Id': 'book-1', 'RunTimeTicks': 6000000000},
    );
    final service = AbsPlaySessionService(client);
    const item = {'Id': 'book-1', 'RunTimeTicks': 6000000000};

    await service.onPlaybackProgress(
      item,
      resolution,
      const Duration(seconds: 30),
      isPaused: true,
    );
    await service.onPlaybackStop(item, resolution, const Duration(seconds: 31));

    expect(api.reports.first.$2, {
      'ItemId': 'book-1',
      'PlaySessionId': 'session-1',
      'PositionTicks': 300000000,
      'IsPaused': true,
      'RunTimeTicks': 6000000000,
    });
    expect(api.reports.last.$1, 'stop');
    expect(api.reports.last.$2['PositionTicks'], 310000000);
  });
}
