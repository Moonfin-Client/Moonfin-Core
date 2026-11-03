import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future<Map<String, dynamic>> _payloadFor(
  Map<String, dynamic> videoStream,
) async {
  final backend = _CapturingBackend();
  final manager = PlaybackManager()
    ..setBackend(backend)
    ..setResolver(
      _StubResolver(<Map<String, dynamic>>[
        <String, dynamic>{'Type': 'Video', 'Index': 0, ...videoStream},
      ]),
    );
  await manager.playItems(<dynamic>[
    <String, dynamic>{'Id': 'film', 'Type': 'Movie'},
  ]);
  return backend.payload!;
}

const _control = MethodChannel('moonfin/media3_video_control');

Future<Map<String, dynamic>> _nativeSourcePayload(
  Map<String, dynamic> rates,
) async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  final backend = Media3PlayerBackend(UserPreferences(store));
  final calls = <MethodCall>[];
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(_control, (call) async {
        calls.add(call);
        return null;
      });

  try {
    await backend.play(<String, dynamic>{
      'url': 'http://server.test/video.mkv',
      ...rates,
    });
    final source = calls.firstWhere((call) => call.method == 'setSource');
    return (source.arguments as Map).cast<String, dynamic>();
  } finally {
    backend.dispose();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_control, null);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'payload carries both server rates and the interlaced metadata',
    () async {
      final payload = await _payloadFor(<String, dynamic>{
        'RealFrameRate': 59.94,
        'AverageFrameRate': 41.947,
        'IsInterlaced': false,
      });

      expect(payload['videoRealFrameRate'], 59.94);
      expect(payload['videoAverageFrameRate'], 41.947);
      expect(payload['videoInterlaced'], isFalse);
      expect(payload['videoFrameRate'], 59.94);
    },
  );

  test(
    'invalid rates are omitted and the valid average remains the fallback',
    () async {
      final payload = await _payloadFor(<String, dynamic>{
        'RealFrameRate': double.nan,
        'AverageFrameRate': 25.0,
        'IsInterlaced': true,
      });

      expect(payload.containsKey('videoRealFrameRate'), isFalse);
      expect(payload['videoAverageFrameRate'], 25.0);
      expect(payload['videoFrameRate'], 25.0);
      expect(payload['videoInterlaced'], isTrue);
    },
  );

  test(
    'nonpositive rates and nonboolean interlace metadata are rejected',
    () async {
      final payload = await _payloadFor(<String, dynamic>{
        'RealFrameRate': double.infinity,
        'AverageFrameRate': 0,
        'IsInterlaced': 'true',
      });

      expect(payload.containsKey('videoRealFrameRate'), isFalse);
      expect(payload.containsKey('videoAverageFrameRate'), isFalse);
      expect(payload.containsKey('videoFrameRate'), isFalse);
      expect(payload['videoInterlaced'], isNull);
    },
  );

  test('missing interlace metadata stays unknown', () async {
    final payload = await _payloadFor(<String, dynamic>{
      'RealFrameRate': 29.97,
      'AverageFrameRate': 29.97,
    });

    expect(payload['videoInterlaced'], isNull);
  });

  test(
    'Media3 setSource receives validated rate fields and metadata',
    () async {
      final source = await _nativeSourcePayload(<String, dynamic>{
        'videoRealFrameRate': 59.94,
        'videoAverageFrameRate': 41.947,
        'videoInterlaced': true,
      });

      expect(source['videoRealFrameRate'], 59.94);
      expect(source['videoAverageFrameRate'], 41.947);
      expect(source['videoInterlaced'], isTrue);
    },
  );

  test('Media3 setSource rejects malformed rate payload values', () async {
    final source = await _nativeSourcePayload(<String, dynamic>{
      'videoRealFrameRate': '59.94',
      'videoAverageFrameRate': double.nan,
      'videoInterlaced': 'true',
    });

    expect(source['videoRealFrameRate'], isNull);
    expect(source['videoAverageFrameRate'], isNull);
    expect(source['videoInterlaced'], isNull);
  });
}
