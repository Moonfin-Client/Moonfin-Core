import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../focus/focusable_wrapper.dart';
import '../music/music_widgets.dart';

/// A wide card with a strip of up to [slots] covers over a name and a line
/// or two, for a collection or a series.
class BookCoverStripCard extends StatelessWidget {
  final List<String> covers;
  final int slots;
  final String title;
  final List<String> lines;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final FocusOnKeyEventCallback onKeyEvent;

  const BookCoverStripCard({
    super.key,
    required this.covers,
    required this.title,
    required this.lines,
    required this.focusNode,
    required this.onTap,
    required this.onKeyEvent,
    this.slots = 5,
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: focusNode,
      borderRadius: 16,
      autoScroll: true,
      semanticLabel: title,
      onSelect: onTap,
      onKeyEvent: onKeyEvent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: onSurface.withValues(alpha: 0.06),
          borderRadius: AppRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (var i = 0; i < slots; i++) ...[
                  if (i > 0) const SizedBox(width: 8),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: i >= covers.length
                          ? null
                          : ClipRRect(
                              borderRadius: AppRadius.circular(6),
                              child: musicArt(
                                covers[i],
                                icon: Icons.menu_book_rounded,
                              ),
                            ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: onSurface,
              ),
            ),
            for (final line in lines)
              Text(
                line,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: onSurface.withValues(alpha: 0.65),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
