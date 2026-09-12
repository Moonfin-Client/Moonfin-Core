import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../data/services/log_service.dart';

/// What the viewer should be told about a live channel right now.
///
/// The server never says whether the tuner is retrying or has given up, but
/// the two look different from the client: a request still in flight means
/// the tuner is still trying (it closes the connection only once its own
/// retries are spent), and any failure means it has already given up. Time
/// spent waiting separates a normal channel change from a tuner that is
/// struggling, and a stream that stops mid-play from one that is gone.
enum LiveTvStreamStatus {
  /// Nothing to show: no channel is being brought up.
  idle,

  /// A channel change just started; the usual few seconds of tuning.
  connecting,

  /// The server has held the request open long enough that the tuner is
  /// clearly retrying its upstream rather than just tuning.
  stillTrying,

  /// The channel is playing.
  playing,

  /// A short mid-play stall; only a spinner is warranted.
  buffering,

  /// Mid-play starvation long enough to mean the feed dropped and the tuner
  /// is reconnecting.
  reconnecting,

  /// Bringup failed before the channel ever played: the tuner could not get
  /// it.
  unavailable,

  /// The channel played and then died, or starved for so long the tuner is
  /// not coming back with it.
  lost,
}

extension LiveTvStreamStatusX on LiveTvStreamStatus {
  /// The two states that stop playback and want a Retry / Back choice.
  bool get isFailure =>
      this == LiveTvStreamStatus.unavailable || this == LiveTvStreamStatus.lost;
}

extension LiveTvBringupStateX on PlaybackBringupState {
  /// A bringup the tuner refused, which the status card already reports as
  /// "channel unavailable"; the screens skip their generic failure snackbar
  /// for it.
  bool get isLiveChannelUnavailable =>
      phase == PlaybackBringupPhase.failed &&
      error == liveChannelUnavailableError;
}

/// Pure state machine behind [LiveTvStreamStatus]. Fed bringup and buffering
/// changes with the time they happened, and asked for the status at a time.
/// No timers, no streams, so it can be tested with a fixed clock.
class LiveTvStreamStatusTracker {
  /// How long the clock must run cleanly, one small step after another with
  /// no jump, freeze or buffering report, before the channel counts as
  /// showing frames. A tuner feeding broken timestamps makes the player
  /// stall and leap to a new live edge every second, and between leaps the
  /// clock does creep forward; only an unbroken run tells that from video.
  static const playedAfter = Duration(seconds: 2);

  /// The longest the clock may go without a step before it has frozen.
  /// Every backend reports four times a second.
  static const advanceGap = Duration(seconds: 1);

  /// How long a fresh channel change shows as connecting even when the
  /// server refuses it at once. A Retry that fails in a few hundred
  /// milliseconds otherwise redraws the same card and looks like a press
  /// that did nothing.
  static const minimumConnecting = Duration(milliseconds: 1200);

  /// How long a bringup may run before the tuner is said to be retrying.
  /// A healthy channel change on a Jellyfin M3U or HDHomeRun tuner takes one
  /// to four seconds, the open plus the server's three-second probe.
  static const stillTryingAfter = Duration(seconds: 6);

  /// How long a stream that is open may sit without its clock starting
  /// before the tuner is said to be retrying. The tvOS engine reads the
  /// source, cuts it into segments and waits for the player to buffer a few
  /// of them before the first frame, several seconds on a healthy channel.
  /// Once the clock has started stepping the wait stops counting, so a
  /// channel that starts within this never shows the message even though
  /// it is only proven to play [playedAfter] later.
  static const stillTryingAfterReady = Duration(seconds: 8);

  /// How long a channel may go without ever playing before it is given up
  /// on. Covers the stream the server did open but the tuner dropped before
  /// any data arrived: the transcode dies quietly, the manifest never fills,
  /// and the player waits without ever raising an error. Past the tuner's
  /// retry budget, which is about ten seconds on Dispatcharr's defaults.
  static const startTimeout = Duration(seconds: 30);

  /// How long a mid-play stall may last before it is called a dropped feed.
  static const reconnectingAfter = Duration(seconds: 4);

  /// How long a mid-play stall may last before the channel is given up on.
  /// Well past the tuner's own retry budget, so a channel that recovers still
  /// plays and one that does not stops spinning.
  static const lostAfter = Duration(seconds: 45);

