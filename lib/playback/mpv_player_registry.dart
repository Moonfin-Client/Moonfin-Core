import 'dart:async';

import 'package:media_kit/media_kit.dart';

/// Keeps every live media_kit [Player] reachable so app exit can dispose them.
///
/// media_kit registers an FFI wakeup callback per player and only clears it in
/// [Player.dispose]. A player still alive when the Dart VM shuts down keeps
/// calling that callback from its mpv threads, and the VM aborts with
/// "GetFfiCallbackMetadata called after shutdown" (SIGABRT on Linux).
class MpvPlayerRegistry {
  MpvPlayerRegistry._();

  static final MpvPlayerRegistry instance = MpvPlayerRegistry._();

  static const Duration _disposeTimeout = Duration(seconds: 2);

  final Map<Object, Future<void> Function()> _live = {};

  int get liveCount => _live.length;

  Player create({PlayerConfiguration configuration = const PlayerConfiguration()}) {
    final player = Player(configuration: configuration);
    register(player, player.dispose);
    return player;
  }

  void register(Object owner, Future<void> Function() dispose) {
    _live[owner] = dispose;
  }

  Future<void> dispose(Player player) {
    _live.remove(player);
    return player.dispose();
  }

  Future<void> disposeAll() async {
    final pending = _live.values.toList();
    _live.clear();
    await Future.wait(
      pending.map(
        (dispose) => Future<void>.sync(dispose)
            .timeout(_disposeTimeout)
            .catchError((Object _) {}),
      ),
    );
  }
}
