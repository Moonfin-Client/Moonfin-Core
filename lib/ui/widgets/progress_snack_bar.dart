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

/// Runs [work] with a progress snack bar up, and takes that snack bar down
/// however the work ends.
///
/// Closing the controller this returns is what makes it safe: hiding "whatever
/// is on screen" would just as happily dismiss an unrelated message, and every
/// early return would have to remember to do it.
Future<T> withProgressSnackBar<T>(
  ScaffoldMessengerState messenger,
  String message,
  Future<T> Function() work,
) async {
  final controller = messenger.showSnackBar(_progressSnackBar(message));
  try {
    return await work();
  } finally {
    controller.close();
  }
}
