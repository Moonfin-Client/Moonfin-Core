import 'platform_detection.dart';

/// Browser Back changes browser history, so it must leave playback in one go.
/// Native players may use the first Back press to dismiss their chrome.
bool dismissPlaybackChromeBeforeBack() => !PlatformDetection.isWeb;
