import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'audiobook_time.dart';
import '../../../data/services/audiobook_bookmarks_service.dart';
import '../../../data/services/audiobook_notes_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import 'chapter.dart';

class AudiobookBookOverview extends StatelessWidget {
  const AudiobookBookOverview({
    super.key,
    required this.position,
    required this.duration,
    required this.chapters,
    required this.bookmarks,
    required this.notes,
  });

  final Duration position;
  final Duration duration;
  final List<Chapter> chapters;
  final List<AudiobookBookmark> bookmarks;
  final List<AudiobookNote> notes;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final maxMs = duration.inMilliseconds.toDouble();
    final fraction =
        maxMs > 0 ? (position.inMilliseconds / maxMs).clamp(0.0, 1.0) : 0.0;
    final percent = (fraction * 100).round();
    final remaining = duration - position;
    final noteColor = AppColorScheme.navColorCycle.length >= 2
        ? AppColorScheme.navColorCycle[1]
        : Theme.of(context).colorScheme.secondary;
    final captionStyle = TextStyle(
      fontSize: 11,
      color: AppColorScheme.onSurface.withValues(alpha: 0.5),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            height: 8,
            child: CustomPaint(
              size: Size.infinite,
              painter: _BookOverviewPainter(
                fraction: fraction.toDouble(),
                chapters: chapters,
                bookmarks: bookmarks,
                notes: notes,
                durationMs: maxMs.toInt(),
                grouped: chapters.length > 40,
                trackColor: AppColorScheme.rangeTrack,
                fillColor: AppColorScheme.rangeProgress,
                chapterColor: AppColorScheme.onSurface.withValues(alpha: 0.35),
                bookmarkColor: AppColorScheme.accent,
                noteColor: noteColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.percentCompleted(percent),
                  style: captionStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Text(
                  formatAudiobookClock(position),
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  l10n.audiobookSleepRemaining(formatAudiobookClock(remaining)),
                  style: captionStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BookOverviewPainter extends CustomPainter {
  _BookOverviewPainter({
    required this.fraction,
    required this.chapters,
    required this.bookmarks,
    required this.notes,
    required this.durationMs,
    required this.grouped,
    required this.trackColor,
    required this.fillColor,
    required this.chapterColor,
    required this.bookmarkColor,
    required this.noteColor,
  });

  final double fraction;
  final List<Chapter> chapters;
  final List<AudiobookBookmark> bookmarks;
  final List<AudiobookNote> notes;
  final int durationMs;
  final bool grouped;
  final Color trackColor;
  final Color fillColor;
  final Color chapterColor;
  final Color bookmarkColor;
  final Color noteColor;

  @override
  void paint(Canvas canvas, Size size) {
    final cy = size.height / 2;

    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(0, cy), Offset(size.width, cy), trackPaint);

    if (fraction > 0) {
      final fillPaint = Paint()
        ..color = fillColor
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
          Offset(0, cy), Offset(size.width * fraction, cy), fillPaint);
    }

    if (durationMs <= 0) return;

    final chapterPaint = Paint()
      ..color = chapterColor
      ..strokeWidth = 1.2;
    if (grouped) {
      final step = (chapters.length / 10).ceil();
      for (var i = 0; i < chapters.length; i += step) {
        final x = (chapters[i].startMs / durationMs) * size.width;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), chapterPaint);
      }
    } else {
      for (final c in chapters) {
        final x = (c.startMs / durationMs) * size.width;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), chapterPaint);
      }
    }

    final bookmarkPaint = Paint()
      ..color = bookmarkColor
      ..strokeWidth = 1.6;
    for (final b in bookmarks) {
      final x = (b.positionMs / durationMs) * size.width;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), bookmarkPaint);
    }

    final notePaint = Paint()
      ..color = noteColor
      ..strokeWidth = 1.6;
    for (final n in notes) {
      final x = (n.positionMs / durationMs) * size.width;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), notePaint);
    }
  }

  @override
  bool shouldRepaint(_BookOverviewPainter old) =>
      old.fraction != fraction ||
      old.chapters != chapters ||
      old.bookmarks != bookmarks ||
      old.notes != notes ||
      old.durationMs != durationMs;
}

class _FocusedSliderThumbShape extends SliderComponentShape {
  const _FocusedSliderThumbShape({
    required this.enabledThumbRadius,
    required this.isTvFocused,
  });

  final double enabledThumbRadius;
  final bool isTvFocused;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(enabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    if (isTvFocused) {
      final paintOuter = Paint()
        ..color = AppColorScheme.accent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
      canvas.drawCircle(center, enabledThumbRadius + 4.0, paintOuter);
    }

    final paintInner = Paint()
      ..color = isTvFocused
          ? Colors.white
          : (sliderTheme.thumbColor ?? AppColorScheme.rangeThumb);
    canvas.drawCircle(center, enabledThumbRadius, paintInner);
  }
}

/// The primary scrubber: a 1-hour window centered on the current position so a
/// 17+ hour book stays draggable with real precision.
class AudiobookZoomedProgressBar extends StatelessWidget {
  const AudiobookZoomedProgressBar({
    super.key,
    required this.position,
    required this.duration,
    required this.chapters,
    required this.bookmarks,
    required this.notes,
    required this.isTvFocused,
    required this.onSeek,
  });

  final Duration position;
  final Duration duration;
  final List<Chapter> chapters;
  final List<AudiobookBookmark> bookmarks;
  final List<AudiobookNote> notes;
  final bool isTvFocused;
  final ValueChanged<Duration> onSeek;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final apple = PlatformDetection.isApple;
    final totalMs = duration.inMilliseconds.toDouble();
    final posMs = position.inMilliseconds.toDouble().clamp(0, totalMs);

