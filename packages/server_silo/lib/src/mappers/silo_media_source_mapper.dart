import 'package:server_core/server_core.dart';

import 'silo_ids.dart';
import 'silo_item_mapper.dart' show siloOriginalKey;
import 'silo_languages.dart';
import 'silo_ticks.dart';

/// Key under which a mapped `MediaSource` keeps its track map: which Silo
/// track each Jellyfin stream `Index` stands for (see [SiloTrackRef]).
const siloTracksKey = '_siloTracks';

/// The kinds of track Silo lists on a file version.
enum SiloTrackKind { video, audio, subtitle }

/// The Silo track behind one Jellyfin stream index.
///
/// Silo numbers each kind on its own: `video_tracks[0]`, `audio_tracks[0]`
/// (what `effective_audio_track_index` and the playback request's
/// `audio_track_index` count), and subtitles by their place in
/// `subtitle_tracks` (the playback plan's `file:<id>:subtitle:<n>`). Jellyfin
/// gives every stream of a file one shared `Index`. The resolver uses this to
/// turn the index Moonfin picked back into Silo's terms.
class SiloTrackRef {
  const SiloTrackRef({
    required this.kind,
    required this.ordinal,
    this.containerIndex,
  });

  /// Which list the track is in.
  final SiloTrackKind kind;

  /// Its place in that list, from 0.
  final int ordinal;

  /// A subtitle's `index` as Silo sent it (the container stream number).
  final int? containerIndex;

  Map<String, dynamic> _toJson(int index) => {
    'Index': index,
    'Kind': kind.name,
    'Ordinal': ordinal,
    'ContainerIndex': ?containerIndex,
  };

  @override
  bool operator ==(Object other) =>
      other is SiloTrackRef &&
      other.kind == kind &&
      other.ordinal == ordinal &&
      other.containerIndex == containerIndex;

  @override
  int get hashCode => Object.hash(kind, ordinal, containerIndex);

  @override
  String toString() => 'SiloTrackRef(${kind.name} $ordinal)';
}

/// The Silo track a mapped [mediaSource]'s stream [index] stands for, or null
/// when the source has no such stream.
SiloTrackRef? siloTrackForStreamIndex(
  Map<String, dynamic> mediaSource,
  int index,
) {
  for (final entry in _trackEntries(mediaSource)) {
    if (entry['Index'] != index) continue;
    final kind = SiloTrackKind.values.asNameMap()[entry['Kind']];
    final ordinal = entry['Ordinal'];
    if (kind == null || ordinal is! int) return null;
    final container = entry['ContainerIndex'];
    return SiloTrackRef(
      kind: kind,
      ordinal: ordinal,
      containerIndex: container is int ? container : null,
    );
  }
  return null;
}

/// The Jellyfin stream index of Silo's track [ordinal] of [kind] in a mapped
/// [mediaSource], the reverse of [siloTrackForStreamIndex]: the playback plan
/// names the tracks it chose, and Moonfin's pickers want the index.
int? siloStreamIndexForTrack(
  Map<String, dynamic> mediaSource,
  SiloTrackKind kind,
  int ordinal,
) {
  for (final entry in _trackEntries(mediaSource)) {
    if (entry['Kind'] == kind.name && entry['Ordinal'] == ordinal) {
      final index = entry['Index'];
      return index is int ? index : null;
    }
  }
  return null;
}

/// The stream index after every stream of [source], where subtitles Silo
/// keeps beside the file (ones its subtitle search fetched) are numbered.
int siloNextStreamIndex(Map<String, dynamic>? source) =>
    [
      for (final s in (source?['MediaStreams'] as List?) ?? const [])
        if (s is Map && s['Index'] is int) s['Index'] as int,
    ].fold<int>(-1, (a, b) => b > a ? b : a) +
    1;

