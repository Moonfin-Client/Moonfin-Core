import 'package:flutter/widgets.dart';

/// The app-wide shortcut [FocusNode] (owned by the global shortcut scope in
/// app.dart). Focus parks here when nothing specific is focused, the normal
/// idle state on web/mouse, so screens can tell idle apart from the user
/// actively focusing a real chrome control.
FocusNode? globalShortcutFocusNode;
