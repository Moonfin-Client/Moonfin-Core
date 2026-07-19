import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/audio_capability_profile.dart';
import 'package:moonfin/playback/device_profile_builder.dart';
import 'package:moonfin/playback/known_defects.dart';
import 'package:moonfin/preference/preference_constants.dart';

Set<String> _hevcUnsupportedRangeTypes(Map<String, dynamic> profile) {
  final codecProfiles = profile['CodecProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in codecProfiles) {
    final codecProfile = rawProfile as Map<dynamic, dynamic>;
    if (codecProfile['Type'] != 'Video' || codecProfile['Codec'] != 'hevc') {
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
    if (codecProfile['Type'] != 'VideoAudio' || codecProfile['Codec'] != 'aac') {
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
      .map((rawProfile) =>
          (rawProfile as Map<dynamic, dynamic>)['MaxAudioChannels']?.toString())
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

Set<String> _hlsMpegTsAudioCodecs(Map<String, dynamic> profile) {
  final transcodingProfiles =
      profile['TranscodingProfiles'] as List<dynamic>? ?? const [];

  for (final rawProfile in transcodingProfiles) {
    final transcoding = rawProfile as Map<dynamic, dynamic>;
    if (transcoding['Type'] != 'Video' ||
        transcoding['Container'] != 'ts' ||
        transcoding['Protocol'] != 'hls') {
      continue;
    }

    final value = transcoding['AudioCodec']?.toString() ?? '';
    return value
        .split(',')
        .map((token) => token.trim())
        .where((token) => token.isNotEmpty)
        .toSet();
  }

  return <String>{};
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
  bool canPassthroughEac3Joc = false,
  bool canPassthroughDts = false,
  bool canPassthroughDtsHd = false,
  bool canPassthroughDtsX = false,
  bool canPassthroughTrueHd = false,
  bool canPassthroughTrueHdJoc = false,
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
    canPassthroughEac3Joc: canPassthroughEac3Joc,
    canPassthroughDts: canPassthroughDts,
    canPassthroughDtsHd: canPassthroughDtsHd,
    canPassthroughDtsX: canPassthroughDtsX,
    canPassthroughTrueHd: canPassthroughTrueHd,
    canPassthroughTrueHdJoc: canPassthroughTrueHdJoc,
    maxPcmChannels: maxPcmChannels,
    activeRouteType: activeRouteType,
    routeSupportsHdAudio: routeSupportsHdAudio,
  );
}

void main() {
  group('DeviceProfileBuilder HEVC range filtering', () {
    test('does not exclude DoVi HDR10+ only because profile 8 is unsupported', () {
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

      final unsupportedRanges = _hevcUnsupportedRangeTypes(profile);

      expect(unsupportedRanges, contains('DOVI_WITH_HDR10'));
      expect(unsupportedRanges, isNot(contains('DOVI_WITH_HDR10_PLUS')));
    });

    test('excludes DoVi HDR10+ when known buggy model flag is set', () {
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

      final unsupportedRanges = _hevcUnsupportedRangeTypes(profile);

      expect(unsupportedRanges, contains('DOVI_WITH_HDR10_PLUS'));
      expect(unsupportedRanges, contains('DOVI_WITH_ELHDR10_PLUS'));
    });

    test(
      'skipping device defects keeps DoVi HDR10+ direct-playable on a buggy '
      'model (external players decode with their own pipeline)',
      () {
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

        final unsupportedRanges = _hevcUnsupportedRangeTypes(profile);

        expect(unsupportedRanges, isNot(contains('DOVI_WITH_HDR10_PLUS')));
        expect(unsupportedRanges, isNot(contains('DOVI_WITH_ELHDR10_PLUS')));
      },
    );
  });

  group('DeviceProfileBuilder stereo AAC fallback', () {
    test('adds stereo AAC fallback profile when enabled', () {
      final profile = DeviceProfileBuilder.build(
        maxAudioChannels: 2,
      );

      expect(_stereoAacFallbackProfile(profile), isNotNull);
    });

    test('does not add stereo AAC fallback profile when disabled', () {
      final profile = DeviceProfileBuilder.build(
        maxAudioChannels: 6,
      );

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

    test('keeps codec when local decode is available even without passthrough', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          canDecodeDts: true,
          canPassthroughDts: false,
          canPassthroughDtsHd: false,
        ),
        dtsCorePassthroughEnabled: false,
        dtsHdPassthroughEnabled: false,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, contains('dts'));
      expect(codecs, contains('dca'));
    });

    test(
      'in AVR passthrough mode, a locally-decodable codec stays direct-playable '
      'even when its passthrough toggle is off (libmpv decodes to PCM)',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.avrPassthrough,
          audioCapabilityProfile: _capabilityProfile(
            canDecodeDts: true,
            canDecodeDtsHd: true,
          ),
          dtsCorePassthroughEnabled: false,
          dtsHdPassthroughEnabled: false,
          dtsXPassthroughEnabled: false,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, contains('dts'));
        expect(codecs, contains('dca'));
      },
    );

    test(
      'in AVR passthrough mode, a codec that can neither be decoded nor passed '
      'through is removed (hardware-only backends stay gated)',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.avrPassthrough,
          audioCapabilityProfile: _capabilityProfile(
            canDecodeDts: false,
            canDecodeDtsHd: false,
            canPassthroughDts: false,
            canPassthroughDtsHd: false,
          ),
          dtsCorePassthroughEnabled: false,
          dtsHdPassthroughEnabled: false,
          dtsXPassthroughEnabled: false,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, isNot(contains('dts')));
        expect(codecs, isNot(contains('dca')));
      },
    );

    test(
      'in AVR passthrough mode on an AV receiver route, a disabled passthrough '
      'toggle removes the codec even when local decode is available (the '
      'receiver, not a local PCM downmix, should handle it)',
      () {
        for (final route in const <AudioRouteType>[
          AudioRouteType.hdmi,
          AudioRouteType.arc,
          AudioRouteType.earc,
        ]) {
          final profile = DeviceProfileBuilder.build(
            audioOutputMode: AudioOutputMode.avrPassthrough,
            audioCapabilityProfile: _capabilityProfile(
              canDecodeDts: true,
              canDecodeDtsHd: true,
              canPassthroughDts: false,
              canPassthroughDtsHd: false,
              activeRouteType: route,
            ),
            dtsCorePassthroughEnabled: false,
            dtsHdPassthroughEnabled: false,
            dtsXPassthroughEnabled: false,
          );

          final codecs = _videoDirectPlayAudioCodecs(profile);
          expect(codecs, isNot(contains('dts')), reason: 'route: ${route.name}');
          expect(codecs, isNot(contains('dca')), reason: 'route: ${route.name}');
        }
      },
    );

    test(
      'in AVR passthrough mode on an AV receiver route, an enabled-and-supported '
      'passthrough toggle keeps the codec direct-playable',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.avrPassthrough,
          audioCapabilityProfile: _capabilityProfile(
            canDecodeDts: true,
            canDecodeDtsHd: true,
            canPassthroughDts: true,
            canPassthroughDtsHd: true,
            activeRouteType: AudioRouteType.earc,
          ),
          dtsCorePassthroughEnabled: true,
          dtsHdPassthroughEnabled: true,
          dtsXPassthroughEnabled: false,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, contains('dts'));
        expect(codecs, contains('dca'));
      },
    );

    test('keeps codec when decode is unavailable but passthrough is enabled and supported', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          canDecodeTrueHd: false,
          canPassthroughTrueHd: true,
        ),
        trueHdPassthroughEnabled: true,
        trueHdAtmosPassthroughEnabled: false,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, contains('truehd'));
      expect(codecs, contains('mlp'));
    });

    test('keeps DTS codec when DTS:X passthrough is enabled and supported', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          canDecodeDts: false,
          canDecodeDtsHd: false,
          canPassthroughDts: false,
          canPassthroughDtsHd: false,
          canPassthroughDtsX: true,
        ),
        dtsCorePassthroughEnabled: true,
        dtsHdPassthroughEnabled: true,
        dtsXPassthroughEnabled: true,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, contains('dts'));
      expect(codecs, contains('dca'));
    });

    test(
      'removes DTS codec when DTS core is disabled even if DTS-HD and DTS:X toggles are enabled',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.avrPassthrough,
          audioCapabilityProfile: _capabilityProfile(
            canDecodeDts: false,
            canDecodeDtsHd: false,
            canPassthroughDts: false,
            canPassthroughDtsHd: true,
            canPassthroughDtsX: true,
          ),
          dtsCorePassthroughEnabled: false,
          dtsHdPassthroughEnabled: true,
          dtsXPassthroughEnabled: true,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, isNot(contains('dts')));
        expect(codecs, isNot(contains('dca')));
      },
    );

    test('keeps TrueHD codec when TrueHD JOC passthrough is enabled and supported', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          canDecodeTrueHd: false,
          canPassthroughTrueHd: false,
          canPassthroughTrueHdJoc: true,
        ),
        trueHdPassthroughEnabled: true,
        trueHdAtmosPassthroughEnabled: true,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, contains('truehd'));
      expect(codecs, contains('mlp'));
    });

    test(
      'removes TrueHD codec when base TrueHD toggle is disabled even if Atmos toggle is enabled',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.avrPassthrough,
          audioCapabilityProfile: _capabilityProfile(
            canDecodeTrueHd: false,
            canPassthroughTrueHd: false,
            canPassthroughTrueHdJoc: true,
            activeRouteType: AudioRouteType.earc,
          ),
          trueHdPassthroughEnabled: false,
          trueHdAtmosPassthroughEnabled: true,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, isNot(contains('truehd')));
        expect(codecs, isNot(contains('mlp')));
      },
    );

    test(
      'includes codec when user passthrough toggle is on, even if probe did not detect support',
      () {
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
      },
    );

    test(
      'removes codec when decode unsupported and passthrough toggle is off',
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

      final codecs = _hlsMpegTsAudioCodecs(profile);
      expect(codecs, equals(<String>{'eac3', 'ac3', 'aac', 'mp3'}));
    });

    test('downmix mode keeps only stereo-safe audio codecs', () {
      final profile = DeviceProfileBuilder.build(
        audioOutputMode: AudioOutputMode.forceStereo,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, equals(<String>{'aac', 'mp2', 'mp3'}));
    });
  });

  group('DeviceProfileBuilder universalAudioDecode', () {
    test(
      'downmix mode keeps the full codec list and 8ch direct play when the '
      'player decodes everything in software',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.forceStereo,
          universalAudioDecode: true,
        );

        final codecs = _videoDirectPlayAudioCodecs(profile);
        expect(codecs, containsAll(<String>['ac3', 'eac3', 'dts', 'truehd', 'flac', 'opus']));
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
        expect(codecs, containsAll(<String>['aac', 'ac3', 'eac3', 'dts', 'truehd', 'flac']));
        expect(_stereoAacFallbackProfile(profile), isNull);
        expect(_videoAudioChannelsConditionValue(profile), '8');
      },
    );

    test('an explicit user channel cap is still honored without collapsing codecs', () {
      final profile = DeviceProfileBuilder.build(
        maxAudioChannels: 2,
        universalAudioDecode: true,
      );

      expect(_videoAudioChannelsConditionValue(profile), '2');
      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, contains('ac3'));
      expect(_stereoAacFallbackProfile(profile), isNull);
    });

    test('does not bypass AVR passthrough gating on an AV receiver route', () {
      final profile = DeviceProfileBuilder.build(
        audioOutputMode: AudioOutputMode.avrPassthrough,
        audioCapabilityProfile: _capabilityProfile(
          canDecodeDts: true,
          canDecodeDtsHd: true,
          activeRouteType: AudioRouteType.hdmi,
        ),
        universalAudioDecode: true,
        dtsCorePassthroughEnabled: false,
        dtsHdPassthroughEnabled: false,
        dtsXPassthroughEnabled: false,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, isNot(contains('dts')));
      expect(codecs, isNot(contains('dca')));
    });

    test(
      'stereo output keeps a stereo transcode target via TranscodingProfiles '
      'for a non-universal player',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.forceStereo,
          universalAudioDecode: false,
        );

        final channels = _transcodingMaxAudioChannels(profile);
        expect(channels, isNotEmpty);
        expect(channels, everyElement('2'));
      },
    );

    test(
      'stereo mode with universal decode doesn\'t cap the transcode target '
      '(stereo comes from the local downmix, and a video-forced transcode '
      'must keep multichannel audio)',
      () {
        final profile = DeviceProfileBuilder.build(
          audioOutputMode: AudioOutputMode.forceStereo,
          universalAudioDecode: true,
        );

        expect(_transcodingMaxAudioChannels(profile), isEmpty);
        expect(_videoAudioChannelsConditionValue(profile), '8');
      },
    );

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
      final profile = DeviceProfileBuilder.build(
        universalAudioDecode: true,
      );

      expect(_transcodingMaxAudioChannels(profile), isEmpty);
    });

    test('advertises ac3 even when the platform reports no hardware decoder', () {
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
    });

    test('does not advertise TrueHD on iOS, which ships no decoder for it', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: const AudioCapabilityProfile.appleMobile(),
        universalAudioDecode: true,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, isNot(contains('truehd')));
      expect(codecs, isNot(contains('mlp')));
      // Everything else still decodes in software.
      expect(codecs, containsAll(<String>['ac3', 'eac3', 'dts', 'flac']));
    });
  });

  group('DeviceProfileBuilder lossless AVR-route gating (media3)', () {
    test('arc route drops truehd/mlp (ARC can\'t carry TrueHD)', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          activeRouteType: AudioRouteType.arc,
        ),
        universalAudioDecode: true,
        losslessAudioRequiresPassthroughOnAvrRoutes: true,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, isNot(contains('truehd')));
      expect(codecs, isNot(contains('mlp')));
      // Non-lossless codecs are untouched by the gate.
      expect(codecs, containsAll(<String>['ac3', 'eac3', 'flac']));
    });

    test('hdmi route keeps truehd when passthrough is enabled and capable', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          activeRouteType: AudioRouteType.hdmi,
          canPassthroughTrueHd: true,
        ),
        universalAudioDecode: true,
        losslessAudioRequiresPassthroughOnAvrRoutes: true,
        trueHdPassthroughEnabled: true,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, containsAll(<String>['truehd', 'mlp']));
    });

    test('hdmi route drops truehd when the passthrough toggle is off', () {
      final profile = DeviceProfileBuilder.build(
        audioCapabilityProfile: _capabilityProfile(
          activeRouteType: AudioRouteType.hdmi,
          canPassthroughTrueHd: true,
        ),
        universalAudioDecode: true,
        losslessAudioRequiresPassthroughOnAvrRoutes: true,
        trueHdPassthroughEnabled: false,
      );

      final codecs = _videoDirectPlayAudioCodecs(profile);
      expect(codecs, isNot(contains('truehd')));
      expect(codecs, isNot(contains('mlp')));
    });

    test(
      'headphones and bluetooth routes keep truehd (pure local FFmpeg decode)',
      () {
        for (final route in <AudioRouteType>[
          AudioRouteType.headphones,
          AudioRouteType.bluetooth,
        ]) {
          final profile = DeviceProfileBuilder.build(
            audioCapabilityProfile: _capabilityProfile(activeRouteType: route),
            universalAudioDecode: true,
            losslessAudioRequiresPassthroughOnAvrRoutes: true,
          );

          expect(
            _videoDirectPlayAudioCodecs(profile),
            containsAll(<String>['truehd', 'mlp']),
            reason: 'route: $route',
          );
        }
      },
    );

    test(
      'hdmi route keeps truehd when the flag is not set (Apple TV and '
      'media_kit decode locally via mpv)',
      () {
        final profile = DeviceProfileBuilder.build(
          audioCapabilityProfile: _capabilityProfile(
            activeRouteType: AudioRouteType.hdmi,
          ),
          universalAudioDecode: true,
        );

        expect(
          _videoDirectPlayAudioCodecs(profile),
          containsAll(<String>['truehd', 'mlp']),
        );
      },
    );
  });

  group('KnownDefects model mapping', () {
    test('matches additional Fire TV models for DoVi HDR10+ bug', () {
      expect(KnownDefects.modelHasHevcDoviHdr10PlusBug('AFTKRT'), isTrue);
      expect(KnownDefects.modelHasHevcDoviHdr10PlusBug('aftmm'), isFalse);
    });
  });

  group('KnownDefects DoVi Profile 7 EL direct play', () {
    test('enabled and disabled behaviors take precedence over device signals', () {
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
    });

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
  });
}
