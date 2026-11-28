import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/rewind_subtitles.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _streams = <Map<String, dynamic>>[
  <String, dynamic>{'Type': 'Video', 'Index': 0},
  <String, dynamic>{'Type': 'Audio', 'Index': 1, 'Language': 'eng'},
  <String, dynamic>{
    'Type': 'Subtitle',
    'Index': 2,
    'Codec': 'subrip',
    'Language': 'eng',
    'IsForced': true,
  },
  <String, dynamic>{
    'Type': 'Subtitle',
    'Index': 3,
    'Codec': 'subrip',
    'Language': 'eng',
  },
  <String, dynamic>{
    'Type': 'Subtitle',
    'Index': 4,
    'Codec': 'subrip',
    'Language': 'spa',
  },
];

class _TestBackend extends Fake implements PlayerBackend {
  _TestBackend({this.runtimeTrackSelection = true});

  final bool runtimeTrackSelection;
  final shownTracks = <int>[];
  int disableCalls = 0;

  @override
  Duration get position => const Duration(minutes: 10);
  @override
  Duration get duration => const Duration(minutes: 90);
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
  }) async {
    shownTracks.add(trackId);
  }

  @override
  Future<void> disableSubtitleTrack() async {
    disableCalls++;
  }

  @override
  Future<void> waitForTracksReady() async {}

  @override
  bool get demuxesEmbeddedSubtitles => true;

  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {}

  @override
  Future<void> setAudioTrack(int trackId) async {}

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  void dispose() {}
}

/// Direct play, or a transcode at [transcodeUrl] that sends the text tracks
/// as separate files the way Jellyfin does.
class _TestResolver extends MediaStreamResolver {
  _TestResolver({this.transcodeUrl});

  final String? transcodeUrl;
  int calls = 0;

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
    final url = transcodeUrl;
    if (url == null) {
      return const StreamResolutionResult(
        streamUrl: 'http://server.test/stream',
        mediaSourceId: 'source-1',
        playSessionId: 'session-1',
        playMethod: StreamPlayMethod.directPlay,
        mediaStreams: _streams,
      );
    }
    return StreamResolutionResult(
      streamUrl: url,
      mediaSourceId: 'source-1',
      playSessionId: 'session-1',
      playMethod: StreamPlayMethod.transcode,
      mediaStreams: _streams,
      externalSubtitles: const <ExternalSubtitle>[
        ExternalSubtitle(
          deliveryUrl: 'http://server.test/3.srt',
          codec: 'srt',
          streamIndex: 3,
        ),
      ],
    );
  }
}

/// Playing with subtitles off unless [selected] says otherwise, and recording
/// anything that would save a subtitle choice.
Future<(PlaybackManager, _TestBackend, List<int?>)> _playing({
  bool runtimeTrackSelection = true,
  _TestResolver? resolver,
  int selected = -1,
}) async {
  final backend = _TestBackend(runtimeTrackSelection: runtimeTrackSelection);
  final manager = PlaybackManager()
    ..setBackend(backend)
    ..setResolver(resolver ?? _TestResolver())
    ..subtitleTrackSelector = (_, _, _) => selected;
  await manager.playItems(<dynamic>[
    <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
  ]);
  final saved = <int?>[];
  manager
    ..onSubtitleTrackChanged = ((_, index) => saved.add(index))
    ..onSubtitleTrackSelected = ((_, index) => saved.add(index));
  return (manager, backend, saved);
}

