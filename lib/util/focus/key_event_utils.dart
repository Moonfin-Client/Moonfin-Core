import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'dpad_keys.dart';

class _SelectKeyUpSuppressor {
  static int _suppressCount = 0;

  static void markPressed() => _suppressCount++;

  static bool consumeIfSuppressed(KeyEvent event) {
    if (event is! KeyUpEvent) return false;
    if (!event.logicalKey.isSelectKey) return false;
    if (_suppressCount == 0) return false;
    _suppressCount--;
    return true;
  }
}

KeyEventResult handleOneShotSelect(KeyEvent event, VoidCallback onSelect) {
  if (event is KeyDownEvent && event.logicalKey.isSelectKey) {
    _SelectKeyUpSuppressor.markPressed();
    onSelect();
    return KeyEventResult.handled;
  }
  if (_SelectKeyUpSuppressor.consumeIfSuppressed(event)) {
    return KeyEventResult.handled;
  }
  return KeyEventResult.ignored;
}

/// Activates whatever holds focus, for a scope that sees enter and select
/// before the framework's own shortcut for them.
///
/// Finding an enabled action is the only thing that says the press landed. A
/// material button activates through a callback that returns nothing, so the
/// invoke result is null even when it fired, and reporting that as ignored
/// lets the framework activate the same widget a second time.
KeyEventResult activateFocusedTarget(BuildContext context) {
  final target = FocusManager.instance.primaryFocus?.context ?? context;
  final action = Actions.maybeFind<ActivateIntent>(target);
  if (action == null || !action.isActionEnabled) {
    return KeyEventResult.ignored;
  }
  Actions.maybeInvoke(target, const ActivateIntent());
  return KeyEventResult.handled;
}

KeyEventResult handleBackKeyAction(KeyEvent event, VoidCallback onBack) {
  if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
  if (event is KeyDownEvent) {
    onBack();
    return KeyEventResult.handled;
  }
  if (event is KeyUpEvent) return KeyEventResult.handled;
  return KeyEventResult.ignored;
}

FocusOnKeyEventCallback dpadKeyHandler({
  VoidCallback? onUp,
  VoidCallback? onDown,
  VoidCallback? onLeft,
  VoidCallback? onRight,
  VoidCallback? onSelect,
}) {
  return (FocusNode node, KeyEvent event) {
    if (onSelect != null) {
      final r = handleOneShotSelect(event, onSelect);
      if (r != KeyEventResult.ignored) return r;
    }
    if (!event.isActionable) return KeyEventResult.ignored;
    final k = event.logicalKey;
    if (k.isUpKey && onUp != null) {
      onUp();
      return KeyEventResult.handled;
    }
    if (k.isDownKey && onDown != null) {
      onDown();
      return KeyEventResult.handled;
    }
    if (k.isLeftKey && onLeft != null) {
      onLeft();
      return KeyEventResult.handled;
    }
    if (k.isRightKey && onRight != null) {
      onRight();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  };
}

KeyEventResult consumeIfEdge(
  KeyEvent event, {
  bool atLeftEdge = false,
  bool atRightEdge = false,
  bool atTopEdge = false,
  bool atBottomEdge = false,
}) {
  if (!event.isActionable) return KeyEventResult.ignored;
  final k = event.logicalKey;
  if (atLeftEdge && k.isLeftKey) return KeyEventResult.handled;
  if (atRightEdge && k.isRightKey) return KeyEventResult.handled;
  if (atTopEdge && k.isUpKey) return KeyEventResult.handled;
  if (atBottomEdge && k.isDownKey) return KeyEventResult.handled;
  return KeyEventResult.ignored;
}

class LongPressSelectKeyHandler {
  bool _selectDownSeen = false;
  bool _longPressFired = false;
  Timer? _longPressTimer;

  void dispose() {
    _longPressTimer?.cancel();
  }

  KeyEventResult handleKeyEvent(
    KeyEvent event, {
    required VoidCallback onTap,
    required VoidCallback onLongPress,
  }) {
    final key = event.logicalKey;

    if (key.isSelectKey) {
      if (event is KeyDownEvent) {
        _selectDownSeen = true;
        _longPressFired = false;
        _longPressTimer?.cancel();
        _longPressTimer = Timer(
          const Duration(milliseconds: 500),
          () {
            _longPressFired = true;
            onLongPress();
          },
        );
        return KeyEventResult.handled;
      }
      if (event is KeyRepeatEvent) {
        return _selectDownSeen
            ? KeyEventResult.handled
            : KeyEventResult.ignored;
      }
      if (event is KeyUpEvent) {
        if (!_selectDownSeen) return KeyEventResult.ignored;
        _selectDownSeen = false;
        _longPressTimer?.cancel();
        _longPressTimer = null;
        if (!_longPressFired) {
          onTap();
        }
        _longPressFired = false;
        return KeyEventResult.handled;
      }
    }

    if (key.isContextMenuKey && event is KeyDownEvent) {
      onLongPress();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}
