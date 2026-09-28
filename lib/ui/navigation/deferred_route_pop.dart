import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Finishes key dispatch before popping, without waiting on unrelated UI work.
void scheduleRoutePop(GoRouter router, {required bool Function() isMounted}) {
  final configuration = router.routerDelegate.currentConfiguration;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // A second Back or a newer Search or Home shouldn't pop another page.
    if (isMounted() &&
        identical(router.routerDelegate.currentConfiguration, configuration) &&
        router.canPop()) {
      router.pop();
    }
  });
  WidgetsBinding.instance.scheduleFrame();
}
