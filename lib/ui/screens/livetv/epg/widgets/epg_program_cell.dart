import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../epg_genre.dart';

/// A single program in the guide grid. Pure presentation: the host positions it
/// (left/width along the timeline) and owns focus, passing [focused]. The genre
/// shows as a colored left bar on Material and a subtle dot on Apple; the on-now
/// program gets a LIVE badge + progress, scheduled recordings a red dot.
class EpgProgramCell extends StatelessWidget {
  final String title;
  final String? timeLabel;
  final EpgGenre genre;
  final bool isLive;
  final double progress; // 0..1
  final bool hasTimer;
  final bool focused;
  final bool apple;
  final bool showMeta; // false for very narrow cells

  const EpgProgramCell({
    super.key,
    required this.title,
    required this.timeLabel,
    required this.genre,
    required this.isLive,
    required this.progress,
    required this.hasTimer,
    required this.focused,
    required this.apple,
    this.showMeta = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = AppColorScheme.accent;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.55);
    final radius = apple ? 12.0 : 6.0;

    final Color bg;
    if (focused) {
      bg = apple
          ? Colors.white.withValues(alpha: 0.18)
          : const Color(0xFF1C2C3C);
    } else if (apple) {
      bg = Colors.white.withValues(alpha: 0.06);
    } else {
      bg = isLive
          ? genre.color.withValues(alpha: 0.14)
          : AppColorScheme.surface.withValues(alpha: 0.5);
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.circular(radius),
        border: focused
            ? Border.all(color: accent, width: apple ? 1.5 : 2)
            : null,
      ),
      child: Stack(
        children: [
          if (!apple)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(width: 4, color: genre.color),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(apple ? 10 : 12, 6, 8, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (apple) ...[
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: genre.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    if (isLive && showMeta) ...[
                      _liveBadge(genre.color),
                      const SizedBox(width: 6),
                    ],
                    Flexible(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight:
                              focused || isLive ? FontWeight.w600 : FontWeight.w400,
                          color: AppColorScheme.onSurface,
                        ),
                      ),
                    ),
                    if (hasTimer) ...[
                      const SizedBox(width: 6),
                      const Icon(Icons.fiber_manual_record,
                          size: 9, color: Color(0xFFE0685C)),
                    ],
                  ],
                ),
                if (showMeta && timeLabel != null) ...[
                  const SizedBox(height: 3),
                  Text(timeLabel!,
                      style: textTheme.labelSmall?.copyWith(color: muted)),
                ],
              ],
            ),
          ),
          if (isLive && progress > 0)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                minHeight: 3,
                backgroundColor: Colors.white.withValues(alpha: 0.12),
                valueColor: AlwaysStoppedAnimation<Color>(
                    apple ? accent : genre.color),
              ),
            ),
        ],
      ),
    );
  }

  Widget _liveBadge(Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppRadius.circular(4),
        ),
        child: const Text('LIVE',
            style: TextStyle(
                fontSize: 8.5, fontWeight: FontWeight.w700, color: Colors.white)),
      );
}
