// The tier reaches the app through these two resolvers, so this covers the
// wiring the pure tests in test/util/device_performance_test.dart cannot see:
// that the preference pins the tier, and that a held-back device keeps the
// still image even with the trailer switch left on.
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/device_performance.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const smallDevice = {'totalMem': 900000000};
  const largeDevice = {'totalMem': 4294967296};

  tearDown(() => PlatformDetection.setDeviceMemory(null));

  test('a device nobody measured is left on the standard tier', () async {
    final prefs = await _prefs();

    expect(
      prefs.resolveDevicePerformanceTier(),
      DevicePerformanceTier.standard,
    );
  });

  test('auto follows a device that reports little memory', () async {
    PlatformDetection.setDeviceMemory(smallDevice);
    final prefs = await _prefs();

    expect(prefs.resolveDevicePerformanceTier(), DevicePerformanceTier.reduced);
  });

  test('the user can pin a small device back to standard', () async {
    PlatformDetection.setDeviceMemory(smallDevice);
    final prefs = await _prefs({
      'pref_performance_mode': DevicePerformanceMode.standard.name,
    });

    expect(
      prefs.resolveDevicePerformanceTier(),
      DevicePerformanceTier.standard,
    );
  });

  test('the user can pin a large device down to reduced', () async {
    PlatformDetection.setDeviceMemory(largeDevice);
    final prefs = await _prefs({
      'pref_performance_mode': DevicePerformanceMode.reduced.name,
    });

    expect(prefs.resolveDevicePerformanceTier(), DevicePerformanceTier.reduced);
  });

  test('trailers are off until the user turns them on', () async {
    PlatformDetection.setDeviceMemory(largeDevice);
    final prefs = await _prefs();

    expect(prefs.resolveMediaBarTrailerPreview(), isFalse);
  });

  test('trailers stay on where the device can afford them', () async {
    PlatformDetection.setDeviceMemory(largeDevice);
    final prefs = await _prefs({'mediaBarTrailerPreview': true});

    expect(prefs.resolveMediaBarTrailerPreview(), isTrue);
  });

  test('a held-back device keeps the still image', () async {
    PlatformDetection.setDeviceMemory(smallDevice);
    final prefs = await _prefs({'mediaBarTrailerPreview': true});

    // The switch itself is untouched, so turning Performance back to Standard
    // restores trailers without the user hunting for a second setting.
    expect(prefs.get(UserPreferences.mediaBarTrailerPreview), isTrue);
    expect(prefs.resolveMediaBarTrailerPreview(), isFalse);
  });

  test('pinning standard gives a small device its trailers back', () async {
    PlatformDetection.setDeviceMemory(smallDevice);
    final prefs = await _prefs({
      'pref_performance_mode': DevicePerformanceMode.standard.name,
      'mediaBarTrailerPreview': true,
    });

    expect(prefs.resolveMediaBarTrailerPreview(), isTrue);
  });

  test('the trailer switch still wins when it is off', () async {
    PlatformDetection.setDeviceMemory(largeDevice);
    final prefs = await _prefs({'mediaBarTrailerPreview': false});

    expect(prefs.resolveMediaBarTrailerPreview(), isFalse);
  });

  // Reading the tier must never need a server or a signed-in user, because it
  // is resolved before either exists. A scoped key would be written by the
  // settings screen and then never read at startup, so the override would look
  // like it saved and do nothing.
  test('the mode is not stored per server and user', () async {
    final prefs = await _prefs({
      'pref_last_server_id': 'server-1',
      'pref_last_user_id': 'user-1',
    });

    // The control: a preference that really is scoped moves its key once a
    // server and user are known, which is what must not happen to this one.
    expect(
      prefs.getEffectivePreference(UserPreferences.mediaBarTrailerPreview).key,
      isNot(UserPreferences.mediaBarTrailerPreview.key),
    );
    expect(
      prefs.getEffectivePreference(UserPreferences.performanceMode).key,
      UserPreferences.performanceMode.key,
    );
  });
}
