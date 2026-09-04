import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:playback_core/playback_core.dart';

import '../../data/services/log_service.dart';
import 'app_router.dart';
import 'destinations.dart';

typedef PlaybackStarter = Future<bool> Function(PlaybackLaunchSession? session);

Future<T> runPlaybackStart<T>(
  PlaybackLaunchSession? session,
  Future<T> Function() action,
) {
  return session == null ? action() : session.runIfActive(action);
}

/// Aborts a preparation whose launch is gone, the user backed out or another
/// launch took over. The session is the lifecycle a start belongs to, the
/// widget that happened to be tapped is not: on a phone the player forces
/// landscape as it opens, the covered screen rebuilds for the new orientation
/// and the tapped element is unmounted while the start it began is still
/// wanted. A null session is a start with no player route to lose, so there
/// is nothing to check.
void ensureLaunchStillWanted(PlaybackLaunchSession? session) {
  if (session != null && !session.isActive) {
    throw PlaybackStartupRecoveryAbortedException();
  }
}

PlaybackLaunchSession? _activeVideoLaunch;

/// Opens the appropriate player around [startPlayback]. Video routes paint
/// before the start callback runs; audio keeps its existing start-then-open
/// behavior because its compact player remains visible on the current page.
Future<bool> launchPlayerWhilePreparing(
  BuildContext context, {
  required PlaybackManager manager,
  required String destination,
  required PlaybackStarter startPlayback,
}) async {
  if (!context.mounted) return false;

  if (destination != Destinations.videoPlayer) {
    final started = await startPlayback(null);
    if (!started || !context.mounted) return false;
    await context.push(destination);
    return true;
  }

  if (_activeVideoLaunch != null) {
    // A location change (go/replace) removes the player route without
    // completing its push future, so a launch whose route is already gone can
    // hold the slot for the rest of the process and swallow every later play
    // press. A live launch always has its route on the stack; if it isn't,
    // the holder is dead — take over its slot.
    if (_videoPlayerRoutePresent()) {
      return false;
    }
    final stale = _activeVideoLaunch!;
    _activeVideoLaunch = null;
    stale._cancelled = true;
  }

  final session = PlaybackLaunchSession._();
  _activeVideoLaunch = session;

  Future<Object?> routeFuture;
  try {
    manager.beginPlaybackPreparation();
    // The queue still points at the previous item until preparation finishes.
    // Keep the temporary internal route from being redirected using stale data.
    manager.skipExternalRoutingOnce();
    routeFuture = context.push(Destinations.videoPlayer);
  } catch (_) {
    // Release the slot before touching the manager again. The cleanup below
    // goes through the same call that just threw, and a second throw here
    // would leave the slot claimed for the rest of the process.
    _activeVideoLaunch = null;
    manager.consumeSkipExternalRoutingOnce();
    manager.cancelPlaybackPreparation();
    rethrow;
  }

  unawaited(
    routeFuture.whenComplete(() {
      session._routeOpen = false;
      if (!session._startupFinished) {
        session._cancelled = true;
        manager.cancelPlaybackPreparation();
        // The slot is normally released in the finally below, but that only
        // runs once startPlayback settles. A start that hangs on an await
        // with no timeout never settles, and without this the slot survives
        // the user backing out and swallows every following play press. The
        // session is already cancelled here, so a hung pipeline that later
        // wakes throws at its next checkpoint rather than continuing.
        if (identical(_activeVideoLaunch, session)) {
          _activeVideoLaunch = null;
        }
      }
    }),
  );

  try {
    // Let the opaque black player and its loading treatment paint before any
    // item hydration, prompts, or source resolution continues.
    await WidgetsBinding.instance.endOfFrame;
    if (!session.isActive) return false;

    final started = await startPlayback(session);
    // A preparation that quietly gives up on the way to playItems still
    // reports success, and taking it at its word parks the player route on a
    // bringup that never leaves preparing. Nothing was asked to play, so the
    // phase is the ground truth.
    final startedNothing =
        started && manager.bringupState.phase == PlaybackBringupPhase.preparing;
    if (startedNothing) {
      GetIt.instance<LogService>().log(
        LogCategory.playback,
        'Bringup: start reported success without starting playback, '
        'closing the player',
        level: LogLevel.warning,
      );
    }
    if (!started || startedNothing || !session.isActive) {
      if (started && !startedNothing) {
        unawaited(manager.stop(userInitiated: true));
      }
      if (context.mounted) {
        _closePlayerRoute(context, session);
      }
      manager.cancelPlaybackPreparation();
      return false;
    }

    session._startupFinished = true;
    if (manager.playbackDeferredToExternalPlayer) {
      if (context.mounted) {
        _closePlayerRoute(context, session);
      }
      await routeFuture;
      if (!context.mounted) return false;
      routeFuture = context.push(Destinations.externalPlayer);
    }

    await routeFuture;
    return true;
  } on _PlaybackLaunchCanceledException {
    manager.cancelPlaybackPreparation();
    return false;
  } catch (_) {
    if (context.mounted) {
      _closePlayerRoute(context, session);
    }
    manager.cancelPlaybackPreparation();
    rethrow;
  } finally {
    session._cancelled = true;
    if (identical(_activeVideoLaunch, session)) {
      _activeVideoLaunch = null;
    }
  }
}

bool _videoPlayerRoutePresent() {
  try {
    bool present(List<RouteMatchBase> matches) {
      for (final match in matches) {
        if (match.matchedLocation == Destinations.videoPlayer) return true;
        if (match is ShellRouteMatch && present(match.matches)) return true;
      }
      return false;
    }

    return present(appRouter.routerDelegate.currentConfiguration.matches);
  } catch (_) {
    // Router not usable: treat the slot as held — never steal on uncertainty.
    return true;
  }
}

void _closePlayerRoute(BuildContext context, PlaybackLaunchSession session) {
  if (!context.mounted || !session._routeOpen) return;
  final sourceRoute = ModalRoute.of(context);
  if (sourceRoute != null && !sourceRoute.isCurrent) {
    Navigator.of(context).pop();
  }
}

class PlaybackLaunchSession {
  PlaybackLaunchSession._();

  bool _routeOpen = true;
  bool _startupFinished = false;
  bool _cancelled = false;

  bool get isActive =>
      identical(_activeVideoLaunch, this) && _routeOpen && !_cancelled;

  Future<T> runIfActive<T>(Future<T> Function() action) {
    if (!isActive) {
      throw const _PlaybackLaunchCanceledException();
    }
    return action();
  }
}

class _PlaybackLaunchCanceledException implements Exception {
  const _PlaybackLaunchCanceledException();
}
