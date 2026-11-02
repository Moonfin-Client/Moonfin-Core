import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../focus/focusable_wrapper.dart';
import '../../focus/glass_focus_halo.dart';
import '../../focus/locked_focus_row.dart';
import '../../horizontal_scroll_section.dart';
import '../../offline_aware_image.dart';
import '../book_see_all_button.dart';

/// The Reading Room's serif, for library, section and title headings.
TextStyle readingRoomSerif(double size, {Color? color}) => TextStyle(
  fontFamily: 'Literata',
  fontFamilyFallback: const ['Georgia', 'serif'],
  fontSize: size,
  height: 1.15,
  fontWeight: FontWeight.w600,
  color: color ?? AppColorScheme.onSurface,
);

/// A Reading Room section heading over its row of items, with an optional
/// caption and See all. Up from the row reaches See all before the section
/// above.
class ReadingRoomShelf extends StatelessWidget {
  final String title;
  final String? caption;
  final VoidCallback? onSeeAll;
  final FocusNode? seeAllFocusNode;
  final List<AggregatedItem> items;
  final String hubKey;
  final GlobalKey<LockedFocusRowState> rowKey;
  final GlobalKey containerKey;
  final double itemExtent;
  final double height;
  final double leadingInset;
  final bool large;

  /// Room above the cards for a focused one to grow into.
  final double headroom;
  final LockedFocusItemBuilder<AggregatedItem> itemBuilder;

  /// The D-pad select key on an item.
  final void Function(AggregatedItem item) onSelect;
  final void Function(AggregatedItem item)? onLongPress;
  final bool Function(bool isUp)? onVerticalNavigation;
  final VoidCallback? onLeftEdge;
  final ValueChanged<bool>? onFocusChange;

