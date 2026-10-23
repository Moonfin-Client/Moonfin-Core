import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/local_first_media_stream_resolver.dart';
import 'package:moonfin/playback/offline_stream_resolver.dart';
import 'package:playback_core/playback_core.dart';

class _ServerResolver extends MediaStreamResolver {
  @override
  Future<StreamResolutionResult> resolve(
    dynamic mediaItem, {
    Map<String, dynamic>? deviceProfile,
    int? maxStreamingBitrate,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startTimeTicks,
    String? mediaSourceId,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
  }) async => const StreamResolutionResult(
    streamUrl: 'https://server/movie',
    mediaSourceId: 'movie',
    playMethod: StreamPlayMethod.directPlay,
  );
}

class _Downloads extends Fake implements OfflineStreamResolver {
  @override
  Future<OfflineStreamResult?> resolve(String itemId) async =>
      const OfflineStreamResult(
        url: '/downloads/movie.mp4',
        mediaStreams: [],
        mediaSourceId: 'movie',
        isTranscoded: true,
      );
}

void main() {
  const movie = {'Id': 'movie'};

  Future<StreamResolutionResult> resolveWith({required bool fromServer}) =>
      LocalFirstMediaStreamResolver(
        inner: _ServerResolver(),
        offline: _Downloads(),
        streamFromServer: () => fromServer,
      ).resolve(movie);

  test('a downloaded item plays the download by default', () async {
    final result = await resolveWith(fromServer: false);
    expect(result.isLocalMedia, isTrue);
    expect(result.streamUrl, '/downloads/movie.mp4');
  });

  test('play from server skips the download while the server is up', () async {
    final result = await resolveWith(fromServer: true);
    expect(result.isLocalMedia, isFalse);
    expect(result.streamUrl, 'https://server/movie');
  });
}
