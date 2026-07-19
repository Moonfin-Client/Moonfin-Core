import 'package:flutter/cupertino.dart' show CupertinoDialogAction;
import 'package:flutter/material.dart';

import '../../../util/idiom/app_ui_idiom.dart';

/// Dialog action button that keeps its native look on Apple idioms.
///
/// Pass [focusRingColor] to draw an explicit focus ring, which D-pad users on
/// TV need to see which action they are on, and [backgroundColor] to get a
/// filled button instead of a text one. Callers that pass neither keep the
/// plain [TextButton], so existing dialogs look the same as before.
Widget adaptiveDialogAction({
  required VoidCallback? onPressed,
  required Widget child,
  bool isDefault = false,
  bool isDestructive = false,
  bool autofocus = false,
  Color? focusRingColor,
  Color? backgroundColor,
  Color? focusedBackgroundColor,
}) {
  if (AppUiIdiomResolver.isApple) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      isDefaultAction: isDefault,
      isDestructiveAction: isDestructive,
      child: child,
    );
  }

  if (focusRingColor == null && backgroundColor == null) {
    return TextButton(onPressed: onPressed, autofocus: autofocus, child: child);
  }

  final ring = focusRingColor ?? Colors.white;
  bool focused(Set<WidgetState> states) => states.contains(WidgetState.focused);

  final style = ButtonStyle(
    foregroundColor: const WidgetStatePropertyAll(Colors.white),
    overlayColor: WidgetStateProperty.resolveWith(
      (states) => focused(states) ? ring.withValues(alpha: 0.15) : null,
    ),
    side: WidgetStateProperty.resolveWith(
      (states) => focused(states)
          ? BorderSide(color: ring, width: 2.5)
          : BorderSide.none,
    ),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );

  if (backgroundColor == null) {
    return TextButton(
      onPressed: onPressed,
      autofocus: autofocus,
      style: style,
      child: child,
    );
  }

  return FilledButton(
    onPressed: onPressed,
    autofocus: autofocus,
    style: style.copyWith(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => focused(states)
            ? (focusedBackgroundColor ?? backgroundColor)
            : backgroundColor,
      ),
    ),
    child: child,
  );
}
