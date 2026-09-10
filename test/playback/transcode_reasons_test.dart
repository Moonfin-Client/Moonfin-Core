import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

const _profile = <String, dynamic>{
  'DirectPlayProfiles': [
    {
      'Type': 'Video',
      'Container': 'mkv,mp4,ts',
      'VideoCodec': 'h264,hevc',
      'AudioCodec': 'aac,ac3',
    },
    {
      'Type': 'Audio',
      'Container': 'flac,mp3',
      'AudioCodec': 'flac,mp3',
    },
  ],
};

const _videoDirectPlay = [
  {
    'Type': 'Video',
    'Container': 'mkv,mp4,ts',
    'VideoCodec': 'h264,hevc',
    'AudioCodec': 'aac,ac3',
  },
];

Map<String, dynamic> _withSubtitleProfiles(
  List<Map<String, String>> profiles,
) => {'DirectPlayProfiles': _videoDirectPlay, 'SubtitleProfiles': profiles};

// Encode is the server burning the frames in, so a PGS stream can only reach
// the client through a transcode.
final _subtitleProfileEncodeOnly = _withSubtitleProfiles(const [
  {'Format': 'vtt', 'Method': 'Embed'},
  {'Format': 'vtt', 'Method': 'External'},
  {'Format': 'srt', 'Method': 'Embed'},
  {'Format': 'srt', 'Method': 'External'},
  {'Format': 'pgs', 'Method': 'Encode'},
  {'Format': 'pgssub', 'Method': 'Encode'},
]);

final _subtitleProfilePgsEmbed = _withSubtitleProfiles(const [
  {'Format': 'pgs', 'Method': 'Embed'},
  {'Format': 'pgs', 'Method': 'Encode'},
  {'Format': 'pgssub', 'Method': 'Embed'},
  {'Format': 'pgssub', 'Method': 'Encode'},
]);

final _subtitleProfileNoPgs = _withSubtitleProfiles(const [
  {'Format': 'vtt', 'Method': 'Embed'},
  {'Format': 'srt', 'Method': 'Embed'},
]);

List<Map<String, dynamic>> _streams({
  String? videoCodec = 'h264',
  String audioCodec = 'aac',
  int audioIndex = 1,
  String? subtitleCodec,
  int subtitleIndex = 4,
}) => [
  if (videoCodec != null) {'Type': 'Video', 'Index': 0, 'Codec': videoCodec},
  {'Type': 'Audio', 'Index': audioIndex, 'Codec': audioCodec},
  if (subtitleCodec != null) {
    'Type': 'Subtitle', 'Index': subtitleIndex, 'Codec': subtitleCodec
  },
];