    final double startMs;
    final double endMs;

    const double oneHourMs = 3600000.0;
    const double halfHourMs = 1800000.0;

    if (totalMs <= oneHourMs) {
      startMs = 0.0;
      endMs = totalMs > 0 ? totalMs : 1.0;
    } else {
      if (posMs < halfHourMs) {
        startMs = 0.0;
        endMs = oneHourMs;
      } else if (posMs > totalMs - halfHourMs) {
        startMs = totalMs - oneHourMs;
        endMs = totalMs;
      } else {
        startMs = posMs - halfHourMs;
        endMs = posMs + halfHourMs;
      }
    }

    final sliderValue = posMs.clamp(startMs, endMs).toDouble();

    final Widget slider;
    if (apple) {
      slider = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CupertinoSlider(
          value: sliderValue,
          min: startMs,
          max: endMs,
          activeColor: AppColorScheme.rangeProgress,
          onChanged: (v) => onSeek(Duration(milliseconds: v.toInt())),
        ),
      );
    } else {
      slider = SliderTheme(
        data: SliderThemeData(
          trackHeight: 4,
          thumbShape: _FocusedSliderThumbShape(
            enabledThumbRadius: 8,
            isTvFocused: isTvFocused,
          ),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          activeTrackColor: AppColorScheme.rangeProgress,
          inactiveTrackColor: AppColorScheme.rangeTrack,
          thumbColor: isTvFocused ? Colors.white : AppColorScheme.rangeThumb,
          overlayColor: AppColorScheme.rangeThumb.withValues(alpha: 0.2),
        ),
        child: Slider(
          value: sliderValue,
          min: startMs,
          max: endMs,
          onChanged: (v) => onSeek(Duration(milliseconds: v.toInt())),
        ),
      );
    }

    final double horizontalPadding = apple ? 20.0 : 24.0;
    final groupChapters = chapters.length > 40;
    final labelStyle = TextStyle(
      fontSize: 12,
      color: AppColorScheme.onSurface.withValues(alpha: 0.85),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 32,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (chapters.isNotEmpty || bookmarks.isNotEmpty || notes.isNotEmpty)
                IgnorePointer(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: CustomPaint(
                      painter: _ZoomedTimelineTicksPainter(
                        chapters: chapters,
                        bookmarks: bookmarks,
                        notes: notes,
                        windowStartMs: startMs,
                        windowEndMs: endMs,
                        grouped: groupChapters,
                        chapterColor: Colors.white,
                        bookmarkColor: AppColorScheme.accent,
                        noteColor: AppColorScheme.navColorCycle.length >= 2
                            ? AppColorScheme.navColorCycle[1]
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      size: Size.infinite,
                    ),
                  ),
                ),
              slider,
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatAudiobookClock(Duration(milliseconds: startMs.toInt())),
                style: labelStyle,
              ),
              Text(
                l10n.audiobookFocusedTimeline,
                style: TextStyle(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              Text(
                formatAudiobookClock(Duration(milliseconds: endMs.toInt())),
                style: labelStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ZoomedTimelineTicksPainter extends CustomPainter {
  _ZoomedTimelineTicksPainter({
    required this.chapters,
    required this.bookmarks,
    required this.notes,
    required this.windowStartMs,
    required this.windowEndMs,
    required this.grouped,
    required this.chapterColor,
    required this.bookmarkColor,
    required this.noteColor,
  });

  final List<Chapter> chapters;
  final List<AudiobookBookmark> bookmarks;
  final List<AudiobookNote> notes;
  final double windowStartMs;
  final double windowEndMs;
  final bool grouped;
  final Color chapterColor;
  final Color bookmarkColor;
  final Color noteColor;

  @override
  void paint(Canvas canvas, Size size) {
    final range = windowEndMs - windowStartMs;
    if (range <= 0) return;

    final chapterPaint = Paint()
      ..color = chapterColor
      ..strokeWidth = 2.0;

    if (grouped) {
      // Simplified grouped chapters are not drawn in the zoomed window.
    } else {
      for (final c in chapters) {
        final pos = c.startMs.toDouble();
        if (pos >= windowStartMs && pos <= windowEndMs) {
          final x = ((pos - windowStartMs) / range) * size.width;
          canvas.drawLine(Offset(x, 0), Offset(x, size.height), chapterPaint);
        }
      }
    }

    final bookmarkPaint = Paint()
      ..color = bookmarkColor
      ..strokeWidth = 1.8;
    for (final b in bookmarks) {
      final pos = b.positionMs.toDouble();
      if (pos >= windowStartMs && pos <= windowEndMs) {
        final x = ((pos - windowStartMs) / range) * size.width;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), bookmarkPaint);
      }
    }

    final notePaint = Paint()
      ..color = noteColor
      ..strokeWidth = 1.8;
    for (final n in notes) {
      final pos = n.positionMs.toDouble();
      if (pos >= windowStartMs && pos <= windowEndMs) {
        final x = ((pos - windowStartMs) / range) * size.width;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), notePaint);
      }
    }
  }

  @override
  bool shouldRepaint(_ZoomedTimelineTicksPainter old) =>
      old.chapters != chapters ||
      old.bookmarks != bookmarks ||
      old.notes != notes ||
      old.windowStartMs != windowStartMs ||
      old.windowEndMs != windowEndMs;
}
