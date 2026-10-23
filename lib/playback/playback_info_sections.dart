import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../data/utils/video_range_label.dart';
import '../l10n/app_localizations.dart';
import '../preference/user_preferences.dart';
import '../util/audio_labels.dart';
import '../util/language_codes.dart';
import '../util/language_matching.dart';
import '../util/platform_detection.dart';
import '../util/remote_subtitle_labels.dart' show frameRateLabel;
import 'aether_backend.dart';
import 'html_video_backend.dart';
import 'media3_player_backend.dart';
import 'media_kit_player_backend.dart';
import 'playback_profile_diagnostics.dart';

/// Sections are `{title, rows}` with `id: 'technical'` on Technical, and rows
/// are `{label, value, bold?}` or `{note}`, localized and in final order so the
/// tvOS panel can draw them as they are.
List<Map<String, dynamic>> buildPlaybackInfoSections({
  required AppLocalizations l10n,
  required StreamResolutionResult? resolution,
  required List<Map<String, dynamic>> mediaStreams,
  Map<String, dynamic>? mediaSource,
  String? fallbackPlayMethod,
  int? audioStreamIndex,
  int? subtitleStreamIndex,
  Map<String, dynamic>? transcodingInfo,
  bool offline = false,
  bool transcodeForced = false,
  int? qualityLimitMbps,
  String? channel,
  String? program,
  String? localFile,
  String? player,
  String? device,
  String? audioRoute,
  String? hdrOutput,
}) {
  final download = offline || (resolution?.isLocalMedia ?? false);
  final query = _lowerQuery(resolution?.streamUrl);
  // Jellyfin keeps a session's TranscodingInfo after the transcode ends, and
  // an earlier transcode that's still running reports into the same session,
  // so it only counts for a transcode whose reasons agree with it.
  final info =
      !download &&
          resolution?.playMethod == StreamPlayMethod.transcode &&
          _sameReasons(
            query['transcodereasons'],
            transcodingInfo?['TranscodeReasons'],
          )
      ? transcodingInfo
      : null;
  final method = download
      ? StreamPlayMethod.directPlay
      : playbackInfoMethod(resolution?.playMethod, fallbackPlayMethod, info);
  final transcoding = method == StreamPlayMethod.transcode;
  final explained = transcoding || method == StreamPlayMethod.directStream;
  final reasons = !explained
      ? const <String>[]
      : _firstReasons([
          query['transcodereasons'],
          info?['TranscodeReasons'],
          resolution?.transcodingReasons,
        ]);

  final video = mediaStreams.where((s) => s['Type'] == 'Video').firstOrNull;
  final audio = _pickAudio(
    mediaStreams,
    audioStreamIndex ?? resolution?.selectedAudioStreamIndex,
  );
  final subtitleIndex =
      subtitleStreamIndex ?? resolution?.selectedSubtitleStreamIndex;
  final subtitle = subtitleIndex == null || subtitleIndex < 0
      ? null
      : mediaStreams
            .where(
              (s) => s['Type'] == 'Subtitle' && s['Index'] == subtitleIndex,
            )
            .firstOrNull;

  final delivered = transcoding ? resolution?.deliveredFormat : null;
  final sourceVideo = _text(video?['Codec']);
  final sourceAudio = _text(audio?['Codec']);
  final outVideo = _outputCodec(
    info?['VideoCodec'],
    delivered?.videoCodec,
    sourceVideo,
    videoCodecName,
  );
  final outAudio = _outputCodec(
    info?['AudioCodec'],
    delivered?.audioCodec,
    sourceAudio,
    audioCodecName,
  );
  final sourceBitrate =
      resolution?.sourceBitrate ?? _int(mediaSource?['Bitrate']);
  // Jellyfin leaves SubtitleMethod=Encode on the URL even when the picked
  // track goes out as a separate file, so the URL has to name that track.
  final burned =
      transcoding &&
      subtitle != null &&
      (subtitle['DeliveryMethod']?.toString().toLowerCase() == 'encode' ||
          (query['subtitlemethod']?.toLowerCase() == 'encode' &&
              _queryInt(query, 'subtitlestreamindex') == subtitleIndex));
  final maxAudioChannels =
      _queryInt(query, 'transcodingmaxaudiochannels') ??
      _queryInt(query, 'maxaudiochannels');
  bool hasReason(Set<String> names) =>
      reasons.any((r) => names.contains(r.toLowerCase()));
  // Without the session, a codec reason alone doesn't prove a re-encode, since
  // Jellyfin's reasons only say why direct play failed.
  final videoConverted =
      transcoding &&
      switch (info?['IsVideoDirect']) {
        final bool direct => !direct,
        _ =>
          _differs(outVideo, sourceVideo, videoCodecName) ||
              _above(
                _int(video?['BitRate']) ?? sourceBitrate,
                delivered?.videoBitrate,
              ) ||
              _above(_int(video?['Width']), _queryInt(query, 'maxwidth')) ||
              _above(_int(video?['Height']), _queryInt(query, 'maxheight')) ||
              hasReason(_videoReencodeReasons) ||
              burned,
      };
  final audioConverted =
      transcoding &&
      switch (info?['IsAudioDirect']) {
        final bool direct => !direct,
        _ =>
          _differs(outAudio, sourceAudio, audioCodecName) ||
              _above(_int(audio?['BitRate']), delivered?.audioBitrate) ||
              _above(_int(audio?['Channels']), maxAudioChannels) ||
              hasReason(const {'audiochannelsnotsupported'}),
      };

  final sections = <Map<String, dynamic>>[];
  void addSection(String title, List<Map<String, dynamic>> rows) {
    if (rows.isNotEmpty) sections.add({'title': title, 'rows': rows});
  }

  final note = download
      ? l10n.playbackInfoNoteOffline
      : switch (method) {
          StreamPlayMethod.directPlay => l10n.playbackInfoNoteDirectPlay,
          StreamPlayMethod.directStream => l10n.playbackInfoNoteDirectStream,
          StreamPlayMethod.transcode when videoConverted && audioConverted =>
            l10n.playbackInfoNoteTranscodeBoth,
          StreamPlayMethod.transcode when videoConverted =>
            l10n.playbackInfoNoteTranscodeVideo,
          StreamPlayMethod.transcode when audioConverted =>
            l10n.playbackInfoNoteTranscodeAudio,
          StreamPlayMethod.transcode => l10n.playbackInfoNoteTranscodeUnknown,
          null => null,
        };
  final container =
      _fileExtension(mediaSource?['Path']) ??
      switch (_text(mediaSource?['Container']) ??
          _text(resolution?.container)) {
        final list? => containerLabel(list),
        null => null,
      };
  final why = playbackWhyLines(
    l10n,
    reasons,
    forced: explained && transcodeForced,
    video: video,
    audio: audio,
    subtitle: subtitle,
    container: container,
    bitrate: sourceBitrate,
    limit: qualityLimitMbps == null
        ? _streamingTarget(query)
        : qualityLimitMbps * 1000000,
  );

  // The URL only names a cap, which says nothing once it's at or above the
  // file's own rate.
  final out =
      _positive(info?['Bitrate']) ??
      switch (delivered?.totalBitrate) {
        final cap? when sourceBitrate == null || cap < sourceBitrate => cap,
        _ => null,
      };
  final outText = out == null ? null : formatPlaybackBitrate(out);
  final sourceText = sourceBitrate == null
      ? null
      : formatPlaybackBitrate(sourceBitrate);
  final bitrate = outText == null || sourceText == null || outText == sourceText
      ? outText ?? sourceText
      : l10n.playbackInfoOriginal(outText, sourceText);

  addSection(l10n.playback, [
    if (_text(channel) case final value?) _row(l10n.playbackInfoChannel, value),
    if (_text(program) case final value?) _row(l10n.playbackInfoProgram, value),
    if (method != null)
      _row(l10n.playMethod, switch (method) {
        StreamPlayMethod.directPlay => l10n.directPlay,
        StreamPlayMethod.directStream => l10n.directStream,
        StreamPlayMethod.transcode => l10n.transcoding,
      }, bold: true),
    if (note != null) {'note': note},
    if (why.isNotEmpty) _row(l10n.playbackInfoWhy, why.join('\n')),
    if (bitrate != null) _row(l10n.bitrate, bitrate),
    if (qualityLimitMbps != null)
      _row(
        l10n.playbackInfoQualityLimit,
        l10n.bitrateValueMbps(qualityLimitMbps),
      ),
  ]);

  if (video != null) {
    final width = _positive(video['Width']);
    final height = _positive(video['Height']);
    final outWidth = _positive(info?['Width']);
    final outHeight = _positive(info?['Height']);
    String? resolutionText;
    if (width != null && height != null) {
      final sourceName = playbackResolutionName(width, height);
      resolutionText =
          outWidth != null &&
              outHeight != null &&
              (outWidth != width || outHeight != height)
          ? l10n.playbackInfoResolutionConverted(
              playbackResolutionName(outWidth, outHeight),
              '$outWidth×$outHeight',
              sourceName,
            )
          : '$sourceName ($width×$height)';
    }

    final fps = _frameRate(video);

    String? format;
    if (sourceVideo != null) {
      final name = videoCodecName(sourceVideo);
      final profile = _videoProfile(video);
      format =
          videoConverted &&
              outVideo != null &&
              _differs(outVideo, sourceVideo, videoCodecName)
          ? l10n.playbackInfoConvertedFrom(videoCodecName(outVideo), name)
          : (profile == null ? name : '$name $profile');
    }

    final range = videoRangeLabel(video);
    final sourceRange = _sourceRange(video, range);
    final serverToneMapped =
        videoConverted && range != 'SDR' && hasReason(_hdrReasons);
    final outRange = hdrOutput ?? (serverToneMapped ? 'SDR' : null);

    addSection(l10n.video, [
      if (resolutionText != null) _row(l10n.resolution, resolutionText),
      if (fps != null)
        _row(l10n.playbackInfoFrameRate, '${frameRateLabel(fps)} fps'),
      if (format != null) _row(l10n.format, format),
      _row(
        l10n.hdr,
        outRange != null && outRange != range
            ? l10n.playbackInfoConvertedFrom(outRange, sourceRange)
            : sourceRange,
      ),
    ]);
  }

  if (audio != null) {
    final track = _trackName(audio);
    String? format;
    if (sourceAudio != null) {
      format =
          audioConverted &&
              outAudio != null &&
              _differs(outAudio, sourceAudio, audioCodecName)
          ? l10n.playbackInfoConvertedFrom(
              audioCodecName(outAudio),
              audioCodecName(sourceAudio),
            )
          : audioCodecName(sourceAudio, profile: _text(audio['Profile']));
    }
    final channels = _int(audio['Channels']);
    final outChannels = _int(info?['AudioChannels']);

    addSection(l10n.audio, [
      if (track != null)
        _row(
          l10n.track,
          audio['IsDefault'] == true ? '$track, ${l10n.defaultLabel}' : track,
        ),
      if (format != null) _row(l10n.format, format),
      if (channels != null)
        _row(
          l10n.channels,
          // Emby's session echoes the profile's channel ceiling, and no
          // server upmixes, so only fewer channels counts as converted.
          outChannels != null && outChannels < channels
              ? l10n.playbackInfoConvertedFrom(
                  playbackChannelsLabel(l10n, outChannels),
                  _channelLayout(l10n, channels),
                )
              : playbackChannelsLabel(l10n, channels),
        ),
    ]);
  }

  if (subtitle != null) {
    final track = _trackName(subtitle);
    final codec = _text(subtitle['Codec']);

    addSection(l10n.subtitles, [
      if (track != null)
        _row(
          l10n.track,
          [
            track,
            if (subtitle['IsForced'] == true) l10n.forced,
            if (subtitle['IsHearingImpaired'] == true) l10n.hearingImpaired,
          ].join(', '),
        ),
      if (codec != null) _row(l10n.format, subtitleFormatName(codec)),
      _row(
        l10n.playbackInfoDelivery,
        burned
            ? l10n.playbackInfoBurnedIn
            : subtitle['IsExternal'] == true
            ? l10n.external
            : l10n.embedded,
      ),
    ]);
  }

  if (channel == null) {
    final size = _int(mediaSource?['Size']);
    addSection(l10n.playbackInfoFile, [
      if (_fileName(mediaSource?['Path']) ??
              _fileName(localFile) ??
              _text(mediaSource?['Name'])
          case final value?)
        _row(l10n.name, value),
      if (container != null) _row(l10n.container, container),
      if (size != null && size > 0) _row(l10n.sortBySize, fileSizeLabel(size)),
    ]);
  }

  // Sent even when empty, since tvOS may add Dropped Frames to it.
  sections.add({
    'title': l10n.playbackInfoTechnical,
    'id': 'technical',
    'rows': [
      if (_text(player) case final value?) _row(l10n.player, value),
      if (_text(device) case final value?) _row(l10n.playbackInfoDevice, value),
      if (reasons.isNotEmpty) _row(l10n.transcodeReasons, reasons.join(', ')),
      if (_text(audioRoute) case final value?)
        _row(l10n.playbackInfoAudioRoute, value),
    ],
  });

  return sections;
}

