import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

/// Holds the sound for a running game. Both game screens mix this in, so the
/// claim and the rule for giving it up live in one place rather than once per
/// backend. The screen supplies [pauseForAudioClaim] to stop its own emulation.
mixin GameAudioOwner<T extends StatefulWidget> on State<T>
    implements AudioOwnable {
  final PlaybackArbiter _audioArbiter = GetIt.instance<PlaybackArbiter>();

  /// Stops the game because something else took the sound.
  Future<void> pauseForAudioClaim();

  /// Takes the sound for the game, which stops any ambient audio. Called from
  /// initState, so the claim waits for the frame to end because a producer
  /// losing the sound rebuilds itself.
  void claimGameAudio() {
    _audioArbiter.register(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(_audioArbiter.acquire(AudioProducer.game));
    });
  }

  void releaseGameAudio() => _audioArbiter.unregister(this);

  @override
  AudioProducer get audioProducerId => AudioProducer.game;

  @override
  Future<void> onAudioRevoked(RevokeReason reason) async {
    // Backgrounding already pauses the game on each platform, so only something
    // claiming the sound outright has to stop it here.
    if (reason == RevokeReason.background) return;
    await pauseForAudioClaim();
  }
}
