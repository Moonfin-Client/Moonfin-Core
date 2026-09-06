import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../preference/preference_constants.dart';

class AnimatedGradientBackdrop extends StatefulWidget {
  const AnimatedGradientBackdrop({
    super.key,
    required this.backdrop,
  });

  final ScreensaverBackdrop backdrop;

  @override
  State<AnimatedGradientBackdrop> createState() =>
      _AnimatedGradientBackdropState();
}

class _AnimatedGradientBackdropState extends State<AnimatedGradientBackdrop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.backdrop == ScreensaverBackdrop.black ||
        widget.backdrop == ScreensaverBackdrop.library) {
      return const ColoredBox(color: Colors.black);
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = _controller.value;
        final angle = progress * 2 * math.pi;
        // Smooth sine wave oscillating between 0.0 and 1.0
        final breath = (math.sin(angle) + 1.0) / 2.0;
        final expandScale = 1.0 + 0.12 * breath;

        // Orbiting and expanding linear gradient
        final linearRadius = 0.8 + 0.35 * breath;
        final begin = Alignment(
          math.cos(angle) * linearRadius,
          math.sin(angle) * linearRadius,
        );
        final end = Alignment(
          -math.cos(angle) * linearRadius,
          -math.sin(angle) * linearRadius,
        );

        // Breathing radial focal point
        final radialCenter = Alignment(
          0.40 * math.sin(angle * 0.7),
          0.32 * math.cos(angle * 1.1),
        );
        final radialRadius = 0.85 + 0.75 * breath;

        final colors = _getColors(widget.backdrop);
        final accent = _getAccentColor(widget.backdrop);

        return ClipRect(
          child: Transform.scale(
            scale: expandScale,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Sweeping linear gradient
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: begin,
                      end: end,
                      colors: colors,
                    ),
                  ),
                  child: const SizedBox.expand(),
                ),
                // Luminous expanding & contracting radial breathing glow
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: radialCenter,
                      radius: radialRadius,
                      colors: [
                        accent.withValues(alpha: 0.36 + 0.22 * breath),
                        accent.withValues(alpha: 0.10 * (1.0 - breath)),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.65, 1.0],
                    ),
                  ),
                  child: const SizedBox.expand(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getAccentColor(ScreensaverBackdrop backdrop) {
    switch (backdrop) {
      case ScreensaverBackdrop.synthwave:
        return const Color(0xFF00C6FF);
      case ScreensaverBackdrop.calm:
        return const Color(0xFF68D388);
      case ScreensaverBackdrop.neonPulse:
        return const Color(0xFFFF2E92);
      case ScreensaverBackdrop.aurora:
        return const Color(0xFF00CEC9);
      case ScreensaverBackdrop.library:
      case ScreensaverBackdrop.black:
        return Colors.transparent;
    }
  }

  List<Color> _getColors(ScreensaverBackdrop backdrop) {
    switch (backdrop) {
      case ScreensaverBackdrop.synthwave:
        // Moonfin logo brand palette: Royal purple to Electric Cyan
        return const [
          Color(0xFF1A0526), // Midnight plum
          Color(0xFF6B2087), // Royal violet
          Color(0xFFAA5CC3), // Vivid magenta
          Color(0xFF9C62C5), // Moonfin violet
          Color(0xFF7672CB), // Lavender blue
          Color(0xFF3A8CD4), // Sky cerulean
          Color(0xFF00C6FF), // Electric cyan
          Color(0xFF091426), // Deep oceanic midnight
        ];
      case ScreensaverBackdrop.calm:
        // Vibrant, luminous nature scene: lush emeralds, bamboo lime, spring foliage
        return const [
          Color(0xFF071B0F), // Deep forest shade
          Color(0xFF134223), // Deep evergreen
          Color(0xFF1F6B38), // Rich forest moss
          Color(0xFF2E8B57), // Sea green / emerald
          Color(0xFF48B369), // Lush leafy green
          Color(0xFF68D388), // Bright sunlight spring foliage
          Color(0xFF287A43), // Vibrant jade
          Color(0xFF0B2414), // Dark undergrowth
        ];
      case ScreensaverBackdrop.neonPulse:
        // Cyber-noir night with electric cyan and neon magenta
        return const [
          Color(0xFF080412), // Obsidian night
          Color(0xFF2B004E), // Deep neon purple
          Color(0xFFFF2E92), // Radiant neon pulse magenta
          Color(0xFFBD00FF), // Bright violet neon
          Color(0xFF00E5FF), // Radiant electric cyan
          Color(0xFF0B2742), // Deep cyberpunk navy
          Color(0xFF05030D), // Twilight shadow
        ];
      case ScreensaverBackdrop.aurora:
        // Arctic night with boreal emerald, sapphire, and arctic violet
        return const [
          Color(0xFF02111C), // Polar midnight
          Color(0xFF04483E), // Boreal deep pine
          Color(0xFF00B894), // Luminous arctic emerald
          Color(0xFF00CEC9), // Glacial cyan
          Color(0xFF6C5CE7), // Arctic violet
          Color(0xFF1A0E3D), // Deep northern sky
        ];
      case ScreensaverBackdrop.library:
      case ScreensaverBackdrop.black:
        return const [Colors.black, Colors.black];
    }
  }
}

