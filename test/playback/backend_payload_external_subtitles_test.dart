import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

/// A transcoded download carries no embedded subtitle streams, so its media
/// streams describe the sidecars and nothing else.
const _transcodedDownloadStreams = <Map<String, dynamic>>[
  <String, dynamic>{
    'Type': 'Subtitle',
    'Index': 3,
    'IsExternal': true,
    'Codec': 'ass',
  },
  <String, dynamic>{
    'Type': 'Subtitle',
    'Index': 4,
    'IsExternal': true,
    'Codec': 'ass',
  },
];

class _CapturingBackend extends Fake implements PlayerBackend {
  Map<String, dynamic>? payload;

  @override
  Duration get position => Duration.zero;
  @override
  Duration get duration => const Duration(minutes: 20);
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
  _StubResolver({required this.mediaStreams, required this.externalSubtitles});

  final List<Map<String, dynamic>> mediaStreams;
  final List<ExternalSubtitle> externalSubtitles;

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
    streamUrl: '/downloads/movie.mp4',
    mediaSourceId: 'source-1',
    playSessionId: 'session-1',
    playMethod: StreamPlayMethod.directPlay,
    mediaStreams: mediaStreams,
    externalSubtitles: externalSubtitles,
    isLocalMedia: true,
  );
}

Future<Map<String, dynamic>> _payloadFor({
  required List<Map<String, dynamic>> mediaStreams,
  required List<ExternalSubtitle> externalSubtitles,
}) async {
  final backend = _CapturingBackend();
  final manager = PlaybackManager()
    ..setBackend(backend)
    ..setResolver(
      _StubResolver(
        mediaStreams: mediaStreams,
        externalSubtitles: externalSubtitles,
      ),
    );
  await manager.playItems(<dynamic>[
    <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
  ]);
  return backend.payload!;
}

List<Map<String, dynamic>> _declared(Map<String, dynamic> payload) =>
    ((payload['externalSubtitles'] as List?) ?? const [])
        .cast<Map<String, dynamic>>();

void main() {
  test('a transcoded download declares its sidecars with the source', () async {
    final payload = await _payloadFor(
      mediaStreams: _transcodedDownloadStreams,
      externalSubtitles: const [
        ExternalSubtitle(
          deliveryUrl: '/downloads/movie_sub_3.ass',
          codec: 'ass',
          language: 'eng',
          streamIndex: 3,
        ),
        ExternalSubtitle(
          deliveryUrl: '/downloads/movie_sub_4.ass',
          codec: 'ass',
          language: 'jpn',
          streamIndex: 4,
        ),
      ],
    );

    final declared = _declared(payload);
    expect(declared, hasLength(2));
    expect(declared[0]['url'], '/downloads/movie_sub_3.ass');
    expect(declared[0]['codec'], 'ass');
    expect(declared[0]['language'], 'eng');
    expect(declared[1]['url'], '/downloads/movie_sub_4.ass');
    expect(declared[1]['language'], 'jpn');
  });

  test('declared order is the order the ordinals are counted in', () async {
    final payload = await _payloadFor(
      mediaStreams: _transcodedDownloadStreams,
      externalSubtitles: const [
        ExternalSubtitle(
          deliveryUrl: '/downloads/movie_sub_3.ass',
          codec: 'ass',
          streamIndex: 3,
        ),
        ExternalSubtitle(
          deliveryUrl: '/downloads/movie_sub_4.ass',
          codec: 'ass',
          streamIndex: 4,
        ),
      ],
    );

    final expected = TrackOrdinalMapper.effectiveExternalSubtitles(
      mediaStreams: _transcodedDownloadStreams,
      externalSubtitles: const [
        ExternalSubtitle(
          deliveryUrl: '/downloads/movie_sub_3.ass',
          codec: 'ass',
          streamIndex: 3,
        ),
        ExternalSubtitle(
          deliveryUrl: '/downloads/movie_sub_4.ass',
          codec: 'ass',
          streamIndex: 4,
        ),
      ],
      embeddedStripped: false,
    ).map((s) => s.deliveryUrl).toList();

    expect(_declared(payload).map((s) => s['url']).toList(), expected);
  });

  test('a bitmap sidecar is left to the runtime path', () async {
    final payload = await _payloadFor(
      mediaStreams: const [
        <String, dynamic>{
          'Type': 'Subtitle',
          'Index': 3,
          'IsExternal': true,
          'Codec': 'pgssub',
        },
      ],
      externalSubtitles: const [
        ExternalSubtitle(
          deliveryUrl: '/downloads/movie_sub_3.sup',
          codec: 'pgssub',
          streamIndex: 3,
        ),
      ],
    );

    expect(payload.containsKey('externalSubtitles'), isFalse);
  });

  test('nothing is declared when the item has no sidecars', () async {
    final payload = await _payloadFor(
      mediaStreams: const [
        <String, dynamic>{'Type': 'Video', 'Index': 0},
        <String, dynamic>{'Type': 'Audio', 'Index': 1},
      ],
      externalSubtitles: const [],
    );

    expect(payload.containsKey('externalSubtitles'), isFalse);
  });

  test('a sidecar that duplicates an embedded stream is not declared', () async {
    final payload = await _payloadFor(
      mediaStreams: const [
        <String, dynamic>{'Type': 'Video', 'Index': 0},
        <String, dynamic>{'Type': 'Audio', 'Index': 1},
        <String, dynamic>{'Type': 'Subtitle', 'Index': 2, 'Codec': 'subrip'},
      ],
      externalSubtitles: const [
        ExternalSubtitle(
          deliveryUrl: 'http://server.test/sub2.srt',
          codec: 'srt',
          streamIndex: 2,
        ),
      ],
    );

    expect(payload.containsKey('externalSubtitles'), isFalse);
  });
}
