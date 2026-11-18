import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/cast/dlna_provider.dart';
import 'package:playback_core/playback_core.dart';

StreamResolutionResult _resolution(
  String url, {
  String? container,
  String mediaType = 'video',
  StreamPlayMethod playMethod = StreamPlayMethod.directPlay,
}) => StreamResolutionResult(
  streamUrl: url,
  mediaSourceId: 'source',
  playMethod: playMethod,
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

    test('reads an ffprobe MP4 container list as MP4', () {
      expect(
        dlnaMimeType(_resolution('http://jf/a', container: 'mov,mp4,m4a,3gp,3g2,mj2')),
        'video/mp4',
      );
    });

    // Jellyfin and Emby keep the source's container on a transcode.
    test('names a transcoded audio stream MP3', () {
      expect(
        dlnaMimeType(
          _resolution(
            'http://jf/Audio/1/stream.mp3',
            container: 'm4a',
            mediaType: 'Audio',
            playMethod: StreamPlayMethod.transcode,
          ),
        ),
        'audio/mpeg',
      );
    });
  });

  group('dlnaFeatures', () {
    // Without the byte-seek flag an LG takes a Seek and stays where it is.
    test('lets a file sent as it is seek by byte range', () {
      expect(
        dlnaFeatures(_resolution('http://silo/api/v2/stream/s1', container: 'mkv')),
        contains('DLNA.ORG_OP=01'),
      );
    });

    test('claims nothing for a remux', () {
      expect(
        dlnaFeatures(
          _resolution(
            'http://jf/Videos/1/stream.mkv',
            container: 'mkv',
            playMethod: StreamPlayMethod.directStream,
          ),
        ),
        '*',
      );
    });

    test('claims nothing for a transcode or an HLS playlist', () {
      expect(
        dlnaFeatures(
          _resolution(
            'http://jf/Audio/1/stream.mp3',
            mediaType: 'Audio',
            playMethod: StreamPlayMethod.transcode,
          ),
        ),
        '*',
      );
      expect(
        dlnaFeatures(_resolution('http://silo/hls/master.m3u8', container: 'hls')),
        '*',
      );
    });
  });
}
