import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _control = MethodChannel('moonfin/ios_aether_control');
const _events = MethodChannel('moonfin/ios_aether_events');

Future<void> _send(Map<String, dynamic> payload) {
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        _events.name,
        const StandardMethodCodec().encodeSuccessEnvelope(payload),
        (_) {},
      );
}

/// Backend whose error stream the test drives, standing in for the watchdog.
class _ErrorBackend extends Fake implements PlayerBackend {
  final _errors = StreamController<Map<String, dynamic>>.broadcast();
  bool playing = false;

  void emit(Map<String, dynamic> payload) => _errors.add(payload);

  @override
  Duration get position => const Duration(seconds: 90);
  @override
  Duration get duration => const Duration(minutes: 30);
  @override
  Duration get buffer => Duration.zero;
  @override
  bool get isPlaying => playing;
  @override
  bool get isBuffering => true;
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
  Stream<Map<String, dynamic>>? get errorStream => _errors.stream;
  @override
  bool get supportsRuntimeTrackSelection => false;
  @override
  bool get canRenderBitmapSubtitles => false;
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
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  void dispose() {
    _errors.close();
  }
}

/// Resolves to a downloaded file, which is what the stall path plays.
class _LocalResolver extends MediaStreamResolver {
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
      streamUrl: 'file:///downloads/episode.mkv',
      mediaSourceId: 'local-1',
      playMethod: StreamPlayMethod.directPlay,
      isLocalMedia: true,
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('the stall payload on the backend', () {
    late AetherBackend backend;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (_) async => null);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_events, (_) async => null);
      backend = AetherBackend(UserPreferences(store));
    });

    tearDown(() {
      backend.dispose();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, null);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_events, null);
    });

    test('it clears a latched buffering flag and reports the kind', () async {
      final buffering = <bool>[];
      backend.bufferingStream.listen(buffering.add);
      final errors = <Map<String, dynamic>>[];
      backend.errorStream.listen(errors.add);

      await _send(<String, dynamic>{
        'event': 'state',
        'positionMs': 386400,
        'durationMs': 2463273,
        'bufferedMs': 400000,
        'isPlaying': false,
        'isBuffering': true,
      });
      await pumpEventQueue();
      expect(buffering.last, isTrue);

      await _send(<String, dynamic>{
        'event': 'playerError',
        'kind': 'playback_stalled',
        'recoverable': false,
      });
      await pumpEventQueue();

      expect(buffering.last, isFalse);
      expect(errors.single['kind'], 'playback_stalled');
      expect(errors.single['recoverable'], isFalse);
      // No message, so the manager falls back to its own wording rather than
      // putting engine detail in front of the user.
      expect(errors.single.containsKey('message'), isFalse);
    });

    test('stop clears buffering the session never took back down', () async {
      final buffering = <bool>[];

      await _send(<String, dynamic>{
        'event': 'state',
        'positionMs': 1000,
        'durationMs': 2000,
        'bufferedMs': 1500,
        'isPlaying': false,
        'isBuffering': true,
      });
      await pumpEventQueue();

      backend.bufferingStream.listen(buffering.add);
      await backend.stop();
      await pumpEventQueue();

      expect(buffering, contains(false));
    });
  });

  group('the stall payload through the manager', () {
    test('a stalled local session fails instead of spinning', () async {
      final backend = _ErrorBackend();
      final manager = PlaybackManager()
        ..setBackend(backend)
        ..setResolver(_LocalResolver());
      addTearDown(manager.dispose);

      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'episode', 'Type': 'Episode'},
      ]);

      expect(manager.bringupState.phase, isNot(PlaybackBringupPhase.failed));

      backend.emit(<String, dynamic>{
        'event': 'playerError',
        'kind': 'playback_stalled',
        'recoverable': false,
      });
      await pumpEventQueue();

      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      expect(manager.bringupState.error, 'Playback failed.');
    });
  });
}
