import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/display_hdr_probe.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/playback/silo_playback_environment.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_silo/playback_silo.dart';

const _platform = MethodChannel('org.moonfin.androidtv/platform');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  tearDown(() => debugDefaultTargetPlatformOverride = null);

  test('a Mac: a desktop playing through AetherEngine', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    final environment = siloPlaybackEnvironment();
    expect(environment.formFactor, 'desktop');
    expect(environment.platform, 'macos');
    expect(environment.manufacturer, 'Apple');
    expect(environment.traits, same(SiloPlayerTraits.aether));
    // Nothing can ask a Mac's display, so its HDR is unknown.
    expect(environment.displayHdr, isNull);
  });

  test('iOS: a phone playing through AetherEngine', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    final environment = siloPlaybackEnvironment();
    expect(environment.platform, 'ios');
    expect(environment.manufacturer, 'Apple');
    expect(environment.traits, same(SiloPlayerTraits.aether));
    expect(environment.displayHdr, isNull);
  });

  test('Windows and Linux play through libmpv', () {
    for (final platform in [TargetPlatform.windows, TargetPlatform.linux]) {
      debugDefaultTargetPlatformOverride = platform;
      final environment = siloPlaybackEnvironment();
      expect(environment.formFactor, 'desktop', reason: '$platform');
      expect(environment.platform, platform.name, reason: '$platform');
      expect(environment.manufacturer, isNull, reason: '$platform');
      expect(
        environment.traits,
        same(SiloPlayerTraits.mpv),
        reason: '$platform',
      );
    }
  });

  test('Android: the engine the viewer picked', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    // No preferences registered: Media3, Android's default engine.
    final environment = siloPlaybackEnvironment();
    expect(environment.platform, 'android');
    expect(environment.traits, same(SiloPlayerTraits.media3));
    expect(
      siloAndroidTraits(PlaybackEnginePreference.mpv),
      same(SiloPlayerTraits.mpvAndroid),
    );
    final media3 = SiloPlayerTraits.media3;
    expect(media3.selectsAnyAudioTrack, isTrue);
    expect(media3.rendersEmbeddedSubtitles, isTrue);
    expect(media3.drawsAssStyling, isFalse);
    expect(media3.loadsFontAttachments, isFalse);
    expect(media3.managesDynamicRange, isFalse);
    expect(SiloPlayerTraits.mpvAndroid.managesDynamicRange, isFalse);
  });

  test('a Dolby Vision transcode the viewer chose isn\'t offered as a strip', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    // Mapping profile 7 to HEVC makes Media3 strip it on any device.
    await prefs.set(UserPreferences.media3MapDolbyVisionProfile7ToHevc, true);
    Media3DoviCompatMode mode({bool isTv = true, bool dolbyVision = false}) =>
        siloMedia3DoviMode(
          prefs,
          isTv: isTv,
          displaySupportsDolbyVision: dolbyVision,
        );
    expect(mode(), Media3DoviCompatMode.strip);
    await prefs.set(
      UserPreferences.dolbyVisionFallbackBehavior,
      DolbyVisionFallbackBehavior.transcode,
    );
    expect(mode(), Media3DoviCompatMode.off);
    // The fallback setting only acts on an Android TV without Dolby Vision.
    expect(mode(isTv: false), Media3DoviCompatMode.strip);
    expect(mode(dolbyVision: true), Media3DoviCompatMode.strip);
    await prefs.set(
      UserPreferences.dolbyVisionFallbackBehavior,
      DolbyVisionFallbackBehavior.hdr10Fallback,
    );
    expect(mode(), Media3DoviCompatMode.strip);
  });

  test('Media3 tells Silo what it does to Dolby Vision 7', () {
    SiloDolbyVision7Transform? transformFor(Media3DoviCompatMode mode) =>
        siloAndroidTraits(
          PlaybackEnginePreference.media3,
          doviMode: mode,
        ).dolbyVision7Transform;
    expect(
      transformFor(Media3DoviCompatMode.convert),
      SiloDolbyVision7Transform.toProfile81,
    );
    expect(
      transformFor(Media3DoviCompatMode.strip),
      SiloDolbyVision7Transform.toHdr10,
    );
    // A profile 7 decoder needs nothing converted, and off converts nothing.
    expect(transformFor(Media3DoviCompatMode.native), isNull);
    expect(transformFor(Media3DoviCompatMode.off), isNull);
    final converting = siloAndroidTraits(
      PlaybackEnginePreference.media3,
      doviMode: Media3DoviCompatMode.convert,
    );
    expect(converting.selectsAnyAudioTrack, isTrue);
    expect(converting.drawsAssStyling, isFalse);
    expect(converting.loadsFontAttachments, isFalse);
    // libmpv has no compat chain.
    expect(
      siloAndroidTraits(
        PlaybackEnginePreference.mpv,
        doviMode: Media3DoviCompatMode.convert,
      ).dolbyVision7Transform,
      isNull,
    );
  });

  test('an Android phone whose panel named HDR10 tells Silo so', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(false);
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(_platform, (call) async {
      // What the Pixel 10 Pro's own panel answers.
      return call.method == 'displayCapabilities'
          ? <String, dynamic>{
              'present': true,
              'valid': true,
              'state': 'on',
              'answered': true,
              'types': <String>['HDR10', 'HLG', 'HDR10_PLUS'],
            }
          : null;
    });
    addTearDown(() {
      messenger.setMockMethodCallHandler(_platform, null);
      PlatformDetection.setDisplayHdrTypes(null);
      PlatformDetection.setTvMode(false);
    });
    await DisplayHdrProbe.readBuiltInDisplay('launch');
    final hdr = siloPlaybackEnvironment().displayHdr;
    expect(hdr?['hdr10'], isTrue);
    expect(hdr?['hlg'], isTrue);
  });

  test('a display that was read: its HDR formats, as Silo names them', () {
    expect(siloDisplayHdr(known: false, types: const ['HDR10']), isNull);
    expect(siloDisplayHdr(known: true, types: const []), {
      'hdr10': false,
      'hdr10_plus': false,
      'hlg': false,
      'dolby_vision_profiles': <int>[],
    });
    expect(
      siloDisplayHdr(
        known: true,
        types: const ['HDR10_PLUS', 'HLG', 'DOLBY_VISION'],
      ),
      {
        'hdr10': true,
        'hdr10_plus': true,
        'hlg': true,
        'dolby_vision_profiles': [5, 7, 8],
      },
    );
  });
}
