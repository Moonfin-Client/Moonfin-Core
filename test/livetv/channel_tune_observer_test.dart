import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/channel_tune_observer.dart';
import 'package:playback_core/playback_core.dart';

PlaybackBringupState _state(
  PlaybackBringupPhase phase, {
  required int token,
  String itemId = 'target',
}) => PlaybackBringupState(phase: phase, sessionToken: token, itemId: itemId);

void main() {
  test('returns the terminal state for the started session', () async {
    final states = StreamController<PlaybackBringupState>.broadcast();
    addTearDown(states.close);

    final result = observeChannelTune(
      channelId: 'target',
      states: states.stream,
      timeout: const Duration(seconds: 1),
      start: () async {
        states.add(_state(PlaybackBringupPhase.preparing, token: 4));
        states.add(_state(PlaybackBringupPhase.ready, token: 4));
      },
    );

    expect((await result)?.phase, PlaybackBringupPhase.ready);
  });

  test('ignores a stale terminal event from another session', () async {
    final states = StreamController<PlaybackBringupState>.broadcast();
    addTearDown(states.close);

    final result = observeChannelTune(
      channelId: 'target',
      states: states.stream,
      timeout: const Duration(seconds: 1),
      start: () async {
        states.add(_state(PlaybackBringupPhase.ready, token: 3));
        states.add(_state(PlaybackBringupPhase.preparing, token: 4));
        states.add(_state(PlaybackBringupPhase.failed, token: 4));
      },
    );

    expect((await result)?.phase, PlaybackBringupPhase.failed);
  });

  test(
    'follows a same-channel startup fallback to its newer session',
    () async {
      final states = StreamController<PlaybackBringupState>.broadcast();
      addTearDown(states.close);

      final result = observeChannelTune(
        channelId: 'target',
        states: states.stream,
        timeout: const Duration(seconds: 1),
        start: () async {
          states.add(_state(PlaybackBringupPhase.resolving, token: 4));
          states.add(_state(PlaybackBringupPhase.resolving, token: 5));
          states.add(_state(PlaybackBringupPhase.ready, token: 4));
          states.add(_state(PlaybackBringupPhase.ready, token: 5));
        },
      );

      expect((await result)?.sessionToken, 5);
    },
  );

  test('timeout bounds a start operation that never completes', () async {
    final states = StreamController<PlaybackBringupState>.broadcast();
    addTearDown(states.close);
    final never = Completer<void>();

    final result = await observeChannelTune(
      channelId: 'target',
      states: states.stream,
      timeout: const Duration(milliseconds: 10),
      start: () => never.future,
    );

    expect(result, isNull);
  });
}