/// A transcode URL that copies both the video and the audio is only a remux,
/// which is Direct Stream.
StreamPlayMethod? playbackInfoMethod(
  StreamPlayMethod? resolved,
  String? fallback,
  Map<String, dynamic>? transcodingInfo,
) {
  final method =
      resolved ??
      switch (fallback) {
        'directPlay' => StreamPlayMethod.directPlay,
        'directStream' => StreamPlayMethod.directStream,
        'transcode' => StreamPlayMethod.transcode,
        _ => null,
      };
  if (method == StreamPlayMethod.transcode &&
      transcodingInfo?['IsVideoDirect'] == true &&
      transcodingInfo?['IsAudioDirect'] == true) {
    return StreamPlayMethod.directStream;
  }
  return method;
}

/// Deduped in the server's order, from the URL first since Jellyfin and Emby
/// both write them there, then the session, then [fallback].
List<String> playbackTranscodeReasons({
  String? transcodingUrl,
  Map<String, dynamic>? transcodingInfo,
  List<String> fallback = const <String>[],
}) => _firstReasons([
  _lowerQuery(transcodingUrl)['transcodereasons'],
  transcodingInfo?['TranscodeReasons'],
  fallback,
]);

List<String> _firstReasons(List<Object?> sources) => sources
    .map(_splitReasons)
    .firstWhere((reasons) => reasons.isNotEmpty, orElse: () => const []);

