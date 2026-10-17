import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
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

/// Where the previous episode ended in these tests.
const _endMs = 1_351_294;

// Leaving the player a second into an auto-started episode reported the
// previous episode's end position for it, and the server marked it watched.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

  Future<void> tick(int positionMs) async {
    await _send(<String, dynamic>{
      'event': 'state',
      'positionMs': positionMs,
      'durationMs': _endMs,
      'isPlaying': true,
    });
    await pumpEventQueue();
  }

  test('a new item starts at its own position', () async {
    await tick(_endMs);
    await backend.play('https://server.test/next.mp4');
    expect(backend.position, Duration.zero);
  });

  test('ignores ticks still carrying the previous item position', () async {
    await tick(_endMs);
    await backend.play('https://server.test/next.mp4');
    final reported = <Duration>[];
    final sub = backend.positionStream.listen(reported.add);

    await tick(_endMs);
    expect(backend.position, Duration.zero);

    await tick(700);
    expect(backend.position, const Duration(milliseconds: 700));
    await sub.cancel();
    expect(reported, isNot(contains(const Duration(milliseconds: _endMs))));
  });

  test(
    'a resume past the previous item length is not marked finished',
    () async {
      // A 22-minute episode stopped at 10:00, then a movie resuming at 45:00.
      await tick(600_000);
      final completed = <bool>[];
      final sub = backend.completedStream.listen(completed.add);
      await backend.play(
        'https://server.test/movie.mp4',
        startPosition: const Duration(minutes: 45),
      );
      await _send(<String, dynamic>{
        'event': 'state',
        'positionMs': 600_000,
        'durationMs': 1_320_000,
        'isPlaying': false,
      });
      await pumpEventQueue();
      await sub.cancel();
      expect(completed, isNot(contains(true)));
      expect(backend.position, const Duration(minutes: 45));
    },
  );

  test('a second play before the first tick keeps the old position', () async {
    await tick(_endMs);
    await backend.play('https://server.test/next.mp4');
    // Re-resolved before the new source reported anything.
    await backend.play('https://server.test/next.mp4');
    await tick(_endMs);
    expect(backend.position, Duration.zero);
  });

  test('a resume near the old position is not held back', () async {
    await tick(600_000);
    await backend.play(
      'https://server.test/same.mp4',
      startPosition: const Duration(milliseconds: 600_000),
    );
    await tick(600_200);
    expect(backend.position, const Duration(milliseconds: 600_200));
  });
}