  bool _bringupInProgress = false;
  DateTime? _bringupStartedAt;
  DateTime? _readyAt;
  int? _sessionToken;
  bool _stopped = false;
  bool _everPlayed = false;
  bool _failed = false;
  bool _buffering = false;
  bool _playing = false;
  Duration? _lastPosition;
  DateTime? _lastAdvanceAt;
  DateTime? _cleanSince;
  DateTime? _troubleSince;
  String? _lastBreakKind;
  DateTime? _lastBreakAt;
  bool _clockBroke = false;
  bool _pictureShown = true;

  /// A single sample moving further than this is a jump to the live edge or
  /// a seek, not frames being shown.
  static const _maxAdvance = Duration(seconds: 5);

  void _resetPlayback() {
    _stopped = false;
    _readyAt = null;
    _everPlayed = false;
    _failed = false;
    _buffering = false;
    _playing = false;
    _lastPosition = null;
    _lastAdvanceAt = null;
    _cleanSince = null;
    _troubleSince = null;
    _lastBreakKind = null;
    _lastBreakAt = null;
    _clockBroke = false;
    _pictureShown = true;
  }

  /// Whether there is a picture to see, from the manager: false while a
  /// backend that can see its own picture reports none, or a black one.
  /// ExoPlayer runs its clock on audio alone, and a tuner's failover
  /// placeholder is a black video that decodes and renders like any
  /// channel, so on such a backend the clock only counts once there is a
  /// picture, and losing it is trouble like buffering is.
  void onPictureShown(bool shown, DateTime now) {
    if (shown == _pictureShown) return;
    _pictureShown = shown;
    if (!shown) _break(now, kind: 'picture black');
  }

  void onBringup(PlaybackBringupState state, DateTime now) {
    final token = state.sessionToken;
    if (state.phase.isInProgress) {
      final newSession =
          !_bringupInProgress ||
          (token != null && _sessionToken != null && token != _sessionToken);
      if (newSession) {
        _bringupInProgress = true;
        _bringupStartedAt = now;
        _resetPlayback();
      }
      if (token != null) _sessionToken = token;
      return;
    }
    _bringupInProgress = false;
    switch (state.phase) {
      case PlaybackBringupPhase.idle:
        // The player was stopped. What it had done stays on record, since
        // the manager stops a stream that ran out on its own before it says
        // so, and that word has to be able to turn this into lost rather
        // than unavailable. The next channel change starts clean.
        _stopped = true;
      case PlaybackBringupPhase.ready:
        _readyAt ??= now;
        _failed = false;
        if (token != null) _sessionToken = token;
      case PlaybackBringupPhase.failed:
        _failed = true;
      case PlaybackBringupPhase.preparing:
      case PlaybackBringupPhase.stoppingPrevious:
      case PlaybackBringupPhase.resolving:
      case PlaybackBringupPhase.opening:
      case PlaybackBringupPhase.waitingForReady:
      case PlaybackBringupPhase.seekingResume:
        break;
    }
  }

  /// The manager gave up on the channel by itself: the player reported the
  /// end of a stream that, being live, has no end. The tvOS engine serves
  /// what it still holds as a finished asset once the tuner stops feeding
  /// it, and the player runs that out and reports completion.
  void onEnded(DateTime now) {
    if (_bringupStartedAt == null && _readyAt == null) return;
    _bringupInProgress = false;
    _failed = true;
  }

  void onBuffering(bool buffering, DateTime now) {
    if (buffering == _buffering) return;
    _buffering = buffering;
    if (buffering) _break(now, kind: 'buffering');
  }

  /// Neither ready nor playing proves frames are moving. The tvOS player
  /// reports ready as soon as it is on screen, and playing as soon as its
  /// clock is told to run, both while still black. Playing only arms the
  /// clock check below. A pause is not trouble: the clock is meant to stand
  /// still, so the run simply starts over on resume. The last position is
  /// kept across the change, so a clock that leaps while the player flaps
  /// between buffering and playing is still seen to leap.
  void onPlaying(bool playing, DateTime now) {
    if (playing == _playing) return;
    _playing = playing;
    _lastAdvanceAt = null;
    _cleanSince = null;
  }

