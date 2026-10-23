import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/playback/playback_info_sections.dart';
import 'package:playback_core/playback_core.dart';

final _l10n = AppLocalizationsEn();

class _MockPlaybackManager extends Mock implements PlaybackManager {}

const _video = <String, dynamic>{
  'Type': 'Video',
  'Index': 0,
  'Codec': 'hevc',
  'Profile': 'Main 10',
  'Width': 3840,
  'Height': 2160,
  'RealFrameRate': 23.976025,
  'VideoRange': 'HDR',
  'VideoRangeType': 'HDR10',
};
const _audio = <String, dynamic>{
  'Type': 'Audio',
  'Index': 1,
  'Codec': 'truehd',
  'Profile': 'Dolby TrueHD + Dolby Atmos',
  'Channels': 8,
  'Language': 'eng',
  'Title': 'TrueHD Atmos 7.1',
  'IsDefault': true,
};
const _subtitle = <String, dynamic>{
  'Type': 'Subtitle',
  'Index': 2,
  'Codec': 'pgssub',
  'Language': 'ger',
  'IsForced': true,
};
const _streams = [_video, _audio, _subtitle];
const _source = <String, dynamic>{
  'Id': 'src',
  'Path': '/media/Movies/Dune Part Two (2024)/Dune Part Two (2024) - 2160p.mkv',
  'Container': 'mkv',
  'Size': 62500000000,
  'Bitrate': 68400000,
};

// Jellyfin 12.2 writes the reasons comma joined, unencoded.
const _jellyfinUrl =
    'http://jf.local:8096/videos/src/master.m3u8?DeviceId=dev'
    '&MediaSourceId=src&VideoCodec=hevc,h264&AudioCodec=aac'
    '&AudioStreamIndex=1&VideoBitrate=19808000&AudioBitrate=384000'
    '&PlaySessionId=ps&api_key=token&SegmentContainer=mp4'
    '&TranscodeReasons=ContainerBitrateExceedsLimit,AudioCodecNotSupported';

// Emby 4.10's shape, with the list percent encoded.
const _embyUrl =
    'http://emby.local:8096/emby/videos/23/master.m3u8?DeviceId=dev'
    '&MediaSourceId=mediasource_23&PlaySessionId=ps&api_key=token'
    '&VideoCodec=h264&AudioCodec=aac&VideoBitrate=3808000'
    '&AudioBitrate=192000&AudioStreamIndex=1&SegmentContainer=ts'
    '&BreakOnNonKeyFrames=True'
    '&TranscodeReasons=VideoCodecNotSupported%2CAudioCodecNotSupported';

StreamResolutionResult _resolution(
  StreamPlayMethod method, {
  String url = 'http://jf.local:8096/Videos/src/stream?static=true',
  List<String> reasons = const <String>[],
}) => StreamResolutionResult(
  streamUrl: url,
  mediaSourceId: 'src',
  playMethod: method,
  mediaStreams: _streams,
  selectedAudioStreamIndex: 1,
  sourceBitrate: 68400000,
  transcodingReasons: reasons,
);

/// One line per section header and row, so a whole dialog reads as a list.
List<String> _lines(List<Map<String, dynamic>> sections) => [
  for (final section in sections) ...[
    '# ${section['title']}${section['id'] == null ? '' : ' [${section['id']}]'}',
    for (final row in (section['rows'] as List).cast<Map<String, dynamic>>())
      row.containsKey('note')
          ? '(note) ${row['note']}'
          : '${row['label']}: ${row['value']}'
                '${row['bold'] == true ? ' [bold]' : ''}',
  ],
];