/// A list or a comma string, trimmed and deduped in any case.
List<String> _splitReasons(Object? raw) {
  final values = raw is List
      ? raw.map((e) => e.toString())
      : (raw?.toString() ?? '').split(',');
  final seen = <String>{};
  return [
    for (final value in values.map((e) => e.trim()))
      if (value.isNotEmpty && seen.add(value.toLowerCase())) value,
  ];
}

/// One line per reason in a fixed order with identical lines shown once, and
/// [limit] is in bits per second.
List<String> playbackWhyLines(
  AppLocalizations l10n,
  List<String> reasons, {
  bool forced = false,
  Map<String, dynamic>? video,
  Map<String, dynamic>? audio,
  Map<String, dynamic>? subtitle,
  String? container,
  int? bitrate,
  int? limit,
}) {
  final videoCodec = _text(video?['Codec']);
  final codec = videoCodec == null ? null : videoCodecName(videoCodec);
  final profile = _videoProfile(video);
  final level = codec == null ? null : _videoLevel(codec, video?['Level']);
  final videoBits = _positive(video?['BitDepth']);
  final width = _positive(video?['Width']);
  final height = _positive(video?['Height']);
  final fps = video == null ? null : _frameRate(video);
  final range = video == null ? null : videoRangeLabel(video);
  final audioCodec = _text(audio?['Codec']);
  final audioProfile = _text(audio?['Profile']);
  final channels = _positive(audio?['Channels']);
  final sampleRate = _positive(audio?['SampleRate']);
  final audioBits = _positive(audio?['BitDepth']);
  final subtitleCodec = _text(subtitle?['Codec']);

  final videoLine = codec == null
      ? l10n.playbackInfoWhyVideo
      : l10n.playbackInfoWhyVideoCodec(codec);
  final audioLine = audioCodec == null
      ? l10n.playbackInfoWhyAudio
      : l10n.playbackInfoWhyAudioCodec(audioCodecName(audioCodec));

  (int, String) line(String reason) => switch (reason) {
    'containerbitrateexceedslimit' ||
    'videobitratenotsupported' ||
    'audiobitratenotsupported' ||
    'videobitrateexceedslimit' ||
    'bitratelimitexceeded' ||
    'containerbitratenotsupported' => (
      2,
      switch ((bitrate, limit)) {
        // Rounded down so it never reads above the bitrate, and a cap under
        // 1 Mbps gets the plain line instead of 0.
        (final bitrate?, final limit?)
            when bitrate > limit && limit >= 1000000 =>
          l10n.playbackInfoWhyBitrateLimit(
            formatPlaybackBitrate(bitrate),
            l10n.bitrateValueMbps(limit ~/ 1000000),
          ),
        _ => l10n.playbackInfoWhyBitrate,
      },
    ),
    'containernotsupported' => (
      3,
      container == null
          ? l10n.playbackInfoWhyContainer
          : l10n.playbackInfoWhyContainerName(container),
    ),
    'videocodecnotsupported' || 'videocodectagnotsupported' => (4, videoLine),
    'videoprofilenotsupported' => (
      5,
      codec == null || profile == null
          ? videoLine
          : l10n.playbackInfoWhyVideoProfile(codec, profile),
    ),
    'videolevelnotsupported' => (
      6,
      codec == null || level == null
          ? videoLine
          : l10n.playbackInfoWhyVideoLevel(codec, level),
    ),
    'videobitdepthnotsupported' => (
      7,
      videoBits == null
          ? l10n.playbackInfoWhyVideo
          : l10n.playbackInfoWhyVideoBitDepth(videoBits),
    ),
    'videoresolutionnotsupported' => (
      8,
      width == null || height == null
          ? l10n.playbackInfoWhyVideo
          : l10n.playbackInfoWhyVideoResolution(
              playbackResolutionName(width, height),
            ),
    ),
    'videoframeratenotsupported' => (
      9,
      fps == null
          ? l10n.playbackInfoWhyVideo
          : l10n.playbackInfoWhyVideoFrameRate(frameRateLabel(fps)),
    ),
    'interlacedvideonotsupported' => (10, l10n.playbackInfoWhyInterlaced),
    'anamorphicvideonotsupported' => (11, l10n.playbackInfoWhyAnamorphic),
    'refframesnotsupported' ||
    'unknownvideostreaminfo' => (12, l10n.playbackInfoWhyVideo),
    // An SDR label means the server's HDR type couldn't be read.
    'videorangetypenotsupported' || 'videorangenotsupported' => (
      13,
      range == null || range == 'SDR'
          ? l10n.playbackInfoWhyHdr
          : l10n.playbackInfoWhyHdrName(_sourceRange(video!, range)),
    ),
    'audiocodecnotsupported' => (14, audioLine),
    'audioprofilenotsupported' => (
      15,
      audioCodec == null || audioProfile == null
          ? audioLine
          : l10n.playbackInfoWhyAudioProfile(
              audioCodecName(audioCodec, profile: audioProfile),
            ),
    ),
    'audiochannelsnotsupported' => (
      16,
      channels == null
          ? l10n.playbackInfoWhyAudio
          : l10n.playbackInfoWhyAudioChannels(switch (channels) {
              6 => '5.1',
              8 => '7.1',
              _ => '$channels-channel',
            }),
    ),
    'audiosampleratenotsupported' => (
      17,
      sampleRate == null
          ? l10n.playbackInfoWhyAudio
          : l10n.playbackInfoWhyAudioSampleRate(_oneDecimal(sampleRate / 1000)),
    ),
    'audiobitdepthnotsupported' => (
      18,
      audioBits == null
          ? l10n.playbackInfoWhyAudio
          : l10n.playbackInfoWhyAudioBitDepth(audioBits),
    ),
    'audioisexternal' => (19, l10n.playbackInfoWhyAudioExternal),
    'secondaryaudionotsupported' => (20, l10n.playbackInfoWhySecondaryAudio),
    'unknownaudiostreaminfo' => (21, l10n.playbackInfoWhyAudio),
    'subtitlecodecnotsupported' => (
      22,
      subtitleCodec == null
          ? l10n.playbackInfoWhySubtitles
          : l10n.playbackInfoWhySubtitleFormat(
              subtitleFormatName(subtitleCodec).replaceFirst(_formatKind, ''),
            ),
    ),
    _ => (23, l10n.playbackInfoWhyOther),
  };

  final lines = [
    if (forced) (1, l10n.playbackInfoWhyForced),
    for (final reason in reasons) line(reason.toLowerCase()),
  ]..sort((a, b) => a.$1.compareTo(b.$1));
  return {for (final (_, text) in lines) text}.toList();
}

