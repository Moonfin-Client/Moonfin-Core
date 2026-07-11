import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Quota line shown in the request dialog and collection request sheet.
class SeerrQuotaRow extends StatelessWidget {
  final String label;
  final bool blocked;

  const SeerrQuotaRow({super.key, required this.label, this.blocked = false});

  @override
  Widget build(BuildContext context) {
    final color = blocked
        ? AppColorScheme.statusError
        : AppColorScheme.onSurface.withValues(alpha: 0.7);
    final fill = blocked
        ? AppColorScheme.statusError.withValues(alpha: 0.1)
        : AppColorScheme.onSurface.withValues(alpha: 0.08);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: AppRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(blocked ? Icons.block : Icons.data_usage, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(color: color, fontSize: 12.5),
            ),
          ),
        ],
      ),
    );
  }
}
