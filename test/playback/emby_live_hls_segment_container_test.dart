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
  group('MediaStreamResolver.prepareLiveHlsProfile', () {
    test('moves the MPEG-TS HLS entry ahead of fMP4 for an Emby channel and '
        'leaves the caller\'s profile in its own order', () {
      final profile = _appleStyleProfile();
      final result = MediaStreamResolver.prepareLiveHlsProfile(
        profile,
        isLiveChannel: true,
        preferMpegTs: true,
      );

      expect(_containers(result), ['Video:ts', 'Video:mp4', 'Audio:ts']);
      expect(result!['DirectPlayProfiles'], same(profile['DirectPlayProfiles']));
      expect(_containers(profile), ['Video:mp4', 'Video:ts', 'Audio:ts']);
    });

    test('uses three-second segments with one minimum for Jellyfin Live TV HLS', () {
      final profile = _appleStyleProfile();
      final result = MediaStreamResolver.prepareLiveHlsProfile(
        profile,
        isLiveChannel: true,
      );

      final sent = result!['TranscodingProfiles'] as List;
      expect(sent.take(2), everyElement(containsPair('SegmentLength', 3)));
      expect(sent.take(2), everyElement(containsPair('MinSegments', 1)));
      expect(sent[2], (_appleStyleProfile()['TranscodingProfiles'] as List)[2]);

      expect(profile, _appleStyleProfile());
    });

    test('leaves non-Live TV profiles unchanged', () {
      final profile = _appleStyleProfile();
      for (final preferMpegTs in [false, true]) {
        final result = MediaStreamResolver.prepareLiveHlsProfile(
          profile,
          isLiveChannel: false,
          preferMpegTs: preferMpegTs,
        );
        expect(result, same(profile));
      }
      expect(profile, _appleStyleProfile());
    });

    test('keeps MPEG-TS first when it already leads', () {
      final profile = _appleStyleProfile();
      final entries = profile['TranscodingProfiles'] as List;
      entries.insert(0, entries.removeAt(1));
      final result = MediaStreamResolver.prepareLiveHlsProfile(
        profile,
        isLiveChannel: true,
        preferMpegTs: true,
      );
      expect(_containers(result), ['Video:ts', 'Video:mp4', 'Audio:ts']);
      expect((result!['TranscodingProfiles'] as List).first['MinSegments'], 1);
    });

    test('keeps a profile without MPEG-TS HLS available', () {
      final profile = _appleStyleProfile();
      (profile['TranscodingProfiles'] as List).removeAt(1);
      final result = MediaStreamResolver.prepareLiveHlsProfile(
        profile,
        isLiveChannel: true,
        preferMpegTs: true,
      );
      expect(_containers(result), ['Video:mp4', 'Audio:ts']);
      expect((result!['TranscodingProfiles'] as List).first['SegmentLength'], 3);
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
      final result = MediaStreamResolver.prepareLiveHlsProfile(
        profile,
        isLiveChannel: true,
        preferMpegTs: true,
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
        MediaStreamResolver.prepareLiveHlsProfile(
          null,
          isLiveChannel: true,
          preferMpegTs: true,
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

  group('Live TV PlaybackInfo profiles', () {
    test('sends Emby 3-second Live TV HLS with MPEG-TS first', () async {
      final api = _FakePlaybackApi();
      final resolver =
          EmbyMediaStreamResolver(_FakeClient(ServerType.emby, api));

      final result = await resolver.resolve(
        <String, dynamic>{'Id': 'ch1', 'Type': 'TvChannel'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:ts', 'Video:mp4', 'Audio:ts']);
      final profiles = sent['TranscodingProfiles'] as List;
      expect(profiles.take(2), everyElement(containsPair('SegmentLength', 3)));
      expect(profiles.take(2), everyElement(containsPair('MinSegments', 1)));
      expect(profiles[2], (_appleStyleProfile()['TranscodingProfiles'] as List)[2]);
      expect(result.playMethod, StreamPlayMethod.transcode);
      expect(result.liveStreamId, 'ls1');
    });

    test('sends Emby a movie profile unchanged', () async {
      final api = _FakePlaybackApi();
      final resolver =
          EmbyMediaStreamResolver(_FakeClient(ServerType.emby, api));

      await resolver.resolve(
        <String, dynamic>{'Id': 'm1', 'Type': 'Movie'},
        deviceProfile: _appleStyleProfile(),
        enableDirectPlay: false,
      );

      final sent = api.lastBody!['DeviceProfile'] as Map<String, dynamic>;
      expect(_containers(sent), ['Video:mp4', 'Video:ts', 'Audio:ts']);
      expect(sent, _appleStyleProfile());
    });

    test('sends Jellyfin three-second Live TV HLS with one minimum segment', () async {
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
      final profiles = sent['TranscodingProfiles'] as List;
      expect(profiles.take(2), everyElement(containsPair('SegmentLength', 3)));
      expect(profiles.take(2), everyElement(containsPair('MinSegments', 1)));
      expect(profiles[2], (_appleStyleProfile()['TranscodingProfiles'] as List)[2]);
    });
  });
}
