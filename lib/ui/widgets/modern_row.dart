import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/overview_text.dart';
import '../../util/platform_detection.dart';
import 'rating_display.dart';

/// A Modern poster is the same height as a classic portrait card at the same
/// card size.
double modernImageHeight(PosterSize posterSize, double platformScale) =>
    posterSize.portraitHeight * platformScale;

/// Room under a Modern poster for the title, the metadata line, the ratings
/// and three lines of overview. Phones only show the title and one line.
double modernMetadataBudget(UserPreferences prefs) {
  if (PlatformDetection.useMobileUi) return 50.0;
  final ratingsPadding =
      prefs.get(UserPreferences.enableAdditionalRatings) ? 8.0 : 0.0;
  return 175.0 + ratingsPadding;
}

/// How far a grown card's ratings and overview can run before the row ends.
/// Focus parks a card at the leading edge, but the last few cards can't
/// scroll that far, so they get less room. A [hovered] card stays where it
/// is. Off TV it's never wider than twice the card, so lines stay readable on
/// a wide window. A TV canvas is narrow enough to keep the whole row.
double modernDetailsWidth({
  required ScrollController controller,
  required int index,
  required int itemCount,
  required double itemExtent,
  required double itemSpacing,
  required double focusedWidth,
  required double maxWidth,
  required double leadingInset,
  required double trailingInset,
  bool hovered = false,
}) {
  final cap = PlatformDetection.isTV
      ? maxWidth
      : math.min(maxWidth, focusedWidth * 2);
  if (!controller.hasClients || !controller.position.hasViewportDimension) {
    return cap;
  }
  final viewport = controller.position.viewportDimension;
  final stride = itemExtent + itemSpacing;
  final contentWidth = leadingInset +
      itemCount * stride -
      itemSpacing +
      (focusedWidth - itemExtent) +
      trailingInset;
  final maxOffset = (contentWidth - viewport).clamp(0.0, double.infinity);
  final cardStart = leadingInset + index * stride;
  final offset = hovered ? controller.offset : cardStart.clamp(0.0, maxOffset);
  return (viewport - (cardStart - offset) - trailingInset).clamp(0.0, cap);
}

/// Which Modern card is grown: by touch, by mouse, or by a D-pad dwell. These
/// are notifiers rather than widget state so a hover or a dwell settle only
/// rebuilds the two cards that changed. Each card watches [listenable] through
/// a selector and rebuilds when its own answer flips.
class ModernCardExpansion {
  static const _dwell = Duration(milliseconds: 70);

  final pressedKey = ValueNotifier<String?>(null);
  final hoveredKey = ValueNotifier<String?>(null);
  final settledKey = ValueNotifier<String?>(null);
  late final Listenable listenable = Listenable.merge([
    pressedKey,
    hoveredKey,
    settledKey,
  ]);
  Timer? _dwellTimer;

  bool isExpanded(
    String key, {
    required bool isFocused,
    required bool isTouch,
    required bool delayExpansion,
  }) {
    if (isTouch) return pressedKey.value == key;
    final isSettled = !delayExpansion || settledKey.value == key;
    return hoveredKey.value == key || (isFocused && isSettled);
  }

  /// Marks [key] as the focused card. With [delayExpansion] it waits out a
  /// short dwell, so a held D-pad doesn't grow every card it passes.
  void settle(String key, {required bool delayExpansion}) {
    _dwellTimer?.cancel();
    if (!delayExpansion) {
      settledKey.value = key;
      return;
    }
    _dwellTimer = Timer(_dwell, () => settledKey.value = key);
  }

  /// A tap on a touch screen grows the card, and a second tap opens it.
  /// Returns whether this tap should open it.
  bool tapToOpen(String key) {
    if (pressedKey.value == key) {
      pressedKey.value = null;
      return true;
    }
    pressedKey.value = key;
    hoveredKey.value = null;
    return false;
  }

  void clearPointer() {
    pressedKey.value = null;
    hoveredKey.value = null;
  }

  void dispose() {
    _dwellTimer?.cancel();
    pressedKey.dispose();
    hoveredKey.dispose();
    settledKey.dispose();
  }
}

