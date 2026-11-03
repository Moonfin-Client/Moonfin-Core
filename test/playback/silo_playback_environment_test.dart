import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/silo_playback_environment.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:playback_silo/playback_silo.dart';

void main() {
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
