import 'package:flutter/cupertino.dart' show CupertinoSlidingSegmentedControl;
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/idiom/app_ui_idiom.dart';

Widget adaptiveSegmented<T extends Object>({
  required BuildContext context,
  required Map<T, String> options,
  required T selected,
  required ValueChanged<T> onChanged,
}) {
  if (AppUiIdiomResolver.isApple) {
    return CupertinoSlidingSegmentedControl<T>(
      groupValue: selected,
      onValueChanged: (v) {
        if (v != null) onChanged(v);
      },
      children: {
        for (final entry in options.entries)
          entry.key: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Text(entry.value),
          ),
      },
    );
  }

  return Row(
    children: [
      for (var i = 0; i < options.length; i++) ...[
        if (i > 0) const SizedBox(width: 8),
        Expanded(
          child: _CustomSegmentItem<T>(
            value: options.keys.elementAt(i),
            label: options.values.elementAt(i),
            isSelected: selected == options.keys.elementAt(i),
            onTap: () => onChanged(options.keys.elementAt(i)),
          ),
        ),
      ],
    ],
  );
}

class _CustomSegmentItem<T extends Object> extends StatefulWidget {
  final T value;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CustomSegmentItem({
    required this.value,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_CustomSegmentItem<T>> createState() => _CustomSegmentItemState<T>();
}

class _CustomSegmentItemState<T extends Object> extends State<_CustomSegmentItem<T>> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = AppColorScheme.accent;
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.7);

    return InkWell(
      onTap: widget.onTap,
      borderRadius: AppRadius.circular(12),
      onFocusChange: (f) {
        setState(() => _isFocused = f);
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(12),
          color: _isFocused
              ? accent.withValues(alpha: 0.12)
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
          border: Border.all(
            color: _isFocused ? accent : theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: _isFocused ? 2.0 : 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleSmall?.copyWith(
                color: (widget.isSelected || _isFocused)
                    ? theme.colorScheme.onSurface
                    : muted,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            // Underline for selected tab
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 3,
              width: 24,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? accent
                    : Colors.transparent,
                borderRadius: AppRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
