import 'package:flutter/material.dart';

class ImmersivePortraitLayout extends StatelessWidget {
  final Widget backdrop;
  final Widget hero;
  final List<Widget> sections;
  final ScrollController scrollController;

  final EdgeInsetsGeometry heroPadding;
  final EdgeInsetsGeometry firstSectionPadding;
  final EdgeInsetsGeometry remainingSectionsPadding;

  final double heroMinHeight;
  final double heroToSectionSpacing;

  const ImmersivePortraitLayout({
    super.key,
    required this.backdrop,
    required this.hero,
    required this.sections,
    required this.scrollController,
    this.heroPadding = EdgeInsets.zero,
    this.firstSectionPadding = const EdgeInsets.fromLTRB(20, 0, 20, 0),
    this.remainingSectionsPadding = const EdgeInsets.fromLTRB(20, 0, 20, 0),
    this.heroMinHeight = 560,
    this.heroToSectionSpacing = 48,
  });

  @override
  Widget build(BuildContext context) {
    final firstSection = sections.isNotEmpty
        ? sections.first
        : const SizedBox.shrink();

    final remainingSections = sections.length > 1
        ? sections.skip(1).toList(growable: false)
        : const <Widget>[];

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: backdrop),

        CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: heroMinHeight),
                    padding: heroPadding,
                    alignment: Alignment.bottomLeft,
                    child: hero,
                  ),

                  if (heroToSectionSpacing > 0)
                    SizedBox(height: heroToSectionSpacing),

                  Padding(padding: firstSectionPadding, child: firstSection),
                ],
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
          ],
        ),
      ],
    );
  }
}
