import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../util/platform_detection.dart';
import '../widgets/navigation_layout.dart';

/// Grants initial focus to the first focusable content descendant of a
/// freshly pushed (or popped-back-to) route, so the d-pad always has
/// somewhere to start. Works around Flutter Navigator's default of not
/// auto-focusing any child of a new route's FocusScope.
///
/// Only TV runs this: a mouse never needs focus handed to it, and on phones
/// and tablets landing on the first widget pops the keyboard open on any
/// screen that opens with a text field.
class FocusRouteObserver extends NavigatorObserver {
  static const _maxAttempts = 8;
  static const _retryDelay = Duration(milliseconds: 50);

  Timer? _retryTimer;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _scheduleFocus(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) _scheduleFocus(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _scheduleFocus(newRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  void _scheduleFocus(Route<dynamic> route) {
    if (!PlatformDetection.isTV) return;
    _retryTimer?.cancel();
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryFocus(route, 0));
  }

  void _tryFocus(Route<dynamic> route, int attempt) {
    final modal = route is ModalRoute ? route : null;
    final ctx = modal?.subtreeContext;
    if (ctx == null || !ctx.mounted) return;

    final scope = FocusScope.of(ctx);
    if (_scopeHasFocusedDescendant(scope)) return;

    final target = _firstContentDescendant(scope);
    if (target != null) {
      scope.requestFocus(target);
    }

    if (_scopeHasFocusedDescendant(scope)) return;
    if (attempt + 1 >= _maxAttempts) return;
    _retryTimer = Timer(
      _retryDelay,
      () => _tryFocus(route, attempt + 1),
    );
  }

  /// First focusable in tree order that sits outside the navigation chrome.
  /// Chrome is never a landing spot: parking there pops the sidebar open
  /// before the content has anything to focus, then content steals focus
  /// back and the rail snaps shut. When only chrome is focusable this
  /// returns nothing and the screen's own focus handling takes over.
  FocusNode? _firstContentDescendant(FocusScopeNode scope) {
    for (final node in scope.traversalDescendants) {
      if (node is FocusScopeNode) continue;
      if (node.context == null) continue;
      if (_isChrome(node)) continue;
      return node;
    }
    return null;
  }

  bool _isChrome(FocusNode node) {
    final roots = NavigationLayout.chromeFocusRoots;
    if (roots.isEmpty) return false;
    FocusNode? current = node;
    while (current != null) {
      if (roots.contains(current)) return true;
      current = current.parent;
    }
    return false;
  }

  bool _scopeHasFocusedDescendant(FocusScopeNode scope) {
    if (scope.focusedChild != null) return true;
    final primary = FocusManager.instance.primaryFocus;
    if (primary == null || identical(primary, scope)) return false;
    FocusNode? node = primary;
    while (node != null) {
      if (identical(node, scope)) return true;
      node = node.parent;
    }
    return false;
  }
}
