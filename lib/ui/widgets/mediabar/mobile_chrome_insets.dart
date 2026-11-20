import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../bottom_nav/bottom_navbar.dart';
import '../left_sidebar.dart';
import '../navigation_layout.dart';
import '../top_toolbar.dart';

/// The room a phone's navigation takes from a media bar [barHeight] tall at
/// the top of Home. The toolbar or the sidebar's menu button covers its top,
/// and a bottom navbar covers whatever of it reaches the foot of the screen.
/// Zero off phones.
EdgeInsets mobileChromeInsets(
  BuildContext context,
  UserPreferences prefs,
  double barHeight,
) {
  if (!PlatformDetection.useMobileUi) return EdgeInsets.zero;
  final statusBar = MediaQuery.paddingOf(context).top;
  return switch (NavigationLayout.sanitizeNavbarPosition(
    prefs.get(UserPreferences.navbarPosition),
  )) {
    NavbarPosition.top => EdgeInsets.only(
      top: statusBar + TopToolbar.heightFor(context),
    ),
    NavbarPosition.left => EdgeInsets.only(
      top: statusBar + LeftSidebar.mobileMenuExtent,
    ),
    NavbarPosition.bottom => EdgeInsets.only(
      top: statusBar,
      bottom: math.max(
        0,
        (BottomNavInsetScope.maybeOf(context) ?? 0) -
            (MediaQuery.sizeOf(context).height - barHeight),
      ),
    ),
  };
}
