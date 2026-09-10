import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/platform_detection.dart';

void main() {
  tearDown(() => PlatformDetection.setDisplayHdrTypes(null));

  test('never asked and asked-but-SDR are different states', () {
    PlatformDetection.setDisplayHdrTypes(null);
    expect(PlatformDetection.hasDisplayHdrCapabilities, isFalse);
    expect(PlatformDetection.supportsAnyHdr, isFalse);

    // Same HDR answer, but this display was actually asked. Without the
    // distinction a probe that couldn't reach the display is indistinguishable
    // from a panel that reported no HDR.
    PlatformDetection.setDisplayHdrTypes(const <String>[]);
    expect(PlatformDetection.hasDisplayHdrCapabilities, isTrue);
    expect(PlatformDetection.supportsAnyHdr, isFalse);
  });

  test('types are normalised and reported', () {
    PlatformDetection.setDisplayHdrTypes(const [
      ' dolby_vision ',
      'hdr10_plus',
      '',
    ]);
    expect(PlatformDetection.supportsDolbyVision, isTrue);
    expect(PlatformDetection.supportsHdr10PlusDisplay, isTrue);
    expect(PlatformDetection.supportsHdr10, isTrue);
    expect(
      PlatformDetection.displayHdrTypesSnapshot,
      containsAll(<String>['DOLBY_VISION', 'HDR10_PLUS']),
    );
    expect(PlatformDetection.displayHdrTypesSnapshot, hasLength(2));
  });

  test('setting new types replaces the old ones', () {
    PlatformDetection.setDisplayHdrTypes(const ['DOLBY_VISION']);
    PlatformDetection.setDisplayHdrTypes(const ['HDR10']);
    expect(PlatformDetection.supportsDolbyVision, isFalse);
    expect(PlatformDetection.supportsHdr10, isTrue);
  });
}
