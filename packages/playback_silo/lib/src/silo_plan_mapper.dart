import 'package:playback_core/playback_core.dart';
import 'package:server_silo/server_silo.dart';

import 'silo_subtitles.dart';

/// How Moonfin names each of Silo's deliveries.
///
/// The original file is a direct play. A remux keeps the codecs and changes
/// only the container (Jellyfin's direct stream). An HLS transcode re-encodes.
/// Unknown deliveries count as a transcode, the cautious reading.
StreamPlayMethod siloPlayMethod(String? delivery) => switch (delivery) {
  'original_http' => StreamPlayMethod.directPlay,
  'server_remux_progressive' ||
  'server_remux_hls' => StreamPlayMethod.directStream,
  _ => StreamPlayMethod.transcode,
};

/// A URL from a plan as one the player can open: absolute URLs (a proxy
/// node's) as they are, and a path on the API origin under [baseUrl].
///
/// Silo's v2 plans name local media under `/api/v2/...`. An older server or
/// a realtime event may still send `/stream/...` or `/playback/transcode/...`
/// without it, which the web player maps the same way. The query (the signed
/// `st` reference, `seek`, a subtitle's identity pins) is kept byte for byte.
String siloPlanUrl(String baseUrl, String url) {
  final legacy = RegExp(
    r'^(?:/api/v1)?/(?=stream/|playback/transcode/)',
  ).firstMatch(url);
  final path = legacy == null ? url : '/api/v2/${url.substring(legacy.end)}';
  return resolveSiloUrl(path, baseUrl)!;
}

/// How long a paused progressive remux is kept by Silo before it closes the
/// response (its stream stall window). A longer pause is resumed with a
/// replan at the position, as Silo's web player does after a minute.
const siloProgressiveIdleWindow = Duration(minutes: 1);

/// The account credentials a Silo media request needs.
class SiloStreamAuth {
  const SiloStreamAuth({
    required this.accessToken,
    this.profileId,
    this.profileToken,
  });

  final String accessToken;
  final String? profileId;
  final String? profileToken;

  /// The headers every media request carries: the bearer token and the
  /// profile it plays as (with its PIN proof).
  Map<String, String> get headers => {
    'Authorization': 'Bearer $accessToken',
    if (profileId case final id? when id.isNotEmpty) 'X-Profile-Id': id,
    if (profileToken case final t? when t.isNotEmpty) 'X-Profile-Token': t,
  };
}

/// Whether [url] is on the Silo server's own origin ([baseUrl]), the only
/// place Moonfin sends the account's credentials. A proxy node's URL is
/// signed and gets none.
bool siloIsServerUrl(String url, String baseUrl) {
  final a = Uri.tryParse(url);
  final b = Uri.tryParse(baseUrl);
  if (a == null || b == null) return false;
  return a.scheme == b.scheme && a.host == b.host && a.port == b.port;
}

/// [url] with the account's token as `token=`, the media-element fallback
/// Silo accepts on its `/api/v2/stream/` routes (the original file, a
/// progressive remux, subtitle sidecars and their fonts) for a request that
/// can't carry headers: a subtitle fetched by the player itself, a cast
/// receiver. Nothing else gets one: HLS goes by headers (Silo copies a
/// manifest's query onto every segment), and artwork is signed on its own.
/// The rest of the query is kept byte for byte.
///
/// With [allMedia] (a player that sends no headers at all) Silo's HLS
/// routes (`/api/v2/playback/`) get it too: Silo copies the manifest's query
/// onto every playlist and segment URI, so the token reaches each request.
String siloAuthorizeUrl(
  String url,
  String baseUrl,
  String accessToken, {
  bool allMedia = false,
}) {
  if (accessToken.isEmpty || !siloIsServerUrl(url, baseUrl)) return url;
  final uri = Uri.parse(url);
  final media =
      uri.path.contains('/api/v2/stream/') ||
      (allMedia && uri.path.contains('/api/v2/playback/'));
  if (!media) return url;
  if (uri.queryParameters.containsKey('token')) return url;
  final token = 'token=${Uri.encodeQueryComponent(accessToken)}';
  final fragment = url.indexOf('#');
  final head = fragment < 0 ? url : url.substring(0, fragment);
  final tail = fragment < 0 ? '' : url.substring(fragment);
  return '$head${head.contains('?') ? '&' : '?'}$token$tail';
}

