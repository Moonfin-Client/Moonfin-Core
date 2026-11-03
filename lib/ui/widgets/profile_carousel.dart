import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'user_avatar_image.dart';

enum ProfileBadge { none, active, pin }

class ProfileEntry {
  const ProfileEntry({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.badge = ProfileBadge.none,
  });

  final String id;
  final String name;
  final String? avatarUrl;
  final ProfileBadge badge;
}

const _initialsColors = [
  Color(0xFF2B6CB0),
  Color(0xFF9C4221),
  Color(0xFF2F855A),
  Color(0xFF6B46C1),
  Color(0xFFB83280),
  Color(0xFF2C7A7B),
];

/// Smart-TV picks the color the same way, so a user keeps theirs across apps.
Color profileInitialsColor(String id) {
  final sum = id.codeUnits.fold<int>(0, (total, unit) => total + unit);
  return _initialsColors[sum % _initialsColors.length];
}

const _badgeCutout = Color(0xFF10131F);
const _slide = Duration(milliseconds: 220);

/// A round avatar that fills its parent: the user's image, or their initial
/// on a color of their own, with an optional focus ring and corner badge.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.entry,
    this.ringColor,
    this.decodeSize = 168,
  });

  final ProfileEntry entry;
  final Color? ringColor;

  /// The size the image is decoded at. Carousel avatars change size as they
  /// slide, so they decode once at the largest.
  final double decodeSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest.shortestSide;
        final ring = (size * 0.025).clamp(2.0, 4.0);
        final initial = entry.name.trim().characters.firstOrNull;
        final fallback = initial == null
            ? ColoredBox(
                color: AppColorScheme.onSurface.withValues(alpha: 0.1),
                child: Icon(
                  Icons.person,
                  size: size * 0.5,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                ),
              )
            : ColoredBox(
                color: profileInitialsColor(entry.id),
                child: Center(
                  child: Text(
                    initial.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size * 0.43,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ),
              );
        // The name is always shown or labeled beside it, so the initial would
        // only be read out twice.
        return ExcludeSemantics(
          child: SizedBox.expand(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: ClipOval(
                    child: UserAvatarImage(
                      url: entry.avatarUrl,
                      size: decodeSize,
                      fallback: fallback,
                    ),
                  ),
                ),
                if (ringColor != null)
                  Positioned(
                    left: -2 * ring,
                    top: -2 * ring,
                    right: -2 * ring,
                    bottom: -2 * ring,
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ringColor!, width: ring),
                        ),
                      ),
                    ),
                  ),
                if (entry.badge != ProfileBadge.none && size >= 40)
                  Positioned(
                    right: -ring,
                    bottom: -ring,
                    child: _Badge(badge: entry.badge, size: size),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.badge, required this.size});

  final ProfileBadge badge;
  final double size;

  @override
  Widget build(BuildContext context) {
    final diameter = (size * 0.28).clamp(16.0, 48.0);
    final active = badge == ProfileBadge.active;
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active
            ? Theme.of(context).colorScheme.primary
            : const Color(0xFF1C2238),
        border: Border.all(
          color: _badgeCutout,
          width: (diameter * 0.09).clamp(2.0, 4.0),
        ),
      ),
      child: Icon(
        active ? Icons.check_rounded : Icons.lock_outline,
        size: diameter * 0.55,
        color: active ? const Color(0xFF04131A) : Colors.white,
      ),
    );
  }
}

class ProfileStatusLine extends StatelessWidget {
  const ProfileStatusLine(this.text, {super.key, this.icon, this.color});

