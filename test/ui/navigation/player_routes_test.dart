import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/navigation/destinations.dart';

void main() {
  group('a player route', () {
    test('covers every fullscreen playback screen', () {
      for (final path in [
        Destinations.videoPlayer,
        Destinations.externalPlayer,
        Destinations.audioPlayer,
        Destinations.liveTvPlayer,
        Destinations.trailerPlayer,
        '/player/book/item1',
        '/player/photo/item1',
        '/player/next-up/item1',
        '/player/still-watching/item1',
        '/game-player/lib1/game1',
      ]) {
        expect(Destinations.isPlayerRoute(path), isTrue, reason: path);
      }
    });

    test('leaves the rest of the app out', () {
      for (final path in [
        Destinations.home,
        Destinations.search,
        Destinations.liveTv,
        Destinations.liveTvGuide,
        '/item/item1',
        '/game/lib1/game1',
        '/games/lib1',
      ]) {
        expect(Destinations.isPlayerRoute(path), isFalse, reason: path);
      }
    });
  });

  group('the back key', () {
    test('is left to the screens that read it themselves', () {
      expect(Destinations.routeReadsBackKey(Destinations.videoPlayer), isTrue);
      expect(Destinations.routeReadsBackKey('/game-player/lib1/game1'), isTrue);
    });

    test('is still handled for the playback screens that do not', () {
      for (final path in [
        Destinations.audioPlayer,
        Destinations.externalPlayer,
        Destinations.liveTvPlayer,
        Destinations.trailerPlayer,
        '/player/book/item1',
        '/player/photo/item1',
        '/player/next-up/item1',
        '/player/still-watching/item1',
      ]) {
        expect(Destinations.routeReadsBackKey(path), isFalse, reason: path);
        expect(Destinations.isPlayerRoute(path), isTrue, reason: path);
      }
    });

    test('is handled everywhere outside playback', () {
      for (final path in [
        Destinations.home,
        '/item/item1',
        '/game/lib1/game1',
        '/game-players',
      ]) {
        expect(Destinations.routeReadsBackKey(path), isFalse, reason: path);
      }
    });
  });
}
