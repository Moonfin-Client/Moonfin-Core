import 'audio_capability_profile.dart';
import '../platform/web_runtime_config.dart';
import '../preference/preference_constants.dart';
import '../util/platform_detection.dart';
import 'known_defects.dart';
import 'web_playback_capabilities.dart';

class _WebCodecSets {
  const _WebCodecSets({
    required this.mp4VideoCodecs,
    required this.webmVideoCodecs,
    required this.webmAudioCodecs,
    required this.videoAudioCodecs,
    required this.hlsInTsVideoCodecs,
    required this.hlsInTsAudioCodecs,
    required this.hlsInFmp4VideoCodecs,
    required this.hlsInFmp4AudioCodecs,
    required this.enableFmp4Hls,
  });

  final List<String> mp4VideoCodecs;
  final List<String> webmVideoCodecs;
  final List<String> webmAudioCodecs;
  final List<String> videoAudioCodecs;
  final List<String> hlsInTsVideoCodecs;
  final List<String> hlsInTsAudioCodecs;
  final List<String> hlsInFmp4VideoCodecs;
  final List<String> hlsInFmp4AudioCodecs;
  final bool enableFmp4Hls;
}

class DeviceProfileBuilder {
  const DeviceProfileBuilder._();

  static const List<String> _downmixSupportedAudioCodecs = <String>[
    'aac',
    'mp2',
    'mp3',
  ];

  static const List<String> _supportedAudioCodecs = <String>[
    'aac',
    'aac_latm',
    'ac3',
    'alac',
    'dca',
    'dts',
    'eac3',
    'flac',
    'mlp',
    'mp2',
    'mp3',
    'opus',
    'pcm_alaw',
    'pcm_mulaw',
    'pcm_s16le',
    'pcm_s20le',
    'pcm_s24le',
    'truehd',
    'vorbis',
  ];

  static const List<String> _hlsMpegTsAudioCodecs = <String>[
    'aac',
    'ac3',
    'eac3',
    'mp3',
  ];

  static const List<String> _hlsFmp4AudioCodecs = <String>[
    'aac',
    'ac3',
    'eac3',
    'mp3',
    'alac',
    'flac',
    'opus',
    'dts',
    'truehd',
  ];

  static const List<String> _audioDirectPlayContainers = <String>[
    'aac',
    'ac3',
    'alac',
    'ape',
    'dts',
    'eac3',
    'flac',
    'm4a',
    'm4b',
    'mka',
    'mp3',
    'oga',
    'ogg',
    'opus',
    'wav',
    'wma',
  ];