/// Moonfin's stream for a subtitle Silo keeps beside the file rather than in
/// it, on stream [index].
Map<String, dynamic> siloAddedSubtitleStream({
  required int index,
  String? codec,
  String? language,
  String? label,
  bool forced = false,
  bool hearingImpaired = false,
}) => {
  'Type': 'Subtitle',
  'Index': index,
  'Codec': ?codec,
  'Language': ?language,
  'Title': ?label,
  'DisplayTitle': [
    ?siloLanguageName(language),
    if (label != null && label != language) label,
  ].join(' - '),
  'IsForced': forced,
  'IsHearingImpaired': hearingImpaired,
  'IsDefault': false,
  'IsExternal': true,
  'IsTextSubtitleStream': true,
  'SupportsExternalStream': true,
};

Iterable<Map<String, dynamic>> _trackEntries(Map<String, dynamic> source) {
  final tracks = source[siloTracksKey];
  if (tracks is! List) return const [];
  return tracks.whereType<Map>().map((e) => e.cast<String, dynamic>());
}

/// The `MediaSources` of a Silo item (`CatalogItem` detail, `/watch` answer
/// or season list entry), default version first. Empty when it has no files
/// (a series).
///
/// Detail and watch answers carry full `versions`, and season list entries
/// carry lightweight `files` (see [siloFileToMediaSource]). The default
/// version is the first playback variant's `default_file_id`, as Silo's own
/// player picks it.
List<Map<String, dynamic>> siloItemMediaSources(
  Map<String, dynamic> item, {
  required String itemId,
}) {
  final defaultFileId = _defaultFileId(item);
  final versions = item['versions'];
  final sources = <Map<String, dynamic>>[];
  if (versions is List && versions.isNotEmpty) {
    for (final v in versions) {
      final version = asJsonMap(v);
      if (version == null) continue;
      final source = siloVersionToMediaSource(version, itemId: itemId);
      if (source != null) sources.add(source);
    }
  } else if (item['files'] case final List files) {
    for (final f in files) {
      final file = asJsonMap(f);
      if (file == null) continue;
      final source = siloFileToMediaSource(file, itemId: itemId);
      if (source != null) sources.add(source);
    }
  }
  if (sources.isEmpty) return sources;

  // Default first, the way Jellyfin lists it and Moonfin plays it.
  final at = defaultFileId == null
      ? -1
      : sources.indexWhere((s) => s['Id'] == defaultFileId);
  if (at > 0) sources.insert(0, sources.removeAt(at));
  for (final (i, s) in sources.indexed) {
    s['Type'] = i == 0 ? 'Default' : 'Grouping';
  }
  return sources;
}

String? _defaultFileId(Map<String, dynamic> item) {
  final variants = item['playback_variants'];
  if (variants is! List || variants.isEmpty) return null;
  final first = asJsonMap(variants.first);
  return siloIdOf(first?['default_file_id']);
}

