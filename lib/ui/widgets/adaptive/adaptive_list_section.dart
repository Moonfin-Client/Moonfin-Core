import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/idiom/app_ui_idiom.dart';
import 'adaptive_glass.dart';

Widget adaptiveListSection({required List<Widget> children}) {
  if (AppUiIdiomResolver.isApple) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        rows.add(
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 16,
            color: AppColorScheme.onSurface.withValues(alpha: 0.12),
          ),
        );
      }
      rows.add(children[i]);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
      child: Builder(
        builder: (context) => adaptiveGlass(
          context: context,
          cornerRadius: 12,
          blur: 18,
          tint: AppColorScheme.onSurface.withValues(alpha: 0.05),
          fallbackColor: AppColorScheme.onSurface.withValues(alpha: 0.12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rows,
          ),
        ),
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: children,
  );
}
