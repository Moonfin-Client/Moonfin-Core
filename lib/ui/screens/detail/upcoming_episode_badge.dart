import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The next air date pill on a details screen.
///
/// Nouveau scales its own to match that hero. Every other style draws this.
class UpcomingEpisodeBadge extends StatelessWidget {
  const UpcomingEpisodeBadge({
    super.key,
    required this.text,
    this.borderRadius,
  });

  final String text;

  /// Defaults to the radius the pixel theme squares off.
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColorScheme.accent.withValues(alpha: 0.2),
        borderRadius: borderRadius ?? AppRadius.circular(4),
        border: Border.all(
          color: AppColorScheme.accent.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.event_available, size: 12, color: AppColorScheme.accent),
          const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColorScheme.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
