import 'package:device_info_plus_tizen/device_info_plus_tizen.dart';

import '../preference/preference_constants.dart';

/// Jellyfin device profile for Samsung Tizen (AVPlay / PlusPlayer).
///
class TizenDeviceProfile {
  const TizenDeviceProfile._();

  static _TizenCaps? _detected;

  static const _TizenCaps _staticCaps = _TizenCaps(
    uhd: true,
    uhd8K: false,
    hevc: true,
    av1: false,
    vp9: false,
    hdr10: true,
    dolbyVision: false,
    ac3: true,
    eac3: true,
    opus: true,
    truehd: false,
  );

  static Future<void> initialize() async {
    try {
      final info = await DeviceInfoPluginTizen().tizenInfo;
      final version =
          double.tryParse((info.platformVersion ?? '').trim().split(' ').first) ??
              0.0;
      final uhd8K = info.screenWidth >= 7680 || info.screenHeight >= 4320;
      _detected = _TizenCaps(
        uhd: true,
        uhd8K: uhd8K,
        hevc: true,
        av1: version >= 5.5,
        vp9: version >= 6.0,
        hdr10: version >= 4.0,
        dolbyVision: false,
        ac3: true,
        eac3: true,
        opus: true,
        truehd: false,
      );
    } catch (_) {
      _detected = null;
    }
  }

  /// TEMPORARY DIAGNOSTIC — set true to strip all DirectPlayProfiles so the
  /// server is forced to transcode everything to HLS. Used to test whether the
  /// native AVPlay/PlusPlayer "stuck on Loading Stream…" hang is specific to
  /// direct-progressive-HTTP playback (HLS plays → direct-play bug) or affects
  /// the native player for any source (HLS also hangs → display/runner bug).
  /// Revert to false once diagnosed.
  static bool debugForceTranscode = true;

  static String get debugSummary {
    final c = _detected;
    final source = c == null ? 'static-fallback' : 'detected';
    final caps = c ?? _staticCaps;
    return 'caps=$source uhd=${caps.uhd} uhd8K=${caps.uhd8K} hevc=${caps.hevc} '
        'av1=${caps.av1} vp9=${caps.vp9} hdr10=${caps.hdr10} '
        'forceTranscode=$debugForceTranscode (DTS/TrueHD always transcoded)';
  }

