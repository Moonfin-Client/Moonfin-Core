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
    this.canIecLow = false,
    this.canIecMid = false,
    this.canIecHbr = false,
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
      canIecLow = false,
      canIecMid = false,
      canIecHbr = false,
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

  // IEC 61937 carrier support for the Media3 app-side packer ("AudioTrack
  // (IEC)"): stream-rate stereo, 192 kHz stereo, and 192 kHz 8-channel HBR.
  final bool canIecLow;
  final bool canIecMid;
  final bool canIecHbr;

  final int maxPcmChannels;
  final AudioRouteType activeRouteType;
  final bool routeSupportsHdAudio;

  bool get _isHdRoute =>
      activeRouteType == AudioRouteType.hdmi ||
      activeRouteType == AudioRouteType.earc;

  // Per-codec IEC eligibility: AC3/DTS core ride the low carrier, EAC3 the
  // mid one, and the HD formats the HBR carrier, which additionally needs a
  // direct HDMI or eARC hop just like raw HD passthrough.
  bool get canIecAc3 => canIecLow;
  bool get canIecEac3 => canIecMid;
  bool get canIecDts => canIecLow;
  bool get canIecDtsHd => canIecHbr && _isHdRoute;
  bool get canIecTrueHd => canIecHbr && _isHdRoute;

  bool get hasCompressedPassthroughRoute =>
      canPassthroughAc3 ||
      canPassthroughEac3 ||
      canPassthroughDts ||
      canPassthroughDtsHd ||
      canPassthroughTrueHd;

  bool get hasMultichannelCapability {
    if (maxPcmChannels > 2) return true;
    if (!hasCompressedPassthroughRoute) return false;
    return isBitstreamRoute;
  }

  /// Whether this route carries a bitstream to an external decoder. Leaving
  /// the class is what a sink vanishing looks like, while moving within it
  /// shows up in the per-format flags instead.
  bool get isBitstreamRoute =>
      activeRouteType == AudioRouteType.hdmi ||
      activeRouteType == AudioRouteType.arc ||
      activeRouteType == AudioRouteType.earc;

  /// Whether landing this profile would take a capability away from
  /// [previous]. Any loss counts, because lowering capabilities makes every
  /// playback transcode until something raises them again. Per-flag rather
  /// than the aggregate, since [fromMap] already gates the lossless formats
  /// by route, so a move from HDMI to ARC shows up here as TrueHD lost.
  bool isDowngradeFrom(AudioCapabilityProfile previous) {
    if (previous.isBitstreamRoute && !isBitstreamRoute) return true;
    if (maxPcmChannels < previous.maxPcmChannels) return true;
    if (previous.canPassthroughAc3 && !canPassthroughAc3) return true;
    if (previous.canPassthroughEac3 && !canPassthroughEac3) return true;
    if (previous.canPassthroughDts && !canPassthroughDts) return true;
    if (previous.canPassthroughDtsHd && !canPassthroughDtsHd) return true;
    if (previous.canPassthroughTrueHd && !canPassthroughTrueHd) return true;
    if (previous.routeSupportsHdAudio && !routeSupportsHdAudio) return true;
    return false;
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
      // Absent keys stay false so a stale capability cache can never turn IEC
      // eligibility on by accident.
      canIecLow: _readBool(values, 'canIecLow', defaultValue: false),
      canIecMid: _readBool(values, 'canIecMid', defaultValue: false),
      canIecHbr: _readBool(values, 'canIecHbr', defaultValue: false),
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
      'canIecLow': canIecLow,
      'canIecMid': canIecMid,
      'canIecHbr': canIecHbr,
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
