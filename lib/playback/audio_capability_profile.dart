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
    required this.canPassthroughDts,
    required this.canPassthroughDtsHd,
    required this.canPassthroughTrueHd,
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
      canPassthroughDts = false,
      canPassthroughDtsHd = false,
      canPassthroughTrueHd = false,
      maxPcmChannels = 8,
      activeRouteType = AudioRouteType.other,
      routeSupportsHdAudio = false;

  final bool canDecodeAc3;
  final bool canDecodeEac3;
  final bool canDecodeDts;
  final bool canDecodeDtsHd;
  final bool _canDecodeTrueHd;
  // No device decodes TrueHD/MLP in hardware, so a hardware probe answers no.
  // Media3 bundles an FFmpeg audio decoder that reaches PCM anyway, which is
  // why Android's probe result is overridden rather than trusted.
  bool get canDecodeTrueHd {
    if (PlatformDetection.isAndroid) return true;
    return _canDecodeTrueHd;
  }
  final bool canDecodeFlac;

  final bool canPassthroughAc3;
  final bool canPassthroughEac3;
  final bool canPassthroughDts;
  final bool canPassthroughDtsHd;
  final bool canPassthroughTrueHd;

  final int maxPcmChannels;
  final AudioRouteType activeRouteType;
  final bool routeSupportsHdAudio;

  bool get hasCompressedPassthroughRoute =>
      canPassthroughAc3 ||
      canPassthroughEac3 ||
      canPassthroughDts ||
      canPassthroughDtsHd ||
      canPassthroughTrueHd;

  bool get hasMultichannelCapability {
    if (maxPcmChannels > 2) return true;
    if (!hasCompressedPassthroughRoute) return false;
    return activeRouteType == AudioRouteType.hdmi ||
        activeRouteType == AudioRouteType.arc ||
        activeRouteType == AudioRouteType.earc;
  }

  factory AudioCapabilityProfile.fromMap(Map<String, dynamic>? values) {
    if (values == null || values.isEmpty) {
      return const AudioCapabilityProfile.optimistic();
    }

    final legacyAc3 = _asBool(values['supportsAc3']);
    final legacyDts = _asBool(values['supportsDts']);
    final legacyTrueHd = _asBool(values['supportsTrueHd']);

    final activeRouteType = _parseRouteType(values['activeRouteType']);

    // Lossless/HD formats (TrueHD and DTS-HD MA, along with the Atmos and
    // DTS:X metadata they carry) need a direct HDMI link to the decoder or an
    // eARC hop. Plain ARC lacks the bandwidth, so a probe over-reporting them
    // there must be gated here or the auto resolvers would advertise
    // passthrough the route can't carry.
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
      canPassthroughDts: _readBool(
        values,
        'canPassthroughDts',
        defaultValue: legacyDts,
      ),
      canPassthroughDtsHd:
          isHdRoute &&
          _readBool(values, 'canPassthroughDtsHd', defaultValue: legacyDts),
      canPassthroughTrueHd:
          isHdRoute &&
          _readBool(values, 'canPassthroughTrueHd', defaultValue: legacyTrueHd),
      maxPcmChannels: _readInt(values, 'maxPcmChannels', defaultValue: 8),
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
    final supportsDts = canPassthroughDts || canPassthroughDtsHd;

    return <String, dynamic>{
      'canDecodeAc3': canDecodeAc3,
      'canDecodeEac3': canDecodeEac3,
      'canDecodeDts': canDecodeDts,
      'canDecodeDtsHd': canDecodeDtsHd,
      'canDecodeTrueHd': canDecodeTrueHd,
      'canDecodeFlac': canDecodeFlac,
      'canPassthroughAc3': canPassthroughAc3,
      'canPassthroughEac3': canPassthroughEac3,
      'canPassthroughDts': canPassthroughDts,
      'canPassthroughDtsHd': canPassthroughDtsHd,
      'canPassthroughTrueHd': canPassthroughTrueHd,
      'maxPcmChannels': maxPcmChannels,
      'activeRouteType': activeRouteType.name,
      'routeSupportsHdAudio': routeSupportsHdAudio,
      'supportsAc3': supportsAc3,
      'supportsDts': supportsDts,
      'supportsTrueHd': canPassthroughTrueHd,
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
