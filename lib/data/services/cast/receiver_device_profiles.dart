/// Device profiles for the remote receivers we hand a URL to. Without one the
/// server offers the raw file as direct play, and a receiver that cant demux
/// Matroska or decode HEVC just drops to a black screen.
library;

/// Google's default media receiver. Every Cast device handles H264 in MP4 and
/// VP8/VP9 in WebM, so anything else transcodes to HLS. The empty subtitle
/// list makes the server burn a selected subtitle in, since the receiver is
/// never handed a side-loaded track.
///
/// [maxBitrateMbps] is the user's own ceiling, the one the local players
/// already read. A receiver that cant pull the default stalls part way in and
/// restarts, and until now the cast path gave nobody a way to lower it.
///
/// It can only lower the ceiling, never raise it. The preference describes the
/// user's network rather than the receiver, and it defaults to 120, so taking
/// it at face value would hand every default install six times what casting
/// asked for before.
Map<String, dynamic> chromecastDeviceProfile({int? maxBitrateMbps}) {
  const castCeiling = 20000000;
  final requested = (maxBitrateMbps != null && maxBitrateMbps > 0)
      ? maxBitrateMbps * 1000000
      : castCeiling;
  final bitrate = requested < castCeiling ? requested : castCeiling;
  return <String, dynamic>{
    'Name': 'Moonfin Chromecast',
    'MaxStaticBitrate': bitrate,
    'MaxStreamingBitrate': bitrate,
    'MusicStreamingTranscodingBitrate': 384000,
    'DirectPlayProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Container': 'mp4,m4v',
        'VideoCodec': 'h264',
        'AudioCodec': 'aac,mp3',
      },
      <String, dynamic>{
        'Type': 'Video',
        'Container': 'webm',
        'VideoCodec': 'vp8,vp9',
        'AudioCodec': 'vorbis,opus',
      },
      <String, dynamic>{
        'Type': 'Audio',
        'Container': 'mp3,aac,m4a,m4b,flac,wav,ogg,oga,webma',
        'AudioCodec': 'mp3,aac,flac,wav,vorbis,opus',
      },
    ],
    'TranscodingProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Context': 'Streaming',
        'Container': 'ts',
        'Protocol': 'hls',
        'VideoCodec': 'h264',
        'AudioCodec': 'aac,mp3',
        'CopyTimestamps': false,
        'MaxAudioChannels': '2',
      },
      <String, dynamic>{
        'Type': 'Audio',
        'Context': 'Streaming',
        'Container': 'ts',
        'Protocol': 'hls',
        'AudioCodec': 'aac',
        'MaxAudioChannels': '2',
      },
    ],
    'ContainerProfiles': <Map<String, dynamic>>[],
    'CodecProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Codec': 'h264',
        'Conditions': <Map<String, dynamic>>[
          <String, dynamic>{
            'Condition': 'EqualsAny',
            'Property': 'VideoProfile',
            'Value': 'high|main|baseline|constrained baseline',
            'IsRequired': false,
          },
          // First and second generation Cast devices stop at High profile
          // level 4.1, and the sender can't ask which model it reached, so
          // this takes the floor like the width cap below does. Nothing is
          // lost at 1080p either, since 4.2 only buys frame rates past 60.
          // A receiver that is handed a level it refuses rejects the whole
          // manifest before fetching a segment, so no transcode ever starts.
          <String, dynamic>{
            'Condition': 'LessThanEqual',
            'Property': 'VideoLevel',
            'Value': '41',
            'IsRequired': false,
          },
          // The oldest Cast devices still in use top out at 1080p, and the
          // sender has no way to ask which model it reached.
          <String, dynamic>{
            'Condition': 'LessThanEqual',
            'Property': 'Width',
            'Value': '1920',
            'IsRequired': false,
          },
        ],
      },
    ],
    'SubtitleProfiles': <Map<String, dynamic>>[],
  };
}

