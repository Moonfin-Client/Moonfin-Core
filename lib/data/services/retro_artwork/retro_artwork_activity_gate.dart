import 'dart:async';

enum RetroArtworkBlocker { gameplay, coveredRoute }

enum RetroArtworkActivityKind {
  transfer,
  provider,
  decode,
  manifestRefresh,
  priorityCall,
}

/// Cooperative cancellation shared by artwork HTTP, decode, and metadata work.
///
/// Dio requests can stop immediately through a `CancelToken`. Flutter image
/// decoding is not itself cancellable, so decode callers must also check this
/// signal after the codec future completes and discard a cancelled result.
class RetroArtworkCancellationSignal {
  final Set<void Function()> _listeners = <void Function()>{};
  final Completer<void> _cancelledCompleter = Completer<void>();

  bool _isCancelled = false;
  Object? _reason;

  bool get isCancelled => _isCancelled;
  Object? get reason => _reason;
  Future<void> get whenCancelled => _cancelledCompleter.future;

  void addListener(void Function() listener) {
    if (_isCancelled) {
      listener();
      return;
    }
    _listeners.add(listener);
  }

  void removeListener(void Function() listener) {
    _listeners.remove(listener);
  }

  void throwIfCancelled() {
    if (_isCancelled) {
      throw RetroArtworkCancelledException(_reason);
    }
  }

  void _cancel(Object? reason) {
    if (_isCancelled) return;
    _isCancelled = true;
    _reason = reason;
    _cancelledCompleter.complete();
    final listeners = List<void Function()>.of(_listeners);
    _listeners.clear();
    for (final listener in listeners) {
      listener();
    }
  }
}

class RetroArtworkCancelledException implements Exception {
  const RetroArtworkCancelledException([this.reason]);

  final Object? reason;

  @override
  String toString() => reason == null
      ? 'Retro artwork activity was cancelled'
      : 'Retro artwork activity was cancelled: $reason';
}

class RetroArtworkActivityPermit {
  RetroArtworkActivityPermit._(this._gate, this.kind, this.signal);

  final RetroArtworkActivityGate _gate;
  final RetroArtworkActivityKind kind;
  final RetroArtworkCancellationSignal signal;
  bool _disposed = false;

  void cancel([Object? reason]) {
    signal._cancel(reason);
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    _gate._release(this);
  }
}

/// Single switchboard for all retro-artwork activity.
///
/// Entering gameplay or covering the artwork route cancels every issued
/// permit. While either blocker remains active, no new permits are issued.
class RetroArtworkActivityGate {
  static final Object _defaultRouteCoverageOwner = Object();

  final Set<RetroArtworkBlocker> _blockers = <RetroArtworkBlocker>{};
  final Set<RetroArtworkActivityPermit> _permits =
      <RetroArtworkActivityPermit>{};
  final Set<void Function()> _listeners = <void Function()>{};
  final Set<Object> _routeCoverageOwners = <Object>{};
  int _gameplayOwners = 0;

  bool get isOpen => _blockers.isEmpty;
  bool get isGameplayActive => _blockers.contains(RetroArtworkBlocker.gameplay);
  bool get isRouteCovered =>
      _blockers.contains(RetroArtworkBlocker.coveredRoute);
  Set<RetroArtworkBlocker> get blockers => Set.unmodifiable(_blockers);

  void setGameplayActive(bool active) {
    if (active) {
      _gameplayOwners++;
    } else if (_gameplayOwners > 0) {
      _gameplayOwners--;
    }
    _setBlocked(RetroArtworkBlocker.gameplay, _gameplayOwners > 0);
  }

  /// Keeps coverage idempotent per owner so one route lifecycle cannot reopen
  /// the gate while another still considers artwork hidden.
  void setRouteCovered(bool covered, {Object? owner}) {
    final coverageOwner = owner ?? _defaultRouteCoverageOwner;
    if (covered) {
      _routeCoverageOwners.add(coverageOwner);
    } else {
      _routeCoverageOwners.remove(coverageOwner);
    }
    _setBlocked(
      RetroArtworkBlocker.coveredRoute,
      _routeCoverageOwners.isNotEmpty,
    );
  }

  RetroArtworkActivityPermit? tryAcquire(RetroArtworkActivityKind kind) {
    if (!isOpen) return null;
    final permit = RetroArtworkActivityPermit._(
      this,
      kind,
      RetroArtworkCancellationSignal(),
    );
    _permits.add(permit);

    // Keep acquisition correct if a synchronous listener closed the gate.
    if (!isOpen) {
      permit.cancel(_blockers.first);
      permit.dispose();
      return null;
    }
    return permit;
  }

  void addListener(void Function() listener) {
    _listeners.add(listener);
  }

  void removeListener(void Function() listener) {
    _listeners.remove(listener);
  }

  void _setBlocked(RetroArtworkBlocker blocker, bool blocked) {
    final changed = blocked
        ? _blockers.add(blocker)
        : _blockers.remove(blocker);
    if (!changed) return;

    if (blocked) {
      final permits = List<RetroArtworkActivityPermit>.of(_permits);
      for (final permit in permits) {
        permit.cancel(blocker);
      }
    }

    for (final listener in List<void Function()>.of(_listeners)) {
      listener();
    }
  }

  void _release(RetroArtworkActivityPermit permit) {
    _permits.remove(permit);
  }
}
