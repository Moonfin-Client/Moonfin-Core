import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:server_core/server_core.dart';

Map<String, dynamic> _appleStyleProfile() => <String, dynamic>{
      'DirectPlayProfiles': <Map<String, dynamic>>[
        <String, dynamic>{'Type': 'Video', 'Container': 'mp4,ts'},
      ],
      'TranscodingProfiles': <Map<String, dynamic>>[
        <String, dynamic>{
          'Type': 'Video',
          'Context': 'Streaming',
          'Container': 'mp4',
          'Protocol': 'hls',
          'VideoCodec': 'h264',
          'AudioCodec': 'aac,ac3,eac3,alac,flac,opus',
        },
        <String, dynamic>{
          'Type': 'Video',
          'Context': 'Streaming',
          'Container': 'ts',
          'Protocol': 'hls',
          'VideoCodec': 'h264',
          'AudioCodec': 'aac,ac3,eac3',
        },
        <String, dynamic>{
          'Type': 'Audio',
          'Context': 'Streaming',
          'Container': 'ts',
          'Protocol': 'hls',
          'AudioCodec': 'aac',
        },
      ],
    };

List<String> _containers(Map<String, dynamic>? profile) =>
    (profile!['TranscodingProfiles'] as List)
        .map((e) => '${e['Type']}:${e['Container']}')
        .toList();

class _WrappedItem {
  _WrappedItem(this.rawData);
  final Map<String, dynamic> rawData;
}

class _FakePlaybackApi extends Fake implements PlaybackApi {
  Map<String, dynamic>? lastBody;

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    lastBody = requestBody;
    return <String, dynamic>{
      'PlaySessionId': 'ps1',
      'MediaSources': <Map<String, dynamic>>[
        <String, dynamic>{
          'Id': 'ms1',
          'Container': 'mpegts',
          'LiveStreamId': 'ls1',
          'SupportsDirectPlay': false,
          'SupportsDirectStream': false,
          'SupportsTranscoding': true,
          'TranscodingUrl':
              '/videos/$itemId/master.m3u8?DeviceId=d&SegmentContainer=ts',
          'MediaStreams': <Map<String, dynamic>>[
            <String, dynamic>{'Type': 'Video', 'Codec': 'h264', 'Index': 0},
            <String, dynamic>{'Type': 'Audio', 'Codec': 'mp2', 'Index': 1},
          ],
        },
      ],
    };
  }
}

class _FakeClient extends Fake implements MediaServerClient {
  _FakeClient(this.serverType, this.playbackApi);

  @override
  final ServerType serverType;
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
  group('JellyfinMediaStreamResolver.preferMpegTsHlsForLive', () {
    test('moves the MPEG-TS HLS entry ahead of fMP4 for an Emby channel and '
        'leaves the caller\'s profile in its own order', () {
      final profile = _appleStyleProfile();
      final result = JellyfinMediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
        serverType: ServerType.emby,
      );

      expect(_containers(result), ['Video:ts', 'Video:mp4', 'Audio:ts']);
      expect(result!['DirectPlayProfiles'], same(profile['DirectPlayProfiles']));
      expect(_containers(profile), ['Video:mp4', 'Video:ts', 'Audio:ts']);
    });

    test('leaves a Jellyfin channel profile as sent', () {
      final profile = _appleStyleProfile();
      final result = JellyfinMediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
        serverType: ServerType.jellyfin,
      );
      expect(result, same(profile));
    });

    test('leaves an Emby profile as sent for anything but a channel', () {
      final profile = _appleStyleProfile();
      final result = JellyfinMediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: false,
        serverType: ServerType.emby,
      );
      expect(result, same(profile));
    });

    test('leaves a profile that already leads with MPEG-TS as sent', () {
      final profile = _appleStyleProfile();
      final entries = profile['TranscodingProfiles'] as List;
      entries.insert(0, entries.removeAt(1));
      final result = JellyfinMediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
        serverType: ServerType.emby,
      );
      expect(result, same(profile));
    });

    test('leaves a profile with no MPEG-TS HLS entry as sent', () {
      final profile = _appleStyleProfile();
      (profile['TranscodingProfiles'] as List).removeAt(1);
      final result = JellyfinMediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
        serverType: ServerType.emby,
      );
      expect(result, same(profile));
    });

    test('keeps entries that come before the first HLS entry in place', () {
      final profile = _appleStyleProfile();
      final entries = profile['TranscodingProfiles'] as List;
      entries.insert(0, <String, dynamic>{
        'Type': 'Video',
        'Context': 'Static',
        'Container': 'mp4',
        'Protocol': 'http',
      });
      final result = JellyfinMediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
        serverType: ServerType.emby,
      );
      expect(
        _containers(result),
        ['Video:mp4', 'Video:ts', 'Video:mp4', 'Audio:ts'],
      );
      expect(
        (result!['TranscodingProfiles'] as List).first['Protocol'],
        'http',
      );
    });

    test('a missing profile stays missing', () {
      expect(
        JellyfinMediaStreamResolver.preferMpegTsHlsForLive(
          null,
          isLiveChannel: true,
          serverType: ServerType.emby,
        ),
        isNull,
      );
    });
  });

  group('MediaStreamResolver.isLiveTvItem', () {
    test('reads the type from a map item', () {
      expect(MediaStreamResolver.isLiveTvItem({'Type': 'TvChannel'}), isTrue);
      expect(
        MediaStreamResolver.isLiveTvItem({'Type': 'LiveTvChannel'}),
        isTrue,
      );
      expect(MediaStreamResolver.isLiveTvItem({'Type': 'Movie'}), isFalse);
    });

    test('reads the type from a wrapped item', () {
      expect(
        MediaStreamResolver.isLiveTvItem(
          _WrappedItem({'Type': 'TvChannel'}),
        ),
        isTrue,
      );
      expect(
        MediaStreamResolver.isLiveTvItem(_WrappedItem({'Type': 'Movie'})),
        isFalse,
      );
    });

    test('anything without a type is not a channel', () {
      expect(MediaStreamResolver.isLiveTvItem(null), isFalse);
      expect(MediaStreamResolver.isLiveTvItem('ch1'), isFalse);
    });
  });

  group('JellyfinMediaStreamResolver.resolve', () {
    test('sends Emby the MPEG-TS HLS entry first for a channel', () async {
      final api = _FakePlaybackApi();
      final resolver =
          JellyfinMediaStreamResolver(_FakeClient(ServerType.emby, api));

      final result = await resolver.resolve(
        <String, dynamic>{'Id': 'ch1', 'Type': 'TvChannel'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:ts', 'Video:mp4', 'Audio:ts']);
      expect(result.playMethod, StreamPlayMethod.transcode);
      expect(result.liveStreamId, 'ls1');
    });

    test('sends Emby a movie profile unchanged', () async {
      final api = _FakePlaybackApi();
      final resolver =
          JellyfinMediaStreamResolver(_FakeClient(ServerType.emby, api));

      await resolver.resolve(
        <String, dynamic>{'Id': 'm1', 'Type': 'Movie'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:mp4', 'Video:ts', 'Audio:ts']);
    });

    test('sends Jellyfin a channel profile unchanged', () async {
      final api = _FakePlaybackApi();
      final resolver =
          JellyfinMediaStreamResolver(_FakeClient(ServerType.jellyfin, api));

      await resolver.resolve(
        <String, dynamic>{'Id': 'ch1', 'Type': 'TvChannel'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:mp4', 'Video:ts', 'Audio:ts']);
    });
  });
}
