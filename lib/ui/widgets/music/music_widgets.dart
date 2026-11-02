import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/playback_time_label.dart';
import '../book/book_see_all_button.dart';
import '../focus/focusable_wrapper.dart';
import '../focus/locked_focus_row.dart';
import '../horizontal_scroll_section.dart';
import '../offline_aware_image.dart';
import '../settings/preference_tiles.dart';
import '../sliding_pill_tabs.dart';

/// Genre and mix tiles cycle through these, dark enough for white labels.
const kMusicTileColors = [
  Color(0xFF7A2E22),
  Color(0xFF3B2D5C),
  Color(0xFF6B2F4A),
  Color(0xFF4D3B72),
  Color(0xFFB4472F),
  Color(0xFF1F3A5F),
  Color(0xFF8A5A1E),
  Color(0xFF14505C),
];

/// The small capitals over a music hero or panel title, in the accent.
TextStyle musicEyebrowStyle() => TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.4,
  color: AppColorScheme.accent,
);

TextStyle musicSectionTitleStyle({required bool large}) => TextStyle(
  fontSize: large ? 22 : 20,
  fontWeight: FontWeight.w800,
  color: AppColorScheme.onSurface,
);

/// Album art, or a music glyph while it's missing.
Widget musicArt(String? url, {IconData icon = Icons.album}) {
  final placeholder = ColoredBox(
    color: AppColorScheme.onSurface.withValues(alpha: 0.06),
    child: Center(
      child: Icon(icon, color: AppColorScheme.onSurface.withValues(alpha: 0.3)),
    ),
  );
  if (url == null) return placeholder;
  return OfflineAwareImage(
    imageUrl: url,
    fit: BoxFit.cover,
    errorWidget: (_, _, _) => placeholder,
  );
}

/// A music section heading over its row of items, with an optional See All.
/// Up from the row reaches See All before the section above.
class MusicShelf extends StatelessWidget {
  final String title;
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
  final void Function(AggregatedItem item) onSelect;
  final bool Function(bool isUp)? onVerticalNavigation;
  final VoidCallback? onLeftEdge;

  /// Told the index the D-pad reached, so the row can page in more.
  final void Function(int index)? onIndexChanged;

