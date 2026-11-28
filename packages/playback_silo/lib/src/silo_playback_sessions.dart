import 'dart:async';
import 'dart:math';

import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

/// One Silo playback session as Moonfin plays it: what the start asked for,
/// the plan Silo is serving now, and what reporting on it needs.
///
/// Silo opens the session when `POST /playback/start` answers with a plan,
/// and every later call names it (`session_id`) and carries the
/// installation id of the capabilities it was started under.
class SiloPlaybackSession {
  SiloPlaybackSession({
    required this.sessionId,
    required this.attemptId,
    required this.installationId,
    required this.itemId,
    required this.plan,
    required this.startBody,
    this.mediaSource,
  });

  final String sessionId;

  /// The start's `playback_attempt_id`.
  final String attemptId;
  final String installationId;
  final String itemId;

  /// The start request, kept for what a replan resends (capabilities,
  /// context, features, quality).
  final Map<String, dynamic> startBody;

  /// The plan Silo serves now (`PlaybackPlan`).
  Map<String, dynamic> plan;

  /// The mapped `MediaSource` of the plan's effective file, with its track
  /// map, when Moonfin has it.
  Map<String, dynamic>? mediaSource;

  /// The stream Moonfin made of [plan]. A stop or progress report for an
  /// older one of this session isn't this session's latest.
  StreamResolutionResult? resolution;

  /// The last progress `sequence` used. Silo applies a sample only when its
  /// sequence is higher than the last one it applied, so each sample takes
  /// the next one.
  int lastSequence = 0;

  int takeSequence() => ++lastSequence;

  /// Over on Silo's side (stopped, expired, ended by an administrator, or
  /// under another installation): nothing more is reported on it.
  bool ended = false;

  /// The `stop_id` of this session's stop, minted once and sent on every
  /// retry.
  late final String stopId = siloNewUuid();

  /// The stop on its way, so a second stop (the manager also asks to end a
  /// transcode) waits for it instead of sending another.
  Future<void>? stopping;

  /// The client's id for the plan it is playing (`plan_attempt_id`), new
  /// for each plan it adopts.
  String planAttemptId = siloNewUuid();

  /// Every `plan_attempt_key` that failed on this device, Silo's loop
  /// guard for failure recovery: it won't hand one of them back.
  final List<String> attemptedPlanKeys = [];

  /// Failure recoveries so far (`attempt_count`, at most 8).
  int recoveries = 0;

  /// The viewer's bitrate ceiling for this session, in kbps
  /// (`bandwidth_cap_kbps`), sent on every replan so a seek keeps it. A
  /// quality change replaces it. Null for none.
  late int? bandwidthCapKbps = startBody['bandwidth_cap_kbps'] as int?;

  /// Whether the viewer picked a quality, which asks for a server stream
  /// until they go back to automatic. Every replan then leaves out the
  /// player's own profile 7 conversion, not only the quality change.
  bool manualQuality = false;
}

/// The Silo sessions of one client, by session id, shared by its resolver
/// and its session service (both built from the same client). Their starts
/// and ends go on [lifecycle], one stream for all clients, since one session
/// plays at a time.
class SiloPlaybackSessions {
  SiloPlaybackSessions._(this._client);

  static final _byClient = Expando<SiloPlaybackSessions>('siloSessions');

  static SiloPlaybackSessions of(MediaServerClient client) =>
      _byClient[client] ??= SiloPlaybackSessions._(client);

  final MediaServerClient _client;
  final _sessions = <String, SiloPlaybackSession>{};

  SiloPlaybackSession? operator [](String? sessionId) =>
      sessionId == null ? null : _sessions[sessionId];

  void add(SiloPlaybackSession session) =>
      _sessions[session.sessionId] = session;

  SiloPlaybackSession? remove(String sessionId) => _sessions.remove(sessionId);

  /// The session [resolution] belongs to, if Moonfin still has it.
  SiloPlaybackSession? sessionOf(StreamResolutionResult resolution) =>
      this[resolution.playSessionId];

  static final _lifecycle = StreamController<SiloPlaybackLifecycle>.broadcast();

  /// A Silo session starting to play and ending, on any client, for what
  /// follows the playing session (the app's playback control socket). Each
  /// change names the client the session is on, which may not be the
  /// signed-in server's. A replan of the same session reports it playing
  /// again.
  static Stream<SiloPlaybackLifecycle> get lifecycle => _lifecycle.stream;

  static SiloPlaybackLifecycle? _playingNow;

  /// The session that last started playing and hasn't ended, for a listener
  /// that starts while it plays.
  static SiloPlaybackLifecycle? get playingNow => _playingNow;

  void notePlaying(SiloPlaybackSession session) {
    final change = _change(session, playing: true);
    _playingNow = change;
    _lifecycle.add(change);
  }

  void noteEnded(SiloPlaybackSession session) {
    final change = _change(session, playing: false);
    if (_playingNow?.isSameSession(change) ?? false) _playingNow = null;
    _lifecycle.add(change);
  }

  SiloPlaybackLifecycle _change(
    SiloPlaybackSession session, {
    required bool playing,
  }) => SiloPlaybackLifecycle(
    client: _client,
    sessionId: session.sessionId,
    installationId: session.installationId,
    playing: playing,
  );
}

/// One change in [SiloPlaybackSessions.lifecycle].
class SiloPlaybackLifecycle {
  const SiloPlaybackLifecycle({
    required this.client,
    required this.sessionId,
    required this.installationId,
    required this.playing,
  });

  /// The client the session was started on.
  final MediaServerClient client;
  final String sessionId;
  final String installationId;

  /// True when the session started playing, false when it ended.
  final bool playing;

  /// Whether [other] is about the same session: session ids are only unique
  /// on one server.
  bool isSameSession(SiloPlaybackLifecycle other) =>
      identical(client, other.client) && sessionId == other.sessionId;
}

final _random = Random.secure();

/// A random version 4 UUID, for the ids Silo asks the client to mint
/// (`playback_attempt_id`, `stop_id`, `replan_request_id`).
String siloNewUuid() {
  final bytes = List<int>.generate(16, (_) => _random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  final hex = [for (final b in bytes) b.toRadixString(16).padLeft(2, '0')];
  return '${hex.sublist(0, 4).join()}-${hex.sublist(4, 6).join()}-'
      '${hex.sublist(6, 8).join()}-${hex.sublist(8, 10).join()}-'
      '${hex.sublist(10).join()}';
}

/// Calls [send] until it answers. While [retryable] says a failure is
/// transient, it is sent again after 1, 2, 4, then every 8 seconds, for at
/// most [budget], and the last failure is rethrown. Silo keys its playback
/// mutations on ids in the body, so sending the same one again is safe.
Future<T> siloSendWithRetries<T>(
  Future<T> Function() send, {
  required Duration budget,
  required bool Function(Object error) retryable,
  required Future<void> Function(Duration) sleep,
}) async {
  final deadline = DateTime.now().add(budget);
  var wait = const Duration(seconds: 1);
  while (true) {
    try {
      return await send();
    } catch (error) {
      if (!retryable(error) || deadline.difference(DateTime.now()) <= wait) {
        rethrow;
      }
      await sleep(wait);
      if (wait < const Duration(seconds: 8)) wait *= 2;
    }
  }
}
