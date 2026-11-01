import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/mpv_player_registry.dart';
import 'package:moonfin/util/app_exit.dart';

void main() {
  late MpvPlayerRegistry registry;
  setUp(() => registry = MpvPlayerRegistry.forTest());

  test('disposeAll disposes every registered player once', () async {
    final disposed = <String>[];
    registry.register(Object(), () async => disposed.add('a'));
    registry.register(Object(), () async => disposed.add('b'));

    await registry.disposeAll();
    await registry.disposeAll();

    expect(disposed, unorderedEquals(['a', 'b']));
    expect(registry.liveCount, 0);
  });

  test('disposeAll survives a player that throws or never finishes', () async {
    final disposed = <String>[];
    registry.register(Object(), () async => throw StateError('already disposed'));
    registry.register(Object(), () => Future<void>.delayed(const Duration(days: 1)));
    registry.register(Object(), () async => disposed.add('ok'));

    await registry.disposeAll();

    expect(disposed, ['ok']);
  });

  test('an owner stays tracked while its dispose is in flight', () async {
    final gate = Completer<void>();
    var calls = 0;
    final owner = Object();
    registry.register(owner, () {
      calls++;
      return gate.future;
    });

    final first = registry.release(owner);
    expect(registry.liveCount, 1);

    final all = registry.disposeAll();
    var allDone = false;
    unawaited(all.then((_) => allDone = true));
    await Future<void>.delayed(Duration.zero);
    expect(allDone, isFalse);

    gate.complete();
    await Future.wait([first, all]);

    expect(calls, 1);
    expect(registry.liveCount, 0);
  });

  test('prepareForExit gives every caller the same cleanup future', () {
    expect(identical(AppExit.prepareForExit(), AppExit.prepareForExit()), isTrue);
  });
}
