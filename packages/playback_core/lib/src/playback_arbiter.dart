import 'dart:async';

enum AudioProducer { mainPlayback, mediaBarTrailer, inlinePreview, themeMusic }

enum RevokeReason { exclusive, background }

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
    for (final entry in _owners.entries.toList()) {
      if (entry.key == who) continue;
      if (ambient && entry.key == AudioProducer.mainPlayback) continue;
      await _revoke(entry.value, RevokeReason.exclusive);
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
