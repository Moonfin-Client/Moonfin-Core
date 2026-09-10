import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import 'audiobook_glass.dart';
import 'audiobook_pointer.dart';
import 'chapter.dart';

class AudiobookChapterContextStrip extends StatelessWidget {
  const AudiobookChapterContextStrip({
    super.key,
    required this.chapters,
    required this.position,
    required this.onTap,
  });

  final List<Chapter> chapters;
  final Duration position;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (chapters.isEmpty) return const SizedBox.shrink();
    final apple = PlatformDetection.isApple;
    final l10n = AppLocalizations.of(context);
    final onSurface = AppColorScheme.onSurface;

    var current = 0;
    for (var i = 0; i < chapters.length; i++) {
      if (chapters[i].startMs <= position.inMilliseconds) {
        current = i;
      } else {
        break;
      }
    }
    final chapter = chapters[current];
    final nextStart = current + 1 < chapters.length
        ? chapters[current + 1].startMs
        : null;
    final progressInChapter = nextStart != null
        ? ((position.inMilliseconds - chapter.startMs) /
                  (nextStart - chapter.startMs))
              .clamp(0.0, 1.0)
        : 0.0;

    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceLg,
        vertical: AppSpacing.spaceMd,
      ),
      child: Row(
        children: [
          Icon(
            apple ? CupertinoIcons.bookmark : Icons.bookmark_outline,
            size: 18,
            color: AppColorScheme.accent,
          ),
          const SizedBox(width: AppSpacing.spaceSm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.audiobookChapterIndicator(current + 1, chapters.length),
                  style: TextStyle(
                    color: onSurface.withValues(alpha: 0.7),
                    fontSize: 11,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  chapter.title,
                  style: TextStyle(
                    color: onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (nextStart != null) ...[
                  const SizedBox(height: 6),
                  _MiniProgress(value: progressInChapter),
                ],
              ],
            ),
          ),
          // No chevron on TV: the strip is not in the focus order, so a
          // remote cannot open it.
          if (!PlatformDetection.isTV) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            Icon(
              apple ? CupertinoIcons.chevron_right : Icons.chevron_right,
              size: apple ? 18 : 24,
              color: onSurface.withValues(alpha: 0.5),
            ),
          ],
        ],
      ),
    );

    return audiobookClickable(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: audiobookGlassOrSolid(
          cornerRadius: 14,
          fallbackColor: AppColorScheme.surface.withValues(alpha: 0.55),
          child: content,
        ),
      ),
    );
  }
}

class _MiniProgress extends StatelessWidget {
  const _MiniProgress({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(color: AppColorScheme.onSurface.withValues(alpha: 0.18)),
            FractionallySizedBox(
              widthFactor: value.clamp(0.0, 1.0),
              alignment: Alignment.centerLeft,
              child: ColoredBox(color: AppColorScheme.accent),
            ),
          ],
        ),
      ),
    );
  }
}
