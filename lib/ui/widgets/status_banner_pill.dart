import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Floating glass pill shared by the transient status banners, so the offline
/// and update banners cannot drift apart visually.
class StatusBannerPill extends StatelessWidget {
  final IconData icon;
  final Color tint;
  final String title;
  final String? subtitle;
  final List<Widget> trailing;

  const StatusBannerPill({
    super.key,
    required this.icon,
    required this.tint,
    required this.title,
    this.subtitle,
    this.trailing = const [],
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;

    return GlassSurface(
      cornerRadius: 16,
      reinforced: true,
      fallbackColor: AppColorScheme.surfaceVariant.withValues(alpha: 0.95),
      padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: tint.withValues(alpha: 0.16),
              borderRadius: AppRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: tint),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: onSurface.withValues(alpha: 0.6),
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ...trailing,
        ],
      ),
    );
  }
}

/// Pill-shaped tappable action inside a status banner.
class BannerActionCapsule extends StatelessWidget {
  final String label;
  final Color tint;
  final VoidCallback onTap;

  const BannerActionCapsule({
    super.key,
    required this.label,
    required this.tint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: tint.withValues(alpha: 0.14),
      borderRadius: AppRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          child: Text(
            label,
            style: TextStyle(
              color: tint,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/// Thin bar that drains while a banner's auto-dismiss timer counts down.
class BannerCountdownBar extends StatelessWidget {
  final Duration duration;
  final Color color;

  const BannerCountdownBar({
    super.key,
    required this.duration,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 3,
      child: ClipRRect(
        borderRadius: AppRadius.circular(2),
        child: ColoredBox(
          color: AppColorScheme.onSurface.withValues(alpha: 0.14),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: 0),
            duration: duration,
            builder: (context, value, _) => FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: value,
              child: ColoredBox(color: color.withValues(alpha: 0.7)),
            ),
          ),
        ),
      ),
    );
  }
}