  static Map<String, dynamic> build({
    int? maxBitrateMbps,
    AudioCapabilityProfile? audioCapabilityProfile,
    AudioOutputMode audioOutputMode = AudioOutputMode.auto,
    AudioFallbackCodec audioFallbackCodec = AudioFallbackCodec.auto,
    bool ac3PassthroughEnabled = false,
    bool eac3PassthroughEnabled = false,
    bool eac3JocPassthroughEnabled = false,
    bool dtsCorePassthroughEnabled = false,
    bool dtsHdPassthroughEnabled = false,
    bool dtsXPassthroughEnabled = false,
    bool trueHdPassthroughEnabled = false,
    bool trueHdAtmosPassthroughEnabled = false,
    int maxAudioChannels = 0,
    // The player decodes every advertised audio codec in software (FFmpeg),
    // so the output route limits rendering, not decoding: stereo-only routes
    // still direct-play multichannel/compressed audio and downmix locally.
    bool universalAudioDecode = false,
    // Media3 only: its MediaCodecAudioRenderer owns passthrough and outranks
    // the FFmpeg renderer, so on an AVR route a lossless track (TrueHD/MLP)
    // may be bitstreamed instead of locally decoded and fail silently when
    // the route can't carry it. When set, lossless codecs are advertised on
    // AVR routes only if passthrough is genuinely enabled and capable, and
    // the server transcodes otherwise. Backends whose local decode is
    // authoritative (mpv on media_kit and tvOS) must leave this false.
    bool losslessAudioRequiresPassthroughOnAvrRoutes = false,
    MaxVideoResolution maxResolution = MaxVideoResolution.auto,
    bool pgsDirectPlay = true,
    bool assDirectPlay = true,
    bool supportsEmbeddedSubtitles = true,
    bool supportsExternalTextSubtitles = true,
    bool supportsAvc = false,
    bool supportsAvcHigh10 = false,
    int avcMainLevel = 0,
    int avcHigh10Level = 0,
    bool supportsHevc = false,
    bool supportsHevcMain10 = false,
    int hevcMainLevel = 0,
    bool supportsHevcDolbyVision = false,
    bool supportsHevcDolbyVisionEl = false,
    bool supportsHevcHdr10 = false,
    bool supportsHevcHdr10Plus = false,
    bool supportsAv1 = false,
    bool supportsAv1Main10 = false,
    bool supportsAv1DolbyVision = false,
    bool supportsAv1Hdr10 = false,
    bool supportsAv1Hdr10Plus = false,
    bool supportsVc1 = false,
    int maxResolutionAvcWidth = 0,
    int maxResolutionAvcHeight = 0,
    int maxResolutionHevcWidth = 0,
    int maxResolutionHevcHeight = 0,
    int maxResolutionAv1Width = 0,
    int maxResolutionAv1Height = 0,
    int maxResolutionVc1Width = 0,
    int maxResolutionVc1Height = 0,
    bool supportsDvProfile5 = false,
    bool supportsDvProfile7 = false,
    bool supportsDvProfile8 = false,
    bool knownHevcDoviHdr10PlusBug = false,
    bool allowDolbyVisionProfile7ElDirectPlay = false,
    // Known-defect exclusions protect this app's own decoders. A profile
    // built for an external player must skip them, since the external app
    // decodes with its own pipeline and a needless exclusion downgrades an
    // otherwise direct-playable stream to a transcode the external handoff
    // then rejects.
    bool applyKnownDeviceDefects = true,
  }) {
    final webCapabilities = PlatformDetection.isWeb
        ? detectWebPlaybackCapabilities()
        : null;

    final effectiveSupportsAvc = webCapabilities?.supportsAvc ?? supportsAvc;
    final effectiveSupportsAvcHigh10 =
        webCapabilities?.supportsAvcHigh10 ?? supportsAvcHigh10;
    final effectiveAvcMainLevel = webCapabilities?.avcMainLevel ?? avcMainLevel;
    final effectiveAvcHigh10Level =
        webCapabilities?.avcHigh10Level ?? avcHigh10Level;
    final effectiveSupportsHevc = webCapabilities?.supportsHevc ?? supportsHevc;
    final effectiveSupportsHevcMain10 =
        webCapabilities?.supportsHevcMain10 ?? supportsHevcMain10;
    final effectiveHevcMainLevel =
        webCapabilities?.hevcMainLevel ?? hevcMainLevel;
    final effectiveSupportsHevcDolbyVision =
        webCapabilities?.supportsHevcDolbyVision ?? supportsHevcDolbyVision;
    final effectiveSupportsHevcDolbyVisionEl =
        webCapabilities?.supportsHevcDolbyVisionEl ?? supportsHevcDolbyVisionEl;
    final effectiveSupportsHevcHdr10 =
        webCapabilities?.supportsHevcHdr10 ?? supportsHevcHdr10;
    final effectiveSupportsHevcHdr10Plus =
        webCapabilities?.supportsHevcHdr10Plus ?? supportsHevcHdr10Plus;
    final effectiveSupportsAv1 = webCapabilities?.supportsAv1 ?? supportsAv1;
    final effectiveSupportsAv1Main10 =
        webCapabilities?.supportsAv1Main10 ?? supportsAv1Main10;
    final effectiveSupportsAv1DolbyVision =
        webCapabilities?.supportsAv1DolbyVision ?? supportsAv1DolbyVision;
    final effectiveSupportsAv1Hdr10 =
        webCapabilities?.supportsAv1Hdr10 ?? supportsAv1Hdr10;
    final effectiveSupportsAv1Hdr10Plus =
        webCapabilities?.supportsAv1Hdr10Plus ?? supportsAv1Hdr10Plus;
    final effectiveSupportsVc1 = webCapabilities?.supportsVc1 ?? supportsVc1;
    final effectiveMaxResolutionAvcWidth =
        webCapabilities?.maxResolutionAvcWidth ?? maxResolutionAvcWidth;
    final effectiveMaxResolutionAvcHeight =
        webCapabilities?.maxResolutionAvcHeight ?? maxResolutionAvcHeight;
    final effectiveMaxResolutionHevcWidth =
        webCapabilities?.maxResolutionHevcWidth ?? maxResolutionHevcWidth;
    final effectiveMaxResolutionHevcHeight =
        webCapabilities?.maxResolutionHevcHeight ?? maxResolutionHevcHeight;
    final effectiveMaxResolutionAv1Width =
        webCapabilities?.maxResolutionAv1Width ?? maxResolutionAv1Width;
    final effectiveMaxResolutionAv1Height =
        webCapabilities?.maxResolutionAv1Height ?? maxResolutionAv1Height;
    final effectiveMaxResolutionVc1Width =
        webCapabilities?.maxResolutionVc1Width ?? maxResolutionVc1Width;
    final effectiveMaxResolutionVc1Height =
        webCapabilities?.maxResolutionVc1Height ?? maxResolutionVc1Height;
    final effectiveSupportsDvProfile5 =
        webCapabilities?.supportsDvProfile5 ?? supportsDvProfile5;
    final effectiveSupportsDvProfile7 =
        webCapabilities?.supportsDvProfile7 ?? supportsDvProfile7;
    final effectiveSupportsDvProfile8 =
        webCapabilities?.supportsDvProfile8 ?? supportsDvProfile8;

    final bitrateBps = maxBitrateMbps == null ? null : maxBitrateMbps * 1000000;
    final capabilityProfile = _resolveEffectiveAudioCapabilityProfile(
      requestedProfile: audioCapabilityProfile,
      webCapabilities: webCapabilities,
    );
    final effectiveMaxChannels = maxAudioChannels <= 0
        ? (capabilityProfile.maxPcmChannels > 0
            ? capabilityProfile.maxPcmChannels
            : 8)
        : maxAudioChannels;
    final forceStereo = effectiveMaxChannels <= 2 ||
        audioOutputMode == AudioOutputMode.forceStereo;
    // Server-facing channel cap: an explicit user cap always wins; otherwise a
    // universal-decode player advertises 8ch regardless of the detected sink,
    // since it downmixes locally instead of asking the server to transcode.
    final advertisedMaxChannels = maxAudioChannels > 0
        ? maxAudioChannels
        : (universalAudioDecode ? 8 : effectiveMaxChannels);
    final limitStereoDirectPlay = forceStereo && !universalAudioDecode;
    // Transcode-target channel cap. A universal-decode player in stereo mode
    // delivers stereo by downmixing locally, so its transcodes stay uncapped
    // (a video-forced transcode would otherwise collapse to 2ch and
    // contradict the 8ch direct-play advertisement). An explicit user cap of
    // 1-2 channels is a stated intent and stays honored end to end.
    final capTranscodeToStereo = limitStereoDirectPlay ||
        (maxAudioChannels > 0 && maxAudioChannels <= 2);
    final effectiveAudioFallbackCodec = _resolveAudioFallbackCodec(
      requested: audioFallbackCodec,
      capabilityProfile: capabilityProfile,
      forceStereo: forceStereo,
    );

    final baseAllowedAudioCodecs = limitStereoDirectPlay
        ? _downmixSupportedAudioCodecs
        : _supportedAudioCodecs
              .where(
                (codec) => _isAudioCodecAllowed(
                  codec: codec,
                  audioOutputMode: audioOutputMode,
                  capabilityProfile: capabilityProfile,
                  universalAudioDecode: universalAudioDecode,
                  losslessAudioRequiresPassthroughOnAvrRoutes:
                      losslessAudioRequiresPassthroughOnAvrRoutes,
                  ac3PassthroughEnabled: ac3PassthroughEnabled,
                  eac3PassthroughEnabled: eac3PassthroughEnabled,
                  eac3JocPassthroughEnabled: eac3JocPassthroughEnabled,
                  dtsCorePassthroughEnabled: dtsCorePassthroughEnabled,
                  dtsHdPassthroughEnabled: dtsHdPassthroughEnabled,
                  dtsXPassthroughEnabled: dtsXPassthroughEnabled,
                  trueHdPassthroughEnabled: trueHdPassthroughEnabled,
                  trueHdAtmosPassthroughEnabled: trueHdAtmosPassthroughEnabled,
                ),
              )
              .toList(growable: false);

    final effectiveAllowedAudioCodecs = webCapabilities == null
        ? baseAllowedAudioCodecs
        : _buildWebAllowedAudioCodecs(
            capabilities: webCapabilities,
            forceStereo: forceStereo,
          );

    final mpegTsAudioCodecs = _mpegTsAudioCodecsForFallback(
      effectiveAudioFallbackCodec: effectiveAudioFallbackCodec,
      allowedAudioCodecs: effectiveAllowedAudioCodecs,
    );

    final hlsVideoCodecs = <String>[
      if (effectiveSupportsHevc) 'hevc',
      'h264',
    ].join(',');

    final hasKnownHevcDoviHdr10PlusBug =
        applyKnownDeviceDefects &&
        ((webCapabilities?.knownHevcDoviHdr10PlusBug ??
                knownHevcDoviHdr10PlusBug) ||
            KnownDefects.hevcDoviHdr10PlusBug);

    final effectiveBitrateBps =
        bitrateBps ?? webCapabilities?.maxStreamingBitrate;

    final webCodecSets = webCapabilities == null
        ? null
        : _buildWebCodecSets(
            capabilities: webCapabilities,
            audioCodecs: effectiveAllowedAudioCodecs,
            forceStereo: forceStereo,
          );

    final directPlayProfiles = webCapabilities == null
        ? <Map<String, dynamic>>[
            <String, dynamic>{
              'Type': 'Video',
              'Container':
                  'asf,dash,hls,m4v,mkv,mov,mp4,ogm,ogv,ts,vob,webm,wmv,xvid',
              'VideoCodec': 'av1,h264,hevc,mpeg,mpeg2video,vc1,vp8,vp9',
              'AudioCodec': effectiveAllowedAudioCodecs.join(','),
            },
            <String, dynamic>{
              'Type': 'Audio',
              'Container': _audioDirectPlayContainers.join(','),
              'AudioCodec': effectiveAllowedAudioCodecs.join(','),
            },
          ]
        : _buildWebDirectPlayProfiles(
            capabilities: webCapabilities,
            codecSets: webCodecSets!,
          );

    final transcodingProfiles = webCapabilities == null
        ? <Map<String, dynamic>>[
            <String, dynamic>{
              'Type': 'Video',
              'Context': 'Streaming',
              'Container': 'ts',
              'Protocol': 'hls',
              'VideoCodec': hlsVideoCodecs,
              'AudioCodec': mpegTsAudioCodecs.join(','),
              'CopyTimestamps': false,
              'EnableSubtitlesInManifest': true,
              if (capTranscodeToStereo) 'MaxAudioChannels': '2',
            },
            <String, dynamic>{
              'Type': 'Video',
              'Context': 'Streaming',
              'Container': 'mp4',
              'Protocol': 'hls',
              'VideoCodec': hlsVideoCodecs,
              'AudioCodec': _fmp4AudioCodecsForFallback(
                effectiveAudioFallbackCodec: effectiveAudioFallbackCodec,
                allowedAudioCodecs: effectiveAllowedAudioCodecs,
              ).join(','),
              'CopyTimestamps': false,
              'EnableSubtitlesInManifest': true,
              if (capTranscodeToStereo) 'MaxAudioChannels': '2',
            },
            <String, dynamic>{
              'Type': 'Audio',
              'Context': 'Streaming',
              'Container': 'ts',
              'Protocol': 'hls',
              'AudioCodec': 'aac',
              if (capTranscodeToStereo) 'MaxAudioChannels': '2',
            },
          ]
        : _buildWebTranscodingProfiles(
            capabilities: webCapabilities,
            audioCodecs: effectiveAllowedAudioCodecs,
            codecSets: webCodecSets!,
          );

    final codecProfiles = _codecProfiles(
      maxAudioChannels: advertisedMaxChannels,
      forceStereo: limitStereoDirectPlay,
      maxResolution: maxResolution,
      supportsAvc: effectiveSupportsAvc,
      supportsAvcHigh10: effectiveSupportsAvcHigh10,
      avcMainLevel: effectiveAvcMainLevel,
      avcHigh10Level: effectiveAvcHigh10Level,
      supportsHevc: effectiveSupportsHevc,
      supportsHevcMain10: effectiveSupportsHevcMain10,
      hevcMainLevel: effectiveHevcMainLevel,
      supportsHevcDolbyVision: effectiveSupportsHevcDolbyVision,
      supportsHevcDolbyVisionEl: effectiveSupportsHevcDolbyVisionEl,
      supportsHevcHdr10: effectiveSupportsHevcHdr10,
      supportsHevcHdr10Plus: effectiveSupportsHevcHdr10Plus,
      supportsAv1: effectiveSupportsAv1,
      supportsAv1Main10: effectiveSupportsAv1Main10,
      supportsAv1DolbyVision: effectiveSupportsAv1DolbyVision,
      supportsAv1Hdr10: effectiveSupportsAv1Hdr10,
      supportsAv1Hdr10Plus: effectiveSupportsAv1Hdr10Plus,
      supportsVc1: effectiveSupportsVc1,
      maxResolutionAvcWidth: effectiveMaxResolutionAvcWidth,
      maxResolutionAvcHeight: effectiveMaxResolutionAvcHeight,
      maxResolutionHevcWidth: effectiveMaxResolutionHevcWidth,
      maxResolutionHevcHeight: effectiveMaxResolutionHevcHeight,
      maxResolutionAv1Width: effectiveMaxResolutionAv1Width,
      maxResolutionAv1Height: effectiveMaxResolutionAv1Height,
      maxResolutionVc1Width: effectiveMaxResolutionVc1Width,
      maxResolutionVc1Height: effectiveMaxResolutionVc1Height,
      supportsDvProfile5: effectiveSupportsDvProfile5,
      supportsDvProfile7: effectiveSupportsDvProfile7,
      supportsDvProfile8: effectiveSupportsDvProfile8,
      knownHevcDoviHdr10PlusBug: hasKnownHevcDoviHdr10PlusBug,
      allowDolbyVisionProfile7ElDirectPlay:
          allowDolbyVisionProfile7ElDirectPlay,
      webCapabilities: webCapabilities,
    );

    return <String, dynamic>{
      'Name': _profileName(),
      'MaxStaticBitrate': effectiveBitrateBps,
      'MaxStreamingBitrate': effectiveBitrateBps,
      'MusicStreamingTranscodingBitrate': 384000,
      'DirectPlayProfiles': directPlayProfiles,
      'TranscodingProfiles': transcodingProfiles,
      'ContainerProfiles': <Map<String, dynamic>>[],
      'CodecProfiles': codecProfiles,
      'SubtitleProfiles': _subtitleProfiles(
        pgsDirectPlay: pgsDirectPlay,
        assDirectPlay: assDirectPlay,
        supportsEmbeddedSubtitles: supportsEmbeddedSubtitles,
        supportsExternalTextSubtitles: supportsExternalTextSubtitles,
      ),
    };
  }

