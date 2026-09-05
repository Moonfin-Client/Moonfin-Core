import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

const _embeddedStreams = <Map<String, dynamic>>[
  <String, dynamic>{'Type': 'Video', 'Index': 0},
  <String, dynamic>{'Type': 'Audio', 'Index': 1},
  <String, dynamic>{'Type': 'Subtitle', 'Index': 2, 'Codec': 'subrip'},
];

/// The stream the server adds when the subtitle finishes downloading.
const _downloadedSubtitle = <String, dynamic>{
  'Type': 'Subtitle',
  'Index': 3,
  'Codec': 'subrip',
  'IsExternal': true,
  'Language': 'eng',
};

/// [supportsRuntimeTrackSelection] is what separates the engines: mpv and
/// Media3 pick a track in place, the Apple engines re-resolve for one.
class _TestBackend extends Fake implements PlayerBackend {
  _TestBackend({this.runtimeTrackSelection = true});

  final bool runtimeTrackSelection;
  bool playing = false;

  @override
  Duration get position => const Duration(minutes: 5);
  @override
  Duration get duration => const Duration(minutes: 90);
  @override
  Duration get buffer => Duration.zero;
  @override
  bool get isPlaying => playing;
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
  bool get supportsRuntimeTrackSelection => runtimeTrackSelection;
  @override
  bool get canRenderBitmapSubtitles => true;
  @override
  bool get requiresStartupMediaReadyCheck => false;
  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) => <String, dynamic>{};

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    playing = true;
  }

  @override
  Future<void> stop() async {
    playing = false;
  }

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
  bool get demuxesEmbeddedSubtitles => true;

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

/// Serves the item's streams, gaining the downloaded subtitle once
/// [subtitleDownloaded] is set the way the server does after the download.
class _TestResolver extends MediaStreamResolver {
  int calls = 0;
  bool subtitleDownloaded = false;
  final List<int?> requestedSubtitleIndexes = <int?>[];

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
    calls++;
    requestedSubtitleIndexes.add(subtitleStreamIndex);
    return StreamResolutionResult(
      streamUrl: 'http://server.test/stream-$calls',
      mediaSourceId: 'source-1',
      playSessionId: 'session-$calls',
      playMethod: StreamPlayMethod.directPlay,
      mediaStreams: <Map<String, dynamic>>[
        ..._embeddedStreams,
        if (subtitleDownloaded) _downloadedSubtitle,
      ],
      externalSubtitles: <ExternalSubtitle>[
        if (subtitleDownloaded)
          const ExternalSubtitle(
            deliveryUrl: 'http://server.test/sub.srt',
            codec: 'srt',
            streamIndex: 3,
          ),
      ],
    );
  }
}

Future<PlaybackManager> _playing(
  _TestBackend backend,
  _TestResolver resolver,
) async {
  final manager = PlaybackManager()
    ..setBackend(backend)
    ..setResolver(resolver);
  await manager.playItems(<dynamic>[
    <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
  ]);
  return manager;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('a subtitle downloaded after the session resolved', () {
    test('is picked up on every engine', () async {
      for (final runtimeTrackSelection in <bool>[true, false]) {
        final backend = _TestBackend(
          runtimeTrackSelection: runtimeTrackSelection,
        );
        final resolver = _TestResolver();
        final manager = await _playing(backend, resolver);
        addTearDown(manager.dispose);

        final resolvesAfterPlay = resolver.calls;
        expect(
          manager.currentResolution?.mediaStreams,
          isNot(contains(_downloadedSubtitle)),
          reason: 'the session starts without the subtitle',
        );

        resolver.subtitleDownloaded = true;
        await manager.changeSubtitleTrack(3, refreshStreams: true);

        expect(
          resolver.calls,
          greaterThan(resolvesAfterPlay),
          reason: 'runtimeTrackSelection $runtimeTrackSelection re-resolved',
        );
        expect(
          manager.currentResolution?.mediaStreams,
          contains(_downloadedSubtitle),
          reason: 'the track list a selector reads now holds the subtitle',
        );
        expect(resolver.requestedSubtitleIndexes.last, 3);
      }
    });

    test('a plain track change leaves the stale list in place', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final manager = await _playing(backend, resolver);
      addTearDown(manager.dispose);

      final resolvesAfterPlay = resolver.calls;
      resolver.subtitleDownloaded = true;
      await manager.changeSubtitleTrack(3);

      // Direct play resolves the track through the list it already holds, so
      // the index finds nothing and the selector keeps showing the old set.
      expect(resolver.calls, resolvesAfterPlay);
      expect(
        manager.currentResolution?.mediaStreams,
        isNot(contains(_downloadedSubtitle)),
      );
    });
  });

  group('the outdated streams marker', () {
    test('answers per item and clears when a resolution lands', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final manager = await _playing(backend, resolver);
      addTearDown(manager.dispose);

      expect(manager.streamsOutdatedFor('movie'), isFalse);

      manager.markStreamsOutdated('movie');
      expect(manager.streamsOutdatedFor('movie'), isTrue);
      expect(manager.streamsOutdatedFor('other'), isFalse);

      resolver.subtitleDownloaded = true;
      await manager.changeSubtitleTrack(3, refreshStreams: true);

      expect(manager.streamsOutdatedFor('movie'), isFalse);
    });
  });
}
