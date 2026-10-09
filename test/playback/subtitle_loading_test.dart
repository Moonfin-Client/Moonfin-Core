import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _media3Control = MethodChannel('moonfin/media3_video_control');
const _media3Events = MethodChannel('moonfin/media3_video_events');
const _aetherControl = MethodChannel('moonfin/ios_aether_control');
const _aetherEvents = MethodChannel('moonfin/ios_aether_events');

Future<void> _send(MethodChannel events, Map<String, dynamic> payload) {
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        events.name,
        const StandardMethodCodec().encodeSuccessEnvelope(payload),
        (_) {},
      );
}

Map<String, dynamic> _state({required bool subtitleLoading}) => {
  'event': 'state',
  'positionMs': 1000,
  'durationMs': 60000,
  'bufferedMs': 0,
  'isPlaying': true,
  'isBuffering': false,
  'isSubtitleLoading': subtitleLoading,
};

void _mockChannels(List<MethodChannel> channels) {
  for (final channel in channels) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (_) async => null);
  }
}

void _clearChannels(List<MethodChannel> channels) {
  for (final channel in channels) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  }
}

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

class _Backend extends Fake implements PlayerBackend {
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
  Future<void> stop() async {}
  @override
  void dispose() {}
}

class _LoadingBackend extends _Backend implements SubtitleLoadingBackend {
  final _loading = StreamController<bool>.broadcast();
  bool loading = false;

  void emit(bool value) {
    loading = value;
    _loading.add(value);
  }

  @override
  bool get isSubtitleLoading => loading;
  @override
  Stream<bool> get subtitleLoadingStream => _loading.stream;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Media3', () {
    late Media3PlayerBackend backend;

    setUp(() async {
      _mockChannels([_media3Control, _media3Events]);
      backend = Media3PlayerBackend(await _prefs());
    });

    tearDown(() {
      backend.dispose();
      _clearChannels([_media3Control, _media3Events]);
    });

    test('follows the flag the native state reports', () async {
      final seen = <bool>[];
      backend.subtitleLoadingStream.listen(seen.add);

      await _send(_media3Events, _state(subtitleLoading: true));
      expect(backend.isSubtitleLoading, isTrue);
      await _send(_media3Events, _state(subtitleLoading: true));
      await _send(_media3Events, _state(subtitleLoading: false));
      await pumpEventQueue();

      expect(backend.isSubtitleLoading, isFalse);
      expect(seen, [true, false]);
    });

    test('a player error clears it', () async {
      await _send(_media3Events, _state(subtitleLoading: true));
      await _send(_media3Events, {'event': 'playerError', 'message': 'boom'});

      expect(backend.isSubtitleLoading, isFalse);
    });
  });

  group('Aether', () {
    late AetherBackend backend;

    setUp(() async {
      _mockChannels([_aetherControl, _aetherEvents]);
      backend = AetherBackend(await _prefs());
    });

    tearDown(() {
      backend.dispose();
      _clearChannels([_aetherControl, _aetherEvents]);
    });

    test('follows the flag the native state reports', () async {
      final seen = <bool>[];
      backend.subtitleLoadingStream.listen(seen.add);

      await _send(_aetherEvents, _state(subtitleLoading: true));
      expect(backend.isSubtitleLoading, isTrue);
      await _send(_aetherEvents, _state(subtitleLoading: false));
      await pumpEventQueue();

      expect(backend.isSubtitleLoading, isFalse);
      expect(seen, [true, false]);
    });

    test(
      'an older native side without the field reads as not loading',
      () async {
        final state = _state(subtitleLoading: true)
          ..remove('isSubtitleLoading');
        await _send(_aetherEvents, state);

        expect(backend.isSubtitleLoading, isFalse);
      },
    );

    test('an error clears it', () async {
      await _send(_aetherEvents, _state(subtitleLoading: true));
      await _send(_aetherEvents, {'event': 'error', 'message': 'boom'});

      expect(backend.isSubtitleLoading, isFalse);
    });

    test('stopping clears it', () async {
      await _send(_aetherEvents, _state(subtitleLoading: true));
      await backend.stop();

      expect(backend.isSubtitleLoading, isFalse);
    });

    test('a new source clears it', () async {
      await _send(_aetherEvents, _state(subtitleLoading: true));
      await backend.play('http://server/video.m3u8');

      expect(backend.isSubtitleLoading, isFalse);
    });
  });

  group('PlayerState', () {
    test('only reports a change and clears on reset', () async {
      final state = PlayerState();
      final seen = <bool>[];
      state.subtitleLoadingStream.listen(seen.add);

      state.setSubtitleLoading(true);
      state.setSubtitleLoading(true);
      expect(state.isSubtitleLoading, isTrue);
      state.reset();
      await pumpEventQueue();

      expect(state.isSubtitleLoading, isFalse);
      expect(seen, [true, false]);
      state.dispose();
    });
  });

  group('PlaybackManager', () {
    test('mirrors a backend that reports subtitle loading', () async {
      final backend = _LoadingBackend()..loading = true;
      final manager = PlaybackManager()..setBackend(backend);
      expect(manager.state.isSubtitleLoading, isTrue);

      backend.emit(false);
      await pumpEventQueue();
      expect(manager.state.isSubtitleLoading, isFalse);

      backend.emit(true);
      await pumpEventQueue();
      expect(manager.state.isSubtitleLoading, isTrue);
    });

    test('switching to a backend without it clears it', () async {
      final manager = PlaybackManager()
        ..setBackend(_LoadingBackend()..loading = true);
      expect(manager.state.isSubtitleLoading, isTrue);

      manager.setBackend(_Backend());

      expect(manager.state.isSubtitleLoading, isFalse);
    });
  });
}
