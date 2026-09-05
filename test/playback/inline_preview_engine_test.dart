// The inline preview gate decides whether media bar trailers and home row
// previews run on Media3 or media_kit/mpv. It must follow the playback engine
// preference on Android only, so the mpv setting stays a working escape hatch
// and other platforms never route previews into the Android-only backend.
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/inline_preview_engine.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() => debugDefaultTargetPlatformOverride = null);

  test('android with the media3 engine runs previews on media3', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final prefs = await _prefs({
      'playback_engine_preference': PlaybackEnginePreference.media3.name,
    });

    expect(usesMedia3ForInlinePreview(prefs), isTrue);
  });

  test('the mpv engine setting keeps previews on mpv', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final prefs = await _prefs({
      'playback_engine_preference': PlaybackEnginePreference.mpv.name,
    });

    expect(usesMedia3ForInlinePreview(prefs), isFalse);
  });

  test('other platforms never use media3 previews', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    final prefs = await _prefs({
      'playback_engine_preference': PlaybackEnginePreference.media3.name,
    });

    expect(usesMedia3ForInlinePreview(prefs), isFalse);
  });
}
