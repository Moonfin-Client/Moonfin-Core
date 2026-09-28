import 'dart:async';

/// Orders volume gestures independently of playback controls. Consecutive
/// pending slider values collapse to the latest, while mute and steps keep
/// their order.
class RemoteVolumeSender {
  RemoteVolumeSender(this.send);

  final Future<void> Function(String command, int? volume) send;
  final _pending = <(String, int?)>[];
  Future<void>? _flight;
  bool _closed = false;

  bool get isSending => _flight != null;

  Future<void> add(String command, {int? volume}) {
    if (_closed) return Future.value();
    if (command == 'SetVolume' &&
        _pending.isNotEmpty &&
        _pending.last.$1 == 'SetVolume') {
      _pending.removeLast();
    }
    if (_pending.length >= 8) {
      close();
      return Future.error(StateError('Remote volume queue is full'));
    }
    _pending.add((command, volume));
    return _flight ??= _drain().whenComplete(() => _flight = null);
  }

  Future<void> _drain() async {
    try {
      while (!_closed && _pending.isNotEmpty) {
        final (command, volume) = _pending.removeAt(0);
        await send(command, volume);
      }
    } catch (_) {
      close();
      rethrow;
    }
  }

  void close() {
    _closed = true;
    _pending.clear();
  }
}
