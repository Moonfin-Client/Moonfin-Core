import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';

/// A TV holds the screen awake while idle so our own screensaver can run. The
/// exception is Apple TV's native player, which covers the view it draws in.
void main() {
  bool needed({
    bool activityPaused = false,
    bool playbackActive = false,
    bool streamPlaying = false,
    bool trailerActive = false,
    bool screensaverVisible = false,
    bool isTv = true,
    bool screensaverEnabled = true,
    bool nativePlayerPresented = false,
  }) => ScreensaverController.wakeLockNeeded(
    activityPaused: activityPaused,
    playbackActive: playbackActive,
    streamPlaying: streamPlaying,
    trailerActive: trailerActive,
    screensaverVisible: screensaverVisible,
    isTv: isTv,
    screensaverEnabled: screensaverEnabled,
    nativePlayerPresented: nativePlayerPresented,
  );

  group('wake lock', () {
    test('a paused native player lets the screen go', () {
      expect(needed(nativePlayerPresented: true), isFalse);
    });

    test('a playing native player holds the screen', () {
      expect(needed(nativePlayerPresented: true, streamPlaying: true), isTrue);
    });

    test(
      'an idle TV, or one with a paused Flutter player, holds the screen',
      () {
        expect(needed(), isTrue);
      },
    );

    test('a TV with the screensaver turned off lets the screen go', () {
      expect(needed(screensaverEnabled: false), isFalse);
    });

    test('a phone only holds the screen while something plays', () {
      expect(needed(isTv: false), isFalse);
      expect(needed(isTv: false, playbackActive: true), isTrue);
    });

    test('a media bar trailer holds the screen', () {
      expect(needed(isTv: false, trailerActive: true), isTrue);
    });

    test('a visible screensaver holds the screen', () {
      expect(
        needed(screensaverEnabled: false, screensaverVisible: true),
        isTrue,
      );
    });

    test('a backgrounded app never holds the screen', () {
      expect(
        needed(activityPaused: true, streamPlaying: true, playbackActive: true),
        isFalse,
      );
    });
  });
}
