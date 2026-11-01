import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:media_kit/media_kit.dart';

/// Keeps every live media_kit [Player] reachable so app exit can dispose them.
///
/// media_kit registers an FFI wakeup callback per player and only clears it in
/// [Player.dispose]. A player still alive when the Dart VM shuts down keeps
/// calling that callback from its mpv threads, and the VM aborts with
/// "GetFfiCallbackMetadata called after shutdown" (SIGABRT on Linux).
class MpvPlayerRegistry {
  MpvPlayerRegistry._();

  @visibleForTesting
  MpvPlayerRegistry.forTest();

  static final MpvPlayerRegistry instance = MpvPlayerRegistry._();

  static const Duration _disposeTimeout = Duration(seconds: 2);

  final Map<Object, Future<void> Function()> _live = {};
  final Map<Object, Future<void>> _inFlight = {};
  final Expando<bool> _released = Expando<bool>();
  bool _shuttingDown = false;

  int get liveCount => _live.length;

  Player create({PlayerConfiguration configuration = const PlayerConfiguration()}) {
    _checkOpen();
    final player = Player(configuration: configuration);
    register(player, player.dispose);
    return player;
  }

  void _checkOpen() {
    if (_shuttingDown) {
      throw StateError('MpvPlayerRegistry is shutting down');
    }
  }

  void register(Object owner, Future<void> Function() dispose) {
    _checkOpen();
    _live[owner] = dispose;
  }

  /// Disposes [player] once. An owner stays tracked until its dispose has
  /// finished, and a second caller shares the same in-flight future.
  Future<void> dispose(Player player) {
    if (_live.containsKey(player) || _released[player] == true) {
      return release(player);
    }
    return player.dispose();
  }

  Future<void> release(Object owner) {
    final dispose = _live[owner];
    if (dispose == null) return Future<void>.value();
    return _inFlight[owner] ??= Future<void>.sync(dispose).whenComplete(() {
      _live.remove(owner);
      _inFlight.remove(owner);
      _released[owner] = true;
    });
  }

  /// Stops accepting new players, then disposes every live one. Called on
  /// app exit, so a player created after the snapshot cannot outlive it.
  Future<void> disposeAll() async {
    _shuttingDown = true;
    await Future.wait(
      _live.keys.toList().map(
        (owner) => release(owner).timeout(_disposeTimeout).catchError((Object e) {
          debugPrint('[MpvPlayerRegistry] dispose of $owner did not finish: $e');
        }),
      ),
    );
  }
}
