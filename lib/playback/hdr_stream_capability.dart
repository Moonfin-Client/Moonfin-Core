import '../util/platform_detection.dart';

enum DolbyVisionRequiredProfile {
  profile5,
  profile7,
  profile8,
  profile7Or8,
  any,
}

class HdrStreamCapability {
  const HdrStreamCapability._();

  static bool isVideoStream(Map<String, dynamic> stream) {
    return (stream['Type']?.toString().toUpperCase() ?? '') == 'VIDEO';
  }

  static bool isDolbyVisionVideoStream(Map<String, dynamic> stream) {
    if (!isVideoStream(stream)) return false;

    final rangeType = _videoRangeTypeToken(stream);
    final codecDescriptor = _codecDescriptorToken(stream);

    return rangeType.contains('DOVI') ||
        rangeType.contains('DOLBYVISION') ||
        codecDescriptor.contains('DVHE') ||
        codecDescriptor.contains('DVH1') ||
        codecDescriptor.contains('DOVI');
  }

  static bool isHdr10PlusVideoStream(Map<String, dynamic> stream) {
    if (!isVideoStream(stream)) return false;

    final rangeType = _videoRangeTypeToken(stream);
    final codecDescriptor = _codecDescriptorToken(stream);

    return rangeType.contains('HDR10PLUS') ||
        codecDescriptor.contains('HDR10PLUS');
  }

  /// Whether playing [stream] with its Dolby Vision metadata ignored loses
  /// anything. A profile 8.1 base layer is plain HDR10, so on a device that
  /// decodes and displays HDR10 there is nothing to fall back from.
  static bool needsDolbyVisionFallback(Map<String, dynamic> stream) {
    if (!isDolbyVisionVideoStream(stream)) return false;

    final rangeType = _videoRangeTypeToken(stream);
    final hdr10BaseLayer =
        _hdr10CompatibleEmbySubTypes.contains(
          _extendedVideoSubTypeToken(stream),
        ) ||
        (rangeType.contains('WITHHDR10') && !rangeType.contains('WITHEL'));
    if (!hdr10BaseLayer) return true;
    if (!PlatformDetection.supportsHdr10) return true;

    final codec = stream['Codec']?.toString().toLowerCase() ?? '';
    return codec == 'av1'
        ? !PlatformDetection.supportsAv1Hdr10
        : !PlatformDetection.supportsHevcHdr10;
  }

  static DolbyVisionRequiredProfile? requiredDolbyVisionProfile(
    Map<String, dynamic> stream,
  ) {
    if (!isDolbyVisionVideoStream(stream)) {
      return null;
    }

    final rangeType = _videoRangeTypeToken(stream);
    final codecDescriptor = _codecDescriptorToken(stream);

    if (_containsAny(codecDescriptor, const ['DVHE05', 'DVH105', 'PROFILE5'])) {
      return DolbyVisionRequiredProfile.profile5;
    }
    if (_containsAny(codecDescriptor, const ['DVHE07', 'DVH107', 'PROFILE7'])) {
      return DolbyVisionRequiredProfile.profile7;
    }
    if (_containsAny(codecDescriptor, const ['DVHE08', 'DVH108', 'PROFILE8'])) {
      return DolbyVisionRequiredProfile.profile8;
    }

    final embyProfile = _embyDolbyVisionProfile(stream);
    if (embyProfile != null) {
      return embyProfile;
    }

    if (rangeType.contains('WITHEL')) {
      return DolbyVisionRequiredProfile.profile7;
    }
    if (rangeType.contains('WITHHDR10PLUS') || rangeType.contains('WITHHDR10')) {
      return DolbyVisionRequiredProfile.profile7Or8;
    }
    // Jellyfin only writes a bare DOVI for profile 5 and gives every other
    // layout a suffix. Emby's bare DolbyVision covers the whole family, so
    // without a sub type to narrow it down it can only ask for any decoder.
    if (rangeType == 'DOVI') {
      return DolbyVisionRequiredProfile.profile5;
    }
    if (rangeType == 'DOLBYVISION') {
      return DolbyVisionRequiredProfile.any;
    }
    if (rangeType.contains('DOVI') &&
        !rangeType.contains('HDR10') &&
        !rangeType.contains('EL')) {
      return DolbyVisionRequiredProfile.profile5;
    }

    return DolbyVisionRequiredProfile.any;
  }