  /// The position is the one thing that only moves once frames are shown:
  /// every backend drives it from the decoder clock. A channel has played
  /// once the clock has stepped forward for [playedAfter] without a jump,
  /// a freeze or a buffering report in between, and it is in trouble again
  /// from the first break until the next such run.
  void onPosition(Duration position, DateTime now) {
    final last = _lastPosition;
    _lastPosition = position;
    if (_readyAt == null || !_playing || last == null) return;
    final moved = position - last;
    final lastAdvance = _lastAdvanceAt;
    _lastAdvanceAt = now;
    if (moved <= Duration.zero || moved > _maxAdvance) {
      _clockBroke = true;
      _break(now, kind: moved <= Duration.zero ? 'clock stood still' : 'jump');
      return;
    }
    if (lastAdvance != null && now.difference(lastAdvance) > advanceGap) {
      // The clock stood still until this step: a freeze that just ended.
      _clockBroke = true;
      _break(now, since: lastAdvance, kind: 'freeze');
    }
    // Steps over no picture prove nothing; the run starts with the picture.
    if (!_pictureShown) {
      _cleanSince = null;
      return;
    }
    final cleanSince = _cleanSince ??= now;
    if (now.difference(cleanSince) >= playedAfter) {
      _everPlayed = true;
      _troubleSince = null;
    }
  }

  /// Ends the current clean run and starts the trouble clock if it is not
  /// already running.
  void _break(DateTime now, {DateTime? since, required String kind}) {
    _cleanSince = null;
    _troubleSince ??= since ?? now;
    _lastBreakKind = kind;
    _lastBreakAt = now;
  }

  static String _seconds(Duration d) =>
      '${(d.inMilliseconds / 1000).toStringAsFixed(1)}s';

  /// One line of everything the verdict rests on, for the log when the
  /// status changes: it says why playing came late or never came.
  String describe(DateTime now) {
    String ago(DateTime? t) =>
        t == null ? 'never' : '${_seconds(now.difference(t))} ago';
    final clock = _lastPosition;
    final breakAt = _lastBreakAt;
    final startedAt = _bringupStartedAt;
    return [
      'bringup ${_bringupInProgress ? 'in progress' : 'done'}',
      'started ${ago(startedAt)}',
      'ready ${ago(_readyAt)}',
      'playing=$_playing',
      'buffering=$_buffering',
      'clock=${clock == null ? 'none' : _seconds(clock)}',
      'last step ${ago(_lastAdvanceAt)}',
      'clean since ${ago(_cleanSince)}',
      'played=$_everPlayed',
      'clock broke=$_clockBroke',
      'picture ${_pictureShown ? 'shown' : 'none'}',
      'trouble since ${ago(_troubleSince)}',
      if (_lastBreakKind == null)
        'last break: none'
      else if (breakAt != null && startedAt != null)
        'last break: $_lastBreakKind at +${_seconds(breakAt.difference(startedAt))}'
      else
        'last break: $_lastBreakKind',
    ].join(', ');
  }

  /// When the stream stopped looking healthy, or null while it does. A clock
  /// that has not stepped for [advanceGap] counts even though no event says
  /// so: a frozen player reports nothing at all.
  DateTime? _troubleStart(DateTime now) {
    final since = _troubleSince;
    if (since != null) return since;
    final last = _lastAdvanceAt;
    if (_playing && last != null && now.difference(last) > advanceGap) {
      return last;
    }
    return null;
  }

  LiveTvStreamStatus statusAt(DateTime now) {
    final startedAt = _bringupStartedAt;
    final sinceStart = startedAt == null
        ? Duration.zero
        : now.difference(startedAt);
    if (_failed) {
      if (_everPlayed) return LiveTvStreamStatus.lost;
      // An instant refusal still gets a moment of "connecting", so a Retry
      // press is seen to do something before the card comes back.
      if (startedAt != null && sinceStart < minimumConnecting) {
        return LiveTvStreamStatus.connecting;
      }
      return LiveTvStreamStatus.unavailable;
    }
    if (_stopped) {
      return LiveTvStreamStatus.idle;
    }
    if (_bringupInProgress) {
      return sinceStart >= stillTryingAfter
          ? LiveTvStreamStatus.stillTrying
          : LiveTvStreamStatus.connecting;
    }
    final readyAt = _readyAt;
    if (readyAt == null) {
      return LiveTvStreamStatus.idle;
    }
    // On screen but no frame yet: still part of the channel change, and a
    // change that never produces a frame is a channel the tuner lost.
    if (!_everPlayed) {
      if (sinceStart >= startTimeout) return LiveTvStreamStatus.unavailable;
      // A clock that is stepping is frames on their way to being proven, so
      // the wait stops where the stepping began. A clock that leaps starts
      // over each time and still runs the wait out; one that froze after a
      // few steps is not stepping any more.
      final cleanSince = _cleanSince;
      final stepping =
          cleanSince != null && now.difference(_lastAdvanceAt!) <= advanceGap;
      // A clock that steps and has never misbehaved is frames on screen,
      // and the viewer should not look at a spinner over them while the
      // run is proven. A clock that has jumped or frozen once has to earn
      // it: a tuner feeding broken timestamps creeps between leaps too.
      if (stepping && !_clockBroke) return LiveTvStreamStatus.playing;
      final waited = (stepping ? cleanSince : now).difference(readyAt);
      return waited >= stillTryingAfterReady
          ? LiveTvStreamStatus.stillTrying
          : LiveTvStreamStatus.connecting;
    }
    final trouble = _troubleStart(now);
    if (trouble == null) return LiveTvStreamStatus.playing;
    final stalled = now.difference(trouble);
    if (stalled >= lostAfter) return LiveTvStreamStatus.lost;
    if (stalled >= reconnectingAfter) return LiveTvStreamStatus.reconnecting;
    // A short break only earns a spinner while the player itself says it
    // is buffering; a brief clock hiccup over a moving picture shows nothing.
    return _buffering
        ? LiveTvStreamStatus.buffering
        : LiveTvStreamStatus.playing;
  }
}

