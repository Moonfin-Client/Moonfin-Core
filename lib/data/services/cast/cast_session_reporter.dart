import 'dart:async';

import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../models/aggregated_item.dart';

/// What the cast receiver is doing, as the cast service last heard it.
typedef CastReceiverState = ({
  /// Whether a cast session is still on.
  bool active,

  /// The item the cast service shows as playing.
  String? itemId,

  /// `playing`, `paused`, `buffering`, `idle`, or null before it said.
  String? state,

  /// The receiver's position in its stream, in ticks.
  int positionTicks,
});

/// Reports a cast's playback to its server session.
///
/// A Silo session lives on progress reports: one that hears nothing for 45
/// seconds is ended, and its stream stops being served. The playback manager
/// reports when the phone plays, but nothing reports for a receiver. So for
/// a cast whose stream came from a server session, [begin] starts reporting
/// what the receiver does, every [interval], through the server's own
/// session service ([PlayerService]): the receiver's position (plus the
/// stream's timeline offset) and whether it's paused. The session is stopped
/// (with the last position, which Silo keeps as the resume point) when the
/// cast ends, moves to another item, or the receiver goes idle after playing.
///
/// Jellyfin and Emby casts aren't reported because their streams don't
/// depend on it.
class CastSessionReporter {
  CastSessionReporter({
    required this.read,
    this.interval = const Duration(seconds: 10),
  });

  /// The receiver's state, as the cast service last heard it.
  final CastReceiverState Function() read;
  final Duration interval;

  _Reporting? _current;

  /// Starts reporting [resolution] of [item] through [service]. A cast
  /// already reported is stopped first.
  ///
  /// [currentResolution] gives the stream the receiver plays now, for a
  /// provider that replaces it in the same session (a seek the receiver
  /// can't do itself), and [replacing] whether it's doing so: the receiver
  /// going idle meanwhile is the new stream loading, not the cast ending.
  /// [positionsOnMediaTimeline] says the receiver's positions already
  /// include the stream's timeline offset.
  Future<void> begin({
    required PlayerService service,
    required AggregatedItem item,
    required StreamResolutionResult resolution,
    StreamResolutionResult Function()? currentResolution,
    bool Function()? replacing,
    bool positionsOnMediaTimeline = false,
  }) async {
    await end();
    final reporting = _Reporting(
      service,
      item,
      resolution,
      currentResolution,
      replacing,
      positionsOnMediaTimeline,
    );
    _current = reporting;
    reporting.timer = Timer.periodic(interval, (_) => unawaited(tick()));
  }

  /// One report: progress, or the stop when the cast is over.
  Future<void> tick() async {
    final reporting = _current;
    if (reporting == null || reporting.busy) return;
    reporting.follow();
    final receiver = read();
    final over =
        !receiver.active ||
        (receiver.itemId != null && receiver.itemId != reporting.item.id) ||
        (receiver.state == 'idle' &&
            reporting.played &&
            !(reporting.replacing?.call() ?? false));
    if (over) {
      await end();
      return;
    }
    if (receiver.state == 'playing') reporting.played = true;
    // Before the receiver says anything (still loading) the session is kept
    // alive at the start position.
    if (receiver.state != null) {
      reporting.position = _mediaPosition(reporting, receiver.positionTicks);
    }
    reporting.busy = true;
    try {
      await reporting.service.onPlaybackProgress(
        reporting.item,
        reporting.resolution,
        reporting.position,
        isPaused: receiver.state == 'paused',
      );
    } catch (_) {
      // A missed sample is retried on the next tick.
    } finally {
      reporting.busy = false;
    }
  }

  /// Stops the reported session, at the last position heard.
  Future<void> end() async {
    final reporting = _current;
    if (reporting == null) return;
    _current = null;
    reporting.timer?.cancel();
    reporting.follow();
    try {
      await reporting.service.onPlaybackStop(
        reporting.item,
        reporting.resolution,
        reporting.position,
      );
    } catch (_) {}
  }

  /// Whether a cast is being reported (tests).
  bool get reporting => _current != null;

  static Duration _mediaPosition(_Reporting r, int ticks) {
    final position = Duration(microseconds: ticks ~/ 10);
    return r.positionsOnMediaTimeline
        ? position
        : position + r.resolution.timelineOffset;
  }
}

class _Reporting {
  _Reporting(
    this.service,
    this.item,
    this.resolution,
    this.currentResolution,
    this.replacing,
    this.positionsOnMediaTimeline,
  ) : position = resolution.timelineOffset;

  final PlayerService service;
  final AggregatedItem item;
  StreamResolutionResult resolution;
  final StreamResolutionResult Function()? currentResolution;
  final bool Function()? replacing;
  final bool positionsOnMediaTimeline;
  Timer? timer;
  Duration position;
  bool played = false;
  bool busy = false;

  /// Takes the stream the receiver plays now. One the server starts at the
  /// seek point puts the position there until the receiver reports on it.
  void follow() {
    final current = currentResolution?.call();
    if (current == null || identical(current, resolution)) return;
    resolution = current;
    if (current.seeksThroughServer) position = current.timelineOffset;
  }
}

/// A cast's stream and the server session it plays under, as a cast
/// provider resolved it.
class CastServerPlayback {
  const CastServerPlayback({
    required this.service,
    required this.item,
    required this.resolution,
    this.currentResolution,
    this.replacing,
    this.positionsOnMediaTimeline = false,
  });

  final PlayerService service;
  final AggregatedItem item;
  final StreamResolutionResult resolution;

  /// The stream the receiver plays now, when the provider can replace it.
  final StreamResolutionResult Function()? currentResolution;

  /// Whether the provider is replacing the receiver's stream.
  final bool Function()? replacing;

  /// Whether the receiver's positions already include the timeline offset.
  final bool positionsOnMediaTimeline;
}

/// A cast provider whose last cast may need [CastSessionReporter]. The cast
/// service takes it after each cast it starts.
abstract interface class CastServerPlaybackSource {
  /// The last cast's server playback, once, or null when it needs no reports.
  CastServerPlayback? takeServerPlayback();
}

/// Whether a cast of a [client] stream needs [CastSessionReporter]: Silo's
/// sessions do.
bool castNeedsSessionReports(MediaServerClient client) =>
    client.serverType == ServerType.silo;
