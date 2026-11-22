import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
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

Map<String, dynamic> _state({int? networkActivityBps}) => {
  'event': 'state',
  'positionMs': 10000,
  'durationMs': 60000,
  'bufferedMs': 25500,
  'isPlaying': true,
  'isBuffering': false,
  'rebuffers': 2,
  'networkActivityBps': ?networkActivityBps,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AetherBackend backend;

  setUp(() async {
    for (final channel in [_control, _events]) {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (_) async => null);
    }
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    backend = AetherBackend(UserPreferences(store));
  });

  tearDown(() {
    backend.dispose();
    for (final channel in [_control, _events]) {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    }
  });

  test('has no reading before the first state', () {
    expect(backend.networkStats, isNull);
  });

  test('reads the buffer ahead, activity and rebuffers from the state', () async {
    await _send(_state(networkActivityBps: 1900000));

    final stats = backend.networkStats!;
    expect(stats.bufferAhead, const Duration(milliseconds: 15500));
    expect(stats.activityBitsPerSecond, 1900000);
    expect(stats.rebuffers, 2);
    // The engine reports neither, so their rows stay out.
    expect(stats.bufferCeiling, isNull);
    expect(stats.bufferedBytes, isNull);
  });

  test('a new item starts without the last one\'s reading', () async {
    await _send(_state(networkActivityBps: 1900000));
    await backend.play('http://example.invalid/next');

    expect(backend.networkStats, isNull);
  });

  test('leaves activity out when the route cannot count bytes', () async {
    await _send(_state());

    expect(backend.networkStats!.activityBitsPerSecond, isNull);
  });
}
