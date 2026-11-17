import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show AppLifecycleListener;
import 'package:server_core/server_core.dart';

/// Whether the signed in user may use the server right now, and when they may
/// next.
class AccessScheduleStatus {
  const AccessScheduleStatus.allowed() : allowed = true, nextAccess = null;

  /// [nextAccess] is null when the schedule has no later opening to name.
  const AccessScheduleStatus.denied(this.nextAccess) : allowed = false;

  final bool allowed;
  final DateTime? nextAccess;

  @override
  bool operator ==(Object other) =>
      other is AccessScheduleStatus &&
      other.allowed == allowed &&
      other.nextAccess == nextAccess;

  @override
  int get hashCode => Object.hash(allowed, nextAccess);
}

/// Watches the access schedule of the signed in user and says when it closes.
///
/// Jellyfin turns a user away outside their schedule: sign in fails and nearly
/// every request fails with it. This keeps the schedule to hand, so the app can
/// say so and stop playback at the moment it closes instead of having things
/// start failing. Jellyfin checks the schedule against its own clock, which
/// can be in a different time zone from this device. With a Moonfin plugin
/// that answers it, the plugin works the schedule out on the server's clock
/// and says how long until it closes or opens, and that alone decides and
/// times the looks. Without one, for a user with a schedule the server is
/// asked whether it's turning them away and its answer decides, and the
/// schedule on this device's clock times the looks and says when they can
/// come back.
///
/// It looks again just before an opening or closing, when the app comes back
/// to the foreground and when the server turns a request away. In between it
/// looks every minute for a user with a schedule and every 15 minutes for one
/// without, so a change a parent makes on the server is picked up.
class AccessScheduleService extends ChangeNotifier {
  AccessScheduleService({
    required this.loadSchedules,
    required this.onBlocked,
    this.serverRefuses,
    this.loadAccessWindow,
    this.now = DateTime.now,
  });

  /// How long to wait between looks when no opening or closing is nearer. A
  /// parent can change the schedule at any time, and a user waiting for more
  /// time or about to lose it shouldn't find out much later.
  static const pollInterval = Duration(minutes: 1);

  /// How long to wait between looks for a user with no schedule. A schedule
  /// a parent adds that's already closed shows up sooner, through the
  /// requests the server turns away.
  static const idlePollInterval = Duration(minutes: 15);

  /// The least time between looks prompted by the server turning a request
  /// away, which can come in bursts.
  static const refusalInterval = Duration(seconds: 5);

  /// How long to wait before asking again after a look that failed.
  static const retryInterval = Duration(seconds: 15);

  /// Reads a user's schedule from the server, or null when it can't be read.
  final Future<List<AccessSchedule>?> Function(String userId) loadSchedules;

  /// Runs once each time the user is turned away, to stop what is playing.
  final Future<void> Function() onBlocked;

  /// Whether the server is turning the user away right now: true when it
  /// refuses, false when it answers, null when it can't tell. Without one the
  /// schedule is checked against this device's clock alone.
  final Future<bool?> Function()? serverRefuses;

  /// Reads the user's access window, judged on the server's clock: null when
  /// the server can't say, and throws when it couldn't be read. Without one,
  /// or once it says the server can't, the schedule is read and judged here.
  final Future<AccessWindow?> Function()? loadAccessWindow;

  final DateTime Function() now;

  AccessScheduleStatus _status = const AccessScheduleStatus.allowed();
  String? _userId;
  List<AccessSchedule> _schedules = const [];
  Timer? _timer;
  AppLifecycleListener? _lifecycle;

  /// Set when the server said it can't answer the access window, so this
  /// user's looks stop asking for it.
  bool _windowUnsupported = false;

  /// When the allowed window the plugin last reported closes, on this
  /// device's clock. A look with no answer from the server keeps the last
  /// decision, but not an allowed one past the close the plugin named for it.
  DateTime? _windowCloses;

  /// Bumped when the user changes, so a look that was under way for the
  /// previous one can't apply its answer to the next.
  int _generation = 0;

  /// Counts the looks, so one that is overtaken by a later look for the same
  /// user can't apply its older answer over the newer one.
  int _lookCount = 0;

  /// The newest look whose answer has been applied.
  int _appliedLook = 0;