/// One Silo file version (`FileVersion`) as a Jellyfin `MediaSource`.
///
/// The streams share one index space, as on Jellyfin: subtitles keep the
/// container index Silo gives them (`subtitle_tracks[].index`), and video
/// then audio take the lowest indices left (Silo sends no index for them).
/// The map from index to Silo track is kept under [siloTracksKey].
///
/// Every delivery is marked possible: Silo decides how to deliver when
/// playback starts, not Moonfin from these flags.
///
/// Null for a version without a `file_id`.
Map<String, dynamic>? siloVersionToMediaSource(
  Map<String, dynamic> version, {
  required String itemId,
}) {
  final fileId = siloIdOf(version['file_id']);
  if (fileId == null) return null;

  final videos = _maps(version['video_tracks']);
  final audios = _maps(version['audio_tracks']);
  final subtitles = _maps(version['subtitle_tracks']);

  // Subtitles keep Silo's container index, and the rest fill the gaps.
  final used = <int>{};
  final subtitleIndex = <int?>[];
  for (final s in subtitles) {
    final index = s['index'];
    if (index is int && index >= 0 && used.add(index)) {
      subtitleIndex.add(index);
    } else {
      subtitleIndex.add(null);
    }
  }
  var next = 0;
  int nextFree() {
    while (used.contains(next)) {
      next++;
    }
    used.add(next);
    return next;
  }

  final fileBitrate = _kbps(version['bitrate']);
  final defaultAudio = _defaultAudioOrdinal(version, audios);
  final defaultSubtitle = subtitles.indexWhere((s) => s['default'] == true);

  final streams = <Map<String, dynamic>>[];
  final tracks = <Map<String, dynamic>>[];
  void add(Map<String, dynamic> stream, SiloTrackRef ref) {
    streams.add(stream);
    tracks.add(ref._toJson(stream['Index'] as int));
  }

  for (final (i, v) in videos.indexed) {
    add(
      _videoStream(v, nextFree(), first: i == 0, fileBitrate: fileBitrate),
      SiloTrackRef(kind: SiloTrackKind.video, ordinal: i),
    );
  }
  int? defaultAudioIndex;
  for (final (i, a) in audios.indexed) {
    final index = nextFree();
    if (i == defaultAudio) defaultAudioIndex = index;
    add(
      _audioStream(a, index, isDefault: i == defaultAudio),
      SiloTrackRef(kind: SiloTrackKind.audio, ordinal: i),
    );
  }
  int? defaultSubtitleIndex;
  for (final (i, s) in subtitles.indexed) {
    final index = subtitleIndex[i] ?? nextFree();
    if (i == defaultSubtitle) defaultSubtitleIndex = index;
    add(
      _subtitleStream(s, index),
      SiloTrackRef(
        kind: SiloTrackKind.subtitle,
        ordinal: i,
        containerIndex: subtitleIndex[i],
      ),
    );
  }
  streams.sort((a, b) => (a['Index'] as int).compareTo(b['Index'] as int));

  final duration = version['duration'] ?? version['duration_seconds'];
  final container = jsonText(version['container']);
  return {
    'Id': fileId,
    'ItemId': itemId,
    'Name': _sourceName(version, videos.firstOrNull),
    'Protocol': 'File',
    'Type': 'Default',
    'Container': ?container,
    if (jsonText(version['file_path']) case final path?) 'Path': path,
    if (version['file_size'] case final num size) 'Size': size.toInt(),
    'Bitrate': ?fileBitrate,
    if (duration is num && duration > 0)
      'RunTimeTicks': secondsToTicks(duration),
    'IsRemote': false,
    'SupportsDirectPlay': true,
    'SupportsDirectStream': true,
    'SupportsTranscoding': true,
    'DefaultAudioStreamIndex': ?defaultAudioIndex,
    'DefaultSubtitleStreamIndex': ?defaultSubtitleIndex,
    'MediaStreams': streams,
    siloTracksKey: tracks,
    siloOriginalKey: version,
  };
}

/// A season list's lightweight file (`file_id`, `resolution`, `codec_video`,
/// `hdr`, `audio_channels`, `container`, `file_size`) as a `MediaSource`.
///
/// It carries enough for the quality badges on episode cards: a video stream
/// at the resolution's nominal 16:9 size and an audio stream with its channel
/// count. Its track map is empty, so playback loads the full version before
/// choosing tracks.
Map<String, dynamic>? siloFileToMediaSource(
  Map<String, dynamic> file, {
  required String itemId,
}) {
  final fileId = siloIdOf(file['file_id']);
  if (fileId == null) return null;
  final height = _nominalHeight(file['resolution']);
  final codec = jsonText(file['codec_video']);
  final hdr = file['hdr'] == true;
  final channels = file['audio_channels'];
  final video = <String, dynamic>{
    'Type': 'Video',
    'Index': 0,
    'Codec': ?codec,
    if (height != null) ...{
      'Width': (height * 16 / 9).round(),
      'Height': height,
    },
    'VideoRange': hdr ? 'HDR' : 'SDR',
    // Only that it is HDR is known, not which kind.
    if (!hdr) 'VideoRangeType': 'SDR',
    'IsDefault': true,
  };
  video['DisplayTitle'] = _videoTitle(video);
  final container = jsonText(file['container']);
  return {
    'Id': fileId,
    'ItemId': itemId,
    'Name': _sourceName(file, null),
    'Protocol': 'File',
    'Type': 'Default',
    'Container': ?container,
    if (file['file_size'] case final num size) 'Size': size.toInt(),
    'IsRemote': false,
    'SupportsDirectPlay': true,
    'SupportsDirectStream': true,
    'SupportsTranscoding': true,
    'MediaStreams': [
      video,
      if (channels is num)
        {
          'Type': 'Audio',
          'Index': 1,
          'Channels': channels.toInt(),
          'IsDefault': true,
        },
    ],
    siloTracksKey: const <Map<String, dynamic>>[],
    siloOriginalKey: file,
  };
}

