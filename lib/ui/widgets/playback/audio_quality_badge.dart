import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';

/// A compact pill that surfaces the audio quality of the current track:
/// codec, bit-depth/sample-rate, and a lossless/bitrate hint
///
/// Renders nothing when no codec information is available 
/// so callers can drop it in unconditionally.
class AudioQualityBadge extends StatelessWidget {
  final AggregatedItem item;

  const AudioQualityBadge({super.key, required this.item});

  static String? _formatSampleRate(int hz) {
    final khz = hz / 1000.0;
    if (khz <= 0) return null;
    final whole = khz.roundToDouble() == khz;
    return whole ? khz.toStringAsFixed(0) : khz.toStringAsFixed(1);
  }

  List<String> _parts() {
    final parts = <String>[];

    final codec = (item.audioCodec ?? item.audioContainer)?.toUpperCase();
    if (codec == null || codec.isEmpty) return parts;
    parts.add(codec);

    final depth = item.audioBitDepth;
    final rate = item.audioSampleRateHz;
    if (rate != null && rate > 0) {
      final khz = _formatSampleRate(rate);
      if (khz != null) {
        parts.add(depth != null && depth > 0 ? '$depth/$khz' : '$khz kHz');
      }
    }

    if (item.isLosslessAudio) {
      parts.add('Lossless');
    } else {
      final bitRate = item.audioBitRate;
      if (bitRate != null && bitRate > 0) {
        parts.add('${(bitRate / 1000).round()}k');
      }
    }

    return parts;
  }

  @override
  Widget build(BuildContext context) {
    final parts = _parts();
    if (parts.isEmpty) return const SizedBox.shrink();

    final accent = AppColorScheme.accent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColorScheme.onSurface.withValues(alpha: 0.10),
        borderRadius: AppRadius.circular(13),
        border: Border.all(color: accent.withValues(alpha: 0.55), width: 1),
      ),
      child: Text(
        parts.join(' · '),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
          color: Color.alphaBlend(accent.withValues(alpha: 0.85), Colors.white),
        ),
      ),
    );
  }
}
