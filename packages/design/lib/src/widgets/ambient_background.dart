import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../theme/app_color_scheme.dart';


class AmbientBackground extends StatefulWidget {
  /// Artwork provider to sample. Pass a stable provider 
  /// so the palette is only recomputed when the track actually changes.
  final ImageProvider? image;

  /// Foreground content painted over the ambient gradient.
  final Widget child;

  /// Overrides the automatic pixel-theme disable (mainly for tests).
  final bool? enabled;

  const AmbientBackground({
    super.key,
    required this.image,
    required this.child,
    this.enabled,
  });

  @override
  State<AmbientBackground> createState() => _AmbientBackgroundState();
}

class _AmbientBackgroundState extends State<AmbientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _drift;
  ImageStream? _stream;
  ImageStreamListener? _listener;
  List<Color>? _palette;

  @override
  void initState() {
    super.initState();
    _drift = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat(reverse: true);
    _resolveImage();
  }

  @override
  void didUpdateWidget(covariant AmbientBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image != oldWidget.image) {
      _resolveImage();
    }
  }

  @override
  void dispose() {
    _detachStream();
    _drift.dispose();
    super.dispose();
  }

  void _detachStream() {
    if (_stream != null && _listener != null) {
      _stream!.removeListener(_listener!);
    }
    _stream = null;
    _listener = null;
  }

  void _resolveImage() {
    _detachStream();
    final provider = widget.image;
    if (provider == null) {
      if (_palette != null && mounted) setState(() => _palette = null);
      return;
    }
    // Force a small decode so pixel readback is cheap regardless of the
    // underlying provider (network providers ignore ImageConfiguration size).
    final resized = ResizeImage(provider, width: 32, height: 32);
    final stream = resized.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener(
      (info, _) {
        unawaited(_extractFrom(info.image));
      },
      onError: (_, _) {
        if (mounted) setState(() => _palette = null);
      },
    );
    _stream = stream;
    _listener = listener;
    stream.addListener(listener);
  }

  Future<void> _extractFrom(ui.Image image) async {
    try {
      final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
      if (data == null) return;
      final palette = _paletteFromPixels(data.buffer.asUint8List());
      if (mounted) setState(() => _palette = palette);
    } catch (_) {
      // Ignore; keep whatever palette (or fallback) we already have.
    }
  }

  static List<Color>? _paletteFromPixels(Uint8List rgba) {
    // Average colour into 12-bit buckets, weighting saturated colours so the
    // gradient favours vivid tones over muddy greys.
    final sums = <int, List<int>>{};
    for (var i = 0; i + 3 < rgba.length; i += 4) {
      final r = rgba[i], g = rgba[i + 1], b = rgba[i + 2], a = rgba[i + 3];
      if (a < 128) continue;
      final luma = 0.299 * r + 0.587 * g + 0.114 * b;
      if (luma < 18) continue; // drop near-black
      final bucket = ((r >> 4) << 8) | ((g >> 4) << 4) | (b >> 4);
      final s = sums.putIfAbsent(bucket, () => [0, 0, 0, 0]);
      s[0] += r;
      s[1] += g;
      s[2] += b;
      s[3] += 1;
    }
    if (sums.isEmpty) return null;

    final scored = <_ScoredColor>[];
    for (final entry in sums.values) {
      final n = entry[3];
      final color = Color.fromARGB(
        255,
        entry[0] ~/ n,
        entry[1] ~/ n,
        entry[2] ~/ n,
      );
      final hsl = HSLColor.fromColor(color);
      final score = n * (0.35 + hsl.saturation);
      scored.add(_ScoredColor(color, score, hsl.hue));
    }
    scored.sort((a, b) => b.score.compareTo(a.score));

    final picked = <_ScoredColor>[];
    for (final c in scored) {
      if (picked.length >= 3) break;
      final tooClose = picked.any((p) {
        final d = (p.hue - c.hue).abs();
        return math.min(d, 360 - d) < 24;
      });
      if (tooClose) continue;
      picked.add(c);
    }
    if (picked.isEmpty) picked.add(scored.first);
    while (picked.length < 3) {
      picked.add(picked[picked.length - 1]);
    }
    // Lift the colours a touch so they read as glowing light, not flat paint.
    return picked.map((p) {
      final hsl = HSLColor.fromColor(p.color);
      return hsl
          .withSaturation((hsl.saturation * 1.1).clamp(0.0, 1.0))
          .withLightness((hsl.lightness * 0.55 + 0.22).clamp(0.0, 0.7))
          .toColor();
    }).toList();
  }

  List<Color> get _effectivePalette {
    final p = _palette;
    if (p != null && p.length >= 3) return p;
    // Fallback derived from the active theme accent so the backdrop is never
    // empty before/without artwork.
    final accent = AppColorScheme.accent;
    final hsl = HSLColor.fromColor(accent);
    return [
      accent,
      hsl.withHue((hsl.hue + 40) % 360).toColor(),
      hsl.withHue((hsl.hue + 320) % 360).toColor(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.enabled ?? !AppColorScheme.isPixel;
    if (!enabled) {
      return ColoredBox(
        color: AppColorScheme.background,
        child: widget.child,
      );
    }

    final palette = _effectivePalette;
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: AppColorScheme.background),
        AnimatedBuilder(
          animation: _drift,
          builder: (context, _) {
            final t = _drift.value;
            return Stack(
              fit: StackFit.expand,
              children: [
                _blob(palette[0], Alignment(-0.7 + 0.25 * t, -0.75 + 0.2 * t)),
                _blob(palette[1], Alignment(0.8 - 0.2 * t, -0.35 + 0.3 * t)),
                _blob(palette[2], Alignment(-0.2 + 0.3 * t, 0.85 - 0.25 * t)),
              ],
            );
          },
        ),
        // Scrim for legibility over any artwork.
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColorScheme.background.withValues(alpha: 0.15),
                AppColorScheme.background.withValues(alpha: 0.40),
                AppColorScheme.background.withValues(alpha: 0.86),
              ],
              stops: const [0.0, 0.55, 1.0],
            ),
          ),
        ),
        widget.child,
      ],
    );
  }

  Widget _blob(Color color, Alignment center) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: center,
          radius: 1.1,
          colors: [color.withValues(alpha: 0.55), color.withValues(alpha: 0.0)],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}

class _ScoredColor {
  final Color color;
  final double score;
  final double hue;
  const _ScoredColor(this.color, this.score, this.hue);
}
