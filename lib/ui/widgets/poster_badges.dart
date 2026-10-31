import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/repositories/poster_badge_repository.dart';

/// The badges the admin's rules put on an item, stacked in the poster's corner. Draws
/// nothing until they arrive, and nothing at all for an item without any.
class PosterBadges extends StatefulWidget {
  final String itemId;

  /// Scales with the surrounding card so the pills do not dominate on TV.
  final double scale;

  /// Applied only when a badge draws, so a card without one keeps its spacing.
  final EdgeInsetsGeometry padding;

  const PosterBadges({
    super.key,
    required this.itemId,
    this.scale = 1.0,
    this.padding = EdgeInsets.zero,
  });

  @override
  State<PosterBadges> createState() => _PosterBadgesState();
}

class _PosterBadgesState extends State<PosterBadges> {
  /// More than this turns a poster into a sticker sheet. The admin orders the rules, so
  /// the first ones win.
  static const _maxBadges = 2;

  List<PosterBadge> _badges = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(PosterBadges oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Cards are recycled while scrolling, so a new item in the same slot has to drop the
    // previous item's badges.
    if (oldWidget.itemId != widget.itemId) {
      _badges = const [];
      _load();
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
    if (!mounted || itemId != widget.itemId || badges.isEmpty) return;

    setState(() => _badges = badges);
  }

  @override
  Widget build(BuildContext context) {
    if (_badges.isEmpty) return const SizedBox.shrink();

    final shown = _badges.take(_maxBadges).toList();

    return Padding(
      padding: widget.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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

/// Drawn like the anime pills over artwork, in the admin's colour.
class _BadgePill extends StatelessWidget {
  /// The server's own default, for a colour that doesnt parse.
  static const _fallbackColor = Color(0xFF2563EB);

  final PosterBadge badge;
  final double scale;

  const _BadgePill({required this.badge, required this.scale});

  static Color _parseColor(String hex) {
    final value = int.tryParse(hex.replaceFirst('#', ''), radix: 16);
    if (hex.length != 7 || value == null) return _fallbackColor;
    return Color(0xFF000000 | value);
  }

  @override
  Widget build(BuildContext context) {
    final color = _parseColor(badge.color);
    // The admin can pick any colour, so the text follows it to stay readable.
    final textColor =
        ThemeData.estimateBrightnessForColor(color) == Brightness.light
        ? Colors.black
        : Colors.white;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6 * scale, vertical: 2 * scale),
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadius.circular(4 * scale),
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
        style: TextStyle(
          color: textColor,
          fontSize: 10 * scale,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