Map<String, dynamic> _videoStream(
  Map<String, dynamic> t,
  int index, {
  required bool first,
  required int? fileBitrate,
}) {
  final range = _videoRange(t);
  final frameRate = _frameRate(t['frame_rate']);
  final stream = <String, dynamic>{
    'Type': 'Video',
    'Index': index,
    'Codec': ?jsonText(t['codec']),
    'Profile': ?jsonText(t['profile']),
    if (t['level'] case final num level) 'Level': level,
    if (t['width'] case final num w) 'Width': w.toInt(),
    if (t['height'] case final num h) 'Height': h.toInt(),
    'AspectRatio': ?jsonText(t['aspect_ratio']),
    'IsInterlaced': t['interlaced'] == true,
    'RealFrameRate': ?frameRate,
    'AverageFrameRate': ?frameRate,
    if (t['bit_depth'] case final num depth) 'BitDepth': depth.toInt(),
    'PixelFormat': ?jsonText(t['pixel_format']),
    'ColorTransfer': ?jsonText(t['color_transfer']),
    'ColorPrimaries': ?jsonText(t['color_primaries']),
    'ColorSpace': ?jsonText(t['color_space']),
    'VideoRange': range.range,
    'VideoRangeType': range.type,
    if (t['dv_profile'] case final num p) 'DvProfile': p.toInt(),
    if (t['dv_level'] case final num l) 'DvLevel': l.toInt(),
    if (t['dv_bl_compat_id'] case final num c)
      'DvBlSignalCompatibilityId': c.toInt(),
    'BitRate': ?(_kbps(t['bitrate']) ?? fileBitrate),
    'Title': ?jsonText(t['embedded_title']),
    'IsDefault': first,
    'IsExternal': false,
  };
  stream['DisplayTitle'] = _videoTitle(stream);
  return stream;
}

Map<String, dynamic> _audioStream(
  Map<String, dynamic> t,
  int index, {
  required bool isDefault,
}) {
  final channels = t['channels'] is num ? (t['channels'] as num).toInt() : null;
  final layout = _channelLayout(jsonText(t['layout']), channels);
  final language = jsonText(t['language']);
  final codec = jsonText(t['codec']);
  return {
    'Type': 'Audio',
    'Index': index,
    'Codec': ?codec,
    'Profile': ?jsonText(t['profile']),
    'Language': ?language,
    'Title': ?jsonText(t['embedded_title']),
    'DisplayTitle': [
      ?siloLanguageName(language),
      ?codec?.toUpperCase(),
      ?layout,
      if (isDefault) '(Default)',
    ].join(' '),
    'ChannelLayout': ?layout,
    'Channels': ?channels,
    'BitRate': ?_kbps(t['bitrate']),
    if (t['sample_rate'] case final num rate) 'SampleRate': rate.toInt(),
    if (t['bit_depth'] case final num depth) 'BitDepth': depth.toInt(),
    'IsDefault': isDefault,
    'IsExternal': false,
  };
}

Map<String, dynamic> _subtitleStream(Map<String, dynamic> t, int index) {
  final language = jsonText(t['language']);
  final codec = jsonText(t['codec']);
  final title = jsonText(t['embedded_title']);
  final forced = t['forced'] == true;
  final hearingImpaired = t['hearing_impaired'] == true;
  final isDefault = t['default'] == true;
  final text = codec == null || !_imageSubtitleCodecs.contains(codec);
  final languageName = siloLanguageName(language);
  final titleSays = title?.toLowerCase() ?? '';
  final parts = [
    // A title that only repeats the language ("English (CC)") adds nothing.
    if (title != null &&
        (languageName == null ||
            !titleSays.contains(languageName.toLowerCase())))
      title,
    if (forced && !titleSays.contains('forced')) 'Forced',
    if (hearingImpaired &&
        !titleSays.contains('sdh') &&
        !titleSays.contains('cc'))
      'SDH',
    if (isDefault) 'Default',
    ?_subtitleCodecLabel(codec),
  ];
  final details = parts.join(' ');
  return {
    'Type': 'Subtitle',
    'Index': index,
    'Codec': ?codec,
    'Language': ?language,
    'Title': ?title,
    'DisplayTitle': languageName == null
        ? details
        : details.isEmpty
        ? languageName
        : '$languageName ($details)',
    'IsForced': forced,
    'IsHearingImpaired': hearingImpaired,
    'IsDefault': isDefault,
    'IsExternal': t['external'] == true,
    'IsTextSubtitleStream': text,
    'SupportsExternalStream': text,
  };
}

