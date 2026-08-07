import 'package:flutter/material.dart';

/// Arranges the Modern detail pieces for portrait phones and tablets: a
/// full-bleed backdrop fading into the content, then a vertical stack of hero,
/// Up Next, tabs and the active tab content. Pure arrangement, with all of the
/// pieces built by the host.
class ModernPortraitLayout extends StatelessWidget {
  final Widget backdrop;
  final Widget hero;
  final Widget? upNext;
  final Widget tabBar;
  final Widget tabContent;
  final double topInset;
  final ScrollController? scrollController;

  const ModernPortraitLayout({
    super.key,
    required this.backdrop,
    required this.hero,
    required this.tabBar,
    required this.tabContent,
    required this.topInset,
    this.upNext,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        backdrop,
        SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
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
