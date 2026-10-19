import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../auth/repositories/user_repository.dart';
import '../../data/services/access_schedule_service.dart';
import '../../l10n/app_localizations.dart';
import '../../util/focus/dpad_keys.dart';
import '../navigation/app_router.dart';
import '../navigation/destinations.dart';

/// Covers the whole app while the signed in user's access schedule doesn't
/// allow the current time, and nothing at all otherwise.
///
/// The session stays signed in underneath. The server turns the user away for
/// the length of the closed window anyway, and this goes away by itself when it
/// opens again, so a child who comes back doesn't have to sign in again. The
/// way out for anyone else on the device is Switch User, which opens the user
/// picker without signing anyone out, so a saved profile stays on it. The
/// screen steps aside while the picker is showing and comes back if the same
/// user is picked again.
class TimesUpGate extends StatelessWidget {
  const TimesUpGate({
    super.key,
    this.service,
    this.onSwitchUser,
    this.now = DateTime.now,
    this.currentPath,
    this.routeChanges,
  });

  /// The service to watch, for a test. Defaults to the app's own.
  final AccessScheduleService? service;

  /// What Switch User does, for a test. Defaults to opening the user picker.
  final Future<void> Function()? onSwitchUser;

  /// The clock "today" and "tomorrow" are read against, for a test.
  final DateTime Function() now;

  /// The page the app is on and what tells this it changed, for a test.
  /// Default to the app's router.
  final String Function()? currentPath;
  final Listenable? routeChanges;

  /// Whether the screen is up, which is also when the back button has to leave
  /// the app alone. Not while the user picker is showing, where the schedule is
  /// closed but nobody is in the app to turn away.
  static bool isShowing({
    AccessScheduleService? service,
    String Function()? currentPath,
  }) {
    final watched = service ?? GetIt.instance<AccessScheduleService>();
    final path = (currentPath ?? _routerPath)();
    return watched.isBlocked && !Destinations.isSignedOutRoute(path);
  }

  static String _routerPath() =>
      appRouter.routerDelegate.currentConfiguration.uri.path;

  @override
  Widget build(BuildContext context) {
    final watched = service ?? GetIt.instance<AccessScheduleService>();
    return ListenableBuilder(
      listenable: Listenable.merge([
        watched,
        routeChanges ?? appRouter.routerDelegate,
      ]),
      builder: (context, _) {
        if (!isShowing(service: watched, currentPath: currentPath)) {
          return const SizedBox.shrink();
        }
        return _TimesUp(
          nextAccess: watched.status.nextAccess,
          now: now,
          onSwitchUser: onSwitchUser ?? _openUserPicker,
        );
      },
    );
  }

  static Future<void> _openUserPicker() async {
    final user = GetIt.instance<UserRepository>().currentUser;
    appRouter.go(
      user == null
          ? Destinations.serverSelect
          : '${Destinations.server}?serverId=${Uri.encodeComponent(user.serverId)}',
    );
  }
}

/// Keeps the app under [TimesUpGate] from holding or taking the focus while the
/// screen is up.
///
/// Playback stops and the app goes home the moment the schedule closes, and the
/// home screen asks for focus when it appears, after the screen has taken it.
/// Asking once can't win that, so everything underneath is taken out of the
/// focus tree for as long as the screen shows. Without it the remote's select
/// key goes to the screen under the overlay and the button does nothing.
class TimesUpFocusGuard extends StatelessWidget {
  const TimesUpFocusGuard({
    super.key,
    required this.child,
    this.service,
    this.currentPath,
    this.routeChanges,
  });

  final Widget child;

  /// The same stand-ins [TimesUpGate] takes, for a test.
  final AccessScheduleService? service;
  final String Function()? currentPath;
  final Listenable? routeChanges;