  AccessScheduleStatus get status => _status;

  bool get isBlocked => !_status.allowed;

  /// Starts watching [userId], or stops watching for null. Pass null for
  /// anyone who isn't subject to a schedule, such as an administrator.
  void setUser(String? userId) {
    if (userId == _userId) return;
    _generation++;
    _userId = userId;
    _schedules = const [];
    _windowUnsupported = false;
    _windowCloses = null;
    _timer?.cancel();
    _timer = null;
    _setStatus(const AccessScheduleStatus.allowed());

    if (userId == null) {
      _lifecycle?.dispose();
      _lifecycle = null;
      return;
    }
    _lifecycle ??= AppLifecycleListener(onResume: () => unawaited(refresh()));
    unawaited(refresh());
  }

  DateTime? _lastRefusalLook;

  /// Tells the service the server turned a request away. That is what the
  /// user sees when a parent ends their hours while they are using the app,
  /// so the schedule is read at once instead of at the next poll.
  void noteRefused() {
    // While blocked every request is refused, the server check included, and
    // each refusal would start another look.
    if (_userId == null || isBlocked) return;
    final moment = now();
    final last = _lastRefusalLook;
    if (last != null && moment.difference(last) < refusalInterval) return;
    _lastRefusalLook = moment;
    unawaited(refresh());
  }

  /// Reads the schedule again and applies it.
  Future<void> refresh() async {
    final userId = _userId;
    if (userId == null) return;
    final generation = _generation;
    final look = ++_lookCount;

    var windowFailed = false;
    final loadWindow = loadAccessWindow;
    if (loadWindow != null && !_windowUnsupported) {
      // The plugin works its durations out between this moment and its answer,
      // so they're counted from here: a slow answer can't push a look past the
      // change it names.
      final asked = now();
      AccessWindow? window;
      var failed = false;
      try {
        window = await loadWindow();
      } catch (_) {
        failed = true;
      }
      if (generation != _generation) return;
      if (window != null) {
        if (look < _appliedLook) return;
        _appliedLook = look;
        _applyWindow(window, asked);
        return;
      }
      // A plugin that can't answer it won't start to during this session. Only
      // the newest look says so, as one overtaken by an answered look is stale.
      // A window that couldn't be read leaves the plugin asked again next time,
      // and the schedule and /Users/Me decide this look, so a failing endpoint
      // can't leave the user let in on a server that turns them away.
      if (!failed && look == _lookCount) _windowUnsupported = true;
      windowFailed = failed;
    }

    List<AccessSchedule>? fresh;
    try {
      fresh = await loadSchedules(userId);
    } catch (_) {
      fresh = null;
    }
    if (generation != _generation) return;

    if (fresh == null) {
      // A schedule that couldn't be read leaves the last one in place. A look
      // that was overtaken has nothing to say about the newer one's outcome.
      // While the plugin judges the schedule (its window was tried this look),
      // or after a block its window applied, which leaves no schedule here,
      // this device's clock doesn't get to judge the old one: the last
      // decision stays until a look gets an answer.
      if (look == _lookCount) {
        if (windowFailed || (isBlocked && _schedules.isEmpty)) {
          _keepLastAnswer();
        } else {
          _apply(failed: true);
        }
      }
      return;
    }
    // An answer is as good as the newest one applied, even if a later look
    // failed, but never replaces the answer of a look started after it.
    if (look < _appliedLook) return;
    // Only a schedule can close, so only then is the server asked.
    bool? refused;
    final ask = serverRefuses;
    if (fresh.isNotEmpty && ask != null) {
      try {
        refused = await ask();
      } catch (_) {}
      if (generation != _generation || look < _appliedLook) return;
    }
    // With a plugin that judges the schedule, this device's clock never
    // decides: when its window couldn't be read and the server gave no answer
    // either, the last answer stays and the look is tried again.
    if (windowFailed && fresh.isNotEmpty && refused == null) {
      if (look == _lookCount) _keepLastAnswer();
      return;
    }
    _appliedLook = look;
    _schedules = fresh;
    _windowCloses = null;
    _apply(failed: false, refused: refused);
  }

