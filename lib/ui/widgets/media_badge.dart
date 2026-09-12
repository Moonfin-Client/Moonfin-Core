import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../theme/app_theme_controller.dart';

/// Common drop shadow applied to card-corner badges to guarantee contrast
/// separation across arbitrary light, dark, or saturated poster artwork.
const List<BoxShadow> kMediaBadgeShadow = [
  BoxShadow(
    color: Color(0x99000000), // Colors.black with alpha 0.60
    blurRadius: 4,
    offset: Offset(0, 1.5),
  ),
];

/// The circular checkmark badge indicating an item has been watched/finished.
class MediaWatchedBadge extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? iconColor;

  const MediaWatchedBadge({
    super.key,
    this.size = 24.0,
    this.color,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<AppThemeScope>();
    Theme.of(context);
    final bg = color ?? AppColorScheme.badgeWatched;
    final fg = iconColor ?? AppColorScheme.onBadge;
    final iconSize = (size * 0.62).clamp(12.0, 24.0);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(
          color: fg,
          width: 1.5,
        ),
        boxShadow: kMediaBadgeShadow,
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.check_rounded,
        color: fg,
        size: iconSize,
      ),
    );
  }
}

/// The pill badge indicating the number of unwatched episodes in a show or season.
class MediaUnplayedBadge extends StatelessWidget {
  final int count;
  final double height;
  final Color? color;
  final Color? textColor;

  const MediaUnplayedBadge({
    super.key,
    required this.count,
    this.height = 22.0,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<AppThemeScope>();
    Theme.of(context);
    final bg = color ?? AppColorScheme.badgeUnplayed;
    final fg = textColor ?? AppColorScheme.onBadge;
    final text = count > 99 ? '99+' : '$count';

    return Container(
      constraints: BoxConstraints(minWidth: height, minHeight: height),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(
          color: fg,
          width: 1.5,
        ),
        boxShadow: kMediaBadgeShadow,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: fg,
          fontSize: 11.5,
          fontWeight: FontWeight.bold,
          height: 1.2,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

/// The circular favorite badge indicating an item has been added to favorites.
class MediaFavoriteBadge extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? heartColor;

  const MediaFavoriteBadge({
    super.key,
    this.size = 24.0,
    this.color,
    this.heartColor,
  });

  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<AppThemeScope>();
    Theme.of(context);
    final bg = color ?? AppColorScheme.recordingActive;
    final fg = heartColor ?? Colors.white;
    final iconSize = (size * 0.58).clamp(12.0, 22.0);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(
          color: fg,
          width: 1.5,
        ),
        boxShadow: kMediaBadgeShadow,
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.favorite_rounded,
        color: fg,
        size: iconSize,
      ),
    );
  }
}
