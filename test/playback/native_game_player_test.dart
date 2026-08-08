import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/native_game_player_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const controlChannel = MethodChannel('moonfin/native_game_control');

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(controlChannel, null);
  });

  test(
    'restart() propagates a restart_unavailable PlatformException to the caller',
    () async {
      // Mirrors the native side genuinely rejecting a restart for cores that
      // don't support it. Regression test for the bug where _invoke()'s
      // blanket `catch (_) {}` swallowed this before it could reach
      // native_game_player_screen's _restart() handler, making the "Restart
      // is not available for this core" message unreachable.
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(controlChannel, (call) async {
        if (call.method == 'restart') {
          throw PlatformException(code: 'restart_unavailable');
        }
        return null;
      });

      final player = NativeGamePlayerChannel();

      await expectLater(
        player.restart(),
        throwsA(
          isA<PlatformException>().having(
            (e) => e.code,
            'code',
            'restart_unavailable',
          ),
        ),
      );
    },
  );

  test(
    'lifecycle calls other than restart() swallow platform errors',
    () async {
      // start/pause/resume/stop are fire-and-forget with no error handler
      // downstream, so _invoke() must keep swallowing for them -- only
      // restart() was carved out.
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(controlChannel, (call) async {
        throw PlatformException(code: 'boom');
      });

      final player = NativeGamePlayerChannel();

      await expectLater(player.start(), completes);
      await expectLater(player.pause(), completes);
      await expectLater(player.resume(), completes);
      await expectLater(player.stop(), completes);
    },
  );
}
