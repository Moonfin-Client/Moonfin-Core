import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/mpv_player_registry.dart';

void main() {
  late MpvPlayerRegistry registry;
  setUp(() => registry = MpvPlayerRegistry.instance);
  tearDown(() => registry.disposeAll());

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
}
