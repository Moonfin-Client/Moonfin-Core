// Entry redirect (portnook fork): tests for aether_server_rebase.dart.
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/aether_server_rebase.dart';

class _Backend with AetherServerRebase {}

void main() {
  test('the source reader starting to reconnect counts as a stall', () async {
    final backend = _Backend();
    var stalls = 0;
    backend.serverStallStream.listen((_) => stalls++);

    backend.onEngineLine(
      '[AetherEngine] source network axis flowing -> reconnecting',
    );
    backend.onEngineLine('[AVIOReader] pump stall at offset 1, reconnecting');
    backend.onEngineLine(
      '[AetherEngine] source network axis reconnecting -> flowing',
    );
    backend.onEngineLine(null);
    await Future<void>.delayed(Duration.zero);

    expect(stalls, 1);
  });

  test('a move is followed by reopening the stream', () async {
    expect(await _Backend().rebaseServer('http://a:1', 'http://a:2'), isFalse);
  });
}
