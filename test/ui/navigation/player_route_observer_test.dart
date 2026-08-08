import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/ui/navigation/app_router.dart';

// Guards the contract the Android TV surface fix depends on: the fullscreen
// player routes (built via pageBuilder, whose page name PlayerRouteObserver
// matches) must flip isPlayerActive so the media bar keeps its Media3 preview
// unmounted while a player is on screen.
Route<dynamic> _route(String? name) =>
    PageRouteBuilder<void>(
      settings: RouteSettings(name: name),
      pageBuilder: (_, a, b) => const SizedBox.shrink(),
    );

// Real dialogs (showDialog) push a non-opaque PopupRoute -- unlike _route(),
// which builds an opaque PageRouteBuilder even when unnamed.
Route<dynamic> _popupRoute(String? name) => PageRouteBuilder<void>(
  settings: RouteSettings(name: name),
  opaque: false,
  pageBuilder: (_, a, b) => const SizedBox.shrink(),
);

void main() {
  test('player routes flip isPlayerActive; others do not', () {
    final observer = PlayerRouteObserver();
    expect(observer.isPlayerActive.value, isFalse);

    final video = _route('/player/video');
    observer.didPush(video, null);
    expect(observer.isPlayerActive.value, isTrue);

    observer.didPop(video, null);
    expect(observer.isPlayerActive.value, isFalse);

    final game = _route('/game-player/lib1/game1');
    observer.didPush(game, null);
    expect(observer.isPlayerActive.value, isTrue);
    observer.didPop(game, null);
    expect(observer.isPlayerActive.value, isFalse);
  });

  test('non-player and unnamed routes leave isPlayerActive false', () {
    final observer = PlayerRouteObserver();

    observer.didPush(_route('/home'), null);
    expect(observer.isPlayerActive.value, isFalse);

    observer.didPush(_route(null), null);
    expect(observer.isPlayerActive.value, isFalse);
  });

  test('nested player routes stay active until the last pops', () {
    final observer = PlayerRouteObserver();
    final audio = _route('/player/audio');
    final video = _route('/player/video');

    observer.didPush(audio, null);
    observer.didPush(video, null);
    expect(observer.isPlayerActive.value, isTrue);

    observer.didPop(video, null);
    expect(observer.isPlayerActive.value, isTrue);

    observer.didPop(audio, null);
    expect(observer.isPlayerActive.value, isFalse);
  });

  test('artwork coverage follows only the effective top route', () {
    final gate = RetroArtworkActivityGate();
    final observer = RetroArtworkRouteObserver(activityGate: gate);
    final games = _route('/games/library/system/nes');
    final dialog = _route(null);
    final player = _route('/game-player/library/game');

    observer.didPush(games, null);
    expect(gate.isRouteCovered, isFalse);
    expect(gate.isOpen, isTrue);

    final detail = _route('/game/library/game');
    observer.didPush(detail, games);
    expect(gate.isRouteCovered, isFalse);
    observer.didPop(detail, games);
    expect(gate.isRouteCovered, isFalse);

    final permit = gate.tryAcquire(RetroArtworkActivityKind.transfer)!;
    observer.didPush(dialog, games);
    expect(gate.isRouteCovered, isTrue);
    expect(permit.signal.isCancelled, isTrue);

    // A hidden screen using the legacy/default owner cannot clear the
    // observer's authoritative top-route coverage.
    gate.setRouteCovered(false);
    expect(gate.isRouteCovered, isTrue);

    observer.didPop(dialog, games);
    expect(gate.isRouteCovered, isFalse);
    expect(gate.isOpen, isTrue);

    gate.setGameplayActive(true);
    observer.didPush(player, games);
    expect(gate.isRouteCovered, isTrue);
    expect(gate.isGameplayActive, isTrue);

    observer.didPop(player, games);
    expect(gate.isRouteCovered, isFalse);
    expect(gate.isOpen, isFalse);

    gate.setGameplayActive(false);
    expect(gate.isOpen, isTrue);
  });

  test(
    'a dialog opened over a game route does not cover the artwork gate',
    () {
      final gate = RetroArtworkActivityGate();
      final observer = RetroArtworkRouteObserver(activityGate: gate);
      final detail = _route('/game/library/game');

      observer.didPush(detail, null);
      expect(gate.isRouteCovered, isFalse);

      // "Choose player" is a showDialog -- a non-opaque route -- not a real
      // navigation away from the detail screen.
      final picker = _popupRoute(null);
      observer.didPush(picker, detail);
      expect(gate.isRouteCovered, isFalse);
      expect(gate.isOpen, isTrue);

      observer.didPop(picker, detail);
      expect(gate.isRouteCovered, isFalse);
    },
  );
}
