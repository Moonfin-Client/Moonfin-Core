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
