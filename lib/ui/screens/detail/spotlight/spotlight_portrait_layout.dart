import 'package:flutter/material.dart';

import '../detail_layout_metrics.dart';

/// Arranges the Spotlight detail pieces for portrait phones and tablets: a
/// full-bleed backdrop fading into the content, then a vertical stack of hero
/// (ending in the action row) and the summary cards. The cards band carries
/// its own horizontal padding so a scrolling strip can bleed to the screen
/// edges like the home rows. Pure arrangement, with all of the pieces built by
/// the host.
class SpotlightPortraitLayout extends StatelessWidget {
  final Widget backdrop;
  final Widget hero;
  final Widget cards;
  final double topInset;
  final ScrollController? scrollController;

  const SpotlightPortraitLayout({
    super.key,
    required this.backdrop,
    required this.hero,
    required this.cards,
    required this.topInset,
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
                SizedBox(height: detailPortraitBackdropGap(size, topInset)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: hero,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
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
