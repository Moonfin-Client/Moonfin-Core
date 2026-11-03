import 'dart:convert';
import 'dart:io';

import 'package:playback_silo/playback_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';

/// The profile the libmpv backend (macOS, Windows, Linux) builds with
/// default settings, captured from `DeviceProfileBuilder.build`.
Map<String, dynamic> _mpvProfile() =>
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

/// A narrow device: H.264 and HEVC only (no AV1), 1080p, stereo, no HDR, no
/// HLS transcoding profile.
Map<String, dynamic> _narrowProfile() => {
  'DirectPlayProfiles': [
    {
      'Type': 'Video',
      'Container': 'mp4,matroska',
      'VideoCodec': 'h264,hevc,av1',
      'AudioCodec': 'aac,ac3',
    },
    {'Type': 'Audio', 'Container': 'mp3', 'AudioCodec': 'mp3'},
  ],
  'TranscodingProfiles': const [],
  'CodecProfiles': [
    {
      'Type': 'Video',
      'Codec': 'av1',
      'Conditions': [
        {'Condition': 'Equals', 'Property': 'VideoProfile', 'Value': 'none'},
      ],
    },
    {
      'Type': 'Video',
      'Codec': 'hevc',
      'Conditions': [
        {
          'Condition': 'NotEquals',
          'Property': 'VideoRangeType',
          'Value': 'DOVI|DOVIWithEL|DOVIWithHDR10|HDR10|HDR10Plus|HLG',
          'IsRequired': false,
        },
      ],
      'ApplyConditions': [
        {
          'Condition': 'EqualsAny',
          'Property': 'VideoRangeType',
          'Value': 'DOVI|DOVIWithEL|DOVIWithHDR10|HDR10|HDR10Plus|HLG',
        },
      ],
    },
    for (final codec in ['h264', 'hevc'])
      {
        'Type': 'Video',
        'Codec': codec,
        'Conditions': [
          {'Condition': 'LessThanEqual', 'Property': 'Width', 'Value': '1920'},
          {'Condition': 'LessThanEqual', 'Property': 'Height', 'Value': '1080'},
        ],
      },
    {
      'Type': 'VideoAudio',
      'Codec': 'aac,ac3',
      'Conditions': [
        {
          'Condition': 'LessThanEqual',
          'Property': 'AudioChannels',
          'Value': '2',
        },
      ],
    },
  ],
};

void _expectFitsContract(SiloClientCapabilities caps) {
  expect(
    siloSchemaErrors('ClientCodecCapabilitiesV3', caps.clientCapabilities),
    isEmpty,
  );
  for (final entry in caps.deliveries.entries) {
    expect(
      siloSchemaErrors('DeliveryCapabilityV3', entry.value),
      isEmpty,
      reason: entry.key,
    );
  }
}

