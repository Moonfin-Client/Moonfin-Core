import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/direct_play_reasons_formatter.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _createPrefs([
  Map<String, Object> initial = const {},
]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final l10n = AppLocalizationsEn();

  group('formatDirectPlayReason', () {
    test('AudioCodecNotSupported with known codec formats description and passthrough hint', () async {
      final prefs = await _createPrefs({
        'pref_audio_passthrough_mode': 'disabled',
      });

      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(
          reason: 'AudioCodecNotSupported',
          codec: 'truehd',
        ),
        l10n,
        prefs,
      );

      expect(item.description, contains('TRUEHD'));
      expect(item.hint, isNotNull);
      expect(item.hint, contains('Audio Passthrough'));
      expect(item.hint, contains('TRUEHD'));
    });

    test('AudioCodecNotSupported without codec uses generic string', () async {
      final prefs = await _createPrefs();
      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(reason: 'AudioCodecNotSupported'),
        l10n,
        prefs,
      );

      expect(item.description, equals(l10n.transcodeAudioCodecNotSupported));
      expect(item.hint, isNull);
    });

    test('AudioChannelsNotSupported formats channel count and hint', () async {
      final prefs = await _createPrefs();
      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(
          reason: 'AudioChannelsNotSupported',
          audioChannels: 8,
        ),
        l10n,
        prefs,
      );

      expect(item.description, contains('8ch'));
      expect(item.hint, equals(l10n.transcodeAudioChannelsHint));
    });

    test('SubtitleCodecNotSupported with ASS disabled suggests toggling setting', () async {
      final prefs = await _createPrefs({'ass_enabled': false});

      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(
          reason: 'SubtitleCodecNotSupported',
          codec: 'ass',
        ),
        l10n,
        prefs,
      );

      expect(item.description, equals(l10n.transcodeSubtitleBurnInAssDisabled));
      expect(item.hint, equals(l10n.transcodeSubtitleBurnInAssHint));
    });

    test('SubtitleCodecNotSupported with ASS enabled shows codec description', () async {
      final prefs = await _createPrefs({'ass_enabled': true});

      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(
          reason: 'SubtitleCodecNotSupported',
          codec: 'ass',
        ),
        l10n,
        prefs,
      );

      expect(item.description, contains('ASS'));
      expect(item.description, contains('must be burned in'));
      expect(item.hint, isNull);
    });

    test('SubtitleCodecNotSupported with PGS disabled suggests toggling setting', () async {
      final prefs = await _createPrefs({'pgs_enabled': false});

      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(
          reason: 'SubtitleCodecNotSupported',
          codec: 'pgs',
        ),
        l10n,
        prefs,
      );

      expect(item.description, equals(l10n.transcodeSubtitleBurnInPgsDisabled));
      expect(item.hint, equals(l10n.transcodeSubtitleBurnInPgsHint));

      final itemSub = formatDirectPlayReason(
        const DirectPlayFailureDetail(
          reason: 'SubtitleCodecNotSupported',
          codec: 'PGSSUB',
        ),
        l10n,
        prefs,
      );

      expect(itemSub.description, equals(l10n.transcodeSubtitleBurnInPgsDisabled));
      expect(itemSub.hint, equals(l10n.transcodeSubtitleBurnInPgsHint));
    });

    test('ContainerBitrateExceedsLimit formats Mbps and tip', () async {
      final prefs = await _createPrefs();
      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(
          reason: 'ContainerBitrateExceedsLimit',
          sourceBitrate: 80000000,
          maxStreamingBitrate: 40000000,
        ),
        l10n,
        prefs,
      );

      expect(item.description, contains('80.0 Mbps'));
      expect(item.description, contains('40.0 Mbps'));
      expect(item.hint, equals(l10n.transcodeBitrateHint));
    });

    test('VideoResolutionNotSupported provides resolution tip', () async {
      final prefs = await _createPrefs();
      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(reason: 'VideoResolutionNotSupported'),
        l10n,
        prefs,
      );

      expect(item.description, equals(l10n.transcodeVideoResolutionNotSupported));
      expect(item.hint, equals(l10n.transcodeResolutionHint));
    });

    test('VideoRangeNotSupported provides HDR/Dolby Vision explanation', () async {
      final prefs = await _createPrefs();
      final item = formatDirectPlayReason(
        const DirectPlayFailureDetail(reason: 'VideoRangeNotSupported'),
        l10n,
        prefs,
      );

      expect(item.description, equals(l10n.transcodeVideoRangeNotSupported));
      expect(item.hint, isNull);
    });
  });

  group('checkClientDolbyVisionTranscodeReason', () {
    test('returns null when not on Android TV', () async {
      final prefs = await _createPrefs();
      final reason = checkClientDolbyVisionTranscodeReason(
        [
          {'Type': 'Video', 'VideoRangeType': 'DOVI', 'Codec': 'hevc'},
        ],
        prefs,
        isAndroidTv: false,
      );

      expect(reason, isNull);
    });

    test('identifies dolbyVisionProfileNotDirectPlayable on Android TV when P7 EL disabled', () async {
      PlatformDetection.setDisplayHdrTypes(['DOLBY_VISION', 'HDR10']);
      PlatformDetection.setMediaCodecCapabilities({
        'supportsDvP5': true,
        'supportsDvP7': false,
        'supportsDvP8': true,
      });
      addTearDown(() {
        PlatformDetection.setDisplayHdrTypes(null);
        PlatformDetection.setMediaCodecCapabilities(null);
      });

      final prefs = await _createPrefs({
        'dolby_vision_profile7_direct_play_behavior': 'disabled',
      });

      final reason = checkClientDolbyVisionTranscodeReason(
        [
          {
            'Type': 'Video',
            'VideoRangeType': 'DOVIWithEL',
            'Codec': 'hevc',
            'Profile': 'Profile 7',
          },
        ],
        prefs,
        isAndroidTv: true,
        supportsDolbyVision: true,
        supportsAnyHdr: true,
      );

      expect(reason, equals('dolbyVisionProfileNotDirectPlayable'));
    });

    test('identifies displayReportsNoHdr when TV lacks HDR support', () async {
      final prefs = await _createPrefs();
      final reason = checkClientDolbyVisionTranscodeReason(
        [
          {
            'Type': 'Video',
            'VideoRangeType': 'DOVI',
            'Codec': 'hevc',
          },
        ],
        prefs,
        isAndroidTv: true,
        supportsDolbyVision: false,
        supportsAnyHdr: false,
      );

      expect(reason, equals('displayReportsNoHdr'));
    });

    test('identifies dolbyVisionFallbackPreferenceTranscode when user preference is transcode', () async {
      final prefs = await _createPrefs({
        'dolby_vision_fallback_behavior': 'transcode',
      });

      final reason = checkClientDolbyVisionTranscodeReason(
        [
          {
            'Type': 'Video',
            'VideoRangeType': 'DOVI',
            'Codec': 'hevc',
          },
        ],
        prefs,
        isAndroidTv: true,
        supportsDolbyVision: false,
        supportsAnyHdr: true,
      );

      expect(reason, equals('dolbyVisionFallbackPreferenceTranscode'));
    });
  });

  group('buildDirectPlayReasonItems', () {
    test('end-to-end resolves server and profile reasons into formatted items with hints', () async {
      final prefs = await _createPrefs({'ass_enabled': false});

      final items = buildDirectPlayReasonItems(
        serverReasons: const ['AudioCodecNotSupported'],
        mediaSource: {
          'Container': 'mkv',
          'Bitrate': 20000000,
          'MediaStreams': [
            {'Type': 'Video', 'Codec': 'hevc', 'Index': 0},
            {'Type': 'Audio', 'Codec': 'truehd', 'Index': 1},
            {'Type': 'Subtitle', 'Codec': 'ass', 'Index': 2},
          ],
        },
        deviceProfile: {
          'DirectPlayProfiles': [
            {'Container': 'mkv', 'Type': 'Video'},
          ],
          'SubtitleProfiles': [
            {'Format': 'vtt', 'Method': 'Embed'},
          ],
        },
        prefs: prefs,
        l10n: l10n,
        selectedAudioIndex: 1,
        selectedSubtitleIndex: 2,
      );

      expect(items.length, greaterThanOrEqualTo(2));
      // Audio codec reason
      expect(items.any((i) => i.description.contains('TRUEHD')), isTrue);
      // Subtitle burn in reason because ASS direct play is disabled
      expect(items.any((i) => i.description == l10n.transcodeSubtitleBurnInAssDisabled), isTrue);
      expect(items.any((i) => i.hint == l10n.transcodeSubtitleBurnInAssHint), isTrue);
    });
  });
}
