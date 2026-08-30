import 'package:flutter/material.dart';

import 'shared/immersive_spacing.dart';

class ImmersiveLandscapeLayout extends StatelessWidget {
  final Widget backdrop;
  final Widget hero;
  final List<Widget> sections;
  final ScrollController scrollController;

  final EdgeInsetsGeometry heroPadding;
  final EdgeInsetsGeometry firstSectionPadding;
  final EdgeInsetsGeometry remainingSectionsPadding;

  final bool compactFirstFold;
  final double compactHeroHeight;
  final double compactHeroToSectionSpacing;

  const ImmersiveLandscapeLayout({
    super.key,
    required this.backdrop,
    required this.hero,
    required this.sections,
    required this.scrollController,
    this.heroPadding = EdgeInsets.zero,
    this.firstSectionPadding = const EdgeInsets.fromLTRB(56, 0, 56, 0),
    this.remainingSectionsPadding = const EdgeInsets.fromLTRB(56, 0, 56, 0),
    this.compactFirstFold = false,
    this.compactHeroHeight = 370,
    this.compactHeroToSectionSpacing = 20,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final firstSection = sections.isNotEmpty
        ? sections.first
        : const SizedBox.shrink();

    final remainingSections = sections.length > 1
        ? sections.skip(1).toList(growable: false)
        : const <Widget>[];

    final resolvedHeroPadding = heroPadding.resolve(Directionality.of(context));

    final nonCompactHeroPadding = EdgeInsets.only(
      top: resolvedHeroPadding.top,
      left: resolvedHeroPadding.left,
      right: resolvedHeroPadding.right,
    );

    final compactHeroFrameHeight =
        compactHeroHeight + resolvedHeroPadding.vertical;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: backdrop),

        CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            if (compactFirstFold) ...[
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: size.height),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: compactHeroFrameHeight,
                        child: Padding(padding: heroPadding, child: hero),
                      ),

                      if (compactHeroToSectionSpacing > 0)
                        SizedBox(height: compactHeroToSectionSpacing),

                      Padding(
                        padding: firstSectionPadding,
                        child: firstSection,
                      ),
                    ],
                  ),
                ),
              ),

              if (remainingSections.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: remainingSectionsPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: remainingSections,
                    ),
                  ),
                ),
            ] else ...[
              SliverToBoxAdapter(
                child: Padding(padding: nonCompactHeroPadding, child: hero),
              ),

              if (sections.isNotEmpty)
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: ImmersiveSpacing.sectionGap),

                      Padding(
                        padding: firstSectionPadding,
                        child: firstSection,
                      ),

                      if (remainingSections.isNotEmpty)
                        Padding(
                          padding: remainingSectionsPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: remainingSections,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ],
    );
  }
}
