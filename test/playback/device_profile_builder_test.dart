import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/audio_capability_profile.dart';
import 'package:moonfin/playback/device_profile_builder.dart';
import 'package:moonfin/playback/known_defects.dart';
import 'package:moonfin/preference/preference_constants.dart';

List<Map<String, dynamic>> _subtitleProfiles(Map<String, dynamic> profile) {
  final profiles = profile['SubtitleProfiles'] as List<dynamic>? ?? const [];
  return profiles.cast<Map<String, dynamic>>();
}

Set<String> _subtitleMethodsFor(Map<String, dynamic> profile, String format) {
  return _subtitleProfiles(profile)
      .where((entry) => entry['Format'] == format)
      .map((entry) => entry['Method'] as String)
      .toSet();
}

Set<String> _codecUnsupportedRangeTypes(
  Map<String, dynamic> profile,
  String codec,
) {
  final codecProfiles = profile['CodecProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in codecProfiles) {
    final codecProfile = rawProfile as Map<dynamic, dynamic>;
    if (codecProfile['Type'] != 'Video' || codecProfile['Codec'] != codec) {
      continue;
    }

    final conditions = codecProfile['Conditions'] as List<dynamic>? ?? const [];
    for (final rawCondition in conditions) {
      final condition = rawCondition as Map<dynamic, dynamic>;
      if (condition['Property'] != 'VideoRangeType') {
        continue;
      }

      final value = condition['Value']?.toString() ?? '';
      return value
          .split('|')
          .map((token) => token.trim())
          .where((token) => token.isNotEmpty)
          .toSet();
    }
  }

  return <String>{};
}

Map<dynamic, dynamic>? _stereoAacFallbackProfile(Map<String, dynamic> profile) {
  final codecProfiles = profile['CodecProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in codecProfiles) {
    final codecProfile = rawProfile as Map<dynamic, dynamic>;
    if (codecProfile['Type'] != 'VideoAudio' ||
        codecProfile['Codec'] != 'aac') {
      continue;
    }

    final conditions = codecProfile['Conditions'] as List<dynamic>? ?? const [];
    final hasStereoCondition = conditions.any((rawCondition) {
      final condition = rawCondition as Map<dynamic, dynamic>;
      return condition['Property'] == 'AudioChannels' &&
          condition['Condition'] == 'LessThanEqual' &&
          condition['Value'] == '2';
    });

    if (hasStereoCondition) {
      return codecProfile;
    }
  }

  return null;
}

String? _videoAudioChannelsConditionValue(Map<String, dynamic> profile) {
  final codecProfiles = profile['CodecProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in codecProfiles) {
    final codecProfile = rawProfile as Map<dynamic, dynamic>;
    if (codecProfile['Type'] != 'VideoAudio' || codecProfile['Codec'] != null) {
      continue;
    }

    final conditions = codecProfile['Conditions'] as List<dynamic>? ?? const [];
    for (final rawCondition in conditions) {
      final condition = rawCondition as Map<dynamic, dynamic>;
      if (condition['Property'] == 'AudioChannels' &&
          condition['Condition'] == 'LessThanEqual') {
        return condition['Value']?.toString();
      }
    }
  }

  return null;
}

List<String> _transcodingMaxAudioChannels(Map<String, dynamic> profile) {
  final transcodingProfiles =
      profile['TranscodingProfiles'] as List<dynamic>? ?? const [];

  return transcodingProfiles
      .map(
        (rawProfile) =>
            (rawProfile as Map<dynamic, dynamic>)['MaxAudioChannels']
                ?.toString(),
      )
      .whereType<String>()
      .toList(growable: false);
}

Set<String> _videoDirectPlayAudioCodecs(Map<String, dynamic> profile) {
  final directPlayProfiles =
      profile['DirectPlayProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in directPlayProfiles) {
    final directPlay = rawProfile as Map<dynamic, dynamic>;
    if (directPlay['Type'] != 'Video') {
      continue;
    }

    final value = directPlay['AudioCodec']?.toString() ?? '';
    return value
        .split(',')
        .map((token) => token.trim())
        .where((token) => token.isNotEmpty)
        .toSet();
  }

  return <String>{};
}