/// Builds a grown card's details knowing whether the pointer is on it. The
/// card's selector only rebuilds when it grows or shrinks, so this picks up
/// hover on a card focus already grew, and follows the row's scroll while
/// hovered.
class ModernHoverBuilder extends StatelessWidget {
  const ModernHoverBuilder({
    super.key,
    required this.expansion,
    required this.cardKey,
    required this.controller,
    required this.builder,
  });

  final ModernCardExpansion expansion;
  final String cardKey;
  final ScrollController controller;
  final Widget Function(BuildContext context, bool hovered) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: expansion.hoveredKey,
      builder: (context, hoveredKey, _) {
        final hovered = hoveredKey == cardKey;
        return ListenableBuilder(
          // Only a hovered card needs the scroll. hoveredKey is a stand-in so
          // the widget stays the same and the details aren't rebuilt from scratch.
          listenable: hovered ? controller : expansion.hoveredKey,
          builder: (context, _) => builder(context, hovered),
        );
      },
    );
  }
}

/// A Modern card with its details under it, resized with an animation as the
/// card grows and shrinks.
class ModernExpandingCard extends StatelessWidget {
  const ModernExpandingCard({
    super.key,
    required this.card,
    required this.prefs,
    this.details,
  });

  final Widget card;
  final UserPreferences prefs;
  final Widget? details;

  @override
  Widget build(BuildContext context) {
    final details = this.details;
    return AnimatedSize(
      duration: prefs.get(UserPreferences.modernCardTransitionSpeed).duration,
      curve: Curves.easeInOutCubic,
      alignment: Alignment.topLeft,
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          card,
          if (details != null) ...[const SizedBox(height: 4), details],
        ],
      ),
    );
  }
}

/// The ratings and overview under a grown Modern card. The section is only
/// as wide as the card, so on desktop and TV they break out into the rest of
/// the row, up to [detailsWidth]. Phones keep the card width.
class ModernCardDetails extends StatelessWidget {
  const ModernCardDetails({
    super.key,
    required this.prefs,
    required this.cardWidth,
    required this.detailsWidth,
    this.overview,
    this.communityRating,
    this.criticRating,
    this.personalRating,
    this.additionalRatings = const {},
  });

  final UserPreferences prefs;
  final double cardWidth;
  final double detailsWidth;
  final String? overview;
  final double? communityRating;
  final int? criticRating;
  final double? personalRating;
  final Map<String, double> additionalRatings;

  @override
  Widget build(BuildContext context) {
    final overview = this.overview ?? '';
    final hasAnyRating = communityRating != null ||
        criticRating != null ||
        additionalRatings.isNotEmpty;
    if (!hasAnyRating && overview.isEmpty) {
      return SizedBox(width: cardWidth);
    }

    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final baseStyle =
        Theme.of(context).textTheme.bodySmall ?? const TextStyle(fontSize: 12);
    final overviewStyle = baseStyle.copyWith(
      color: isNeon
          ? AppColorScheme.onSurface
          : Theme.of(context).colorScheme.onSurface.withAlpha(180),
      shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
      height: 1.4,
    );

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasAnyRating)
          RatingsRow(
            ratings: additionalRatings,
            communityRating: communityRating,
            criticRating: criticRating,
            personalRating: personalRating,
            enableAdditionalRatings:
                prefs.get(UserPreferences.enableAdditionalRatings),
            enabledRatings: prefs.get(UserPreferences.enabledRatings),
            showLabels: prefs.get(UserPreferences.showRatingLabels),
            showBadges: prefs.get(UserPreferences.showRatingBadges),
            singleLine: !PlatformDetection.useMobileUi,
          ),
        if (overview.isNotEmpty &&
            !prefs.get(UserPreferences.hideHomeMediaDescription))
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              cleanOverview(overview),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: overviewStyle,
            ),
          ),
      ],
    );

    return SizedBox(
      width: cardWidth,
      child: PlatformDetection.useMobileUi
          ? details
          : OverflowBox(
              fit: OverflowBoxFit.deferToChild,
              alignment: AlignmentDirectional.topStart,
              // The last card's room can come out a hair under the card
              // width, and a minimum above the maximum breaks the layout.
              minWidth: 0,
              maxWidth: detailsWidth,
              child: details,
            ),
    );
  }
}
