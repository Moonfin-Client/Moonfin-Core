import 'dart:async';

typedef SendRemoteSearchCommand = Future<void> Function(
  String name,
  Map<String, String> arguments,
);

/// Serializes text independently of the remote panel's busy/drop button path.
/// The destination is captured by [send], never looked up while draining.
class RemoteSearchSender {
  RemoteSearchSender({required this.send, required this.inputId});

  final SendRemoteSearchCommand send;
  final String inputId;
  String? _pending;
  Future<void>? _flight;
  bool _opened = false;
  bool _closed = false;
  int _revision = 0;

  void setText(String text) {
    if (!_closed) _pending = text;
  }

  Future<void> flush() {
    if (_closed) return Future.value();
    return _flight ??= _drain().whenComplete(() => _flight = null);
  }

  Future<void> _drain() async {
    if (!_opened) {
      await send('GoToSearch', {'MoonfinInputId': inputId});
      _opened = true;
    }
    while (!_closed && _pending != null) {
      final text = _pending!;
      _pending = null;
      try {
        await send('SendString', {
          'String': text,
          'MoonfinInputId': inputId,
          'MoonfinRevision': '${++_revision}',
        });
      } catch (_) {
        // Keep the newest edit for a deliberate retry; do not retry forever.
        _pending ??= text;
        rethrow;
      }
    }
  }

  void close() {
    _closed = true;
    _pending = null;
  }
}
