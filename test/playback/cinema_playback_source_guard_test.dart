import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/cinema_playback_source_guard.dart';
import 'package:playback_core/playback_core.dart';

PlaybackBringupState ready(String id, int token) => PlaybackBringupState(
  phase: PlaybackBringupPhase.ready,
  sessionToken: token,
  itemId: id,
);

void main() {
  test('new item ignores outgoing source even when item IDs match', () {
    final guard = CinemaPlaybackSourceGuard();
    final first = Object();
    final second = Object();
    expect(guard.enter(first, 0, initial: true), isTrue);
    expect(guard.enter(first, 0), isFalse);
    expect(
      guard.observeReady(item: first, index: 0, itemId: 'trailer', source: ready('trailer', 7)),
      isTrue,
    );
    expect(guard.enter(second, 1), isTrue);
    expect(
      guard.observeReady(item: second, index: 1, itemId: 'trailer', source: ready('trailer', 7)),
      isFalse,
    );
    expect(
      guard.observeReady(item: second, index: 1, itemId: 'trailer', source: ready('other', 8)),
      isFalse,
    );
    expect(
      guard.observeReady(item: second, index: 1, itemId: 'trailer', source: ready('trailer', 8)),
      isTrue,
    );
  });
}
