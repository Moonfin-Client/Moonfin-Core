import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/auto_hdr_switcher.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('moonfin/hdr_display');
  late Object? hdrState;
  late List<MethodCall> calls;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    calls = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          return switch (call.method) {
            'getHdrState' => hdrState,
            'setHdrEnabled' => true,
            _ => null,
          };
        });
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('displayHdrState', () {
    test('reads the display mode the runner reports', () async {
      hdrState = {'supported': true, 'enabled': true};
      expect(await AutoHdrSwitcher.displayHdrState(), isTrue);

      hdrState = {'supported': true, 'enabled': false};
      expect(await AutoHdrSwitcher.displayHdrState(), isFalse);
    });

    test('a display the runner could not read is unknown, not SDR', () async {
      // The runner answers with nothing when the query failed, so the native
      // path holds its last answer instead of switching passthrough off.
      hdrState = null;
      expect(await AutoHdrSwitcher.displayHdrState(), isNull);
    });
  });

  test('an unreadable display is never switched', () async {
    hdrState = null;
    final switched = await AutoHdrSwitcher().sync(
      behavior: AutoHdrSwitchingBehavior.always,
      isHdrContent: true,
      isDesktopFullscreen: true,
    );

    expect(switched, isFalse);
    expect(calls.map((c) => c.method), ['getHdrState']);
  });
}
