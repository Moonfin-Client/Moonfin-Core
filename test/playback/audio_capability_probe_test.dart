import 'package:fake_async/fake_async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/audio_capability_probe.dart';
import 'package:moonfin/playback/audio_capability_profile.dart';
import 'package:moonfin/playback/device_capability_cache.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _events = MethodChannel('org.moonfin.androidtv/audioCapabilitiesEvents');

AudioCapabilityProfile _profile({
  AudioRouteType route = AudioRouteType.hdmi,
  bool passthroughAc3 = true,
  int maxPcmChannels = 8,
}) {
  return AudioCapabilityProfile.fromMap({
    'activeRouteType': route.name,
    'canPassthroughAc3': passthroughAc3,
    'canPassthroughEac3': passthroughAc3,
    'maxPcmChannels': maxPcmChannels,
  });
}

/// What the Fire TV reports while its HDMI sink is mid-renegotiation.
AudioCapabilityProfile _phantomSpeaker() => _profile(
  route: AudioRouteType.speaker,
  passthroughAc3: false,
  maxPcmChannels: 2,
);

String? _snapshotRoute() =>
    PlatformDetection.audioCapabilitiesSnapshot['activeRouteType'] as String?;

/// Reads the cached profile's route inside a fakeAsync zone, where the
/// in-memory store answers on microtasks.
String? _cachedRoute(FakeAsync async) {
  Map<String, dynamic>? cached;
  DeviceCapabilityCache.readMap(
    DeviceCapabilityCache.audioKey,
  ).then((value) => cached = value);
  async.flushMicrotasks();
  return cached?['activeRouteType'] as String?;
}

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
    SharedPreferences.setMockInitialValues({});
    PlatformDetection.setAudioCapabilities(null);
    AudioCapabilityProbe.resetForTesting();
  });

  tearDown(() {
    PlatformDetection.setAudioCapabilities(null);
    AudioCapabilityProbe.resetForTesting();
    debugDefaultTargetPlatformOverride = null;
  });

  group('looksEmpty', () {
    test('flags the unenumerated state regardless of channel count', () {
      // The not-yet-enumerated state reports eight channels, which is what
      // used to let it pass for a real answer.
      final unenumerated = _profile(
        route: AudioRouteType.other,
        passthroughAc3: false,
        maxPcmChannels: 8,
      );
      expect(AudioCapabilityProbe.looksEmpty(unenumerated), isTrue);
    });

    test('a real route is never empty, even downgraded to stereo', () {
      expect(AudioCapabilityProbe.looksEmpty(_phantomSpeaker()), isFalse);
    });

    test('passthrough on an unknown route counts as a real answer', () {
      final oddButCapable = _profile(
        route: AudioRouteType.other,
        passthroughAc3: true,
      );
      expect(AudioCapabilityProbe.looksEmpty(oddButCapable), isFalse);
    });
  });

  group('apply', () {
    test('a good result lands and persists for the next launch', () async {
      AudioCapabilityProbe.apply(_profile());

      expect(PlatformDetection.hasAudioCapabilities, isTrue);
      expect(PlatformDetection.supportsAc3Audio, isTrue);

      // The persistence write is fire and forget, so give it a beat.
      await Future<void>.delayed(const Duration(milliseconds: 20));
      final cached = await DeviceCapabilityCache.readMap(
        DeviceCapabilityCache.audioKey,
      );
      expect(cached, isNotNull);
      expect(cached!['canPassthroughAc3'], isTrue);
    });

    test('an unenumerated result never clobbers a good snapshot', () {
      AudioCapabilityProbe.apply(_profile());

      AudioCapabilityProbe.apply(
        _profile(route: AudioRouteType.other, passthroughAc3: false),
      );

      expect(PlatformDetection.supportsAc3Audio, isTrue);
      expect(_snapshotRoute(), AudioRouteType.hdmi.name);
    });

    test('a genuine downgrade with a real route lands after the window', () {
      fakeAsync((async) {
        AudioCapabilityProbe.apply(_profile());
        AudioCapabilityProbe.apply(_phantomSpeaker());

        expect(PlatformDetection.supportsAc3Audio, isTrue);
        expect(_snapshotRoute(), AudioRouteType.hdmi.name);

        async.elapse(AudioCapabilityProbe.settleWindow);

        expect(PlatformDetection.supportsAc3Audio, isFalse);
        expect(_snapshotRoute(), AudioRouteType.speaker.name);
        // A real unplug is still cached, so the next launch starts from it.
        expect(_cachedRoute(async), AudioRouteType.speaker.name);
      });
    });

    test('null keeps whatever was detected before', () {
      AudioCapabilityProbe.apply(_profile());
      AudioCapabilityProbe.apply(null);
      expect(PlatformDetection.supportsAc3Audio, isTrue);
    });

    test('the unenumerated state still applies when nothing better exists', () {
      // With no prior detection there is nothing to protect, and applying it
      // at least records what the hardware said instead of the fallback.
      AudioCapabilityProbe.apply(
        _profile(route: AudioRouteType.other, passthroughAc3: false),
      );
      expect(PlatformDetection.hasAudioCapabilities, isTrue);
    });
  });

  group('apply holds downgrades', () {
    test('a flap that heals inside the window never lands', () {
      fakeAsync((async) {
        AudioCapabilityProbe.apply(_profile());
        async.flushMicrotasks();

        AudioCapabilityProbe.apply(_phantomSpeaker());
        async.elapse(const Duration(seconds: 2));
        AudioCapabilityProbe.apply(_profile());

        async.elapse(AudioCapabilityProbe.settleWindow);
        expect(_snapshotRoute(), AudioRouteType.hdmi.name);
        expect(_cachedRoute(async), AudioRouteType.hdmi.name);
      });
    });

    test('the user asking for a re-detect lands on the spot', () {
      AudioCapabilityProbe.apply(_profile());
      AudioCapabilityProbe.apply(_phantomSpeaker(), immediate: true);

      expect(_snapshotRoute(), AudioRouteType.speaker.name);
    });

    test('a repeated downgrade never restarts the window', () {
      fakeAsync((async) {
        AudioCapabilityProbe.apply(_profile());

        // A route that keeps reporting the phantom speaker must not push a
        // genuine unplug out indefinitely.
        AudioCapabilityProbe.apply(_phantomSpeaker());
        async.elapse(const Duration(seconds: 4));
        AudioCapabilityProbe.apply(_phantomSpeaker());
        async.elapse(const Duration(seconds: 2));

        expect(_snapshotRoute(), AudioRouteType.speaker.name);
      });
    });

    test('an equal profile never arms the window', () {
      fakeAsync((async) {
        AudioCapabilityProbe.apply(_profile());
        AudioCapabilityProbe.apply(_profile());

        async.elapse(AudioCapabilityProbe.settleWindow);
        expect(_snapshotRoute(), AudioRouteType.hdmi.name);
      });
    });

    test('an upgrade while a downgrade is pending clears it', () {
      fakeAsync((async) {
        AudioCapabilityProbe.apply(
          _profile(route: AudioRouteType.arc, maxPcmChannels: 6),
        );
        AudioCapabilityProbe.apply(_phantomSpeaker());
        AudioCapabilityProbe.apply(_profile());

        expect(_snapshotRoute(), AudioRouteType.hdmi.name);
        async.elapse(AudioCapabilityProbe.settleWindow);
        expect(_snapshotRoute(), AudioRouteType.hdmi.name);
      });
    });

    test('the first detection lands at once even when it is stereo', () {
      AudioCapabilityProbe.apply(_phantomSpeaker());
      expect(_snapshotRoute(), AudioRouteType.speaker.name);
    });

    test('an unenumerated result leaves a pending downgrade alone', () {
      fakeAsync((async) {
        AudioCapabilityProbe.apply(_profile());
        AudioCapabilityProbe.apply(_phantomSpeaker());
        AudioCapabilityProbe.apply(
          _profile(route: AudioRouteType.other, passthroughAc3: false),
        );

        async.elapse(AudioCapabilityProbe.settleWindow);
        expect(_snapshotRoute(), AudioRouteType.speaker.name);
      });
    });

    test('route events subscribe once and are held the same way', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setTvMode(true);
      AudioCapabilityProbe.apply(_profile());

      final first = AudioCapabilityProbe.listenForRouteChanges();
      expect(AudioCapabilityProbe.listenForRouteChanges(), same(first));

      // The reported flap, end to end: the sink is reported gone and then
      // back a couple of seconds later.
      await _emit(_phantomSpeaker().toMap());
      expect(_snapshotRoute(), AudioRouteType.hdmi.name);

      await _emit(_profile().toMap());
      expect(_snapshotRoute(), AudioRouteType.hdmi.name);
    });
  });

  group('DeviceCapabilityCache', () {
    test('maps round-trip', () async {
      await DeviceCapabilityCache.writeMap('test_key', {
        'a': 1,
        'nested': {'b': true},
      });
      final read = await DeviceCapabilityCache.readMap('test_key');
      expect(read, {
        'a': 1,
        'nested': {'b': true},
      });
    });

    test('a build-keyed entry dies with its build', () async {
      await DeviceCapabilityCache.writeMap('test_key', {
        'hevc': true,
      }, build: 'firmware-1');

      expect(
        await DeviceCapabilityCache.readMap('test_key', build: 'firmware-1'),
        isNotNull,
      );
      expect(
        await DeviceCapabilityCache.readMap('test_key', build: 'firmware-2'),
        isNull,
        reason: 'a firmware update can change what the hardware decodes',
      );
    });

    test('string lists round-trip and remove clears both entries', () async {
      await DeviceCapabilityCache.writeStringList('hdr', ['HDR10', 'HLG']);
      expect(await DeviceCapabilityCache.readStringList('hdr'), [
        'HDR10',
        'HLG',
      ]);

      await DeviceCapabilityCache.remove('hdr');
      expect(await DeviceCapabilityCache.readStringList('hdr'), isNull);
    });
  });

  group('IEC carrier capability keys', () {
    test('parse from the platform map and round-trip through toMap', () {
      final profile = AudioCapabilityProfile.fromMap({
        'activeRouteType': 'hdmi',
        'canIecLow': true,
        'canIecMid': true,
        'canIecHbr': true,
      });

      expect(profile.canIecLow, isTrue);
      expect(profile.canIecMid, isTrue);
      expect(profile.canIecHbr, isTrue);
      expect(profile.canIecAc3, isTrue);
      expect(profile.canIecEac3, isTrue);
      expect(profile.canIecDts, isTrue);
      expect(profile.canIecDtsHd, isTrue);
      expect(profile.canIecTrueHd, isTrue);

      final roundTrip = AudioCapabilityProfile.fromMap(profile.toMap());
      expect(roundTrip.canIecLow, isTrue);
      expect(roundTrip.canIecMid, isTrue);
      expect(roundTrip.canIecHbr, isTrue);
    });

    test('absent keys default to false (stale cache safety)', () {
      final profile = AudioCapabilityProfile.fromMap({
        'activeRouteType': 'hdmi',
        'canPassthroughAc3': true,
      });

      expect(profile.canIecLow, isFalse);
      expect(profile.canIecMid, isFalse);
      expect(profile.canIecHbr, isFalse);
      expect(profile.canIecAc3, isFalse);
    });

    test('the HBR carrier only counts on HDMI or eARC routes', () {
      final arc = AudioCapabilityProfile.fromMap({
        'activeRouteType': 'arc',
        'canIecLow': true,
        'canIecHbr': true,
      });
      expect(arc.canIecHbr, isTrue);
      expect(arc.canIecTrueHd, isFalse);
      expect(arc.canIecDtsHd, isFalse);
      expect(arc.canIecAc3, isTrue);

      final earc = AudioCapabilityProfile.fromMap({
        'activeRouteType': 'earc',
        'canIecHbr': true,
      });
      expect(earc.canIecTrueHd, isTrue);
      expect(earc.canIecDtsHd, isTrue);
    });
  });
}
