import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../focus/focusable_wrapper.dart';
import '../track_selector_dialog.dart';

// D-pad friendly form controls for the Seerr request and issue dialogs. Plain
// Material toggles, chips, and dropdowns don't react to the remote's select
// key, so these wrap the shared FocusableWrapper, which handles select, tap,
// and directional navigation.

/// A switch or checkbox style row. Renders non-focusable when [onChanged] is
/// null so disabled rows are skipped during d-pad traversal.
class SeerrToggleRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool checkbox;
  final bool autofocus;
  final Widget? trailing;

  const SeerrToggleRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.checkbox = false,
    this.autofocus = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onChanged != null;
    final titleColor = enabled ? Colors.white : Colors.white38;
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          if (checkbox) ...[
            Icon(
              value ? Icons.check_box : Icons.check_box_outline_blank,
              color: value ? AppColorScheme.accent : Colors.white38,
              size: 22,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(title, style: TextStyle(color: titleColor)),
          ),
          if (trailing != null) ...[const SizedBox(width: 12), trailing!],
          if (!checkbox) ...[
            const SizedBox(width: 12),
            Icon(
              value ? Icons.toggle_on : Icons.toggle_off,
              color: value ? AppColorScheme.accent : Colors.white38,
              size: 34,
            ),
          ],
        ],
      ),
    );

    if (!enabled) return content;

    return FocusableWrapper(
      autofocus: autofocus,
      onSelect: () => onChanged!(!value),
      borderRadius: 8,
      useBackgroundFocus: true,
      disableScale: true,
      child: content,
    );
  }
}

/// A row that shows a label and the current value and opens a picker on select.
class SeerrSelectorRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const SeerrSelectorRow({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FocusableWrapper(
      onSelect: onTap,
      borderRadius: 8,
      disableScale: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(8),
          border: Border.fromBorderSide(ThemeRegistry.active.borders.chipBorder),
        ),
        child: Row(
          children: [
            Text(label, style: const TextStyle(color: Colors.white54)),
            const Spacer(),
            Flexible(
              child: Text(
                value,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_drop_down, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}

/// A focusable pill chip used for multi-select (e.g. seasons). Renders
/// non-focusable when [onSelected] is null.
class SeerrChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  const SeerrChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onSelected != null;
    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected
            ? AppColorScheme.accent
            : Colors.white.withValues(alpha: enabled ? 0.08 : 0.04),
        borderRadius: AppRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: !enabled
              ? Colors.white38
              : selected
                  ? Colors.white
                  : Colors.white70,
        ),
      ),
    );

    if (!enabled) return content;

    return FocusableWrapper(
      onSelect: () => onSelected!(!selected),
      borderRadius: 999,
      disableScale: true,
      child: content,
    );
  }
}

/// A dialog action button (Cancel / primary submit) that works with d-pad.
class SeerrDialogButton extends StatelessWidget {
  final String label;
  final bool primary;
  final VoidCallback? onPressed;
  final bool busy;
  final String? busyLabel;
  final Color? primaryColor;
  final IconData? icon;
  final Color? foreground;

  const SeerrDialogButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.primary = false,
    this.busy = false,
    this.busyLabel,
    this.primaryColor,
    this.icon,
    this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final Color background = primary
        ? (enabled ? (primaryColor ?? Colors.amber[800]!) : Colors.white12)
        : Colors.white10;
    final Color foregroundColor = !enabled
        ? Colors.white38
        : foreground ?? Colors.white;
    return FocusableWrapper(
      onSelect: onPressed,
      borderRadius: 10,
      disableScale: true,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppRadius.circular(10),
        ),
        child: busy
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white70,
                    ),
                  ),
                  if (busyLabel != null) ...[
                    const SizedBox(width: 10),
                    Text(
                      busyLabel!,
                      style: TextStyle(
                        color: foregroundColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18, color: foregroundColor),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: foregroundColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Opens the shared d-pad list picker and returns the chosen index.
Future<int?> showSeerrOptionPicker(
  BuildContext context, {
  required String title,
  required List<String> labels,
  int? selectedIndex,
}) {
  return TrackSelectorDialog.show(
    context,
    title: title,
    options: [for (final label in labels) TrackOption(label: label)],
    selectedIndex: selectedIndex,
  );
}
