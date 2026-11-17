import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/cast/dlna_provider.dart';
import 'package:playback_core/playback_core.dart';

StreamResolutionResult _resolution(
  String url, {
  String? container,
  String mediaType = 'video',
}) => StreamResolutionResult(
  streamUrl: url,
  mediaSourceId: 'source',
  playMethod: StreamPlayMethod.directPlay,
  container: container,
  mediaType: mediaType,
);

void main() {
  group('dlnaMimeType', () {
    // An LG renderer refuses SetAVTransportURI (Invalid Args) when the
    // metadata names no MIME type, and Silo's stream paths carry no extension.
    test('names an original by its container', () {
      expect(
        dlnaMimeType(_resolution('http://silo/api/v2/stream/s1', container: 'mkv')),
        'video/x-matroska',
      );
      expect(
        dlnaMimeType(_resolution('http://silo/api/v2/stream/s1', container: 'mp4,m4v')),
        'video/mp4',
      );
    });

    test('names HLS by its playlist path or container', () {
      expect(
        dlnaMimeType(_resolution('http://jf/videos/1/master.m3u8?a=b', container: 'ts')),
        'application/vnd.apple.mpegurl',
      );
      expect(
        dlnaMimeType(_resolution('http://silo/hls/s1', container: 'hls')),
        'application/vnd.apple.mpegurl',
      );
    });

    test('falls back by media type', () {
      expect(dlnaMimeType(_resolution('http://x/a')), 'video/*');
      expect(
        dlnaMimeType(_resolution('http://x/a', container: 'mp3', mediaType: 'Audio')),
        'audio/mpeg',
      );
      expect(
        dlnaMimeType(_resolution('http://x/a', mediaType: 'Audio')),
        'audio/*',
      );
    });
  });
}
