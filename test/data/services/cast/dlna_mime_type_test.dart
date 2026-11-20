import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/cast/dlna_provider.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

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

    // Emby names CT06's conversion mkv though it sends MPEG-TS.
    test('names a converted video MPEG-TS', () {
      expect(
        dlnaMimeType(
          _resolution(
            'http://emby/videos/54/stream.ts?a=b',
            container: 'mkv',
            playMethod: StreamPlayMethod.transcode,
          ),
        ),
        'video/mp2t',
      );
      expect(
        dlnaMimeType(
          _resolution(
            'http://emby/videos/54/stream.ts',
            container: 'mkv',
            playMethod: StreamPlayMethod.directStream,
          ),
        ),
        'video/mp2t',
      );
    });

    // Silo's progressive remux is a direct stream in its own container.
    test('keeps the container of a direct stream that isn\'t MPEG-TS', () {
      expect(
        dlnaMimeType(
          _resolution(
            'http://silo/api/v2/playback/s1/remux',
            container: 'mp4',
            playMethod: StreamPlayMethod.directStream,
          ),
        ),
        'video/mp4',
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
    // Emby's shape for CT04: no audio stream is flagged default, so the TV
    // plays the first.
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

    // Jellyfin and Emby set DefaultAudioStreamIndex from the user's language
    // preference, but the TV plays the track the file flags.
    test(
      'a preferred language that isn\'t the file\'s default needs the server',
      () {
        const anime = AggregatedItem(
          id: 'c',
          serverId: 's',
          rawData: {
            'MediaSources': [
              {
                'Id': 'src',
                'DefaultAudioStreamIndex': 2,
                'MediaStreams': [
                  {'Index': 1, 'Type': 'Audio', 'IsDefault': true},
                  {'Index': 2, 'Type': 'Audio'},
                ],
              },
            ],
          },
        );
        expect(
          dlnaNeedsServerTrackPick(
            anime,
            mediaSourceId: 'src',
            audioStreamIndex: 2,
          ),
          isTrue,
        );
        expect(
          dlnaNeedsServerTrackPick(
            anime,
            mediaSourceId: 'src',
            audioStreamIndex: 1,
          ),
          isFalse,
        );
      },
    );

    test('an unknown version among several needs the server', () {
      const versions = AggregatedItem(
        id: 'd',
        serverId: 's',
        rawData: {
          'MediaSources': [
            {
              'Id': 'v1',
              'MediaStreams': [
                {'Index': 1, 'Type': 'Audio'},
              ],
            },
            {
              'Id': 'v2',
              'MediaStreams': [
                {'Index': 2, 'Type': 'Audio'},
              ],
            },
          ],
        },
      );
      expect(dlnaNeedsServerTrackPick(versions, audioStreamIndex: 1), isTrue);
      expect(
        dlnaNeedsServerTrackPick(
          versions,
          mediaSourceId: 'v2',
          audioStreamIndex: 2,
        ),
        isFalse,
      );
    });

    test('reads an index stored as a double', () {
      const doubles = AggregatedItem(
        id: 'e',
        serverId: 's',
        rawData: {
          'MediaSources': [
            {
              'Id': 'src',
              'MediaStreams': [
                {'Index': 1.0, 'Type': 'Audio'},
              ],
            },
          ],
        },
      );
      expect(dlnaNeedsServerTrackPick(doubles, audioStreamIndex: 1), isFalse);
    });

    test('an unknown default keeps the server converting the pick', () {
      const bare = AggregatedItem(id: 'b', serverId: 's', rawData: {});
      expect(dlnaNeedsServerTrackPick(bare, audioStreamIndex: 1), isTrue);
    });
  });

  group('dlnaServerTimeline', () {
    // An LG can't seek in Emby's live MPEG-TS conversion (710/711), so it
    // starts at the resume point and a seek asks Emby for a new one.
    test('a Jellyfin or Emby conversion starts where it was asked', () {
      for (final type in [ServerType.emby, ServerType.jellyfin]) {
        for (final method in [
          StreamPlayMethod.transcode,
          StreamPlayMethod.directStream,
        ]) {
          final r = dlnaServerTimeline(
            type,
            _resolution('http://emby/videos/54/stream.ts', playMethod: method),
            600000000,
          );
          expect(r.seeksThroughServer, isTrue);
          expect(r.timelineOffset, const Duration(minutes: 1));
          // Emby answers the conversion URL without the start.
          expect(
            r.streamUrl,
            'http://emby/videos/54/stream.ts?StartTimeTicks=600000000',
          );
        }
      }
    });

    test('keeps a start the URL already has', () {
      final r = dlnaServerTimeline(
        ServerType.jellyfin,
        _resolution(
          'http://jf/videos/1/stream.ts?a=b&StartTimeTicks=600000000',
          playMethod: StreamPlayMethod.transcode,
        ),
        600000000,
      );
      expect(
        r.streamUrl,
        'http://jf/videos/1/stream.ts?a=b&StartTimeTicks=600000000',
      );
    });

    test('a conversion from the start has no offset', () {
      final r = dlnaServerTimeline(
        ServerType.emby,
        _resolution('http://emby/a.ts', playMethod: StreamPlayMethod.transcode),
        null,
      );
      expect(r.seeksThroughServer, isTrue);
      expect(r.timelineOffset, Duration.zero);
    });

    test('a file sent as it is, or another server, is left alone', () {
      final file = _resolution('http://emby/videos/52/stream?static=true');
      expect(dlnaServerTimeline(ServerType.emby, file, 600000000), same(file));
      final silo = _resolution(
        'http://silo/a',
        playMethod: StreamPlayMethod.directStream,
      );
      expect(dlnaServerTimeline(ServerType.silo, silo, 600000000), same(silo));
    });

    test('a Live TV conversion keeps its own timeline', () {
      // A channel's conversion can come without a live stream id or a
      // /LiveTv/ path, so the item decides.
      final live = _resolution(
        'http://jf/videos/7/stream.ts',
        playMethod: StreamPlayMethod.transcode,
      );
      expect(
        dlnaServerTimeline(ServerType.jellyfin, live, 600000000, liveTv: true),
        same(live),
      );
    });
  });
}
