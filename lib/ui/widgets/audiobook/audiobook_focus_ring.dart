import 'package:flutter/material.dart';

import '../focus/glass_focus_halo.dart';

/// Thin shim over [GlassFocusHalo] kept for the existing audiobook call
/// sites.
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
    return GlassFocusHalo(
      focused: focused,
      borderRadius: borderRadius,
      ringColor: borderColor,
      backgroundColor: backgroundColor,
      padding: padding,
      scale: 1.0,
      child: child,
    );
  }
}