Duration _at(int minutes, int seconds) =>
    Duration(minutes: minutes, seconds: seconds);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.rewindSubtitles, true);
  });

  group('a brief subtitle', () {
    test('comes and goes without saving a choice', () async {
      final (manager, backend, saved) = await _playing();
      addTearDown(manager.dispose);

      expect(manager.canShowSubtitleWithoutRestart(3), isTrue);
      await manager.showSubtitleBriefly(3);
      expect(manager.subtitleStreamIndex, 3);
      expect(manager.briefSubtitleShowing, isTrue);
      expect(backend.shownTracks, isNotEmpty);

      await manager.endBriefSubtitle();
      expect(manager.subtitleStreamIndex, -1);
      expect(manager.briefSubtitleShowing, isFalse);
      expect(backend.disableCalls, 1);

      expect(saved, isEmpty);
      expect(manager.subtitleSelectionExplicit, isFalse);
      expect(manager.lastExplicitSubtitleEnabled, isNull);
    });

    test('stays once the viewer picks a track themselves', () async {
      final (manager, backend, _) = await _playing();
      addTearDown(manager.dispose);

      await manager.showSubtitleBriefly(3);
      await manager.changeSubtitleTrack(3);
      await manager.endBriefSubtitle();

      expect(manager.subtitleStreamIndex, 3);
      expect(backend.disableCalls, 0);
    });

    test('stays brief when the player puts it back itself', () async {
      final (manager, _, saved) = await _playing();
      addTearDown(manager.dispose);

      await manager.showSubtitleBriefly(3);
      await manager.changeSubtitleTrack(3, userInitiated: false);
      expect(manager.briefSubtitleShowing, isTrue);
      expect(saved, isEmpty);

      await manager.endBriefSubtitle();
      expect(manager.subtitleStreamIndex, -1);
    });

    test('comes up in a transcode that burns nothing in', () async {
      final resolver = _TestResolver(
        transcodeUrl: 'http://server.test/master.m3u8?SubtitleMethod=Encode',
      );
      final (manager, backend, _) = await _playing(resolver: resolver);
      addTearDown(manager.dispose);
      final resolvesAfterPlay = resolver.calls;

      expect(manager.canShowSubtitleWithoutRestart(3), isTrue);
      await manager.showSubtitleBriefly(3);

      expect(backend.shownTracks, isNotEmpty);
      expect(resolver.calls, resolvesAfterPlay, reason: 'no restart');
    });

    test("isn't offered while the transcode burns in another track", () async {
      final (manager, _, _) = await _playing(
        resolver: _TestResolver(
          transcodeUrl:
              'http://server.test/master.m3u8'
              '?SubtitleStreamIndex=4&SubtitleMethod=Encode',
        ),
        selected: 4,
      );
      addTearDown(manager.dispose);

      expect(manager.canShowSubtitleWithoutRestart(3), isFalse);
    });

    test('is never offered where switching restarts the stream', () async {
      final (manager, _, _) = await _playing(runtimeTrackSelection: false);
      addTearDown(manager.dispose);

      expect(manager.canShowSubtitleWithoutRestart(3), isFalse);
    });
  });

  group('a short rewind', () {
    test('shows the full track until playback catches up', () async {
      final (manager, backend, saved) = await _playing();
      addTearDown(manager.dispose);
      final rewind = RewindSubtitles(manager, prefs);

      rewind.onSeek(_at(10, 0), _at(9, 50), streams: _streams);
      await pumpEventQueue();
      expect(manager.subtitleStreamIndex, 3, reason: 'not the forced track');

      // A reading from before the seek landed must not end it.
      rewind.onPosition(_at(10, 1));
      rewind.onPosition(_at(9, 51));
      await pumpEventQueue();
      expect(manager.subtitleStreamIndex, 3);

      rewind.onPosition(_at(10, 0));
      await pumpEventQueue();
      expect(manager.subtitleStreamIndex, -1);
      expect(backend.disableCalls, 1);
      expect(saved, isEmpty);
    });

    test('ends when the viewer skips past where it started', () async {
      final (manager, _, _) = await _playing();
      addTearDown(manager.dispose);
      final rewind = RewindSubtitles(manager, prefs);

      rewind.onSeek(_at(10, 0), _at(9, 50), streams: _streams);
      await pumpEventQueue();
      rewind.onSeek(_at(9, 52), _at(10, 22), streams: _streams);
      await pumpEventQueue();

      expect(manager.subtitleStreamIndex, -1);
    });

    test('picks the subtitle language setting first', () async {
      await prefs.set(UserPreferences.defaultSubtitleLanguage, 'spa');
      final (manager, _, _) = await _playing();
      addTearDown(manager.dispose);

      RewindSubtitles(
        manager,
        prefs,
      ).onSeek(_at(10, 0), _at(9, 50), streams: _streams);
      await pumpEventQueue();

      expect(manager.subtitleStreamIndex, 4);
    });

    test('does nothing for a long rewind or with the setting off', () async {
      final (manager, backend, _) = await _playing();
      addTearDown(manager.dispose);
      final rewind = RewindSubtitles(manager, prefs);

      rewind.onSeek(_at(10, 0), _at(9, 29), streams: _streams);
      await prefs.set(UserPreferences.rewindSubtitles, false);
      rewind.onSeek(_at(10, 0), _at(9, 50), streams: _streams);
      await pumpEventQueue();

      expect(manager.subtitleStreamIndex, -1);
      expect(backend.shownTracks, isEmpty);
    });
  });
}
