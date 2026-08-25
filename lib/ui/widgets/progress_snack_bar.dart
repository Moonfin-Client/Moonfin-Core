import 'package:flutter/material.dart';

/// A snack bar that sits there with a spinner while something is still
/// running, instead of the silence a remote subtitle search and download used
/// to leave behind. The caller takes it down when the work it describes is
/// over, so the duration below is only a backstop for a screen that goes away
/// mid-flight.
SnackBar _progressSnackBar(String message) {
  return SnackBar(
    duration: const Duration(seconds: 45),
    content: Row(
      children: <Widget>[
        const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(message)),
      ],
    ),
  );
}

/// Shows [snackBar], or gives up on saying anything at all.
///
/// A messenger walks every Scaffold registered with it on the way to putting a
/// message up, and one Scaffold that has since been deactivated makes that walk
/// throw. Telling the user about a piece of work is never worth taking the work
/// itself down with it, so a messenger in that state costs the message and
/// nothing more.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? trySnackBar(
  ScaffoldMessengerState messenger,
  SnackBar snackBar,
) {
  try {
    return messenger.showSnackBar(snackBar);
  } catch (_) {
    return null;
  }
}

/// Runs [work] with a progress snack bar up, and takes that snack bar down
/// however the work ends.
///
/// Closing the controller is what makes it safe: hiding "whatever is on screen"
/// would just as happily dismiss an unrelated message, and every early return
/// would have to remember to do it.
Future<T> withProgressSnackBar<T>(
  ScaffoldMessengerState messenger,
  String message,
  Future<T> Function() work,
) async {
  final controller = trySnackBar(messenger, _progressSnackBar(message));
  try {
    return await work();
  } finally {
    try {
      controller?.close();
    } catch (_) {
      // The messenger stopped taking messages while the work ran; the snack
      // bar went down with it and there is nothing left to close.
    }
  }
}
