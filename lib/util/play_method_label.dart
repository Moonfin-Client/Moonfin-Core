import '../l10n/app_localizations.dart';

/// Turns one server transcode reason into something readable, falling back to
/// the raw reason for anything the server adds later.
String transcodeReasonLabel(String reason, AppLocalizations l10n) {
  return switch (reason) {
    'ContainerNotSupported' => l10n.transcodeContainerNotSupported,
    'VideoCodecNotSupported' => l10n.transcodeVideoCodecNotSupported,
    'AudioCodecNotSupported' => l10n.transcodeAudioCodecNotSupported,
    'SubtitleCodecNotSupported' => l10n.transcodeSubtitleCodecNotSupported,
    'AudioProfileNotSupported' => l10n.transcodeAudioProfileNotSupported,
    'VideoProfileNotSupported' => l10n.transcodeVideoProfileNotSupported,
    'VideoLevelNotSupported' => l10n.transcodeVideoLevelNotSupported,
    'VideoResolutionNotSupported' => l10n.transcodeVideoResolutionNotSupported,
    'VideoBitDepthNotSupported' => l10n.transcodeVideoBitDepthNotSupported,
    'VideoFramerateNotSupported' => l10n.transcodeVideoFramerateNotSupported,
    'ContainerBitrateExceedsLimit' =>
      l10n.transcodeContainerBitrateExceedsLimit,
    'VideoBitrateExceedsLimit' => l10n.transcodeVideoBitrateExceedsLimit,
    'AudioBitrateExceedsLimit' => l10n.transcodeAudioBitrateExceedsLimit,
    'AudioChannelsNotSupported' => l10n.transcodeAudioChannelsNotSupported,
    _ => reason,
  };
}
