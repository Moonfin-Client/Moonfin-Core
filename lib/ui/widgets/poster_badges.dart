import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/repositories/poster_badge_repository.dart';
import '../../preference/user_preferences.dart';

/// The labels the admin's rules put in one corner of an item's poster, stacked away
/// from the corner. Draws nothing until they arrive, and nothing at all for an item
/// without any there.
class PosterBadges extends StatefulWidget {
  final String itemId;

  /// Scales with the surrounding card so the pills do not dominate on TV.
  final double scale;

  /// Applied only when a badge draws, so a card without one keeps its spacing.
  final EdgeInsetsGeometry padding;

  final PosterBadgeCorner corner;

  const PosterBadges({
    super.key,
    required this.itemId,
    this.scale = 1.0,
    this.padding = EdgeInsets.zero,
    this.corner = PosterBadgeCorner.topLeft,
  });

  @override
  State<PosterBadges> createState() => _PosterBadgesState();
}

class _PosterBadgesState extends State<PosterBadges> {
  List<PosterBadge> _badges = const [];

  /// Asked from build rather than initState, so a card drawn while labels were off
  /// still loads them once the person turns them back on.
  bool _requested = false;

  PosterBadgeRepository? _repository;

  @override
  void initState() {
    super.initState();
    if (GetIt.instance.isRegistered<PosterBadgeRepository>()) {
      _repository = GetIt.instance<PosterBadgeRepository>()
        ..rulesChanged.addListener(_onRulesChanged);
    }
  }

  @override
  void dispose() {
    _repository?.rulesChanged.removeListener(_onRulesChanged);
    super.dispose();
  }

  /// The admin changed the rules. The current labels stay until the new ones arrive.
  void _onRulesChanged() {
    if (!mounted) return;
    setState(() => _requested = false);
  }

  @override
  void didUpdateWidget(PosterBadges oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Cards are recycled while scrolling, so a new item in the same slot has to drop the
    // previous item's badges.
    if (oldWidget.itemId != widget.itemId) {
      _badges = const [];
      _requested = false;
    }
  }

  Future<void> _load() async {
    final itemId = widget.itemId;
    if (itemId.isEmpty ||
        !GetIt.instance.isRegistered<PosterBadgeRepository>()) {
      return;
    }

    final repository = GetIt.instance<PosterBadgeRepository>();

    final cached = repository.peek(itemId);
    if (cached != null) {
      _badges = cached;
      return;
    }

    final badges = await repository.getForItem(itemId);
    // The card may show another item by now.
    if (!mounted || itemId != widget.itemId) return;
    // Nothing before and nothing now, so no rebuild. After a rule change the old
    // labels have to go even when the new answer is none.
    if (badges.isEmpty && _badges.isEmpty) return;

    setState(() => _badges = badges);
  }

  @override
  Widget build(BuildContext context) {
    if (!GetIt.instance<UserPreferences>().get(UserPreferences.showPosterLabels)) {
      return const SizedBox.shrink();
    }

    if (!_requested) {
      _requested = true;
      // Sets the badges straight away when they are already known, before the
      // lines below read them.
      _load();
    }

    if (_badges.isEmpty) return const SizedBox.shrink();

    final corner = widget.corner;
    // The admin orders the rules, so the first ones win the corner.
    final shown = _badges
        .where((badge) => badge.corner == corner)
        .take(GetIt.instance<PosterBadgeRepository>().maxPerCorner)
        .toList();
    if (shown.isEmpty) return const SizedBox.shrink();

    final right =
        corner == PosterBadgeCorner.topRight ||
        corner == PosterBadgeCorner.bottomRight;
    final bottom =
        corner == PosterBadgeCorner.bottomLeft ||
        corner == PosterBadgeCorner.bottomRight;

    return Padding(
      padding: widget.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: right
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        // A bottom corner stacks upwards, so the first label sits in the corner.
        verticalDirection: bottom ? VerticalDirection.up : VerticalDirection.down,
        children: [
          for (var i = 0; i < shown.length; i++) ...[
            if (i > 0) SizedBox(height: 4 * widget.scale),
            _BadgePill(badge: shown[i], scale: widget.scale),
          ],
        ],
      ),
    );
  }
}