/// Drives a [LiveTvStreamStatusTracker] from the playback manager and ticks
/// it once a second while time can change the answer, so the thresholds fire
/// without any event arriving.
class LiveTvStreamStatusMonitor extends ValueNotifier<LiveTvStreamStatus> {
  LiveTvStreamStatusMonitor(this._manager) : super(LiveTvStreamStatus.idle) {
    final now = DateTime.now();
    // A failure left over from whatever played before this screen is not
    // this channel's failure; only a bringup that is live or done counts.
    final initial = _manager.bringupState;
    if (initial.phase != PlaybackBringupPhase.failed) {
      _tracker.onBringup(initial, now);
      _tracker.onPictureShown(_manager.pictureShown, now);
      _tracker.onBuffering(_manager.state.isBuffering, now);
      _tracker.onPlaying(_manager.state.isPlaying, now);
      _tracker.onPosition(_manager.state.position, now);
    }
    _subs.addAll([
      _manager.bringupStateStream.listen(
        (state) => _feed((now) => _tracker.onBringup(state, now)),
      ),
      _manager.pictureShownStream.listen(
        (shown) => _feed((now) => _tracker.onPictureShown(shown, now)),
      ),
      _manager.state.bufferingStream.listen(
        (buffering) => _feed((now) => _tracker.onBuffering(buffering, now)),
      ),
      _manager.state.playingStream.listen(
        (playing) => _feed((now) => _tracker.onPlaying(playing, now)),
      ),
      _manager.state.positionStream.listen(
        (position) => _feed((now) => _tracker.onPosition(position, now)),
      ),
      _manager.sessionEndedStream.listen(
        (_) => _feed((now) => _tracker.onEnded(now)),
      ),
    ]);
    _refresh(now);
  }

  final PlaybackManager _manager;
  final _tracker = LiveTvStreamStatusTracker();
  final _subs = <StreamSubscription<Object?>>[];
  Timer? _ticker;

  void _feed(void Function(DateTime now) event) {
    final now = DateTime.now();
    event(now);
    _refresh(now);
  }

  void _refresh(DateTime now) {
    final status = _tracker.statusAt(now);
    final previous = value;
    value = status;
    if (status != previous) _log(previous, status, now);
    // Idle and the two failures only change on an event; everything else
    // has a threshold that time alone can cross.
    final needsClock = status != LiveTvStreamStatus.idle && !status.isFailure;
    if (needsClock) {
      _ticker ??= Timer.periodic(
        const Duration(seconds: 1),
        (_) => _refresh(DateTime.now()),
      );
    } else {
      _ticker?.cancel();
      _ticker = null;
    }
  }

  void _log(LiveTvStreamStatus from, LiveTvStreamStatus to, DateTime now) {
    final line =
        'Live TV status ${from.name} -> ${to.name}: ${_tracker.describe(now)}';
    assert(() {
      debugPrint(line);
      return true;
    }());
    if (GetIt.instance.isRegistered<LogService>()) {
      GetIt.instance<LogService>().playback(line, level: LogLevel.info);
    }
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    _ticker?.cancel();
    super.dispose();
  }
}
