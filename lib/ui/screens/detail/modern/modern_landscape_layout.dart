import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/platform_detection.dart';

/// Arranges the Modern detail pieces for landscape (TV, desktop, any landscape
/// device): full-bleed backdrop, a left hero column, a floating Up Next card on
/// the right, and a bottom band with the tab bar + active tab content. Pure
/// arrangement; all pieces are built by the host.
class ModernLandscapeLayout extends StatelessWidget {
  final Widget backdrop;
  final Widget hero;
  final Widget? upNext;
  final Widget tabBar;
  final Widget tabContent;
  final double topInset;
  final ScrollController? scrollController;
  final Widget? aboveHero;
  final bool isBoxSet;

  const ModernLandscapeLayout({
    super.key,
    required this.backdrop,
    required this.hero,
    required this.tabBar,
    required this.tabContent,
    required this.topInset,
    this.upNext,
    this.scrollController,
    this.aboveHero,
    this.isBoxSet = false,
  });

  /// The width of the left hero column. The action row measures itself
  /// against this to work out how many buttons fit on one line, so it lives
  /// next to the layout that hands the width out.
  static double heroWidthFor(
    Size size, {
    required bool hasUpNext,
    required bool isBoxSet,
  }) => hasUpNext
      ? (isBoxSet
            ? (size.width * 0.70).clamp(450.0, 950.0)
            : (size.width * 0.50).clamp(360.0, 680.0))
      : (size.width * 0.85).clamp(450.0, 1100.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final hasUpNext = upNext != null;
    final scale = GetIt.instance<UserPreferences>().get(UserPreferences.desktopUiScale).scaleFactor;
    final heroWidth = heroWidthFor(size, hasUpNext: hasUpNext, isBoxSet: isBoxSet);

    final hasLeftSidebar = GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final leftPadding = hasLeftSidebar ? 120.0 : 40.0;

    return Stack(
      fit: StackFit.expand,
      children: [
        backdrop,
        SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            physics: PlatformDetection.isTV ? const NeverScrollableScrollPhysics() : const ScrollPhysics(),
            padding: EdgeInsets.only(top: (hasUpNext ? topInset - 24 : topInset - 12) / scale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(leftPadding, 10 / scale, 40, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: heroWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ?aboveHero,
                            if (aboveHero != null) const SizedBox(height: 10),
                            hero,
                          ],
                        ),
                      ),
                      if (upNext != null)
                        Expanded(
                          child: Align(
                            alignment: isBoxSet ? Alignment.topRight : Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: isBoxSet
                                    ? 24.0 / scale
                                    : (aboveHero != null ? 48.0 / scale : 0.0),
                              ),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 310),
                                child: upNext,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(leftPadding, 16 / scale, 40, 8 / scale),
                  child: tabBar,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    leftPadding,
                    0,
                    40,
                    40.0 / scale,
                  ),
                  child: tabContent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
