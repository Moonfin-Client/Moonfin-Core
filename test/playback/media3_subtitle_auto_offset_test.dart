import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/log_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

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

/// The native side measures how far an HLS transcode's timeline sits from
/// source time and moves sideloaded subtitles by it. The backend surfaces
/// that beside the user's delay, never inside it.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LogService logs;
  late Media3PlayerBackend backend;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.diagnosticLoggingEnabled, true);
    logs = LogService(
      prefs,
      _FakeClientFactory(),
      const DeviceInfo(
        id: 'dev-1',
        name: 'Test Device',
        appName: 'Moonfin',
        appVersion: '0.0.0',
      ),
    );
    GetIt.instance.registerSingleton<LogService>(logs);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_control, (_) async => null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_events, (_) async => null);
    backend = Media3PlayerBackend(prefs);
  });

  tearDown(() async {
    backend.dispose();
    await GetIt.instance.reset();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_control, null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_events, null);
  });

  Future<void> sendDelays({int? autoOffsetMs, int subtitleDelayMs = 0}) {
    return _send(<String, dynamic>{
      'event': 'syncDelays',
      'audioDelayMs': 0,
      'subtitleDelayMs': subtitleDelayMs,
      'subtitleAutoOffsetMs': ?autoOffsetMs,
    });
  }

  test('starts with no correction', () {
    expect(backend.subtitleAutoOffsetSeconds, 0.0);
  });

  test('a correction is exposed, streamed and logged once', () async {
    final seen = <double>[];
    backend.subtitleAutoOffsetStream.listen(seen.add);

    await sendDelays(autoOffsetMs: 2000, subtitleDelayMs: 300);
    await pumpEventQueue();
    expect(backend.subtitleAutoOffsetSeconds, 2.0);
    expect(seen, [2.0]);
    expect(
      logs.entries.last.message,
      'Media3: subtitle auto offset +2000ms (HLS timestamp adjuster)',
    );
    final lines = logs.entries.length;

    await sendDelays(autoOffsetMs: 2000, subtitleDelayMs: 400);
    await pumpEventQueue();
    expect(seen, [2.0]);
    expect(logs.entries.length, lines);
  });

  test('a negative correction keeps its sign', () async {
    await sendDelays(autoOffsetMs: -750);
    await pumpEventQueue();
    expect(backend.subtitleAutoOffsetSeconds, -0.75);
    expect(
      logs.entries.last.message,
      'Media3: subtitle auto offset -750ms (HLS timestamp adjuster)',
    );
  });

  test('a missing key reads as no correction', () async {
    final seen = <double>[];
    backend.subtitleAutoOffsetStream.listen(seen.add);

    await sendDelays(autoOffsetMs: 2000);
    await pumpEventQueue();
    await sendDelays();
    await pumpEventQueue();
    expect(backend.subtitleAutoOffsetSeconds, 0.0);
    expect(seen, [2.0, 0.0]);
    expect(logs.entries.last.message, 'Media3: subtitle auto offset cleared');
  });
}