  const ReadingRoomShelf({
    super.key,
    required this.title,
    required this.items,
    required this.hubKey,
    required this.rowKey,
    required this.containerKey,
    required this.itemExtent,
    required this.height,
    required this.itemBuilder,
    required this.onSelect,
    this.caption,
    this.onSeeAll,
    this.seeAllFocusNode,
    this.leadingInset = 16,
    this.large = false,
    this.headroom = 0,
    this.onLongPress,
    this.onVerticalNavigation,
    this.onLeftEdge,
    this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.65);
    return KeyedSubtree(
      key: containerKey,
      child: Padding(
        padding: EdgeInsets.only(top: large ? 32 : 24),
        child: HorizontalScrollSection(
          title: title,
          titleStyle: readingRoomSerif(large ? 24 : 21),
          headerPadding: EdgeInsets.only(left: leadingInset, right: 12),
          contentSpacing: 8,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (caption != null)
                Text(caption!, style: TextStyle(fontSize: 13, color: muted)),
              if (onSeeAll != null)
                BookSeeAllButton(
                  onPressed: onSeeAll!,
                  focusNode: seeAllFocusNode,
                  onNavigateUp: () => onVerticalNavigation?.call(true),
                  onNavigateDown: () =>
                      rowKey.currentState?.requestFocusFromMemory(),
                ),
            ],
          ),
          builder: (context, controller) => LockedFocusRow<AggregatedItem>(
            key: rowKey,
            items: items,
            hubKey: hubKey,
            controller: controller,
            height: height + headroom,
            itemExtent: itemExtent,
            itemSpacing: large ? 20 : 12,
            clipBehavior: Clip.none,
            padding: EdgeInsets.fromLTRB(leadingInset, 5 + headroom, 20, 5),
            onVerticalNavigation: (isUp) {
              final seeAll = seeAllFocusNode;
              if (isUp && onSeeAll != null && seeAll != null) {
                seeAll.requestFocus();
                return true;
              }
              return onVerticalNavigation?.call(isUp) ?? false;
            },
            onLeftEdge: onLeftEdge,
            onFocusChange: onFocusChange,
            onTap: (_, item) => onSelect(item),
            onLongPress: onLongPress == null
                ? null
                : (_, item) => onLongPress!(item),
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}

/// A cover, or a format glyph while it's missing.
Widget readingRoomCover(String? url, {required bool isAudio}) {
  final placeholder = ColoredBox(
    color: AppColorScheme.surfaceVariant,
    child: Icon(
      isAudio ? Icons.headphones_rounded : Icons.menu_book_rounded,
      color: AppColorScheme.onSurface.withValues(alpha: 0.4),
    ),
  );
  if (url == null) return placeholder;
  return OfflineAwareImage(
    imageUrl: url,
    fit: BoxFit.cover,
    errorWidget: (_, _, _) => placeholder,
  );
}

/// A series as up to three covers fanned behind each other, its name and
/// how many books it holds under them.
class ReadingRoomSeriesTile extends StatelessWidget {
  final String name;
  final String countLabel;

  /// Front cover first.
  final List<String> coverUrls;
  final double coverWidth;
  final bool focused;
  final VoidCallback onTap;

  const ReadingRoomSeriesTile({
    super.key,
    required this.name,
    required this.countLabel,
    required this.coverUrls,
    required this.coverWidth,
    required this.focused,
    required this.onTap,
  });

  /// How far each cover behind sits right of the one before it.
  static double fanFor(double coverWidth) => coverWidth * 0.11;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final coverHeight = coverWidth * 1.5;
    final fan = fanFor(coverWidth);
    final urls = coverUrls.isEmpty ? const [null] : coverUrls;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlassFocusHalo(
            focused: focused,
            scale: 1.03,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: coverWidth + fan * 2,
              height: coverHeight + fan * 0.8,
              child: Stack(
                children: [
                  for (var i = urls.length - 1; i >= 0; i--)
                    Positioned(
                      left: fan * i,
                      top: fan * 0.4 * (2 - i),
                      width: coverWidth,
                      height: coverHeight,
                      child: Opacity(
                        opacity: const [1.0, 0.85, 0.6][i],
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x73000000),
                                blurRadius: 14,
                                offset: Offset(-4, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: AppRadius.circular(8),
                            child: readingRoomCover(urls[i], isAudio: false),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: onSurface,
            ),
          ),
          Text(
            countLabel,
            maxLines: 1,
            style: TextStyle(
              fontSize: 13,
              color: onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

/// An author as a round photo or initials beside their name and title count.
/// A D-pad focus stop.
class ReadingRoomAuthorPill extends StatelessWidget {
  final String name;
  final String? countLabel;
  final String? imageUrl;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateLeft;

  const ReadingRoomAuthorPill({
    super.key,
    required this.name,
    required this.focusNode,
    required this.onTap,
    this.countLabel,
    this.imageUrl,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onNavigateLeft,
  });

  String get _initials => name
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .take(2)
      .map((part) => part.characters.first.toUpperCase())
      .join();

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final initials = Center(
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
    return FocusableWrapper(
      focusNode: focusNode,
      borderRadius: 32,
      autoScroll: true,
      disableScale: true,
      onSelect: onTap,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      onNavigateLeft: onNavigateLeft,
      child: Container(
        height: 64,
        padding: const EdgeInsets.fromLTRB(8, 0, 18, 0),
        decoration: BoxDecoration(
          color: AppColorScheme.surface,
          borderRadius: AppRadius.circular(32),
        ),
        child: Row(
          children: [
            ClipOval(
              child: SizedBox(
                width: 48,
                height: 48,
                child: ColoredBox(
                  color: AppColorScheme.surfaceVariant,
                  child: imageUrl == null
                      ? initials
                      : OfflineAwareImage(
                          imageUrl: imageUrl!,
                          fit: BoxFit.cover,
                          errorWidget: (_, _, _) => initials,
                        ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: onSurface,
                    ),
                  ),
                  if (countLabel != null)
                    Text(
                      countLabel!,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 13,
                        color: onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A genre as a tinted tile with its name in the serif. A D-pad focus stop.
class ReadingRoomGenreTile extends StatelessWidget {
  final String name;
  final String? countLabel;
  final double height;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateLeft;

  const ReadingRoomGenreTile({
    super.key,
    required this.name,
    required this.focusNode,
    required this.onTap,
    this.countLabel,
    this.height = 102,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onNavigateLeft,
  });

  @override
  Widget build(BuildContext context) {
    // A steady tint per name, so a genre keeps its color between visits.
    final hue = (name.codeUnits.fold(0, (a, b) => a * 31 + b) % 360).toDouble();
    return FocusableWrapper(
      focusNode: focusNode,
      borderRadius: 16,
      autoScroll: true,
      disableScale: true,
      onSelect: onTap,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      onNavigateLeft: onNavigateLeft,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: HSLColor.fromAHSL(1, hue, 0.32, 0.2).toColor(),
          borderRadius: AppRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: readingRoomSerif(
                height < 100 ? 16 : 19,
                color: Colors.white,
              ),
            ),
            if (countLabel != null) ...[
              const SizedBox(height: 4),
              Text(
                countLabel!,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.68),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
