import 'dart:ui';

import 'package:get_it/get_it.dart';

import '../preference/user_preferences.dart';
import 'app_localizations.dart';

/// The active [Locale] for code that runs without a [BuildContext].
/// Respects the user's language override in preferences, falling back
/// to the device locale resolved against supported locales.
Locale currentAppLocale([Locale? deviceLocale]) =>
    _overrideLocale() ?? _resolveSupportedLocale(deviceLocale ?? PlatformDispatcher.instance.locale);

/// Matches the way Flutter resolves the app locale: exact, then language with
/// script, then language with country, then language alone. Without the
/// script step a `zh-Hant-TW` device would land on Simplified Chinese.
Locale _resolveSupportedLocale(Locale target) {
  const supported = AppLocalizations.supportedLocales;
  bool sameLanguage(Locale l) => l.languageCode == target.languageCode;
  final script = target.scriptCode;
  final country = target.countryCode;
  return supported.where((l) => l == target).firstOrNull ??
      supported
          .where((l) => script != null && sameLanguage(l) && l.scriptCode == script)
          .firstOrNull ??
      supported
          .where((l) => country != null && sameLanguage(l) && l.countryCode == country)
          .firstOrNull ??
      supported.where(sameLanguage).firstOrNull ??
      const Locale('en');
}

/// Localizations for code that runs without a [BuildContext]. The language
/// override wins over the device language, the same way MaterialApp resolves
/// it, so these strings read in the language the user picked rather than the
/// one the OS is set to.
AppLocalizations currentAppLocalizations() {
  final locale = currentAppLocale();
  try {
    return lookupAppLocalizations(locale);
  } catch (_) {
    return lookupAppLocalizations(const Locale('en'));
  }
}

Locale? _overrideLocale() {
  final String override;
  try {
    override = GetIt.instance<UserPreferences>().get(
      UserPreferences.languageOverride,
    );
  } catch (_) {
    return null;
  }
  if (override == 'system') return null;

  for (final locale in AppLocalizations.supportedLocales) {
    if (locale.toLanguageTag() == override || locale.toString() == override) {
      return locale;
    }
  }
  return null;
}
