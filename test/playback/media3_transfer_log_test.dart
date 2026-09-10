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

  String lastLine() => logs.entries.last.message;

  test('a playlist request names the file', () async {
    await _send(<String, dynamic>{
      'event': 'media3Transfer',
      'reason': 'playlist',
      'name': 'main.m3u8',
    });
    await pumpEventQueue();
    expect(lastLine(), 'Media3 HLS: requesting playlist main.m3u8');
  });

  test('a segment that skips its predecessor says both indexes', () async {
    // The case a stalled transcode needs and the log could not show: a jump
    // to a segment the server has not reached blocks until it gets there.
    await _send(<String, dynamic>{
      'event': 'media3Transfer',
      'reason': 'outOfOrder',
      'index': 400,
      'previousIndex': 5,
    });
    await pumpEventQueue();
    expect(lastLine(), 'Media3 HLS: requesting segment 400, previous was 5');
  });

  test('a slow fetch is stated on its own', () async {
    await _send(<String, dynamic>{
      'event': 'media3Transfer',
      'reason': 'slow',
      'elapsedMs': 8400,
      'index': 12,
    });
    await pumpEventQueue();
    expect(lastLine(), 'Media3 HLS: segment 12 took 8400ms');
  });

  test('steady progress reports the run rather than each segment', () async {
    await _send(<String, dynamic>{
      'event': 'media3Transfer',
      'reason': 'progress',
      'index': 34,
      'requested': 25,
      'averageMs': 180,
    });
    await pumpEventQueue();
    expect(
      lastLine(),
      'Media3 HLS: requesting segment 34, 25 asked for, 180ms average',
    );
  });

  test(
    'the first request and an unknown reason both state the segment',
    () async {
      await _send(<String, dynamic>{
        'event': 'media3Transfer',
        'reason': 'first',
        'index': 0,
      });
      await pumpEventQueue();
      expect(lastLine(), 'Media3 HLS: requesting segment 0');

      await _send(<String, dynamic>{
        'event': 'media3Transfer',
        'reason': 'somethingNew',
        'index': 7,
      });
      await pumpEventQueue();
      expect(lastLine(), 'Media3 HLS: requesting segment 7');
    },
  );
}
