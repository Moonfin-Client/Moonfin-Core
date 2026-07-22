import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../util/focus/dpad_keys.dart';
import '../../util/platform_detection.dart';
import 'focus/focus_theme.dart';

// Tracks dialogs closed by the back key. Android also sends a popRoute
// MethodChannel event after the key event fires, so we suppress that second
// event in didPopRoute() to prevent GoRouter from also popping the page.
class DialogBackSuppressor {
  DialogBackSuppressor._();

  static int _count = 0;

  static void markDismissed() => _count++;

  static bool consume() {
    if (_count > 0) {
      _count--;
      return true;
    }
    return false;
  }
}

class InlineBackInterceptor {
  InlineBackInterceptor._();

  static final List<VoidCallback> _handlers = <VoidCallback>[];

  static void push(VoidCallback onBack) => _handlers.add(onBack);

  static void remove(VoidCallback onBack) => _handlers.remove(onBack);

  static bool handleBack() {
    if (_handlers.isEmpty) return false;
    _handlers.last();
    return true;
  }
}

/// Creates an idempotent back-dismiss action for a dialog route.
///
/// Use this in custom back-key handlers inside dialogs so the Android
/// follow-up popRoute event is suppressed consistently.
VoidCallback createDialogBackCloseHandler(BuildContext dialogContext) {
  var closed = false;
  return () {
    if (closed) return;
    closed = true;
    DialogBackSuppressor.markDismissed();
    Navigator.pop(dialogContext);
  };
}

void _safeRestoreFocus(FocusNode? node) {
  try {
    if (node != null &&
        node.context != null &&
        node.context!.mounted &&
        node.canRequestFocus) {
      node.requestFocus();
    }
  } catch (_) {
    // Avoid crash on disposed or unmounted focus node
  }
}

/// Drop-in replacement for [showDialog] that captures the currently focused
/// node before opening and restores focus to it after the dialog closes.
/// Use this everywhere [showDialog] is called from a TV-facing screen so
/// keyboard/dpad focus returns to the originating widget instead of being
/// lost to the route's default focus traversal.
Future<T?> showFocusRestoringDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color? barrierColor,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  RouteSettings? routeSettings,
  String? barrierLabel,
}) {
  final previousFocus = FocusManager.instance.primaryFocus;
  return showAdaptiveDialog<T>(
    context: context,
    builder: (dialogContext) => Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (node, event) {
        if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent) {
          // A focused text field owns backspace (it's editing, not "back");
          // don't pop the dialog out from under it.
          final focusContext = FocusManager.instance.primaryFocus?.context;
          if (focusContext != null &&
              focusContext.findAncestorWidgetOfExactType<EditableText>() !=
                  null) {
            return KeyEventResult.ignored;
          }
          DialogBackSuppressor.markDismissed();
          Navigator.of(dialogContext).pop();
          return KeyEventResult.handled;
        }
        if (event is KeyUpEvent) {
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Builder(builder: builder),
    ),
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    routeSettings: routeSettings,
    barrierLabel: barrierLabel,
  ).whenComplete(() {
    _safeRestoreFocus(previousFocus);
  });
}

/// Drop-in replacement for [showModalBottomSheet] with focus restoration.
Future<T?> showFocusRestoringModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool? showDragHandle,
  bool useSafeArea = false,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  Offset? anchorPoint,
}) {
  final previousFocus = FocusManager.instance.primaryFocus;
  return showModalBottomSheet<T>(
    context: context,
    builder: (sheetContext) => Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (node, event) {
        if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent) {
          DialogBackSuppressor.markDismissed();
          Navigator.of(sheetContext).pop();
          return KeyEventResult.handled;
        }
        if (event is KeyUpEvent) {
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: builder(sheetContext),
    ),
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    barrierColor: barrierColor,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    showDragHandle: showDragHandle,
    useSafeArea: useSafeArea,
    routeSettings: routeSettings,
    transitionAnimationController: transitionAnimationController,
    anchorPoint: anchorPoint,
  ).whenComplete(() {
    _safeRestoreFocus(previousFocus);
  });
}

class OverlaySheetController {
  static final List<VoidCallback> _openSheetCloseHandles = <VoidCallback>[];

  static bool get hasOpenSheet => _openSheetCloseHandles.isNotEmpty;

