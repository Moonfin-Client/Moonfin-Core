import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _control = MethodChannel('moonfin/ios_aether_control');
const _events = MethodChannel('moonfin/ios_aether_events');

TestDefaultBinaryMessenger get _messenger =>
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('sends the track artwork as artworkUrl', () async {
    final calls = <MethodCall>[];
    _messenger.setMockMethodCallHandler(_control, (call) async {
      calls.add(call);
      return null;
    });
    _messenger.setMockMethodCallHandler(_events, (_) async => null);
    addTearDown(() {
      _messenger.setMockMethodCallHandler(_control, null);
      _messenger.setMockMethodCallHandler(_events, null);
    });
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final backend = AetherBackend(UserPreferences(store));
    addTearDown(backend.dispose);

    await backend.setNowPlaying(
      title: 'Song',
      artist: 'Artist',
      artworkUrl: 'http://server/cover.jpg',
      hasNext: false,
    );

    final args =
        calls.lastWhere((c) => c.method == 'setUiMetadata').arguments as Map;
    expect(args['artworkUrl'], 'http://server/cover.jpg');
    expect(args.containsKey('logoUrl'), isFalse);
  });
}
