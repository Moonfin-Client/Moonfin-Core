import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Chapter marks for the video seek bar.
///
/// A Stack layer over the Slider rather than a custom track shape, so the
/// Slider keeps painting itself. The Apple TV scrubber overlays the same 2pt
/// marks, so the two players read alike.
class ChapterMarkerTrack extends StatelessWidget {
  /// Chapter starts in milliseconds, from `chapterMarkerPositions`.
  final List<int> positionsMs;

  final int durationMs;

  const ChapterMarkerTrack({
    super.key,
    required this.positionsMs,
    required this.durationMs,
  });

  /// Taller than the 4px track so a mark reads as one rather than a gap.
  static const double height = 10;

  /// How far the Slider's track sits in from each edge.
  ///
  /// BaseSliderTrackShape insets by the larger of half the overlay and half
  /// the thumb, and the seek bar pairs a 14 overlay radius with a 7 thumb
  /// radius, so the overlay wins. Measuring the real slider at 200 wide puts
  /// its thumb at 13.5 for 0.0 and 185.5 for 1.0, which a thumb radius inset
  /// misses by up to 7 at the ends.
  static const double _trackInset = 14;

  @override
  Widget build(BuildContext context) {
    if (positionsMs.isEmpty || durationMs <= 0) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: CustomPaint(
          painter: _ChapterMarkerPainter(
            positionsMs: positionsMs,
            durationMs: durationMs,
            // The OSD sits over video rather than a themed surface, so
            // white reads under every theme, and it's what the Apple TV
            // overlay uses.
            color: Colors.white.withValues(alpha: 0.9),
          ),
        ),
      ),
    );
  }
}

class _ChapterMarkerPainter extends CustomPainter {
  final List<int> positionsMs;
  final int durationMs;
  final Color color;

  const _ChapterMarkerPainter({
    required this.positionsMs,
    required this.durationMs,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (durationMs <= 0) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    const inset = ChapterMarkerTrack._trackInset;
    final usable = math.max(size.width - inset * 2, 0.0);
    for (final ms in positionsMs) {
      final fraction = (ms / durationMs).clamp(0.0, 1.0);
      final x = inset + fraction * usable;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_ChapterMarkerPainter old) =>
      old.durationMs != durationMs ||
      old.color != color ||
      !listEquals(old.positionsMs, positionsMs);
}
