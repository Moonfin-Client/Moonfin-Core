import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/device_capability_cache.dart';
import 'package:moonfin/playback/display_hdr_probe.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _platform = MethodChannel('org.moonfin.androidtv/platform');
const _events = MethodChannel(
  'org.moonfin.androidtv/displayCapabilitiesEvents',
);

/// The facts a Dolby Vision TV that is awake and identified reports.
Map<String, dynamic> _attachedDolbyVision({String trigger = 'pull'}) => {
  'trigger': trigger,
  'sdkInt': 34,
  'present': true,
  'valid': true,
  'state': 'on',
  'answered': true,
  'types': <String>['DOLBY_VISION', 'HDR10'],
  'reportsHdr': true,
  'supportedModeCount': 12,
  'sinkId': 'a1b2c3d4',
  'sinkConnection': 'transitive',
  'displayCount': 1,
};

/// The reported device's state: powered on and answering, but nothing is
/// really attached, so the sink never identifies itself.
Map<String, dynamic> _sleepingChain({String trigger = 'pull'}) => {
  'trigger': trigger,
  'sdkInt': 34,
  'present': true,
  'valid': true,
  'state': 'on',
  'answered': true,
  'types': <String>[],
  'reportsHdr': false,
  'supportedModeCount': 1,
  'sinkId': null,
  'sinkConnection': null,
  'displayCount': 1,
};

/// A real SDR panel: attached, identified, and it named no HDR format.
Map<String, dynamic> _attachedSdr() => {
  ..._sleepingChain(),
  'supportedModeCount': 8,
  'sinkId': 'deadbeef',
  'sinkConnection': 'direct',
};

