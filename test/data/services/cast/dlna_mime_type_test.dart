import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
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
        dlnaMimeType(
          _resolution('http://silo/api/v2/stream/s1', container: 'mkv'),
        ),
        'video/x-matroska',
      );
      expect(
        dlnaMimeType(
          _resolution('http://silo/api/v2/stream/s1', container: 'mp4,m4v'),
        ),
        'video/mp4',
      );
    });

    test('names HLS by its playlist path or container', () {
      expect(
        dlnaMimeType(
          _resolution('http://jf/videos/1/master.m3u8?a=b', container: 'ts'),
        ),
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
        dlnaMimeType(
          _resolution('http://x/a', container: 'mp3', mediaType: 'Audio'),
        ),
        'audio/mpeg',
      );
      expect(
        dlnaMimeType(_resolution('http://x/a', mediaType: 'Audio')),
        'audio/*',
      );
    });

    test('reads an ffprobe MP4 container list as MP4', () {
      expect(
        dlnaMimeType(
          _resolution('http://jf/a', container: 'mov,mp4,m4a,3gp,3g2,mj2'),
        ),
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
        dlnaFeatures(
          _resolution('http://silo/api/v2/stream/s1', container: 'mkv'),
        ),
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
        dlnaFeatures(
          _resolution('http://silo/hls/master.m3u8', container: 'hls'),
        ),
        '*',
      );
    });
  });

  group('dlnaNeedsServerTrackPick', () {
    // Emby's shape for CT04: the audio stream isn't flagged default, the
    // source names it.
    const item = AggregatedItem(
      id: '52',
      serverId: 'emby',
      rawData: {
        'MediaSources': [
          {
            'Id': 'mediasource_52',
            'DefaultAudioStreamIndex': 1,
            'MediaStreams': [
              {'Index': 0, 'Type': 'Video'},
              {'Index': 1, 'Type': 'Audio', 'IsDefault': false},
              {'Index': 2, 'Type': 'Audio', 'IsDefault': false},
            ],
          },
        ],
      },
    );

    // The cast sheet passes the default audio track and subtitle -1, which
    // forced every Emby cast to HLS.
    test('the default audio track and no subtitle play the file', () {
      expect(
        dlnaNeedsServerTrackPick(
          item,
          mediaSourceId: 'mediasource_52',
          audioStreamIndex: 1,
          subtitleStreamIndex: -1,
        ),
        isFalse,
      );
      expect(dlnaNeedsServerTrackPick(item), isFalse);
    });

    test('another audio track or a subtitle needs the server', () {
      expect(
        dlnaNeedsServerTrackPick(
          item,
          mediaSourceId: 'mediasource_52',
          audioStreamIndex: 2,
        ),
        isTrue,
      );
      expect(
        dlnaNeedsServerTrackPick(
          item,
          mediaSourceId: 'mediasource_52',
          subtitleStreamIndex: 3,
        ),
        isTrue,
      );
    });

    test('falls back to the stream flagged default, then the first audio', () {
      const flagged = AggregatedItem(
        id: 'a',
        serverId: 's',
        rawData: {
          'MediaSources': [
            {
              'Id': 'src',
              'MediaStreams': [
                {'Index': 1, 'Type': 'Audio'},
                {'Index': 2, 'Type': 'Audio', 'IsDefault': true},
              ],
            },
          ],
        },
      );
      expect(dlnaNeedsServerTrackPick(flagged, audioStreamIndex: 2), isFalse);
      expect(dlnaNeedsServerTrackPick(flagged, audioStreamIndex: 1), isTrue);
    });

    test('an unknown default keeps the server converting the pick', () {
      const bare = AggregatedItem(id: 'b', serverId: 's', rawData: {});
      expect(dlnaNeedsServerTrackPick(bare, audioStreamIndex: 1), isTrue);
    });
  });
}
