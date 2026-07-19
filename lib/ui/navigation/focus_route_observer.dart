import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../util/platform_detection.dart';

/// Grants initial focus to the first focusable descendant of a freshly
/// pushed (or popped-back-to) route. Works around Flutter Navigator's
/// default of not auto-focusing any child of a new route's FocusScope.
///
/// Phones and tablets sit this out. There is nothing to steer with a d-pad
/// there, and landing on the first widget pops the keyboard open on any screen
/// that opens with a text field.
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
    if (PlatformDetection.isMobile) return;
    _retryTimer?.cancel();
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryFocus(route, 0));
  }

  void _tryFocus(Route<dynamic> route, int attempt) {
    final modal = route is ModalRoute ? route : null;
    final ctx = modal?.subtreeContext;
    if (ctx == null || !ctx.mounted) return;

    final scope = FocusScope.of(ctx);
    if (_scopeHasFocusedDescendant(scope)) return;

    scope.requestFocus();
    scope.nextFocus();

    if (_scopeHasFocusedDescendant(scope)) return;
    if (attempt + 1 >= _maxAttempts) return;
    _retryTimer = Timer(
      _retryDelay,
      () => _tryFocus(route, attempt + 1),
    );
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
