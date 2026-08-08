import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Wraps an index-driven game menu selection, including reverse navigation.
///
/// Game overlays intentionally do not use Flutter focus because their game
/// surface may be a platform view or a native texture. Both playback backends
/// therefore drive their menus with an integer selection.
int wrapGamePlaybackMenuSelection(int current, int delta, int itemCount) {
  if (itemCount <= 0) return 0;
  return ((current + delta) % itemCount + itemCount) % itemCount;
}

/// Scrolls an index-driven menu row into view without taking focus from the
/// active game surface.
void ensureGamePlaybackMenuSelectionVisible(
  ScrollController controller,
  int index, {
  required double rowExtent,
}) {
  if (!controller.hasClients) return;
  final position = controller.position;
  final top = index * rowExtent;
  final bottom = top + rowExtent;
  var target = position.pixels;
  if (top < position.pixels) {
    target = top;
  } else if (bottom > position.pixels + position.viewportDimension) {
    target = bottom - position.viewportDimension;
  }
  target = target.clamp(position.minScrollExtent, position.maxScrollExtent);
  if (target == position.pixels) return;
  controller.animateTo(
    target,
    duration: const Duration(milliseconds: 150),
    curve: Curves.easeOut,
  );
}

/// Displays a short non-blocking playback failure message.
void showGamePlaybackMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
  );
}

/// Shared full-screen system UI lifecycle for game players.
///
/// The flags preserve each backend's platform policy: EmulatorJS hides system
/// UI on every host while native playback does so only with touch controls.
abstract final class GamePlaybackSystemUi {
  static void enter({required bool immersive, required bool lockLandscape}) {
    if (!immersive) return;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (lockLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  static Future<void> restore({required bool immersive}) async {
    if (!immersive) return;
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }
}

/// Releases decoded-image memory before a game takes over the screen.
///
/// Both playback backends are memory-hungry in a way the rest of the app is
/// not: the native host allocates frame buffers plus a core's own heap, and the
/// EmulatorJS backend runs a whole WebAssembly emulator inside a WebView
/// renderer that lives in a *separate process* and is killed outright by the OS
/// when memory runs short. On a memory-constrained TV box that kill has been
/// observed mid-load, freezing the emulator on its loading screen with no way
/// out (buglog bug-033, a 3 GB Shield with ~46 MB free).
///
/// Pausing artwork work -- which the activity gate already does -- stops new
/// allocations but frees nothing already resident. This drops what is held, so
/// the memory goes to the emulator instead. Nothing artwork-backed is visible
/// behind a full-screen game, so clearing live images costs only a re-decode of
/// whatever the user returns to, and buys headroom on exactly the low-end
/// hardware that needs it most.
void releaseImageMemoryForGameplay() {
  final cache = PaintingBinding.instance.imageCache;
  cache.clear();
  cache.clearLiveImages();
}

/// Detaches any lingering IME connection before a game takes over input.
///
/// The game browse screens have a search field, and focusing it binds the
/// system IME to this app. That binding is not released when the field loses
/// focus -- Android keeps `mBoundToMethod=true` with `mServedView=null` -- so
/// every subsequent key, including the d-pad, is offered to the IME before it
/// reaches us. Once the IME's channel goes stale that send fails (EPIPE), and
/// the input dispatcher then holds the *next* key back, logging "Waiting to
/// send key ... because there are unprocessed events that may cause focus to
/// change". The symptom is exactly what it sounds like: presses that arrive
/// late or appear to stick.
///
/// Nothing on a full-screen game surface wants a text connection, so drop it on
/// the way in. Flutter re-attaches on its own the next time a field is focused,
/// via the setClient it always sends.
void detachTextInputForGameplay() {
  FocusManager.instance.primaryFocus?.unfocus();
  SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
  SystemChannels.textInput.invokeMethod<void>('TextInput.clearClient');
}
