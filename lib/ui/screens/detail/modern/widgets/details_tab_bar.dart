import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/focus/focusable_wrapper.dart';

/// Clean text tab bar with an underline under the active tab. Focusable and
/// d-pad friendly: tabs select on press, left/right move focus between tabs, and
/// left from the first tab calls [onExitLeft] (e.g. back to the hero actions).
class DetailsTabBar extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final FocusNode Function(int index) focusNodeFor;
  final VoidCallback? onExitLeft;

  const DetailsTabBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    required this.focusNodeFor,
    this.onExitLeft,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = AppColorScheme.accent;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.7);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FocusableWrapper(
                focusNode: focusNodeFor(i),
                disableScale: true,
                useBackgroundFocus: false,
                borderRadius: 8,
                onSelect: () => onSelect(i),
                onNavigateLeft: () {
                  if (i > 0) {
                    focusNodeFor(i - 1).requestFocus();
                  } else {
                    onExitLeft?.call();
                  }
                },
                onNavigateRight: () {
                  if (i < labels.length - 1) {
                    focusNodeFor(i + 1).requestFocus();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IntrinsicWidth(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          labels[i],
                          textAlign: TextAlign.center,
                          style: textTheme.titleSmall?.copyWith(
                          color: selectedIndex == i
                              ? AppColorScheme.onSurface
                              : muted,
                          fontWeight: selectedIndex == i
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        height: 3,
                        decoration: BoxDecoration(
                          color: selectedIndex == i
                              ? accent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
