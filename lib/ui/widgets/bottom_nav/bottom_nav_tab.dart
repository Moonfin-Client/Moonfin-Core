import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../image_source.dart';
import '../unread_badge.dart';
import 'bottom_nav_metrics.dart';

/// What a bar style needs to draw one cell, with no services behind it, so
/// the setup wizard can draw the real bars from sample data.
class BottomNavItemView {
  final String id;
  final String label;
  final int slot;
  final Widget Function(bool active, double size, Color color) icon;
  final int badge;

  const BottomNavItemView({
    required this.id,
    required this.label,
    required this.slot,
    required this.icon,
    this.badge = 0,
  });
}

/// One tab: icon over label, lit when [active].
class BottomNavTabCell extends StatelessWidget {
  final BottomNavItemView item;
  final bool active;
  final Color color;
  final TextStyle labelStyle;
  final bool showLabel;
  final VoidCallback? onTap;

  const BottomNavTabCell({
    super.key,
    required this.item,
    required this.active,
    required this.color,
    required this.labelStyle,
    this.showLabel = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Labels share a narrow cell, so a large text setting shrinks them to fit
    // rather than pushing the icon out of the bar.
    final textScaler = MediaQuery.textScalerOf(context).clamp(
      maxScaleFactor: 1.15,
    );
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UnreadBadge(
          count: item.badge,
          child: item.icon(active, BottomNavMetrics.iconSize, color),
        ),
        if (showLabel) ...[
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              item.label,
              maxLines: 1,
              textScaler: textScaler,
              style: labelStyle,
            ),
          ),
        ],
      ],
    );

    Widget cell = InkResponse(
      onTap: onTap,
      containedInkWell: true,
      highlightShape: BoxShape.rectangle,
      borderRadius: AppRadius.circular(BottomNavMetrics.indicatorRadius),
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Center(child: content),
        ),
      ),
    );
    if (!showLabel) {
      cell = Tooltip(
        message: item.label,
        excludeFromSemantics: true,
        child: cell,
      );
    }

    return Semantics(
      button: true,
      selected: active,
      label: item.label,
      excludeSemantics: true,
      child: cell,
    );
  }
}

/// The signed in user's picture, falling back to their initial.
class BottomNavAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final double size;
  final Color ring;
  final Color fallbackColor;

  const BottomNavAvatar({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.size,
    required this.ring,
    required this.fallbackColor,
  });

  @override
  Widget build(BuildContext context) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
    final fallback = Container(
      color: fallbackColor.withValues(alpha: 0.18),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: TextStyle(
          color: fallbackColor,
          fontSize: size * 0.46,
          fontWeight: FontWeight.w700,
          height: 1,
          decoration: TextDecoration.none,
        ),
      ),
    );
    final url = imageUrl;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: AppColorScheme.isPixel ? BoxShape.rectangle : BoxShape.circle,
        border: Border.all(color: ring, width: 2),
      ),
      child: ClipOval(
        clipBehavior: AppColorScheme.isPixel ? Clip.none : Clip.antiAlias,
        child: url == null
            ? fallback
            : Image.network(
                url,
                headers: serverImageHeaders,
                fit: BoxFit.cover,
                cacheWidth: ArtworkDecode.widthFor(
                  size,
                  MediaQuery.devicePixelRatioOf(context),
                ),
                errorBuilder: (_, _, _) => fallback,
              ),
      ),
    );
  }
}