void main() {
  group('mergeTranscodeReasons', () {
    test('leaves a direct play alone', () {
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.directPlay,
          mediaStreams: _streams(videoCodec: 'vp9'),
          container: 'avi',
          deviceProfile: _profile,
        ),
        isEmpty,
      );
    });

    test('keeps what the server said and adds nothing it already covered', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        serverReasons: const ['VideoCodecNotSupported'],
        mediaStreams: _streams(videoCodec: 'vp9'),
        container: 'mkv',
        deviceProfile: _profile,
      );
      expect(reasons, ['VideoCodecNotSupported']);
    });

    test('takes another spelling of the ceiling as already said', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        serverReasons: const ['ContainerBitrateExceedsLimit'],
        mediaStreams: _streams(),
        container: 'mkv',
        sourceBitrate: 20000000,
        maxStreamingBitrate: 10000000,
        deviceProfile: _profile,
      );
      expect(reasons, ['ContainerBitrateExceedsLimit']);
    });

    test('names the codecs and container a silent server left out', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        mediaStreams: _streams(videoCodec: 'vp9', audioCodec: 'dts'),
        container: 'avi',
        deviceProfile: _profile,
      );
      expect(
        reasons,
        containsAll([
          'ContainerNotSupported',
          'VideoCodecNotSupported',
          'AudioCodecNotSupported',
        ]),
      );
    });

    test('names a bitrate over the requested ceiling', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        mediaStreams: _streams(),
        container: 'mkv',
        sourceBitrate: 20000000,
        maxStreamingBitrate: 10000000,
        deviceProfile: _profile,
      );
      expect(reasons, ['VideoBitrateNotSupported']);
    });

    test('stays quiet when everything the profile covers is allowed', () {
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          mediaStreams: _streams(),
          container: 'mkv',
          sourceBitrate: 5000000,
          maxStreamingBitrate: 10000000,
          deviceProfile: _profile,
        ),
        isEmpty,
      );
    });

    test('reads an audio source against the audio profile', () {
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          mediaStreams: _streams(videoCodec: null, audioCodec: 'flac'),
          container: 'flac',
          deviceProfile: _profile,
        ),
        isEmpty,
      );
    });

    test('judges the audio track the server worked from', () {
      final streams = [
        {'Type': 'Video', 'Index': 0, 'Codec': 'h264'},
        {'Type': 'Audio', 'Index': 1, 'Codec': 'aac'},
        {'Type': 'Audio', 'Index': 2, 'Codec': 'dts'},
      ];
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          mediaStreams: streams,
          container: 'mkv',
          audioStreamIndex: 2,
          deviceProfile: _profile,
        ),
        ['AudioCodecNotSupported'],
      );
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          mediaStreams: streams,
          container: 'mkv',
          audioStreamIndex: 1,
          deviceProfile: _profile,
        ),
        isEmpty,
      );
    });

    test('judges only the bitrate when the streams are unknown', () {
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          container: 'avi',
          sourceBitrate: 20000000,
          maxStreamingBitrate: 10000000,
          deviceProfile: _profile,
        ),
        ['VideoBitrateNotSupported'],
      );
    });

    test('says nothing without a profile to hold anything against', () {
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          mediaStreams: _streams(videoCodec: 'vp9'),
          container: 'avi',
        ),
        isEmpty,
      );
    });

    test('subtitle: names PGS when the profile can only burn it in', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        mediaStreams: _streams(
          videoCodec: 'hevc',
          subtitleCodec: 'pgssub',
        ),
        container: 'mkv',
        subtitleStreamIndex: 4,
        deviceProfile: _subtitleProfileEncodeOnly,
      );
      expect(reasons, ['SubtitleCodecNotSupported']);
    });

    test('subtitle: quiet when the profile already carries PGS direct', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        mediaStreams: _streams(
          videoCodec: 'hevc',
          subtitleCodec: 'pgssub',
        ),
        container: 'mkv',
        subtitleStreamIndex: 4,
        sourceBitrate: 20000000,
        maxStreamingBitrate: 10000000,
        deviceProfile: _subtitleProfilePgsEmbed,
      );
      expect(reasons, ['VideoBitrateNotSupported']);
    });

    test('subtitle: names PGS when the profile never lists it', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        mediaStreams: _streams(
          videoCodec: 'hevc',
          subtitleCodec: 'pgssub',
        ),
        container: 'mkv',
        subtitleStreamIndex: 4,
        deviceProfile: _subtitleProfileNoPgs,
      );
      expect(reasons, ['SubtitleCodecNotSupported']);
    });

    test('subtitle: stays quiet when no subtitle stream is picked', () {
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          mediaStreams: _streams(videoCodec: 'h264'),
          container: 'mkv',
          deviceProfile: _subtitleProfileEncodeOnly,
        ),
        isEmpty,
      );
    });

    test('subtitle: quiet when the profile can carry the stream directly', () {
      expect(
        mergeTranscodeReasons(
          playMethod: StreamPlayMethod.transcode,
          mediaStreams: _streams(
            videoCodec: 'h264',
            subtitleCodec: 'srt',
          ),
          container: 'mkv',
          subtitleStreamIndex: 4,
          deviceProfile: _subtitleProfileEncodeOnly,
        ),
        isEmpty,
      );
    });

    test('subtitle: does not repeat a reason the server already sent', () {
      final reasons = mergeTranscodeReasons(
        playMethod: StreamPlayMethod.transcode,
        serverReasons: const ['SubtitleCodecNotSupported'],
        mediaStreams: _streams(
          videoCodec: 'hevc',
          subtitleCodec: 'pgssub',
        ),
        container: 'mkv',
        subtitleStreamIndex: 4,
        deviceProfile: _subtitleProfileEncodeOnly,
      );
      expect(reasons, ['SubtitleCodecNotSupported']);
    });
  });

  group('resolveDirectPlayFailureDetails', () {
    test('preserves server reasons', () {
      final details = resolveDirectPlayFailureDetails(
        serverReasons: const ['VideoCodecNotSupported', 'DirectPlayError'],
      );
      expect(details.map((d) => d.reason), ['VideoCodecNotSupported', 'DirectPlayError']);
    });

    test('detects bitrate limit with exact bitrate values', () {
      final details = resolveDirectPlayFailureDetails(
        sourceBitrate: 25000000,
        maxStreamingBitrate: 10000000,
        container: 'mkv',
        deviceProfile: _profile,
      );
      expect(details.first.reason, 'VideoBitrateExceedsLimit');
      expect(details.first.sourceBitrate, 25000000);
      expect(details.first.maxStreamingBitrate, 10000000);
    });

    test('detects unsupported container', () {
      final details = resolveDirectPlayFailureDetails(
        container: 'avi',
        deviceProfile: _profile,
      );
      expect(details.any((d) => d.reason == 'ContainerNotSupported' && d.container == 'avi'), isTrue);
    });

    test('detects unsupported video and audio codecs with identifiers', () {
      final details = resolveDirectPlayFailureDetails(
        container: 'mkv',
        mediaStreams: _streams(videoCodec: 'vp9', audioCodec: 'truehd'),
        deviceProfile: _profile,
      );
      expect(details.any((d) => d.reason == 'VideoCodecNotSupported' && d.codec == 'vp9'), isTrue);
      expect(details.any((d) => d.reason == 'AudioCodecNotSupported' && d.codec == 'truehd'), isTrue);
    });

    test('detects unsupported VideoRangeType from CodecProfiles', () {
      final profileWithDoviVeto = <String, dynamic>{
        'DirectPlayProfiles': _videoDirectPlay,
        'CodecProfiles': [
          {
            'Type': 'Video',
            'Codec': 'hevc',
            'Conditions': [
              {
                'Property': 'VideoRangeType',
                'Condition': 'NotEquals',
                'Value': 'DOVI|DOVI_WITH_HDR10',
              },
            ],
          },
        ],
      };

      final streams = [
        {'Type': 'Video', 'Index': 0, 'Codec': 'hevc', 'VideoRangeType': 'DOVI'},
        {'Type': 'Audio', 'Index': 1, 'Codec': 'aac'},
      ];

      final details = resolveDirectPlayFailureDetails(
        container: 'mkv',
        mediaStreams: streams,
        deviceProfile: profileWithDoviVeto,
      );

      expect(details.any((d) => d.reason == 'VideoRangeTypeNotSupported' && d.rangeType == 'DOVI'), isTrue);
    });

    test('detects unsupported VideoProfile from CodecProfiles', () {
      final profileWithAvcHigh10Veto = <String, dynamic>{
        'DirectPlayProfiles': _videoDirectPlay,
        'CodecProfiles': [
          {
            'Type': 'Video',
            'Codec': 'h264',
            'Conditions': [
              {
                'Property': 'VideoProfile',
                'Condition': 'EqualsAny',
                'Value': 'high|main|baseline',
              },
            ],
          },
        ],
      };

      final streams = [
        {'Type': 'Video', 'Index': 0, 'Codec': 'h264', 'Profile': 'High 10'},
        {'Type': 'Audio', 'Index': 1, 'Codec': 'aac'},
      ];

      final details = resolveDirectPlayFailureDetails(
        container: 'mkv',
        mediaStreams: streams,
        deviceProfile: profileWithAvcHigh10Veto,
      );

      expect(details.any((d) => d.reason == 'VideoProfileNotSupported' && d.videoProfile == 'high 10'), isTrue);
    });

    test('detects audio channels cap from CodecProfiles', () {
      final profileWithStereoCap = <String, dynamic>{
        'DirectPlayProfiles': _videoDirectPlay,
        'CodecProfiles': [
          {
            'Type': 'VideoAudio',
            'Codec': 'aac',
            'Conditions': [
              {
                'Property': 'AudioChannels',
                'Condition': 'LessThanEqual',
                'Value': '2',
              },
            ],
          },
        ],
      };

      final streams = [
        {'Type': 'Video', 'Index': 0, 'Codec': 'h264'},
        {'Type': 'Audio', 'Index': 1, 'Codec': 'aac', 'Channels': 6},
      ];

      final details = resolveDirectPlayFailureDetails(
        container: 'mkv',
        mediaStreams: streams,
        deviceProfile: profileWithStereoCap,
      );

      expect(details.any((d) => d.reason == 'AudioChannelsNotSupported' && d.audioChannels == 6), isTrue);
    });

    test('detects subtitle burn-in requirement with codec', () {
      final details = resolveDirectPlayFailureDetails(
        container: 'mkv',
        mediaStreams: _streams(videoCodec: 'hevc', subtitleCodec: 'pgssub', subtitleIndex: 4),
        subtitleStreamIndex: 4,
        deviceProfile: _subtitleProfileEncodeOnly,
      );

      expect(details.any((d) => d.reason == 'SubtitleCodecNotSupported' && d.codec == 'pgssub'), isTrue);
    });
  });
}