  static List<String> _buildWebAllowedAudioCodecs({
    required WebPlaybackCapabilities capabilities,
    required bool forceStereo,
  }) {
    final codecs = <String>[];

    void add(String codec) {
      if (!codecs.contains(codec)) {
        codecs.add(codec);
      }
    }

    add('aac');
    add('mp3');

    if ((capabilities.isChrome ||
            capabilities.isEdgeChromium ||
            capabilities.isFirefox) &&
        !capabilities.isAndroid) {
      add('mp2');
    }

    if (!forceStereo) {
      if (capabilities.canDecodeAc3) {
        add('ac3');
      }
      if (capabilities.canDecodeEac3) {
        add('eac3');
      }
      if (capabilities.canDecodeOpus) {
        add('opus');
      }
      if (capabilities.canDecodeFlac) {
        add('flac');
      }
      if (capabilities.canDecodeAlac) {
        add('alac');
      }
    }

    if (!capabilities.isSafari &&
        (capabilities.supportsVp8 || capabilities.supportsVp9)) {
      add('vorbis');
    }

    return codecs;
  }

  static List<Map<String, dynamic>> _buildWebDirectPlayProfiles({
    required WebPlaybackCapabilities capabilities,
    required _WebCodecSets codecSets,
  }) {
    final profiles = <Map<String, dynamic>>[];

    if (codecSets.webmVideoCodecs.isNotEmpty &&
        codecSets.webmAudioCodecs.isNotEmpty) {
      profiles.add(<String, dynamic>{
        'Container': 'webm',
        'Type': 'Video',
        'VideoCodec': codecSets.webmVideoCodecs.join(','),
        'AudioCodec': codecSets.webmAudioCodecs.join(','),
      });
    }

    if (codecSets.mp4VideoCodecs.isNotEmpty) {
      profiles.add(<String, dynamic>{
        'Container': 'mp4,m4v',
        'Type': 'Video',
        'VideoCodec': codecSets.mp4VideoCodecs.join(','),
        'AudioCodec': codecSets.videoAudioCodecs.join(','),
      });
    }

    if (capabilities.canPlayMkv && codecSets.mp4VideoCodecs.isNotEmpty) {
      profiles.add(<String, dynamic>{
        'Container': 'mkv',
        'Type': 'Video',
        'VideoCodec': codecSets.mp4VideoCodecs.join(','),
        'AudioCodec': codecSets.videoAudioCodecs.join(','),
      });
    }

    if ((capabilities.isSafari ||
            capabilities.isChrome ||
            capabilities.isEdgeChromium) &&
        capabilities.supportsAvc) {
      profiles.add(<String, dynamic>{
        'Container': 'mov',
        'Type': 'Video',
        'VideoCodec': 'h264',
        'AudioCodec': codecSets.videoAudioCodecs.join(','),
      });
    }

    profiles.addAll(
      _buildWebAudioDirectPlayProfiles(
        capabilities: capabilities,
        audioCodecs: codecSets.videoAudioCodecs,
      ),
    );

    if (capabilities.canPlayHls) {
      if (codecSets.enableFmp4Hls &&
          codecSets.hlsInFmp4VideoCodecs.isNotEmpty &&
          codecSets.hlsInFmp4AudioCodecs.isNotEmpty) {
        profiles.add(<String, dynamic>{
          'Container': 'hls',
          'Type': 'Video',
          'VideoCodec': codecSets.hlsInFmp4VideoCodecs.join(','),
          'AudioCodec': codecSets.hlsInFmp4AudioCodecs.join(','),
        });
      }

      if (codecSets.hlsInTsVideoCodecs.isNotEmpty &&
          codecSets.hlsInTsAudioCodecs.isNotEmpty) {
        profiles.add(<String, dynamic>{
          'Container': 'hls',
          'Type': 'Video',
          'VideoCodec': codecSets.hlsInTsVideoCodecs.join(','),
          'AudioCodec': codecSets.hlsInTsAudioCodecs.join(','),
        });
      }
    }

    return profiles;
  }

