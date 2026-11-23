import 'package:flutter/widgets.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The IPTV setup backdrop, with a soft accent glow at the top.
class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key, required this.child, this.apple = false});

  final Widget child;
  final bool apple;

  @override
  Widget build(BuildContext context) {
    final spec = ThemeRegistry.active;
    final bg = spec.colors.background;
    final accent = spec.colors.accent;

    return Stack(
      children: [
        Positioned(
          top: -140,
          left: -60,
          right: -60,
          height: 360,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.4),
                radius: 0.9,
                colors: [
                  accent.withValues(alpha: apple ? 0.18 : 0.28),
                  bg.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
