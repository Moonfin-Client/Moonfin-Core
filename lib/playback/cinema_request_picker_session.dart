import 'dart:async';

/// Keeps a request picker active briefly after the trailer changes, but only while the
/// player and account stay the same.
class CinemaRequestPickerSession {
  CinemaRequestPickerSession({
    required Object Function() accountKey,
    required bool Function() isMounted,
  }) : _accountKey = accountKey,
       _isMounted = isMounted,
       _account = accountKey();

  final Object Function() _accountKey;
  final bool Function() _isMounted;
  final Object _account;
  Timer? _graceTimer;
  void Function()? _dismissDialog;
  bool _active = true;
  bool _submitting = false;
  bool _closeRequested = false;

  bool get isCurrent => _active && _isMounted() && _account == _accountKey();

  set dismissDialog(void Function() dismiss) {
    _dismissDialog = dismiss;
    if (_closeRequested && _isMounted()) dismiss();
  }

  void beginGrace() {
    if (!isCurrent || _submitting || _graceTimer != null) return;
    _graceTimer = Timer(const Duration(seconds: 10), close);
  }

  void markSubmitting() {
    if (!isCurrent) return;
    _submitting = true;
    _graceTimer?.cancel();
    _graceTimer = null;
  }

  /// Skipping closes an idle picker, but lets a request already being submitted finish. Returns
  /// whether the picker closed.
  bool closeForSkip() {
    if (_submitting && isCurrent) return false;
    close();
    return true;
  }

  void close() {
    if (_closeRequested) return;
    _closeRequested = true;
    dispose();
    if (_isMounted()) _dismissDialog?.call();
  }

  void dispose() {
    _active = false;
    _graceTimer?.cancel();
    _graceTimer = null;
  }
}