  static List<Map<String, dynamic>> _buildWebTranscodingProfiles({
    required WebPlaybackCapabilities capabilities,
    required List<String> audioCodecs,
    required _WebCodecSets codecSets,
  }) {
    final profiles = <Map<String, dynamic>>[];

    if (capabilities.canPlayHls) {
      if (codecSets.enableFmp4Hls &&
          codecSets.hlsInFmp4VideoCodecs.isNotEmpty &&
          codecSets.hlsInFmp4AudioCodecs.isNotEmpty) {
        profiles.add(<String, dynamic>{
          'Type': 'Video',
          'Context': 'Streaming',
          'Container': 'mp4',
          'Protocol': 'hls',
          'VideoCodec': codecSets.hlsInFmp4VideoCodecs.join(','),
          'AudioCodec': codecSets.hlsInFmp4AudioCodecs.join(','),
          'CopyTimestamps': false,
          'EnableSubtitlesInManifest': true,
        });
      }

      if (codecSets.hlsInTsVideoCodecs.isNotEmpty &&
          codecSets.hlsInTsAudioCodecs.isNotEmpty) {
        profiles.add(<String, dynamic>{
          'Type': 'Video',
          'Context': 'Streaming',
          'Container': 'ts',
          'Protocol': 'hls',
          'VideoCodec': codecSets.hlsInTsVideoCodecs.join(','),
          'AudioCodec': codecSets.hlsInTsAudioCodecs.join(','),
          'CopyTimestamps': false,
          'EnableSubtitlesInManifest': true,
        });
      }

      profiles.add(<String, dynamic>{
        'Type': 'Audio',
        'Context': 'Streaming',
        'Container': 'ts',
        'Protocol': 'hls',
        'AudioCodec': 'aac',
      });
    }

    for (final audioFormat in const <String>['aac', 'mp3', 'opus', 'wav']) {
      if (audioFormat != 'wav' && !audioCodecs.contains(audioFormat)) {
        continue;
      }

      profiles.add(<String, dynamic>{
        'Container': audioFormat,
        'Type': 'Audio',
        'AudioCodec': audioFormat,
        'Context': 'Streaming',
        'Protocol': 'http',
      });
    }

    return profiles;
  }

  static _WebCodecSets _buildWebCodecSets({
    required WebPlaybackCapabilities capabilities,
    required List<String> audioCodecs,
    required bool forceStereo,
  }) {
    final videoAudioCodecs = List<String>.from(audioCodecs);
    final webmAudioCodecs = <String>[];

    final shouldAllowWebmOnSafari =
        !capabilities.isSafari ||
        (capabilities.browserMajorVersion >= 15 &&
            capabilities.browserMajorVersion < 17);

    final canUseVp9InMp4 =
        capabilities.supportsVp9 &&
        !capabilities.isIOS &&
        !(capabilities.isFirefox && capabilities.isMacOS);

    final mp4VideoCodecs = <String>[
      if (capabilities.supportsAvc) 'h264',
      if (capabilities.supportsHevc) 'hevc',
      if (capabilities.supportsAv1) 'av1',
      if (canUseVp9InMp4) 'vp9',
      if (capabilities.supportsVc1) 'vc1',
    ];

    final webmVideoCodecs = <String>[
      if (capabilities.supportsVp8) 'vp8',
      if (capabilities.supportsVp9 && shouldAllowWebmOnSafari) 'vp9',
      if (capabilities.supportsAv1 && shouldAllowWebmOnSafari) 'av1',
    ];

    if (videoAudioCodecs.contains('vorbis')) {
      webmAudioCodecs.add('vorbis');
    }
    if (videoAudioCodecs.contains('opus')) {
      webmAudioCodecs.add('opus');
    }

    final hlsInTsVideoCodecs = <String>[if (capabilities.supportsAvc) 'h264'];

    final hlsInFmp4VideoCodecs = <String>[
      if (capabilities.supportsAvc) 'h264',
      if (capabilities.supportsHevc) 'hevc',
      if (capabilities.supportsAv1) 'av1',
      if (capabilities.supportsVp9) 'vp9',
    ];

    final hlsInTsAudioCodecs = <String>['aac'];
    final hlsInFmp4AudioCodecs = <String>['aac'];

    if (!forceStereo) {
      if (videoAudioCodecs.contains('mp3') || capabilities.isSafari) {
        if (!hlsInTsAudioCodecs.contains('mp3')) {
          hlsInTsAudioCodecs.add('mp3');
        }
      }
      if (videoAudioCodecs.contains('mp3') && capabilities.canDecodeMp3InHls) {
        hlsInFmp4AudioCodecs.add('mp3');
      }
      final canAdvertiseAc3InHls = capabilities.canDecodeAc3InHls;
      if (videoAudioCodecs.contains('ac3') && canAdvertiseAc3InHls) {
        hlsInTsAudioCodecs.add('ac3');
        hlsInFmp4AudioCodecs.add('ac3');
      }
      if (videoAudioCodecs.contains('eac3') && canAdvertiseAc3InHls) {
        hlsInTsAudioCodecs.add('eac3');
        hlsInFmp4AudioCodecs.add('eac3');
      }
      if (videoAudioCodecs.contains('opus')) {
        hlsInFmp4AudioCodecs.add('opus');
      }
      if (videoAudioCodecs.contains('flac')) {
        hlsInFmp4AudioCodecs.add('flac');
      }
      if (videoAudioCodecs.contains('alac')) {
        hlsInFmp4AudioCodecs.add('alac');
      }
    }

    final enableFmp4Hls =
        !capabilities.canPlayNativeHls || capabilities.canPlayNativeHlsInFmp4;

    return _WebCodecSets(
      mp4VideoCodecs: mp4VideoCodecs,
      webmVideoCodecs: webmVideoCodecs,
      webmAudioCodecs: webmAudioCodecs,
      videoAudioCodecs: videoAudioCodecs,
      hlsInTsVideoCodecs: hlsInTsVideoCodecs,
      hlsInTsAudioCodecs: hlsInTsAudioCodecs,
      hlsInFmp4VideoCodecs: hlsInFmp4VideoCodecs,
      hlsInFmp4AudioCodecs: hlsInFmp4AudioCodecs,
      enableFmp4Hls: enableFmp4Hls,
    );
  }

