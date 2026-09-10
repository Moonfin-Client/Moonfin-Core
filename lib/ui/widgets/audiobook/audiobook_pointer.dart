import 'package:flutter/widgets.dart';

/// Gives a control the mouse affordances Cupertino widgets lack.
///
/// CupertinoButton and a bare GestureDetector carry no cursor and no hover
/// callback, so on desktop they need this to behave like the Material path.
/// [onHover] fires on enter and exit.
Widget audiobookClickable({
  required Widget child,
  bool enabled = true,
  ValueChanged<bool>? onHover,
}) {
  if (!enabled) return child;
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: onHover == null ? null : (_) => onHover(true),
    onExit: onHover == null ? null : (_) => onHover(false),
    child: child,
  );
}
