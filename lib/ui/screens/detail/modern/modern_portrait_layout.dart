import 'package:flutter/material.dart';

/// Arranges the Modern detail pieces for portrait phones/tablets: backdrop at the
/// top fading into the content, then a vertical stack of hero, Up Next, tabs and
/// the active tab content. Pure arrangement; all pieces are built by the host.
class ModernPortraitLayout extends StatelessWidget {
  final Widget backdrop;
  final Widget hero;
  final Widget? upNext;
  final Widget tabBar;
  final Widget tabContent;
  final double topInset;

  const ModernPortraitLayout({
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
    final backdropHeight = size.height * 0.5;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: backdropHeight,
          child: backdrop,
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.26 + topInset),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: hero,
                ),
                if (upNext != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: upNext!,
                  ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: tabBar,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
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
