import 'package:flutter/material.dart';

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

  const ModernLandscapeLayout({
    super.key,
    required this.backdrop,
    required this.hero,
    required this.tabBar,
    required this.tabContent,
    required this.topInset,
    this.upNext,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final heroWidth = (size.width * 0.45).clamp(360.0, 620.0);
    return Stack(
      fit: StackFit.expand,
      children: [
        backdrop,
        SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: topInset),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 24, 40, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: heroWidth, child: hero),
                      const SizedBox(width: 24),
                      if (upNext != null)
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ConstrainedBox(
                              constraints:
                                  const BoxConstraints(maxWidth: 460),
                              child: upNext,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 24, 40, 8),
                  child: tabBar,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
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