void main() {
  group('the libmpv backend', () {
    final caps = siloCapabilitiesFromDeviceProfile(
      _mpvProfile(),
      traits: SiloPlayerTraits.mpv,
    );

    test('declares its codecs, with honest evidence', () {
      final c = caps.clientCapabilities;
      expect(c['video_evidence'], 'declared');
      expect(c['audio_evidence'], 'declared');
      // MPEG-4 Part 2 is off in mpv's profile.
      expect(c['codecs_video'], [
        'av1',
        'h264',
        'hevc',
        'mpeg',
        'mpeg2video',
        'vc1',
        'vp8',
        'vp9',
      ]);
      expect(c['codecs_video_hardware'], c['codecs_video']);
      expect(
        c['codecs_audio'],
        containsAll(['aac', 'ac3', 'eac3', 'dts', 'truehd', 'flac', 'opus']),
      );
      expect(c['containers'], containsAll(['mkv', 'matroska', 'mp4', 'webm']));
      // Nothing about decoders it never enumerated.
      expect(c, isNot(contains('video_decode')));
      expect(c, isNot(contains('audio_passthrough')));
    });

    test('decodes HDR10, HLG, HDR10+ and Dolby Vision 5 and 8', () {
      expect(caps.clientCapabilities['hdr'], isTrue);
      expect(caps.hdrDetails, {
        'hdr10': true,
        'hdr10_plus': true,
        'hlg': true,
        'dolby_vision_profiles': [5, 8],
      });
    });

    test('8K limits are no class below 4320p', () {
      expect(caps.clientCapabilities['max_resolution'], '4320p');
    });

    test('plays every delivery class', () {
      expect(caps.deliveries.keys, ['original_http', 'progressive', 'hls']);
      for (final d in caps.deliveries.values) {
        expect(d['enabled'], isTrue);
        expect(d['supported_on_device'], isTrue);
        // It downmixes on its own.
        expect(d, isNot(contains('max_channels')));
        expect(d['auth_header_refresh'], isFalse);
      }
      final hls = caps.deliveries['hls']!;
      expect(hls['containers'], ['hls']);
      // H.264 and HEVC (AV1 only where an HLS profile names it).
      expect(hls['video_codecs'], ['h264', 'hevc']);
      expect(
        hls['audio_decode_codecs'],
        containsAll(['aac', 'ac3', 'eac3', 'flac', 'opus']),
      );
    });

    test('the original file: any audio track, its own tone mapping, embedded '
        'subtitles from the file', () {
      final original = caps.deliveries['original_http']!;
      expect(original['validated_claims'], [
        'client_selected_audio_track_v1',
        'client_managed_dynamic_range_v1',
      ]);
      final subtitles = original['subtitles'] as Map;
      expect(subtitles['embedded_bitmap'], isTrue);
      expect(subtitles['sidecar_bitmap'], isFalse);
      final native = (subtitles['native_embedded'] as List).cast<Map>();
      expect(native.map((n) => n['container']), contains('mkv'));
      expect(native.first['codecs'], contains('hdmv_pgs_subtitle'));
      expect(native.first['track_identity'], 'ffmpeg_stream_index');
      expect(caps.clientFeatures, [
        'playback_plan_v3',
        'embedded_subtitles_v1',
      ]);
    });

    test('remuxes and HLS carry subtitles as sidecars, bitmaps burned in', () {
      for (final name in ['progressive', 'hls']) {
        final subtitles = caps.deliveries[name]!['subtitles'] as Map;
        expect(subtitles['sidecar_text'], isTrue, reason: name);
        expect(subtitles['sidecar_bitmap'], isFalse, reason: name);
        expect(subtitles['font_attachments'], isFalse, reason: name);
        expect(subtitles, isNot(contains('native_embedded')), reason: name);
      }
    });

    test('fits Silo\'s start-request schema', () => _expectFitsContract(caps));
  });

  group('a narrow device', () {
    final caps = siloCapabilitiesFromDeviceProfile(_narrowProfile());

    test('a codec its profile rules out is left out', () {
      expect(caps.clientCapabilities['codecs_video'], ['h264', 'hevc']);
      expect(caps.clientCapabilities['containers'], ['mp4', 'matroska', 'mkv']);
    });

    test('no HDR, a 1080p class and a stereo ceiling', () {
      expect(caps.clientCapabilities['hdr'], isFalse);
      expect(caps.hdrDetails['dolby_vision_profiles'], isEmpty);
      expect(caps.clientCapabilities['max_resolution'], '1080p');
      for (final d in caps.deliveries.values) {
        expect(d['max_channels'], 2);
      }
      // A player that says nothing more claims nothing.
      expect(caps.deliveries['original_http']!['validated_claims'], isEmpty);
      expect(caps.clientFeatures, ['playback_plan_v3']);
    });

    test('without an HLS profile, HLS is unavailable and says why', () {
      final hls = caps.deliveries['hls']!;
      expect(hls['supported_on_device'], isFalse);
      expect(hls['failure_reason'], 'player_has_no_hls');
    });

    test('fits Silo\'s start-request schema', () => _expectFitsContract(caps));
  });

  test('a player without embedded subtitle rendering opts out of it', () {
    final caps = siloCapabilitiesFromDeviceProfile(
      _mpvProfile(),
      traits: const SiloPlayerTraits(
        managesDynamicRange: true,
        selectsAnyAudioTrack: true,
      ),
    );
    expect(caps.clientFeatures, ['playback_plan_v3']);
    final subtitles = caps.deliveries['original_http']!['subtitles'] as Map;
    expect(subtitles, isNot(contains('native_embedded')));
    expect(subtitles['embedded_bitmap'], isFalse);
    _expectFitsContract(caps);
  });

  test('Media3: embedded subtitles without ASS styling or fonts', () {
    final caps = siloCapabilitiesFromDeviceProfile(
      _mpvProfile(),
      traits: SiloPlayerTraits.media3,
    );
    expect(caps.clientFeatures, contains('embedded_subtitles_v1'));
    final original = caps.deliveries['original_http']!;
    expect(original['validated_claims'], ['client_selected_audio_track_v1']);
    final subtitles = original['subtitles'] as Map;
    expect(subtitles['embedded_text'], isTrue);
    expect(subtitles['embedded_bitmap'], isTrue);
    expect(subtitles['ass_styling'], isFalse);
    expect(subtitles['font_attachments'], isFalse);
    final native = (subtitles['native_embedded'] as List).cast<Map>();
    expect(native.every((e) => e['ass_styling'] == false), isTrue);
    expect(native.every((e) => e['font_attachments'] == false), isTrue);
    final remux = caps.deliveries['progressive']!['subtitles'] as Map;
    expect(remux['ass_styling'], isFalse);
    _expectFitsContract(caps);
  });

  test('libmpv and AetherEngine send the stream\'s headers', () {
    expect(SiloPlayerTraits.mpv.sendsRequestHeaders, isTrue);
    expect(SiloPlayerTraits.mpvAndroid.sendsRequestHeaders, isTrue);
    expect(SiloPlayerTraits.aether.sendsRequestHeaders, isTrue);
    // AetherEngine claims what libmpv does.
    const aether = SiloPlayerTraits.aether;
    expect(aether.managesDynamicRange, isTrue);
    expect(aether.selectsAnyAudioTrack, isTrue);
    expect(aether.rendersEmbeddedSubtitles, isTrue);
  });

  test('the web: nothing beyond its profile, and no headers', () {
    const web = SiloPlayerTraits.web;
    expect(web.sendsRequestHeaders, isFalse);
    expect(web.selectsAnyAudioTrack, isFalse);
    expect(web.rendersEmbeddedSubtitles, isFalse);
    expect(web.managesDynamicRange, isFalse);
    final caps = siloCapabilitiesFromDeviceProfile(_mpvProfile(), traits: web);
    expect(caps.clientFeatures, ['playback_plan_v3']);
    _expectFitsContract(caps);
  });

  test('a cast receiver: the original or HLS only, no headers', () {
    const receiver = SiloPlayerTraits.castReceiver;
    expect(receiver.sendsRequestHeaders, isFalse);
    final caps = siloCapabilitiesFromDeviceProfile(
      _mpvProfile(),
      traits: receiver,
    );
    expect(caps.deliveries['progressive']!['supported_on_device'], isFalse);
    expect(
      caps.deliveries['progressive']!['failure_reason'],
      'player_has_no_progressive_remux',
    );
    expect(caps.deliveries['original_http']!['validated_claims'], isEmpty);
    _expectFitsContract(caps);
  });

  test('the validator refuses what Silo would', () {
    expect(
      siloSchemaErrors('DeliveryCapabilityV3', {'enabled': true, 'extra': 1}),
      containsAll([
        'DeliveryCapabilityV3.supported_on_device: required',
        'DeliveryCapabilityV3.extra: not in the contract',
      ]),
    );
  });
}
