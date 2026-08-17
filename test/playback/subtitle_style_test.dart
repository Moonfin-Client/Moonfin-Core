import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/subtitle_style.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a transcode is SDR on screen whatever the source was', () {
    expect(
      isHdrSubtitleOutput(videoRangeType: 'HDR10', isTranscoding: true),
      isFalse,
    );
    expect(
      isHdrSubtitleOutput(videoRangeType: 'DOVI', isTranscoding: true),
      isFalse,
    );
  });

  test('anything the server does not call SDR counts as HDR', () {
    expect(
      isHdrSubtitleOutput(videoRangeType: 'HDR10', isTranscoding: false),
      isTrue,
    );
    expect(
      isHdrSubtitleOutput(videoRangeType: 'hlg', isTranscoding: false),
      isTrue,
    );
    expect(
      isHdrSubtitleOutput(videoRangeType: 'SDR', isTranscoding: false),
      isFalse,
    );
  });

  test('an unknown range is treated as SDR rather than guessed at', () {
    expect(
      isHdrSubtitleOutput(videoRangeType: null, isTranscoding: false),
      isFalse,
    );
    expect(
      isHdrSubtitleOutput(videoRangeType: '', isTranscoding: false),
      isFalse,
    );
  });

  test(
    'HDR keeps the normal style until the separate one is turned on',
    () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.subtitlesTextColor, 0xFFFFFFFF);
      await prefs.set(UserPreferences.subtitlesHdrTextColor, 0xFF808080);

      expect(SubtitleStyle.resolve(prefs, isHdr: true).textColor, 0xFFFFFFFF);

      await prefs.set(UserPreferences.subtitlesHdrSeparate, true);
      expect(SubtitleStyle.resolve(prefs, isHdr: true).textColor, 0xFF808080);
    },
  );

  test('SDR playback never reads the HDR values', () async {
    final prefs = await _prefs();
    await prefs.set(UserPreferences.subtitlesHdrSeparate, true);
    await prefs.set(UserPreferences.subtitlesTextSize, 20.0);
    await prefs.set(UserPreferences.subtitlesHdrTextSize, 44.0);

    expect(SubtitleStyle.resolve(prefs, isHdr: false).fontSize, 20.0);
    expect(SubtitleStyle.resolve(prefs, isHdr: true).fontSize, 44.0);
  });

  test('every value has its own HDR twin', () async {
    final prefs = await _prefs();
    await prefs.set(UserPreferences.subtitlesHdrSeparate, true);
    await prefs.set(UserPreferences.subtitlesHdrTextColor, 0xFF111111);
    await prefs.set(UserPreferences.subtitlesHdrBackgroundColor, 0xFF222222);
    await prefs.set(UserPreferences.subtitlesHdrTextStrokeColor, 0xFF333333);
    await prefs.set(UserPreferences.subtitlesHdrTextSize, 30.0);
    await prefs.set(UserPreferences.subtitlesHdrTextWeight, 700);
    await prefs.set(UserPreferences.subtitlesHdrOffsetPosition, 0.2);

    final style = SubtitleStyle.resolve(prefs, isHdr: true);
    expect(style.textColor, 0xFF111111);
    expect(style.backgroundColor, 0xFF222222);
    expect(style.strokeColor, 0xFF333333);
    expect(style.fontSize, 30.0);
    expect(style.fontWeight, 700);
    expect(style.verticalOffset, 0.2);
  });
}
