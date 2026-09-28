import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/preference_constants.dart';
import 'bottom_nav_metrics.dart';
import 'bottom_nav_theme.dart';

/// Opens [builder] as a sheet shaped for the bar it came from: a card
/// floating above Dock and Split, a panel on the bottom edge for Strip.
///
/// A modal route rather than an overlay inside the layout, so back, focus and
/// screen readers treat it like any other sheet. The bar sits under the scrim.
Future<void> showBottomNavSheet({
  required BuildContext context,
  required BottomNavTheme theme,
  required BottomNavbarStyle style,
  required double barHeight,
  required WidgetBuilder builder,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    isScrollControlled: true,
    barrierColor: AppColorScheme.scrim.withValues(alpha: 0.5),
    builder: (sheetContext) {
      final media = MediaQuery.of(sheetContext);
      final attached = style == BottomNavbarStyle.strip;
      final side = attached
          ? 0.0
          : BottomNavMetrics.floatingInset + media.padding.left;
      final maxHeight = media.size.height - media.padding.top - 24;
      final card = ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: BottomNavMetrics.dockMaxWidth,
          maxHeight: attached
              ? maxHeight
              : maxHeight - barHeight - BottomNavMetrics.capsulePlayerGap,
        ),
        child: BottomNavSurface(
          theme: theme,
          radius: BottomNavMetrics.hubRadius,
          topOnly: attached,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: attached ? media.padding.bottom : 0,
            ),
            child: builder(sheetContext),
          ),
        ),
      );
      return Padding(
        padding: EdgeInsets.fromLTRB(
          side,
          0,
          side,
          attached ? 0 : barHeight + BottomNavMetrics.capsulePlayerGap,
        ),
        child: Center(heightFactor: 1, child: card),
      );
    },
  );
}

class BottomNavSheetGrabber extends StatelessWidget {
  final Color color;

  const BottomNavSheetGrabber({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 8),
        width: 36,
        height: 5,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.24),
          borderRadius: AppRadius.circular(3),
        ),
      ),
    );
  }
}
