import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../playback/media3_player_backend.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/adaptive/sf_symbol.dart';

/// Minimal transport controls for the Media3 trailer path. The media_kit
/// controls can't drive the native backend, so this stays self-contained.
class TrailerMedia3Controls extends StatefulWidget {
  final Media3PlayerBackend backend;
  final VoidCallback onExit;

  const TrailerMedia3Controls({
    super.key,
    required this.backend,
    required this.onExit,
  });

  @override
  State<TrailerMedia3Controls> createState() => _TrailerMedia3ControlsState();
}

class _TrailerMedia3ControlsState extends State<TrailerMedia3Controls> {
  static const _hideDelay = Duration(seconds: 3);
  static const _seekStep = Duration(seconds: 10);

  late bool _playing = widget.backend.isPlaying;
  late bool _buffering = widget.backend.isBuffering;
  late Duration _position = widget.backend.position;
  late Duration _duration = widget.backend.duration;
  bool _visible = true;
  bool _dragging = false;
  double? _dragValue;
  Timer? _hideTimer;
  StreamSubscription<bool>? _playingSub;
  StreamSubscription<bool>? _bufferingSub;
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration>? _durationSub;

  @override
  void initState() {
    super.initState();
    _playingSub = widget.backend.playingStream.listen((value) {
      if (mounted) setState(() => _playing = value);
    });
    _bufferingSub = widget.backend.bufferingStream.listen((value) {
      if (mounted) setState(() => _buffering = value);
    });
    _positionSub = widget.backend.positionStream.listen((value) {
      if (mounted && !_dragging) setState(() => _position = value);
    });
    _durationSub = widget.backend.durationStream.listen((value) {
      if (mounted) setState(() => _duration = value);
    });
    _restartHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _playingSub?.cancel();
    _bufferingSub?.cancel();
    _positionSub?.cancel();
    _durationSub?.cancel();
    super.dispose();
  }

  void _restartHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(_hideDelay, () {
      if (mounted && !_dragging) setState(() => _visible = false);
    });
  }

  void _reveal() {
    if (!_visible) setState(() => _visible = true);
    _restartHideTimer();
  }

  void _togglePlayPause() {
    if (_playing) {
      unawaited(widget.backend.pause());
    } else {
      unawaited(widget.backend.resume());
    }
    _reveal();
  }

  void _seekRelative(Duration delta) {
    final duration = _duration;
    var target = _position + delta;
    if (target < Duration.zero) target = Duration.zero;
    if (duration > Duration.zero && target > duration) target = duration;
    setState(() => _position = target);
    unawaited(widget.backend.seekTo(target));
    _reveal();
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    // Seeks also run on key repeat so a held key keeps scrubbing.
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
      case LogicalKeyboardKey.mediaRewind:
        _seekRelative(-_seekStep);
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowRight:
      case LogicalKeyboardKey.mediaFastForward:
        _seekRelative(_seekStep);
        return KeyEventResult.handled;
    }

    if (event is KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    switch (event.logicalKey) {
      case LogicalKeyboardKey.select:
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
      case LogicalKeyboardKey.mediaPlayPause:
        _togglePlayPause();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaPlay:
        unawaited(widget.backend.resume());
        _reveal();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaPause:
        unawaited(widget.backend.pause());
        _reveal();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowUp:
      case LogicalKeyboardKey.arrowDown:
        _reveal();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaStop:
        widget.onExit();
        return KeyEventResult.handled;
      default:
        // Back and escape fall through so the route pops normally.
        return KeyEventResult.ignored;
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    return hours > 0 ? '$hours:$mm:$ss' : '$minutes:$ss';
  }

  @override
  Widget build(BuildContext context) {
    final durationMs = _duration.inMilliseconds;
    final sliderMax = durationMs > 0 ? durationMs.toDouble() : 1.0;
    final sliderValue =
        (_dragValue ?? _position.inMilliseconds.toDouble()).clamp(
          0.0,
          sliderMax,
        );

    final bar = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black87],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
      child: Row(
        children: [
          IconButton(
            icon: AdaptiveIcon(
              _playing ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: _togglePlayPause,
          ),
          const SizedBox(width: 8),
          Text(
            _formatDuration(_position),
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Slider(
              value: sliderValue,
              max: sliderMax,
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              onChangeStart: durationMs > 0
                  ? (_) {
                      _dragging = true;
                      _hideTimer?.cancel();
                    }
                  : null,
              onChanged: durationMs > 0
                  ? (value) => setState(() => _dragValue = value)
                  : null,
              onChangeEnd: durationMs > 0
                  ? (value) {
                      _dragging = false;
                      _dragValue = null;
                      final target = Duration(milliseconds: value.round());
                      setState(() => _position = target);
                      unawaited(widget.backend.seekTo(target));
                      _restartHideTimer();
                    }
                  : null,
            ),
          ),
          Text(
            _formatDuration(_duration),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );

    return Focus(
      autofocus: true,
      onKeyEvent: _onKeyEvent,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _reveal,
        child: Stack(
          children: [
            if (_buffering)
              const Center(
                child: CircularProgressIndicator(color: Colors.white70),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: IgnorePointer(
                  ignoring: !_visible,
                  // The D-pad drives seeking through the key handler above, so
                  // the bar never takes focus away from it on TV.
                  child: PlatformDetection.isTV
                      ? ExcludeFocus(child: bar)
                      : bar,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
