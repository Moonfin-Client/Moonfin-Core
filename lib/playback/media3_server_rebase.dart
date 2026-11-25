// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// The Dart side of the native `ServerRebase.kt`: lets [Media3PlayerBackend]
// move an open stream to a server's new address and report requests that
// stalled. Mixed into the backend with one `with`, and fed by one event case.
import 'dart:async';

import 'package:playback_core/playback_core.dart';

mixin Media3ServerRebase implements ServerRebaseBackend {
  final _serverStall = StreamController<void>.broadcast();

  /// Calls the native `rebaseServer` and hands back what it answered.
  Future<int?> invokeRebaseServer(String from, String to);

  @override
  Stream<void> get serverStallStream => _serverStall.stream;

  /// The native side answers how many loads it cut once it redirected the
  /// stream (0 is a success), -1 when it redirected nothing: no stream, an
  /// address it can't read, no change, or a changed base path, and -2 when a
  /// load was still connecting to the old address and only a reopen helps.
  @override
  Future<bool> rebaseServer(String from, String to) async {
    final cut = await invokeRebaseServer(from, to);
    return cut != null && cut >= 0;
  }

  /// The native `serverStalled` event.
  void onServerStalled() => _serverStall.add(null);
}
