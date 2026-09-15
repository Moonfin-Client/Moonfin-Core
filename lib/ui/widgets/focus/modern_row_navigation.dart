import 'package:flutter/widgets.dart';

/// Coordinates a focus handoff with an interruptible modern row scroll.
///
/// A newer move owns completion immediately. Old scroll futures may still
/// finish, but cannot restore focus or clear the newer destination.
class ModernRowNavigation {
  int _generation = 0;
  bool _disposed = false;
  Object? _targetKey;

  bool get isActive => _targetKey != null;
  Object? get targetKey => _targetKey;

  Future<void> move({
    required Object targetKey,
    required bool Function() requestFocus,
    required Future<void> Function() scroll,
  }) async {
    if (_disposed) return;
    final generation = ++_generation;
    _targetKey = targetKey;
    try {
      final focusedInitially = requestFocus();
      if (!_isCurrent(generation)) return;

      // Start the viewport alongside the focus/card handoff. Waiting for a
      // completed frame first lets the cards resize before the rows move.
      // Keep ownership through that frame even when scrolling finishes at once.
      await Future.wait<void>([scroll(), WidgetsBinding.instance.endOfFrame]);
      if (!_isCurrent(generation)) return;

      if (!focusedInitially) {
        // Scrolling can mount a destination outside the list's lazy cache.
        // Never refocus an initially mounted row: the user may have already
        // moved horizontally within it while its vertical scroll completed.
        await WidgetsBinding.instance.endOfFrame;
        if (!_isCurrent(generation)) return;
        final focusedAfterScroll = requestFocus();
        if (!_isCurrent(generation)) return;
        if (focusedAfterScroll) {
          // Keep ownership while the focus manager applies this late request,
          // so the row can recognize the handoff in its focus listener.
          await WidgetsBinding.instance.endOfFrame;
        }
      }
    } finally {
      if (_isCurrent(generation)) _targetKey = null;
    }
  }

  bool _isCurrent(int generation) => !_disposed && generation == _generation;

  /// Invalidates pending focus work without trying to stop the caller's scroll.
  void cancel() {
    _generation++;
    _targetKey = null;
  }

  void dispose() {
    cancel();
    _disposed = true;
  }
}
