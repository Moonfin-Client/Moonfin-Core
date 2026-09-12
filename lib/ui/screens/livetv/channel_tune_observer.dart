import 'dart:async';

import 'package:playback_core/playback_core.dart';

/// Starts one channel tune and waits for that attempt's terminal bring-up
/// state. A terminal event is accepted only after an in-progress event exposes
/// the attempt's session token, so late events from an older tune are ignored.
Future<PlaybackBringupState?> observeChannelTune({
  required String channelId,
  required Stream<PlaybackBringupState> states,
  required Future<void> Function() start,
  required Duration timeout,
}) async {
  final terminal = Completer<PlaybackBringupState>();
  int? sessionToken;
  final subscription = states.listen((state) {
    if (state.itemId != channelId) return;
    final token = state.sessionToken;
    if (state.phase.isInProgress && token != null) {
      if (sessionToken == null || token > sessionToken!) {
        sessionToken = token;
      }
      return;
    }
    if (sessionToken == null || token != sessionToken) return;
    if ((state.phase == PlaybackBringupPhase.ready ||
            state.phase == PlaybackBringupPhase.failed) &&
        !terminal.isCompleted) {
      terminal.complete(state);
    }
  });

  PlaybackBringupState? result;
  try {
    await Future.wait<void>([
      start(),
      terminal.future.then<void>((state) => result = state),
    ], eagerError: true).timeout(timeout);
  } catch (_) {
    return null;
  } finally {
    await subscription.cancel();
  }
  return result;
}
