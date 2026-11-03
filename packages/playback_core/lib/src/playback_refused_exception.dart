/// The server refused to play an item, with a message for the viewer.
///
/// A resolver throws it when the server's answer is a decision rather than
/// a failure: the request was fine, but this item can't be played this way
/// (Silo's terminal reasons). The playback manager reports it as
/// a failed bringup with [message] as the error, which the player shows,
/// and the launcher closes the player without treating it as a crash.
class PlaybackRefusedException implements Exception {
  const PlaybackRefusedException(
    this.message, {
    this.reason,
    this.retryable = false,
  });

  /// The server's words, for the viewer.
  final String message;

  /// The server's code for why (`source_unreadable`), for logs.
  final String? reason;

  /// Whether trying again later could help (the file is still being
  /// scanned, the server is busy).
  final bool retryable;

  @override
  String toString() => message;
}