  void _apply({required bool failed, bool? refused}) {
    _timer?.cancel();
    final moment = now();
    final byClock = AccessScheduleEvaluator.isAllowed(_schedules, moment);
    final allowed = refused == null ? byClock : !refused;
    // The time to come back is worked out on this device's clock, so it's only
    // named when that clock agrees with the server.
    final next = allowed || byClock
        ? null
        : AccessScheduleEvaluator.nextAccessStart(_schedules, moment);

    final wasAllowed = _status.allowed;
    _setStatus(
      allowed
          ? const AccessScheduleStatus.allowed()
          : AccessScheduleStatus.denied(next),
    );
    if (wasAllowed && !allowed) {
      unawaited(_runOnBlocked());
    }

    var delay = failed
        ? retryInterval
        : _schedules.isEmpty
        ? idlePollInterval
        : pollInterval;
    final boundary = AccessScheduleEvaluator.nextBoundary(_schedules, moment);
    if (boundary != null) {
      final until = boundary.difference(moment);
      if (until < delay) delay = until;
    }
    _schedule(delay);
  }

  /// Applies the plugin's [window], worked out somewhere between [asked] and
  /// now. The next look counts from [asked], so it can only come early. The
  /// opening counts from halfway between, which is out by at most half the
  /// time the answer took, and the close it ends an allowed decision at counts
  /// from now, so it can't come early.
  void _applyWindow(AccessWindow window, DateTime asked) {
    _timer?.cancel();
    final answered = now();
    final halfway = asked.add(answered.difference(asked) ~/ 2);
    // A schedule read by an earlier fallback look is out of date now, and
    // would otherwise judge a later failed look on this device's clock.
    _schedules = const [];
    final until = window.allowed ? window.untilClose : window.untilOpen;
    // Named in this device's own time, as the moment it comes on this clock,
    // to the nearest minute: a schedule opens on a minute, and a device clock a
    // moment behind the server's would otherwise name the minute before.
    final next = window.allowed || window.untilOpen == null
        ? null
        : _nearestMinute(halfway.add(window.untilOpen!));
    _windowCloses = window.allowed && window.untilClose != null
        ? answered.add(window.untilClose!)
        : null;

    final wasAllowed = _status.allowed;
    _setStatus(
      window.allowed
          ? const AccessScheduleStatus.allowed()
          : AccessScheduleStatus.denied(next),
    );
    if (wasAllowed && !window.allowed) {
      unawaited(_runOnBlocked());
    }

    // Allowed with nothing to close is a user with no schedule, or one open
    // all week.
    var delay = window.allowed && window.untilClose == null
        ? idlePollInterval
        : pollInterval;
    if (until != null) {
      final remaining = until - now().difference(asked);
      if (remaining < delay) delay = remaining;
    }
    _schedule(delay);
  }

  static DateTime _nearestMinute(DateTime moment) {
    final rounded = moment.add(const Duration(seconds: 30));
    return rounded.subtract(
      Duration(
        seconds: rounded.second,
        milliseconds: rounded.millisecond,
        microseconds: rounded.microsecond,
      ),
    );
  }

  /// For a look with no answer from the server: the last decision stays and
  /// the look is tried again, but an allowed decision ends at the close the
  /// plugin reported for it, with no opening to name.
  void _keepLastAnswer() {
    _timer?.cancel();
    final moment = now();
    final closes = _windowCloses;
    if (closes != null && !moment.isBefore(closes)) {
      _windowCloses = null;
      if (_status.allowed) {
        _setStatus(const AccessScheduleStatus.denied(null));
        unawaited(_runOnBlocked());
      }
    }
    var delay = retryInterval;
    final left = _windowCloses?.difference(moment);
    if (left != null && left < delay) delay = left;
    _schedule(delay);
  }

  void _schedule(Duration delay) {
    if (delay < const Duration(seconds: 1)) delay = const Duration(seconds: 1);
    _timer = Timer(delay, () => unawaited(refresh()));
  }

  Future<void> _runOnBlocked() async {
    try {
      await onBlocked();
    } catch (_) {
      // Stopping playback is best effort. The screen still covers the app.
    }
  }

  void _setStatus(AccessScheduleStatus status) {
    if (status == _status) return;
    _status = status;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _lifecycle?.dispose();
    super.dispose();
  }
}
