import 'package:flutter/material.dart';

import '../../../util/idiom/app_ui_idiom.dart';

const String kCleanSettingsFontFamily = 'NotoSans';

Widget withCleanSettingsTypography(BuildContext context, Widget child) {
  final theme = Theme.of(context);
  final apple = AppUiIdiomResolver.isApple;
  final cleanTextTheme = theme.textTheme.apply(
    fontFamily: kCleanSettingsFontFamily,
  );
  final cleanPrimaryTextTheme = theme.primaryTextTheme.apply(
    fontFamily: kCleanSettingsFontFamily,
  );

  TextStyle? cleanStyle(TextStyle? style, TextStyle? fallback) {
    final base = style ?? fallback;
    if (base == null) return null;
    return base.copyWith(fontFamily: kCleanSettingsFontFamily);
  }

  return Theme(
    data: theme.copyWith(
      scaffoldBackgroundColor: apple
          ? Color.alphaBlend(
              Colors.white.withValues(alpha: 0.05),
              theme.scaffoldBackgroundColor,
            )
          : null,
      textTheme: cleanTextTheme,
      primaryTextTheme: cleanPrimaryTextTheme,
      listTileTheme: theme.listTileTheme.copyWith(
        titleTextStyle: cleanStyle(
          theme.listTileTheme.titleTextStyle,
          cleanTextTheme.bodyLarge,
        ),
        subtitleTextStyle: cleanStyle(
          theme.listTileTheme.subtitleTextStyle,
          cleanTextTheme.bodyMedium,
        ),
      ),
      dialogTheme: theme.dialogTheme.copyWith(
        titleTextStyle: cleanStyle(
          theme.dialogTheme.titleTextStyle,
          cleanTextTheme.titleLarge,
        ),
        contentTextStyle: cleanStyle(
          theme.dialogTheme.contentTextStyle,
          cleanTextTheme.bodyMedium,
        ),
      ),
    ),
    child: DefaultTextStyle.merge(
      style: const TextStyle(fontFamily: kCleanSettingsFontFamily),
      child: child,
    ),
  );
}