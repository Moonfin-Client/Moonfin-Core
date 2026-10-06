import 'package:flutter/material.dart';

import '../../../../preference/preference_constants.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/bottom_nav/bottom_navbar.dart';

/// Arranges the Spotlight detail pieces for landscape (TV, desktop, any
/// landscape device): full-bleed backdrop, a left hero column ending in the
/// action row, and a band of summary cards along the bottom. Pure
/// arrangement, with all pieces built by the host.
class SpotlightLandscapeLayout extends StatelessWidget {
  final Widget backdrop;
  final Widget hero;
  final Widget cards;
  final double topInset;
  final UserPreferences prefs;
  final ScrollController? scrollController;

  const SpotlightLandscapeLayout({
    super.key,
    required this.backdrop,
    required this.hero,
    required this.cards,
    required this.topInset,
    required this.prefs,
    this.scrollController,
  });

  /// The width of the hero column. The action row measures itself against
  /// this to work out its layout, so it lives next to the layout that hands
  /// the width out.
  static double heroWidthFor(Size size) =>
      (size.width * 0.85).clamp(450.0, 1100.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final scale = prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    final heroWidth = heroWidthFor(size);
    final hasLeftSidebar =
        prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final leftPadding = hasLeftSidebar ? 120.0 : 40.0;

    return Stack(
      fit: StackFit.expand,
      children: [
        backdrop,
        SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            controller: scrollController,
            physics: PlatformDetection.isTV
                ? const NeverScrollableScrollPhysics()
                : const ScrollPhysics(),
            padding: EdgeInsets.only(
              top: (topInset - 12) / scale,
              bottom: bottomContentInset(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(leftPadding, 10 / scale, 40, 0),
                  child: SizedBox(
                    width: heroWidth,
                    child: hero,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    leftPadding,
                    20 / scale,
                    40,
                    40.0 / scale,
                  ),
                  child: cards,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
