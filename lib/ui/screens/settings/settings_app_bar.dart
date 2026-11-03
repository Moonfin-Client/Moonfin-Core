import 'package:flutter/material.dart';

import '../../../util/platform_detection.dart';

/// Wraps a category's first screen in the Settings panel. On a phone the
/// category pill above already names it, so that screen drops its title bar.
class SettingsCategoryRoot extends InheritedWidget {
  const SettingsCategoryRoot({super.key, required super.child});

  @override
  bool updateShouldNotify(SettingsCategoryRoot oldWidget) => false;
}

AppBar? buildSettingsAppBar(
  BuildContext context,
  Widget title, {
  List<Widget>? actions,
  Widget? leading,
}) {
  if (PlatformDetection.useMobileUi &&
      context.getInheritedWidgetOfExactType<SettingsCategoryRoot>() != null) {
    return null;
  }
  return AppBar(
    title: title,
    actions: actions,
    automaticallyImplyLeading: !PlatformDetection.isTV,
    leading: PlatformDetection.isTV ? const SizedBox.shrink() : leading,
    scrolledUnderElevation: 0,
  );
}
