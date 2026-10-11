import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_emby/playback_emby.dart';
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

List<String> _segmentFields(Map<String, dynamic>? profile) =>
    (profile!['TranscodingProfiles'] as List)
        .map((e) => '${e['Type']}:${e['SegmentLength']}/${e['MinSegments']}')
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
  group('MediaStreamResolver.preferMpegTsHlsForLive', () {
    test('moves the MPEG-TS HLS entry ahead of fMP4 for a channel and '
        'leaves the caller\'s profile in its own order', () {
      final profile = _appleStyleProfile();
      final result = MediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
      );

      expect(_containers(result), ['Video:ts', 'Video:mp4', 'Audio:ts']);
      expect(result!['DirectPlayProfiles'], same(profile['DirectPlayProfiles']));
      expect(_containers(profile), ['Video:mp4', 'Video:ts', 'Audio:ts']);
    });

    test('leaves the profile as sent for anything but a channel', () {
      final profile = _appleStyleProfile();
      final result = MediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: false,
      );
      expect(result, same(profile));
    });

    test('leaves a profile that already leads with MPEG-TS as sent', () {
      final profile = _appleStyleProfile();
      final entries = profile['TranscodingProfiles'] as List;
      entries.insert(0, entries.removeAt(1));
      final result = MediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
      );
      expect(result, same(profile));
    });

    test('leaves a profile with no MPEG-TS HLS entry as sent', () {
      final profile = _appleStyleProfile();
      (profile['TranscodingProfiles'] as List).removeAt(1);
      final result = MediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
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
      final result = MediaStreamResolver.preferMpegTsHlsForLive(
        profile,
        isLiveChannel: true,
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
        MediaStreamResolver.preferMpegTsHlsForLive(null, isLiveChannel: true),
        isNull,
      );
    });
  });

  group('MediaStreamResolver.shortenLiveHlsStartup', () {
    test('asks for two 3 s segments on every video HLS entry of a channel '
        'and leaves the caller\'s profile alone', () {
      final profile = _appleStyleProfile();
      final result = MediaStreamResolver.shortenLiveHlsStartup(
        profile,
        isLiveChannel: true,
      );

      expect(
        _segmentFields(result),
        ['Video:3/2', 'Video:3/2', 'Audio:null/null'],
      );
      expect(_containers(result), ['Video:mp4', 'Video:ts', 'Audio:ts']);
      expect(
        (result!['TranscodingProfiles'] as List)[1]['AudioCodec'],
        'aac,ac3,eac3',
      );
      expect(result['DirectPlayProfiles'], same(profile['DirectPlayProfiles']));
      expect(
        _segmentFields(profile),
        ['Video:null/null', 'Video:null/null', 'Audio:null/null'],
      );
    });

    test('keeps a segment value the profile already carries', () {
      final profile = _appleStyleProfile();
      final entries = profile['TranscodingProfiles'] as List;
      entries[1]['SegmentLength'] = 6;
      entries[1]['MinSegments'] = 1;
      final result = MediaStreamResolver.shortenLiveHlsStartup(
        profile,
        isLiveChannel: true,
      );
      expect(
        _segmentFields(result),
        ['Video:3/2', 'Video:6/1', 'Audio:null/null'],
      );
    });

    test('leaves the profile as sent for anything but a channel', () {
      final profile = _appleStyleProfile();
      final result = MediaStreamResolver.shortenLiveHlsStartup(
        profile,
        isLiveChannel: false,
      );
      expect(result, same(profile));
    });

    test('leaves a profile with no video HLS entry as sent', () {
      final profile = _appleStyleProfile();
      (profile['TranscodingProfiles'] as List).removeRange(0, 2);
      final result = MediaStreamResolver.shortenLiveHlsStartup(
        profile,
        isLiveChannel: true,
      );
      expect(result, same(profile));
    });

    test('a missing profile stays missing', () {
      expect(
        MediaStreamResolver.shortenLiveHlsStartup(null, isLiveChannel: true),
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

  group('EmbyMediaStreamResolver.resolve', () {
    test('sends the MPEG-TS HLS entry first and two 3 s segments for a '
        'channel', () async {
      final api = _FakePlaybackApi();
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        <String, dynamic>{'Id': 'ch1', 'Type': 'TvChannel'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:ts', 'Video:mp4', 'Audio:ts']);
      expect(
        _segmentFields(sent),
        ['Video:3/2', 'Video:3/2', 'Audio:null/null'],
      );
      expect(result.playMethod, StreamPlayMethod.transcode);
      expect(result.liveStreamId, 'ls1');
    });

    test('sends a movie profile unchanged', () async {
      final api = _FakePlaybackApi();
      final resolver = EmbyMediaStreamResolver(_FakeClient(api));

      await resolver.resolve(
        <String, dynamic>{'Id': 'm1', 'Type': 'Movie'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:mp4', 'Video:ts', 'Audio:ts']);
      expect(
        _segmentFields(sent),
        ['Video:null/null', 'Video:null/null', 'Audio:null/null'],
      );
    });
  });

  group('JellyfinMediaStreamResolver.resolve', () {
    test('sends a channel profile in its own order with two 3 s segments '
        'asked for', () async {
      final api = _FakePlaybackApi();
      final resolver = JellyfinMediaStreamResolver(_FakeClient(api));

      final result = await resolver.resolve(
        <String, dynamic>{'Id': 'ch1', 'Type': 'TvChannel'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:mp4', 'Video:ts', 'Audio:ts']);
      expect(
        _segmentFields(sent),
        ['Video:3/2', 'Video:3/2', 'Audio:null/null'],
      );
      expect(result.playMethod, StreamPlayMethod.transcode);
    });

    test('sends a movie profile unchanged', () async {
      final api = _FakePlaybackApi();
      final resolver = JellyfinMediaStreamResolver(_FakeClient(api));

      await resolver.resolve(
        <String, dynamic>{'Id': 'm1', 'Type': 'Movie'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:mp4', 'Video:ts', 'Audio:ts']);
      expect(
        _segmentFields(sent),
        ['Video:null/null', 'Video:null/null', 'Audio:null/null'],
      );
    });
  });
}