final _formatKind = RegExp(r' \(.*\)$');

/// An empty list on either side says nothing, so it counts as a match.
bool _sameReasons(Object? a, Object? b) {
  final lowerA = {for (final reason in _splitReasons(a)) reason.toLowerCase()};
  final lowerB = {for (final reason in _splitReasons(b)) reason.toLowerCase()};
  return lowerA.isEmpty ||
      lowerB.isEmpty ||
      (lowerA.length == lowerB.length && lowerA.containsAll(lowerB));
}

const _hdrReasons = {'videorangetypenotsupported', 'videorangenotsupported'};

/// The bitrate a transcode URL aims for, the whole stream's cap first.
int? _streamingTarget(Map<String, String> query) {
  final video = _queryInt(query, 'videobitrate');
  final audio = _queryInt(query, 'audiobitrate');
  return _queryInt(query, 'maxstreamingbitrate') ??
      (video == null || audio == null ? null : video + audio);
}

num? _frameRate(Map<String, dynamic> video) => [
  video['RealFrameRate'],
  video['AverageFrameRate'],
].whereType<num>().where((v) => v > 0).firstOrNull;

String _sourceRange(Map<String, dynamic> video, String range) =>
    switch (_int(video['DvProfile'])) {
      final profile? when range == 'Dolby Vision' => '$range Profile $profile',
      _ => range,
    };

