import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_media_source_mapper.dart';
import '../silo_kept_reads.dart';
import '../silo_problem.dart';
import 'silo_items_api.dart';
import 'silo_unsupported.dart';

/// Moonfin's `PlaybackApi` on Silo: the detail screen's media info, and the
/// wire calls of Silo's playback protocol for `playback_silo`, which owns the
/// protocol itself.
class SiloPlaybackApi implements PlaybackApi {
  SiloPlaybackApi(this._items, this._dio, {DateTime Function()? clock})
    : _capabilities = SiloKeptReads(
        lifetime: capabilitiesLifetime,
        clock: clock,
      );

  final SiloItemsApi _items;
  final Dio _dio;

  /// How long [capabilities] reuses an answer, as Silo's web player does.
  static const capabilitiesLifetime = Duration(minutes: 1);

  final SiloKeptReads<String, SiloPlaybackCapabilities> _capabilities;

  /// `GET /api/v2/playback/capabilities`: whether this server plays, its
  /// installation id, its features and deliveries.
  ///
  /// Every playback mutation carries the
  /// [SiloPlaybackCapabilities.installationId] read here, so it is kept for
  /// [capabilitiesLifetime] and reads made meanwhile share one request.
  /// [refresh] reads it again now, which is what a `409 installation_changed`
  /// calls for ([isInstallationChanged]).
  Future<SiloPlaybackCapabilities> capabilities({bool refresh = false}) =>
      _capabilities.get('capabilities', _readCapabilities, refresh: refresh);

  Future<SiloPlaybackCapabilities> _readCapabilities() async {
    final response = await _dio.get<dynamic>('/api/v2/playback/capabilities');
    final json = asJsonMap(response.data);
    if (json == null) {
      throw FormatException(
        'Expected playback capabilities from Silo, got '
        '${response.data.runtimeType}',
      );
    }
    return SiloPlaybackCapabilities.fromJson(json);
  }

  /// Forgets the kept capabilities, so the next [capabilities] asks Silo.
  void forgetCapabilities() => _capabilities.forget();

  /// How long one start request may take: Silo may start a remux or a
  /// transcode before it answers (its web player allows 45 s too).
  static const startTimeout = Duration(seconds: 45);

