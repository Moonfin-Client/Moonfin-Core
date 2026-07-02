import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

class AudiobookFocusRing extends StatelessWidget {
  const AudiobookFocusRing({
    super.key,
    required this.focused,
    required this.child,
    this.borderRadius,
    this.borderColor,
    this.padding,
    this.backgroundColor,
  });

  final bool focused;
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);
    final borderCol = borderColor ?? AppColorScheme.accent;
    final bgCol = backgroundColor ??
        (focused
            ? AppColorScheme.accent.withValues(alpha: 0.18)
            : Colors.transparent);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: focused ? borderCol : Colors.transparent,
          width: 2.4,
        ),
        color: focused ? bgCol : Colors.transparent,
      ),
      child: child,
    );
  }
}
