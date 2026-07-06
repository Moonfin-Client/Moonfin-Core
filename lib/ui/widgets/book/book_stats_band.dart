import 'package:flutter/widgets.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../adaptive/adaptive_glass.dart';

class BookStat {
  final String label;
  final int count;

  const BookStat({required this.label, required this.count});
}

class BookStatsBand extends StatelessWidget {
  const BookStatsBand({super.key, required this.stats});

  final List<BookStat> stats;

  @override
  Widget build(BuildContext context) {
    final visible = stats.where((s) => s.count > 0).toList();
    if (visible.isEmpty) return const SizedBox.shrink();
    final onSurface = AppColorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Row(
        children: [
          for (var i = 0; i < visible.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(
              child: adaptiveGlass(
                context: context,
                cornerRadius: 12,
                fallbackColor: onSurface.withValues(alpha: 0.06),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${visible[i].count}',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: onSurface,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        visible[i].label.toUpperCase(),
                        style: TextStyle(
                          fontSize: 9,
                          letterSpacing: 0.6,
                          color: onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
