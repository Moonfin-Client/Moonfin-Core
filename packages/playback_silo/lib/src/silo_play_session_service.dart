import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import 'silo_playback_sessions.dart';

/// Reports playback to Silo.
///
/// Silo opens the session when `playback/start` answers, so starting
/// reports nothing. Progress goes to `POST /api/v2/playback/{session}/progress`
/// as sequenced samples, and the stop is `DELETE /api/v2/playback/{session}`
/// with a stop id it keeps for every retry.
class SiloPlaySessionService implements PlayerService {
  SiloPlaySessionService(this._client, {Future<void> Function(Duration)? sleep})
    : _sleep = sleep ?? Future<void>.delayed;

  final MediaServerClient _client;

  /// Waits between stop retries. Tests pass one that returns at once.
  final Future<void> Function(Duration) _sleep;

  /// How long a stop is retried, as Silo's web player does.
  static const stopRetryBudget = Duration(seconds: 30);

  SiloPlaybackSessions get _sessions => SiloPlaybackSessions.of(_client);

  SiloMediaServerClient? get _silo {
    final client = _client;
    return client is SiloMediaServerClient ? client : null;
  }

  SiloPlaybackApi? get _api => _silo?.playbackApi;

  /// The session [resolution] is the current stream of, while it is live.
  /// A stream a replan has replaced reports nothing: its session goes on
  /// under the new one.
  SiloPlaybackSession? _live(StreamResolutionResult resolution) {
    final session = _sessions.sessionOf(resolution);
    if (session == null || session.ended) return null;
    final current = session.resolution;
    if (current != null && !identical(current, resolution)) return null;
    return session;
  }

  /// Nothing to send: the start opened the session.
  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {}

  /// One progress sample: the media position in seconds (the player's plus
  /// the stream's timeline offset, which the playback manager already
  /// reports), whether the viewer paused, and the session's next sequence.
  /// Silo keeps the resume point and the "still watching" clock from these:
  /// a session that hears nothing for 45 seconds (30 minutes while paused)
  /// is ended.
  ///
  /// - `applied`, `replayed`, `stale_sample`: nothing more to do (a stale
  ///   one was overtaken by a newer sample).
  /// - `409 progress_conflict`: Silo has another sample under this
  ///   sequence, so the sample goes once more under the next one.
  /// - `404`, `410 playback_session_ended`, `409 installation_changed`: the
  ///   session is over, and nothing more is reported on it.
  @override
  Future<void> onPlaybackProgress(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool isPaused = false,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? volumeLevel,
    bool? isMuted,
  }) async {
    final api = _api;
    final session = _live(resolution);
    if (api == null || session == null) return;
    Map<String, dynamic> sample() => {
      'installation_id': session.installationId,
      'sequence': session.takeSequence(),
      'position': siloSeconds(position),
      'is_paused': isPaused,
    };
    try {
      await api.reportProgress(session.sessionId, sample());
    } catch (error) {
      if (SiloPlaybackApi.isProgressConflict(error)) {
        try {
          await api.reportProgress(session.sessionId, sample());
          return;
        } catch (retryError) {
          if (!_ends(retryError, session)) rethrow;
          return;
        }
      }
      if (!_ends(error, session)) rethrow;
    }
  }

  /// Marks [session] over when [error] says so, and answers whether it did.
  bool _ends(Object error, SiloPlaybackSession session) {
    if (SiloPlaybackApi.isSessionGone(error) ||
        SiloPlaybackApi.isInstallationChanged(error)) {
      session.ended = true;
      return true;
    }
    return false;
  }

  /// Ends the session: `DELETE /api/v2/playback/{session}`
  /// with the session's `stop_id` and the final sample (the next sequence,
  /// the media position), so Silo stores the resume point and the history
  /// entry, and frees its remux or transcode at once instead of when the
  /// session expires.
  ///
  /// A stop that gets no answer, or a `408`, `429` or `5xx`, is sent again
  /// (the identical body, backing off 1, 2, 4, 8 s) for up to 30 s. Silo
  /// keeps the first stop and replays its receipt for any later one, so a
  /// retry after a lost answer is safe. `404` or `410` mean the session had
  /// already ended. Afterwards the session is forgotten, and once Silo has
  /// it, the client hears the item's user data changed
  /// ([SiloMediaServerClient.notePlaybackEnded]).
  ///
  /// A stream a replan replaced has nothing to stop (its session goes on),
  /// and a second stop for the session waits for the first.
  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) {
    final session = _sessions.sessionOf(resolution);
    if (session == null) return Future.value();
    final pending = session.stopping;
    if (pending != null) return pending;
    if (session.ended) {
      _sessions.remove(session.sessionId);
      return Future.value();
    }
    final current = session.resolution;
    if (current != null && !identical(current, resolution)) {
      return Future.value();
    }
    final api = _api;
    if (api == null) return Future.value();
    final stop = _stop(api, session, position);
    session.stopping = stop;
    return stop;
  }

  Future<void> _stop(
    SiloPlaybackApi api,
    SiloPlaybackSession session,
    Duration position,
  ) async {
    // A session that never reported (one dropped before it played, which
    // the manager stops at zero) sends no final sample: a zero would
    // overwrite the item's resume point.
    final sample = position > Duration.zero || session.lastSequence > 0;
    final body = {
      'installation_id': session.installationId,
      'stop_id': session.stopId,
      if (sample) ...{
        'sequence': session.takeSequence(),
        'position': siloSeconds(position),
        'is_paused': false,
      },
    };
    try {
      await siloSendWithRetries(
        () => api.stopPlayback(session.sessionId, body),
        budget: stopRetryBudget,
        retryable: SiloPlaybackApi.isRetryableStopError,
        sleep: _sleep,
      );
      _noteEnded(session);
    } catch (error) {
      // Gone means Silo had already ended it (it heard nothing for a while)
      // and kept the last sample it had.
      if (!SiloPlaybackApi.isSessionGone(error)) rethrow;
      _noteEnded(session);
    } finally {
      // Ended either way: a stop Silo never got lets the session expire.
      session.ended = true;
      _sessions.remove(session.sessionId);
    }
  }

  /// Tells the client [session]'s item changed. Silo's events socket is
  /// silent about a stopped session, so without this a season's list kept
  /// an episode just finished unwatched.
  void _noteEnded(SiloPlaybackSession session) =>
      _silo?.notePlaybackEnded(session.itemId);

  /// Silo has no live TV.
  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  /// The stop ends a remux or transcode too. This only makes sure one went
  /// out (the manager asks for both on a re-resolve).
  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {
    final session = _sessions.sessionOf(resolution);
    final pending = session?.stopping;
    if (pending != null) await pending;
  }

  @override
  void dispose() {}
}

/// [position] in Silo's seconds, to the millisecond, never negative.
double siloSeconds(Duration position) =>
    position.isNegative ? 0 : position.inMilliseconds / 1000;
