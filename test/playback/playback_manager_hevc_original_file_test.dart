import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  _TestBackend({required this.hevcFromFileOnly});

  final bool hevcFromFileOnly;

  @override
  bool get decodesHevcOnlyFromOriginalFile => hevcFromFileOnly;
  @override
  Duration get position => Duration.zero;
  @override
  Duration get duration => const Duration(minutes: 30);
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
  }) async {}
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

/// Answers like a server that copies the video into HLS whenever it may
/// transcode, and hands back the original file when it may not.
class _TestResolver extends MediaStreamResolver {
  _TestResolver({required this.videoCodec, required this.reasons});

  final String videoCodec;
  final List<String> reasons;
  final List<bool> transcodingAllowed = <bool>[];

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
  }) async {
    final transcode = enableTranscoding && enableDirectStream;
    transcodingAllowed.add(transcode);
    return StreamResolutionResult(
      streamUrl: transcode
          ? 'https://example.test/master.m3u8'
          : 'https://example.test/stream?Static=true',
      mediaSourceId: 'source-1',
      playSessionId: 'session-${transcodingAllowed.length}',
      playMethod: transcode
          ? StreamPlayMethod.transcode
          : StreamPlayMethod.directPlay,
      transcodingReasons: transcode ? reasons : const [],
      mediaStreams: <Map<String, dynamic>>[
        <String, dynamic>{'Type': 'Video', 'Index': 0, 'Codec': videoCodec},
      ],
    );
  }
}

const _movie = <String, dynamic>{'Id': 'movie-1', 'Type': 'Movie'};

Future<List<bool>> _play(
  WidgetTester tester, {
  required bool hevcFromFileOnly,
  String videoCodec = 'hevc',
  List<String> reasons = const ['AudioCodecNotSupported'],
}) async {
  final resolver = _TestResolver(videoCodec: videoCodec, reasons: reasons);
  final manager = PlaybackManager()
    ..setBackend(_TestBackend(hevcFromFileOnly: hevcFromFileOnly))
    ..setResolver(resolver);
  await manager.playItems(<dynamic>[_movie]);
  await tester.pump();
  manager.dispose();
  return resolver.transcodingAllowed;
}

void main() {
  testWidgets('an HLS copy of HEVC is swapped for the original file', (
    tester,
  ) async {
    expect(await _play(tester, hevcFromFileOnly: true), <bool>[true, false]);
  });

  testWidgets('a transcode that re-encodes the video is kept', (tester) async {
    expect(
      await _play(
        tester,
        hevcFromFileOnly: true,
        reasons: const ['VideoRangeTypeNotSupported'],
      ),
      <bool>[true],
    );
  });

  testWidgets('other codecs keep the transcode', (tester) async {
    expect(
      await _play(tester, hevcFromFileOnly: true, videoCodec: 'h264'),
      <bool>[true],
    );
  });

  testWidgets('players that take HEVC over HLS keep the transcode', (
    tester,
  ) async {
    expect(await _play(tester, hevcFromFileOnly: false), <bool>[true]);
  });
}