/// A DLNA renderer, which is nearly always a TV. Its `GetProtocolInfo` lists
/// containers with any codec, so this is what TVs of the last decade play:
/// H264 and HEVC in MP4, Matroska or MPEG-TS, with AAC, MP3 and Dolby audio.
/// DTS and TrueHD convert, since many TVs dropped them. Many renderers list
/// no HLS, so the HLS profile is only the last resort, and it lists HEVC so a
/// server that converts only the audio keeps the video as it is.
Map<String, dynamic> dlnaDeviceProfile() {
  const bitrate = 120000000;
  return <String, dynamic>{
    'Name': 'Moonfin DLNA',
    'MaxStaticBitrate': bitrate,
    'MaxStreamingBitrate': bitrate,
    'MusicStreamingTranscodingBitrate': 384000,
    'DirectPlayProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        // Emby names an MPEG-TS source mpegts and matches names exactly.
        'Container': 'mp4,m4v,mkv,ts,mpegts',
        'VideoCodec': 'h264,hevc',
        'AudioCodec': 'aac,mp3,ac3,eac3',
      },
      <String, dynamic>{
        'Type': 'Audio',
        'Container': 'mp3,aac,m4a,flac,wav',
        // Jellyfin and Emby name WAV audio by its PCM format.
        'AudioCodec': 'mp3,aac,flac,wav,pcm_s16le,pcm_s24le',
      },
    ],
    'TranscodingProfiles': <Map<String, dynamic>>[
      // Jellyfin and Emby take the first profile, and many TVs (LG) can't
      // open HLS, so a conversion goes out as one MPEG-TS stream. Silo only
      // converts over HLS and skips this profile.
      <String, dynamic>{
        'Type': 'Video',
        'Context': 'Streaming',
        'Container': 'ts',
        'Protocol': 'http',
        'VideoCodec': 'h264,hevc',
        'AudioCodec': 'aac,ac3',
        'CopyTimestamps': false,
      },
      <String, dynamic>{
        'Type': 'Video',
        'Context': 'Streaming',
        'Container': 'ts',
        'Protocol': 'hls',
        'VideoCodec': 'h264,hevc',
        'AudioCodec': 'aac,ac3',
        'CopyTimestamps': false,
      },
      <String, dynamic>{
        'Type': 'Audio',
        'Context': 'Streaming',
        'Container': 'mp3',
        'Protocol': 'http',
        'AudioCodec': 'mp3',
      },
    ],
    'ContainerProfiles': <Map<String, dynamic>>[],
    'CodecProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Codec': 'h264',
        'Conditions': <Map<String, dynamic>>[
          // TVs decode eight-bit H264 only, so High 10 converts.
          <String, dynamic>{
            'Condition': 'EqualsAny',
            'Property': 'VideoProfile',
            'Value': 'high|main|baseline|constrained baseline',
            'IsRequired': false,
          },
          <String, dynamic>{
            'Condition': 'LessThanEqual',
            'Property': 'VideoLevel',
            'Value': '51',
            'IsRequired': false,
          },
        ],
      },
      <String, dynamic>{
        'Type': 'Video',
        'Codec': 'hevc',
        'Conditions': <Map<String, dynamic>>[
          <String, dynamic>{
            'Condition': 'EqualsAny',
            'Property': 'VideoProfile',
            'Value': 'main|main 10',
            'IsRequired': false,
          },
          // Profile 5 has no fallback layer and comes out green and purple on
          // a TV without Dolby Vision, and profile 7 needs its enhancement
          // layer. Profile 8 keeps an HDR10 base any HDR set shows.
          <String, dynamic>{
            'Condition': 'NotEquals',
            'Property': 'VideoRangeType',
            'Value': 'DOVI',
            'IsRequired': false,
          },
          <String, dynamic>{
            'Condition': 'NotEquals',
            'Property': 'VideoRangeType',
            'Value': 'DOVIWithEL',
            'IsRequired': false,
          },
          <String, dynamic>{
            'Condition': 'NotEquals',
            'Property': 'VideoRangeType',
            'Value': 'DOVIWithELHDR10Plus',
            'IsRequired': false,
          },
          <String, dynamic>{
            'Condition': 'NotEquals',
            'Property': 'VideoRangeType',
            'Value': 'DOVIInvalid',
            'IsRequired': false,
          },
        ],
      },
    ],
    // TVs draw a text track carried in the file, so a default subtitle
    // doesn't force a burn-in transcode. Bitmap and styled tracks still burn.
    'SubtitleProfiles': <Map<String, dynamic>>[
      <String, dynamic>{'Format': 'srt', 'Method': 'Embed'},
      <String, dynamic>{'Format': 'subrip', 'Method': 'Embed'},
    ],
  };
}

/// AirPlay video, where AVPlayer fetches the URL itself. It handles H264 and
/// HEVC in the MP4 family plus HLS, and nothing Matroska. The 15 Mbps ceiling
/// is the cap this path has always used.
Map<String, dynamic> airPlayDeviceProfile() {
  const bitrate = 15000000;
  return <String, dynamic>{
    'Name': 'Moonfin AirPlay',
    'MaxStaticBitrate': bitrate,
    'MaxStreamingBitrate': bitrate,
    'MusicStreamingTranscodingBitrate': 384000,
    'DirectPlayProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Container': 'mp4,m4v,mov',
        'VideoCodec': 'h264,hevc',
        // No FLAC here, since AVFoundation only reads it from its own
        // container and would play an MP4 that carries it silently.
        'AudioCodec': 'aac,mp3,ac3,eac3,alac',
      },
      <String, dynamic>{
        'Type': 'Audio',
        'Container': 'mp3,aac,m4a,m4b,flac,alac,wav',
        'AudioCodec': 'mp3,aac,flac,alac,wav',
      },
    ],
    'TranscodingProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Context': 'Streaming',
        'Container': 'ts',
        'Protocol': 'hls',
        'VideoCodec': 'h264',
        'AudioCodec': 'aac,ac3,eac3',
        'CopyTimestamps': false,
      },
      <String, dynamic>{
        'Type': 'Audio',
        'Context': 'Streaming',
        'Container': 'ts',
        'Protocol': 'hls',
        'AudioCodec': 'aac',
      },
    ],
    'ContainerProfiles': <Map<String, dynamic>>[],
    'CodecProfiles': <Map<String, dynamic>>[
      <String, dynamic>{
        'Type': 'Video',
        'Codec': 'h264',
        'Conditions': <Map<String, dynamic>>[
          <String, dynamic>{
            'Condition': 'LessThanEqual',
            'Property': 'VideoLevel',
            'Value': '51',
            'IsRequired': false,
          },
        ],
      },
      <String, dynamic>{
        'Type': 'Video',
        'Codec': 'hevc',
        'Conditions': <Map<String, dynamic>>[
          <String, dynamic>{
            'Condition': 'EqualsAny',
            'Property': 'VideoProfile',
            'Value': 'main|main 10',
            'IsRequired': false,
          },
          <String, dynamic>{
            'Condition': 'LessThanEqual',
            'Property': 'VideoLevel',
            'Value': '153',
            'IsRequired': false,
          },
        ],
      },
    ],
    'SubtitleProfiles': <Map<String, dynamic>>[],
  };
}