/// Silo's reasons for a plan that isn't the original, as Jellyfin's
/// transcode reasons, which Moonfin's playback info shows. Silo's own text
/// is informational. Only the ones that say why are
/// mapped, and unknown ones are left out.
List<String> siloTranscodeReasons(Map<String, dynamic> plan) {
  if (plan['delivery'] == 'original_http') return const [];
  final reasons = <String>[];
  void add(String? reason) {
    if (reason != null && !reasons.contains(reason)) reasons.add(reason);
  }

  add(_decisionReasons[plan['decision_reason']]);
  for (final warning in (plan['degradation_warnings'] as List?) ?? const []) {
    if (warning is Map) add(_warningReasons[warning['code']]);
  }
  return reasons;
}

const _decisionReasons = {
  'container_normalization': 'ContainerNotSupported',
  'hls_packaging_required': 'ContainerNotSupported',
  'audio_adaptation': 'AudioCodecNotSupported',
  'hls_audio_adaptation': 'AudioCodecNotSupported',
  'subtitle_burn_in_required': 'SubtitleCodecNotSupported',
  'client_dv7_to_dv81': 'VideoRangeTypeNotSupported',
  'client_dv7_to_hdr10': 'VideoRangeTypeNotSupported',
  'evidence_insufficient_for_direct': 'VideoCodecNotSupported',
  'quality_device_limit': 'VideoResolutionNotSupported',
  'quality_bandwidth_limit': 'ContainerBitrateExceedsLimit',
  'quality_bandwidth_cap': 'ContainerBitrateExceedsLimit',
  'quality_metered_limit': 'ContainerBitrateExceedsLimit',
  'quality_fixed_rung': 'ContainerBitrateExceedsLimit',
};

const _warningReasons = {
  'audio_converted': 'AudioCodecNotSupported',
  'hdr_tone_mapped': 'VideoRangeTypeNotSupported',
  'dolby_vision_removed': 'VideoRangeTypeNotSupported',
  'subtitle_burn_in': 'SubtitleCodecNotSupported',
  'bandwidth_cap_applied': 'ContainerBitrateExceedsLimit',
};

