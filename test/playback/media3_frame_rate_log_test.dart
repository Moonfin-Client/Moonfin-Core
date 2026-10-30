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

  late UserPreferences prefs;
  late LogService logs;
  late Media3PlayerBackend backend;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
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

  test(
    'a conflicting reported rate is diagnostic and does not call control',
    () async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            calls.add(call);
            return null;
          });

      await _send(<String, dynamic>{
        'event': 'frameRateObservation',
        'stage': 'inputFormat',
        'reportedFrameRate': 41.947,
        'decisionFrameRate': 59.94,
      });
      await pumpEventQueue();

      expect(
        lastLine(),
        'Media3: reported 41.947fps (inputFormat); display decision kept at '
        '59.940fps',
      );
      expect(calls, isEmpty);
    },
  );

  test(
    'a cadence summary is diagnostic and does not call control',
    () async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            calls.add(call);
            return null;
          });

      await _send(<String, dynamic>{
        'event': 'frameCadence',
        'stage': 'output',
        'kind': 'GRID',
        'meanFps': 41.947,
        'gridHz': 59.94,
        'units': '1x10,2x5',
        'dominantIntervalUs': 16683,
        'dominantShare': 0.75,
        'intervals': 15,
        'timestampMs': 1234,
        'mimeType': 'video/hevc',
        'formatFrameRate': 41.947,
        'discontinuities': 0,
        'matchesDemux': true,
      });
      await pumpEventQueue();

      expect(lastLine(), contains('Media3: cadence output GRID 41.947fps'));
      expect(lastLine(), contains('on 59.940Hz (1x10,2x5)'));
      expect(calls, isEmpty);
    },
  );

  test(
    'a live cadence mismatch logs the actual display rate without control calls',
    () async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            calls.add(call);
            return null;
          });

      await _send(<String, dynamic>{
        'event': 'streamRateObservation',
        'frameRate': 29.97,
        'decisionFrameRate': 23.976,
        'displayHz': 59.94,
        'kind': 'uniform',
        'timestampMs': 1234,
      });
      await pumpEventQueue();

      expect(
        lastLine(),
        'Media3: stream cadence 29.970fps (uniform) differs from decision '
        '23.976fps at 1234ms; display at 59.940Hz',
      );
      expect(calls, isEmpty);
    },
  );

  test(
    'a live rate correction is logged without control calls',
    () async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            calls.add(call);
            return null;
          });

      await _send(<String, dynamic>{
        'event': 'frameRateCorrection',
        'frameRate': 23.976,
        'reason': 'programme',
        'displayHz': 59.94,
      });
      await pumpEventQueue();

      expect(
        lastLine(),
        'Media3: display rate corrected for 23.976fps (programme change); '
        'display was 59.940Hz',
      );
      expect(calls, isEmpty);
    },
  );

  test('a rate correction with unknown values stays readable', () async {
    await _send(<String, dynamic>{'event': 'frameRateCorrection'});
    await pumpEventQueue();

    expect(
      lastLine(),
      'Media3: display rate corrected for ?fps (unknown reason); display '
      'was ?Hz',
    );
  });

  test('correction events atomically replace rate provenance', () async {
    await _send(<String, dynamic>{
      'event': 'frameRateDecision',
      'frameRate': 59.94,
      'source': 'header',
      'fieldRateApplied': true,
      'scanType': 'interlaced',
    });
    await pumpEventQueue();
    expect(backend.playbackStatus.pictureFrameRate, closeTo(29.97, 0.001));

    await _send(<String, dynamic>{
      'event': 'frameRateCorrection',
      'frameRate': 59.94,
      'source': 'measured',
      'fieldRateApplied': false,
      'scanType': 'progressive',
      'reason': 'programme',
      'displayHz': 59.94,
    });
    await pumpEventQueue();
    expect(backend.playbackStatus.decisionFrameRate, 59.94);
    expect(backend.playbackStatus.pictureFrameRate, 59.94);
    expect(backend.playbackStatus.decisionSource, 'measured');
    expect(backend.playbackStatus.fieldRateApplied, isFalse);
    expect(backend.playbackStatus.scanType, 'progressive');
    expect(backend.playbackStatus.corrections, 1);

    await _send(<String, dynamic>{
      'event': 'frameRateCorrection',
      'frameRate': 59.94,
      'source': 'header',
      'fieldRateApplied': true,
      'scanType': 'interlaced',
      'reason': 'programme',
    });
    await pumpEventQueue();
    expect(backend.playbackStatus.pictureFrameRate, closeTo(29.97, 0.001));
    expect(backend.playbackStatus.scanType, 'interlaced');

    await _send(<String, dynamic>{
      'event': 'frameRateCorrection',
      'frameRate': 29.97,
      'source': 'measured',
      'fieldRateApplied': true,
      'scanType': 'not-a-scan-type',
      'reason': 'programme',
    });
    await pumpEventQueue();
    expect(backend.playbackStatus.fieldRateApplied, isTrue);
    expect(backend.playbackStatus.scanType, isNull);
    expect(backend.playbackStatus.pictureFrameRate, closeTo(14.985, 0.001));

    await _send(<String, dynamic>{
      'event': 'frameRateCorrection',
      'frameRate': 29.97,
      'source': 'measured',
      'reason': 'programme',
    });
    await pumpEventQueue();
    expect(backend.playbackStatus.fieldRateApplied, isFalse);
    expect(backend.playbackStatus.scanType, isNull);
    expect(backend.playbackStatus.pictureFrameRate, 29.97);
    expect(backend.playbackStatus.corrections, 4);

    await backend.play('http://example.test/next.mkv');
    expect(backend.playbackStatus.decisionFrameRate, isNull);
    expect(backend.playbackStatus.decisionSource, isNull);
    expect(backend.playbackStatus.fieldRateApplied, isFalse);
    expect(backend.playbackStatus.scanType, isNull);
    expect(backend.playbackStatus.corrections, 0);
  });

  test('stream rate observation handles unknown values readably', () async {
    await _send(<String, dynamic>{'event': 'streamRateObservation'});
    await pumpEventQueue();

    expect(
      lastLine(),
      'Media3: stream cadence ?fps (unknown) differs from decision ?fps at '
      '0ms; display at ?Hz',
    );
  });

  test(
    'a header field-rate decision is diagnostic and does not call control',
    () async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            calls.add(call);
            return null;
          });

      await _send(<String, dynamic>{
        'event': 'frameRateDecision',
        'frameRate': 59.94,
        'source': 'header',
        'fieldRateApplied': true,
        'reason': 'header',
        'elapsedMs': 12,
        'scanType': 'interlaced',
      });
      await pumpEventQueue();

      expect(
        lastLine(),
        'Media3: rate decision 59.940fps from header '
        '(field rate; interlaced; header; 12ms)',
      );
      expect(calls, isEmpty);
    },
  );

  test(
    'a timeout fallback decision is diagnostic and does not call control',
    () async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            calls.add(call);
            return null;
          });

      await _send(<String, dynamic>{
        'event': 'frameRateDecision',
        'frameRate': 23.976,
        'source': 'serverReal',
        'fieldRateApplied': false,
        'reason': 'timeout',
        'elapsedMs': 3000,
        'scanType': 'progressive',
      });
      await pumpEventQueue();

      expect(
        lastLine(),
        'Media3: rate decision 23.976fps from serverReal '
        '(picture rate; progressive; timeout; 3000ms)',
      );
      expect(calls, isEmpty);
    },
  );

  test('a decision without a rate remains readable', () async {
    await _send(<String, dynamic>{
      'event': 'frameRateDecision',
      'frameRate': null,
      'source': 'none',
      'fieldRateApplied': false,
      'reason': 'timeout',
      'elapsedMs': 0,
      'scanType': null,
    });
    await pumpEventQueue();

    expect(
      lastLine(),
      'Media3: rate decision unavailable '
      '(source none; unknown scan; timeout; 0ms)',
    );
  });

  test('a payload without a frame rate still reads as a sentence', () async {
    await _send(<String, dynamic>{'event': 'frameRate', 'enabled': true});
    await pumpEventQueue();
    expect(
      lastLine(),
      'Media3: no display mode fits content of unknown frame rate ()',
    );
  });

  test('the source payload carries what the player needs', () async {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_control, (call) async {
          calls.add(call);
          return null;
        });

    await prefs.set(UserPreferences.videoStartDelay, 2000);
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
    expect(args['videoStartDelayMs'], 2000);
  });

  test('a start held for the mode switch says how long', () async {
    await _send(<String, dynamic>{
      'event': 'startHeldForDisplayMode',
      'heldMs': 2600,
    });
    await pumpEventQueue();
    expect(
      lastLine(),
      'Media3: held the start 2600ms for the display mode switch to settle',
    );
  });
}
