import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_silo/playback_silo.dart';

import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';
import 'media3_player_backend.dart';

/// This device as a Silo playback start describes it: form factor,
/// platform, OS version and model, the display's HDR formats when they're
/// known, and the player's traits.
///
/// The display's HDR formats are only known on Android, which asks its
/// display (`DisplayHdrProbe`; a phone or tablet only when it names
/// some). Elsewhere they're left unknown, and
/// Silo then claims no native HDR output, which costs nothing for an
/// original file where the player maps HDR to the screen itself (see
/// [SiloPlayerTraits.managesDynamicRange]).
SiloPlaybackEnvironment siloPlaybackEnvironment() {
  return SiloPlaybackEnvironment(
    formFactor: _formFactor(),
    platform: _platform(),
    osVersion: PlatformDetection.osVersion,
    manufacturer: PlatformDetection.isApple || PlatformDetection.isAppleTV
        ? 'Apple'
        : null,
    model: PlatformDetection.deviceModel,
    displayHdr: siloDisplayHdr(
      known:
          PlatformDetection.isAndroid &&
          PlatformDetection.hasDisplayHdrCapabilities,
      types: PlatformDetection.displayHdrTypesSnapshot,
    ),
    traits: _traits(),
  );
}

/// A cast receiver as a Silo start describes it: a TV, the receiver's
/// [platform] (`chromecast`, `airplay`, `dlna`), and a player that loads the
/// stream itself ([SiloPlayerTraits.castReceiver], for DLNA
/// [SiloPlayerTraits.dlnaRenderer]). Its device profile is the receiver's
/// (`receiver_device_profiles.dart`).
SiloPlaybackEnvironment siloReceiverEnvironment(
  String platform, {
  String? manufacturer,
}) => SiloPlaybackEnvironment(
  formFactor: 'tv',
  platform: platform,
  manufacturer: manufacturer,
  traits: platform == 'dlna'
      ? SiloPlayerTraits.dlnaRenderer
      : SiloPlayerTraits.castReceiver,
);

/// The display's HDR formats (Android's `HDR10`, `HDR10_PLUS`, `HLG`,
/// `DOLBY_VISION`, as the display probe records them) as Silo's HDR
/// details, or null when the display was never read ([known] false).
///
/// A display names Dolby Vision without a profile, so it gets every profile
/// Silo knows (5, 7, 8). Silo intersects that with the decoder's.
Map<String, dynamic>? siloDisplayHdr({
  required bool known,
  required List<String> types,
}) {
  if (!known) return null;
  final upper = {for (final t in types) t.toUpperCase()};
  return {
    'hdr10': upper.contains('HDR10') || upper.contains('HDR10_PLUS'),
    'hdr10_plus': upper.contains('HDR10_PLUS'),
    'hlg': upper.contains('HLG'),
    'dolby_vision_profiles': upper.contains('DOLBY_VISION')
        ? const [5, 7, 8]
        : const <int>[],
  };
}

/// The main player's traits: AetherEngine on macOS, iOS and tvOS, libmpv
/// on Windows and Linux, the engine the viewer picked on Android (Media3 by
/// default, else libmpv), and a browser's media element on the web, which
/// sends no headers.
SiloPlayerTraits _traits() {
  // Web goes first, since a browser on a phone also reports its platform.
  if (PlatformDetection.isWeb) return SiloPlayerTraits.web;
  if (PlatformDetection.isAppleTV ||
      PlatformDetection.isMacOS ||
      PlatformDetection.isIOS) {
    return SiloPlayerTraits.aether;
  }
  if (PlatformDetection.isWindows || PlatformDetection.isLinux) {
    return SiloPlayerTraits.mpv;
  }
  if (PlatformDetection.isAndroid) {
    final prefs = _prefs();
    final engine =
        prefs?.get(UserPreferences.playbackEnginePreference) ??
        PlaybackEnginePreference.media3;
    return siloAndroidTraits(
      engine,
      doviMode: prefs == null || engine != PlaybackEnginePreference.media3
          ? Media3DoviCompatMode.off
          : siloMedia3DoviMode(prefs),
    );
  }
  return const SiloPlayerTraits();
}

/// [engine]'s traits. Media3 also says what its compat chain does to a
/// Dolby Vision profile 7 file ([doviMode]): converted to 8.1 or stripped to
/// HDR10 on the device, Silo can send the original file instead of
/// converting it over HLS, which re-encodes TrueHD and DTS audio.
SiloPlayerTraits siloAndroidTraits(
  PlaybackEnginePreference engine, {
  Media3DoviCompatMode doviMode = Media3DoviCompatMode.off,
}) => switch (engine) {
  PlaybackEnginePreference.media3 => switch (doviMode) {
    Media3DoviCompatMode.convert => SiloPlayerTraits.media3
        .withDolbyVision7Transform(SiloDolbyVision7Transform.toProfile81),
    Media3DoviCompatMode.strip => SiloPlayerTraits.media3
        .withDolbyVision7Transform(SiloDolbyVision7Transform.toHdr10),
    // No client transformation describes a player that decodes profile 7
    // as it is, so Silo still converts it itself; off converts nothing.
    Media3DoviCompatMode.native ||
    Media3DoviCompatMode.off => SiloPlayerTraits.media3,
  },
  PlaybackEnginePreference.mpv => SiloPlayerTraits.mpvAndroid,
};

/// What Media3 does to a profile 7 file, as far as Silo should be told. An
/// Android TV whose display has no Dolby Vision and whose viewer chose a
/// transcode over the HDR10 fallback gets no strip offered, so Silo keeps
/// serving it a stream of its own.
@visibleForTesting
Media3DoviCompatMode siloMedia3DoviMode(
  UserPreferences prefs, {
  bool? isTv,
  bool? displaySupportsDolbyVision,
}) {
  final mode = Media3PlayerBackend.doviCompatMode(prefs);
  final transcodeChosen =
      (isTv ?? PlatformDetection.isTV) &&
      !(displaySupportsDolbyVision ?? PlatformDetection.supportsDolbyVision) &&
      prefs.get(UserPreferences.dolbyVisionFallbackBehavior) ==
          DolbyVisionFallbackBehavior.transcode;
  return mode == Media3DoviCompatMode.strip && transcodeChosen
      ? Media3DoviCompatMode.off
      : mode;
}

UserPreferences? _prefs() {
  final getIt = GetIt.instance;
  return getIt.isRegistered<UserPreferences>()
      ? getIt<UserPreferences>()
      : null;
}

String _formFactor() {
  if (PlatformDetection.isWeb) return 'web';
  if (PlatformDetection.isTV || PlatformDetection.isAppleTV) return 'tv';
  if (PlatformDetection.isDesktop) return 'desktop';
  return PlatformDetection.isMobile ? 'phone' : 'tablet';
}

String? _platform() {
  if (PlatformDetection.isWeb) return 'web';
  if (PlatformDetection.isAppleTV) return 'tvos';
  if (PlatformDetection.isMacOS) return 'macos';
  if (PlatformDetection.isIOS) return 'ios';
  if (PlatformDetection.isAndroid) return 'android';
  if (PlatformDetection.isWindows) return 'windows';
  if (PlatformDetection.isLinux) return 'linux';
  return null;
}
