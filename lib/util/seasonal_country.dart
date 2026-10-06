import 'dart:ui' as ui;

import '../preference/user_preferences.dart';

/// Moonbase reads this as "no country, and don't fall back to the server's".
const seasonalCountryOther = 'ZZ';

/// The country code the seasonal row request carries, or null to let Moonbase
/// fall back to the server's own.
///
/// [setting] is the synced preference: Automatic uses [deviceCountry], Other
/// sends [seasonalCountryOther], and a code is sent as is. Anything that isn't
/// two letters is left out, since a wrong code would pick the wrong holidays.
String? seasonalCountryParam(String setting, {String? deviceCountry}) =>
    switch (UserPreferences.parseSeasonalRowCountry(setting)) {
      UserPreferences.seasonalRowCountryOther => seasonalCountryOther,
      UserPreferences.seasonalRowCountryAuto =>
        UserPreferences.parseCountryCode(deviceCountry),
      final code => code,
    };

/// The device locale's region, the only country signal Flutter exposes on every
/// platform.
String? deviceCountryCode() => UserPreferences.parseCountryCode(
      ui.PlatformDispatcher.instance.locale.countryCode,
    );
