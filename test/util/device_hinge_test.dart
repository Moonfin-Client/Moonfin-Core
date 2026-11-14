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

class _Probe extends StatefulWidget {
  const _Probe(this.log);

  final List<String> log;

  @override
  State<_Probe> createState() => _ProbeState();
}

class _ProbeState extends State<_Probe> with HingeAware {
  @override
  void didChangeHinge() => widget.log.add('hinge');

  @override
  Widget build(BuildContext context) {
    widget.log.add('build ${DeviceHinge.status.value.name}');
    return const SizedBox.shrink();
  }
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

  testWidgets('tells the state about a change before it rebuilds', (
    tester,
  ) async {
    final log = <String>[];
    await tester.pumpWidget(_Probe(log));
    DeviceHinge.debugStatus = HingeStatus.partiallyOpen;
    await tester.pump();
    expect(log, ['build unknown', 'hinge', 'build partiallyOpen']);

    await tester.pumpWidget(const SizedBox.shrink());
    DeviceHinge.debugStatus = HingeStatus.closed;
    expect(log, hasLength(3));
  });

  test('a closed folding phone is not a tablet sized screen', () {
    expect(PlatformDetection.hasTabletSizedScreen(const Size(466, 678)), false);
    expect(PlatformDetection.hasTabletSizedScreen(const Size(678, 466)), false);
    expect(PlatformDetection.hasTabletSizedScreen(const Size(669, 951)), true);
    expect(PlatformDetection.hasTabletSizedScreen(const Size(951, 669)), true);
  });
}
