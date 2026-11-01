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
/// can be in a different time zone from this device, so for a user with a
/// schedule the server is asked whether it's turning them away and its answer
/// decides. The schedule times the looks and says when they can come back, on
/// the server's clock when the Moonfin plugin reports it and on this device's
/// otherwise. The plugin answers for the clock even once the time is up, so
/// it is read on every look and stays right across the server's daylight
/// saving changes while the user waits. A failed read keeps the last clock,
/// which is what an older plugin that turns the blocked user away gives.
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
    this.loadServerTime,
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

  /// The server's clock and time zone, null when the server can't say, which
  /// isn't asked again, and a failure when it couldn't be read, which keeps
  /// the last clock. Without one the schedule is read on this device's clock.
  final Future<ServerTime?> Function()? loadServerTime;

  /// This device's clock.
  final DateTime Function() now;

  AccessScheduleStatus _status = const AccessScheduleStatus.allowed();
  ServerClock? _serverClock;
  bool _timeUnsupported = false;
  String? _userId;
  List<AccessSchedule> _schedules = const [];
  Timer? _timer;
  AppLifecycleListener? _lifecycle;

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

  /// The current time on the clock the schedule is judged by: the server's
  /// wall clock when it is known, so it reads like [AccessScheduleStatus.nextAccess]
  /// does, and this device's otherwise.
  DateTime get scheduleNow => _serverClock?.wallClock(now()) ?? now();

  /// Starts watching [userId], or stops watching for null. Pass null for
  /// anyone who isn't subject to a schedule, such as an administrator.
  void setUser(String? userId) {
    if (userId == _userId) return;
    _generation++;
    _userId = userId;
    _schedules = const [];
    _serverClock = null;
    _timeUnsupported = false;
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
      if (look == _lookCount) _apply(failed: true);
      return;
    }
    // An answer is as good as the newest one applied, even if a later look
    // failed, but never replaces the answer of a look started after it.
    if (look < _appliedLook) return;
    // Only a schedule can close, so only then is the server asked whether it
    // turns the user away and what its clock says. The two are asked together
    // so a slow clock can't hold up a denial the server has already given.
    // The clock isn't asked of a server that has said it can't tell.
    bool? refused;
    var clock = _serverClock;
    var unsupported = _timeUnsupported;
    final ask = serverRefuses;
    final askTime = loadServerTime;
    if (fresh.isNotEmpty) {
      Future<void> readRefusal() async {
        if (ask == null) return;
        try {
          refused = await ask();
        } catch (_) {}
      }

      Future<void> readClock() async {
        if (askTime == null || unsupported) return;
        try {
          final time = await askTime();
          if (time == null) {
            unsupported = true;
            clock = null;
          } else {
            clock = ServerClock.from(time, now());
          }
        } catch (_) {
          // Keeps the last clock.
        }
      }

      final clockRead = readClock();
      await readRefusal();
      if (generation != _generation || look < _appliedLook) return;
      // A refusal is applied as soon as it's known, on the last clock, so
      // playback stops without waiting on the clock. The clock's answer then
      // corrects the opening named.
      if (refused == true) {
        _appliedLook = look;
        _schedules = fresh;
        _apply(failed: false, refused: true);
      }
      await clockRead;
      if (generation != _generation || look < _appliedLook) return;
    }
    _appliedLook = look;
    _schedules = fresh;
    _serverClock = clock;
    _timeUnsupported = unsupported;
    _apply(failed: false, refused: refused);
  }

  void _apply({required bool failed, bool? refused}) {
    _timer?.cancel();
    final moment = scheduleNow;
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
