import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/player_key_bindings.dart';

void main() {
  const bindings = PlayerKeyBindings.defaults;

  test('every action has at least one key and every listed key is unique', () {
    final seen = <String>{};
    for (final action in PlayerAction.values) {
      final keys = bindings.keysFor(action);
      expect(keys, isNotEmpty, reason: action.name);
      for (final binding in keys) {
        final id = '${binding.key.keyId}:${binding.shift}';
        expect(seen.add(id), isTrue, reason: '$id bound twice');
      }
    }
  });

  test('Shift picks the Shift binding and falls back to the plain one', () {
    expect(
      bindings.actionFor(LogicalKeyboardKey.keyI, shift: false),
      PlayerAction.playbackInfo,
    );
    expect(
      bindings.actionFor(LogicalKeyboardKey.keyI, shift: true),
      PlayerAction.mpvStats,
    );
    expect(
      bindings.actionFor(LogicalKeyboardKey.space, shift: true),
      PlayerAction.playPause,
    );
    expect(bindings.actionFor(LogicalKeyboardKey.keyZ, shift: false), isNull);
  });

  test('the well-known player keys keep their meaning', () {
    PlayerAction? of(LogicalKeyboardKey key) =>
        bindings.actionFor(key, shift: false);
    expect(of(LogicalKeyboardKey.keyK), PlayerAction.playPause);
    expect(of(LogicalKeyboardKey.keyJ), PlayerAction.seekBack);
    expect(of(LogicalKeyboardKey.keyL), PlayerAction.seekForward);
    expect(of(LogicalKeyboardKey.keyM), PlayerAction.mute);
    expect(of(LogicalKeyboardKey.keyC), PlayerAction.toggleSubtitles);
    expect(of(LogicalKeyboardKey.keyF), PlayerAction.toggleFullscreen);
    expect(of(LogicalKeyboardKey.keyH), PlayerAction.stop);
    expect(of(LogicalKeyboardKey.keyB), PlayerAction.recropBlackBars);
    expect(of(LogicalKeyboardKey.escape), PlayerAction.escape);
    expect(of(LogicalKeyboardKey.mediaStop), PlayerAction.stop);
    expect(of(LogicalKeyboardKey.mediaTrackNext), PlayerAction.next);
  });
}