  static List<Map<String, dynamic>> _buildWebAudioDirectPlayProfiles({
    required WebPlaybackCapabilities capabilities,
    required List<String> audioCodecs,
  }) {
    final profiles = <Map<String, dynamic>>[];
    final added = <String>{};

    void add(String container, String codec) {
      final key = '$container|$codec';
      if (added.contains(key)) {
        return;
      }
      added.add(key);
      profiles.add(<String, dynamic>{
        'Container': container,
        'Type': 'Audio',
        'AudioCodec': codec,
      });
    }

    if (audioCodecs.contains('aac')) {
      add('aac', 'aac');
      add('m4a', 'aac');
      add('m4b', 'aac');
    }
    if (audioCodecs.contains('mp3')) {
      add('mp3', 'mp3');
      if (!capabilities.canDecodeMp3InHls) {
        add('ts', 'mp3');
      }
    }
    if (audioCodecs.contains('ac3')) {
      add('ac3', 'ac3');
    }
    if (audioCodecs.contains('eac3')) {
      add('eac3', 'eac3');
    }
    if (audioCodecs.contains('flac')) {
      add('flac', 'flac');
    }
    if (audioCodecs.contains('alac')) {
      add('alac', 'alac');
      add('m4a', 'alac');
      add('m4b', 'alac');
    }
    if (audioCodecs.contains('opus')) {
      add('opus', 'opus');
      add('webm', 'opus');
      if (capabilities.isSafari) {
        add('mp4', 'opus');
      }
    }
    if (audioCodecs.contains('vorbis')) {
      add('ogg', 'vorbis');
      add('oga', 'vorbis');
      add('webm', 'vorbis');
    }

    add('wav', 'wav');

    return profiles;
  }

  static AudioCapabilityProfile _resolveEffectiveAudioCapabilityProfile({
    required AudioCapabilityProfile? requestedProfile,
    required WebPlaybackCapabilities? webCapabilities,
  }) {
    if (!PlatformDetection.isWeb) {
      return requestedProfile ?? const AudioCapabilityProfile.optimistic();
    }

    final capabilities =
        webCapabilities ?? WebPlaybackCapabilities.conservative;
    return AudioCapabilityProfile(
      canDecodeAc3: capabilities.canDecodeAc3,
      canDecodeEac3: capabilities.canDecodeEac3,
      canDecodeDts: capabilities.canDecodeDts,
      canDecodeDtsHd: capabilities.canDecodeDtsHd,
      canDecodeTrueHd: capabilities.canDecodeTrueHd,
      canDecodeFlac: capabilities.canDecodeFlac,
      canPassthroughAc3: false,
      canPassthroughEac3: false,
      canPassthroughEac3Joc: false,
      canPassthroughDts: false,
      canPassthroughDtsHd: false,
      canPassthroughTrueHd: false,
      maxPcmChannels: capabilities.maxPcmChannels,
      activeRouteType: AudioRouteType.other,
      routeSupportsHdAudio: false,
    );
  }

  static AudioFallbackCodec _resolveAudioFallbackCodec({
    required AudioFallbackCodec requested,
    required AudioCapabilityProfile capabilityProfile,
    required bool forceStereo,
  }) {
    if (forceStereo) {
      return AudioFallbackCodec.aac;
    }
    if (requested != AudioFallbackCodec.auto) {
      return requested;
    }
    if (!capabilityProfile.hasMultichannelCapability) {
      return AudioFallbackCodec.aac;
    }
    return AudioFallbackCodec.auto;
  }

  static List<String> _mpegTsAudioCodecsForFallback({
    required AudioFallbackCodec effectiveAudioFallbackCodec,
    required List<String> allowedAudioCodecs,
  }) {
    final preferredTargets = switch (effectiveAudioFallbackCodec) {
      AudioFallbackCodec.auto => _hlsMpegTsAudioCodecs,
      AudioFallbackCodec.aac => const <String>['aac', 'opus', 'mp3'],
      AudioFallbackCodec.ac3 => const <String>['ac3', 'opus', 'aac', 'mp3'],
      AudioFallbackCodec.eac3 => const <String>['eac3', 'ac3', 'opus', 'aac', 'mp3'],
      AudioFallbackCodec.truehd => const <String>['truehd', 'flac', 'eac3', 'ac3', 'opus', 'aac', 'mp3'],
      AudioFallbackCodec.mp3 => const <String>['mp3', 'opus', 'aac'],
      AudioFallbackCodec.opus => const <String>['opus', 'aac', 'mp3'],
      AudioFallbackCodec.flac => const <String>['flac', 'opus', 'aac', 'mp3'],
    };

    return preferredTargets
        .where(allowedAudioCodecs.contains)
        .where(_hlsMpegTsAudioCodecs.contains)
        .toList(growable: false);
  }

  static List<String> _fmp4AudioCodecsForFallback({
    required AudioFallbackCodec effectiveAudioFallbackCodec,
    required List<String> allowedAudioCodecs,
  }) {
    final primaryTarget = switch (effectiveAudioFallbackCodec) {
      AudioFallbackCodec.auto => null,
      AudioFallbackCodec.aac => 'aac',
      AudioFallbackCodec.ac3 => 'ac3',
      AudioFallbackCodec.eac3 => 'eac3',
      AudioFallbackCodec.truehd => 'truehd',
      AudioFallbackCodec.mp3 => 'mp3',
      AudioFallbackCodec.opus => 'opus',
      AudioFallbackCodec.flac => 'flac',
    };

    final order = <String>[];
    if (primaryTarget != null && _hlsFmp4AudioCodecs.contains(primaryTarget)) {
      order.add(primaryTarget);
    }
    for (final c in _hlsFmp4AudioCodecs) {
      if (!order.contains(c)) {
        order.add(c);
      }
    }

    return order.where(allowedAudioCodecs.contains).toList(growable: false);
  }

  static bool _isAudioCodecAllowed({
    required String codec,
    required AudioOutputMode audioOutputMode,
    required AudioCapabilityProfile capabilityProfile,
    bool universalAudioDecode = false,
    bool losslessAudioRequiresPassthroughOnAvrRoutes = false,
    required bool ac3PassthroughEnabled,
    required bool eac3PassthroughEnabled,
    required bool eac3JocPassthroughEnabled,
    required bool dtsCorePassthroughEnabled,
    required bool dtsHdPassthroughEnabled,
    required bool dtsXPassthroughEnabled,
    required bool trueHdPassthroughEnabled,
    required bool trueHdAtmosPassthroughEnabled,
  }) {
    if (audioOutputMode == AudioOutputMode.avrPassthrough &&
        capabilityProfile.isAvReceiverRoute &&
        _isPassthroughControlledAudioCodec(codec)) {
      return _isAudioCodecPassthroughEnabled(
        codec: codec,
        ac3PassthroughEnabled: ac3PassthroughEnabled,
        eac3PassthroughEnabled: eac3PassthroughEnabled,
        eac3JocPassthroughEnabled: eac3JocPassthroughEnabled,
        dtsCorePassthroughEnabled: dtsCorePassthroughEnabled,
        dtsHdPassthroughEnabled: dtsHdPassthroughEnabled,
        dtsXPassthroughEnabled: dtsXPassthroughEnabled,
        trueHdPassthroughEnabled: trueHdPassthroughEnabled,
        trueHdAtmosPassthroughEnabled: trueHdAtmosPassthroughEnabled,
      );
    }

    if (universalAudioDecode) {
      if (codec == 'truehd' || codec == 'mlp') {
        // iOS ships no TrueHD decoder, so the getter reports false there.
        if (!capabilityProfile.canDecodeTrueHd) return false;
        if (losslessAudioRequiresPassthroughOnAvrRoutes &&
            capabilityProfile.isAvReceiverRoute) {
          // On HDMI/ARC/eARC this backend may bitstream TrueHD to the
          // receiver instead of decoding locally. Only advertise it when
          // the route can genuinely carry it and passthrough resolves
          // enabled. Otherwise let the server transcode rather than risk a
          // silent bitstream, since plain ARC can't carry TrueHD at all.
          return trueHdPassthroughEnabled &&
              capabilityProfile.canPassthroughTrueHd;
        }
        // Speaker, headphones, bluetooth, and other routes decode locally
        // through FFmpeg, so direct play is safe.
        return true;
      }
      return true;
    }

    return _isAudioCodecDecodeSupported(codec, capabilityProfile) ||
        _isAudioCodecPassthroughEnabled(
          codec: codec,
          ac3PassthroughEnabled: ac3PassthroughEnabled,
          eac3PassthroughEnabled: eac3PassthroughEnabled,
          eac3JocPassthroughEnabled: eac3JocPassthroughEnabled,
          dtsCorePassthroughEnabled: dtsCorePassthroughEnabled,
          dtsHdPassthroughEnabled: dtsHdPassthroughEnabled,
          dtsXPassthroughEnabled: dtsXPassthroughEnabled,
          trueHdPassthroughEnabled: trueHdPassthroughEnabled,
          trueHdAtmosPassthroughEnabled: trueHdAtmosPassthroughEnabled,
        );
  }

