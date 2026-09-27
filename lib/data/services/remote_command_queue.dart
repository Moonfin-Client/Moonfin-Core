import 'dart:async';
import 'dart:collection';

/// Ordered button presses for one captured target. Commands are never retried:
/// replaying Select or Back after a network failure can perform a second action.
class RemoteCommandQueue {
  RemoteCommandQueue({
    required this.send,
    required this.onError,
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final Future<void> Function(String) send;
  final void Function(Object) onError;
  final DateTime Function() _now;
  final _pending = Queue<(String, DateTime)>();
  bool _running = false;
  bool _closed = false;
  Future<void> _flight = Future.value();

  Future<void> get settled => _flight;

  void add(String command) {
    if (_closed) return;
    if (_pending.length >= 8) {
      _fail(TimeoutException('Remote control is not keeping up'));
      return;
    }
    _pending.add((command, _now()));
    if (!_running) unawaited(_flight = _drain());
  }

  Future<void> _drain() async {
    _running = true;
    try {
      while (!_closed && _pending.isNotEmpty) {
        final (command, queuedAt) = _pending.removeFirst();
        if (_now().difference(queuedAt) > const Duration(seconds: 2)) {
          throw TimeoutException('Remote control is not keeping up');
        }
        await send(command);
      }
    } catch (error) {
      if (!_closed) _fail(error);
    } finally {
      _running = false;
    }
  }

  void _fail(Object error) {
    close();
    onError(error);
  }

  void close() {
    _closed = true;
    _pending.clear();
  }
}
