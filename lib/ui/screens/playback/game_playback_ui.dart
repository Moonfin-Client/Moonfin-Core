import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../util/system_ui.dart';

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

/// Centers an index-driven menu row after returning from a nested editor.
void centerGamePlaybackMenuSelection(
  ScrollController controller,
  int index, {
  required double rowExtent,
}) {
  if (!controller.hasClients) return;
  final position = controller.position;
  final target = (index * rowExtent) -
      (position.viewportDimension - rowExtent) / 2;
  final clampedTarget = target
      .clamp(position.minScrollExtent, position.maxScrollExtent)
      .toDouble();
  if ((clampedTarget - position.pixels).abs() < 0.5) return;
  controller.animateTo(
    clampedTarget,
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
  static void enter(
    ImmersiveSystemUi screen, {
    required bool immersive,
    required bool lockLandscape,
  }) {
    if (!immersive) return;
    screen.setImmersive(true);
    if (lockLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  static Future<void> restore(
    ImmersiveSystemUi screen, {
    required bool immersive,
  }) async {
    if (!immersive) return;
    screen.setImmersive(false);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }
}