// A profile of 0 is a placeholder rather than a name.
String? _videoProfile(Map<String, dynamic>? video) =>
    switch (_text(video?['Profile'])) {
      '0' => null,
      final profile => profile,
    };

// H.264 writes level 5.1 as 51 and HEVC as 153.
String? _videoLevel(String codec, Object? level) =>
    level is num && level > 0
    ? _oneDecimal(switch (codec) {
        'H.264' => level / 10,
        'HEVC' => level / 30,
        _ => level,
      })
    : null;

String _oneDecimal(num value) =>
    value.toStringAsFixed(1).replaceFirst(RegExp(r'\.0$'), '');

int? _positive(Object? value) => switch (_int(value)) {
  final number? when number > 0 => number,
  _ => null,
};

/// Only the Live TV direct play setting counts, since direct play turned off
/// anywhere else is the app's own choice or a one-off pick.
bool transcodeForcedBySettings(PlaybackManager manager) =>
    manager.isTranscodeForced &&
    MediaStreamResolver.isLiveTvItem(manager.queueService.currentItem);

/// The player's own pick, else the bitrate setting once it differs from the
/// app's default.
int? userQualityLimitMbps(int? overrideMbps, String setting) =>
    overrideMbps ??
    (setting == UserPreferences.maxBitrate.defaultValue
        ? null
        : int.tryParse(setting));

