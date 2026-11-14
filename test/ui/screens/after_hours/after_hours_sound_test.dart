import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_game.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_sound.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Apple plays the arcade through the native sound channel', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('moonfin/arcade_sound'), (
          call,
        ) async {
          calls.add(call);
          return call.method == 'load' ? true : null;
        });

    final sound = AfterHoursSound.instance..acquire();
    await pumpEventQueue();
    final loaded = calls.where((c) => c.method == 'load').toList();
    expect(loaded, hasLength(ArcadeSound.values.length));
    expect((loaded.first.arguments as Map)['data'], isA<Uint8List>());

    sound.play(ArcadeSound.jump);
    sound.music(true);
    await pumpEventQueue();
    expect(
      calls.map((c) => '${c.method} ${(c.arguments as Map)['id']}'),
      containsAllInOrder(['play jump', 'load music', 'resume music']),
    );

    sound.release();
    await pumpEventQueue();
    expect(calls.last.method, 'unload');
    expect((calls.last.arguments as Map)['id'], 'music');
  });
}
