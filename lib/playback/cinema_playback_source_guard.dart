import 'package:playback_core/playback_core.dart';

/// Keeps late playback-ready events from a previous trailer from updating the current trailer's controls.
class CinemaPlaybackSourceGuard {
  Object? _item;
  int _index = -1;
  int? _lastReadyToken;
  int? _previousReadyToken;

  /// Returns true when playback switches to another item or starts for the first time.
  bool enter(Object? item, int index, {bool initial = false}) {
    if (!initial && identical(item, _item) && index == _index) return false;
    _previousReadyToken = initial ? null : _lastReadyToken;
    _item = item;
    _index = index;
    return true;
  }

  /// Only accept a "ready" signal from the current item and its playback source.
  bool observeReady({
    required Object? item,
    required int index,
    required String? itemId,
    required PlaybackBringupState source,
  }) {
    if (source.phase != PlaybackBringupPhase.ready ||
        !identical(item, _item) ||
        index != _index ||
        source.itemId != itemId ||
        source.sessionToken == _previousReadyToken) {
      return false;
    }
    _lastReadyToken = source.sessionToken;
    return true;
  }
}