String playbackResolutionName(int width, int height) {
  if (width >= 3200 || height >= 1800) return '4K';
  if (width >= 1600 || height >= 900) return '1080p';
  if (width >= 1200 || height >= 700) return '720p';
  return 'SD';
}

String formatPlaybackBitrate(int bitrate) {
  if (bitrate >= 1000000) {
    return '${(bitrate / 1000000).toStringAsFixed(1)} Mbps';
  }
  if (bitrate >= 1000) return '${(bitrate / 1000).round()} Kbps';
  return '$bitrate bps';
}

String fileSizeLabel(int bytes) {
  const gib = 1024 * 1024 * 1024;
  return bytes >= gib
      ? '${(bytes / gib).toStringAsFixed(1)} GB'
      : '${(bytes / (1024 * 1024)).round()} MB';
}

String containerLabel(String container) {
  final entries = container.toLowerCase().split(',').map((e) => e.trim());
  return entries.contains('mp4') ? 'MP4' : entries.first.toUpperCase();
}

String playbackChannelsLabel(AppLocalizations l10n, int channels) =>
    switch (channels) {
      1 => l10n.mono,
      2 => l10n.stereo,
      6 => l10n.playbackInfoSurround51,
      8 => l10n.playbackInfoSurround71,
      _ => l10n.playbackInfoChannelCount(channels),
    };

String _channelLayout(AppLocalizations l10n, int channels) =>
    switch (channels) {
      6 => '5.1',
      8 => '7.1',
      _ => playbackChannelsLabel(l10n, channels),
    };

String videoCodecName(String codec) => switch (codec.trim().toLowerCase()) {
  'hevc' || 'h265' => 'HEVC',
  'h264' || 'avc' => 'H.264',
  'av1' => 'AV1',
  'vp9' => 'VP9',
  'vp8' => 'VP8',
  'mpeg2video' => 'MPEG-2',
  'mpeg4' => 'MPEG-4',
  'vc1' => 'VC-1',
  final other => other.toUpperCase(),
};

