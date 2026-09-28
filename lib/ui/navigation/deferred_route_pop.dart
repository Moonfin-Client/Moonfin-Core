import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Finish key dispatch before popping, but do not wait for unrelated UI activity.
void scheduleRoutePop(GoRouter router, {required bool Function() isMounted}) {
  final configuration = router.routerDelegate.currentConfiguration;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // A second Back or a newer Search/Home command must not pop another page.
    if (isMounted() &&
        identical(router.routerDelegate.currentConfiguration, configuration) &&
        router.canPop()) {
      router.pop();
    }
  });
  WidgetsBinding.instance.scheduleFrame();
}
