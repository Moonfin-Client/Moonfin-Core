class ImmersiveRailMetrics {
  final double gap;
  final double preferredWidth;
  final double minWidth;
  final double maxWidth;
  final double peek;
  final int minVisibleItems;

  const ImmersiveRailMetrics({
    required this.gap,
    required this.preferredWidth,
    required this.minWidth,
    required this.maxWidth,
    this.peek = 0.22,
    this.minVisibleItems = 1,
  });

  double itemWidth(double availableWidth) {
    if (!availableWidth.isFinite || availableWidth <= 0) {
      return preferredWidth.clamp(minWidth, maxWidth).toDouble();
    }

    final estimatedFullItems = ((availableWidth + gap) / (preferredWidth + gap))
        .floor();

    final fullItems = estimatedFullItems < minVisibleItems
        ? minVisibleItems
        : estimatedFullItems;

    final visibleItems = fullItems + peek;
    final totalGapWidth = fullItems * gap;

    final calculatedWidth = (availableWidth - totalGapWidth) / visibleItems;

    return calculatedWidth.clamp(minWidth, maxWidth).toDouble();
  }

  double itemExtent(double availableWidth) {
    return itemWidth(availableWidth) + gap;
  }
}

abstract final class ImmersiveSpacing {
  // Section hierarchy
  static const double titleToContent = 20;
  static const double sectionGap = 64;
  static const double detailsSectionGap = 80;

  // Compact/mobile hierarchy
  static const double mobileHorizontalInset = 20;
  static const double mobileTitleToContent = 16;
  static const double mobileSectionGap = 32;
  static const double mobileDetailsSectionGap = 56;
  static const double mobileHeroToSection = 32;

  // Shared rail spacing
  static const double railItemGap = 40;
  static const double tvRailItemGap = 32;
  static const double compactWideRailItemGap = 14;
  static const double compactNarrowRailItemGap = 12;

  // Episodes
  static const double seasonSelectorToEpisodes = 24;
  static const double episodeVisibleItemCount = 4.15;
  static const double tvEpisodeVisibleItemCount = 3.25;

  static const ImmersiveRailMetrics compactEpisodes = ImmersiveRailMetrics(
    gap: compactWideRailItemGap,
    preferredWidth: 300,
    minWidth: 240,
    maxWidth: 340,
  );

  // Chapters
  static const ImmersiveRailMetrics compactChapters = ImmersiveRailMetrics(
    gap: compactWideRailItemGap,
    preferredWidth: 260,
    minWidth: 220,
    maxWidth: 300,
  );

  // Discovery
  static const double discoveryVisibleItemCount = 6.15;

  static const ImmersiveRailMetrics compactDiscovery = ImmersiveRailMetrics(
    gap: compactNarrowRailItemGap,
    preferredWidth: 150,
    minWidth: 126,
    maxWidth: 172,
    minVisibleItems: 2,
  );

  // Person filmography
  static const ImmersiveRailMetrics compactFilmography = ImmersiveRailMetrics(
    gap: compactNarrowRailItemGap,
    preferredWidth: 132,
    minWidth: 112,
    maxWidth: 148,
    minVisibleItems: 2,
  );

  // People
  static const double peopleAvatarToName = 16;
  static const double peopleNameToRole = 6;

  static const ImmersiveRailMetrics compactPeople = ImmersiveRailMetrics(
    gap: compactNarrowRailItemGap,
    preferredWidth: 104,
    minWidth: 92,
    maxWidth: 122,
  );

  static const double compactPeopleAvatarWidthFactor = 0.88;
  static const double compactPeopleMinAvatarSize = 82;
  static const double compactPeopleMaxAvatarSize = 108;

  static const int tvPeopleVisibleCards = 8;
  static const double tvPeopleAvatarWidthFactor = 0.84;

  // Details footer
  static const double detailsVerticalPadding = 44;
  static const double detailsTitleToContent = 24;
  static const double detailsContentToDivider = 28;
  static const double detailsDividerToPlayback = 18;
}
