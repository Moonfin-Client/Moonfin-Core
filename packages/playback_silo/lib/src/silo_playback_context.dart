import 'silo_capabilities_translator.dart';

/// Where Moonfin is playing, as far as a Silo playback start needs to know:
/// the device, its display, and what its player does beyond its device
/// profile.
///
/// The app supplies this (it knows the platform), and the package only shapes
/// it into Silo's `client_playback_context`. Every field is optional except
/// the form factor, and an unknown value is left out rather than guessed.
class SiloPlaybackEnvironment {
  const SiloPlaybackEnvironment({
    this.formFactor = 'desktop',
    this.platform,
    this.osVersion,
    this.manufacturer,
    this.model,
    this.appBuild,
    this.displayHdr,
    this.traits = const SiloPlayerTraits(),
  });

  /// `tv`, `phone`, `tablet`, `desktop` or `web`. Silo uses it for its
  /// device quirk table only.
  final String formFactor;

  /// `macos`, `windows`, `linux`, `android`, `ios`, `tvos` or `web`.
  final String? platform;

  final String? osVersion;
  final String? manufacturer;
  final String? model;
  final String? appBuild;

  /// What the attached display shows natively, as Silo's HDR details
  /// (`hdr10`, `hdr10_plus`, `hlg`, `dolby_vision_profiles`), when the
  /// platform could ask it. Null when it couldn't, which Silo is told as
  /// `hdr_evidence: unknown`: then nothing is sent to the display as HDR
  /// unless the player maps it itself (see
  /// [SiloPlayerTraits.managesDynamicRange]).
  final Map<String, dynamic>? displayHdr;

  /// What the player does beyond its device profile.
  final SiloPlayerTraits traits;
}

/// Silo's `client_playback_context` for a start or a replan: the app and
/// device, the output, and per delivery class what the player accepts
/// ([capabilities] from its device profile).
///
/// **Output.** `output.hdr_details` is what can be shown natively: the
/// decoder's HDR formats that the display also has. With no display answer
/// it is all off and `display.hdr_evidence` is `unknown`, which Silo reads
/// as "make no native HDR claim" (it also never falls back to the decoder's
/// formats once `display` is present). An answer is sent as `exact`, the
/// display's own formats as `hdr_types`. `output_context_id` is left out:
/// Moonfin has no stable id for the output route, and a made-up one that
/// changes would invalidate plans at random.
Map<String, dynamic> siloPlaybackContext({
  required SiloPlaybackEnvironment environment,
  required String appVersion,
  required SiloClientCapabilities capabilities,
}) {
  final display = environment.displayHdr;
  final decoder = capabilities.hdrDetails;
  return {
    'protocol_version': 3,
    'form_factor': environment.formFactor,
    'app_version': _bounded(appVersion, 64) ?? 'unknown',
    'app_build': ?_bounded(environment.appBuild, 64),
    'device': {
      'platform': ?_bounded(environment.platform, 32),
      'os_version': ?_bounded(environment.osVersion, 128),
      'manufacturer': ?_bounded(environment.manufacturer, 128),
      'model': ?_bounded(environment.model, 128),
    },
    'output': {
      'hdr_details': display == null
          ? _noHdr
          : _intersection(decoder, _normalised(display)),
      'display': display == null
          ? const {'hdr_evidence': 'unknown'}
          : {'hdr_evidence': 'exact', 'hdr_types': _normalised(display)},
    },
    'deliveries': capabilities.deliveries,
  };
}

const _noHdr = {
  'hdr10': false,
  'hdr10_plus': false,
  'hlg': false,
  'dolby_vision_profiles': <int>[],
};

Map<String, dynamic> _normalised(Map<String, dynamic> hdr) => {
  'hdr10': hdr['hdr10'] == true,
  'hdr10_plus': hdr['hdr10_plus'] == true,
  'hlg': hdr['hlg'] == true,
  'dolby_vision_profiles': [
    for (final p in (hdr['dolby_vision_profiles'] as List?) ?? const [])
      if (p is int) p,
  ]..sort(),
};

Map<String, dynamic> _intersection(
  Map<String, dynamic> a,
  Map<String, dynamic> b,
) {
  final profiles = {
    ...(a['dolby_vision_profiles'] as List).cast<int>(),
  }.intersection({...(b['dolby_vision_profiles'] as List).cast<int>()});
  return {
    'hdr10': a['hdr10'] == true && b['hdr10'] == true,
    'hdr10_plus': a['hdr10_plus'] == true && b['hdr10_plus'] == true,
    'hlg': a['hlg'] == true && b['hlg'] == true,
    'dolby_vision_profiles': profiles.toList()..sort(),
  };
}

/// [value] trimmed and cut to Silo's [max] characters, or null when empty.
String? _bounded(String? value, int max) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  return trimmed.length <= max ? trimmed : trimmed.substring(0, max);
}