Future<void> _emit(Map<String, dynamic> payload) {
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        _events.name,
        const StandardMethodCodec().encodeSuccessEnvelope(payload),
        (_) {},
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
    PlatformDetection.setDisplayHdrTypes(null);
    SharedPreferences.setMockInitialValues(<String, Object>{});
    DisplayHdrProbe.resetForTesting();
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    PlatformDetection.setDisplayHdrTypes(null);
    DisplayHdrProbe.resetForTesting();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_platform, null);
  });

  group('verdict', () {
    test('a display that names formats is believed on the spot', () {
      final snapshot = DisplayHdrSnapshot.fromMap(_attachedDolbyVision());
      expect(snapshot.verdict, DisplayHdrVerdict.reportsHdr);
    });

    test('the reported sleeping chain concludes nothing', () {
      // Powered on and answering, which is exactly why display state alone
      // was never enough to tell this apart from a real SDR panel.
      final snapshot = DisplayHdrSnapshot.fromMap(_sleepingChain());
      expect(snapshot.sinkEnumerated, isFalse);
      expect(snapshot.verdict, DisplayHdrVerdict.cannotAnswer);
    });

    test('an attached identified panel with no HDR is proven SDR', () {
      final snapshot = DisplayHdrSnapshot.fromMap(_attachedSdr());
      expect(snapshot.verdict, DisplayHdrVerdict.provenSdr);
    });

    test('a display that never returned an array concludes nothing', () {
      final snapshot = DisplayHdrSnapshot.fromMap({
        ..._attachedSdr(),
        'answered': false,
      });
      expect(snapshot.verdict, DisplayHdrVerdict.cannotAnswer);
    });

    test('a powered off display concludes nothing', () {
      final snapshot = DisplayHdrSnapshot.fromMap({
        ..._attachedSdr(),
        'state': 'off',
      });
      expect(snapshot.verdict, DisplayHdrVerdict.cannotAnswer);
    });

    test('below api 31 the mode list stands in for EDID identity', () {
      final placeholder = DisplayHdrSnapshot.fromMap({
        ..._sleepingChain(),
        'sdkInt': 29,
      });
      expect(placeholder.verdict, DisplayHdrVerdict.cannotAnswer);

      final real = DisplayHdrSnapshot.fromMap({
        ..._sleepingChain(),
        'sdkInt': 29,
        'supportedModeCount': 6,
      });
      expect(real.verdict, DisplayHdrVerdict.provenSdr);
    });

    test('a types-only reply can raise but never prove SDR', () {
      expect(
        DisplayHdrSnapshot.fromTypes(const ['HDR10']).verdict,
        DisplayHdrVerdict.reportsHdr,
      );
      expect(
        DisplayHdrSnapshot.fromTypes(const []).verdict,
        DisplayHdrVerdict.cannotAnswer,
      );
    });
  });

  group('apply', () {
    test('a sleeping chain never clobbers what was already detected', () async {
      PlatformDetection.setDisplayHdrTypes(const ['DOLBY_VISION', 'HDR10']);
      DisplayHdrProbe.apply(DisplayHdrSnapshot.fromMap(_sleepingChain()));
      expect(PlatformDetection.supportsDolbyVision, isTrue);
      expect(PlatformDetection.supportsAnyHdr, isTrue);
    });

    test('a null result leaves the last detection alone', () {
      PlatformDetection.setDisplayHdrTypes(const ['DOLBY_VISION']);
      DisplayHdrProbe.apply(null);
      expect(PlatformDetection.supportsDolbyVision, isTrue);
    });

    test('a proven SDR panel is recorded, not just forgotten', () async {
      PlatformDetection.setDisplayHdrTypes(const ['DOLBY_VISION']);
      DisplayHdrProbe.apply(DisplayHdrSnapshot.fromMap(_attachedSdr()));
      expect(PlatformDetection.supportsDolbyVision, isFalse);
      expect(PlatformDetection.hasDisplayHdrCapabilities, isTrue);

      // Recorded as an empty answer rather than a removed key, so the next
      // launch knows this display was asked and said no.
      await Future<void>.delayed(Duration.zero);
      expect(await DisplayHdrProbe.seedFromCache(), isEmpty);
    });

    test('a display that names formats is persisted', () async {
      DisplayHdrProbe.apply(DisplayHdrSnapshot.fromMap(_attachedDolbyVision()));
      await Future<void>.delayed(Duration.zero);
      expect(
        await DisplayHdrProbe.seedFromCache(),
        containsAll(<String>['DOLBY_VISION', 'HDR10']),
      );
      // Mirrored to the old key so a downgrade still finds it.
      expect(
        await DeviceCapabilityCache.readStringList(
          DeviceCapabilityCache.displayHdrKey,
        ),
        isNotEmpty,
      );
    });
  });

  group('seedFromCache', () {
    test('never probed reads as null, not as an SDR panel', () async {
      expect(await DisplayHdrProbe.seedFromCache(), isNull);
    });

    test('an empty legacy list is not mistaken for a proven answer', () async {
      // The build that wrote that key couldn't record an SDR verdict, so an
      // empty list there only ever meant "nothing detected yet".
      await DeviceCapabilityCache.writeStringList(
        DeviceCapabilityCache.displayHdrKey,
        const <String>[],
      );
      expect(await DisplayHdrProbe.seedFromCache(), isNull);
    });

    test('a legacy list still seeds when no record exists', () async {
      await DeviceCapabilityCache.writeStringList(
        DeviceCapabilityCache.displayHdrKey,
        const <String>['HDR10'],
      );
      expect(await DisplayHdrProbe.seedFromCache(), <String>['HDR10']);
    });
  });

  group('queryWithRetry', () {
    test('stops as soon as an attempt concludes something', () async {
      var calls = 0;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_platform, (call) async {
            if (call.method != 'displayCapabilities') return null;
            calls += 1;
            return calls < 3 ? _sleepingChain() : _attachedDolbyVision();
          });

      final snapshot = await DisplayHdrProbe.queryWithRetry(
        sleep: (_) async {},
      );
      expect(calls, 3);
      expect(snapshot?.verdict, DisplayHdrVerdict.reportsHdr);
    });

    test(
      'a chain that never wakes concludes nothing after every try',
      () async {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(_platform, (call) async {
              return call.method == 'displayCapabilities'
                  ? _sleepingChain()
                  : null;
            });

        PlatformDetection.setDisplayHdrTypes(const ['DOLBY_VISION']);
        final snapshot = await DisplayHdrProbe.queryWithRetry(
          sleep: (_) async {},
        );
        expect(snapshot?.verdict, DisplayHdrVerdict.cannotAnswer);

        DisplayHdrProbe.apply(snapshot);
        expect(PlatformDetection.supportsDolbyVision, isTrue);
      },
    );
  });

  test('an old native side falls back to the types list', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_platform, (call) async {
          if (call.method == 'displayCapabilities') {
            throw MissingPluginException('no such method');
          }
          return call.method == 'displayHdrTypes'
              ? <String>['DOLBY_VISION']
              : null;
        });

    final snapshot = await DisplayHdrProbe.query();
    expect(snapshot?.verdict, DisplayHdrVerdict.reportsHdr);
    expect(snapshot?.types, <String>['DOLBY_VISION']);
  });

  test('a display event restores capabilities without a restart', () async {
    // The reported failure, end to end: the launch probe sees a sleeping
    // chain, then the TV wakes an hour later and pushes an event.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_platform, (call) async {
          return call.method == 'displayCapabilities' ? _sleepingChain() : null;
        });

    DisplayHdrProbe.apply(await DisplayHdrProbe.query(trigger: 'launch'));
    expect(PlatformDetection.supportsDolbyVision, isFalse);

    DisplayHdrProbe.listenForDisplayChanges();
    await _emit(_attachedDolbyVision(trigger: 'changed'));

    expect(PlatformDetection.supportsDolbyVision, isTrue);
    expect(PlatformDetection.supportsHdr10, isTrue);
  });
}
