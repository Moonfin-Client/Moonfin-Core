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
}