  final String text;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style;
    final resolved = color == null ? style : style.copyWith(color: color);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: (style.fontSize ?? 14) * 1.05,
            color: resolved.color,
          ),
          const SizedBox(width: 6),
        ],
        Flexible(
          child: Text(
            text,
            style: resolved,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// The TV and desktop account picker: the selected profile big in the
/// middle, with two neighbors either side getting smaller and fainter.
///
/// Left and Right move the selection, Select activates it. A click on a
/// neighbor selects it and a click on the middle one activates it.
class ProfileCarousel extends StatefulWidget {
  const ProfileCarousel({
    super.key,
    required this.entries,
    required this.selected,
    required this.onSelected,
    required this.onActivate,
    this.subtitle,
    this.focusNode,
    this.autofocus = false,
  });

  final List<ProfileEntry> entries;
  final int selected;
  final ValueChanged<int> onSelected;
  final ValueChanged<int> onActivate;

  /// Lines under the selected profile's name.
  final Widget? subtitle;
  final FocusNode? focusNode;
  final bool autofocus;

  static const heroSize = 168.0;
  static const nearSize = 100.0;
  static const farSize = 72.0;
  static const nearOffset = 188.0;
  static const farOffset = 314.0;

  @override
  State<ProfileCarousel> createState() => _ProfileCarouselState();
}

class _ProfileCarouselState extends State<ProfileCarousel> {
  static const _ringRoom = 8.0;

  FocusNode? _ownNode;
  FocusNode get _node => widget.focusNode ?? (_ownNode ??= FocusNode());
  bool _focused = false;

  @override
  void dispose() {
    _ownNode?.dispose();
    super.dispose();
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.arrowRight) {
      final next =
          widget.selected + (key == LogicalKeyboardKey.arrowLeft ? -1 : 1);
      if (next >= 0 && next < widget.entries.length) widget.onSelected(next);
      // Held at the ends too, there's nothing beside the carousel to go to.
      return KeyEventResult.handled;
    }
    if (event is KeyDownEvent &&
        (key == LogicalKeyboardKey.select || key == LogicalKeyboardKey.enter) &&
        widget.entries.isNotEmpty) {
      widget.onActivate(widget.selected);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final entries = widget.entries;
    final accent = Theme.of(context).colorScheme.primary;
    final onSurface = AppColorScheme.onSurface;
    final selected = widget.selected.clamp(
      0,
      entries.isEmpty ? 0 : entries.length - 1,
    );
    return Focus(
      focusNode: _node,
      autofocus: widget.autofocus,
      onFocusChange: (focused) => setState(() => _focused = focused),
      onKeyEvent: _onKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: ProfileCarousel.heroSize + 2 * _ringRoom,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final center = constraints.maxWidth / 2;
                final showFar =
                    constraints.maxWidth >=
                    2 *
                        (ProfileCarousel.farOffset +
                            ProfileCarousel.farSize / 2);
                // Tablets get this layout too, so it takes a swipe.
                return _SwipeDetector(
                  behavior: HitTestBehavior.translucent,
                  onPrevious: selected > 0
                      ? () => widget.onSelected(selected - 1)
                      : null,
                  onNext: selected < entries.length - 1
                      ? () => widget.onSelected(selected + 1)
                      : null,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      for (var i = 0; i < entries.length; i++)
                        _slot(i, selected, center, showFar, accent, onSurface),
                    ],
                  ),
                );
              },
            ),
          ),
          if (entries.isNotEmpty) ...[
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Column(
                key: ValueKey(selected),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    entries[selected].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: onSurface,
                    ),
                  ),
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 6),
                    DefaultTextStyle.merge(
                      style: TextStyle(
                        fontSize: 16,
                        color: onSurface.withValues(alpha: 0.65),
                      ),
                      textAlign: TextAlign.center,
                      child: widget.subtitle!,
                    ),
                  ],
                ],
              ),
            ),
          ],
          if (entries.length > 1) ...[
            const SizedBox(height: 26),
            ProfileDots(count: entries.length, selected: selected),
          ],
        ],
      ),
    );
  }

  Widget _slot(
    int index,
    int selected,
    double center,
    bool showFar,
    Color accent,
    Color onSurface,
  ) {
    final offset = index - selected;
    final distance = offset.abs();
    final visible = distance <= 1 || (distance == 2 && showFar);
    final size = switch (distance) {
      0 => ProfileCarousel.heroSize,
      1 => ProfileCarousel.nearSize,
      _ => ProfileCarousel.farSize,
    };
    final dx =
        switch (distance) {
          0 => 0.0,
          1 => ProfileCarousel.nearOffset,
          2 => ProfileCarousel.farOffset,
          _ => ProfileCarousel.farOffset + ProfileCarousel.farSize + 40,
        } *
        offset.sign;
    final opacity = !visible
        ? 0.0
        : switch (distance) {
            0 => 1.0,
            1 => 0.55,
            _ => 0.3,
          };
    return AnimatedPositioned(
      key: ValueKey(index),
      duration: _slide,
      curve: Curves.easeOutCubic,
      left: center + dx - size / 2,
      top: _ringRoom + (ProfileCarousel.heroSize - size) / 2,
      width: size,
      height: size,
      child: AnimatedOpacity(
        duration: _slide,
        opacity: opacity,
        child: IgnorePointer(
          ignoring: !visible,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                _node.requestFocus();
                if (distance == 0) {
                  widget.onActivate(index);
                } else {
                  widget.onSelected(index);
                }
              },
              child: ProfileAvatar(
                entry: widget.entries[index],
                ringColor: distance == 0
                    ? (_focused ? accent : onSurface.withValues(alpha: 0.25))
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Calls [onPrevious] or [onNext] for a horizontal swipe. It goes by how far
/// the finger moved as well as how fast it let go, since a slow drag ends with
/// no speed at all.
class _SwipeDetector extends StatefulWidget {
  const _SwipeDetector({
    required this.child,
    required this.behavior,
    this.onPrevious,
    this.onNext,
  });

  final Widget child;
  final HitTestBehavior behavior;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  State<_SwipeDetector> createState() => _SwipeDetectorState();
}

class _SwipeDetectorState extends State<_SwipeDetector> {
  static const _minDistance = 48.0;
  static const _minVelocity = 300.0;

  double _distance = 0;

  void _onEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    final direction = _distance.abs() >= _minDistance
        ? _distance.sign
        : (velocity.abs() >= _minVelocity ? velocity.sign : 0);
    if (direction < 0) widget.onNext?.call();
    if (direction > 0) widget.onPrevious?.call();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: widget.behavior,
    onHorizontalDragStart: (_) => _distance = 0,
    onHorizontalDragUpdate: (details) => _distance += details.primaryDelta ?? 0,
    onHorizontalDragEnd: _onEnd,
    child: widget.child,
  );
}

class ProfileDots extends StatelessWidget {
  const ProfileDots({super.key, required this.count, required this.selected});

  final int count;
  final int selected;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    return ExcludeSemantics(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < count; i++)
            AnimatedContainer(
              duration: _slide,
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              width: i == selected ? 24 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: i == selected
                    ? accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}

/// The phone picker's big avatar with the name under it. A horizontal swipe
/// moves to the previous or next profile.
class ProfileHero extends StatelessWidget {
  const ProfileHero({
    super.key,
    required this.entry,
    this.subtitle,
    this.onPrevious,
    this.onNext,
  });

  final ProfileEntry entry;
  final Widget? subtitle;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return _SwipeDetector(
      behavior: HitTestBehavior.opaque,
      onPrevious: onPrevious,
      onNext: onNext,
      // Full width, so a swipe that starts beside the avatar still counts.
      child: SizedBox(
        width: double.infinity,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 180),
          child: Column(
            key: ValueKey(entry.id),
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: 120,
                child: ProfileAvatar(
                  entry: entry,
                  ringColor: Theme.of(context).colorScheme.primary,
                  decodeSize: 120,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                entry.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  color: onSurface,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: 14,
                    color: onSurface.withValues(alpha: 0.65),
                  ),
                  textAlign: TextAlign.center,
                  child: subtitle!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePrimaryButton extends StatelessWidget {
  const ProfilePrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final onAccent =
        ThemeData.estimateBrightnessForColor(accent) == Brightness.dark
        ? Colors.white
        : const Color(0xFF04131A);
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: onAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: Theme.of(context).textTheme.labelLarge
              ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}

/// The phone picker's row of small avatars, with an optional add button at
/// the end. Tapping one selects it, and the row scrolls to keep the selected
/// one in view.
class ProfileStrip extends StatefulWidget {
  const ProfileStrip({
    super.key,
    required this.entries,
    required this.selected,
    required this.onSelected,
    this.onAdd,
    this.addLabel,
  });

  final List<ProfileEntry> entries;
  final int selected;
  final ValueChanged<int> onSelected;
  final VoidCallback? onAdd;
  final String? addLabel;

  @override
  State<ProfileStrip> createState() => _ProfileStripState();
}

class _ProfileStripState extends State<ProfileStrip> {
  static const _size = 44.0;
  static const _slot = _size + 14;

  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _reveal(animate: false),
    );
  }

  @override
  void didUpdateWidget(covariant ProfileStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _reveal());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // A row too wide for the screen starts at the left edge, so slot i sits at
  // i * _slot.
  void _reveal({bool animate = true}) {
    if (!mounted || !_controller.hasClients) return;
    final position = _controller.position;
    final target =
        (widget.selected * _slot + _slot / 2 - position.viewportDimension / 2)
            .clamp(0.0, position.maxScrollExtent);
    if (animate) {
      _controller.animateTo(
        target,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    } else {
      _controller.jumpTo(target);
    }
  }

  @override
  Widget build(BuildContext context) {
    final entries = widget.entries;
    final selected = widget.selected;
    final accent = Theme.of(context).colorScheme.primary;
    final onSurface = AppColorScheme.onSurface;
    return SizedBox(
      height: _size + 16,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < entries.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Semantics(
                      button: true,
                      selected: i == selected,
                      label: entries[i].name,
                      child: GestureDetector(
                        onTap: () => widget.onSelected(i),
                        child: SizedBox.square(
                          dimension: _size,
                          child: ProfileAvatar(
                            entry: entries[i],
                            ringColor: i == selected ? accent : null,
                            decodeSize: _size,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget.onAdd != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Semantics(
                      button: true,
                      label: widget.addLabel,
                      child: Material(
                        type: MaterialType.transparency,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: onSurface.withValues(alpha: 0.35),
                            width: 1.5,
                          ),
                        ),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: widget.onAdd,
                          child: SizedBox.square(
                            dimension: _size,
                            child: Icon(
                              Icons.add,
                              size: 22,
                              color: onSurface.withValues(alpha: 0.75),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
