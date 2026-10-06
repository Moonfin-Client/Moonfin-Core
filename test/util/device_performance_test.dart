// A probe that cannot answer must never cost a healthy device a feature, so
// everything except a clear "this device is small" resolves to the standard
// tier the app has always used.
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/device_performance.dart';

void main() {
  group('deviceMemoryLooksLow', () {
    test('a device under the ceiling is low', () {
      expect(
        deviceMemoryLooksLow({'totalMem': lowMemoryCeilingBytes - 1}),
        isTrue,
      );
    });

    test('a device on the ceiling is not', () {
      expect(
        deviceMemoryLooksLow({'totalMem': lowMemoryCeilingBytes}),
        isFalse,
      );
    });

    // Real reported totals, so moving the ceiling has to answer for the
    // devices it starts or stops catching.
    test('catches the 1GB panels and nothing above them', () {
      for (final low in [
        916000000, // the Telefunken in the report
        1073741824, // a nominal 1GB device that reserved nothing
      ]) {
        expect(deviceMemoryLooksLow({'totalMem': low}), isTrue, reason: '$low');
      }
      for (final fine in [
        1395864371, // Chromecast HD, 1.5GB
        1879048192, // onn 4K, 2GB
        3006477107, // Shield, 3GB
        8589934592, // a phone
      ]) {
        expect(
          deviceMemoryLooksLow({'totalMem': fine}),
          isFalse,
          reason: '$fine',
        );
      }
    });

    test('the low ram flag is enough on its own', () {
      expect(
        deviceMemoryLooksLow({'totalMem': 4294967296, 'lowRam': true}),
        isTrue,
      );
    });

    test('the low ram flag being absent or false decides nothing', () {
      expect(deviceMemoryLooksLow({'totalMem': 4294967296}), isFalse);
      expect(
        deviceMemoryLooksLow({'totalMem': 4294967296, 'lowRam': false}),
        isFalse,
      );
    });

    test('an answer that never came reads as not low', () {
      expect(deviceMemoryLooksLow(const {}), isFalse);
      expect(deviceMemoryLooksLow({'lowRam': null}), isFalse);
    });

    test('a nonsense answer reads as not low', () {
      expect(deviceMemoryLooksLow({'totalMem': 0}), isFalse);
      expect(deviceMemoryLooksLow({'totalMem': '900000000'}), isFalse);
      expect(deviceMemoryLooksLow({'totalMem': null}), isFalse);
      // What a 3GB device reads back if anyone narrows the wire type to 32 bit.
      expect(deviceMemoryLooksLow({'totalMem': -1073741824}), isFalse);
    });
  });

  group('resolveDevicePerformanceTier', () {
    const small = {'totalMem': 900000000};
    const large = {'totalMem': 4294967296};

    test('auto follows the device', () {
      expect(
        resolveDevicePerformanceTierFor(DevicePerformanceMode.auto, small),
        DevicePerformanceTier.reduced,
      );
      expect(
        resolveDevicePerformanceTierFor(DevicePerformanceMode.auto, large),
        DevicePerformanceTier.standard,
      );
    });

    test('a pinned mode ignores the device either way', () {
      expect(
        resolveDevicePerformanceTierFor(DevicePerformanceMode.standard, small),
        DevicePerformanceTier.standard,
      );
      expect(
        resolveDevicePerformanceTierFor(DevicePerformanceMode.reduced, large),
        DevicePerformanceTier.reduced,
      );
    });

    test('no probe at all lands on standard', () {
      expect(
        resolveDevicePerformanceTierFor(DevicePerformanceMode.auto, const {}),
        DevicePerformanceTier.standard,
      );
    });
  });

  group('imageCacheBytesFor', () {
    // Every platform keeps the exact budget it has today on the standard tier.
    test('standard hands back what it was given', () {
      for (final bytes in [96 << 20, 120 << 20, 256 << 20]) {
        expect(
          imageCacheBytesFor(DevicePerformanceTier.standard, bytes),
          bytes,
        );
      }
    });

    test('reduced lowers it and never raises it', () {
      for (final bytes in [96 << 20, 120 << 20, 256 << 20]) {
        expect(
          imageCacheBytesFor(DevicePerformanceTier.reduced, bytes),
          lessThan(bytes),
        );
      }
    });

    test('reduced still leaves room for more than a screenful', () {
      // Nothing caches at all below a few megabytes, which trades the crash
      // for a device that re-decodes forever.
      expect(
        imageCacheBytesFor(DevicePerformanceTier.reduced, 96 << 20),
        greaterThan(16 << 20),
      );
    });
  });

  group('inlinePreviewAllowed', () {
    test('plays when the user asked and the device can afford it', () {
      expect(
        inlinePreviewAllowed(
          userEnabled: true,
          tier: DevicePerformanceTier.standard,
        ),
        isTrue,
      );
    });

    test('stays off on a device that cannot afford the decoder', () {
      expect(
        inlinePreviewAllowed(
          userEnabled: true,
          tier: DevicePerformanceTier.reduced,
        ),
        isFalse,
      );
    });

    test('the user turning it off wins at either tier', () {
      for (final tier in DevicePerformanceTier.values) {
        expect(inlinePreviewAllowed(userEnabled: false, tier: tier), isFalse);
      }
    });
  });

  group('skiaCacheCapFor', () {
    test('a 4K UI gets the budget a 1080p screen has', () {
      expect(skiaCacheCapFor(3840 * 2160), skiaCacheBytesAt1080p);
      expect(skiaCacheCapFor(2560 * 1440), skiaCacheBytesAt1080p);
    });

    test('1080p and smaller keep the engine budget', () {
      expect(skiaCacheCapFor(1920 * 1080), isNull);
      expect(skiaCacheCapFor(1280 * 720), isNull);
    });
  });
}
