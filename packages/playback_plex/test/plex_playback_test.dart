import 'package:playback_core/playback_core.dart';
import 'package:playback_plex/playback_plex.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

class _FakePlaybackApi implements PlaybackApi {
  _FakePlaybackApi(this.info);

  final Map<String, dynamic> info;
  Map<String, dynamic>? request;
  final reports = <(String, Map<String, dynamic>)>[];
  String? stoppedSession;

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    request = requestBody;
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
  Future<void> stopActiveEncodings({
    required String deviceId,
    String? playSessionId,
  }) async => stoppedSession = playSessionId;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.playbackApi);

  @override
  final _FakePlaybackApi playbackApi;

  @override
  String get baseUrl => 'http://plex:32400';

  @override
  String? get accessToken => 'tok';

  @override
  DeviceInfo get deviceInfo =>
      const DeviceInfo(id: 'device', name: 'Test', appName: 'Moonfin', appVersion: '1');

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Map<String, dynamic> _info({required bool directPlay}) => {
  'PlaySessionId': 'session',
  'MediaSources': [
    {
      'Id': '3720',
      'Container': 'mkv',
      'Bitrate': 9536000,
      'Path': '/library/parts/3720/1/file.mkv',
      'SupportsDirectPlay': directPlay,
      'SupportsTranscoding': !directPlay,
      if (!directPlay) ...{
        'TranscodingUrl': '/video/:/transcode/universal/start.m3u8?session=session',
        'TranscodeReasons': ['App cannot direct play this item.'],
      },
      'DefaultAudioStreamIndex': 1,
      'DefaultSubtitleStreamIndex': -1,
      'MediaStreams': [
        {'Index': 0, 'Type': 'Video', 'Codec': 'h264'},
        {'Index': 1, 'Type': 'Audio', 'Codec': 'eac3'},
        {
          'Index': 9001,
          'Type': 'Subtitle',
          'Codec': 'srt',
          'IsExternal': true,
          'DeliveryUrl': '/library/streams/9001',
        },
      ],
    },
  ],
};

void main() {
  test('a direct play streams the file part with the token', () async {
    final api = _FakePlaybackApi(_info(directPlay: true));

    final result = await PlexMediaStreamResolver(_FakeClient(api)).resolve(
      {'Id': '1715'},
      maxStreamingBitrate: 120000000,
      subtitleStreamIndex: -1,
    );

    expect(api.request?['MaxStreamingBitrate'], 120000000);
    expect(api.request?['SubtitleStreamIndex'], -1);
    expect(result.playMethod, StreamPlayMethod.directPlay);
    expect(
      result.streamUrl,
      'http://plex:32400/library/parts/3720/1/file.mkv?X-Plex-Token=tok',
    );
    expect(result.mediaSourceId, '3720');
    expect(result.playSessionId, 'session');
    expect(result.container, 'mkv');
    expect(result.selectedAudioStreamIndex, 1);
    expect(result.selectedSubtitleStreamIndex, -1);
    expect(result.externalSubtitles.single.deliveryUrl,
        'http://plex:32400/library/streams/9001?X-Plex-Token=tok');
    expect(result.liveStreamId, isNull);
  });

  test('a transcode streams the HLS start URL with the token added', () async {
    final api = _FakePlaybackApi(_info(directPlay: false));

    final result = await PlexMediaStreamResolver(
      _FakeClient(api),
    ).resolve({'Id': '1715'}, enableDirectPlay: false);

    expect(api.request?['EnableDirectPlay'], isFalse);
    expect(result.playMethod, StreamPlayMethod.transcode);
    expect(
      result.streamUrl,
      'http://plex:32400/video/:/transcode/universal/start.m3u8'
      '?session=session&X-Plex-Token=tok',
    );
    expect(result.container, 'ts');
    expect(result.transcodingReasons, ['App cannot direct play this item.']);
  });

  test('the session reports carry the runtime Plex needs', () async {
    final api = _FakePlaybackApi(_info(directPlay: false));
    final service = PlexPlaySessionService(_FakeClient(api));
    final item = {'Id': '1715', 'RunTimeTicks': 62139160000};
    const resolution = StreamResolutionResult(
      streamUrl: 'u',
      mediaSourceId: '3720',
      playSessionId: 'session',
      playMethod: StreamPlayMethod.transcode,
    );

    await service.onPlaybackStart(item, resolution, positionTicks: 600000000);
    await service.onPlaybackProgress(
      item,
      resolution,
      const Duration(minutes: 2),
      isPaused: true,
    );
    await service.onPlaybackStop(item, resolution, const Duration(minutes: 3));
    await service.stopTranscoding(resolution);

    expect(api.reports.map((r) => r.$1), ['start', 'progress', 'stop']);
    expect(api.reports.map((r) => r.$2['PositionTicks']), [
      600000000,
      1200000000,
      1800000000,
    ]);
    expect(api.reports[1].$2['IsPaused'], isTrue);
    expect(
      api.reports.every((r) => r.$2['RunTimeTicks'] == 62139160000),
      isTrue,
    );
    expect(api.stoppedSession, 'session');
  });
}