String audioCodecName(String codec, {String? profile}) {
  final lower = codec.trim().toLowerCase();
  final atmos = (profile?.toLowerCase().contains('atmos') ?? false)
      ? ' with Atmos'
      : '';
  return switch (lower) {
    'truehd' => 'Dolby TrueHD$atmos',
    'eac3' => 'Dolby Digital Plus$atmos',
    'ac3' => 'Dolby Digital$atmos',
    'dts' || 'dca' => switch (audioLabelFromProfileCodec(profile, lower)) {
      'DTS:X' => 'DTS:X',
      'DTS-HD MA' => 'DTS-HD Master Audio',
      'DTS-HD HRA' => 'DTS-HD High Resolution',
      _ => 'DTS',
    },
    'aac' => 'AAC',
    'flac' => 'FLAC',
    'opus' => 'Opus',
    'mp3' => 'MP3',
    'vorbis' => 'Vorbis',
    'alac' => 'ALAC',
    _ when lower.startsWith('pcm_') => 'PCM',
    _ => lower.toUpperCase(),
  };
}

String subtitleFormatName(String codec) => switch (codec.trim().toLowerCase()) {
  'pgssub' => 'PGS (image)',
  'dvdsub' || 'dvd_subtitle' || 'vobsub' => 'VobSub (image)',
  'dvbsub' => 'DVB (image)',
  'subrip' || 'srt' => 'SRT (text)',
  'ass' => 'ASS (styled text)',
  'ssa' => 'SSA (styled text)',
  'webvtt' || 'vtt' => 'WebVTT (text)',
  'mov_text' || 'tx3g' => 'MP4 text',
  'ttml' => 'TTML (text)',
  final other => other.toUpperCase(),
};

String? playerEngineName(PlayerBackend? backend) => switch (backend) {
  Media3PlayerBackend _ => 'Media3 (ExoPlayer)',
  HtmlVideoBackend _ => 'HTML5 (browser)',
  AetherBackend _ => 'AetherEngine',
  MediaKitPlayerBackend _ => 'media_kit (libmpv)',
  _ => null,
};

/// Only when the last playback decision was for [mediaSourceId], and speakers
/// or headphones aren't worth a row.
String? playbackAudioRoute(String? mediaSourceId) {
  final decision = PlaybackProfileDiagnostics.instance.lastDecision;
  final decidedFor = decision?['mediaSourceId']?.toString();
  if (decidedFor != null &&
      mediaSourceId != null &&
      decidedFor != mediaSourceId) {
    return null;
  }
  return switch (decision?['activeRouteType']) {
    'hdmi' => 'HDMI',
    'arc' => 'HDMI ARC',
    'earc' => 'HDMI eARC',
    'bluetooth' => 'Bluetooth',
    _ => null,
  };
}

/// This device's session TranscodingInfo while [resolution] is a transcode,
/// or null when the server doesn't say in time.
Future<Map<String, dynamic>?> fetchOwnTranscodingInfo(
  MediaServerClient client,
  StreamResolutionResult? resolution,
) async {
  if (resolution?.playMethod != StreamPlayMethod.transcode) return null;
  try {
    final sessions = await client.sessionApi.getSessions().timeout(
      const Duration(milliseconds: 1500),
    );
    final own = sessions.where((session) {
      final sourceId = (session['PlayState'] as Map?)?['MediaSourceId'];
      return session['DeviceId']?.toString() == client.deviceInfo.id &&
          (sourceId == null ||
              sourceId.toString() == resolution!.mediaSourceId);
    }).firstOrNull;
    final info = own?['TranscodingInfo'];
    return info is Map ? Map<String, dynamic>.from(info) : null;
  } catch (_) {
    return null;
  }
}

Future<String?>? _deviceLabel;

/// Read once per run, and null where the platform won't say.
Future<String?> playbackDeviceLabel() => _deviceLabel ??= _readDeviceLabel();

Future<String?> _readDeviceLabel() async {
  String join(String model, String os) =>
      model.trim().isEmpty ? os : '${model.trim()}, $os';
  try {
    if (PlatformDetection.isAppleTV) {
      final version = RegExp(r'\d+(\.\d+)*')
          .firstMatch(PlatformDetection.osVersion)?[0];
      return join('Apple TV', version == null ? 'tvOS' : 'tvOS $version');
    }
    if (PlatformDetection.isWeb) return null;
    final info = DeviceInfoPlugin();
    if (PlatformDetection.isAndroid) {
      final android = await info.androidInfo;
      return join(
        GetIt.instance<DeviceInfo>().name,
        'Android ${android.version.release}',
      );
    }
    if (PlatformDetection.isIOS) {
      final ios = await info.iosInfo;
      return join(ios.modelName, '${ios.systemName} ${ios.systemVersion}');
    }
    if (PlatformDetection.isMacOS) {
      final mac = await info.macOsInfo;
      return join(
        mac.modelName,
        'macOS ${mac.majorVersion}.${mac.minorVersion}.${mac.patchVersion}',
      );
    }
    if (PlatformDetection.isWindows) {
      final windows = await info.windowsInfo;
      return '${windows.productName} ${windows.displayVersion}'.trim();
    }
    if (PlatformDetection.isLinux) {
      return (await info.linuxInfo).prettyName;
    }
  } catch (_) {}
  return null;
}