  @override
  Widget build(BuildContext context) {
    final watched = service ?? GetIt.instance<AccessScheduleService>();
    return ListenableBuilder(
      listenable: Listenable.merge([
        watched,
        routeChanges ?? appRouter.routerDelegate,
      ]),
      builder: (context, child) => ExcludeFocus(
        excluding: TimesUpGate.isShowing(
          service: watched,
          currentPath: currentPath,
        ),
        child: child!,
      ),
      child: child,
    );
  }
}

class _TimesUp extends StatefulWidget {
  const _TimesUp({
    required this.nextAccess,
    required this.now,
    required this.onSwitchUser,
  });

  final DateTime? nextAccess;
  final DateTime Function() now;
  final Future<void> Function() onSwitchUser;

  @override
  State<_TimesUp> createState() => _TimesUpState();
}

class _TimesUpState extends State<_TimesUp> {
  final _button = FocusNode(debugLabel: 'Time\'s up Switch User');
  Timer? _midnight;

  @override
  void initState() {
    super.initState();
    _scheduleMidnight();
    // With the app underneath out of the focus tree (TimesUpFocusGuard) nothing
    // else can hold the focus, so the remote's select key reaches this button.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _button.requestFocus();
    });
  }

  /// "Tomorrow" turns into "today" at midnight with nothing else changing, so
  /// the screen is drawn again then. It can stay up all night.
  void _scheduleMidnight() {
    final moment = widget.now();
    final next = DateTime(moment.year, moment.month, moment.day + 1);
    _midnight = Timer(next.difference(moment), () {
      if (!mounted) return;
      setState(() {});
      _scheduleMidnight();
    });
  }

  @override
  void dispose() {
    _midnight?.cancel();
    _button.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final resumes = timesUpResumeMessage(
      l10n: l10n,
      nextAccess: widget.nextAccess,
      now: widget.now(),
      use24Hour: MediaQuery.alwaysUse24HourFormatOf(context),
    );
    final text = Theme.of(context).textTheme;

    // The only thing to focus here is the button, so the arrow keys have
    // nowhere to go. Left to the app, Up takes the focus off it and select then
    // does nothing, so they are used up here.
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (node, event) => event.logicalKey.isDirectional
          ? KeyEventResult.handled
          : KeyEventResult.ignored,
      child: Material(
        color: AppColorScheme.background,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 72,
                    color: AppColorScheme.accent,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.timesUpTitle,
                    textAlign: TextAlign.center,
                    style: text.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.timesUpMessage,
                    textAlign: TextAlign.center,
                    style: text.bodyLarge?.copyWith(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                  if (resumes != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      resumes,
                      textAlign: TextAlign.center,
                      style: text.bodyMedium?.copyWith(
                        color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                  const SizedBox(height: 32),
                  FilledButton(
                    focusNode: _button,
                    onPressed: widget.onSwitchUser,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColorScheme.accent,
                      minimumSize: const Size(200, 52),
                    ),
                    child: Text(l10n.switchUser),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// When the user may come back, as a sentence, or null when the schedule has no
/// later opening to name. A time later today reads "today at", one tomorrow
/// "tomorrow at", one within the week names the weekday, and anything further
/// names the date.
@visibleForTesting
String? timesUpResumeMessage({
  required AppLocalizations l10n,
  required DateTime? nextAccess,
  required DateTime now,
  required bool use24Hour,
}) {
  if (nextAccess == null) return null;
  final locale = l10n.localeName;
  final time = (use24Hour ? DateFormat.Hm(locale) : DateFormat.jm(locale))
      .format(nextAccess);

  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(nextAccess.year, nextAccess.month, nextAccess.day);
  final daysAway = day.difference(today).inDays;
  if (daysAway <= 0) return l10n.timesUpResumesToday(time);
  if (daysAway == 1) return l10n.timesUpResumesTomorrow(time);
  // A weekday name alone is only clear within the coming week. A week out it
  // is the weekday of today, so it names the date as well.
  final when = daysAway < 7
      ? DateFormat.EEEE(locale).format(nextAccess)
      : DateFormat.MMMMEEEEd(locale).format(nextAccess);
  return l10n.timesUpResumesOn(when, time);
}