/// The parts of a plan Moonfin's stream description takes from it, around
/// the mapped [mediaSource] (the effective file) it plays.
///
/// - `streamUrl`: `stream.url` ([siloPlanUrl]), `container`:
///   `stream.container`.
/// - `playMethod` from `delivery` ([siloPlayMethod]).
/// - `mediaSourceId`: `effective_media_file_id` (Silo may play another
///   version than the one asked for), `playSessionId`: the session.
/// - `timelineOffset`: `timeline.timeline_offset_seconds`.
/// - `mediaStreams`: the file's streams, Moonfin's indices, with the audio
///   track Silo chose (`selected_tracks.audio.index`, an audio ordinal) back
///   as Moonfin's index through the track map.
/// - `sourceBitrate` from `source.bitrate_kbps`, and the video range from
///   the file's video stream, else the recipe's.
/// - `seeksThroughServer` when `timeline.can_seek_anywhere` is false (a
///   remux), and `reopenAfterPause` for a progressive remux.
/// - Subtitles from the plan's `subtitle` block ([siloPlanSubtitles]): its
///   sidecars as external subtitles, downloaded ones added to the streams,
///   and the selected track.
/// - With [auth], a stream on the server's origin carries the account's
///   headers on every request, `stream.headers` on top, and an
///   `/api/v2/stream/` URL also carries `token=` ([siloAuthorizeUrl]). With
///   [tokenInEveryUrl] (a player that sends no headers) the HLS URL carries
///   it too.
StreamResolutionResult siloPlanToResolution({
  required Map<String, dynamic> plan,
  required String sessionId,
  required String baseUrl,
  Map<String, dynamic>? mediaSource,
  bool directPlayRequested = true,
  SiloStreamAuth? auth,
  bool tokenInEveryUrl = false,
  int? requestedSubtitleStreamIndex,
}) {
  final stream = (plan['stream'] as Map?)?.cast<String, dynamic>() ?? const {};
  final timeline =
      (plan['timeline'] as Map?)?.cast<String, dynamic>() ?? const {};
  final source = (plan['source'] as Map?)?.cast<String, dynamic>() ?? const {};
  final recipe =
      (plan['effective_recipe'] as Map?)?.cast<String, dynamic>() ?? const {};
  final selected =
      (plan['selected_tracks'] as Map?)?.cast<String, dynamic>() ?? const {};
  final delivery = plan['delivery'] as String?;
  final playMethod = siloPlayMethod(delivery);

  final streams = [
    for (final s in (mediaSource?['MediaStreams'] as List?) ?? const [])
      if (s is Map) s.cast<String, dynamic>(),
  ];
  int? selectedAudio;
  final audio = selected['audio'];
  if (audio is Map && audio['index'] is int && mediaSource != null) {
    selectedAudio = siloStreamIndexForTrack(
      mediaSource,
      SiloTrackKind.audio,
      audio['index'] as int,
    );
  }
  final subtitles = siloPlanSubtitles(
    plan: plan,
    source: mediaSource,
    baseUrl: baseUrl,
    accessToken: auth?.accessToken,
    requestedStreamIndex: requestedSubtitleStreamIndex,
  );
  final offset = timeline['timeline_offset_seconds'];
  final bitrate = source['bitrate_kbps'];
  final planUrl = siloPlanUrl(baseUrl, '${stream['url'] ?? ''}');
  final onServer = siloIsServerUrl(planUrl, baseUrl);
  final url = auth == null
      ? planUrl
      : siloAuthorizeUrl(
          planUrl,
          baseUrl,
          auth.accessToken,
          allMedia: tokenInEveryUrl,
        );

  return StreamResolutionResult(
    streamUrl: url,
    mediaSourceId: '${plan['effective_media_file_id'] ?? mediaSource?['Id']}',
    playSessionId: sessionId,
    requestHeaders: {
      if (auth != null && onServer) ...auth.headers,
      for (final e in ((stream['headers'] as Map?) ?? const {}).entries)
        '${e.key}': '${e.value}',
    },
    playMethod: playMethod,
    container: stream['container'] as String? ?? source['container'] as String?,
    videoRangeType: _videoRangeType(streams, recipe),
    mediaType: MediaStreamResolver.detectMediaType(streams, fallbackUrl: url),
    normalizationGainDb: MediaStreamResolver.extractNormalizationGainDb(
      streams,
    ),
    mediaStreams: subtitles.mediaStreams,
    externalSubtitles: subtitles.externalSubtitles,
    selectedAudioStreamIndex: selectedAudio,
    selectedSubtitleStreamIndex: subtitles.selectedStreamIndex,
    transcodingReasons: siloTranscodeReasons(plan),
    serverOfferedDirectPlay: delivery == 'original_http',
    directPlayRequested: directPlayRequested,
    sourceBitrate: bitrate is num && bitrate > 0
        ? (bitrate * 1000).round()
        : null,
    timelineOffset: offset is num && offset > 0
        ? Duration(microseconds: (offset * 1000000).round())
        : Duration.zero,
    // A remux is produced as it plays, so every seek goes back to Silo.
    seeksThroughServer: timeline['can_seek_anywhere'] == false,
    // Silo closes a progressive remux that stops being read (a paused
    // player's buffer fills), as its web player allows for after a minute.
    reopenAfterPause: delivery == 'server_remux_progressive'
        ? siloProgressiveIdleWindow
        : null,
  );
}

String? _videoRangeType(
  List<Map<String, dynamic>> streams,
  Map<String, dynamic> recipe,
) {
  for (final s in streams) {
    if (s['Type'] != 'Video') continue;
    final type = s['VideoRangeType'];
    if (type is String && type.isNotEmpty) return type;
  }
  return switch (recipe['dynamic_range']) {
    'sdr' => 'SDR',
    'hdr10' => 'HDR10',
    'hdr10_plus' => 'HDR10Plus',
    'hlg' => 'HLG',
    'dolby_vision' => 'DOVI',
    _ => null,
  };
}
