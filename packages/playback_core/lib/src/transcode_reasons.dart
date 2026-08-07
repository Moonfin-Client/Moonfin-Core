import 'stream_resolution_result.dart';

/// Reasons the client can work out on its own by holding what came back
/// against the profile it asked with.
///
/// Jellyfin states its reasons on the media source. Emby has no field for them
/// at all, so an Emby transcode reads as "Unknown" everywhere they are shown
/// and the play method collapses to a bare "Transcoding". These fill that in
/// using the same tokens Jellyfin sends, so both servers read alike.
///
/// [serverReasons] always come first and are never second guessed, so a server
/// that explained itself keeps its own wording.
List<String> mergeTranscodeReasons({
  required StreamPlayMethod playMethod,
  List<String> serverReasons = const <String>[],
  List<Map<String, dynamic>> mediaStreams = const <Map<String, dynamic>>[],
  String? container,
  int? sourceBitrate,
  int? maxStreamingBitrate,
  int? audioStreamIndex,
  Map<String, dynamic>? deviceProfile,
}) {
  final reasons = List<String>.of(serverReasons);
  if (playMethod != StreamPlayMethod.transcode) return reasons;

  final seen = reasons.map((r) => r.toLowerCase()).toSet();
  void add(String reason, [Set<String> alsoCovers = const <String>{}]) {
    final lower = reason.toLowerCase();
    if (seen.contains(lower) || alsoCovers.any(seen.contains)) return;
    reasons.add(reason);
    seen.add(lower);
  }

  // A ceiling the source runs past is the one thing servers word half a dozen
  // ways, so any of those spellings counts as already said.
  if (maxStreamingBitrate != null &&
      sourceBitrate != null &&
      sourceBitrate > maxStreamingBitrate) {
    add('VideoBitrateNotSupported', _bitrateReasons);
  }

  // With no streams there is nothing to hold the profile against.
  if (mediaStreams.isEmpty) return reasons;

  // An audio source has to be read against the audio profile. Judging a flac
  // by the video containers would call every music transcode a container
  // problem.
  final video = _streamsOfType(mediaStreams, 'video');
  final profiles = _directPlayProfiles(
    deviceProfile,
    video.isEmpty ? 'audio' : 'video',
  );
  if (profiles.isEmpty) return reasons;

  final normalizedContainer = container?.toLowerCase().trim();
  if (normalizedContainer != null &&
      normalizedContainer.isNotEmpty &&
      _rejects(profiles, 'Container', normalizedContainer)) {
    add('ContainerNotSupported');
  }

  final videoCodec = _codecOf(video.firstOrNull);
  if (videoCodec != null && _rejects(profiles, 'VideoCodec', videoCodec)) {
    add('VideoCodecNotSupported');
  }

  final audioCodec = _codecOf(
    _selectedAudioStream(mediaStreams, audioStreamIndex),
  );
  if (audioCodec != null && _rejects(profiles, 'AudioCodec', audioCodec)) {
    add('AudioCodecNotSupported');
  }

  return reasons;
}

/// Whether [value] is missing from what the profiles list under [key]. A
/// profile that leaves the key off accepts anything, so an empty list is no
/// opinion rather than a rejection.
bool _rejects(List<Map<String, dynamic>> profiles, String key, String value) {
  final allowed = _csvValues(profiles, key);
  return allowed.isNotEmpty && !allowed.contains(value);
}

List<Map<String, dynamic>> _directPlayProfiles(
  Map<String, dynamic>? deviceProfile,
  String type,
) {
  final raw = deviceProfile?['DirectPlayProfiles'];
  if (raw is! List) return const <Map<String, dynamic>>[];
  return raw
      .whereType<Map>()
      .map((e) => e.cast<String, dynamic>())
      .where((e) => e['Type']?.toString().toLowerCase() == type)
      .toList(growable: false);
}

Set<String> _csvValues(List<Map<String, dynamic>> profiles, String key) {
  final values = <String>{};
  for (final profile in profiles) {
    final raw = profile[key]?.toString();
    if (raw == null || raw.isEmpty) continue;
    for (final value in raw.split(',')) {
      final trimmed = value.trim().toLowerCase();
      if (trimmed.isNotEmpty) values.add(trimmed);
    }
  }
  return values;
}

List<Map<String, dynamic>> _streamsOfType(
  List<Map<String, dynamic>> mediaStreams,
  String type,
) => mediaStreams
    .where((s) => s['Type']?.toString().toLowerCase() == type)
    .toList(growable: false);

/// The audio track the server actually worked from, falling back to the first
/// when nothing said which. Guessing the wrong track would name a codec the
/// stream never carried.
Map<String, dynamic>? _selectedAudioStream(
  List<Map<String, dynamic>> mediaStreams,
  int? audioStreamIndex,
) {
  final audio = _streamsOfType(mediaStreams, 'audio');
  if (audio.isEmpty) return null;
  if (audioStreamIndex != null) {
    for (final stream in audio) {
      if (stream['Index'] == audioStreamIndex) return stream;
    }
  }
  return audio.first;
}

String? _codecOf(Map<String, dynamic>? stream) {
  final codec = stream?['Codec']?.toString().toLowerCase().trim();
  return (codec == null || codec.isEmpty) ? null : codec;
}

const Set<String> _bitrateReasons = <String>{
  'videobitratenotsupported',
  'containerbitrateexceedslimit',
  'videobitrateexceedslimit',
  'bitratelimitexceeded',
  'containerbitratenotsupported',
  'audiobitratenotsupported',
};