List<Map<dynamic, dynamic>> _hlsVideoTranscodingProfiles(
  Map<String, dynamic> profile,
) {
  final transcodingProfiles =
      profile['TranscodingProfiles'] as List<dynamic>? ?? const [];

  return transcodingProfiles
      .cast<Map<dynamic, dynamic>>()
      .where((raw) => raw['Type'] == 'Video' && raw['Protocol'] == 'hls')
      .toList(growable: false);
}

List<String> _videoTranscodingVideoCodecs(Map<String, dynamic> profile) {
  final transcodingProfiles =
      profile['TranscodingProfiles'] as List<dynamic>? ?? const [];

  return transcodingProfiles
      .where((raw) => (raw as Map<dynamic, dynamic>)['Type'] == 'Video')
      .map(
        (raw) => (raw as Map<dynamic, dynamic>)['VideoCodec']?.toString() ?? '',
      )
      .toList(growable: false);
}

Set<String> _videoDirectPlayVideoCodecs(Map<String, dynamic> profile) {
  final directPlayProfiles =
      profile['DirectPlayProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in directPlayProfiles) {
    final directPlay = rawProfile as Map<dynamic, dynamic>;
    if (directPlay['Type'] != 'Video') {
      continue;
    }

    final value = directPlay['VideoCodec']?.toString() ?? '';
    return value
        .split(',')
        .map((token) => token.trim())
        .where((token) => token.isNotEmpty)
        .toSet();
  }

  return <String>{};
}

List<String> _transcodingAudioCodecList(
  Map<String, dynamic> profile,
  String container,
) {
  final transcodingProfiles =
      profile['TranscodingProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in transcodingProfiles) {
    final transcoding = rawProfile as Map<dynamic, dynamic>;
    if (transcoding['Type'] != 'Video' ||
        transcoding['Container'] != container ||
        transcoding['Protocol'] != 'hls') {
      continue;
    }

    return (transcoding['AudioCodec']?.toString() ?? '')
        .split(',')
        .map((token) => token.trim())
        .where((token) => token.isNotEmpty)
        .toList(growable: false);
  }

  return const <String>[];
}

AudioCapabilityProfile _capabilityProfile({
  bool canDecodeAc3 = true,
  bool canDecodeEac3 = true,
  bool canDecodeDts = true,
  bool canDecodeDtsHd = true,
  bool canDecodeTrueHd = true,
  bool canDecodeFlac = true,
  bool canPassthroughAc3 = false,
  bool canPassthroughEac3 = false,
  bool canPassthroughDts = false,
  bool canPassthroughDtsHd = false,
  bool canPassthroughTrueHd = false,
  int maxPcmChannels = 8,
  AudioRouteType activeRouteType = AudioRouteType.other,
  bool routeSupportsHdAudio = false,
}) {
  return AudioCapabilityProfile(
    canDecodeAc3: canDecodeAc3,
    canDecodeEac3: canDecodeEac3,
    canDecodeDts: canDecodeDts,
    canDecodeDtsHd: canDecodeDtsHd,
    canDecodeTrueHd: canDecodeTrueHd,
    canDecodeFlac: canDecodeFlac,
    canPassthroughAc3: canPassthroughAc3,
    canPassthroughEac3: canPassthroughEac3,
    canPassthroughDts: canPassthroughDts,
    canPassthroughDtsHd: canPassthroughDtsHd,
    canPassthroughTrueHd: canPassthroughTrueHd,
    maxPcmChannels: maxPcmChannels,
    activeRouteType: activeRouteType,
    routeSupportsHdAudio: routeSupportsHdAudio,
  );
}