  /// `POST /api/v2/playback/start` with [body] (`PlaybackStartBody`), once.
  /// Answers Silo's decision (`PlaybackDecision`): a plan, or a terminal
  /// refusal, both as `201`. The caller retries an interrupted start with
  /// the identical body ([isRetryableStartError]), and Silo replays the
  /// stored decision for a repeated `playback_attempt_id` and body.
  Future<Map<String, dynamic>> startPlayback(Map<String, dynamic> body) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/playback/start',
      data: body,
      options: Options(sendTimeout: startTimeout, receiveTimeout: startTimeout),
    );
    return _decision(response.data);
  }

  static Map<String, dynamic> _decision(Object? data) {
    final json = asJsonMap(data);
    if (json == null) {
      throw FormatException(
        'Expected a playback decision from Silo, got ${data.runtimeType}',
      );
    }
    return json;
  }

  /// Whether a failed start may be sent again unchanged: it never reached
  /// Silo or got no answer (a timeout, a dropped connection), or Silo asked
  /// for time (`408`, `429`, `5xx`). A refusal (any other `4xx`) is final.
  static bool isRetryableStartError(Object error) {
    if (error is! DioException) return false;
    final status = error.response?.statusCode;
    if (status == null) {
      return error.type != DioExceptionType.cancel &&
          error.type != DioExceptionType.badCertificate;
    }
    return status == 408 || status == 429 || status >= 500;
  }

  /// `POST /api/v2/playback/{sessionId}/progress` with [body]
  /// (`PlaybackProgressBody`: `installation_id`, `sequence`, `position`,
  /// `is_paused`). Answers the receipt (`PlaybackMutation`): `outcome`
  /// `applied`, `replayed` or `stale_sample`, and the latest `accepted`
  /// sample.
  Future<Map<String, dynamic>> reportProgress(
    String sessionId,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/playback/${Uri.encodeComponent(sessionId)}/progress',
      data: body,
    );
    return asJsonMap(response.data) ?? const {};
  }

  /// `DELETE /api/v2/playback/{sessionId}` with [body] (`PlaybackStopBody`:
  /// `installation_id`, a `stop_id` the client keeps for every retry, and
  /// the final sample's `sequence`, `position`, `is_paused`). The first stop
  /// wins, and every later one, with any stop id, replays its receipt
  /// (`outcome: replayed`), so a retry is always safe.
  Future<Map<String, dynamic>> stopPlayback(
    String sessionId,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.delete<dynamic>(
      '/api/v2/playback/${Uri.encodeComponent(sessionId)}',
      data: body,
    );
    return asJsonMap(response.data) ?? const {};
  }

  /// Whether a failed stop may be sent again: it got no answer, or Silo
  /// asked for time (`408`, `429`, `5xx`). The start's rule
  /// ([isRetryableStartError]).
  static bool isRetryableStopError(Object error) =>
      isRetryableStartError(error);

  /// `POST /api/v2/playback/{sessionId}/replan` with [body]
  /// (`PlaybackReplanBody`), once. Answers a decision like a start: a new
  /// plan for the same session, or a terminal. Silo is idempotent on
  /// `replan_request_id` and the body, so a retry of the same request
  /// ([isRetryableReplanError]) gets the same answer.
  Future<Map<String, dynamic>> replanPlayback(
    String sessionId,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/playback/${Uri.encodeComponent(sessionId)}/replan',
      data: body,
      options: Options(sendTimeout: startTimeout, receiveTimeout: startTimeout),
    );
    return _decision(response.data);
  }

  /// Whether a failed replan may be sent again unchanged: no answer, `408`,
  /// `429`, `5xx` (Silo's `503 replan_capacity_exhausted` among them, which
  /// it answers before touching the session), or `409 replan_in_progress`
  /// (the same request still holds the session's lease, and once it
  /// finishes, the same id replays its answer).
  static bool isRetryableReplanError(Object error) =>
      isRetryableStartError(error) ||
      (error is DioException &&
          error.response?.statusCode == 409 &&
          SiloProblem.codeOf(error) == 'replan_in_progress');

  /// Whether [error] says the session is over: `404` (it expired, was
  /// stopped, or the server restarted) or `410 playback_session_ended` (an
  /// administrator ended it). Reporting on it stops.
  static bool isSessionGone(Object error) {
    if (error is! DioException) return false;
    final status = error.response?.statusCode;
    return status == 404 || status == 410;
  }

  /// Whether [error] is `410 playback_session_ended`: an administrator
  /// ended the session, and the player must not start it again by itself.
  static bool isEndedByServer(Object error) =>
      error is DioException && error.response?.statusCode == 410;

  /// Whether [error] is `409 progress_conflict`: a sample with this
  /// sequence and different contents was already applied.
  static bool isProgressConflict(Object error) =>
      error is DioException &&
      error.response?.statusCode == 409 &&
      SiloProblem.codeOf(error) == 'progress_conflict';

  /// Whether [error] is Silo's `409 installation_changed`: the request
  /// carried the installation id of a server that has since been reset or
  /// replaced. The capabilities are read again and a new attempt started.
  static bool isInstallationChanged(Object error) =>
      error is DioException &&
      error.response?.statusCode == 409 &&
      SiloProblem.codeOf(error) == 'installation_changed';

  /// What the detail screen shows about how a version would play, **without
  /// starting playback**.
  ///
  /// Jellyfin's `PlaybackInfo` is a dry run, and Silo has none. Its only
  /// decision is `POST /playback/start`, which opens a session (and may start
  /// a transcode), so it must never be called to fill a detail page. The
  /// answer is built from the item's versions instead: its `MediaSources`,
  /// the one asked for (`MediaSourceId`) first.
  ///
  /// `SupportsDirectPlay` is an **estimate** from the device profile the
  /// detail screen sends: a version can play directly when a direct-play
  /// profile takes its container, video codec and the chosen audio track's
  /// codec. Otherwise it says why (`ContainerNotSupported`,
  /// `VideoCodecNotSupported`, `AudioCodecNotSupported`), as Jellyfin does.
  /// Silo makes the real decision when playback starts.
  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    final wanted = requestBody?['MediaSourceId'] as String?;
    final item = await _items.getItem(itemId);
    final sources = [
      for (final s in (item['MediaSources'] as List?) ?? const [])
        if (s is Map) Map<String, dynamic>.of(s.cast<String, dynamic>()),
    ];
    final at = wanted == null
        ? -1
        : sources.indexWhere((s) => s['Id'] == wanted);
    if (at > 0) sources.insert(0, sources.removeAt(at));

    final profile = requestBody?['DeviceProfile'];
    final audioIndex = requestBody?['AudioStreamIndex'];
    for (final source in sources) {
      source.remove(siloTracksKey);
      final reasons = profile is Map
          ? siloDirectPlayReasons(
              source,
              profile.cast<String, dynamic>(),
              audioStreamIndex: audioIndex is int ? audioIndex : null,
            )
          : const <String>[];
      source['SupportsDirectPlay'] = reasons.isEmpty;
      if (reasons.isNotEmpty) source['TranscodingReasons'] = reasons;
    }
    return {'MediaSources': sources, 'PlaySessionId': null};
  }

  /// Jellyfin's playback reporting and stream URLs: Silo's playback
  /// protocol is `playback_silo`'s, not this interface.
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      siloUnsupported('PlaybackApi', invocation);
}

