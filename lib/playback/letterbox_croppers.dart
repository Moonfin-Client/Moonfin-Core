import 'package:playback_core/playback_core.dart';

import '../util/platform_detection.dart';

/// True where a cropper actually runs: Linux/Windows libmpv, Android Media3
/// (and libmpv if that engine is selected).
///
/// Hidden on iOS, macOS, web, and tvOS.
bool letterboxCropAvailable() =>
    PlatformDetection.isLinux ||
    PlatformDetection.isWindows ||
    PlatformDetection.isAndroid;

/// Settings / search-index gate. Same as [letterboxCropAvailable].
bool letterboxCropSettingVisible() => letterboxCropAvailable();

/// iOS/macOS Aether. Sample via AVPlayerItemVideoOutput, crop with
/// AVVideoComposition. HDR / Dolby Vision make a composition path painful.
class AetherLetterboxCropper extends UnsupportedLetterboxCropper {
  const AetherLetterboxCropper()
    : super(
        unimplementedReason:
            'Aether: needs frame sampling + AVVideoComposition crop; '
            'HDR/Dolby Vision blocks a cheap composition path.',
      );
}

/// tvOS Aether. Same as [AetherLetterboxCropper].
class AppleTvLetterboxCropper extends UnsupportedLetterboxCropper {
  const AppleTvLetterboxCropper()
    : super(
        unimplementedReason:
            'tvOS Aether: needs frame sampling + AVVideoComposition crop.',
      );
}

/// Web HTML video / HLS. CSS object-fit cover is not cropdetect.
class HtmlLetterboxCropper extends UnsupportedLetterboxCropper {
  const HtmlLetterboxCropper()
    : super(
        unimplementedReason:
            'HTML video: object-fit cover is not encoded-bar crop.',
      );
}
