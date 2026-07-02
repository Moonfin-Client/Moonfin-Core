import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'audiobook_time.dart';
import '../../../data/services/audiobook_bookmarks_service.dart';
import '../../../data/services/audiobook_notes_service.dart';
import '../../../util/platform_detection.dart';
import 'chapter.dart';

class AudiobookProgressBar extends StatelessWidget {
  const AudiobookProgressBar({
    super.key,
    required this.position,
    required this.duration,
    required this.chapters,
    required this.bookmarks,
    required this.notes,
    required this.showRemaining,
    required this.isTvFocused,
    required this.onSeek,
    required this.onToggleRemaining,
    required this.formatPosition,
    required this.formatRemaining,
  });

  final Duration position;
  final Duration duration;
  final List<Chapter> chapters;
  final List<AudiobookBookmark> bookmarks;
  final List<AudiobookNote> notes;
  final bool showRemaining;
  final bool isTvFocused;
  final ValueChanged<Duration> onSeek;
  final VoidCallback onToggleRemaining;
  final String Function(Duration) formatPosition;
  final String Function(Duration position, Duration total) formatRemaining;

  @override
  Widget build(BuildContext context) {
    final apple = PlatformDetection.isApple;
    final maxMs = duration.inMilliseconds.toDouble();
    final groupChapters = chapters.length > 40;
    final value = maxMs > 0
        ? position.inMilliseconds.toDouble().clamp(0, maxMs)
        : 0.0;

    final Widget slider;
    if (apple) {
      slider = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CupertinoSlider(
          value: value.toDouble(),
          max: maxMs > 0 ? maxMs : 1,
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
          value: value.toDouble(),
          max: maxMs > 0 ? maxMs : 1,
          onChanged: (v) => onSeek(Duration(milliseconds: v.toInt())),
        ),
      );
    }

    final double horizontalPadding = apple ? 20.0 : 24.0;

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
                      painter: _TimelineTicksPainter(
                        chapters: chapters,
                        bookmarks: bookmarks,
                        notes: notes,
                        durationMs: maxMs.toInt(),
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
                formatPosition(position),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                ),
              ),
              Text(
                '${maxMs > 0 ? ((position.inMilliseconds / maxMs) * 100).round().clamp(0, 100) : 0}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                ),
              ),
              GestureDetector(
                onTap: onToggleRemaining,
                behavior: HitTestBehavior.opaque,
                child: Text(
                  showRemaining
                      ? formatRemaining(position, duration)
                      : formatPosition(duration),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineTicksPainter extends CustomPainter {
  _TimelineTicksPainter({
    required this.chapters,
    required this.bookmarks,
    required this.notes,
    required this.durationMs,
    required this.grouped,
    required this.chapterColor,
    required this.bookmarkColor,
    required this.noteColor,
  });

  final List<Chapter> chapters;
  final List<AudiobookBookmark> bookmarks;
  final List<AudiobookNote> notes;
  final int durationMs;
  final bool grouped;
  final Color chapterColor;
  final Color bookmarkColor;
  final Color noteColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (durationMs <= 0) return;

    // 1. Draw Chapters
    final chapterPaint = Paint()
      ..color = chapterColor
      ..strokeWidth = 1.4;
    if (grouped) {
      final step = (chapters.length / 10).ceil();
      for (var i = 0; i < chapters.length; i += step) {
        final x = (chapters[i].startMs / durationMs) * size.width;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), chapterPaint);
      }
    } else {
      for (final c in chapters) {
        final x = (c.startMs / durationMs) * size.width;
        canvas.drawLine(Offset(x, 1), Offset(x, size.height - 1), chapterPaint);
      }
    }

    // 2. Draw Bookmarks
    final bookmarkPaint = Paint()
      ..color = bookmarkColor
      ..strokeWidth = 1.8;
    for (final b in bookmarks) {
      final x = (b.positionMs / durationMs) * size.width;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), bookmarkPaint);
    }

    // 3. Draw Notes
    final notePaint = Paint()
      ..color = noteColor
      ..strokeWidth = 1.8;
    for (final n in notes) {
      final x = (n.positionMs / durationMs) * size.width;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), notePaint);
    }
  }

  @override
  bool shouldRepaint(_TimelineTicksPainter old) =>
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
    required this.formatPosition,
    required this.formatRemaining,
  });

  final Duration position;
  final Duration duration;
  final List<Chapter> chapters;
  final List<AudiobookBookmark> bookmarks;
  final List<AudiobookNote> notes;
  final bool isTvFocused;
  final ValueChanged<Duration> onSeek;
  final String Function(Duration) formatPosition;
  final String Function(Duration position, Duration total) formatRemaining;

  @override
  Widget build(BuildContext context) {
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
                formatPosition(position),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                ),
              ),
              Text(
                'Focused Timeline',
                style: TextStyle(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              Text(
                '-${formatAudiobookClock(Duration(milliseconds: (totalMs - posMs).toInt()))}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                ),
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

    // 1. Draw Chapters
    final chapterPaint = Paint()
      ..color = chapterColor
      ..strokeWidth = 2.0;

    if (grouped) {
      // Draw simplified grouped chapters if there are too many (none needed for standard display)
    } else {
      for (final c in chapters) {
        final pos = c.startMs.toDouble();
        if (pos >= windowStartMs && pos <= windowEndMs) {
          final x = ((pos - windowStartMs) / range) * size.width;
          canvas.drawLine(Offset(x, 0), Offset(x, size.height), chapterPaint);
        }
      }
    }

    // 2. Draw Bookmarks
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

    // 3. Draw Notes
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