/// Why [source] can't play directly under [deviceProfile]'s direct-play
/// profiles, as Jellyfin's transcode reasons. Empty when one profile takes
/// its container, video codec and the audio track [audioStreamIndex] (or
/// the default one).
List<String> siloDirectPlayReasons(
  Map<String, dynamic> source,
  Map<String, dynamic> deviceProfile, {
  int? audioStreamIndex,
}) {
  final profiles = [
    for (final p in (deviceProfile['DirectPlayProfiles'] as List?) ?? const [])
      if (p is Map && (p['Type'] ?? 'Video') == 'Video')
        p.cast<String, dynamic>(),
  ];
  final streams = [
    for (final s in (source['MediaStreams'] as List?) ?? const [])
      if (s is Map) s.cast<String, dynamic>(),
  ];
  final video = streams.where((s) => s['Type'] == 'Video').firstOrNull;
  final audioIndex = audioStreamIndex ?? source['DefaultAudioStreamIndex'];
  final audio =
      streams
          .where((s) => s['Type'] == 'Audio' && s['Index'] == audioIndex)
          .firstOrNull ??
      streams.where((s) => s['Type'] == 'Audio').firstOrNull;

  Set<String> list(Object? csv) => {
    if (csv is String)
      for (final v in csv.split(','))
        if (v.trim().isNotEmpty) v.trim().toLowerCase(),
  };
  bool takes(Object? csv, Object? value) {
    final allowed = list(csv);
    if (allowed.isEmpty) return true;
    if (value is! String) return false;
    final lower = value.toLowerCase();
    // A file's container can be named several ways (`mkv` vs `matroska`).
    return allowed.contains(lower) ||
        (lower == 'mkv' && allowed.contains('matroska')) ||
        (lower == 'matroska' && allowed.contains('mkv'));
  }

  if (profiles.isEmpty) return const ['ContainerNotSupported'];
  // The profile that comes closest names the reasons.
  List<String>? best;
  for (final p in profiles) {
    final reasons = [
      if (!takes(p['Container'], source['Container'])) 'ContainerNotSupported',
      if (video != null && !takes(p['VideoCodec'], video['Codec']))
        'VideoCodecNotSupported',
      if (audio != null && !takes(p['AudioCodec'], audio['Codec']))
        'AudioCodecNotSupported',
    ];
    if (reasons.isEmpty) return const [];
    if (best == null || reasons.length < best.length) best = reasons;
  }
  return best!;
}

/// Silo's answer to `GET /api/v2/playback/capabilities`.
class SiloPlaybackCapabilities {
  const SiloPlaybackCapabilities({
    required this.installationId,
    this.revision,
    this.state,
    this.allowed = false,
    this.protocolVersions = const [],
    this.features = const [],
    this.deliveries = const [],
  });

  factory SiloPlaybackCapabilities.fromJson(Map<String, dynamic> json) {
    List<T> list<T>(Object? value) => [
      if (value is List)
        for (final v in value)
          if (v is T) v,
    ];
    final id = json['installation_id'];
    final revision = json['revision'];
    final state = json['state'];
    return SiloPlaybackCapabilities(
      installationId: id is String ? id.trim() : '',
      revision: revision is String ? revision : null,
      state: state is String ? state : null,
      allowed: json['allowed'] == true,
      protocolVersions: list<int>(json['protocol_versions']),
      features: list<String>(json['features']),
      deliveries: list<String>(json['deliveries']),
    );
  }

  /// The server instance's UUID, which every playback mutation must carry.
  final String installationId;

  /// A digest of the rest, which changes when anything else here does.
  final String? revision;

  /// `available`, or `not_configured` on a server without playback.
  final String? state;
  final bool allowed;
  final List<int> protocolVersions;
  final List<String> features;

  /// The server's deliveries (`original_http`, `server_remux_progressive`,
  /// `server_remux_hls`, `server_transcode_hls` when it transcodes).
  final List<String> deliveries;

  /// Whether Moonfin can play from this server: playback is available and
  /// allowed, protocol v3 is offered, and there is an installation id.
  bool get playable =>
      state == 'available' &&
      allowed &&
      protocolVersions.contains(3) &&
      installationId.isNotEmpty;

  bool has(String feature) => features.contains(feature);
}
