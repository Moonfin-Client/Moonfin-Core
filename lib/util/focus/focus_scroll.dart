import 'package:flutter/widgets.dart';

/// Brings a newly focused widget into view, far enough from the top edge that
/// whatever follows it is visible too. Shared so that moving a remote down a
/// page reads as one motion rather than several differently timed ones.
void scrollFocusIntoView(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: const Duration(milliseconds: 250),
    alignment: 0.15,
    curve: Curves.easeOutCubic,
  );
}

/// Scrolls all of [child] into view when focus moves into it from below.
/// Focus traversal only scrolls the focused widget itself into view, so moving
/// up a list of rows would leave each row's title above the top edge. A child
/// taller than the list, as at a large UI scale on a short screen, is left to
/// keep the focused widget in view instead.
class RevealOnFocus extends StatelessWidget {
  final Widget child;

  const RevealOnFocus({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (hasFocus) {
        if (!hasFocus) return;
        final box = context.findRenderObject();
        final position = Scrollable.maybeOf(context)?.position;
        if (box is! RenderBox || position == null || !box.hasSize) return;
        final extent = position.axis == Axis.vertical
            ? box.size.height
            : box.size.width;
        if (extent > position.viewportDimension) return;
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
        );
      },
      child: child,
    );
  }
}
