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

List<Map<String, dynamic>> _streams({
  String? videoCodec = 'h264',
  String audioCodec = 'aac',
  int audioIndex = 1,
}) => [
  if (videoCodec != null) {'Type': 'Video', 'Index': 0, 'Codec': videoCodec},
  {'Type': 'Audio', 'Index': audioIndex, 'Codec': audioCodec},
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
  });
}
