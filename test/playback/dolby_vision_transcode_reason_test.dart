import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/di/modules/playback_module.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A Dolby Vision stream with an enhancement layer, so it carries no HDR10
/// base layer and always needs a fallback decision.
StreamResolutionResult _dolbyVisionWithEl({bool isLocalMedia = false}) {
  return StreamResolutionResult(
    streamUrl: 'http://server/stream.mkv',
    mediaSourceId: 'source-1',
    playMethod: StreamPlayMethod.directPlay,
    container: 'mkv',
    videoRangeType: 'DOVIWithEL',
    isLocalMedia: isLocalMedia,
    mediaStreams: const [
      {
        'Type': 'Video',
        'Codec': 'hevc',
        'VideoRangeType': 'DOVIWithEL',
        'DvProfile': 8,
        'DvBlSignalCompatibilityId': 0,
      },
    ],
  );
}

/// A Dolby Vision file as Emby describes it: no VideoRangeType, the profile
/// typed in ExtendedVideoSubType, and VideoRange derived from it.
StreamResolutionResult _embyDolbyVision(String subType) {
  return StreamResolutionResult(
    streamUrl: 'http://server/stream.mkv',
    mediaSourceId: 'source-1',
    playMethod: StreamPlayMethod.directPlay,
    container: 'mkv',
    mediaStreams: [
      {
        'Type': 'Video',
        'Codec': 'hevc',
        'ExtendedVideoType': 'DolbyVision',
        'ExtendedVideoSubType': subType,
        'VideoRange': 'DolbyVision',
      },
    ],
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
  });

  tearDown(() async {
    await GetIt.instance.reset();
    debugDefaultTargetPlatformOverride = null;
    PlatformDetection.setTvMode(false);
    PlatformDetection.setDisplayHdrTypes(null);
    PlatformDetection.setMediaCodecCapabilities(null);
  });

  test('an unplayable profile names itself as the reason', () {
    // A profile 5 stream on a decoder that only handles profile 7, with a
    // display that does Dolby Vision, so only the profile gate can object.
    PlatformDetection.setDisplayHdrTypes(const <String>['DOLBY_VISION']);
    PlatformDetection.setMediaCodecCapabilities(const <String, dynamic>{
      'supportsDvP7': true,
    });
    final profile5 = StreamResolutionResult(
      streamUrl: 'http://server/stream.mkv',
      mediaSourceId: 'source-1',
      playMethod: StreamPlayMethod.directPlay,
      container: 'mkv',
      videoRangeType: 'DOVI',
      mediaStreams: const [
        {'Type': 'Video', 'Codec': 'hevc', 'VideoRangeType': 'DOVI'},
      ],
    );
    expect(
      dolbyVisionTranscodeReason(profile5, prefs),
      'dolbyVisionProfileNotDirectPlayable',
    );
  });

  test('a display reporting no HDR names itself as the reason', () {
    // Regression for issue #1442: this gate was invisible in the log,
    // because the server had no reason to give and the client gave none.
    PlatformDetection.setDisplayHdrTypes(const <String>[]);
    expect(
      dolbyVisionTranscodeReason(_dolbyVisionWithEl(), prefs),
      'displayReportsNoHdr',
    );
  });

  test('a Dolby Vision display is left alone', () {
    PlatformDetection.setDisplayHdrTypes(const <String>['DOLBY_VISION']);
    expect(dolbyVisionTranscodeReason(_dolbyVisionWithEl(), prefs), isNull);
  });

  test('the transcode preference names itself', () async {
    PlatformDetection.setDisplayHdrTypes(const <String>['HDR10']);
    await prefs.set(
      UserPreferences.dolbyVisionFallbackBehavior,
      DolbyVisionFallbackBehavior.transcode,
    );
    expect(
      dolbyVisionTranscodeReason(_dolbyVisionWithEl(), prefs),
      'dolbyVisionFallbackPreferenceTranscode',
    );
  });

  test('an HDR10 fallback on a display without HDR10 names itself', () async {
    PlatformDetection.setDisplayHdrTypes(const <String>['HLG']);
    await prefs.set(
      UserPreferences.dolbyVisionFallbackBehavior,
      DolbyVisionFallbackBehavior.hdr10Fallback,
    );
    expect(
      dolbyVisionTranscodeReason(_dolbyVisionWithEl(), prefs),
      'displayLacksHdr10ForFallback',
    );
  });

  test('an HDR10 fallback on a display with HDR10 is left alone', () async {
    PlatformDetection.setDisplayHdrTypes(const <String>['HDR10']);
    await prefs.set(
      UserPreferences.dolbyVisionFallbackBehavior,
      DolbyVisionFallbackBehavior.hdr10Fallback,
    );
    expect(dolbyVisionTranscodeReason(_dolbyVisionWithEl(), prefs), isNull);
  });

  test('a local file is never swapped for a server stream', () {
    PlatformDetection.setDisplayHdrTypes(const <String>[]);
    expect(
      dolbyVisionTranscodeReason(_dolbyVisionWithEl(isLocalMedia: true), prefs),
      isNull,
    );
  });

  group('an Emby stream', () {
    // A profile 8 only decoder on a Dolby Vision panel.
    setUp(() {
      PlatformDetection.setDisplayHdrTypes(const <String>['DOLBY_VISION']);
      PlatformDetection.setMediaCodecCapabilities(const <String, dynamic>{
        'supportsDvP8': true,
        'supportsHevcHdr10': true,
      });
    });

    test('a profile 8.1 file direct plays on a profile 8 decoder', () {
      // Used to read as profile 5 for want of a VideoRangeType, so this
      // decoder refused it and the session transcoded with no reason the
      // server could name.
      expect(
        dolbyVisionTranscodeReason(_embyDolbyVision('DoviProfile81'), prefs),
        isNull,
      );
    });

    test(
      'a profile 8.1 file direct plays as HDR10 without a Dolby Vision panel',
      () async {
        PlatformDetection.setDisplayHdrTypes(const <String>['HDR10']);
        await prefs.set(
          UserPreferences.dolbyVisionFallbackBehavior,
          DolbyVisionFallbackBehavior.transcode,
        );
        // The base layer is plain HDR10, so even a pinned transcode
        // preference has nothing to fall back from.
        expect(
          dolbyVisionTranscodeReason(_embyDolbyVision('DoviProfile81'), prefs),
          isNull,
        );
      },
    );

    test('a profile 5 file on the same decoder still names the gate', () {
      expect(
        dolbyVisionTranscodeReason(_embyDolbyVision('DoviProfile50'), prefs),
        'dolbyVisionProfileNotDirectPlayable',
      );
    });

    test('an untyped file takes any Dolby Vision decoder', () {
      // An older Emby with no sub type to give. A bare DolbyVision can only
      // be held to some profile, and this decoder has one.
      expect(
        dolbyVisionTranscodeReason(_embyDolbyVision('None'), prefs),
        isNull,
      );
    });
  });

  test('the ladder is inert away from Android TV', () {
    PlatformDetection.setTvMode(false);
    PlatformDetection.setDisplayHdrTypes(const <String>[]);
    expect(dolbyVisionTranscodeReason(_dolbyVisionWithEl(), prefs), isNull);
  });
}
