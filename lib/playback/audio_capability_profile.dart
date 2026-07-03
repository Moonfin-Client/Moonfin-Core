import '../preference/preference_constants.dart';
import '../util/platform_detection.dart';

enum AudioRouteType { hdmi, arc, earc, bluetooth, speaker, headphones, other }

class AudioCapabilityProfile {
  const AudioCapabilityProfile({
    required this.canDecodeAc3,
    required this.canDecodeEac3,
    required this.canDecodeDts,
    required this.canDecodeDtsHd,
    required bool canDecodeTrueHd,
    required this.canDecodeFlac,
    required this.canPassthroughAc3,
    required this.canPassthroughEac3,
    required this.canPassthroughEac3Joc,
    required this.canPassthroughDts,
    required this.canPassthroughDtsHd,
    this.canPassthroughDtsX = false,
    required this.canPassthroughTrueHd,
    this.canPassthroughTrueHdJoc = false,
    required this.maxPcmChannels,
    required this.activeRouteType,
    required this.routeSupportsHdAudio,
  }) : _canDecodeTrueHd = canDecodeTrueHd;

  const AudioCapabilityProfile.optimistic()
    : canDecodeAc3 = true,
      canDecodeEac3 = true,
      canDecodeDts = true,
      canDecodeDtsHd = true,
      _canDecodeTrueHd = true,
      canDecodeFlac = true,
      canPassthroughAc3 = false,
      canPassthroughEac3 = false,
      canPassthroughEac3Joc = false,
      canPassthroughDts = false,
      canPassthroughDtsHd = false,
      canPassthroughDtsX = false,
      canPassthroughTrueHd = false,
      canPassthroughTrueHdJoc = false,
      maxPcmChannels = 8,
      activeRouteType = AudioRouteType.other,
      routeSupportsHdAudio = false;

  const AudioCapabilityProfile.appleMobile()
    : canDecodeAc3 = true,
      canDecodeEac3 = true,
      canDecodeDts = true,
      canDecodeDtsHd = true,
      _canDecodeTrueHd = false,
      canDecodeFlac = true,
      canPassthroughAc3 = false,
      canPassthroughEac3 = false,
      canPassthroughEac3Joc = false,
      canPassthroughDts = false,
      canPassthroughDtsHd = false,
      canPassthroughDtsX = false,
      canPassthroughTrueHd = false,
      canPassthroughTrueHdJoc = false,
      maxPcmChannels = 8,
      activeRouteType = AudioRouteType.other,
      routeSupportsHdAudio = false;

  final bool canDecodeAc3;
  final bool canDecodeEac3;
  final bool canDecodeDts;
  final bool canDecodeDtsHd;
  final bool _canDecodeTrueHd;
  // Android has no hardware TrueHD/MLP decoder, but the Media3 backend bundles
  // an FFmpeg audio decoder that decodes it to PCM, so decode is genuine there.
  bool get canDecodeTrueHd =>
      PlatformDetection.isAndroid || _canDecodeTrueHd;
  final bool canDecodeFlac;

  final bool canPassthroughAc3;
  final bool canPassthroughEac3;
  final bool canPassthroughEac3Joc;
  final bool canPassthroughDts;
  final bool canPassthroughDtsHd;
  final bool canPassthroughDtsX;
  final bool canPassthroughTrueHd;
  final bool canPassthroughTrueHdJoc;

  final int maxPcmChannels;
  final AudioRouteType activeRouteType;
  final bool routeSupportsHdAudio;

  bool get hasCompressedPassthroughRoute =>
      canPassthroughAc3 ||
      canPassthroughEac3 ||
      canPassthroughEac3Joc ||
      canPassthroughDts ||
      canPassthroughDtsHd ||
      canPassthroughDtsX ||
      canPassthroughTrueHd ||
      canPassthroughTrueHdJoc;

  bool get hasMultichannelCapability {
    if (maxPcmChannels > 2) return true;
    if (!hasCompressedPassthroughRoute) return false;
    return activeRouteType == AudioRouteType.hdmi ||
        activeRouteType == AudioRouteType.arc ||
        activeRouteType == AudioRouteType.earc;
  }

  bool get isAvReceiverRoute =>
      activeRouteType == AudioRouteType.hdmi ||
      activeRouteType == AudioRouteType.arc ||
      activeRouteType == AudioRouteType.earc;

