import 'dart:async';

import 'package:flutter/widgets.dart';

/// Closes a player the viewer paused and then left in the background, once
/// it's been away longer than a quick app switch. Its stop report then goes
/// out while it's current, before another device can move the item on and
/// have the old position overwrite it.
class PausedBackgroundExit {
  PausedBackgroundExit({required this.mayClose, required this.close});

  static const _delay = Duration(seconds: 15);

  /// The player is paused and nothing else still needs it.
  final bool Function() mayClose;
  final VoidCallback close;

  AppLifecycleState? _state;
  bool _pausedOnLeaving = false;
  Timer? _timer;

  void onLifecycleChanged(AppLifecycleState state) {
    _state = state;
    switch (state) {
      case AppLifecycleState.inactive:
        // Leaving starts here, before the system reacts to it. A pause that
        // comes after, like the one a lock makes, isn't the viewer's.
        _pausedOnLeaving = mayClose();
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        if (!_pausedOnLeaving || (_timer?.isActive ?? false)) return;
        _timer = Timer(_delay, () {
          final away =
              _state == AppLifecycleState.hidden ||
              _state == AppLifecycleState.paused;
          if (away && mayClose()) close();
        });
      case AppLifecycleState.resumed:
        _timer?.cancel();
      case AppLifecycleState.detached:
        break;
    }
  }

  void dispose() => _timer?.cancel();
}