Map<String, dynamic> _row(String label, String value, {bool bold = false}) => {
  'label': label,
  'value': value,
  if (bold) 'bold': true,
};

Map<String, dynamic>? _pickAudio(
  List<Map<String, dynamic>> streams,
  int? index,
) {
  final audio = streams.where((s) => s['Type'] == 'Audio');
  return audio.where((s) => index != null && s['Index'] == index).firstOrNull ??
      audio.where((s) => s['IsDefault'] == true).firstOrNull ??
      audio.firstOrNull;
}

String? _trackName(Map<String, dynamic> stream) {
  final code = normalizeLanguage(stream['Language']?.toString());
  final iso3 = toIso3Language(code);
  return kIso6392Languages[_bibliographicCodes[iso3] ?? iso3] ??
      _text(stream['Title']);
}

// Servers tag tracks with either ISO 639-2 spelling, and the name table uses
// the terminology one.
const _bibliographicCodes = {
  'alb': 'sqi',
  'arm': 'hye',
  'baq': 'eus',
  'bur': 'mya',
  'chi': 'zho',
  'cze': 'ces',
  'dut': 'nld',
  'fre': 'fra',
  'geo': 'kat',
  'ger': 'deu',
  'gre': 'ell',
  'ice': 'isl',
  'mac': 'mkd',
  'mao': 'mri',
  'may': 'msa',
  'per': 'fas',
  'rum': 'ron',
  'slo': 'slk',
  'tib': 'bod',
  'wel': 'cym',
};

bool _differs(String? out, String? source, String Function(String) name) =>
    out != null && source != null && name(out) != name(source);

bool _above(int? source, int? limit) =>
    source != null && limit != null && source > limit;

/// The session names the output codec, and the URL's codec list only does when
/// the source codec isn't on it, since that list is just what the profile takes.
String? _outputCodec(
  Object? sessionCodec,
  String? urlCodecs,
  String? source,
  String Function(String) name,
) {
  if (_text(sessionCodec) case final codec?) return codec;
  final listed = [
    for (final codec in (urlCodecs ?? '').split(',')) ?_text(codec),
  ];
  if (listed.isEmpty) return null;
  if (source != null && listed.any((c) => name(c) == name(source))) {
    return source;
  }
  return listed.first;
}

const _videoReencodeReasons = {
  ..._hdrReasons,
  'videoprofilenotsupported',
  'videolevelnotsupported',
  'videobitdepthnotsupported',
};

/// Servers differ on the case of the names, so they're lowered.
Map<String, String> _lowerQuery(String? url) {
  final query = url == null ? null : Uri.tryParse(url)?.queryParameters;
  return {
    for (final entry in query?.entries ?? const <MapEntry<String, String>>[])
      entry.key.toLowerCase(): entry.value,
  };
}

String? _fileName(Object? path) =>
    _text(_text(path)?.split(RegExp(r'[\\/]')).last);

// Jellyfin narrows Container to what the device profile lists, so an .mp4 can
// come back as mov. A folder rip's dotted name isn't an extension.
String? _fileExtension(Object? path) =>
    _mediaExtension.firstMatch(_fileName(path) ?? '')?[1]?.toUpperCase();

final _mediaExtension = RegExp(
  r'\.(3gp|asf|avi|divx|flv|iso|m2ts|m4v|mkv|mov|mp4|mpeg|mpg|mts|ogm|ogv|'
  r'rmvb|ts|vob|webm|wmv|wtv)$',
  caseSensitive: false,
);

int? _queryInt(Map<String, String> query, String name) =>
    int.tryParse(query[name] ?? '');

String? _text(Object? value) {
  final text = value?.toString().trim();
  return text == null || text.isEmpty ? null : text;
}

int? _int(Object? value) => value is num ? value.toInt() : null;