  static bool _isPassthroughControlledAudioCodec(String codec) {
    switch (codec) {
      case 'ac3':
      case 'eac3':
      case 'dts':
      case 'dca':
      case 'dtsx':
      case 'dtsuhd':
      case 'truehd':
      case 'mlp':
        return true;
      default:
        return false;
    }
  }

  static bool _isAudioCodecDecodeSupported(
    String codec,
    AudioCapabilityProfile capabilityProfile,
  ) {
    switch (codec) {
      case 'ac3':
        return capabilityProfile.canDecodeAc3;
      case 'eac3':
        return capabilityProfile.canDecodeEac3;
      case 'flac':
        return capabilityProfile.canDecodeFlac;
      case 'dts':
      case 'dca':
        return capabilityProfile.canDecodeDts ||
            capabilityProfile.canDecodeDtsHd;
      case 'truehd':
      case 'mlp':
        return capabilityProfile.canDecodeTrueHd;
      default:
        return true;
    }
  }

  static bool _isAudioCodecPassthroughEnabled({
    required String codec,
    required bool ac3PassthroughEnabled,
    required bool eac3PassthroughEnabled,
    required bool eac3JocPassthroughEnabled,
    required bool dtsCorePassthroughEnabled,
    required bool dtsHdPassthroughEnabled,
    required bool dtsXPassthroughEnabled,
    required bool trueHdPassthroughEnabled,
    required bool trueHdAtmosPassthroughEnabled,
  }) {
    final effectiveEac3JocPassthroughEnabled =
        eac3PassthroughEnabled && eac3JocPassthroughEnabled;
    final effectiveDtsHdPassthroughEnabled =
        dtsCorePassthroughEnabled && dtsHdPassthroughEnabled;
    final effectiveDtsXPassthroughEnabled =
        effectiveDtsHdPassthroughEnabled && dtsXPassthroughEnabled;
    final effectiveTrueHdAtmosPassthroughEnabled =
        trueHdPassthroughEnabled && trueHdAtmosPassthroughEnabled;

    switch (codec) {
      case 'ac3':
        return ac3PassthroughEnabled;
      case 'eac3':
        return eac3PassthroughEnabled || effectiveEac3JocPassthroughEnabled;
      case 'dts':
      case 'dca':
        return dtsCorePassthroughEnabled ||
            effectiveDtsHdPassthroughEnabled ||
            effectiveDtsXPassthroughEnabled;
      case 'dtsx':
      case 'dtsuhd':
        return effectiveDtsXPassthroughEnabled;
      case 'truehd':
      case 'mlp':
        return trueHdPassthroughEnabled ||
            effectiveTrueHdAtmosPassthroughEnabled;
      default:
        return false;
    }
  }

  static String _profileName() {
    if (PlatformDetection.isWeb) {
      return webRuntimeConfig.pluginMode
          ? 'Moonfin for Web'
          : 'Moonfin on Github';
    }
    if (PlatformDetection.isAndroid) return 'Moonfin for Android';
    if (PlatformDetection.isIOS) return 'Moonfin iOS';
    if (PlatformDetection.isMacOS) return 'Moonfin macOS';
    if (PlatformDetection.isWindows) return 'Moonfin Windows';
    if (PlatformDetection.isLinux) return 'Moonfin Linux';
    return 'Moonfin';
  }