  static bool streamNeedsDolbyVisionProfileTranscode(
    Map<String, dynamic> stream, {
    bool allowDolbyVisionProfile7ElDirectPlay = false,
  }
  ) {
    final requiredProfile = requiredDolbyVisionProfile(stream);
    if (requiredProfile == null) {
      return false;
    }

    if (!PlatformDetection.supportsDolbyVision) {
      return false;
    }
    if (!PlatformDetection.hasDolbyVisionCodecCapabilities) {
      return false;
    }

    switch (requiredProfile) {
      case DolbyVisionRequiredProfile.profile5:
        return !PlatformDetection.supportsDoViProfile5;
      case DolbyVisionRequiredProfile.profile7:
        if (allowDolbyVisionProfile7ElDirectPlay) {
          return false;
        }
        return !PlatformDetection.supportsDoViProfile7;
      case DolbyVisionRequiredProfile.profile8:
        return !PlatformDetection.supportsDoViProfile8;
      case DolbyVisionRequiredProfile.profile7Or8:
        return !PlatformDetection.supportsDoViProfile7 &&
            !PlatformDetection.supportsDoViProfile8;
      case DolbyVisionRequiredProfile.any:
        return !PlatformDetection.supportsDoViProfile5 &&
            !PlatformDetection.supportsDoViProfile7 &&
            !PlatformDetection.supportsDoViProfile8;
    }
  }

  /// Jellyfin's `VideoRangeType`, or on Emby the typed `ExtendedVideoType`
  /// ahead of the `VideoRange` string it derives from it.
  static String _videoRangeTypeToken(Map<String, dynamic> stream) {
    for (final key in const [
      'VideoRangeType',
      'ExtendedVideoType',
      'VideoRange',
    ]) {
      final token = _normalizeToken(stream[key]?.toString() ?? '');
      if (token.isNotEmpty) return token;
    }
    return '';
  }

  /// Emby's `ExtendedVideoSubType`, such as `DoviProfile81`. Empty on
  /// Jellyfin, which has no such field.
  static String _extendedVideoSubTypeToken(Map<String, dynamic> stream) {
    return _normalizeToken(stream['ExtendedVideoSubType']?.toString() ?? '');
  }

  /// Emby sub types whose base layer is plain HDR10, so a decoder that skips
  /// the Dolby Vision metadata still renders the picture the file carries.
  static const Set<String> _hdr10CompatibleEmbySubTypes = <String>{
    'DOVIPROFILE61',
    'DOVIPROFILE81',
  };

  /// The decoder profile an Emby sub type needs, or null when the stream
  /// carries no Dolby Vision sub type. The digits name the profile first, so
  /// `DoviProfile76` is profile 7 and `DoviProfile81` is profile 8, and only
  /// 5, 7 and 8 have a probed capability to hold against.
  static DolbyVisionRequiredProfile? _embyDolbyVisionProfile(
    Map<String, dynamic> stream,
  ) {
    final subType = _extendedVideoSubTypeToken(stream);
    if (!subType.startsWith('DOVIPROFILE')) return null;
    final profile = subType.substring('DOVIPROFILE'.length);
    if (profile.startsWith('5')) return DolbyVisionRequiredProfile.profile5;
    if (profile.startsWith('7')) return DolbyVisionRequiredProfile.profile7;
    if (profile.startsWith('8')) return DolbyVisionRequiredProfile.profile8;
    return DolbyVisionRequiredProfile.any;
  }

  static String _codecDescriptorToken(Map<String, dynamic> stream) {
    final values = <String>[
      stream['Codec']?.toString() ?? '',
      stream['CodecTag']?.toString() ?? '',
      stream['CodecTagString']?.toString() ?? '',
      stream['CodecId']?.toString() ?? '',
      stream['Profile']?.toString() ?? '',
    ];
    return _normalizeToken(values.join(' '));
  }

  static bool _containsAny(String value, List<String> candidates) {
    for (final candidate in candidates) {
      if (value.contains(candidate)) {
        return true;
      }
    }
    return false;
  }

  static String _normalizeToken(String value) {
    return value.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]+'), '');
  }
}
