import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/device_hinge.dart';
import 'package:moonfin/util/platform_detection.dart';

const _channel = MethodChannel('com.moonfin/hinge');

Future<void> _nativeSends(String status) {
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        _channel.name,
        _channel.codec.encodeMethodCall(MethodCall('statusChanged', status)),
        (_) {},
      );
}

Future<double?> _foldY(WidgetTester tester, Size size) async {
  double? fold;
  await tester.pumpWidget(
    MediaQuery(
      data: MediaQueryData(size: size),
      child: Builder(
        builder: (context) {
          fold = DeviceHinge.laptopFoldY(context);
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  return fold;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    DeviceHinge.debugStatus = HingeStatus.unknown;
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_channel, null);
  });

  test('takes the status the runner holds, then each change', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          _channel,
          (call) async => call.method == 'getStatus' ? 'fullyOpen' : null,
        );

    DeviceHinge.init();
    await Future<void>.delayed(Duration.zero);
    expect(DeviceHinge.status.value, HingeStatus.fullyOpen);

    await _nativeSends('partiallyOpen');
    expect(DeviceHinge.status.value, HingeStatus.partiallyOpen);

    // A name this build doesn't know is no reason to keep the last posture.
    await _nativeSends('sideways');
    expect(DeviceHinge.status.value, HingeStatus.unknown);
  });

  testWidgets('finds the fold only half open and upright', (tester) async {
    const upright = Size(669, 951);
    const onItsSide = Size(951, 669);

    DeviceHinge.debugStatus = HingeStatus.partiallyOpen;
    expect(await _foldY(tester, upright), 475.5);
    expect(await _foldY(tester, onItsSide), isNull);

    DeviceHinge.debugStatus = HingeStatus.fullyOpen;
    expect(await _foldY(tester, upright), isNull);
  });

  test('a closed folding phone is not a tablet sized screen', () {
    expect(PlatformDetection.hasTabletSizedScreen(const Size(466, 678)), false);
    expect(PlatformDetection.hasTabletSizedScreen(const Size(678, 466)), false);
    expect(PlatformDetection.hasTabletSizedScreen(const Size(669, 951)), true);
    expect(PlatformDetection.hasTabletSizedScreen(const Size(951, 669)), true);
  });
}
