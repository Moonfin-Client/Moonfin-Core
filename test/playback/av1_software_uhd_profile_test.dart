import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _control = MethodChannel('moonfin/ios_aether_control');
const _events = MethodChannel('moonfin/ios_aether_events');

Iterable<Map<dynamic, dynamic>> _av1Conditions(Map<String, dynamic> profile) =>
    (profile['CodecProfiles'] as List<dynamic>)
        .cast<Map<dynamic, dynamic>>()
        .where(
          (p) =>
              p['Type'] == 'Video' &&
              p['Codec'].toString().split(',').contains('av1'),
        )
        .expand((p) => (p['Conditions'] as List<dynamic>).cast());

String? _av1MaxWidth(Map<String, dynamic> profile) => _av1Conditions(profile)
    .where((c) => c['Property'] == 'Width' && c['Condition'] == 'LessThanEqual')
    .firstOrNull?['Value']
    ?.toString();

bool _av1BlocksHdr10(Map<String, dynamic> profile) => _av1Conditions(profile)
    .where(
      (c) => c['Property'] == 'VideoRangeType' && c['Condition'] == 'NotEquals',
    )
    .any((c) => c['Value'].toString().split('|').contains('HDR10'));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late AetherBackend backend;

  setUp(() async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    PlatformDetection.setMediaCodecCapabilities({
      'supportsAv1': true,
      'supportsAv1Main10': true,
      'supportsAv1Hdr10': false,
      'supportsHevcHdr10': true,
      'maxResolutionAv1': {'width': 1920, 'height': 1080},
    });
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(_control, (_) async => null);
    messenger.setMockMethodCallHandler(_events, (_) async => null);
    prefs = UserPreferences(store);
    backend = AetherBackend(prefs);
  });

  tearDown(() {
    backend.dispose();
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(_control, null);
    messenger.setMockMethodCallHandler(_events, null);
    PlatformDetection.setMediaCodecCapabilities(null);
    debugDefaultTargetPlatformOverride = null;
  });

  test(
    'the software AV1 setting lifts the 1080p SDR cap only when on',
    () async {
      expect(PlatformDetection.offersAv1SoftwareUhd, isTrue);
      final off = backend.getDeviceProfile();
      expect(_av1MaxWidth(off), '1920');
      expect(_av1BlocksHdr10(off), isTrue);

      await prefs.set(UserPreferences.av1SoftwareUhdDirectPlay, true);
      final on = backend.getDeviceProfile();
      expect(_av1MaxWidth(on), '3840');
      expect(_av1BlocksHdr10(on), isFalse);
    },
  );

  test('devices that already decode 4K AV1 never see the setting', () {
    PlatformDetection.setMediaCodecCapabilities({
      'supportsAv1': true,
      'maxResolutionAv1': {'width': 3840, 'height': 2160},
    });
    expect(PlatformDetection.offersAv1SoftwareUhd, isFalse);
  });
}
