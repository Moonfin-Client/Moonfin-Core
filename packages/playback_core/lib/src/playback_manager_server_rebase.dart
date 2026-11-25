// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// Keeps a stream playing when its server moves to a new address (a stable
// name redirecting to a dynamic `host:port`). A [ServerRebaseBackend] moves
// its loads over and plays on from its buffer; any other backend reopens the
// stream at the current position. The host app decides which servers can
// move ([ServerRebasePlayback.canServerMove]) and reports moves
// ([ServerRebasePlayback.onServerMoved]). PlaybackManager only calls the
// `_serverRebase…` hooks below, each marked `// entry redirect` there.
part of 'playback_manager.dart';

/// A backend that can follow a server to a new address mid-stream, for a
/// server added through a redirect to a dynamic `host:port`.
abstract interface class ServerRebaseBackend {
  /// Fires when a request to the server has waited on the network for a few
  /// seconds while the stream needs data: a sign the server may have moved
  /// behind its entry address.
  Stream<void> get serverStallStream;

  /// Sends the open stream's requests for the server at [from] to [to] from
  /// now on, cutting its loads still on [from], and keeps playing from what
  /// it buffered. Only the stream open now follows the move, and only while
  /// it stays open. False when it couldn't: nothing was redirected (a changed
  /// base path among them), and the stream is then reopened.
  Future<bool> rebaseServer(String from, String to);
}

/// What [ServerRebasePlayback] keeps per [PlaybackManager].
class _ServerRebaseState {
  bool Function()? canServerMove;
  final stalls = StreamController<void>.broadcast();
  Timer? rebaseCheck;

  /// Where playback has to move on from for the rebase to count as working:
  /// the position at the move, or the target of a seek made since.
  Duration rebaseFrom = Duration.zero;
  Timer? bufferStallCheck;
}

extension ServerRebasePlayback on PlaybackManager {
  static const _rebaseGrace = Duration(seconds: 8);

  /// How long, and then how often, an open server stream may buffer on a
  /// backend that doesn't watch its own server requests before
  /// [serverStalledStream] fires. A server that moved goes quiet without
  /// refusing, and such a player would only fail the stream once its own
  /// stall or read timeout gives up.
  static const _bufferStallInterval = Duration(seconds: 5);

  /// Host supplied: whether the active server can move to a new address
  /// (it was added through a redirect, so its entry address knows where it
  /// went). Null counts as no.
  bool Function()? get canServerMove => _serverRebase.canServerMove;
  set canServerMove(bool Function()? value) =>
      _serverRebase.canServerMove = value;

  bool get _serverCanMove => _serverRebase.canServerMove?.call() ?? false;

  /// The stream's server requests stalled on the network, only for a server
  /// that can move: reported by a [ServerRebaseBackend] itself, and for any
  /// other backend after it has buffered an open server stream for a while.
  Stream<void> get serverStalledStream => _serverRebase.stalls.stream;

  /// Whether a server stream is open that [onServerMoved] would reopen.
  bool get hasReconnectableStream =>
      queueService.currentItem != null && _canReconnect(_currentResolution);

  /// The server of the open stream answers on a new address now (a redirect
  /// target that moved from [from] to [to]). Its old connection only times
  /// out after a long while. A backend that can move its loads over keeps
  /// playing from its buffer; the stream is reopened at the current position
  /// only when it can't, or when playback hasn't moved on [_rebaseGrace]
  /// later.
  Future<void> onServerMoved({String? from, String? to}) async {
    if (!hasReconnectableStream || _reconnectInFlight) return;
    final backend = _backend;
    if (from != null &&
        to != null &&
        backend != null &&
        backend is ServerRebaseBackend &&
        !_reconnecting) {
      final intent = _viewerIntentGeneration;
      final item = queueService.currentItem;
      // Whether the viewer is still on the stream this move was heard for.
      bool sameStream() =>
          intent == _viewerIntentGeneration &&
          identical(backend, _backend) &&
          identical(item, queueService.currentItem);
      final rebased = await (backend as ServerRebaseBackend).rebaseServer(
        from,
        to,
      );
      if (rebased) {
        _diagnosticLogger?.call(
          'Server moved, loading on from its new address',
        );
        final s = _serverRebase;
        s.rebaseCheck?.cancel();
        // On the media's timeline, like a seek's target below.
        s.rebaseFrom = _mediaPosition(backend.position);
        s.rebaseCheck = Timer(_rebaseGrace, () {
          s.rebaseCheck = null;
          if (!sameStream() || _viewerPaused) return;
          if (!hasReconnectableStream || _reconnecting) return;
          if (_isActuallyPlaying &&
              _mediaPosition(backend.position) > s.rebaseFrom) {
            return;
          }
          _reconnectAfterMove();
        });
        return;
      }
      // Another item, or the viewer left, while the backend answered: the
      // reopen would start whatever plays now.
      if (!sameStream() || !hasReconnectableStream || _reconnectInFlight) {
        return;
      }
    }
    _reconnectAfterMove();
  }

  void _reconnectAfterMove() {
    _reconnectRetry?.cancel();
    _reconnectRetry = null;
    _reconnectStartedAt = null;
    _beginReconnect('server-moved');
    // The server answers at its new address already, so the first attempt
    // goes now instead of after the backoff a lost connection waits.
    final retry = _reconnectRetry;
    if (retry == null || !retry.isActive || _reconnectAttempts != 0) return;
    retry.cancel();
    _reconnectRetry = null;
    unawaited(
      _runReconnect(
        'server-moved',
        1,
        _viewerIntentGeneration,
        queueService.currentItem,
        _reconnectGeneration,
      ),
    );
  }

  /// Hook: a new backend's streams are wired up.
  void _serverRebaseAttach(PlayerBackend backend) {
    if (backend is! ServerRebaseBackend) return;
    _streamSubs.add(
      // Only a server added through a redirect can have moved: a slow
      // transcode start or seek on any other server asks nothing.
      (backend as ServerRebaseBackend).serverStallStream.listen((_) {
        if (_serverCanMove) _serverRebase.stalls.add(null);
      }),
    );
  }

  /// Hook: the backend reports buffering on or off.
  void _serverRebaseBuffering(PlayerBackend backend, bool buffering) {
    final s = _serverRebase;
    if (backend is ServerRebaseBackend || s.canServerMove == null) return;
    if (!buffering) {
      s.bufferStallCheck?.cancel();
      s.bufferStallCheck = null;
      return;
    }
    if (s.bufferStallCheck?.isActive ?? false) return;
    s.bufferStallCheck = Timer.periodic(_bufferStallInterval, (timer) {
      if (!identical(backend, _backend) || !state.isBuffering) {
        timer.cancel();
        if (identical(s.bufferStallCheck, timer)) s.bufferStallCheck = null;
        return;
      }
      // A reconnect asks the entry address itself.
      if (!hasReconnectableStream || _reconnecting) return;
      if (!_serverCanMove) return;
      s.stalls.add(null);
    });
  }

  /// Hook: a seek to [position] starts.
  void _serverRebaseSeek(Duration position) {
    if (_serverRebase.rebaseCheck != null) _serverRebase.rebaseFrom = position;
  }

  /// Hook: the backend's streams are torn down.
  void _serverRebaseDetach() {
    _serverRebase.bufferStallCheck?.cancel();
    _serverRebase.bufferStallCheck = null;
  }

  /// Hook: the manager is disposed.
  void _serverRebaseDispose() {
    _serverRebase.rebaseCheck?.cancel();
    _serverRebase.bufferStallCheck?.cancel();
    _serverRebase.stalls.close();
  }
}
