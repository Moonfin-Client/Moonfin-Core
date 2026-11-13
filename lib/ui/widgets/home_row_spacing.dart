import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'carousel_panel.dart';

/// Room under a Classic card for its title and year.
const double classicCardCaptionHeight = 50.0;

/// Room left of the rows on a TV with the navbar along the top, so they line
/// up with the toolbar's avatar.
const double tvTopNavbarRowInset = 16.0;

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

/// What the Row Padding setting adds under a Carousel row. Its panel fills
/// all the room under the cards, so this counts from the slider's lowest step
/// instead of overlapping the panel, plus room so the next row's title
/// doesn't crowd it.
double carouselRowPadding(UserPreferences prefs, double desktopScale) =>
    modernRowPadding(prefs) +
    (PlatformDetection.useMobileUi ? 0.0 : 40.0) +
    3 * carouselPanelGap(desktopScale);
