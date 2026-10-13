import 'dart:ui';
import 'package:get_it/get_it.dart';
import '../preference/user_preferences.dart';
import '../util/interface_locale.dart';
import 'app_localizations.dart';

/// Resolve contextless strings using the same language as MaterialApp.
AppLocalizations currentAppLocalizations() {
  final locale = resolveInterfaceLocale(
    _overrideLocale() ?? PlatformDispatcher.instance.locale,
    AppLocalizations.supportedLocales,
  );
  try {
    return lookupAppLocalizations(locale);
  } catch (_) {
    return lookupAppLocalizations(const Locale('en'));
  }
}

Locale? _overrideLocale() {
  try {
    return interfaceLocaleOverride(
      GetIt.instance<UserPreferences>().get(UserPreferences.languageOverride),
      AppLocalizations.supportedLocales,
    );
  } catch (_) {
    return null;
  }
}