  static List<Map<String, dynamic>> _codecProfiles({
    required int maxAudioChannels,
    required bool forceStereo,
    required MaxVideoResolution maxResolution,
    required bool supportsAvc,
    required bool supportsAvcHigh10,
    required int avcMainLevel,
    required int avcHigh10Level,
    required bool supportsHevc,
    required bool supportsHevcMain10,
    required int hevcMainLevel,
    required bool supportsHevcDolbyVision,
    required bool supportsHevcDolbyVisionEl,
    required bool supportsHevcHdr10,
    required bool supportsHevcHdr10Plus,
    required bool supportsAv1,
    required bool supportsAv1Main10,
    required bool supportsAv1DolbyVision,
    required bool supportsAv1Hdr10,
    required bool supportsAv1Hdr10Plus,
    required bool supportsVc1,
    required int maxResolutionAvcWidth,
    required int maxResolutionAvcHeight,
    required int maxResolutionHevcWidth,
    required int maxResolutionHevcHeight,
    required int maxResolutionAv1Width,
    required int maxResolutionAv1Height,
    required int maxResolutionVc1Width,
    required int maxResolutionVc1Height,
    required bool supportsDvProfile5,
    required bool supportsDvProfile7,
    required bool supportsDvProfile8,
    required bool knownHevcDoviHdr10PlusBug,
    required bool allowDolbyVisionProfile7ElDirectPlay,
    required WebPlaybackCapabilities? webCapabilities,
  }) {
    final profiles = <Map<String, dynamic>>[];
    final isWebProfile = webCapabilities != null;
    final isSafariWeb = webCapabilities?.isSafari ?? false;
    final isIOSWeb = webCapabilities?.isIOS ?? false;
    final iOSMajorVersion = webCapabilities?.iOSMajorVersion ?? 0;

    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: 'h264',
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: supportsAvc ? 'NotEquals' : 'Equals',
            property: 'VideoProfile',
            value: supportsAvc ? 'none' : 'none',
          ),
        ],
      ),
    );

    if (!supportsAvcHigh10) {
      profiles.add(
        _codecProfile(
          type: 'Video',
          codec: 'h264',
          conditions: <Map<String, dynamic>>[
            _condition(
              condition: 'NotEquals',
              property: 'VideoProfile',
              value: 'high 10',
            ),
          ],
        ),
      );
    }

    if (supportsAvc && avcMainLevel > 0) {
      for (final profile in const <String>[
        'high',
        'main',
        'baseline',
        'constrained baseline',
      ]) {
        profiles.add(
          _codecProfile(
            type: 'Video',
            codec: 'h264',
            conditions: <Map<String, dynamic>>[
              _condition(
                condition: 'LessThanEqual',
                property: 'VideoLevel',
                value: '$avcMainLevel',
              ),
            ],
            applyConditions: <Map<String, dynamic>>[
              _condition(
                condition: 'Equals',
                property: 'VideoProfile',
                value: profile,
              ),
            ],
          ),
        );
      }
    }

    if (supportsAvcHigh10 && avcHigh10Level > 0) {
      profiles.add(
        _codecProfile(
          type: 'Video',
          codec: 'h264',
          conditions: <Map<String, dynamic>>[
            _condition(
              condition: 'LessThanEqual',
              property: 'VideoLevel',
              value: '$avcHigh10Level',
            ),
          ],
          applyConditions: <Map<String, dynamic>>[
            _condition(
              condition: 'Equals',
              property: 'VideoProfile',
              value: 'high 10',
            ),
          ],
        ),
      );
    }

    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: 'h264',
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: 'LessThanEqual',
            property: 'RefFrames',
            value: '12',
          ),
        ],
        applyConditions: <Map<String, dynamic>>[
          _condition(
            condition: 'GreaterThanEqual',
            property: 'Width',
            value: '1200',
          ),
        ],
      ),
    );

    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: 'h264',
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: 'LessThanEqual',
            property: 'RefFrames',
            value: '4',
          ),
        ],
        applyConditions: <Map<String, dynamic>>[
          _condition(
            condition: 'GreaterThanEqual',
            property: 'Width',
            value: '1900',
          ),
        ],
      ),
    );

    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: 'hevc',
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: supportsHevc ? 'NotEquals' : 'Equals',
            property: 'VideoProfile',
            value: supportsHevc ? 'none' : 'none',
          ),
        ],
      ),
    );

    if (!supportsHevcMain10) {
      profiles.add(
        _codecProfile(
          type: 'Video',
          codec: 'hevc',
          conditions: <Map<String, dynamic>>[
            _condition(
              condition: 'NotEquals',
              property: 'VideoProfile',
              value: 'main 10',
            ),
          ],
        ),
      );
    }

    if (isSafariWeb && supportsHevc) {
      profiles.add(
        _codecProfile(
          type: 'Video',
          codec: 'hevc',
          conditions: <Map<String, dynamic>>[
            _condition(
              condition: 'EqualsAny',
              property: 'VideoCodecTag',
              value: 'hvc1|dvh1',
            ),
            _condition(
              condition: 'LessThanEqual',
              property: 'VideoFramerate',
              value: '60',
            ),
          ],
        ),
      );
    }

    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: 'av1',
        conditions: <Map<String, dynamic>>[
          if (!supportsAv1)
            _condition(
              condition: 'Equals',
              property: 'VideoProfile',
              value: 'none',
            )
          else if (!supportsAv1Main10)
            _condition(
              condition: 'NotEquals',
              property: 'VideoProfile',
              value: 'main 10',
            )
          else
            _condition(
              condition: 'NotEquals',
              property: 'VideoProfile',
              value: 'none',
            ),
        ],
      ),
    );

    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: 'vc1',
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: supportsVc1 ? 'NotEquals' : 'Equals',
            property: 'VideoProfile',
            value: 'none',
          ),
        ],
      ),
    );

    _addResolutionProfile(
      profiles: profiles,
      codec: 'h264',
      maxResolution: maxResolution,
      detectedWidth: maxResolutionAvcWidth,
      detectedHeight: maxResolutionAvcHeight,
    );
    _addResolutionProfile(
      profiles: profiles,
      codec: 'hevc',
      maxResolution: maxResolution,
      detectedWidth: maxResolutionHevcWidth,
      detectedHeight: maxResolutionHevcHeight,
    );
    _addResolutionProfile(
      profiles: profiles,
      codec: 'av1',
      maxResolution: maxResolution,
      detectedWidth: maxResolutionAv1Width,
      detectedHeight: maxResolutionAv1Height,
    );
    _addResolutionProfile(
      profiles: profiles,
      codec: 'vc1',
      maxResolution: maxResolution,
      detectedWidth: maxResolutionVc1Width,
      detectedHeight: maxResolutionVc1Height,
    );

    final unsupportedRangeTypesAv1 = <String>{'DOVI_INVALID'};
    if (!supportsAv1DolbyVision) {
      unsupportedRangeTypesAv1.add('DOVI');
      unsupportedRangeTypesAv1.add('DOVI_WITH_SDR');
      unsupportedRangeTypesAv1.add('DOVI_WITH_HLG');
      if (!supportsAv1Hdr10) {
        unsupportedRangeTypesAv1.add('DOVI_WITH_HDR10');
      }
      if (!supportsAv1Hdr10Plus) {
        unsupportedRangeTypesAv1.add('DOVI_WITH_HDR10_PLUS');
      }
    }
    if (!supportsAv1Hdr10) {
      unsupportedRangeTypesAv1.add('HDR10');
      unsupportedRangeTypesAv1.add('HLG');
      if (!supportsAv1Hdr10Plus) {
        unsupportedRangeTypesAv1.add('HDR10_PLUS');
      }
    }

    final unsupportedRangeTypesHevc = <String>{'DOVI_INVALID'};
    if (!supportsHevcDolbyVisionEl) {
      if (!allowDolbyVisionProfile7ElDirectPlay) {
        unsupportedRangeTypesHevc.add('DOVI_WITH_EL');
        unsupportedRangeTypesHevc.add('DOVI_WITH_ELHDR10_PLUS');
      }

      if (!supportsHevcDolbyVision) {
        unsupportedRangeTypesHevc.add('DOVI');
        unsupportedRangeTypesHevc.add('DOVI_WITH_SDR');
        unsupportedRangeTypesHevc.add('DOVI_WITH_HLG');
        if (!supportsHevcHdr10) {
          unsupportedRangeTypesHevc.add('DOVI_WITH_HDR10');
        }
      }
    }

    if (!supportsHevcHdr10) {
      unsupportedRangeTypesHevc.add('HDR10');
      unsupportedRangeTypesHevc.add('HLG');
      if (!supportsHevcHdr10Plus) {
        unsupportedRangeTypesHevc.add('HDR10_PLUS');
      }
    }

    if (knownHevcDoviHdr10PlusBug) {
      unsupportedRangeTypesHevc.add('DOVI_WITH_HDR10_PLUS');
      unsupportedRangeTypesHevc.add('DOVI_WITH_ELHDR10_PLUS');
    }

    if (!supportsDvProfile5) {
      unsupportedRangeTypesHevc.add('DOVI');
    }
    if (!supportsDvProfile7) {
      if (!allowDolbyVisionProfile7ElDirectPlay) {
        unsupportedRangeTypesHevc.add('DOVI_WITH_EL');
        unsupportedRangeTypesHevc.add('DOVI_WITH_ELHDR10_PLUS');
      }
    }
    if (!supportsDvProfile8) {
      unsupportedRangeTypesHevc.add('DOVI_WITH_HDR10');
    }

    _addUnsupportedRangeProfiles(
      profiles: profiles,
      codec: 'av1',
      rangeTypes: unsupportedRangeTypesAv1,
    );
    _addUnsupportedRangeProfiles(
      profiles: profiles,
      codec: 'hevc',
      rangeTypes: unsupportedRangeTypesHevc,
    );

    if (isWebProfile) {
      for (final codec in const <String>['h264', 'hevc', 'av1']) {
        profiles.add(
          _codecProfile(
            type: 'Video',
            codec: codec,
            conditions: <Map<String, dynamic>>[
              _condition(
                condition: 'NotEquals',
                property: 'IsInterlaced',
                value: 'true',
                isRequired: false,
              ),
            ],
          ),
        );
      }
    }

    if (isIOSWeb && iOSMajorVersion > 0 && iOSMajorVersion < 13) {
      for (final container in const <String>['ts', 'mp4']) {
        profiles.add(
          _codecProfile(
            type: 'Video',
            container: container,
            codec: 'h264',
            conditions: <Map<String, dynamic>>[
              _condition(
                condition: 'LessThanEqual',
                property: 'VideoLevel',
                value: '42',
                isRequired: false,
              ),
            ],
          ),
        );
      }
    }

    profiles.add(
      _codecProfile(
        type: 'VideoAudio',
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: 'LessThanEqual',
            property: 'AudioChannels',
            value: '$maxAudioChannels',
          ),
        ],
      ),
    );

    if (forceStereo) {
      profiles.add(
        _codecProfile(
          type: 'VideoAudio',
          codec: 'aac',
          conditions: <Map<String, dynamic>>[
            _condition(
              condition: 'LessThanEqual',
              property: 'AudioChannels',
              value: '2',
            ),
          ],
        ),
      );
    }

    return profiles;
  }

  static void _addUnsupportedRangeProfiles({
    required List<Map<String, dynamic>> profiles,
    required String codec,
    required Set<String> rangeTypes,
  }) {
    if (rangeTypes.isEmpty) {
      return;
    }

    final expandedRangeTypes = _expandVideoRangeTypeAliases(rangeTypes);
    final sortedRangeTypes = expandedRangeTypes.toList(growable: false)..sort();
    final joinedRangeTypes = sortedRangeTypes.join('|');
    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: codec,
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: 'NotEquals',
            property: 'VideoRangeType',
            value: joinedRangeTypes,
            isRequired: false,
          ),
        ],
        applyConditions: <Map<String, dynamic>>[
          _condition(
            condition: 'EqualsAny',
            property: 'VideoRangeType',
            value: joinedRangeTypes,
            isRequired: false,
          ),
        ],
      ),
    );
  }

  static Set<String> _expandVideoRangeTypeAliases(Set<String> rangeTypes) {
    final expanded = <String>{};
    for (final token in rangeTypes) {
      final aliases = _videoRangeTypeAliases[token];
      if (aliases == null || aliases.isEmpty) {
        expanded.add(token);
      } else {
        expanded.addAll(aliases);
      }
    }
    return expanded;
  }

  static const Map<String, List<String>> _videoRangeTypeAliases =
      <String, List<String>>{
        'DOVI_INVALID': <String>['DOVI_INVALID', 'DOVIInvalid'],
        'DOVI_WITH_EL': <String>['DOVI_WITH_EL', 'DOVIWithEL'],
        'DOVI_WITH_HLG': <String>['DOVI_WITH_HLG', 'DOVIWithHLG'],
        'DOVI_WITH_ELHDR10_PLUS': <String>[
          'DOVI_WITH_ELHDR10_PLUS',
          'DOVIWithELHDR10Plus',
        ],
        'DOVI_WITH_SDR': <String>['DOVI_WITH_SDR', 'DOVIWithSDR'],
        'DOVI_WITH_HDR10': <String>['DOVI_WITH_HDR10', 'DOVIWithHDR10'],
        'DOVI_WITH_HDR10_PLUS': <String>[
          'DOVI_WITH_HDR10_PLUS',
          'DOVIWithHDR10Plus',
        ],
        'HDR10_PLUS': <String>['HDR10_PLUS', 'HDR10Plus'],
      };

  static void _addResolutionProfile({
    required List<Map<String, dynamic>> profiles,
    required String codec,
    required MaxVideoResolution maxResolution,
    required int detectedWidth,
    required int detectedHeight,
  }) {
    final userWidth = maxResolution == MaxVideoResolution.auto
        ? 0
        : maxResolution.width;
    final userHeight = maxResolution == MaxVideoResolution.auto
        ? 0
        : maxResolution.height;

    var width = detectedWidth > 0 ? detectedWidth : userWidth;
    var height = detectedHeight > 0 ? detectedHeight : userHeight;

    if (userWidth > 0) {
      width = width <= 0 ? userWidth : width.clamp(0, userWidth).toInt();
    }
    if (userHeight > 0) {
      height = height <= 0 ? userHeight : height.clamp(0, userHeight).toInt();
    }

    if (width <= 0 || height <= 0) {
      return;
    }

    profiles.add(
      _codecProfile(
        type: 'Video',
        codec: codec,
        conditions: <Map<String, dynamic>>[
          _condition(
            condition: 'LessThanEqual',
            property: 'Width',
            value: '$width',
          ),
          _condition(
            condition: 'LessThanEqual',
            property: 'Height',
            value: '$height',
          ),
        ],
      ),
    );
  }

  static Map<String, dynamic> _codecProfile({
    required String type,
    String? container,
    String? codec,
    List<Map<String, dynamic>> conditions = const <Map<String, dynamic>>[],
    List<Map<String, dynamic>> applyConditions = const <Map<String, dynamic>>[],
  }) {
    final profile = <String, dynamic>{
      'Type': type,
      ...?container == null ? null : <String, dynamic>{'Container': container},
      ...?codec == null ? null : <String, dynamic>{'Codec': codec},
      'Conditions': conditions,
      if (applyConditions.isNotEmpty) 'ApplyConditions': applyConditions,
    };

    return profile;
  }

  static Map<String, dynamic> _condition({
    required String condition,
    required String property,
    required String value,
    bool isRequired = true,
  }) {
    return <String, dynamic>{
      'Condition': condition,
      'Property': property,
      'Value': value,
      'IsRequired': isRequired,
    };
  }

  /// [supportsEmbeddedSubtitles] covers embedded streams of every kind, image
  /// formats included, so a player that can't read them leaves the server to
  /// burn them in. [supportsExternalTextSubtitles] is narrower and only covers
  /// the plain text formats, which is why ass and ssa still offer External.
  static List<Map<String, dynamic>> _subtitleProfiles({
    required bool pgsDirectPlay,
    required bool assDirectPlay,
    bool supportsEmbeddedSubtitles = true,
    bool supportsExternalTextSubtitles = true,
  }) {
    final profiles = <Map<String, dynamic>>[];

    void add(String format, String method) {
      profiles.add(<String, dynamic>{'Format': format, 'Method': method});
    }

    for (final format in const <String>['vtt', 'webvtt']) {
      add(format, 'Embed');
      add(format, 'External');
      add(format, 'Hls');
    }

    for (final format in const <String>['srt', 'subrip', 'ttml']) {
      if (supportsEmbeddedSubtitles) {
        add(format, 'Embed');
      }
      if (supportsExternalTextSubtitles) {
        add(format, 'External');
      }
    }

    for (final format in const <String>['dvbsub', 'dvdsub', 'idx']) {
      if (supportsEmbeddedSubtitles) {
        add(format, 'Embed');
      }
      add(format, 'Encode');
    }

    for (final format in const <String>['pgs', 'pgssub']) {
      if (pgsDirectPlay && supportsEmbeddedSubtitles) {
        add(format, 'Embed');
      }
      add(format, 'Encode');
    }

    for (final format in const <String>['ass', 'ssa']) {
      if (assDirectPlay && supportsEmbeddedSubtitles) {
        add(format, 'Embed');
        add(format, 'External');
      } else if (assDirectPlay) {
        add(format, 'External');
      }
      add(format, 'Encode');
    }

    return profiles;
  }
}
