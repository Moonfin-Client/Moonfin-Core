import 'package:playback_core/playback_core.dart';

/// Shared secondary-subtitle controls for Apple backends that expose the same
/// native method-channel API while retaining their own invocation/error policy.
mixin AppleSecondarySubtitleControls implements SecondarySubtitleBackend {
  Future<T?> invokeAppleSecondaryControl<T>(
    String method, [
    dynamic arguments,
  ]);

  @override
  bool get supportsSecondarySubtitleDelay => true;

  @override
  bool get supportsSecondarySubtitlePosition => true;

  @override
  bool get supportsSecondarySubtitleStyle => true;

  Future<void> setSecondarySubtitle({
    String? url,
    String? codec,
    String? language,
    int? embeddedTrackId,
  }) async {
    await invokeAppleSecondaryControl<void>('setSecondarySubtitle', {
      'embeddedTrackId': embeddedTrackId,
      'url': url,
    });
  }

  Future<void> setSecondarySubtitleDelay(double seconds) async {
    await invokeAppleSecondaryControl<void>('setSecondarySubtitleDelay', {
      'delayMs': (seconds.clamp(-5.0, 5.0) * 1000).round(),
    });
  }

  Future<void> configureSecondarySubtitleStyle({
    double? fontSize,
    double? verticalOffset,
    int? textColor,
  }) async {
    await invokeAppleSecondaryControl<void>('configureSecondarySubtitleStyle', {
      if (fontSize != null) 'fontSize': fontSize.clamp(6.0, 72.0),
      if (verticalOffset != null)
        'verticalOffset':
            PlaybackManager.clampSecondarySubtitleOffset(verticalOffset),
      if (textColor != null) 'textColor': textColor,
    });
  }
}
