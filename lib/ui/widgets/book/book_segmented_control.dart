import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/idiom/app_ui_idiom.dart';

class BookSegmentedControl extends StatelessWidget {
  const BookSegmentedControl({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.accent;
    final onSurface = AppColorScheme.onSurface;

    if (AppUiIdiomResolver.isApple) {
      return Align(
        alignment: Alignment.center,
        child: CupertinoSlidingSegmentedControl<int>(
          groupValue: selectedIndex,
          backgroundColor: onSurface.withValues(alpha: 0.10),
          thumbColor: accent,
          onValueChanged: (v) {
            if (v != null) onChanged(v);
          },
          children: {
            for (var i = 0; i < labels.length; i++)
              i: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                child: Text(
                  labels[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: selectedIndex == i
                        ? AppColorScheme.onAccent
                        : onSurface,
                  ),
                ),
              ),
          },
        ),
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: SegmentedButton<int>(
        segments: [
          for (var i = 0; i < labels.length; i++)
            ButtonSegment<int>(value: i, label: Text(labels[i])),
        ],
        selected: {selectedIndex},
        showSelectedIcon: false,
        onSelectionChanged: (s) => onChanged(s.first),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? accent
                : onSurface.withValues(alpha: 0.08),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? AppColorScheme.onAccent
                : onSurface,
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: onSurface.withValues(alpha: 0.12)),
          ),
        ),
      ),
    );
  }
}
