import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/hdr_stream_capability.dart';
import 'package:moonfin/util/platform_detection.dart';

/// The one question both Android TV Dolby Vision gates share: does playing a
/// stream with its Dolby Vision metadata ignored lose anything.
void main() {
  Map<String, dynamic> video(String rangeType, {String codec = 'hevc'}) => {
    'Type': 'Video',
    'Codec': codec,
    'VideoRangeType': rangeType,
  };

  // What Emby sends: no VideoRangeType, the range typed in ExtendedVideoType,
  // the profile in ExtendedVideoSubType, and VideoRange derived from them.
  Map<String, dynamic> embyVideo(
    String subType, {
    String extendedType = 'DolbyVision',
    String videoRange = 'DolbyVision',
    String codec = 'hevc',
  }) => {
    'Type': 'Video',
    'Codec': codec,
    'ExtendedVideoType': extendedType,
    'ExtendedVideoSubType': subType,
    'VideoRange': videoRange,
  };

  setUp(() {
    PlatformDetection.setDisplayHdrTypes(const ['HDR10']);
    PlatformDetection.setMediaCodecCapabilities(const {
      'supportsHevcHdr10': true,
      'supportsAv1Hdr10': false,
    });
  });

  tearDown(() {
    PlatformDetection.setDisplayHdrTypes(null);
    PlatformDetection.setMediaCodecCapabilities(null);
  });

  test('a profile 8.1 base layer needs no fallback on an HDR10 device', () {
    expect(
      HdrStreamCapability.needsDolbyVisionFallback(video('DOVIWithHDR10')),
      isFalse,
    );
    expect(
      HdrStreamCapability.needsDolbyVisionFallback(video('DOVIWithHDR10Plus')),
      isFalse,
    );
  });

  test('every other Dolby Vision layout still does', () {
    for (final rangeType in ['DOVI', 'DOVIWithEL', 'DOVIWithELHDR10Plus']) {
      expect(
        HdrStreamCapability.needsDolbyVisionFallback(video(rangeType)),
        isTrue,
        reason: rangeType,
      );
    }
  });

  test('a decoder without HDR10 still does', () {
    PlatformDetection.setMediaCodecCapabilities(const {
      'supportsHevcHdr10': false,
    });
    expect(
      HdrStreamCapability.needsDolbyVisionFallback(video('DOVIWithHDR10')),
      isTrue,
    );
  });

  test('a display without HDR10 still does', () {
    PlatformDetection.setDisplayHdrTypes(const ['HLG']);
    expect(
      HdrStreamCapability.needsDolbyVisionFallback(video('DOVIWithHDR10')),
      isTrue,
    );
  });

  test('the codec picks which decoder capability counts', () {
    expect(
      HdrStreamCapability.needsDolbyVisionFallback(
        video('DOVIWithHDR10', codec: 'av1'),
      ),
      isTrue,
    );
  });

  test('a non Dolby Vision stream is never a fallback case', () {
    expect(
      HdrStreamCapability.needsDolbyVisionFallback(video('HDR10')),
      isFalse,
    );
  });

  group('an Emby stream', () {
    test('is Dolby Vision by its typed range, not its prose', () {
      expect(
        HdrStreamCapability.isDolbyVisionVideoStream(
          embyVideo('DoviProfile81', videoRange: ''),
        ),
        isTrue,
      );
      expect(
        HdrStreamCapability.isDolbyVisionVideoStream(
          embyVideo('Hdr10', extendedType: 'Hdr10', videoRange: 'HDR 10'),
        ),
        isFalse,
      );
    });

    test('is HDR10+ by its typed range, which the prose loses the plus of', () {
      expect(
        HdrStreamCapability.isHdr10PlusVideoStream(
          embyVideo(
            'Hdr10Plus0',
            extendedType: 'Hdr10Plus',
            videoRange: 'HDR 10+',
          ),
        ),
        isTrue,
      );
    });

    test('names the profile from the sub type', () {
      expect(
        HdrStreamCapability.requiredDolbyVisionProfile(
          embyVideo('DoviProfile50'),
        ),
        DolbyVisionRequiredProfile.profile5,
      );
      expect(
        HdrStreamCapability.requiredDolbyVisionProfile(
          embyVideo('DoviProfile76'),
        ),
        DolbyVisionRequiredProfile.profile7,
      );
      for (final subType in [
        'DoviProfile81',
        'DoviProfile82',
        'DoviProfile83',
        'DoviProfile84',
        'DoviProfile85',
      ]) {
        expect(
          HdrStreamCapability.requiredDolbyVisionProfile(embyVideo(subType)),
          DolbyVisionRequiredProfile.profile8,
          reason: subType,
        );
      }
    });

    test('asks for any decoder on a profile it has no probe for', () {
      for (final subType in [
        'DoviProfile02',
        'DoviProfile10',
        'DoviProfile22',
        'DoviProfile30',
        'DoviProfile42',
        'DoviProfile61',
        'DoviProfile92',
      ]) {
        expect(
          HdrStreamCapability.requiredDolbyVisionProfile(embyVideo(subType)),
          DolbyVisionRequiredProfile.any,
          reason: subType,
        );
      }
    });

    test('with no sub type is any Dolby Vision, not profile 5', () {
      // An older Emby, or a file it couldn't type, reads as a bare
      // DolbyVision. That used to pin it to profile 5, which a profile 8
      // only decoder refused and transcoded over.
      for (final stream in [
        embyVideo('None'),
        embyVideo('', videoRange: 'Dolby vision'),
        <String, dynamic>{
          'Type': 'Video',
          'Codec': 'hevc',
          'VideoRange': 'DolbyVision',
        },
      ]) {
        expect(
          HdrStreamCapability.requiredDolbyVisionProfile(stream),
          DolbyVisionRequiredProfile.any,
          reason: '$stream',
        );
      }
    });

    test('with an HDR10 compatible base layer needs no fallback', () {
      for (final subType in ['DoviProfile81', 'DoviProfile61']) {
        expect(
          HdrStreamCapability.needsDolbyVisionFallback(embyVideo(subType)),
          isFalse,
          reason: subType,
        );
      }
    });

    test('with any other base layer still does', () {
      for (final subType in [
        'DoviProfile50',
        'DoviProfile76',
        'DoviProfile82',
        'DoviProfile84',
        'None',
      ]) {
        expect(
          HdrStreamCapability.needsDolbyVisionFallback(embyVideo(subType)),
          isTrue,
          reason: subType,
        );
      }
    });

    test('with an HDR10 base layer still needs the device to render HDR10', () {
      PlatformDetection.setMediaCodecCapabilities(const {
        'supportsHevcHdr10': false,
      });
      expect(
        HdrStreamCapability.needsDolbyVisionFallback(
          embyVideo('DoviProfile81'),
        ),
        isTrue,
      );
    });
  });

  test('a Jellyfin bare DOVI is still profile 5', () {
    // Jellyfin only writes DOVI without a suffix for profile 5, so the
    // Emby relaxation above must not reach it.
    expect(
      HdrStreamCapability.requiredDolbyVisionProfile(video('DOVI')),
      DolbyVisionRequiredProfile.profile5,
    );
  });
}