  const MusicShelf({
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
    this.onSeeAll,
    this.seeAllFocusNode,
    this.leadingInset = 16,
    this.large = false,
    this.headroom = 0,
    this.onVerticalNavigation,
    this.onLeftEdge,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: containerKey,
      child: Padding(
        padding: EdgeInsets.only(top: large ? 28 : 22),
        child: HorizontalScrollSection(
          title: title,
          titleStyle: musicSectionTitleStyle(large: large),
          headerPadding: EdgeInsets.only(left: leadingInset, right: 12),
          contentSpacing: 6,
          trailing: onSeeAll == null
              ? null
              : BookSeeAllButton(
                  onPressed: onSeeAll!,
                  focusNode: seeAllFocusNode,
                  onNavigateUp: () => onVerticalNavigation?.call(true),
                  onNavigateDown: () =>
                      rowKey.currentState?.requestFocusFromMemory(),
                ),
          builder: (context, controller) => LockedFocusRow<AggregatedItem>(
            key: rowKey,
            items: items,
            hubKey: hubKey,
            itemKey: (item, _) => item.id,
            controller: controller,
            height: height + headroom,
            itemExtent: itemExtent,
            itemSpacing: large ? 20 : 14,
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
            onIndexChanged: onIndexChanged == null
                ? null
                : (index, _) => onIndexChanged!(index),
            onTap: (_, item) => onSelect(item),
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}

/// A heading over a block of D-pad stops, with an optional See All.
class MusicSection extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final bool large;
  final EdgeInsets padding;
  final Widget child;

  const MusicSection({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
    this.large = false,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding.add(EdgeInsets.only(top: large ? 28 : 22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: musicSectionTitleStyle(large: large),
                  ),
                ),
                ?trailing,
              ],
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

/// [children] laid out [columns] across, in rows [spacing] apart. Each child
/// is its own D-pad stop, so the D-pad moves between them by position.
class MusicGrid extends StatelessWidget {
  final int columns;
  final double spacing;

  /// Room above each row for a focused card to grow into.
  final double headroom;
  final List<Widget> children;

  const MusicGrid({
    super.key,
    required this.columns,
    required this.children,
    this.spacing = 10,
    this.headroom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var start = 0; start < children.length; start += columns)
          Padding(
            padding: EdgeInsets.only(
              top: headroom,
              bottom: start + columns < children.length ? spacing : 0,
            ),
            child: Row(
              children: [
                for (var i = start; i < start + columns; i++) ...[
                  if (i > start) SizedBox(width: spacing),
                  Expanded(
                    child: i < children.length
                        ? children[i]
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

/// Edge handlers for one item of a [MusicGrid] or list. Moves inside the
/// grid are left to the D-pad's own traversal, only the edges are routed.
class MusicGridEdges {
  final VoidCallback? up;
  final VoidCallback? down;
  final VoidCallback? left;
  final VoidCallback? right;

  const MusicGridEdges({this.up, this.down, this.left, this.right});

  factory MusicGridEdges.of(
    int index, {
    required int count,
    required int columns,
    required VoidCallback onLeaveUp,
    required VoidCallback onLeaveDown,
    VoidCallback? onLeaveLeft,
    VoidCallback? onLeaveRight,
  }) => MusicGridEdges(
    up: index < columns ? onLeaveUp : null,
    down: index + columns >= count ? onLeaveDown : null,
    left: index % columns == 0 ? onLeaveLeft : null,
    right: index % columns == columns - 1 || index == count - 1
        ? onLeaveRight
        : null,
  );
}

/// A song's length as `m:ss`, or null when the server didn't say.
String? musicRunTime(AggregatedItem item) {
  final ticks = item.runTimeTicks;
  if (ticks == null || ticks <= 0) return null;
  // A tick is 100 nanoseconds.
  return formatPlaybackDuration(Duration(microseconds: ticks ~/ 10));
}

/// A card in a [MusicGrid]: one D-pad stop drawn by [builder], which is told
/// whether it has focus. Select runs [onTap] and the grid's edges leave
/// through [edges].
class MusicGridCard extends StatefulWidget {
  final FocusNode focusNode;
  final VoidCallback onTap;
  final MusicGridEdges edges;
  final Widget Function(bool focused) builder;
  final VoidCallback? onFocus;

  const MusicGridCard({
    super.key,
    required this.focusNode,
    required this.onTap,
    required this.builder,
    this.edges = const MusicGridEdges(),
    this.onFocus,
  });

  @override
  State<MusicGridCard> createState() => _MusicGridCardState();
}

class _MusicGridCardState extends State<MusicGridCard> {
  bool _focused = false;

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable) return KeyEventResult.ignored;
    if (isActivateKey(event)) {
      widget.onTap();
      return KeyEventResult.handled;
    }
    final key = event.logicalKey;
    final edge = key.isUpKey
        ? widget.edges.up
        : key.isDownKey
        ? widget.edges.down
        : key.isLeftKey
        ? widget.edges.left
        : key.isRightKey
        ? widget.edges.right
        : null;
    if (edge == null) return KeyEventResult.ignored;
    edge();
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: _onKey,
      onFocusChange: (focused) {
        setState(() => _focused = focused);
        if (focused) {
          widget.onFocus?.call();
          Scrollable.ensureVisible(
            context,
            alignment: 0.5,
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeInOut,
          );
        }
      },
      child: widget.builder(_focused),
    );
  }
}

/// A song as a row: its art or track number, title and artist, and its
/// length at the end. Focus fills the row with a solid color and dark text,
/// so it stays readable in every theme.
class MusicTrackTile extends StatefulWidget {
  final String title;
  final String subtitle;

  /// Art at the start. Without it [leadingLabel] (a track number) shows.
  final String? imageUrl;
  final String? leadingLabel;

  /// A place in a chart, in the accent ahead of the art.
  final String? rank;
  final String? trailing;

  /// The song played last on this album.
  final bool highlighted;
  final FocusNode? focusNode;
  final VoidCallback onTap;
  final MusicGridEdges edges;
  final VoidCallback? onNavigateRight;
  final VoidCallback? onFocus;

  const MusicTrackTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.imageUrl,
    this.leadingLabel,
    this.rank,
    this.trailing,
    this.highlighted = false,
    this.focusNode,
    this.edges = const MusicGridEdges(),
    this.onNavigateRight,
    this.onFocus,
  });

  @override
  State<MusicTrackTile> createState() => _MusicTrackTileState();
}

class _MusicTrackTileState extends State<MusicTrackTile> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final invert = _focused && settingsTileInvertsOnFocus;
    final text = invert
        ? AppColors.black.withValues(alpha: 0.87)
        : AppColorScheme.onSurface;
    final muted = invert
        ? AppColors.black.withValues(alpha: 0.6)
        : AppColorScheme.onSurface.withValues(alpha: 0.65);
    final accent = AppColorScheme.accent;
    final Color? fill = _focused
        ? (invert
              ? AppColorScheme.buttonFocused
              : AppColorScheme.buttonFocused.withValues(alpha: 0.14))
        : (widget.highlighted ? accent.withValues(alpha: 0.16) : null);
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: widget.focusNode,
      borderRadius: 10,
      disableScale: true,
      autoScroll: true,
      suppressFocusGlow: true,
      onFocusChange: (focused) {
        setState(() => _focused = focused);
        if (focused) widget.onFocus?.call();
      },
      onSelect: widget.onTap,
      onNavigateUp: widget.edges.up,
      onNavigateDown: widget.edges.down,
      onNavigateLeft: widget.edges.left,
      onNavigateRight: widget.onNavigateRight,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: AppRadius.circular(10),
        ),
        child: Row(
          children: [
            if (widget.rank != null)
              SizedBox(
                width: 30,
                child: Text(
                  widget.rank!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: invert ? text : accent,
                  ),
                ),
              ),
            if (widget.imageUrl != null || widget.leadingLabel == null)
              ClipRRect(
                borderRadius: AppRadius.circular(6),
                child: SizedBox.square(
                  dimension: 44,
                  child: musicArt(widget.imageUrl, icon: Icons.music_note),
                ),
              )
            else
              SizedBox(
                width: 28,
                child: Text(
                  widget.leadingLabel!,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: widget.highlighted ? FontWeight.w700 : null,
                    color: widget.highlighted && !invert ? accent : muted,
                  ),
                ),
              ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: text,
                    ),
                  ),
                  if (widget.subtitle.isNotEmpty)
                    Text(
                      widget.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: muted),
                    ),
                ],
              ),
            ),
            if (widget.trailing != null) ...[
              const SizedBox(width: 12),
              Text(
                widget.trailing!,
                style: TextStyle(fontSize: 13, color: muted),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A compact album or playlist tile: its art at the start and its name.
class MusicQuickTile extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final bool large;
  final FocusNode? focusNode;
  final VoidCallback onTap;
  final MusicGridEdges edges;

  const MusicQuickTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
    this.large = false,
    this.focusNode,
    this.edges = const MusicGridEdges(),
  });

  @override
  Widget build(BuildContext context) {
    final height = large ? 64.0 : 56.0;
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: focusNode,
      borderRadius: 10,
      autoScroll: true,
      onSelect: onTap,
      onNavigateUp: edges.up,
      onNavigateDown: edges.down,
      onNavigateLeft: edges.left,
      child: Container(
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColorScheme.onSurface.withValues(alpha: 0.08),
          borderRadius: AppRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox.square(dimension: height, child: musicArt(imageUrl)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: large ? 14 : 13,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  color: AppColorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

/// A category or genre tile: a label at the bottom, with an icon over it or
/// a solid [color] behind it.
class MusicTile extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final double height;
  final FocusNode? focusNode;
  final VoidCallback onTap;
  final MusicGridEdges edges;

  const MusicTile({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.color,
    this.height = 76,
    this.focusNode,
    this.edges = const MusicGridEdges(),
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: focusNode,
      borderRadius: 14,
      autoScroll: true,
      onSelect: onTap,
      onNavigateUp: edges.up,
      onNavigateDown: edges.down,
      onNavigateLeft: edges.left,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: color ?? onSurface.withValues(alpha: 0.06),
          borderRadius: AppRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: icon != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: [
            if (icon != null) Icon(icon, size: 24, color: AppColorScheme.accent),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: color != null ? 18 : 14,
                fontWeight: color != null ? FontWeight.w800 : FontWeight.w700,
                color: color != null ? Colors.white : onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A music action, a pill with [label] or a circle without one. Focus fills
/// it with the button focus color, so it shows on the accent Play button too.
class MusicPillButton extends StatefulWidget {
  final FocusNode focusNode;
  final IconData icon;
  final String? label;
  final String? semanticLabel;
  final Color? iconColor;
  final bool primary;
  final double height;
  final VoidCallback onTap;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateRight;

  const MusicPillButton({
    super.key,
    required this.focusNode,
    required this.icon,
    required this.onTap,
    this.height = 44,
    this.onNavigateUp,
    this.onNavigateDown,
    this.label,
    this.semanticLabel,
    this.iconColor,
    this.primary = false,
    this.onNavigateLeft,
    this.onNavigateRight,
  });

  @override
  State<MusicPillButton> createState() => _MusicPillButtonState();
}

class _MusicPillButtonState extends State<MusicPillButton> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final background = _focused
        ? AppColorScheme.buttonFocused
        : (widget.primary
              ? AppColorScheme.accent
              : onSurface.withValues(alpha: 0.14));
    final foreground = _focused
        ? AppColorScheme.onButtonFocused
        : (widget.primary ? AppColorScheme.onAccent : onSurface);
    final label = widget.label;
    final height = widget.height;
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: widget.focusNode,
      borderRadius: height / 2,
      disableScale: true,
      semanticLabel: widget.semanticLabel,
      onFocusChange: (focused) => setState(() => _focused = focused),
      onSelect: widget.onTap,
      onNavigateUp: widget.onNavigateUp,
      onNavigateDown: widget.onNavigateDown,
      onNavigateLeft: widget.onNavigateLeft,
      onNavigateRight: widget.onNavigateRight,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        width: label == null ? height : null,
        height: height,
        padding: label == null
            ? null
            : const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppRadius.circular(height / 2),
        ),
        child: label == null
            ? Icon(
                widget.icon,
                size: 22,
                color: _focused ? foreground : (widget.iconColor ?? foreground),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon, size: 22, color: foreground),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: widget.primary
                          ? FontWeight.w800
                          : FontWeight.w700,
                      color: foreground,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// A music library's categories as pill tabs, with [current] picked. The
/// D-pad moves a highlight along them and Select opens the highlighted one,
/// since the pills pick on every arrow press. A tap opens one at once, and
/// leaving the tabs puts the highlight back on [current].
class MusicCategoryTabs extends StatefulWidget {
  final List<String> labels;
  final int current;
  final ValueChanged<int> onOpen;
  final FocusNode focusNode;
  final bool Function(bool isUp)? onVerticalNavigation;
  final VoidCallback? onExitLeft;
  final VoidCallback? onExitRight;

  const MusicCategoryTabs({
    super.key,
    required this.labels,
    required this.current,
    required this.onOpen,
    required this.focusNode,
    this.onVerticalNavigation,
    this.onExitLeft,
    this.onExitRight,
  });

  @override
  State<MusicCategoryTabs> createState() => _MusicCategoryTabsState();
}

class _MusicCategoryTabsState extends State<MusicCategoryTabs> {
  late int _highlight = widget.current;
  bool _pointerDown = false;

  @override
  void didUpdateWidget(MusicCategoryTabs old) {
    super.didUpdateWidget(old);
    if (old.current != widget.current) _highlight = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (has) {
        if (!has && _highlight != widget.current) {
          setState(() => _highlight = widget.current);
        }
      },
      onKeyEvent: (_, event) {
        if (!isActivateKey(event) || _highlight == widget.current) {
          return KeyEventResult.ignored;
        }
        widget.onOpen(_highlight);
        return KeyEventResult.handled;
      },
      child: Listener(
        onPointerDown: (_) => _pointerDown = true,
        onPointerUp: (_) => scheduleMicrotask(() => _pointerDown = false),
        onPointerCancel: (_) => _pointerDown = false,
        child: SlidingPillTabs(
          labels: widget.labels,
          selectedIndex: _highlight,
          onChanged: (index) {
            if (_pointerDown) {
              if (index != widget.current) widget.onOpen(index);
              return;
            }
            setState(() => _highlight = index);
          },
          focusNode: widget.focusNode,
          onVerticalNavigation: widget.onVerticalNavigation,
          onExitLeft: widget.onExitLeft,
          onExitRight: widget.onExitRight,
        ),
      ),
    );
  }
}

/// One stop in a music library's side rail: an icon or a playlist's art,
/// and its label, tinted with the accent while [selected].
class MusicRailItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? imageUrl;
  final bool selected;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback onNavigateLeft;
  final VoidCallback onNavigateRight;

  const MusicRailItem({
    super.key,
    required this.label,
    required this.selected,
    required this.focusNode,
    required this.onTap,
    required this.onNavigateLeft,
    required this.onNavigateRight,
    this.icon,
    this.imageUrl,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.accent;
    final color = selected
        ? accent
        : AppColorScheme.onSurface.withValues(alpha: 0.86);
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: focusNode,
      borderRadius: 10,
      disableScale: true,
      autoScroll: true,
      onSelect: onTap,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      onNavigateLeft: onNavigateLeft,
      onNavigateRight: onNavigateRight,
      child: Container(
        height: icon != null ? 44 : 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: selected ? accent.withValues(alpha: 0.16) : null,
          borderRadius: AppRadius.circular(10),
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(icon, size: 20, color: color)
            else
              ClipRRect(
                borderRadius: AppRadius.circular(6),
                child: SizedBox.square(
                  dimension: 32,
                  child: musicArt(imageUrl, icon: Icons.queue_music),
                ),
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: icon != null ? 15 : 14,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// One of Quick Access's category chips on phones, filled with the accent
/// when [selected].
class MusicChip extends StatelessWidget {
  final String label;
  final bool selected;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateRight;

  const MusicChip({
    super.key,
    required this.label,
    required this.selected,
    required this.focusNode,
    required this.onTap,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onNavigateLeft,
    this.onNavigateRight,
  });

  @override
  Widget build(BuildContext context) {
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: focusNode,
      borderRadius: 18,
      disableScale: true,
      autoScroll: true,
      onSelect: onTap,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      onNavigateLeft: onNavigateLeft,
      onNavigateRight: onNavigateRight,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? AppColorScheme.accent
              : AppColorScheme.onSurface.withValues(alpha: 0.08),
          borderRadius: AppRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected
                ? AppColorScheme.onAccent
                : AppColorScheme.onSurface.withValues(alpha: 0.9),
          ),
        ),
      ),
    );
  }
}

/// The notch on a panel that opens under a card, pointing up at the card.
class PanelCaretPainter extends CustomPainter {
  final Color color;

  const PanelCaretPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(PanelCaretPainter old) => old.color != color;
}
