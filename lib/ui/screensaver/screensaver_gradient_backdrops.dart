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
      duration: const Duration(seconds: 24),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = _controller.value;
        final angle = progress * 2 * math.pi;

        // Smoothly orbit the gradient focal points
        final begin = Alignment(
          math.cos(angle) * 0.85,
          math.sin(angle) * 0.85,
        );
        final end = Alignment(
          -math.cos(angle) * 0.85,
          -math.sin(angle) * 0.85,
        );

        final colors = _getColors(widget.backdrop);

        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin,
              end: end,
              colors: colors,
            ),
          ),
          child: const SizedBox.expand(),
        );
      },
    );
  }

  List<Color> _getColors(ScreensaverBackdrop backdrop) {
    switch (backdrop) {
      case ScreensaverBackdrop.synthwave:
        // Moonfin logo brand palette: Purple to Cyan/Electric Blue
        return const [
          Color(0xFF1E082E), // Deep plum shadow
          Color(0xFFAA5CC3), // Magenta / purple
          Color(0xFF9C62C5), // Violet
          Color(0xFF7672CB), // Lavender blue
          Color(0xFF3A8CD4), // Cerulean
          Color(0xFF00A4DC), // Bright cyan
          Color(0xFF0A1828), // Deep oceanic navy
        ];
      case ScreensaverBackdrop.calm:
        // Natural muted greens, oceanic blues, deep spruce
        return const [
          Color(0xFF051817), // Midnight deep forest
          Color(0xFF0D3B4C), // Oceanic deep teal
          Color(0xFF134E5E), // Muted spruce
          Color(0xFF1B4958), // Slate pine
          Color(0xFF0A2E2B), // Deep moss
          Color(0xFF06181F), // Dark lake
        ];
      case ScreensaverBackdrop.neonPulse:
        // Cyber-noir night with electric cyan and neon magenta
        return const [
          Color(0xFF0A0718), // Twilight black
          Color(0xFF1F0038), // Electric grape
          Color(0xFFFF2E92), // Neon magenta
          Color(0xFF00E5FF), // Electric cyan
          Color(0xFF0D223A), // Deep navy
          Color(0xFF080614), // Dark obsidian
        ];
      case ScreensaverBackdrop.aurora:
        // Arctic night with boreal emerald, sapphire, and arctic violet
        return const [
          Color(0xFF02131F), // Arctic deep navy
          Color(0xFF05443B), // Boreal emerald
          Color(0xFF066055), // Northern teal
          Color(0xFF281350), // Aurora violet
          Color(0xFF042838), // Polar sapphire
        ];
      case ScreensaverBackdrop.library:
      case ScreensaverBackdrop.black:
        return const [Colors.black, Colors.black];
    }
  }
}
