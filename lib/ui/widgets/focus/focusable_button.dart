import 'package:flutter/widgets.dart';

import 'focus_theme.dart';
import 'focusable_wrapper.dart';

class FocusableButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final bool autofocus;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final ValueChanged<bool>? onFocusChange;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateRight;
  final VoidCallback? onBack;
  final String? semanticLabel;
  final bool autoScroll;

  const FocusableButton({
    super.key,
    required this.child,
    this.onPressed,
    this.focusNode,
    this.autofocus = false,
    this.borderRadius = FocusTheme.defaultBorderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.onFocusChange,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onNavigateLeft,
    this.onNavigateRight,
    this.onBack,
    this.semanticLabel,
    this.autoScroll = false,
  });

  @override
  Widget build(BuildContext context) {
    return FocusableWrapper(
      onSelect: onPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      borderRadius: borderRadius,
      disableScale: true,
      useBackgroundFocus: true,
      autoScroll: autoScroll,
      descendantsAreFocusable: false,
      onFocusChange: onFocusChange,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      onNavigateLeft: onNavigateLeft,
      onNavigateRight: onNavigateRight,
      onBack: onBack,
      semanticLabel: semanticLabel,
      child: Padding(padding: padding, child: child),
    );
  }
}