  static bool closeTopSheet() {
    if (_openSheetCloseHandles.isEmpty) return false;
    _openSheetCloseHandles.last();
    return true;
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    AlignmentGeometry alignment = Alignment.center,
    FocusNode? initialFocusNode,
    bool barrierDismissible = true,
    Color? barrierColor,
    Duration animationDuration = const Duration(milliseconds: 200),
  }) {
    final effectiveBarrierColor =
        barrierColor ?? AppColorScheme.scrim.withValues(alpha: 0.7);
    final overlay = Overlay.of(context, rootOverlay: true);
    final completer = Completer<T?>();
    final previousFocus = FocusManager.instance.primaryFocus;

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (entryContext) => _OverlaySheet<T>(
        completer: completer,
        builder: builder,
        alignment: alignment,
        initialFocusNode: initialFocusNode,
        barrierDismissible: barrierDismissible,
        barrierColor: effectiveBarrierColor,
        animationDuration: animationDuration,
        onClosed: (restoreFocus) {
          entry.remove();
          if (restoreFocus) {
            _safeRestoreFocus(previousFocus);
          }
        },
      ),
    );
    overlay.insert(entry);
    return completer.future;
  }

  static Future<void> closeAdaptive<T>(
    BuildContext context, {
    T? result,
    bool restoreFocus = true,
  }) {
    final scope =
        context
            .getElementForInheritedWidgetOfExactType<_OverlaySheetScope>()
            ?.widget as _OverlaySheetScope?;
    if (scope == null) return Future.value();
    return scope.close(result, restoreFocus: restoreFocus);
  }
}

class _OverlaySheet<T> extends StatefulWidget {
  final Completer<T?> completer;
  final WidgetBuilder builder;
  final AlignmentGeometry alignment;
  final FocusNode? initialFocusNode;
  final bool barrierDismissible;
  final Color barrierColor;
  final Duration animationDuration;
  final void Function(bool restoreFocus) onClosed;

  const _OverlaySheet({
    required this.completer,
    required this.builder,
    required this.alignment,
    required this.initialFocusNode,
    required this.barrierDismissible,
    required this.barrierColor,
    required this.animationDuration,
    required this.onClosed,
  });

  @override
  State<_OverlaySheet<T>> createState() => _OverlaySheetState<T>();
}

class _OverlaySheetState<T> extends State<_OverlaySheet<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;
  final FocusScopeNode _scopeNode = FocusScopeNode(debugLabel: 'OverlaySheet');
  bool _closing = false;
  bool _restoreFocusOnClose = true;
  Future<void>? _closeFuture;
  late final VoidCallback _registryCloseHandle;

  @override
  void initState() {
    super.initState();
    _registryCloseHandle = () => _close();
    OverlaySheetController._openSheetCloseHandles.add(_registryCloseHandle);
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final initial = widget.initialFocusNode;
        if (initial != null && initial.canRequestFocus) {
          initial.requestFocus();
        } else {
          _scopeNode.requestFocus();
        }
      });
    });
  }

  @override
  void dispose() {
    OverlaySheetController._openSheetCloseHandles.remove(_registryCloseHandle);
    _controller.dispose();
    _scopeNode.dispose();
    super.dispose();
  }

  Future<void> _close([T? result, bool restoreFocus = true]) {
    if (_closing) return _closeFuture ?? Future.value();
    _restoreFocusOnClose = restoreFocus;
    _closing = true;
    _closeFuture = _controller.reverse().whenComplete(() {
      if (!widget.completer.isCompleted) {
        widget.completer.complete(result);
      }
      widget.onClosed(_restoreFocusOnClose);
    });
    return _closeFuture!;
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event.logicalKey.isBackKey) {
      if (event is KeyDownEvent) {
        if (PlatformDetection.isAndroid) {
          DialogBackSuppressor.markDismissed();
        }
        _close();
        return KeyEventResult.handled;
      }
      if (event is KeyUpEvent) return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return _OverlaySheetScope(
      close: (result, {restoreFocus = true}) =>
          _close(result as T?, restoreFocus),
      child: FadeTransition(
        opacity: _fade,
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.barrierDismissible ? () => _close() : null,
                child: ColoredBox(color: widget.barrierColor),
              ),
            ),
            Positioned.fill(
              child: FocusScope(
                node: _scopeNode,
                autofocus: true,
                onKeyEvent: _onKey,
                child: SlideTransition(
                  position: _slide,
                  child: Align(
                    alignment: widget.alignment,
                    child: AnimatedContainer(
                      duration: FocusTheme.animationDuration,
                      child: Builder(builder: widget.builder),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OverlaySheetScope extends InheritedWidget {
  final Future<void> Function(Object? result, {bool restoreFocus}) close;
  const _OverlaySheetScope({required this.close, required super.child});

  @override
  bool updateShouldNotify(covariant _OverlaySheetScope oldWidget) => false;
}
