import 'package:flutter_test/flutter_test.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:server_core/server_core.dart';

JellyfinStreamRoute route({
  PlayMethod? serverPlayMethod,
  bool supportsDirectPlay = true,
  bool supportsDirectStream = true,
  bool hasDirectStreamUrl = true,
  bool supportsTranscoding = true,
  bool hasTranscodingUrl = true,
  bool enableDirectPlay = true,
  bool isAudio = false,
  List<String> transcodingReasons = const [],
  int? bitrate,
  int? maxStreamingBitrate,
}) {
  return JellyfinMediaStreamResolver.chooseStreamRoute(
    serverPlayMethod: serverPlayMethod,
    supportsDirectPlay: supportsDirectPlay,
    supportsDirectStream: supportsDirectStream,
    hasDirectStreamUrl: hasDirectStreamUrl,
    supportsTranscoding: supportsTranscoding,
    hasTranscodingUrl: hasTranscodingUrl,
    enableDirectPlay: enableDirectPlay,
    isAudio: isAudio,
    transcodingReasons: transcodingReasons,
    bitrate: bitrate,
    maxStreamingBitrate: maxStreamingBitrate,
  );
}

void main() {
  group('chooseStreamRoute', () {
    test('a plain direct-playable source still direct plays', () {
      expect(route(), JellyfinStreamRoute.directPlay);
      expect(route(isAudio: true), JellyfinStreamRoute.audioDirectPlay);
      expect(
        route(serverPlayMethod: PlayMethod.directPlay),
        JellyfinStreamRoute.directPlay,
      );
    });

    test('a forced transcode never resolves to direct play, even when the '
        'server response keeps supportsDirectPlay set', () {
      const directPlayRoutes = <JellyfinStreamRoute>{
        JellyfinStreamRoute.directPlay,
        JellyfinStreamRoute.audioDirectPlay,
      };
      expect(
        directPlayRoutes.contains(route(enableDirectPlay: false)),
        isFalse,
      );
      expect(
        directPlayRoutes.contains(
          route(enableDirectPlay: false, isAudio: true),
        ),
        isFalse,
      );
      expect(
        directPlayRoutes.contains(
          route(
            enableDirectPlay: false,
            serverPlayMethod: PlayMethod.directPlay,
          ),
        ),
        isFalse,
      );
      // The manager also disables direct stream on a forced transcode, which
      // the server honors by omitting the remux URL, so the route lands on
      // the transcode.
      expect(
        route(enableDirectPlay: false, hasDirectStreamUrl: false),
        JellyfinStreamRoute.transcode,
      );
    });

    test('a video re-encode reason demotes direct play and direct stream, '
        'since a remux copies the very stream that needs re-encoding', () {
      expect(
        route(transcodingReasons: const ['VideoCodecNotSupported']),
        JellyfinStreamRoute.transcode,
      );
      expect(
        route(
          serverPlayMethod: PlayMethod.directStream,
          transcodingReasons: const ['VideoRangeTypeNotSupported'],
        ),
        JellyfinStreamRoute.transcode,
      );
    });

    test(
      'a source over the bitrate cap transcodes instead of direct playing',
      () {
        expect(
          route(bitrate: 80000000, maxStreamingBitrate: 20000000),
          JellyfinStreamRoute.transcode,
        );
        expect(
          route(bitrate: 20000000, maxStreamingBitrate: 80000000),
          JellyfinStreamRoute.directPlay,
        );
      },
    );

    test('audio-only reasons leave direct play alone', () {
      expect(
        route(transcodingReasons: const ['AudioCodecNotSupported']),
        JellyfinStreamRoute.directPlay,
      );
    });

    test('the server verdict wins when it is compatible with the gates', () {
      expect(
        route(serverPlayMethod: PlayMethod.directStream),
        JellyfinStreamRoute.directStream,
      );
      expect(
        route(serverPlayMethod: PlayMethod.transcode),
        JellyfinStreamRoute.transcode,
      );
    });

    test('nothing resolvable still lands on the terminal direct play instead '
        'of failing', () {
      expect(
        route(
          enableDirectPlay: false,
          supportsDirectStream: false,
          hasTranscodingUrl: false,
        ),
        JellyfinStreamRoute.terminalDirectPlay,
      );
    });
  });
}