  static Map<String, dynamic> build({
    int? maxBitrateMbps,
    MaxVideoResolution maxResolution = MaxVideoResolution.auto,
  }) {
    final caps = _capabilities(maxResolution);
    final uhd = caps.uhd;
    final uhd8K = caps.uhd8K;
    final hevc = caps.hevc;
    final av1 = caps.av1;
    final vp9 = caps.vp9;
    final hdr10 = caps.hdr10;
    final dolbyVision = caps.dolbyVision;
    final ac3 = caps.ac3;
    final eac3 = caps.eac3;
    final opus = caps.opus;
    final truehd = caps.truehd;

    final generalVideoCodecs = <String>[
      'h264',
      if (hevc) 'hevc',
      if (vp9) 'vp9',
      if (av1) 'av1',
    ];
    final webmVideoCodecs = <String>[
      if (vp9) 'vp9',
      if (av1) 'av1',
    ];
    final allVideoCodecs = <String>[...generalVideoCodecs];

    final audioCodecs = <String>[
      'aac',
      'mp3',
      'flac',
      'vorbis',
      'pcm',
      'wav',
      if (ac3) 'ac3',
      if (eac3) 'eac3',
      if (opus) 'opus',
      if (truehd) 'truehd',
    ];

    final generalContainers = <String>[
      'mp4',
      'm4v',
      'ts',
      'mpegts',
      'mkv',
      'matroska',
      'mov',
      'avi',
    ];

    final maxBitrate = (maxBitrateMbps != null && maxBitrateMbps > 0)
        ? maxBitrateMbps * 1000000
        : (uhd8K
            ? 100000000
            : uhd
                ? 80000000
                : 40000000);
    final maxAudioChannels = uhd8K ? '8' : '6';

    final directPlayProfiles = <Map<String, dynamic>>[
      <String, dynamic>{
        'Container': generalContainers.join(','),
        'Type': 'Video',
        'VideoCodec': generalVideoCodecs.join(','),
        'AudioCodec': audioCodecs.join(','),
      },
      if (webmVideoCodecs.isNotEmpty)
        <String, dynamic>{
          'Container': 'webm',
          'Type': 'Video',
          'VideoCodec': webmVideoCodecs.join(','),
          'AudioCodec': 'vorbis,opus',
        },
      <String, dynamic>{
        'Container': 'mp3,flac,aac,m4a,ogg,opus,wav',
        'Type': 'Audio',
      },
      <String, dynamic>{
        'Container': 'm3u8',
        'Type': 'Video',
        'VideoCodec': allVideoCodecs.join(','),
        'AudioCodec': audioCodecs.join(','),
      },
    ];

    final v1AndH26x = av1 ? 'av1,hevc,h264' : 'hevc,h264';
    final tsAudio = eac3 ? 'eac3,ac3,aac' : (ac3 ? 'ac3,aac' : 'aac');
    final transcodingProfiles = <Map<String, dynamic>>[
      <String, dynamic>{
        'Container': 'mp4',
        'Type': 'Video',
        'AudioCodec': tsAudio,
        'VideoCodec': v1AndH26x,
        'Context': 'Streaming',
        'Protocol': 'hls',
        'MaxAudioChannels': maxAudioChannels,
        'MinSegments': '1',
        'SegmentLength': '3',
      },
      <String, dynamic>{
        'Container': 'ts',
        'Type': 'Video',
        'AudioCodec': tsAudio,
        'VideoCodec': hevc ? 'hevc,h264' : 'h264',
        'Context': 'Streaming',
        'Protocol': 'hls',
        'MaxAudioChannels': maxAudioChannels,
        'MinSegments': '1',
        'SegmentLength': '3',
        'BreakOnNonKeyFrames': true,
      },
      <String, dynamic>{
        'Container': 'mp3',
        'Type': 'Audio',
        'AudioCodec': 'mp3',
        'Context': 'Streaming',
        'Protocol': 'http',
      },
    ];

    final h264Level = uhd ? '51' : '42';
    final hevcLevel = uhd8K
        ? '183'
        : uhd
            ? '153'
            : '123';

    final codecProfiles = <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Codec': 'h264',
        'Conditions': <Map<String, dynamic>>[
          _cond('NotEquals', 'IsAnamorphic', 'true', isRequired: false),
          _cond('LessThanEqual', 'VideoLevel', h264Level, isRequired: false),
          _cond('LessThanEqual', 'VideoBitDepth', '8', isRequired: false),
          _cond('LessThanEqual', 'RefFrames', '16', isRequired: false),
        ],
      },
      <String, dynamic>{
        'Type': 'Video',
        'Codec': 'hevc',
        'Conditions': <Map<String, dynamic>>[
          _cond('LessThanEqual', 'VideoLevel', hevcLevel, isRequired: false),
          _cond(
            'LessThanEqual',
            'VideoBitDepth',
            (hdr10 || dolbyVision) ? '10' : '8',
            isRequired: false,
          ),
        ],
      },
      <String, dynamic>{
        'Type': 'Audio',
        'Conditions': <Map<String, dynamic>>[
          _cond(
            'LessThanEqual',
            'AudioChannels',
            maxAudioChannels,
            isRequired: false,
          ),
        ],
      },
      <String, dynamic>{
        'Type': 'VideoAudio',
        'Codec': 'dts,dca,dts-hd,dtshd,dts-ma,dtsma,dts-x,dtsx',
        'Conditions': <Map<String, dynamic>>[
          _cond('Equals', 'AudioChannels', '0', isRequired: true),
        ],
      },
      <String, dynamic>{
        'Type': 'VideoAudio',
        'Codec': 'truehd,mlp',
        'Conditions': <Map<String, dynamic>>[
          _cond('Equals', 'AudioChannels', '0', isRequired: true),
        ],
      },
      if (av1)
        <String, dynamic>{
          'Type': 'Video',
          'Codec': 'av1',
          'Conditions': <Map<String, dynamic>>[
            _cond('LessThanEqual', 'VideoLevel', '15', isRequired: false),
            _cond(
              'LessThanEqual',
              'VideoBitDepth',
              hdr10 ? '10' : '8',
              isRequired: false,
            ),
          ],
        },
    ];

    final subtitleProfiles = <Map<String, dynamic>>[
      <String, dynamic>{'Format': 'srt', 'Method': 'External'},
      <String, dynamic>{'Format': 'subrip', 'Method': 'External'},
      <String, dynamic>{'Format': 'vtt', 'Method': 'External'},
      <String, dynamic>{'Format': 'ass', 'Method': 'External'},
      <String, dynamic>{'Format': 'ssa', 'Method': 'External'},
      <String, dynamic>{'Format': 'smi', 'Method': 'External'},
      <String, dynamic>{'Format': 'ttml', 'Method': 'External'},
      <String, dynamic>{'Format': 'sub', 'Method': 'External'},
      <String, dynamic>{'Format': 'srt', 'Method': 'Embed'},
      <String, dynamic>{'Format': 'subrip', 'Method': 'Embed'},
      <String, dynamic>{'Format': 'pgs', 'Method': 'External'},
      <String, dynamic>{'Format': 'pgssub', 'Method': 'External'},
      <String, dynamic>{'Format': 'dvdsub', 'Method': 'External'},
      <String, dynamic>{'Format': 'dvbsub', 'Method': 'External'},
    ];

    final responseProfiles = <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Container': 'm4v',
        'MimeType': 'video/mp4',
      },
      <String, dynamic>{
        'Type': 'Video',
        'Container': 'mkv',
        'MimeType': 'video/x-matroska',
      },
    ];

    return <String, dynamic>{
      'Name': 'Moonfin Tizen',
      'MaxStreamingBitrate': maxBitrate,
      'MaxStaticBitrate': maxBitrate,
      'MaxStaticMusicBitrate': 40000000,
      'MusicStreamingTranscodingBitrate': 384000,
      'DirectPlayProfiles':
          debugForceTranscode ? const <Map<String, dynamic>>[] : directPlayProfiles,
      'TranscodingProfiles': transcodingProfiles,
      'ContainerProfiles': <Map<String, dynamic>>[],
      'CodecProfiles': codecProfiles,
      'SubtitleProfiles': subtitleProfiles,
      'ResponseProfiles': responseProfiles,
    };
  }

  static Map<String, dynamic> _cond(
    String condition,
    String property,
    String value, {
    required bool isRequired,
  }) {
    return <String, dynamic>{
      'Condition': condition,
      'Property': property,
      'Value': value,
      'IsRequired': isRequired,
    };
  }

  static _TizenCaps _capabilities(MaxVideoResolution maxResolution) {
    final base = _detected ?? _staticCaps;
    final width = maxResolution == MaxVideoResolution.auto
        ? 0
        : maxResolution.width;
    if (width <= 0) return base; // auto → use the panel tier as-is.
    if (width <= 1920) return base.copyWith(uhd: false, uhd8K: false);
    if (width <= 3840) return base.copyWith(uhd8K: false);
    return base;
  }
}

class _TizenCaps {
  const _TizenCaps({
    required this.uhd,
    required this.uhd8K,
    required this.hevc,
    required this.av1,
    required this.vp9,
    required this.hdr10,
    required this.dolbyVision,
    required this.ac3,
    required this.eac3,
    required this.opus,
    required this.truehd,
  });

  final bool uhd;
  final bool uhd8K;
  final bool hevc;
  final bool av1;
  final bool vp9;
  final bool hdr10;
  final bool dolbyVision;
  final bool ac3;
  final bool eac3;
  final bool opus;
  final bool truehd;

  _TizenCaps copyWith({bool? uhd, bool? uhd8K}) {
    return _TizenCaps(
      uhd: uhd ?? this.uhd,
      uhd8K: uhd8K ?? this.uhd8K,
      hevc: hevc,
      av1: av1,
      vp9: vp9,
      hdr10: hdr10,
      dolbyVision: dolbyVision,
      ac3: ac3,
      eac3: eac3,
      opus: opus,
      truehd: truehd,
    );
  }
}
