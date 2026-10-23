import 'package:flutter/material.dart';

import '../adaptive/sf_symbol.dart';
import 'focusable_wrapper.dart';

class MenuActionRow extends StatefulWidget {
  const MenuActionRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.autofocus = false,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool autofocus;
  final Color? color;

  @override
  State<MenuActionRow> createState() => _MenuActionRowState();
}

class _MenuActionRowState extends State<MenuActionRow> {
  final FocusNode _focusNode = FocusNode(debugLabel: 'MenuActionRow');

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.color ?? theme.colorScheme.onSurface;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        // Focus follows the pointer so the arrow keys carry on from the row
        // under the mouse.
        onEnter: (_) => _focusNode.requestFocus(),
        child: FocusableWrapper(
          focusNode: _focusNode,
          autofocus: widget.autofocus,
          onSelect: widget.onPressed,
          borderRadius: 10,
          disableScale: true,
          useBackgroundFocus: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
            child: Row(
              children: [
                AdaptiveIcon(widget.icon, size: 22, color: color),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.label,
                    style: theme.textTheme.bodyLarge?.copyWith(color: color),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
