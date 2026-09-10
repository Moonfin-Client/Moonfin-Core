import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

StreamResolutionResult _result(
  String streamUrl, {
  StreamPlayMethod playMethod = StreamPlayMethod.transcode,
}) {
  return StreamResolutionResult(
    streamUrl: streamUrl,
    mediaSourceId: 'source',
    playMethod: playMethod,
  );
}

void main() {
  group('deliveredBitrate', () {
    test('direct play reports nothing so callers keep the source figure', () {
      final result = _result(
        'https://host/Videos/1/stream?static=true',
        playMethod: StreamPlayMethod.directPlay,
      );
      expect(result.deliveredBitrate, isNull);
    });

    test('adds the video and audio targets a transcode states', () {
      final result = _result(
        'https://host/videos/1/main.m3u8?VideoBitrate=4000000'
        '&AudioBitrate=128000',
      );
      expect(result.deliveredBitrate, 4128000);
    });

    test('a video only target still reports', () {
      final result = _result(
        'https://host/videos/1/main.m3u8?VideoBitrate=2000000',
      );
      expect(result.deliveredBitrate, 2000000);
    });

    test('falls back to the overall cap when the split is absent', () {
      final result = _result(
        'https://host/videos/1/main.m3u8?maxStreamingBitrate=3000000',
      );
      expect(result.deliveredBitrate, 3000000);
    });

    test('the split wins over the overall cap', () {
      final result = _result(
        'https://host/videos/1/main.m3u8?maxStreamingBitrate=9000000'
        '&VideoBitrate=4000000&AudioBitrate=128000',
      );
      expect(result.deliveredBitrate, 4128000);
    });

    test('parameter casing does not matter', () {
      final result = _result(
        'https://host/videos/1/main.m3u8?videobitrate=1500000'
        '&AUDIOBITRATE=64000',
      );
      expect(result.deliveredBitrate, 1564000);
    });

    test('a silent url reports nothing rather than zero', () {
      expect(
        _result('https://host/videos/1/main.m3u8').deliveredBitrate,
        isNull,
      );
      expect(
        _result(
          'https://host/videos/1/main.m3u8?VideoBitrate=0',
        ).deliveredBitrate,
        isNull,
      );
      expect(_result('not a url at all').deliveredBitrate, isNull);
    });
  });

  group('deliveredFormat', () {
    // Taken from a Jellyfin 10.11.11 PlaybackInfo answer, so the keys are the
    // ones a server really sends rather than the ones the docs imply.
    const real =
        'https://host/videos/1/master.m3u8?ApiKey=k&AudioBitrate=111819'
        '&AudioCodec=aac&SegmentContainer=ts&VideoBitrate=688181'
        '&VideoCodec=h264&TranscodeReasons=ContainerBitrateExceedsLimit';

    test('reads what the server said it would send', () {
      final format = _result(real).deliveredFormat!;
      expect(format.container, 'ts');
      expect(format.videoCodec, 'h264');
      expect(format.audioCodec, 'aac');
      expect(format.videoBitrate, 688181);
      expect(format.audioBitrate, 111819);
    });

    test('direct play reports nothing so callers keep the source', () {
      expect(
        _result(real, playMethod: StreamPlayMethod.directPlay).deliveredFormat,
        isNull,
      );
    });

    test('a progressive transcode names its container instead', () {
      final format = _result(
        'https://host/videos/1/stream.mkv?Container=mkv',
      ).deliveredFormat!;
      expect(format.container, 'mkv');
    });

    test('leaves out what the server did not state', () {
      final format = _result(
        'https://host/videos/1/main.m3u8?VideoCodec=hevc',
      ).deliveredFormat!;
      expect(format.videoCodec, 'hevc');
      expect(format.audioCodec, isNull);
      expect(format.container, isNull);
      expect(format.videoBitrate, isNull);
    });

    test('a silent url reports nothing at all', () {
      expect(
        _result('https://host/videos/1/main.m3u8').deliveredFormat,
        isNull,
      );
    });
  });
}