/// The other three corners, for a card whose top-left already holds its own column of
/// badges. Fills the card, so it goes in a [Positioned.fill].
class PosterBadgeCorners extends StatelessWidget {
  final String itemId;
  final double scale;

  /// Where the top-right labels start, below the card's watched tick when it has one.
  final double top;

  /// Where the bottom labels start, above the card's progress bar when it has one.
  final double bottom;

  const PosterBadgeCorners({
    super.key,
    required this.itemId,
    this.scale = 1.0,
    this.top = 6,
    this.bottom = 6,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: top,
            left: 6,
            right: 6,
            child: PosterBadges(
              itemId: itemId,
              scale: scale,
              corner: PosterBadgeCorner.topRight,
            ),
          ),
          for (final corner in const [
            PosterBadgeCorner.bottomLeft,
            PosterBadgeCorner.bottomRight,
          ])
            Positioned(
              bottom: bottom,
              left: 6,
              right: 6,
              child: PosterBadges(itemId: itemId, scale: scale, corner: corner),
            ),
        ],
      ),
    );
  }
}

/// Labels drawn without asking the server, for the settings preview.
class PosterBadgeSample extends StatelessWidget {
  final List<PosterBadge> badges;
  final double scale;

  const PosterBadgeSample({super.key, required this.badges, this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < badges.length; i++) ...[
          if (i > 0) SizedBox(height: 4 * scale),
          _BadgePill(badge: badges[i], scale: scale),
        ],
      ],
    );
  }
}

/// Drawn in the admin's style and colour. Kept in step with labelBadgeCss in the
/// Moonbase admin page, so its preview matches the apps.
class _BadgePill extends StatelessWidget {
  /// The server's own default, for a colour that doesnt parse.
  static const _fallbackColor = Color(0xFF2563EB);

  static const _sizes = {
    'small': 0.8,
    'medium': 1.0,
    'large': 1.25,
    'xlarge': 1.5,
  };

  final PosterBadge badge;
  final double scale;

  const _BadgePill({required this.badge, required this.scale});

  static Color? _parseColor(String hex) {
    final value = int.tryParse(hex.replaceFirst('#', ''), radix: 16);
    if (hex.length != 7 || value == null) return null;
    return Color(0xFF000000 | value);
  }

  @override
  Widget build(BuildContext context) {
    final color = _parseColor(badge.color) ?? _fallbackColor;
    final alpha = badge.opacity.clamp(10, 100) / 100;
    final luminance = color.computeLuminance();

    // Opacity fades the fill and the border. The text stays solid so it stays readable.
    final Color background;
    final Color text;
    Border? border;
    switch (badge.style) {
      case 'glass':
        background = color.withValues(alpha: 0.45 * alpha);
        border = Border.all(
          color: Colors.white.withValues(alpha: 0.35 * alpha),
        );
        text = Colors.white;
      case 'outline':
        background = Colors.black.withValues(alpha: 0.55 * alpha);
        border = Border.all(
          color: color.withValues(alpha: alpha),
          width: 1.5,
        );
        text = luminance < 0.05 ? Colors.white : color;
      case 'dark':
        background = const Color(0xFF0C0C10).withValues(alpha: 0.85 * alpha);
        text = luminance < 0.05 ? Colors.white : color;
      case 'light':
        background = Colors.white.withValues(alpha: 0.92 * alpha);
        text = luminance > 0.4 ? const Color(0xFF111111) : color;
      default:
        background = color.withValues(alpha: alpha);
        // The admin can pick any colour, so the text follows it to stay readable.
        text = ThemeData.estimateBrightnessForColor(color) == Brightness.light
            ? Colors.black
            : Colors.white;
    }

    final size = scale * (_sizes[badge.size] ?? 1.0);
    final radius = switch (badge.shape) {
      'pill' => AppRadius.circular(999),
      'square' => BorderRadius.zero,
      _ => AppRadius.circular(4 * size),
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6 * size, vertical: 2 * size),
      decoration: BoxDecoration(
        color: background,
        border: border,
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.35),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        badge.label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: _parseColor(badge.textColor) ?? text,
          fontSize: 10 * size,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