void main() {
  group('playbackInfoMethod', () {
    test('uses the resolved method, then the bringup fallback', () {
      expect(
        playbackInfoMethod(StreamPlayMethod.directPlay, 'transcode', null),
        StreamPlayMethod.directPlay,
      );
      expect(
        playbackInfoMethod(null, 'directStream', null),
        StreamPlayMethod.directStream,
      );
      expect(playbackInfoMethod(null, null, null), isNull);
    });

    test('a transcode that copies video and audio is a direct stream', () {
      expect(
        playbackInfoMethod(StreamPlayMethod.transcode, null, {
          'IsVideoDirect': true,
          'IsAudioDirect': true,
        }),
        StreamPlayMethod.directStream,
      );
      expect(
        playbackInfoMethod(StreamPlayMethod.transcode, null, {
          'IsVideoDirect': true,
          'IsAudioDirect': false,
        }),
        StreamPlayMethod.transcode,
      );
    });
  });

  group('playbackTranscodeReasons', () {
    test('reads a Jellyfin transcode URL', () {
      expect(playbackTranscodeReasons(transcodingUrl: _jellyfinUrl), [
        'ContainerBitrateExceedsLimit',
        'AudioCodecNotSupported',
      ]);
    });

    test('reads an Emby transcode URL and matches the name in any case', () {
      expect(playbackTranscodeReasons(transcodingUrl: _embyUrl), [
        'VideoCodecNotSupported',
        'AudioCodecNotSupported',
      ]);
      expect(
        playbackTranscodeReasons(
          transcodingUrl:
              'http://x/videos/1/master.m3u8?transcodereasons='
              'AudioCodecNotSupported,audiocodecnotsupported,DirectPlayError',
        ),
        ['AudioCodecNotSupported', 'DirectPlayError'],
      );
    });

    test('falls back to the session, as an array or a comma string', () {
      const url = 'http://x/videos/1/master.m3u8?VideoCodec=h264';
      expect(
        playbackTranscodeReasons(
          transcodingUrl: url,
          transcodingInfo: {
            'TranscodeReasons': ['VideoCodecNotSupported', 'AudioIsExternal'],
          },
        ),
        ['VideoCodecNotSupported', 'AudioIsExternal'],
      );
      expect(
        playbackTranscodeReasons(
          transcodingUrl: url,
          transcodingInfo: {
            'TranscodeReasons': 'VideoCodecNotSupported, AudioIsExternal',
          },
        ),
        ['VideoCodecNotSupported', 'AudioIsExternal'],
      );
    });

    test('the URL wins over the session, the resolver comes last', () {
      expect(
        playbackTranscodeReasons(
          transcodingUrl: _jellyfinUrl,
          transcodingInfo: {
            'TranscodeReasons': ['VideoCodecNotSupported'],
          },
        ),
        ['ContainerBitrateExceedsLimit', 'AudioCodecNotSupported'],
      );
      expect(
        playbackTranscodeReasons(
          transcodingUrl: 'http://x/stream',
          fallback: const ['ContainerNotSupported'],
        ),
        ['ContainerNotSupported'],
      );
    });
  });

  group('playbackWhyLines', () {
    const video = <String, dynamic>{
      'Codec': 'hevc',
      'Profile': 'Main 10',
      'Level': 153,
      'BitDepth': 10,
      'Width': 3840,
      'Height': 2160,
      'RealFrameRate': 59.94006,
      'VideoRangeType': 'DOVIWithHDR10',
      'DvProfile': 7,
    };
    const audio = <String, dynamic>{
      'Codec': 'truehd',
      'Profile': 'Dolby TrueHD + Dolby Atmos',
      'Channels': 8,
      'SampleRate': 96000,
      'BitDepth': 24,
    };
    List<String> why(List<String> reasons, {bool forced = false}) =>
        playbackWhyLines(
          _l10n,
          reasons,
          forced: forced,
          video: video,
          audio: audio,
          subtitle: const {'Codec': 'pgssub'},
          container: 'MKV',
          bitrate: 68400000,
          limit: 20000000,
        );

    test('names the source value for each reason', () {
      const bitrate = '68.4 Mbps is above the 20 Mbps streaming limit';
      const other = "The file couldn't be played directly";
      const expected = {
        'ContainerBitrateExceedsLimit': bitrate,
        'VideoBitrateNotSupported': bitrate,
        'AudioBitrateNotSupported': bitrate,
        'VideoBitrateExceedsLimit': bitrate,
        'BitrateLimitExceeded': bitrate,
        'ContainerBitrateNotSupported': bitrate,
        'ContainerNotSupported': "This device can't open MKV files",
        'VideoCodecNotSupported': "This device can't play HEVC video",
        'VideoCodecTagNotSupported': "This device can't play HEVC video",
        'VideoProfileNotSupported': "This device can't play HEVC Main 10 video",
        'VideoLevelNotSupported': "This device can't play HEVC level 5.1 video",
        'VideoBitDepthNotSupported': "This device can't play 10-bit video",
        'VideoResolutionNotSupported': "This device can't play 4K video",
        'VideoFramerateNotSupported': "This device can't play 59.94 fps video",
        'InterlacedVideoNotSupported':
            "This device can't play interlaced video",
        'AnamorphicVideoNotSupported':
            "This device can't play anamorphic video",
        'RefFramesNotSupported': "This device can't play this video format",
        'UnknownVideoStreamInfo': "This device can't play this video format",
        'VideoRangeTypeNotSupported':
            "This device can't display Dolby Vision Profile 7",
        'VideoRangeNotSupported':
            "This device can't display Dolby Vision Profile 7",
        'AudioCodecNotSupported': "This device can't play Dolby TrueHD audio",
        'AudioProfileNotSupported':
            "This device can't play Dolby TrueHD with Atmos",
        'AudioChannelsNotSupported': "This device can't play 7.1 audio",
        'AudioSampleRateNotSupported': "This device can't play 96 kHz audio",
        'AudioBitDepthNotSupported': "This device can't play 24-bit audio",
        'AudioIsExternal': 'The audio track is in a separate file',
        'SecondaryAudioNotSupported':
            'This device can only play the first audio track',
        'UnknownAudioStreamInfo': "This device can't play this audio format",
        'SubtitleCodecNotSupported':
            'PGS subtitles are being burned into the video',
        'DirectPlayError': other,
        'StreamCountExceedsLimit': other,
        'SomeFutureReason': other,
      };
      for (final MapEntry(:key, :value) in expected.entries) {
        expect(why([key]), [value], reason: key);
      }
      expect(why(const [], forced: true), [
        'Transcoding is forced in settings',
      ]);
      expect(playbackWhyLines(_l10n, const []), isEmpty);
    });

    test('lists several reasons in order and a repeated line once', () {
      expect(
        why(const [
          'SubtitleCodecNotSupported',
          'UnknownVideoStreamInfo',
          'audiocodecnotsupported',
          'RefFramesNotSupported',
          'VIDEORANGETYPENOTSUPPORTED',
          'ContainerNotSupported',
          'VideoBitrateNotSupported',
          'ContainerBitrateExceedsLimit',
        ], forced: true),
        [
          'Transcoding is forced in settings',
          '68.4 Mbps is above the 20 Mbps streaming limit',
          "This device can't open MKV files",
          "This device can't play this video format",
          "This device can't display Dolby Vision Profile 7",
          "This device can't play Dolby TrueHD audio",
          'PGS subtitles are being burned into the video',
        ],
      );
      expect(
        playbackWhyLines(_l10n, const [
          'RefFramesNotSupported',
          'UnknownVideoStreamInfo',
        ]),
        ["This device can't play this video format"],
      );
    });

    test('falls back to the plain line when a value is missing', () {
      expect(
        playbackWhyLines(_l10n, const [
          'StreamCountExceedsLimit',
          'SubtitleCodecNotSupported',
          'UnknownAudioStreamInfo',
          'SecondaryAudioNotSupported',
          'AudioIsExternal',
          'AudioBitDepthNotSupported',
          'AudioSampleRateNotSupported',
          'AudioChannelsNotSupported',
          'AudioProfileNotSupported',
          'AudioCodecNotSupported',
          'VideoRangeTypeNotSupported',
          'RefFramesNotSupported',
          'AnamorphicVideoNotSupported',
          'InterlacedVideoNotSupported',
          'VideoFramerateNotSupported',
          'VideoResolutionNotSupported',
          'VideoBitDepthNotSupported',
          'VideoLevelNotSupported',
          'VideoProfileNotSupported',
          'VideoCodecNotSupported',
          'ContainerNotSupported',
          'ContainerBitrateExceedsLimit',
        ]),
        [
          'The bitrate is above the streaming limit',
          "This device can't play this file type",
          "This device can't play this video format",
          "This device can't play interlaced video",
          "This device can't play anamorphic video",
          "This device can't display this HDR format",
          "This device can't play this audio format",
          'The audio track is in a separate file',
          'This device can only play the first audio track',
          'Subtitles are being burned into the video',
          "The file couldn't be played directly",
        ],
      );

      String line(
        String reason, {
        Map<String, dynamic>? video,
        Map<String, dynamic>? audio,
        int? bitrate,
        int? limit,
      }) => playbackWhyLines(
        _l10n,
        [reason],
        video: video,
        audio: audio,
        bitrate: bitrate,
        limit: limit,
      ).single;

      const bitrateFallback = 'The bitrate is above the streaming limit';
      expect(
        line('BitrateLimitExceeded', bitrate: 68400000),
        bitrateFallback,
      );
      expect(line('BitrateLimitExceeded', limit: 20000000), bitrateFallback);
      expect(
        line('BitrateLimitExceeded', bitrate: 8000000, limit: 20000000),
        bitrateFallback,
      );
      expect(
        line('BitrateLimitExceeded', bitrate: 1600000, limit: 1500000),
        '1.6 Mbps is above the 1 Mbps streaming limit',
      );
      // A cap under 1 Mbps would read as 0 Mbps.
      expect(
        line('BitrateLimitExceeded', bitrate: 1600000, limit: 800000),
        bitrateFallback,
      );

      // The profile and level lines fall back to the codec line first.
      const vc1 = {'Codec': 'vc1'};
      expect(
        line('VideoProfileNotSupported', video: vc1),
        "This device can't play VC-1 video",
      );
      expect(
        line('VideoLevelNotSupported', video: vc1),
        "This device can't play VC-1 video",
      );
      expect(
        line('VideoProfileNotSupported', video: {'Profile': 'Main 10'}),
        "This device can't play this video format",
      );
      expect(
        playbackWhyLines(_l10n, const [
          'VideoCodecNotSupported',
          'VideoProfileNotSupported',
        ], video: vc1),
        ["This device can't play VC-1 video"],
      );
      expect(
        line('AudioProfileNotSupported', audio: {'Codec': 'dts'}),
        "This device can't play DTS audio",
      );
      expect(
        line('VideoRangeTypeNotSupported', video: {'Codec': 'hevc'}),
        "This device can't display this HDR format",
      );
      expect(
        line('VideoResolutionNotSupported', video: {'Width': 3840}),
        "This device can't play this video format",
      );
      for (final zero in ['0', 0, '']) {
        expect(
          line(
            'VideoProfileNotSupported',
            video: {'Codec': 'hevc', 'Profile': zero},
          ),
          "This device can't play HEVC video",
        );
        expect(
          line(
            'VideoLevelNotSupported',
            video: {'Codec': 'hevc', 'Level': zero},
          ),
          "This device can't play HEVC video",
        );
      }
    });

    test('reads H.264 and HEVC levels', () {
      String level(String codec, num level) => playbackWhyLines(
        _l10n,
        const ['VideoLevelNotSupported'],
        video: {'Codec': codec, 'Level': level},
      ).single;

      expect(level('hevc', 153), "This device can't play HEVC level 5.1 video");
      expect(level('hevc', 120), "This device can't play HEVC level 4 video");
      expect(level('hevc', 186), "This device can't play HEVC level 6.2 video");
      expect(level('h264', 51), "This device can't play H.264 level 5.1 video");
      expect(level('h264', 40), "This device can't play H.264 level 4 video");
      expect(level('av1', 8), "This device can't play AV1 level 8 video");
      expect(level('hevc', 0), "This device can't play HEVC video");
    });

    test('formats channels, sample rates and subtitles', () {
      String line(
        String reason, {
        Map<String, dynamic>? audio,
        Map<String, dynamic>? subtitle,
      }) => playbackWhyLines(
        _l10n,
        [reason],
        audio: audio,
        subtitle: subtitle,
      ).single;

      expect(
        line('AudioChannelsNotSupported', audio: {'Channels': 6}),
        "This device can't play 5.1 audio",
      );
      expect(
        line('AudioChannelsNotSupported', audio: {'Channels': 3}),
        "This device can't play 3-channel audio",
      );
      expect(
        line('AudioSampleRateNotSupported', audio: {'SampleRate': 44100}),
        "This device can't play 44.1 kHz audio",
      );
      expect(
        line(
          'AudioProfileNotSupported',
          audio: {'Codec': 'dts', 'Profile': 'DTS-HD MA'},
        ),
        "This device can't play DTS-HD Master Audio",
      );
      const dca = {'Codec': 'dca', 'Profile': 'DTS-HD MA'};
      expect(
        line('AudioCodecNotSupported', audio: dca),
        "This device can't play DTS audio",
      );
      expect(
        line('AudioProfileNotSupported', audio: dca),
        "This device can't play DTS-HD Master Audio",
      );
      for (final (codec, name) in [
        ('ass', 'ASS'),
        ('subrip', 'SRT'),
        ('dvd_subtitle', 'VobSub'),
        ('mov_text', 'MP4 text'),
      ]) {
        expect(
          line('SubtitleCodecNotSupported', subtitle: {'Codec': codec}),
          '$name subtitles are being burned into the video',
        );
      }
    });
  });

  test('formats resolution, size, channels and container', () {
    expect(playbackResolutionName(3840, 2160), '4K');
    expect(playbackResolutionName(3840, 1600), '4K');
    expect(playbackResolutionName(1920, 800), '1080p');
    expect(playbackResolutionName(1440, 1080), '1080p');
    expect(playbackResolutionName(1280, 536), '720p');
    expect(playbackResolutionName(720, 480), 'SD');

    expect(fileSizeLabel(62500000000), '58.2 GB');
    expect(fileSizeLabel(1024 * 1024 * 1024), '1.0 GB');
    expect(fileSizeLabel(734 * 1024 * 1024), '734 MB');

    expect(playbackChannelsLabel(_l10n, 1), 'Mono');
    expect(playbackChannelsLabel(_l10n, 2), 'Stereo');
    expect(playbackChannelsLabel(_l10n, 6), '5.1 surround');
    expect(playbackChannelsLabel(_l10n, 8), '7.1 surround');
    expect(playbackChannelsLabel(_l10n, 3), '3 channels');

    expect(containerLabel('mov,mp4,m4a,3gp,3g2,mj2'), 'MP4');
    expect(containerLabel('mkv'), 'MKV');
    expect(containerLabel('webm,matroska'), 'WEBM');
  });

  test('only the Live TV direct play setting counts as forced', () {
    bool forced(bool queueForced, String type) {
      final manager = _MockPlaybackManager();
      final queue = QueueService()
        ..setQueue([
          {'Id': 'item', 'Type': type},
        ]);
      when(() => manager.isTranscodeForced).thenReturn(queueForced);
      when(() => manager.queueService).thenReturn(queue);
      return transcodeForcedBySettings(manager);
    }

    expect(forced(true, 'TvChannel'), isTrue);
    expect(forced(false, 'TvChannel'), isFalse);
    // A one-off transcode pick or the Dolby Vision fallback on a movie.
    expect(forced(true, 'Movie'), isFalse);
  });

  test('a download is named by its path, its local file, then its name', () {
    String? name({Map<String, dynamic>? source, String? localFile}) =>
        _lines(
              buildPlaybackInfoSections(
                l10n: _l10n,
                resolution: null,
                mediaStreams: const [],
                mediaSource: source,
                offline: true,
                localFile: localFile,
              ),
            )
            .where((line) => line.startsWith('Name: '))
            .firstOrNull;

    const local = '/data/downloads/item/Dune Part Two.mkv';
    expect(
      name(source: _source, localFile: local),
      'Name: Dune Part Two (2024) - 2160p.mkv',
    );
    expect(
      name(source: {'Name': 'Dune Part Two'}, localFile: local),
      'Name: Dune Part Two.mkv',
    );
    expect(name(source: {'Name': 'Dune Part Two'}), 'Name: Dune Part Two');
    expect(name(), isNull);
  });

  test('Container is the file extension, then the server list', () {
    List<String> build(Map<String, dynamic> source) => _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(
          StreamPlayMethod.transcode,
          url:
              'http://x/videos/src/master.m3u8'
              '?TranscodeReasons=ContainerNotSupported',
        ),
        mediaStreams: _streams,
        mediaSource: source,
        subtitleStreamIndex: -1,
      ),
    );
    String? container(Map<String, dynamic> source) => build(
      source,
    ).where((line) => line.startsWith('Container: ')).firstOrNull;

    expect(
      build({'Path': r'D:\Movies\Dune Part Two.mp4', 'Container': 'mov'}),
      containsAllInOrder([
        "Why: This device can't open MP4 files",
        'Container: MP4',
      ]),
    );
    expect(
      container({'Path': '/media/Clip.m4v', 'Container': 'mov,mp4,m4a'}),
      'Container: M4V',
    );
    expect(
      container({'Path': '/media/Movie.mkv', 'Container': 'webm'}),
      'Container: MKV',
    );
    expect(
      container({'Container': 'mov,mp4,m4a,3gp,3g2,mj2'}),
      'Container: MP4',
    );
    expect(
      container({'Path': '/media/Movie/VIDEO_TS', 'Container': 'mkv'}),
      'Container: MKV',
    );
    expect(
      container({'Path': 'http://cdn/clip.mp4?token=a', 'Container': 'ts'}),
      'Container: TS',
    );
    expect(container({'Path': '/media/Movie/VIDEO_TS'}), isNull);
    expect(container({'Path': '/media/Movie.MKV'}), 'Container: MKV');
    // Only a known media extension counts, not a dotted folder name.
    expect(
      container({'Path': '/media/Avatar.2009.BluRay', 'Container': 'mkv'}),
      'Container: MKV',
    );
    expect(container({'Path': '/media/Avatar.2009'}), isNull);
  });

  test('Format skips a profile of 0 and reads dca as DTS', () {
    for (final zero in ['0', 0]) {
      final lines = _lines(
        buildPlaybackInfoSections(
          l10n: _l10n,
          resolution: _resolution(StreamPlayMethod.directPlay),
          mediaStreams: [
            {..._video, 'Profile': zero},
            {..._audio, 'Codec': 'dca', 'Profile': 'DTS-HD MA'},
          ],
        ),
      );
      expect(
        lines,
        containsAllInOrder(['Format: HEVC', 'Format: DTS-HD Master Audio']),
      );
    }
  });

  test('Quality Limit is only a limit the user set', () {
    expect(userQualityLimitMbps(null, '120'), isNull);
    expect(userQualityLimitMbps(null, 'auto'), isNull);
    expect(userQualityLimitMbps(null, '40'), 40);
    expect(userQualityLimitMbps(8, '120'), 8);
  });

  test('4K HEVC HDR10 TrueHD Atmos direct play', () {
    final sections = buildPlaybackInfoSections(
      l10n: _l10n,
      resolution: _resolution(StreamPlayMethod.directPlay),
      mediaStreams: _streams,
      mediaSource: _source,
      subtitleStreamIndex: -1,
      qualityLimitMbps: userQualityLimitMbps(null, '120'),
      player: 'Media3 (ExoPlayer)',
      device: 'NVIDIA SHIELD Android TV, Android 11',
      audioRoute: 'HDMI',
    );
    expect(_lines(sections), [
      '# Playback',
      'Play Method: Direct Play [bold]',
      '(note) Playing the original file as is.',
      'Bitrate: 68.4 Mbps',
      '# Video',
      'Resolution: 4K (3840×2160)',
      'Frame Rate: 23.976 fps',
      'Format: HEVC Main 10',
      'HDR: HDR10',
      '# Audio',
      'Track: English, Default',
      'Format: Dolby TrueHD with Atmos',
      'Channels: 7.1 surround',
      '# File',
      'Name: Dune Part Two (2024) - 2160p.mkv',
      'Container: MKV',
      'Size: 58.2 GB',
      '# Technical [technical]',
      'Player: Media3 (ExoPlayer)',
      'Device: NVIDIA SHIELD Android TV, Android 11',
      'Audio Route: HDMI',
    ]);
  });

  group('Jellyfin transcode for bitrate and audio', () {
    List<String> build(Map<String, dynamic>? session) => _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(
          StreamPlayMethod.transcode,
          url: _jellyfinUrl,
          reasons: const ['AudioCodecNotSupported'],
        ),
        mediaStreams: _streams,
        mediaSource: _source,
        subtitleStreamIndex: -1,
        transcodingInfo: session,
        qualityLimitMbps: 20,
        player: 'Media3 (ExoPlayer)',
      ),
    );

    test('with the session TranscodingInfo', () {
      expect(
        build({
          'IsVideoDirect': false,
          'IsAudioDirect': false,
          'VideoCodec': 'hevc',
          'AudioCodec': 'aac',
          'Bitrate': 20192000,
          'Width': 3840,
          'Height': 2160,
          'AudioChannels': 6,
        }),
        [
          '# Playback',
          'Play Method: Transcoding [bold]',
          '(note) The server is converting the video and audio so this '
              'device can play it.',
          'Why: 68.4 Mbps is above the 20 Mbps streaming limit\nThis device '
              "can't play Dolby TrueHD audio",
          'Bitrate: 20.2 Mbps (original 68.4 Mbps)',
          'Quality Limit: 20 Mbps',
          '# Video',
          'Resolution: 4K (3840×2160)',
          'Frame Rate: 23.976 fps',
          'Format: HEVC Main 10',
          'HDR: HDR10',
          '# Audio',
          'Track: English, Default',
          'Format: AAC (converted from Dolby TrueHD)',
          'Channels: 5.1 surround (converted from 7.1)',
          '# File',
          'Name: Dune Part Two (2024) - 2160p.mkv',
          'Container: MKV',
          'Size: 58.2 GB',
          '# Technical [technical]',
          'Player: Media3 (ExoPlayer)',
          'Transcode Reasons: ContainerBitrateExceedsLimit, '
              'AudioCodecNotSupported',
        ],
      );
    });

    test('from the transcode URL alone', () {
      final lines = build(null);
      // HEVC is on the URL's list, but the file runs past its VideoBitrate.
      expect(
        lines,
        containsAllInOrder([
          'Play Method: Transcoding [bold]',
          '(note) The server is converting the video and audio so this '
              'device can play it.',
          'Bitrate: 20.2 Mbps (original 68.4 Mbps)',
          'Format: HEVC Main 10',
          'Format: AAC (converted from Dolby TrueHD)',
          'Channels: 7.1 surround',
          'Transcode Reasons: ContainerBitrateExceedsLimit, '
              'AudioCodecNotSupported',
        ]),
      );
    });
  });

  group('session TranscodingInfo', () {
    List<String> build(
      Map<String, dynamic>? session, {
      String url = _jellyfinUrl,
    }) => _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(StreamPlayMethod.transcode, url: url),
        mediaStreams: _streams,
        mediaSource: _source,
        subtitleStreamIndex: -1,
        transcodingInfo: session == null
            ? null
            : {
                'IsVideoDirect': false,
                'IsAudioDirect': false,
                'VideoCodec': 'h264',
                'Width': 1920,
                'Height': 1080,
                'Bitrate': 8000000,
                ...session,
              },
      ),
    );
    const used = 'Bitrate: 8.0 Mbps (original 68.4 Mbps)';
    const fromUrl = 'Bitrate: 20.2 Mbps (original 68.4 Mbps)';

    test('only counts when its reasons match the URL', () {
      expect(
        build({
          'TranscodeReasons': [
            'audiocodecnotsupported',
            'ContainerBitrateExceedsLimit',
          ],
        }),
        contains(used),
      );
      expect(
        build({
          'TranscodeReasons':
              'AudioCodecNotSupported, ContainerBitrateExceedsLimit',
        }),
        contains(used),
      );
      expect(build({}), contains(used));

      // An earlier title's transcode still reporting into the session.
      final stale = build({
        'TranscodeReasons': ['VideoCodecNotSupported'],
      });
      expect(stale, contains(fromUrl));
      expect(stale, contains('Resolution: 4K (3840×2160)'));
      expect(
        build({
          'TranscodeReasons': ['AudioCodecNotSupported'],
        }),
        contains(fromUrl),
      );

      // A URL with no reasons has nothing to compare against.
      expect(
        build({
          'TranscodeReasons': ['VideoCodecNotSupported'],
        }, url: 'http://x/videos/src/master.m3u8?VideoCodec=h264'),
        contains(used),
      );
    });

    test('a measured bitrate shows beside the original, a cap only below', () {
      expect(
        build({'Bitrate': 80000000}),
        contains('Bitrate: 80.0 Mbps (original 68.4 Mbps)'),
      );
      expect(build({'Bitrate': 68400000}), contains('Bitrate: 68.4 Mbps'));
      expect(build(null), contains(fromUrl));
      expect(
        build(
          null,
          url:
              'http://x/videos/src/master.m3u8?VideoBitrate=139808000'
              '&AudioBitrate=192000',
        ),
        contains('Bitrate: 68.4 Mbps'),
      );
      expect(
        build(null, url: 'http://x/videos/src/master.m3u8?VideoCodec=h264'),
        contains('Bitrate: 68.4 Mbps'),
      );
    });
  });

  test('a source codec on the URL list is copied, whatever the reason', () {
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(
          StreamPlayMethod.transcode,
          url:
              'http://jf.local:8096/videos/src/master.m3u8?VideoCodec=h264,hevc'
              '&AudioCodec=aac&VideoBitrate=139808000&AudioBitrate=192000'
              '&TranscodeReasons=VideoCodecNotSupported,AudioCodecNotSupported',
        ),
        mediaStreams: _streams,
        mediaSource: _source,
        subtitleStreamIndex: -1,
      ),
    );
    expect(
      lines,
      containsAllInOrder([
        '(note) The server is converting the audio so this device can play '
            'it.',
        // A target above the file's own rate is only a ceiling.
        'Bitrate: 68.4 Mbps',
        'Format: HEVC Main 10',
        'Format: AAC (converted from Dolby TrueHD)',
      ]),
    );
  });

  test('more channels than the URL allows converts the audio', () {
    const streams = [
      {'Type': 'Video', 'Index': 0, 'Codec': 'h264', 'Width': 1920},
      {'Type': 'Audio', 'Index': 1, 'Codec': 'aac', 'Channels': 6},
    ];
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: StreamResolutionResult(
          streamUrl:
              'http://jf.local:8096/videos/src/master.m3u8?VideoCodec=h264'
              '&AudioCodec=aac&TranscodingMaxAudioChannels=2'
              '&TranscodeReasons=ContainerNotSupported',
          mediaSourceId: 'src',
          playMethod: StreamPlayMethod.transcode,
        ),
        mediaStreams: streams,
      ),
    );
    expect(
      lines,
      contains(
        '(note) The server is converting the audio so this device can play '
        'it.',
      ),
    );
  });

  test('an Emby transcode shows its reasons and converted codecs', () {
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(StreamPlayMethod.transcode, url: _embyUrl),
        mediaStreams: _streams,
        mediaSource: _source,
        subtitleStreamIndex: -1,
      ),
    );
    expect(
      lines,
      containsAllInOrder([
        'Play Method: Transcoding [bold]',
        '(note) The server is converting the video and audio so this device '
            'can play it.',
        "Why: This device can't play HEVC video\nThis device can't play "
            'Dolby TrueHD audio',
        'Bitrate: 4.0 Mbps (original 68.4 Mbps)',
        'Format: H.264 (converted from HEVC)',
        'Format: AAC (converted from Dolby TrueHD)',
        'Transcode Reasons: VideoCodecNotSupported, AudioCodecNotSupported',
      ]),
    );
  });

  test('an Emby session reporting more channels than the source', () {
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(StreamPlayMethod.transcode, url: _embyUrl),
        mediaStreams: [
          _video,
          {..._audio, 'Codec': 'aac', 'Profile': 'LC', 'Channels': 2},
        ],
        mediaSource: _source,
        subtitleStreamIndex: -1,
        transcodingInfo: {
          'AudioCodec': 'mp3',
          'IsAudioDirect': false,
          'AudioChannels': 8,
        },
      ),
    );
    expect(lines, contains('Channels: Stereo'));
  });

  test('burned in subtitles, a forced transcode and a tone mapped range', () {
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(
          StreamPlayMethod.transcode,
          url:
              'http://x/videos/src/master.m3u8?VideoCodec=h264'
              '&SubtitleMethod=Encode&SubtitleStreamIndex=2&TranscodeReasons='
              'SubtitleCodecNotSupported,VideoRangeTypeNotSupported',
        ),
        mediaStreams: _streams,
        mediaSource: _source,
        subtitleStreamIndex: 2,
        transcodeForced: true,
      ),
    );
    expect(
      lines,
      containsAllInOrder([
        "Why: Transcoding is forced in settings\nThis device can't display "
            'HDR10\nPGS subtitles are being burned into the video',
        'HDR: SDR (converted from HDR10)',
        '# Subtitles',
        'Track: German, Forced',
        'Format: PGS (image)',
        'Delivery: Burned in by the server',
      ]),
    );
  });

  group('with no session TranscodingInfo', () {
    // HEVC is on the URL's list and the file is under its VideoBitrate, so
    // nothing else says the video is re-encoded.
    const base =
        'http://x/videos/src/master.m3u8?VideoCodec=hevc,h264&AudioCodec=aac'
        '&VideoBitrate=139808000&AudioBitrate=192000'
        '&TranscodeReasons=AudioCodecNotSupported,DirectPlayError';
    const audioOnly =
        '(note) The server is converting the audio so this device can play '
        'it.';
    const both =
        '(note) The server is converting the video and audio so this device '
        'can play it.';
    const burnedIn = 'Delivery: Burned in by the server';

    List<String> build(String url, {String? subtitleDelivery}) => _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(StreamPlayMethod.transcode, url: url),
        mediaStreams: [
          _video,
          _audio,
          {..._subtitle, 'DeliveryMethod': ?subtitleDelivery},
        ],
        mediaSource: _source,
        subtitleStreamIndex: 2,
      ),
    );

    test('SubtitleMethod=Encode only burns in the track the URL names', () {
      final external = build(
        '$base&SubtitleMethod=Encode',
        subtitleDelivery: 'External',
      );
      expect(external, contains(audioOnly));
      expect(external, isNot(contains(burnedIn)));
      expect(
        build('$base&SubtitleMethod=Encode&SubtitleStreamIndex=3'),
        isNot(contains(burnedIn)),
      );

      final named = build('$base&SubtitleMethod=Encode&SubtitleStreamIndex=2');
      expect(named, containsAllInOrder([both, burnedIn]));
      expect(
        build(base, subtitleDelivery: 'Encode'),
        containsAllInOrder([both, burnedIn]),
      );
    });

    test('a source above MaxWidth or MaxHeight is a converted video', () {
      expect(build('$base&MaxWidth=1920&MaxHeight=1080'), contains(both));
      expect(build('$base&MaxHeight=1080'), contains(both));
      expect(build('$base&MaxWidth=3840&MaxHeight=2160'), contains(audioOnly));
      expect(build(base), contains(audioOnly));
    });
  });

  test('Why names what blocked a Dolby Vision Profile 7 file', () {
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(
          StreamPlayMethod.transcode,
          url:
              'http://x/videos/src/master.m3u8?VideoCodec=hevc&AudioCodec=aac'
              '&TranscodeReasons=ContainerBitrateExceedsLimit,'
              'VideoRangeTypeNotSupported,AudioCodecNotSupported,'
              'SubtitleCodecNotSupported',
        ),
        mediaStreams: [
          {..._video, 'VideoRangeType': 'DOVIWithHDR10', 'DvProfile': 7},
          _audio,
          _subtitle,
        ],
        mediaSource: _source,
        subtitleStreamIndex: 2,
        qualityLimitMbps: 20,
      ),
    );
    expect(
      lines,
      contains(
        'Why: 68.4 Mbps is above the 20 Mbps streaming limit\n'
        "This device can't display Dolby Vision Profile 7\n"
        "This device can't play Dolby TrueHD audio\n"
        'PGS subtitles are being burned into the video',
      ),
    );
  });

  test('with no Quality Limit the bitrate line names the URL target', () {
    String why(String url) => _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(StreamPlayMethod.transcode, url: url),
        mediaStreams: _streams,
        mediaSource: _source,
        subtitleStreamIndex: -1,
      ),
    ).firstWhere((line) => line.startsWith('Why: '));

    expect(
      why(_jellyfinUrl),
      'Why: 68.4 Mbps is above the 20 Mbps streaming limit\nThis device '
      "can't play Dolby TrueHD audio",
    );
    expect(
      why('$_jellyfinUrl&MaxStreamingBitrate=40000000'),
      'Why: 68.4 Mbps is above the 40 Mbps streaming limit\nThis device '
      "can't play Dolby TrueHD audio",
    );
    expect(
      why(
        'http://x/videos/src/master.m3u8?VideoBitrate=19808000'
        '&TranscodeReasons=ContainerBitrateExceedsLimit',
      ),
      'Why: The bitrate is above the streaming limit',
    );
  });

  test('Live TV leads with the channel and has no File section', () {
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(StreamPlayMethod.directStream),
        mediaStreams: _streams,
        channel: '4.1 KTVU',
        program: 'Evening News',
        player: 'AetherEngine',
      ),
    );
    expect(lines.take(5), [
      '# Playback',
      'Channel: 4.1 KTVU',
      'Program: Evening News',
      'Play Method: Direct Stream [bold]',
      '(note) The server is repackaging the file without converting it.',
    ]);
    expect(lines, isNot(contains('# File')));
    // No subtitle was picked and the server named no default.
    expect(lines, isNot(contains('# Subtitles')));
  });

  test('a live channel that reports a 0×0 picture has no Resolution row', () {
    final lines = _lines(
      buildPlaybackInfoSections(
        l10n: _l10n,
        resolution: _resolution(StreamPlayMethod.directStream),
        mediaStreams: [
          {..._video, 'Width': 0, 'Height': 0},
          _audio,
        ],
        channel: '6 24/7 SpongeBob SquarePants',
      ),
    );
    expect(lines.where((line) => line.startsWith('Resolution')), isEmpty);
    expect(lines, contains('# Video'));
  });

  test('a download plays as Direct Play with its own note', () {
    final sections = buildPlaybackInfoSections(
      l10n: _l10n,
      resolution: null,
      mediaStreams: _streams,
      mediaSource: _source,
      offline: true,
    );
    expect(_lines(sections).take(3), [
      '# Playback',
      'Play Method: Direct Play [bold]',
      '(note) Playing a downloaded copy.',
    ]);
    // Technical goes out even with no rows, for tvOS to add Dropped Frames.
    expect(sections.last, {
      'title': 'Technical',
      'id': 'technical',
      'rows': <Map<String, dynamic>>[],
    });
  });
}
