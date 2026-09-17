import 'package:flutter/services.dart';

/// Something the video player can do from a key press. The desktop and
/// mobile key handler switches on this rather than on a raw key, so those
/// keys live in one table ([PlayerKeyBindings]) that the shortcut list reads
/// as well. The TV remote path still matches keys directly, and the list is
/// not shown there.
enum PlayerAction {
  playPause,
  play,
  pause,
  stop,
  next,
  previous,

  /// Seek that grows while the key is held.
  seekBack,
  seekForward,

  /// Seek by the configured skip length, no growth on hold.
  skipBack,
  skipForward,
  volumeUp,
  volumeDown,
  mute,
  toggleSubtitles,
  slowDown,
  speedUp,
  playbackInfo,
  mpvStats,
  toggleFullscreen,

  /// Leave fullscreen where there is one to leave, otherwise stop.
  escape,

  /// Show the controls, or play/pause while they are showing.
  showControlsOrPlayPause,

  /// Run letterbox crop detection now.
  recropBlackBars,
}

/// One key, optionally with Shift.
class KeyBinding {
  const KeyBinding(this.key, {this.shift = false});

  final LogicalKeyboardKey key;
  final bool shift;
}

/// Action to keys. [defaults] is the only table today. A user-editable set
/// can replace it later without touching the handler or the shortcut list,
/// which both go through [actionFor] and [keysFor].
class PlayerKeyBindings {
  const PlayerKeyBindings(this._bindings);

  final Map<PlayerAction, List<KeyBinding>> _bindings;

  static const defaults = PlayerKeyBindings({
    PlayerAction.playPause: [
      KeyBinding(LogicalKeyboardKey.space),
      KeyBinding(LogicalKeyboardKey.keyK),
      KeyBinding(LogicalKeyboardKey.mediaPlayPause),
    ],
    PlayerAction.play: [KeyBinding(LogicalKeyboardKey.mediaPlay)],
    PlayerAction.pause: [KeyBinding(LogicalKeyboardKey.mediaPause)],
    PlayerAction.stop: [
      KeyBinding(LogicalKeyboardKey.keyH),
      KeyBinding(LogicalKeyboardKey.mediaStop),
    ],
    PlayerAction.next: [KeyBinding(LogicalKeyboardKey.mediaTrackNext)],
    PlayerAction.previous: [KeyBinding(LogicalKeyboardKey.mediaTrackPrevious)],
    PlayerAction.seekBack: [
      KeyBinding(LogicalKeyboardKey.arrowLeft),
      KeyBinding(LogicalKeyboardKey.keyJ),
    ],
    PlayerAction.seekForward: [
      KeyBinding(LogicalKeyboardKey.arrowRight),
      KeyBinding(LogicalKeyboardKey.keyL),
    ],
    PlayerAction.skipBack: [KeyBinding(LogicalKeyboardKey.mediaRewind)],
    PlayerAction.skipForward: [KeyBinding(LogicalKeyboardKey.mediaFastForward)],
    PlayerAction.volumeUp: [KeyBinding(LogicalKeyboardKey.arrowUp)],
    PlayerAction.volumeDown: [KeyBinding(LogicalKeyboardKey.arrowDown)],
    PlayerAction.mute: [KeyBinding(LogicalKeyboardKey.keyM)],
    PlayerAction.toggleSubtitles: [KeyBinding(LogicalKeyboardKey.keyC)],
    PlayerAction.slowDown: [KeyBinding(LogicalKeyboardKey.comma)],
    PlayerAction.speedUp: [KeyBinding(LogicalKeyboardKey.period)],
    PlayerAction.playbackInfo: [KeyBinding(LogicalKeyboardKey.keyI)],
    // Same key as in mpv itself.
    PlayerAction.mpvStats: [KeyBinding(LogicalKeyboardKey.keyI, shift: true)],
    PlayerAction.toggleFullscreen: [KeyBinding(LogicalKeyboardKey.keyF)],
    PlayerAction.escape: [KeyBinding(LogicalKeyboardKey.escape)],
    PlayerAction.showControlsOrPlayPause: [
      KeyBinding(LogicalKeyboardKey.enter),
      KeyBinding(LogicalKeyboardKey.select),
    ],
    PlayerAction.recropBlackBars: [KeyBinding(LogicalKeyboardKey.keyB)],
  });

  List<KeyBinding> keysFor(PlayerAction action) =>
      _bindings[action] ?? const [];

  /// The action bound to [key], or null. With Shift held a Shift binding
  /// wins. Without one the plain binding for the key still applies, so
  /// Shift+Space pauses like Space does.
  PlayerAction? actionFor(LogicalKeyboardKey key, {required bool shift}) {
    PlayerAction? plain;
    for (final entry in _bindings.entries) {
      for (final binding in entry.value) {
        if (binding.key != key) continue;
        if (binding.shift) {
          if (shift) return entry.key;
        } else {
          plain ??= entry.key;
        }
      }
    }
    return plain;
  }
}
