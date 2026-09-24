import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

// Media3 plays audio on a player that needs no view, which is what lets a car
// or the lock screen start playback with the app closed. It picks that player
// by the payload's mediaType, so music has to say audio even when its streams
// look like video.

class _CapturingBackend extends Fake implements PlayerBackend {
  Map<String, dynamic>? payload;

  @override
  Duration get position => Duration.zero;
  @override
  Duration get duration => const Duration(minutes: 4);
  @override
  Duration get buffer => Duration.zero;
  @override
  bool get isPlaying => false;
  @override
  bool get isBuffering => false;
  @override
  double get playbackSpeed => 1.0;
  @override
  Stream<Duration> get positionStream => const Stream<Duration>.empty();
  @override
  Stream<Duration> get durationStream => const Stream<Duration>.empty();
  @override
  Stream<Duration> get bufferStream => const Stream<Duration>.empty();
  @override
  Stream<bool> get playingStream => const Stream<bool>.empty();
  @override
  Stream<bool> get bufferingStream => const Stream<bool>.empty();
  @override
  Stream<bool> get completedStream => const Stream<bool>.empty();
  @override
  Stream<Map<String, dynamic>>? get errorStream => null;
  @override
  bool get supportsRuntimeTrackSelection => true;
  @override
  bool get canRenderBitmapSubtitles => true;
  @override
  bool get requiresStartupMediaReadyCheck => false;
  @override
  bool get nativelyHandlesStartPosition => true;
  @override
  bool get demuxesEmbeddedSubtitles => true;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) => <String, dynamic>{};

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    payload = mediaItem as Map<String, dynamic>;
  }

  @override
  Future<void> stop() async {}
  @override
  Future<void> setSubtitleTrack(
    int trackId, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  }) async {}
  @override
  Future<void> disableSubtitleTrack() async {}
  @override
  Future<void> waitForTracksReady() async {}
  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {}
  @override
  Future<void> setAudioTrack(int trackId) async {}
  @override
  Future<void> addExternalSubtitle(
    String url, {
    String? title,
    String? language,
    String? codec,
  }) async {}
  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}
  @override
  void dispose() {}
}

class _StubResolver extends MediaStreamResolver {
  _StubResolver(this.mediaStreams);

  final List<Map<String, dynamic>> mediaStreams;

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
  }) async => StreamResolutionResult(
    streamUrl: 'http://server.test/stream',
    mediaSourceId: 'source-1',
    playSessionId: 'session-1',
    playMethod: StreamPlayMethod.directPlay,
    mediaStreams: mediaStreams,
    mediaType: MediaStreamResolver.detectMediaType(mediaStreams),
  );
}

// An audio item that still lists a video stream. Jellyfin reports an audio
// item's cover art as EmbeddedImage, so this guards any source that doesn't.
const _audioWithVideoStream = <Map<String, dynamic>>[
  <String, dynamic>{'Type': 'Audio', 'Index': 0, 'Codec': 'mp3'},
  <String, dynamic>{'Type': 'Video', 'Index': 1, 'Codec': 'mjpeg'},
];

const _film = <Map<String, dynamic>>[
  <String, dynamic>{'Type': 'Video', 'Index': 0, 'Codec': 'hevc'},
  <String, dynamic>{'Type': 'Audio', 'Index': 1, 'Codec': 'eac3'},
];

Future<String?> _mediaTypeFor(
  Map<String, dynamic> item,
  List<Map<String, dynamic>> streams,
) async {
  final backend = _CapturingBackend();
  final manager = PlaybackManager()
    ..setBackend(backend)
    ..setResolver(_StubResolver(streams));
  await manager.playItems(<dynamic>[item]);
  return backend.payload?['mediaType'] as String?;
}

void main() {
  test('a song with a video stream still plays as audio', () async {
    expect(
      await _mediaTypeFor(
        <String, dynamic>{'Id': 'song', 'Type': 'Audio'},
        _audioWithVideoStream,
      ),
      'audio',
    );
  });

  test('an audiobook plays as audio', () async {
    expect(
      await _mediaTypeFor(
        <String, dynamic>{'Id': 'book', 'Type': 'AudioBook'},
        _audioWithVideoStream,
      ),
      'audio',
    );
  });

  test('an item whose media type is audio plays as audio', () async {
    expect(
      await _mediaTypeFor(
        <String, dynamic>{'Id': 'clip', 'Type': 'Video', 'MediaType': 'Audio'},
        _audioWithVideoStream,
      ),
      'audio',
    );
  });

  test('a film still plays as video', () async {
    expect(
      await _mediaTypeFor(
        <String, dynamic>{'Id': 'film', 'Type': 'Movie'},
        _film,
      ),
      'video',
    );
  });

  test('a downloaded song plays as audio from its saved metadata', () async {
    const url = '/downloads/song.mp3';
    final backend = _CapturingBackend();
    final manager = PlaybackManager()
      ..setBackend(backend)
      ..setOfflineMetadataByUrl(<String, Map<String, dynamic>>{
        url: <String, dynamic>{
          'Type': 'Audio',
          'MediaStreams': _audioWithVideoStream,
        },
      });
    await manager.playOffline(url);
    expect(backend.payload?['mediaType'], 'audio');
  });

  test('a downloaded film still plays as video', () async {
    const url = '/downloads/film.mkv';
    final backend = _CapturingBackend();
    final manager = PlaybackManager()
      ..setBackend(backend)
      ..setOfflineMetadataByUrl(<String, Map<String, dynamic>>{
        url: <String, dynamic>{'Type': 'Movie', 'MediaStreams': _film},
      });
    await manager.playOffline(url);
    expect(backend.payload?['mediaType'], 'video');
  });
}
