import 'dart:async';

enum AudioProducer {
  mainPlayback,
  game,
  mediaBarTrailer,
  inlinePreview,
  themeMusic,
}

/// Why an owner is losing audio. An ambient handoff is one ambient source
/// giving way to another, where a soft transition like a crossfade is fine.
/// An exclusive revoke means main playback or a game needs the session now,
/// and the acquire is awaited on the playback start path, so owners should
/// release immediately rather than fade.
enum RevokeReason { exclusive, ambientHandoff, background }

abstract class AudioOwnable {
  AudioProducer get audioProducerId;
  Future<void> onAudioRevoked(RevokeReason reason);
}

class PlaybackArbiter {
  final Map<AudioProducer, AudioOwnable> _owners = {};
  bool pipActive = false;

  void register(AudioOwnable owner) {
    _owners[owner.audioProducerId] = owner;
  }

  void unregister(AudioOwnable owner) {
    if (_owners[owner.audioProducerId] == owner) {
      _owners.remove(owner.audioProducerId);
    }
  }

  Future<void> acquire(AudioProducer who) async {
    final ambient = _isAmbient(who);
    final reason = ambient
        ? RevokeReason.ambientHandoff
        : RevokeReason.exclusive;
    for (final entry in _owners.entries.toList()) {
      if (entry.key == who) continue;
      // Ambient sound never interrupts what the user is watching or playing.
      if (ambient && !_isAmbient(entry.key)) continue;
      await _revoke(entry.value, reason);
    }
  }

  Future<void> pauseForBackground() async {
    for (final owner in _owners.values.toList()) {
      await _revoke(owner, RevokeReason.background);
    }
  }

  Future<void> _revoke(AudioOwnable owner, RevokeReason reason) async {
    try {
      await owner.onAudioRevoked(reason);
    } catch (_) {}
  }

  static bool _isAmbient(AudioProducer p) =>
      p == AudioProducer.mediaBarTrailer ||
      p == AudioProducer.inlinePreview ||
      p == AudioProducer.themeMusic;
}
