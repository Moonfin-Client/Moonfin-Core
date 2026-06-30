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
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final hasUpNext = upNext != null;
    final heroWidth = hasUpNext
        ? (size.width * 0.45).clamp(360.0, 620.0)
        : (size.width * 0.75).clamp(450.0, 960.0);

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
            padding: EdgeInsets.only(top: hasUpNext ? topInset - 24 : topInset - 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (aboveHero != null)
                  Padding(
                    padding: EdgeInsets.fromLTRB(leftPadding, hasUpNext ? 2.0 : 8.0, 40, 0),
                    child: aboveHero!,
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(leftPadding, 20, 40, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: heroWidth, child: hero),
                      if (upNext != null) ...[
                        const SizedBox(width: 24),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: ConstrainedBox(
                              constraints:
                                  const BoxConstraints(maxWidth: 460),
                              child: upNext,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(leftPadding, 24, 40, 8),
                  child: tabBar,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(leftPadding, 0, 40, 16),
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
