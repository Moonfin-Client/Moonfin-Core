import 'dart:async';

import 'queue_service.dart';

class PlayerState {
  final _playingController = StreamController<bool>.broadcast();
  final _positionController = StreamController<Duration>.broadcast();
  final _durationController = StreamController<Duration>.broadcast();
  final _bufferController = StreamController<Duration>.broadcast();
  final _bufferingController = StreamController<bool>.broadcast();
  final _repeatModeController = StreamController<RepeatMode>.broadcast();
  final _shuffleController = StreamController<bool>.broadcast();

  bool _isPlaying = false;
  bool _isBuffering = false;
  bool? _playWhenReady;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  double _playbackSpeed = 1.0;
  RepeatMode _repeatMode = RepeatMode.none;
  bool _isShuffled = false;

  bool get isPlaying => _isPlaying;
  bool get isBuffering => _isBuffering;

  /// Whether the player has been told to play, independent of whether it
  /// currently can. Null on engines that do not report their own intent.
  ///
  /// [isPlaying] is a derived value -- media3 defines it as
  /// `playWhenReady && READY && no suppression` -- so it reads false for a
  /// viewer pause, a starved stream and a transient audio-focus loss alike.
  /// Anything that has to tell those apart wants this, not [isPlaying].
  bool? get playWhenReady => _playWhenReady;

  /// Whether the viewer paused. Falls back to "not playing" on an engine that
  /// reports no intent, which is what every caller used to assume.
  bool get isPaused => !(_playWhenReady ?? _isPlaying);
  Duration get position => _position;
  Duration get duration => _duration;
  Duration get buffer => _buffer;
  double get playbackSpeed => _playbackSpeed;
  RepeatMode get repeatMode => _repeatMode;
  bool get isShuffled => _isShuffled;

  Stream<bool> get playingStream => _playingController.stream;
  Stream<Duration> get positionStream => _positionController.stream;
  Stream<Duration> get durationStream => _durationController.stream;
  Stream<Duration> get bufferStream => _bufferController.stream;
  Stream<bool> get bufferingStream => _bufferingController.stream;
  Stream<RepeatMode> get repeatModeStream => _repeatModeController.stream;
  Stream<bool> get shuffleStream => _shuffleController.stream;

  void setPlaying(bool playing) {
    if (_isPlaying == playing) return;
    _isPlaying = playing;
    _playingController.add(playing);
  }

  void setPlayWhenReady(bool? playWhenReady) {
    _playWhenReady = playWhenReady;
  }

  void setBuffering(bool buffering) {
    if (_isBuffering == buffering) return;
    _isBuffering = buffering;
    _bufferingController.add(buffering);
  }

  void setPosition(Duration position) {
    if (_position == position) return;
    _position = position;
    _positionController.add(position);
  }

  void setDuration(Duration duration) {
    if (_duration == duration) return;
    _duration = duration;
    _durationController.add(duration);
  }

  void setBuffer(Duration buffer) {
    if (_buffer == buffer) return;
    _buffer = buffer;
    _bufferController.add(buffer);
  }

  void setPlaybackSpeed(double speed) {
    _playbackSpeed = speed;
  }

  void setRepeatMode(RepeatMode mode) {
    if (_repeatMode == mode) return;
    _repeatMode = mode;
    _repeatModeController.add(mode);
  }

  void setShuffled(bool shuffled) {
    if (_isShuffled == shuffled) return;
    _isShuffled = shuffled;
    _shuffleController.add(shuffled);
  }

  void reset() {
    _isPlaying = false;
    _isBuffering = false;
    _playWhenReady = null;
    _position = Duration.zero;
    _duration = Duration.zero;
    _buffer = Duration.zero;
    _playbackSpeed = 1.0;
    _playingController.add(false);
    _bufferingController.add(false);
    _positionController.add(Duration.zero);
    _durationController.add(Duration.zero);
    _bufferController.add(Duration.zero);
  }

  void dispose() {
    _playingController.close();
    _positionController.close();
    _durationController.close();
    _bufferController.close();
    _bufferingController.close();
    _repeatModeController.close();
    _shuffleController.close();
  }
}
