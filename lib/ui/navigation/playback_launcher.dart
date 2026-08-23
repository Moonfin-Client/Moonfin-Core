import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:playback_core/playback_core.dart';

import 'destinations.dart';

typedef PlaybackStarter = Future<bool> Function(PlaybackLaunchSession? session);

Future<T> runPlaybackStart<T>(
  PlaybackLaunchSession? session,
  Future<T> Function() action,
) {
  return session == null ? action() : session.runIfActive(action);
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

  if (_activeVideoLaunch != null) return false;

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
      }
    }),
  );

  try {
    // Let the opaque black player and its loading treatment paint before any
    // item hydration, prompts, or source resolution continues.
    await WidgetsBinding.instance.endOfFrame;
    if (!session.isActive) return false;

    final started = await startPlayback(session);
    if (!started || !session.isActive) {
      if (started) {
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
