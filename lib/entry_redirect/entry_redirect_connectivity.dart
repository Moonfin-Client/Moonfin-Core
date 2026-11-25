// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// Ties [EntryRedirect] to the reachability check and the player: a server
// that stops answering is looked up behind its entry address, and a move
// found anywhere reaches the open stream at once. Hooked into
// [ConnectivityService] through `onServerUnreachable` only.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../data/services/connectivity_service.dart';
import 'entry_redirect.dart';

class EntryRedirectConnectivity {
  EntryRedirectConnectivity(
    this._connectivity,
    this._redirect, {
    this.followInterval = const Duration(seconds: 5),
    this.followBudget = const Duration(minutes: 3),
    this.askLimit = const Duration(seconds: 2),
    Future<void> Function(String from, String to)? moveStream,
  }) : _moveStream = moveStream ?? _moveOpenStream;

  final ConnectivityService _connectivity;
  final EntryRedirect _redirect;

  /// While a stream is lost, how often the entry address is asked, and for
  /// how long at most. Asking it is cheap: the redirect answers at once,
  /// unlike pings to the dead address.
  final Duration followInterval;
  final Duration followBudget;

  /// How long one ask may hold up the reachability check: a server switch
  /// may be waiting on it. A later answer is still saved.
  final Duration askLimit;

  /// Hands a move to the open stream; the player by default.
  final Future<void> Function(String from, String to) _moveStream;

  static Future<void> _moveOpenStream(String from, String to) async {
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<PlaybackManager>()) return;
    await getIt<PlaybackManager>().onServerMoved(from: from, to: to);
  }

  StreamSubscription<ServerMove>? _movedSub;
  bool _followingLostStream = false;
  bool _stopped = false;

  void start() {
    _connectivity.onServerUnreachable = followFor;
    _movedSub ??= _redirect.serverMoved.listen(_onServerMoved);
  }

  void stop() {
    _stopped = true;
    if (_connectivity.onServerUnreachable == followFor) {
      _connectivity.onServerUnreachable = null;
    }
    _movedSub?.cancel();
    _movedSub = null;
  }

  /// Whether the entry address of [serverId] now redirects to a new address,
  /// which [client], that server's client, then uses.
  Future<bool> followFor(MediaServerClient client, String? serverId) async {
    if (serverId == null) return false;
    try {
      final moved = await _redirect
          .followEntryAddressOf(serverId)
          // A Future<String> underneath can't time out to null.
          .then<String?>((address) => address)
          .timeout(askLimit, onTimeout: () => null);
      if (moved == null) return false;
      if (client.baseUrl != moved) client.baseUrl = moved;
      ServerLog.network('Server moved, following its entry address');
      return true;
    } catch (_) {
      return false;
    }
  }

  /// The player lost its stream and starts reconnecting, or one of its
  /// server requests stalled on the network. A server that moved behind its
  /// entry address (a VPN reconnect changing the forwarded port) doesn't
  /// flip the device's network, so nothing else would check now.
  ///
  /// The redirect catches up some time after the stream broke (the new port
  /// has to be mapped and published first), so the entry address is asked
  /// every [followInterval] while the player reconnects or the server
  /// doesn't answer, for at most [followBudget]. Past that it is more likely
  /// a real outage, and the reachability check's own retries keep following
  /// it from there.
  Future<void> onStreamConnectionLost() async {
    final getIt = GetIt.instance;
    if (_stopped ||
        !_connectivity.isOnline ||
        !getIt.isRegistered<MediaServerClient>()) {
      return;
    }
    if (_followingLostStream) return;
    _followingLostStream = true;
    try {
      final deadline = DateTime.now().add(followBudget);
      // Tells a stream that dropped on a server still at its address (it
      // answers) from one that moved, without holding up the first ask.
      unawaited(_connectivity.recheckServer());
      while (true) {
        final serverId = _connectivity.activeServerId;
        if (await followFor(getIt<MediaServerClient>(), serverId)) {
          if (!_stopped) await _connectivity.recheckServer();
          return;
        }
        if (_stopped) return;
        await Future<void>.delayed(followInterval);
        if (_stopped) return;
        if (!_connectivity.isOnline || DateTime.now().isAfter(deadline)) break;
        if (!_playerReconnecting() && _connectivity.serverReachable) return;
        if (!getIt.isRegistered<MediaServerClient>()) return;
      }
      await _connectivity.recheckServer();
    } finally {
      _followingLostStream = false;
    }
  }

  /// The active server answers on a new address now, found by any ask of its
  /// entry address. Whatever was waiting on the old one hears of it at once:
  /// the reachability state clears and an open stream moves over to it.
  void _onServerMoved(ServerMove move) {
    if (_stopped || move.server.id != _connectivity.activeServerId) return;
    unawaited(lastMoveCheck = _connectivity.recheckServer());
    unawaited(_moveStream(move.from, move.server.address));
  }

  /// The reachability check the last move started, for tests to wait on.
  @visibleForTesting
  Future<void>? lastMoveCheck;

  bool _playerReconnecting() {
    final getIt = GetIt.instance;
    return getIt.isRegistered<PlaybackManager>() &&
        getIt<PlaybackManager>().isReconnecting;
  }
}
