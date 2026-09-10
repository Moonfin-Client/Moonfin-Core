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
  int frameRateLines() =>
      logs.entries.where((e) => e.message.contains('refresh rate')).length;

  test('an applied switch names the mode it landed on', () async {
    await _send(<String, dynamic>{
      'event': 'frameRate',
      'detectedFrameRate': 23.976,
      'appliedFrameRate': 23.976023,
      'appliedDisplayModeId': 7,
      'enabled': true,
      'behavior': 'scaleontv',
      'appliedWidth': 1920,
      'appliedHeight': 1080,
    });
    await pumpEventQueue();
    expect(
      lastLine(),
      'Media3: refresh rate switch to 1920x1080@23.976 for 23.976fps content '
      '(scaleontv, mode 7)',
    );
  });

  test('a display with nothing usable lists what it offered', () async {
    await _send(<String, dynamic>{
      'event': 'frameRate',
      'detectedFrameRate': 23.976,
      'appliedFrameRate': null,
      'appliedDisplayModeId': null,
      'enabled': true,
      'behavior': 'scaleondevice',
      'supportedModes': <String>['3840x2160@60.000', '1920x1080@59.940'],
    });
    await pumpEventQueue();
    expect(
      lastLine(),
      'Media3: no display mode fits 23.976fps content (scaleondevice, '
      'display offers 3840x2160@60.000, 1920x1080@59.940)',
    );
    expect(logs.entries.last.level, LogLevel.warning);
  });

  test('the disabled setting says so rather than staying silent', () async {
    await _send(<String, dynamic>{
      'event': 'frameRate',
      'detectedFrameRate': 23.976,
      'appliedFrameRate': null,
      'appliedDisplayModeId': null,
      'enabled': false,
      'behavior': 'disabled',
    });
    await pumpEventQueue();
    expect(lastLine(), 'Media3: refresh rate switching off for 23.976fps content');
  });

  test('the repeats every start produces are logged once', () async {
    final payload = <String, dynamic>{
      'event': 'frameRate',
      'detectedFrameRate': 23.976,
      'appliedFrameRate': 23.976023,
      'appliedDisplayModeId': 7,
      'enabled': true,
      'behavior': 'scaleontv',
      'appliedWidth': 1920,
      'appliedHeight': 1080,
    };
    await _send(payload);
    await _send(payload);
    await _send(payload);
    await pumpEventQueue();
    expect(frameRateLines(), 1);
  });

  test('a payload without a frame rate still reads as a sentence', () async {
    await _send(<String, dynamic>{'event': 'frameRate', 'enabled': true});
    await pumpEventQueue();
    expect(
      lastLine(),
      'Media3: no display mode fits content of unknown frame rate ()',
    );
  });

  test('the source payload carries the dimensions the chooser needs', () async {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_control, (call) async {
          calls.add(call);
          return null;
        });

    await backend.play(<String, dynamic>{
      'url': 'http://example.test/video.mkv',
      'mediaType': 'video',
      'videoFrameRate': 23.976023,
      'videoWidth': 1920,
      'videoHeight': 800,
    });

    final source = calls.firstWhere((c) => c.method == 'setSource');
    final args = (source.arguments as Map).cast<String, dynamic>();
    expect(args['videoFrameRate'], closeTo(23.976023, 0.000001));
    expect(args['videoWidth'], 1920);
    expect(args['videoHeight'], 800);
  });
}
