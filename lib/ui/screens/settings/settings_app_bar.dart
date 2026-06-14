import 'package:flutter/material.dart';

import '../../../util/platform_detection.dart';

AppBar buildSettingsAppBar(
  BuildContext context,
  Widget title, {
  List<Widget>? actions,
}) {
  return AppBar(
    title: title,
    actions: actions,
    automaticallyImplyLeading: !PlatformDetection.isTV,
    leading: PlatformDetection.isTV ? const SizedBox.shrink() : null,
    scrolledUnderElevation: 0,
  );
}
