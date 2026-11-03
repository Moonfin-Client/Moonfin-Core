import 'package:flutter/foundation.dart';
import 'package:media_kit/media_kit.dart';

/// Keeps every live media_kit [Player] reachable so app exit can dispose them.
///
/// media_kit registers an FFI wakeup callback per player and only clears it in
/// [Player.dispose]. A player still alive when the Dart VM shuts down keeps
/// calling that callback from its mpv threads, and the VM aborts with
/// "GetFfiCallbackMetadata called after shutdown" (SIGABRT on Linux).
class MpvPlayerRegistry {
  @visibleForTesting
  MpvPlayerRegistry();

  static final MpvPlayerRegistry instance = MpvPlayerRegistry();

  static const Duration _disposeTimeout = Duration(seconds: 2);

  final Map<Player, Future<void>?> _live = {};
  bool _shuttingDown = false;

  Player create({PlayerConfiguration configuration = const PlayerConfiguration()}) {
    if (_shuttingDown) {
      throw StateError('MpvPlayerRegistry is shutting down');
    }
    return track(Player(configuration: configuration));
  }

  @visibleForTesting
  Player track(Player player) {
    _live[player] = null;
    return player;
  }

  /// A dispose that's already running is shared so exit waits for it, and a
  /// disposed player is skipped since media_kit throws on a second dispose.
  Future<void> dispose(Player player) {
    if (!_live.containsKey(player)) return Future<void>.value();
    return _live[player] ??= player.dispose().whenComplete(() {
      _live.remove(player);
    });
  }

  /// New players are refused once this starts, since one created after the
  /// snapshot would never be disposed and would outlive the VM.
  Future<void> disposeAll() async {
    _shuttingDown = true;
    await Future.wait(
      _live.keys.toList().map(
        (player) => dispose(player).timeout(_disposeTimeout).catchError((Object e) {
          debugPrint('[MpvPlayerRegistry] player dispose failed or timed out: $e');
        }),
      ),
    );
  }
}
