import 'package:flutter/cupertino.dart' show CupertinoDialogAction;
import 'package:flutter/material.dart';

import '../../../util/idiom/app_ui_idiom.dart';

Widget adaptiveDialogAction({
  required VoidCallback? onPressed,
  required Widget child,
  bool isDefault = false,
  bool isDestructive = false,
}) {
  if (AppUiIdiomResolver.isApple) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      isDefaultAction: isDefault,
      isDestructiveAction: isDestructive,
      child: child,
    );
  }
  return TextButton(onPressed: onPressed, child: child);
}
