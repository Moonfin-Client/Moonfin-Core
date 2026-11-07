import '../l10n/current_app_localizations.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';

/// Load arguments for the Apple TV check that runs when a video's frame rate
/// can't play evenly at the TV's refresh rate: the opt-in slowdown and the
/// one-time Match Frame Rate tip.
Map<String, Object?> appleTvCadenceArgs(UserPreferences prefs) {
  if (!PlatformDetection.isAppleTV) return const {};
  final l10n = currentAppLocalizations();
  return {
    'cadenceSlowdown': prefs.get(UserPreferences.cadenceSlowdown),
    'cadenceTipTitle': l10n.cadenceTipTitle,
    'cadenceTipMessage': l10n.cadenceTipMessage,
    'cadenceTipSlowdownHint': l10n.cadenceTipSlowdownHint,
    'cadenceTipButton': l10n.ok,
  };
}
