import 'dart:ui';

import 'package:get_it/get_it.dart';

import '../preference/user_preferences.dart';
import 'app_localizations.dart';

/// Localizations for code that runs without a [BuildContext]. The language
/// override wins over the device language, the same way MaterialApp resolves
/// it, so these strings read in the language the user picked rather than the
/// one the OS is set to.
AppLocalizations currentAppLocalizations() {
  final locale = _overrideLocale() ?? PlatformDispatcher.instance.locale;
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
