import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _control = MethodChannel('moonfin/media3_video_control');
const _events = MethodChannel('moonfin/media3_video_events');

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
  Duration get position => const Duration(minutes: 109);
  @override
  Duration get duration => const Duration(minutes: 134);
  @override
  Duration get buffer => const Duration(minutes: 109, seconds: 24);
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

/// Resolves to a remote direct play stream, which is what wedges.
class _RemoteResolver extends MediaStreamResolver {
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
      streamUrl: 'http://server.test/Videos/movie/stream?Static=true',
      mediaSourceId: 'source-1',
      playMethod: StreamPlayMethod.directPlay,
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('the wedge decision', () {
    test('needs the stall window and the runway together', () {
      expect(
        Media3PlayerBackend.bufferingHasWedged(
          stuckMs: 32000,
          bufferedAheadMs: 25101,
        ),
        isTrue,
      );
      // Runway alone is not enough, the stall window is exclusive.
      expect(
        Media3PlayerBackend.bufferingHasWedged(
          stuckMs: 30000,
          bufferedAheadMs: 25101,
        ),
        isFalse,
      );
      // A starved buffer is a network problem, not a wedge.
      expect(
        Media3PlayerBackend.bufferingHasWedged(
          stuckMs: 32000,
          bufferedAheadMs: 9999,
        ),
        isFalse,
      );
      expect(
        Media3PlayerBackend.bufferingHasWedged(
          stuckMs: 30001,
          bufferedAheadMs: 10000,
        ),
        isTrue,
      );
    });
  });

  group('the recovery payload on the backend', () {
    late Media3PlayerBackend backend;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (_) async => null);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_events, (_) async => null);
      backend = Media3PlayerBackend(UserPreferences(store));
    });

    tearDown(() {
      backend.dispose();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, null);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_events, null);
    });

    test('it stays diagnostic and leaves playback state alone', () async {
      final errors = <Map<String, dynamic>>[];
      backend.errorStream.listen(errors.add);

      await _send(<String, dynamic>{
        'event': 'audioClockRecovery',
        'positionMs': 6552430,
        'reportedPositionUs': 89478640774,
      });
      await pumpEventQueue();

      // The native side already reseeked, so nothing should reach the
      // manager as a failure.
      expect(errors, isEmpty);
      expect(backend.isBuffering, isFalse);
      expect(backend.isPlaying, isFalse);
    });
  });

  group('the stall payload through the manager', () {
    test('a wedged remote session fails instead of spinning', () async {
      final backend = _ErrorBackend();
      final manager = PlaybackManager()
        ..setBackend(backend)
        ..setResolver(_RemoteResolver());
      addTearDown(manager.dispose);

      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
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