  factory AudioCapabilityProfile.fromMap(
    Map<String, dynamic>? values, {
    AudioOutputMode audioOutputMode = AudioOutputMode.auto,
  }) {
    if (values == null || values.isEmpty) {
      return const AudioCapabilityProfile.optimistic();
    }

    final legacyAc3 = _asBool(values['supportsAc3']);
    final legacyDts = _asBool(values['supportsDts']);
    final legacyTrueHd = _asBool(values['supportsTrueHd']);

    final rawRouteType = _parseRouteType(values['activeRouteType']);
    final activeRouteType = audioOutputMode == AudioOutputMode.avrPassthrough
        ? (rawRouteType == AudioRouteType.earc ? AudioRouteType.earc : AudioRouteType.hdmi)
        : rawRouteType;

    // ARC (plain Audio Return Channel) only carries compressed audio: AC3, DTS
    // core, and DD+/EAC3 (incl. EAC3-JOC Atmos). The lossless/HD formats
    // (TrueHD, TrueHD-Atmos, DTS-HD MA, DTS:X) require eARC or a direct
    // HDMI-out-to-AVR link, so a probe over-reporting them on ARC must be
    // gated here, otherwise the capability-authoritative resolvers would
    // advertise passthrough ARC cannot carry. Gate on `arc` specifically:
    // plain HDMI can carry HD audio.
    // Lossless/HD formats (TrueHD, TrueHD-Atmos, DTS-HD MA, DTS:X) require
    // a direct HDMI connection to an AVR/Soundbar or an eARC link. They are
    // not supported on plain ARC (due to bandwidth limits) or on stereo
    // endpoints (built-in speakers, Bluetooth, or other generic outputs).
    final isHdRoute = activeRouteType == AudioRouteType.hdmi ||
        activeRouteType == AudioRouteType.earc;

    return AudioCapabilityProfile(
      canDecodeAc3: _readBool(values, 'canDecodeAc3', defaultValue: true),
      canDecodeEac3: _readBool(
        values,
        'canDecodeEac3',
        defaultValue: _readBool(values, 'canDecodeAc3', defaultValue: true),
      ),
      canDecodeDts: _readBool(values, 'canDecodeDts', defaultValue: true),
      canDecodeDtsHd: _readBool(
        values,
        'canDecodeDtsHd',
        defaultValue: _readBool(values, 'canDecodeDts', defaultValue: true),
      ),
      canDecodeTrueHd: _readBool(values, 'canDecodeTrueHd', defaultValue: true),
      canDecodeFlac: _readBool(values, 'canDecodeFlac', defaultValue: true),
      canPassthroughAc3: _readBool(
        values,
        'canPassthroughAc3',
        defaultValue: legacyAc3,
      ),
      canPassthroughEac3: _readBool(
        values,
        'canPassthroughEac3',
        defaultValue: legacyAc3,
      ),
      canPassthroughEac3Joc: _readBool(
        values,
        'canPassthroughEac3Joc',
        defaultValue: false,
      ),
      canPassthroughDts: _readBool(
        values,
        'canPassthroughDts',
        defaultValue: legacyDts,
      ),
      canPassthroughDtsHd:
          isHdRoute &&
          _readBool(values, 'canPassthroughDtsHd', defaultValue: legacyDts),
      canPassthroughDtsX:
          isHdRoute &&
          _readBool(values, 'canPassthroughDtsX', defaultValue: false),
      canPassthroughTrueHd:
          isHdRoute &&
          _readBool(values, 'canPassthroughTrueHd', defaultValue: legacyTrueHd),
      canPassthroughTrueHdJoc:
          isHdRoute &&
          _readBool(values, 'canPassthroughTrueHdJoc', defaultValue: false),
      maxPcmChannels:
          audioOutputMode == AudioOutputMode.avrPassthrough &&
              _readInt(values, 'maxPcmChannels', defaultValue: 8) < 8
          ? 8
          : _readInt(values, 'maxPcmChannels', defaultValue: 8),
      activeRouteType: activeRouteType,
      routeSupportsHdAudio: _readBool(
        values,
        'routeSupportsHdAudio',
        defaultValue: activeRouteType == AudioRouteType.earc,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    final supportsAc3 = canPassthroughAc3 || canPassthroughEac3;
    final supportsDts =
        canPassthroughDts || canPassthroughDtsHd || canPassthroughDtsX;
    final supportsTrueHd = canPassthroughTrueHd || canPassthroughTrueHdJoc;

    return <String, dynamic>{
      'canDecodeAc3': canDecodeAc3,
      'canDecodeEac3': canDecodeEac3,
      'canDecodeDts': canDecodeDts,
      'canDecodeDtsHd': canDecodeDtsHd,
      'canDecodeTrueHd': canDecodeTrueHd,
      'canDecodeFlac': canDecodeFlac,
      'canPassthroughAc3': canPassthroughAc3,
      'canPassthroughEac3': canPassthroughEac3,
      'canPassthroughEac3Joc': canPassthroughEac3Joc,
      'canPassthroughDts': canPassthroughDts,
      'canPassthroughDtsHd': canPassthroughDtsHd,
      'canPassthroughDtsX': canPassthroughDtsX,
      'canPassthroughTrueHd': canPassthroughTrueHd,
      'canPassthroughTrueHdJoc': canPassthroughTrueHdJoc,
      'maxPcmChannels': maxPcmChannels,
      'activeRouteType': activeRouteType.name,
      'routeSupportsHdAudio': routeSupportsHdAudio,
      'supportsAc3': supportsAc3,
      'supportsDts': supportsDts,
      'supportsTrueHd': supportsTrueHd,
      'supportsPcm': true,
      'supportsAac': true,
    };
  }

  static bool _readBool(
    Map<String, dynamic> values,
    String key, {
    required bool defaultValue,
  }) {
    if (!values.containsKey(key)) {
      return defaultValue;
    }
    return _asBool(values[key]);
  }

  static int _readInt(
    Map<String, dynamic> values,
    String key, {
    required int defaultValue,
  }) {
    if (!values.containsKey(key)) {
      return defaultValue;
    }
    return _asInt(values[key], defaultValue: defaultValue);
  }

  static bool _asBool(Object? value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      return normalized == 'true' || normalized == '1';
    }
    return false;
  }

  static int _asInt(Object? value, {required int defaultValue}) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) {
      return int.tryParse(value) ?? defaultValue;
    }
    return defaultValue;
  }

  static AudioRouteType _parseRouteType(Object? rawValue) {
    final normalized = rawValue?.toString().trim().toLowerCase() ?? '';
    switch (normalized) {
      case 'hdmi':
        return AudioRouteType.hdmi;
      case 'arc':
        return AudioRouteType.arc;
      case 'earc':
        return AudioRouteType.earc;
      case 'bluetooth':
        return AudioRouteType.bluetooth;
      case 'speaker':
        return AudioRouteType.speaker;
      case 'headphones':
        return AudioRouteType.headphones;
      default:
        return AudioRouteType.other;
    }
  }
}