/// Image subtitle codecs (bitmaps, burned in or drawn by the player). Every
/// other subtitle codec is text.
const _imageSubtitleCodecs = {
  'hdmv_pgs_subtitle',
  'pgssub',
  'pgs',
  'dvd_subtitle',
  'dvdsub',
  'vobsub',
  'dvb_subtitle',
  'dvbsub',
  'xsub',
};

String? _subtitleCodecLabel(String? codec) => switch (codec) {
  null => null,
  'hdmv_pgs_subtitle' => 'PGSSUB',
  'dvd_subtitle' => 'DVDSUB',
  'dvb_subtitle' => 'DVBSUB',
  _ => codec.toUpperCase(),
};

/// Jellyfin's `VideoRangeType` names, by their spelling without case or
/// separators, so `hdr10plus`, `HDR10+` and `HDR10_PLUS` all match.
const _rangeTypes = {
  'sdr': 'SDR',
  'hdr10': 'HDR10',
  'hdr10plus': 'HDR10Plus',
  'hlg': 'HLG',
  'dovi': 'DOVI',
  'dolbyvision': 'DOVI',
  'doviwithhdr10': 'DOVIWithHDR10',
  'doviwithhdr10plus': 'DOVIWithHDR10Plus',
  'doviwithhlg': 'DOVIWithHLG',
  'doviwithsdr': 'DOVIWithSDR',
  'doviwithel': 'DOVIWithEL',
  'doviwithelhdr10plus': 'DOVIWithELHDR10Plus',
  'doviinvalid': 'DOVIInvalid',
};

/// `VideoRange` (`SDR`/`HDR`) and `VideoRangeType` of a video track.
///
/// Silo usually says the type (`video_range_type`), which is matched to
/// Jellyfin's spelling. Without it the type is worked out the way Jellyfin
/// does: Dolby Vision from its profile and base-layer compatibility, then
/// HDR10+, then the transfer function (PQ is HDR10, HLG is HLG), else SDR.
({String range, String type}) _videoRange(Map<String, dynamic> t) {
  final said = jsonText(t['video_range_type']);
  final type = said == null
      ? _derivedRangeType(t)
      : _rangeTypes[said
                .toLowerCase()
                .replaceAll('+', 'plus')
                .replaceAll(RegExp('[^a-z0-9]'), '')] ??
            said;
  final range =
      jsonText(t['video_range'])?.toUpperCase() ??
      (type == 'SDR' ? 'SDR' : 'HDR');
  return (range: range, type: type);
}

String _derivedRangeType(Map<String, dynamic> t) {
  final dolbyVision =
      t['dv_profile'] is num ||
      (jsonText(t['dolby_vision']) ?? 'none').toLowerCase() != 'none';
  final hdr10Plus = t['hdr10_plus'] == true;
  if (dolbyVision) {
    final compat = t['dv_bl_compat_id'];
    return switch (compat is num ? compat.toInt() : null) {
      1 || 6 => hdr10Plus ? 'DOVIWithHDR10Plus' : 'DOVIWithHDR10',
      2 => 'DOVIWithSDR',
      4 => 'DOVIWithHLG',
      _ => 'DOVI',
    };
  }
  if (hdr10Plus) return 'HDR10Plus';
  return switch (jsonText(t['color_transfer'])?.toLowerCase()) {
    'smpte2084' => 'HDR10',
    'arib-std-b67' => 'HLG',
    _ => 'SDR',
  };
}

