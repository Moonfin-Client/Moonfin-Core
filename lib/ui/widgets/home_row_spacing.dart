import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';

/// Room under a Classic card for its title and year.
const double classicCardCaptionHeight = 50.0;

/// Room left of the rows on a TV with the navbar along the top. Apple TV
/// starts them closer so they line up with the toolbar's avatar.
double get tvTopNavbarRowInset => PlatformDetection.isAppleTV ? 16.0 : 48.0;

/// Room above a row's title. Classic rows on mobile keep a wider gap.
double homeRowHeaderTop(bool modern) =>
    modern || !PlatformDetection.useMobileUi ? 6.0 : 16.0;

/// Expanded Rows gives each row a screen of its own. Phones keep their rows
/// together.
bool expandedHomeRows(UserPreferences prefs) =>
    !PlatformDetection.useMobileUi && prefs.get(UserPreferences.fullScreenRows);

/// The room the Row Padding setting adds under a Classic row. TV and desktop
/// count it from the slider's lowest step, so their rows sit a little closer
/// at every setting.
double classicRowPadding(UserPreferences prefs) {
  final padding = prefs.get(UserPreferences.classicHomeRowsPadding).toDouble();
  if (PlatformDetection.useMobileUi) return padding;
  return (padding - 10).clamp(0.0, double.infinity);
}

/// What the Row Padding setting adds to a Modern row. At the default it's
/// negative, so rows sit closer than the room their cards keep under them.
double modernRowPadding(UserPreferences prefs) {
  final offset = (prefs.get(UserPreferences.modernHomeRowsPadding) - 400.0)
      .clamp(-40.0, 200.0);
  return PlatformDetection.useMobileUi ? 20 + offset / 2 : offset;
}
