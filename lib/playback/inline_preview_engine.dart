import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';

// Inline previews (media bar trailers and home row previews) follow the main
// playback engine preference on Android, so the mpv setting stays a working
// escape hatch for devices where the embedded Media3 surface misbehaves.
bool usesMedia3ForInlinePreview(UserPreferences prefs) {
  return PlatformDetection.isAndroid &&
      prefs.get(UserPreferences.playbackEnginePreference) ==
          PlaybackEnginePreference.media3;
}
