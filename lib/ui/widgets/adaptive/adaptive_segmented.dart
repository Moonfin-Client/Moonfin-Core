import 'package:flutter/cupertino.dart' show CupertinoSlidingSegmentedControl;
import 'package:flutter/material.dart';

import '../../../util/idiom/app_ui_idiom.dart';

Widget adaptiveSegmented<T extends Object>({
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
  return SegmentedButton<T>(
    segments: [
      for (final entry in options.entries)
        ButtonSegment<T>(value: entry.key, label: Text(entry.value)),
    ],
    selected: {selected},
    showSelectedIcon: false,
    onSelectionChanged: (s) => onChanged(s.first),
  );
}