/// "4K HDR10 HEVC", "1080p HEVC": the label Jellyfin shows for a video
/// stream.
String _videoTitle(Map<String, dynamic> stream) {
  final type = stream['VideoRangeType'] as String?;
  final hdr = stream['VideoRange'] == 'HDR';
  return [
    ?_resolutionLabel(
      stream['Width'] as int?,
      stream['Height'] as int?,
      interlaced: stream['IsInterlaced'] == true,
    ),
    if (hdr) type ?? 'HDR',
    ?(stream['Codec'] as String?)?.toUpperCase(),
  ].join(' ');
}

String? _resolutionLabel(int? width, int? height, {bool interlaced = false}) {
  if (width == null || height == null || width <= 0 || height <= 0) {
    return null;
  }
  final s = interlaced ? 'i' : 'p';
  if (width >= 7600 || height >= 4300) return '8K';
  if (width >= 3800 || height >= 2000) return '4K';
  if (width >= 2500 || height >= 1400) return '1440$s';
  if (width >= 1800 || height >= 1000) return '1080$s';
  if (width >= 1200 || height >= 700) return '720$s';
  if (width >= 600 || height >= 400) return '480$s';
  return 'SD';
}

/// The version's name in Moonfin's version picker: the file name without its
/// extension, as Jellyfin and Emby show it. For a viewer Silo shows no file
/// name to, its edition and quality ("Extended 2160p HEVC HDR").
String _sourceName(Map<String, dynamic> version, Map<String, dynamic>? video) {
  final fileName = jsonText(version['file_name']);
  if (fileName != null) {
    final dot = fileName.lastIndexOf('.');
    return dot > 0 ? fileName.substring(0, dot) : fileName;
  }
  final edition =
      jsonText(version['edition_raw']) ?? jsonText(version['edition_key']);
  final resolution = jsonText(version['resolution']);
  return [
    ?edition,
    ?resolution,
    ?jsonText(version['codec_video'])?.toUpperCase(),
    if (version['hdr'] == true) video == null ? 'HDR' : _videoRange(video).type,
  ].join(' ');
}

/// "5.1(side)" as "5.1", "stereo" as "Stereo", or from the channel count when
/// Silo sends no layout.
String? _channelLayout(String? layout, int? channels) {
  if (layout != null) {
    final bare = layout.replaceAll(RegExp(r'\(.*\)'), '').trim();
    if (bare.isEmpty) return null;
    return bare[0].toUpperCase() + bare.substring(1);
  }
  return switch (channels) {
    1 => 'Mono',
    2 => 'Stereo',
    6 => '5.1',
    8 => '7.1',
    _ => null,
  };
}

int? _defaultAudioOrdinal(
  Map<String, dynamic> version,
  List<Map<String, dynamic>> audios,
) {
  if (audios.isEmpty) return null;
  final effective = version['effective_audio_track_index'];
  if (effective is int && effective >= 0 && effective < audios.length) {
    return effective;
  }
  final flagged = audios.indexWhere((a) => a['default'] == true);
  return flagged >= 0 ? flagged : 0;
}

/// Silo's kilobits per second as Jellyfin's bits per second.
int? _kbps(Object? value) =>
    value is num && value > 0 ? (value * 1000).round() : null;

double? _frameRate(Object? value) {
  if (value is num) return value > 0 ? value.toDouble() : null;
  if (value is! String) return null;
  final slash = value.indexOf('/');
  if (slash > 0) {
    final n = double.tryParse(value.substring(0, slash));
    final d = double.tryParse(value.substring(slash + 1));
    return n != null && d != null && d > 0 ? n / d : null;
  }
  final rate = double.tryParse(value);
  return rate != null && rate > 0 ? rate : null;
}

/// The frame height of "1080p", "2160p", "720i" or "4K".
int? _nominalHeight(Object? resolution) {
  if (resolution is! String) return null;
  final r = resolution.trim().toLowerCase();
  if (r == '4k' || r == 'uhd') return 2160;
  if (r == '8k') return 4320;
  final match = RegExp(r'^(\d{3,4})[pi]?$').firstMatch(r);
  return match == null ? null : int.parse(match.group(1)!);
}

List<Map<String, dynamic>> _maps(Object? list) => list is List
    ? [
        for (final e in list)
          if (asJsonMap(e) case final map?) map,
      ]
    : const [];
