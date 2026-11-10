import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

const _streams = <Map<String, dynamic>>[
  <String, dynamic>{'Type': 'Video', 'Index': 0},
  <String, dynamic>{'Type': 'Audio', 'Index': 1, 'Language': 'eng'},
  <String, dynamic>{
    'Type': 'Subtitle',
    'Index': 2,
    'Codec': 'subrip',
    'Language': 'eng',
  },
];

class _TestBackend extends Fake implements PlayerBackend {
  @override
  Duration get position => Duration.zero;
  @override
  Duration get duration => const Duration(minutes: 45);
  @override
  Duration get buffer => Duration.zero;
  @override
  bool get isPlaying => true;
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

class _TestResolver extends MediaStreamResolver {
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
    return StreamResolutionResult(
      streamUrl: 'http://server.test/stream',
      mediaSourceId: 'source-1',
      playSessionId: 'session-1',
      playMethod: StreamPlayMethod.directPlay,
      mediaStreams:
          (mediaItem as Map)['MediaStreams'] as List<Map<String, dynamic>>,
    );
  }
}

Map<String, dynamic> _episode(
  String id, [
  List<Map<String, dynamic>> streams = _streams,
]) => <String, dynamic>{'Id': id, 'Type': 'Episode', 'MediaStreams': streams};

Map<String, dynamic> _subtitle(
  int index,
  String title, {
  bool forced = false,
}) => <String, dynamic>{
  'Type': 'Subtitle',
  'Index': index,
  'Codec': 'subrip',
  'Language': 'eng',
  'Title': title,
  'IsForced': forced,
};

// The forced track comes first, the way many releases list them.
final _forcedFirst = <Map<String, dynamic>>[
  _streams[0],
  _streams[1],
  _subtitle(2, 'Signs', forced: true),
  _subtitle(3, 'Dialogue'),
];

Future<PlaybackManager> _playingWithSubtitlesOff() async {
  final manager = PlaybackManager()
    ..setBackend(_TestBackend())
    ..setResolver(_TestResolver());
  await manager.playItems(<dynamic>[_episode('e1')]);
  await manager.disableSubtitles();
  return manager;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a switch made from inside the player keeps subtitles off', () async {
    final manager = await _playingWithSubtitlesOff();
    addTearDown(manager.dispose);

    await manager.playItems(<dynamic>[
      _episode('e2'),
    ], carryTrackSelections: true);

    expect(manager.lastExplicitSubtitleEnabled, isFalse);
    expect(manager.subtitleStreamIndex, -1);
  });

  test('a fresh launch starts from no pick at all', () async {
    final manager = await _playingWithSubtitlesOff();
    addTearDown(manager.dispose);

    await manager.playItems(<dynamic>[_episode('e2')]);

    expect(manager.lastExplicitSubtitleEnabled, isNull);
  });

  group('the picked subtitle carries to the next episode', () {
    Future<PlaybackManager> pickFullThenNext(
      List<Map<String, dynamic>> nextStreams, {
      bool withSelector = false,
    }) async {
      final manager = PlaybackManager()
        ..setBackend(_TestBackend())
        ..setResolver(_TestResolver());
      if (withSelector) {
        manager.subtitleTrackSelector = (subtitles, audio, explicitIndex) =>
            explicitIndex;
      }
      await manager.playItems(<dynamic>[
        _episode('e1', _forcedFirst),
        _episode('e2', nextStreams),
      ]);
      await manager.changeSubtitleTrack(3);
      await manager.nextInQueue();
      return manager;
    }

    test('not the forced track of the same language listed first', () async {
      final manager = await pickFullThenNext(_forcedFirst);
      addTearDown(manager.dispose);

      expect(manager.subtitleStreamIndex, 3);
    });

    test('nor when the app picks the track', () async {
      final manager = await pickFullThenNext(_forcedFirst, withSelector: true);
      addTearDown(manager.dispose);

      expect(manager.subtitleStreamIndex, 3);
    });

    test('even when the next episode lists its tracks differently', () async {
      final manager = await pickFullThenNext(<Map<String, dynamic>>[
        _streams[0],
        _streams[1],
        _subtitle(2, 'Signs', forced: true),
        _subtitle(3, 'Songs', forced: true),
        _subtitle(4, 'English'),
      ]);
      addTearDown(manager.dispose);

      expect(manager.subtitleStreamIndex, 4);
    });
  });
}
