import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:media_kit/media_kit.dart';
import 'package:moonfin/playback/mpv_player_registry.dart';
import 'package:moonfin/util/app_exit.dart';

class _FakePlayer extends Fake implements Player {
  _FakePlayer(this._dispose);

  final Future<void> Function() _dispose;
  int disposeCalls = 0;

  @override
  Future<void> dispose() {
    disposeCalls++;
    return _dispose();
  }
}

void main() {
  late MpvPlayerRegistry registry;
  setUp(() => registry = MpvPlayerRegistry());

  _FakePlayer track(Future<void> Function() dispose) =>
      registry.track(_FakePlayer(dispose)) as _FakePlayer;

  test('disposeAll disposes every tracked player once', () async {
    final a = track(() async {});
    final b = track(() async {});

    await registry.disposeAll();
    await registry.disposeAll();

    expect(a.disposeCalls, 1);
    expect(b.disposeCalls, 1);
  });

  test('disposeAll survives a player that throws or never finishes', () async {
    track(() async => throw StateError('already disposed'));
    track(() => Future<void>.delayed(const Duration(days: 1)));
    final ok = track(() async {});

    await registry.disposeAll();

    expect(ok.disposeCalls, 1);
  });

  test('disposeAll waits for a dispose already in flight', () async {
    final gate = Completer<void>();
    final player = track(() => gate.future);

    final first = registry.dispose(player);
    final all = registry.disposeAll();
    var allDone = false;
    unawaited(all.then((_) => allDone = true));
    await Future<void>.delayed(Duration.zero);
    expect(allDone, isFalse);

    gate.complete();
    await Future.wait([first, all]);

    expect(player.disposeCalls, 1);
  });

  test('disposing a player again after exit released it does nothing', () async {
    final player = track(() async {});

    await registry.disposeAll();
    await registry.dispose(player);

    expect(player.disposeCalls, 1);
  });

  test('creating a player after shutdown starts is rejected', () async {
    await registry.disposeAll();

    expect(() => registry.create(), throwsStateError);
  });

  test('prepareForExit gives every caller the same cleanup future', () {
    expect(identical(AppExit.prepareForExit(), AppExit.prepareForExit()), isTrue);
  });
}