void main() {
  group('DeviceProfileBuilder HEVC range filtering', () {
    test(
      'does not exclude DoVi HDR10+ only because profile 8 is unsupported',
      () {
        final profile = DeviceProfileBuilder.build(
          supportsHevc: true,
          supportsHevcMain10: true,
          supportsHevcDolbyVision: true,
          supportsHevcDolbyVisionEl: true,
          supportsHevcHdr10: true,
          supportsHevcHdr10Plus: false,
          supportsDvProfile5: true,
          supportsDvProfile7: true,
          supportsDvProfile8: false,
          knownHevcDoviHdr10PlusBug: false,
        );

        final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

        expect(unsupportedRanges, contains('DOVI_WITH_HDR10'));
        expect(unsupportedRanges, isNot(contains('DOVI_WITH_HDR10_PLUS')));
      },
    );

    test('a device with neither DoVi nor HDR10 excludes both profile 8 range '
        'types, since their base layers render as HDR10', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

      expect(unsupportedRanges, contains('DOVI_WITH_HDR10'));
      expect(unsupportedRanges, contains('DOVI_WITH_HDR10_PLUS'));
    });

    test('an HDR10 device without DoVi keeps DoVi HDR10+ direct-playable via '
        'the base layer', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcHdr10: true,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

      expect(unsupportedRanges, isNot(contains('DOVI_WITH_HDR10_PLUS')));
    });

    test('excludes DoVi HDR10+ on a known buggy model without a profile 8 '
        'decoder', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcDolbyVision: true,
        supportsHevcDolbyVisionEl: true,
        supportsHevcHdr10: true,
        supportsHevcHdr10Plus: true,
        supportsDvProfile5: true,
        supportsDvProfile7: true,
        supportsDvProfile8: false,
        knownHevcDoviHdr10PlusBug: true,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

      expect(unsupportedRanges, contains('DOVI_WITH_HDR10_PLUS'));
      expect(unsupportedRanges, contains('DOVI_WITH_ELHDR10_PLUS'));
    });

    test('a profile 8 decoder lifts the buggy model exclusion, since the '
        'Dolby Vision route sidesteps the broken HDR10+ handling', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcDolbyVision: true,
        supportsHevcDolbyVisionEl: true,
        supportsHevcHdr10: true,
        supportsHevcHdr10Plus: true,
        supportsDvProfile5: true,
        supportsDvProfile7: true,
        supportsDvProfile8: true,
        knownHevcDoviHdr10PlusBug: true,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

      expect(unsupportedRanges, isNot(contains('DOVI_WITH_HDR10_PLUS')));
      expect(unsupportedRanges, isNot(contains('DOVI_WITH_ELHDR10_PLUS')));
    });

    test('skipping device defects keeps DoVi HDR10+ direct-playable on a buggy '
        'model (external players decode with their own pipeline)', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcDolbyVision: true,
        supportsHevcDolbyVisionEl: true,
        supportsHevcHdr10: true,
        supportsHevcHdr10Plus: true,
        supportsDvProfile5: true,
        supportsDvProfile7: true,
        supportsDvProfile8: true,
        knownHevcDoviHdr10PlusBug: true,
        applyKnownDeviceDefects: false,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

      expect(unsupportedRanges, isNot(contains('DOVI_WITH_HDR10_PLUS')));
      expect(unsupportedRanges, isNot(contains('DOVI_WITH_ELHDR10_PLUS')));
    });
  });

  group('DeviceProfileBuilder DOVIInvalid range filtering', () {
    test('allows AV1 DOVIInvalid direct play when the client supports AV1 '
        'HDR10', () {
      final profile = DeviceProfileBuilder.build(
        supportsAv1: true,
        supportsAv1Main10: true,
        supportsAv1Hdr10: true,
        supportsAv1DolbyVision: false,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'av1');

      expect(unsupportedRanges, isNot(contains('DOVI_INVALID')));
    });

    test("blocks AV1 DOVIInvalid when the client can't render AV1 HDR10", () {
      final profile = DeviceProfileBuilder.build(
        supportsAv1: true,
        supportsAv1Main10: true,
        supportsAv1Hdr10: false,
        supportsAv1DolbyVision: false,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'av1');

      expect(unsupportedRanges, contains('DOVI_INVALID'));
    });

    test('allows HEVC DOVIInvalid direct play when the client supports HEVC '
        'HDR10', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcHdr10: true,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

      expect(unsupportedRanges, isNot(contains('DOVI_INVALID')));
    });

    test("blocks HEVC DOVIInvalid when the client can't render HEVC HDR10", () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcHdr10: false,
      );

      final unsupportedRanges = _codecUnsupportedRangeTypes(profile, 'hevc');

      expect(unsupportedRanges, contains('DOVI_INVALID'));
    });
  });

  group('DeviceProfileBuilder HLS transcode video codec', () {
    test('transcodes only to h264 when the server was not probed as allowing '
        'HEVC encoding', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcHdr10: true,
      );

      final videoTargets = _videoTranscodingVideoCodecs(profile);
      expect(videoTargets, isNotEmpty);
      for (final codec in videoTargets) {
        expect(codec, 'h264');
      }

      // Direct play still advertises hevc, so HEVC content plays without
      // transcoding.
      expect(_videoDirectPlayVideoCodecs(profile), contains('hevc'));
    });

    test('offers hevc ahead of h264 when the server allows HEVC encoding and '
        'the device decodes it', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        supportsHevcMain10: true,
        supportsHevcHdr10: true,
        transcodeHevcAllowed: true,
      );

      final videoTargets = _videoTranscodingVideoCodecs(profile);
      expect(videoTargets, isNotEmpty);
      for (final codec in videoTargets) {
        expect(codec, 'hevc,h264');
      }
    });

    test('keeps h264 only when the server allows HEVC encoding but the device '
        'lacks hevc decode', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: false,
        transcodeHevcAllowed: true,
      );

      final videoTargets = _videoTranscodingVideoCodecs(profile);
      expect(videoTargets, isNotEmpty);
      for (final codec in videoTargets) {
        expect(codec, 'h264');
      }
    });

    test('hevcRequiresFmp4Hls keeps HEVC out of the TS offer and lists fMP4 '
        'first', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        transcodeHevcAllowed: true,
        hevcRequiresFmp4Hls: true,
      );

      final videoProfiles = _hlsVideoTranscodingProfiles(profile);
      expect(videoProfiles.first['Container'], 'mp4');
      expect(videoProfiles.first['VideoCodec'], 'hevc,h264');
      final ts = videoProfiles.firstWhere((p) => p['Container'] == 'ts');
      expect(ts['VideoCodec'], 'h264');
    });

    test('without hevcRequiresFmp4Hls the TS offer keeps HEVC and stays '
        'first', () {
      final profile = DeviceProfileBuilder.build(
        supportsHevc: true,
        transcodeHevcAllowed: true,
      );

      final videoProfiles = _hlsVideoTranscodingProfiles(profile);
      expect(videoProfiles.first['Container'], 'ts');
      expect(videoProfiles.first['VideoCodec'], 'hevc,h264');
    });
  });

  group('DeviceProfileBuilder subtitle delivery', () {
    test("a player that can't read embedded subtitles is offered none", () {
      final profile = DeviceProfileBuilder.build(
        supportsEmbeddedSubtitles: false,
        supportsExternalTextSubtitles: false,
      );

      expect(
        _subtitleProfiles(profile).where((entry) => entry['Method'] == 'Embed'),
        isEmpty,
      );
    });

    test('text subtitles keep a vtt route the server can convert into', () {
      final profile = DeviceProfileBuilder.build(
        supportsEmbeddedSubtitles: false,
        supportsExternalTextSubtitles: false,
      );

      expect(_subtitleMethodsFor(profile, 'vtt'), contains('External'));
      expect(_subtitleMethodsFor(profile, 'ass'), contains('External'));
    });

    test('a player that reads embedded subtitles still gets them', () {
      final profile = DeviceProfileBuilder.build();

      expect(_subtitleMethodsFor(profile, 'vtt'), contains('Embed'));
      expect(_subtitleMethodsFor(profile, 'srt'), contains('Embed'));
    });
  });

  group('DeviceProfileBuilder stereo AAC fallback', () {
    test('adds stereo AAC fallback profile when enabled', () {
      final profile = DeviceProfileBuilder.build(maxAudioChannels: 2);

      expect(_stereoAacFallbackProfile(profile), isNotNull);
    });

    test('does not add stereo AAC fallback profile when disabled', () {
      final profile = DeviceProfileBuilder.build(maxAudioChannels: 6);

      expect(_stereoAacFallbackProfile(profile), isNull);
    });
  });

  group('DeviceProfileBuilder audio codec advertisement', () {
    test('keeps surround codecs in direct-play profile by default', () {
      final profile = DeviceProfileBuilder.build();

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, contains('ac3'));
      expect(codecs, contains('eac3'));
      expect(codecs, contains('dts'));
      expect(codecs, contains('dca'));
      // Android has no hardware TrueHD/MLP decoder, but the bundled FFmpeg
      // decoder handles them, so they stay advertised there.
      expect(codecs, contains('truehd'));
      expect(codecs, contains('mlp'));
    });

    test('keeps TrueHD for direct play but not the fmp4 transcode target', () {
      final profile = DeviceProfileBuilder.build();

      expect(_videoDirectPlayAudioCodecs(profile), contains('truehd'));

      final fmp4 = _transcodingAudioCodecList(profile, 'mp4');
      expect(fmp4, isNot(contains('truehd')));
      expect(
        fmp4.any({'aac', 'ac3', 'eac3'}.contains),
        isTrue,
        reason: 'the transcode target still needs a re-encodable fallback',
      );
    });

    test(
      'keeps codec when local decode is available even without passthrough',
      () {
        final profile = DeviceProfileBuilder.build(
          audioCapabilityProfile: _capabilityProfile(
            canDecodeDts: true,
            canPassthroughDts: false,
            canPassthroughDtsHd: false,
          ),
          dtsCorePassthroughEnabled: false,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, contains('dts'));
        expect(codecs, contains('dca'));
      },
    );

    test(
      'keeps codec when decode is unavailable but passthrough is enabled',
      () {
        final profile = DeviceProfileBuilder.build(
          audioCapabilityProfile: _capabilityProfile(
            canDecodeTrueHd: false,
            canPassthroughTrueHd: true,
          ),
          trueHdPassthroughEnabled: true,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, contains('truehd'));
        expect(codecs, contains('mlp'));
      },
    );

    test('the DTS core toggle alone decides the dts/dca advertisement, since '
        'DTS-HD is a core stream plus a profile rather than its own codec', () {
      final capabilities = _capabilityProfile(
        canDecodeDts: false,
        canDecodeDtsHd: false,
        canPassthroughDts: false,
        canPassthroughDtsHd: true,
      );

      final kept = _videoDirectPlayAudioCodecs(
        DeviceProfileBuilder.build(
          audioCapabilityProfile: capabilities,
          dtsCorePassthroughEnabled: true,
        ),
      );
      expect(kept, containsAll(<String>['dts', 'dca']));

      final dropped = _videoDirectPlayAudioCodecs(
        DeviceProfileBuilder.build(
          audioCapabilityProfile: capabilities,
          dtsCorePassthroughEnabled: false,
        ),
      );
      expect(dropped, isNot(contains('dts')));
      expect(dropped, isNot(contains('dca')));
    });

    test('includes codec when the passthrough toggle is on, even if the probe '
        'did not detect support', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          canDecodeAc3: false,
          canDecodeEac3: false,
          canPassthroughAc3: false,
          canPassthroughEac3: false,
        ),
        ac3PassthroughEnabled: true,
        eac3PassthroughEnabled: true,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, contains('ac3'));
      expect(codecs, contains('eac3'));
    });

    test(
      'removes codec when decode is unsupported and the passthrough toggle is off',
      () {
        final profile = DeviceProfileBuilder.build(
          audioCapabilityProfile: _capabilityProfile(
            canDecodeAc3: false,
            canDecodeEac3: false,
            canPassthroughAc3: false,
            canPassthroughEac3: false,
          ),
          ac3PassthroughEnabled: false,
          eac3PassthroughEnabled: false,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, isNot(contains('ac3')));
        expect(codecs, isNot(contains('eac3')));
      },
    );

    test('eac3 fallback sets HLS MPEG-TS targets in preferred order', () {
      final profile = DeviceProfileBuilder.build(
        audioFallbackCodec: AudioFallbackCodec.eac3,
        audioCapabilityProfile: _capabilityProfile(
          canDecodeAc3: true,
          canDecodeEac3: true,
        ),
      );

      final codecs = _transcodingAudioCodecList(profile, 'ts');
      expect(
        codecs,
        equals(<String>['eac3', 'ac3', 'aac', 'mp3', 'dts', 'mp2']),
      );
    });

    test(
      'downmix keeps only stereo-safe audio codecs for a non-universal player',
      () {
        final profile = DeviceProfileBuilder.build(downmixToStereo: true);

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, equals(<String>{'aac', 'mp2', 'mp3'}));
      },
    );
  });

  group('DeviceProfileBuilder universalAudioDecode', () {
    test(
      'downmix keeps the full codec list and 8ch direct play when the player '
      'decodes everything in software',
      () {
        final profile = DeviceProfileBuilder.build(
          downmixToStereo: true,
          universalAudioDecode: true,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(
          codecs,
          containsAll(<String>['ac3', 'eac3', 'dts', 'truehd', 'flac', 'opus']),
        );
        expect(_stereoAacFallbackProfile(profile), isNull);
        expect(_videoAudioChannelsConditionValue(profile), '8');
      },
    );

    test(
      'a detected 2ch speaker route no longer restricts direct play (the AAC '
      '5.1 transcode bug)',
      () {
        final profile = DeviceProfileBuilder.build(
          audioCapabilityProfile: _capabilityProfile(
            maxPcmChannels: 2,
            activeRouteType: AudioRouteType.speaker,
          ),
          universalAudioDecode: true,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(
          codecs,
          containsAll(<String>['aac', 'ac3', 'eac3', 'dts', 'truehd', 'flac']),
        );
        expect(_stereoAacFallbackProfile(profile), isNull);
        expect(_videoAudioChannelsConditionValue(profile), '8');
      },
    );

    test(
      'an explicit user channel cap is still honored without collapsing codecs',
      () {
        final profile = DeviceProfileBuilder.build(
          maxAudioChannels: 2,
          universalAudioDecode: true,
        );

        expect(_videoAudioChannelsConditionValue(profile), '2');
        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, contains('ac3'));
        expect(_stereoAacFallbackProfile(profile), isNull);
      },
    );

    test(
      'never transcodes for audio: every supported codec is advertised across '
      'routes, toggle states and failed capability probes',
      () {
        const everyCodec = <String>[
          'ac3',
          'eac3',
          'dts',
          'dca',
          'truehd',
          'mlp',
          'flac',
          'opus',
          'aac',
        ];
        for (final route in AudioRouteType.values) {
          for (final togglesOn in const <bool>[false, true]) {
            for (final canDecode in const <bool>[false, true]) {
              final profile = DeviceProfileBuilder.build(
                audioCapabilityProfile: _capabilityProfile(
                  activeRouteType: route,
                  canDecodeAc3: canDecode,
                  canDecodeEac3: canDecode,
                  canDecodeDts: canDecode,
                  canDecodeDtsHd: canDecode,
                  canDecodeTrueHd: canDecode,
                  canDecodeFlac: canDecode,
                ),
                universalAudioDecode: true,
                ac3PassthroughEnabled: togglesOn,
                eac3PassthroughEnabled: togglesOn,
                dtsCorePassthroughEnabled: togglesOn,
                trueHdPassthroughEnabled: togglesOn,
              );

              expect(
                _videoDirectPlayAudioCodecs(profile),
                containsAll(everyCodec),
                reason:
                    'route: ${route.name}, toggles: $togglesOn, '
                    'canDecode: $canDecode',
              );
            }
          }
        }
      },
    );

    test(
      'stereo output keeps a stereo transcode target via TranscodingProfiles '
      'for a non-universal player',
      () {
        final profile = DeviceProfileBuilder.build(
          downmixToStereo: true,
          universalAudioDecode: false,
        );

        final channels = _transcodingMaxAudioChannels(profile);
        expect(channels, isNotEmpty);
        expect(channels, everyElement('2'));
      },
    );

    test('downmix with universal decode doesn\'t cap the transcode target '
        '(stereo comes from the local downmix, and a video-forced transcode '
        'must keep multichannel audio)', () {
      final profile = DeviceProfileBuilder.build(
        downmixToStereo: true,
        universalAudioDecode: true,
      );

      expect(_transcodingMaxAudioChannels(profile), isEmpty);
      expect(_videoAudioChannelsConditionValue(profile), '8');
    });

    test('an explicit stereo channel cap also caps the transcode target', () {
      final profile = DeviceProfileBuilder.build(
        maxAudioChannels: 2,
        universalAudioDecode: true,
      );

      final channels = _transcodingMaxAudioChannels(profile);
      expect(channels, isNotEmpty);
      expect(channels, everyElement('2'));
      expect(_videoAudioChannelsConditionValue(profile), '2');
    });

    test('multichannel routes do not cap the transcode target', () {
      final profile = DeviceProfileBuilder.build(universalAudioDecode: true);

      expect(_transcodingMaxAudioChannels(profile), isEmpty);
    });

    test(
      'advertises ac3 even when the platform reports no hardware decoder',
      () {
        final profile = DeviceProfileBuilder.build(
          audioCapabilityProfile: _capabilityProfile(
            canDecodeAc3: false,
            canDecodeEac3: false,
          ),
          universalAudioDecode: true,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, contains('ac3'));
        expect(codecs, contains('eac3'));
      },
    );

    test('advertises TrueHD on iOS, where the engine bridges it', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: const AudioCapabilityProfile.optimistic(),
        universalAudioDecode: true,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(
        codecs,
        containsAll(<String>['truehd', 'mlp', 'ac3', 'eac3', 'dts', 'flac']),
      );
    });
  });

  group('DeviceProfileBuilder audio transcode targets', () {
    test('TrueHD is never offered as a transcode target, since Jellyfin '
        "can't repackage it and the stream lands silent", () {
      for (final route in AudioRouteType.values) {
        final profile = DeviceProfileBuilder.build(
          audioCapabilityProfile: _capabilityProfile(activeRouteType: route),
          universalAudioDecode: true,
        );

        for (final container in const <String>['ts', 'mp4']) {
          final codecs = _transcodingAudioCodecList(profile, container);
          expect(codecs, isNot(contains('truehd')));
          expect(codecs, isNot(contains('mlp')));
        }
      }
    });

    test('every direct-played codec the container carries is also offered for '
        'transcode, so the server copies audio instead of encoding it', () {
      final profile = DeviceProfileBuilder.build(universalAudioDecode: true);

      expect(
        _transcodingAudioCodecList(profile, 'ts'),
        containsAll(<String>['aac', 'ac3', 'eac3', 'dts', 'mp3']),
      );
      expect(
        _transcodingAudioCodecList(profile, 'mp4'),
        containsAll(<String>['aac', 'ac3', 'eac3', 'dts', 'flac', 'opus']),
      );
    });

    test('the fallback preference only decides the encode target and never '
        'drops a copyable codec', () {
      final profile = DeviceProfileBuilder.build(
        universalAudioDecode: true,
        audioFallbackCodec: AudioFallbackCodec.eac3,
      );

      final tsCodecs = _transcodingAudioCodecList(profile, 'ts');
      expect(tsCodecs.first, 'eac3');
      expect(tsCodecs, containsAll(<String>['aac', 'ac3', 'dts', 'mp3']));
    });

    test('a stereo cap keeps the transcode offer stereo-safe', () {
      final profile = DeviceProfileBuilder.build(maxAudioChannels: 2);

      final tsCodecs = _transcodingAudioCodecList(profile, 'ts');
      expect(tsCodecs, isNot(contains('ac3')));
      expect(tsCodecs, isNot(contains('dts')));
      expect(tsCodecs, contains('aac'));
    });

    test('a player with no DTS decoder keeps DTS off both offers, since the '
        'server copies any codec it sees listed', () {
      final profile = DeviceProfileBuilder.build(hlsAudioExcludesDts: true);

      expect(_transcodingAudioCodecList(profile, 'ts'), isNot(contains('dts')));
      expect(
        _transcodingAudioCodecList(profile, 'mp4'),
        isNot(contains('dts')),
      );
      expect(_transcodingAudioCodecList(profile, 'ts'), contains('aac'));
      expect(_transcodingAudioCodecList(profile, 'mp4'), contains('aac'));
    });
  });

  group('KnownDefects model mapping', () {
    test('matches the known MediaTek Fire TV models for the DoVi HDR10+ bug '
        'regardless of case', () {
      expect(KnownDefects.modelHasHevcDoviHdr10PlusBug('AFTKRT'), isTrue);
      expect(KnownDefects.modelHasHevcDoviHdr10PlusBug('aftmm'), isTrue);
      expect(KnownDefects.modelHasHevcDoviHdr10PlusBug('AFTSSS'), isFalse);
    });
  });

  group('KnownDefects DoVi Profile 7 EL direct play', () {
    test(
      'enabled and disabled behaviors take precedence over device signals',
      () {
        expect(
          KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
            behavior: DolbyVisionProfile7DirectPlayBehavior.enabled,
            hasHardwareDolbyVisionDecoder: false,
          ),
          isTrue,
        );
        expect(
          KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
            behavior: DolbyVisionProfile7DirectPlayBehavior.disabled,
            hasHardwareDolbyVisionDecoder: true,
          ),
          isFalse,
        );
      },
    );

    test('auto allows direct play when a hardware DoVi decoder is present', () {
      expect(
        KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
          behavior: DolbyVisionProfile7DirectPlayBehavior.auto,
          model: 'not-in-allowlist',
          hasHardwareDolbyVisionDecoder: true,
        ),
        isTrue,
      );
    });

    test('auto allows direct play when the DoVi compat chain is present', () {
      expect(
        KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
          behavior: DolbyVisionProfile7DirectPlayBehavior.auto,
          model: 'not-in-allowlist',
          hasHardwareDolbyVisionDecoder: false,
          hasDoviCompat: true,
        ),
        isTrue,
      );
    });

    test('disabled still blocks direct play with the compat chain present', () {
      expect(
        KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
          behavior: DolbyVisionProfile7DirectPlayBehavior.disabled,
          hasHardwareDolbyVisionDecoder: true,
          hasDoviCompat: true,
        ),
        isFalse,
      );
    });
  });

  group('DeviceProfileBuilder direct play containers', () {
    Map<String, dynamic> videoDirectPlayProfile(Map<String, dynamic> profile) {
      final directPlay = (profile['DirectPlayProfiles'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      return directPlay.firstWhere((p) => p['Type'] == 'Video');
    }

    test('the default list matches the shared mpv-capable containers', () {
      final profile = DeviceProfileBuilder.build();

      expect(
        videoDirectPlayProfile(profile)['Container'],
        DeviceProfileBuilder.defaultDirectPlayVideoContainers,
      );
    });

    test('a caller-supplied list replaces the default', () {
      final profile = DeviceProfileBuilder.build(
        directPlayVideoContainers: 'mkv,mp4',
      );

      expect(videoDirectPlayProfile(profile)['Container'], 'mkv,mp4');
    });
  });
}
