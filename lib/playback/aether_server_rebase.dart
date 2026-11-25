// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// AetherEngine (iOS, tvOS, macOS) notices a dead connection at once and
// starts reconnecting to the same address, which never answers again once
// the server moved. This reports that moment as a stall, so the app asks the
// entry address right away instead of waiting for a later request to fail.
// The engine can't move an open stream to another address, so a move found
// reopens it at the current position. Mixed into [AetherBackend] with one
// `with`, and fed by one line in its engine log handling.
import 'dart:async';

import 'package:playback_core/playback_core.dart';

mixin AetherServerRebase implements ServerRebaseBackend {
  final _serverStall = StreamController<void>.broadcast();

  @override
  Stream<void> get serverStallStream => _serverStall.stream;

  /// The engine reads its source from one fixed address: a move is followed
  /// by reopening the stream.
  @override
  Future<bool> rebaseServer(String from, String to) async => false;

  /// A line of the engine log. The source reader going from flowing to
  /// reconnecting means its server stopped answering.
  void onEngineLine(dynamic line) {
    if (line is! String) return;
    if (isSourceReconnectLine(line)) _serverStall.add(null);
  }

  static bool isSourceReconnectLine(String line) =>
      line.contains('source network axis') && line.endsWith('-> reconnecting');
}
