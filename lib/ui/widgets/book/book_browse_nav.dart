import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../focus/focusable_wrapper.dart';

/// One place the book library's main area can switch to: a format of the
/// titles, a browse list, or Discover.
class BookBrowseEntry {
  final String id;
  final String label;
  final IconData icon;

  /// Shown after the label. Null hides it.
  final String? count;
  final bool selected;
  final VoidCallback onSelect;

  const BookBrowseEntry({
    required this.id,
    required this.label,
    required this.icon,
    required this.onSelect,
    this.count,
    this.selected = false,
  });
}

class BookRailSection {
  final String? header;
  final List<BookBrowseEntry> entries;

  const BookRailSection({this.header, required this.entries});
}

/// The wide layout's left rail, the library's name and size over its entry
/// groups. Every entry is a D-pad focus stop. Right hands focus to the content
/// and left to whatever sits beside the rail.
class BookLibraryRail extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<BookRailSection> sections;
  final FocusNode Function(String id) focusNodeFor;
  final VoidCallback? onNavigateRight;
  final VoidCallback? onNavigateLeft;
  final double topInset;

  const BookLibraryRail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.sections,
    required this.focusNodeFor,
    this.onNavigateRight,
    this.onNavigateLeft,
    this.topInset = 0,
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final last = sections.lastOrNull?.entries.lastOrNull;
    return SizedBox(
      width: 248,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, topInset + 24, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: onSurface,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
            for (final section in sections) ...[
              const SizedBox(height: 22),
              if (section.header != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 6),
                  child: Text(
                    section.header!.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      color: onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              for (final entry in section.entries)
                FocusableWrapper(
                  focusNode: focusNodeFor(entry.id),
                  borderRadius: 12,
                  autoScroll: true,
                  disableScale: true,
                  onSelect: entry.onSelect,
                  onNavigateRight: onNavigateRight,
                  onNavigateLeft: onNavigateLeft,
                  // Down stops at the last entry rather than wandering into
                  // the content beside the rail.
                  onNavigateDown: identical(entry, last) ? () {} : null,
                  child: _RailRow(entry: entry),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _RailRow extends StatelessWidget {
  final BookBrowseEntry entry;

  const _RailRow({required this.entry});

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final accent = AppColorScheme.accent;
    return Semantics(
      button: true,
      selected: entry.selected,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: entry.selected
            ? BoxDecoration(
                color: accent.withValues(alpha: 0.16),
                borderRadius: AppRadius.circular(12),
              )
            : null,
        child: Row(
          children: [
            Icon(
              entry.icon,
              size: 18,
              color: entry.selected ? accent : onSurface.withValues(alpha: 0.8),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                entry.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: entry.selected
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: onSurface,
                ),
              ),
            ),
            if (entry.count != null)
              Text(
                entry.count!,
                style: TextStyle(
                  fontSize: 13,
                  color: entry.selected
                      ? accent
                      : onSurface.withValues(alpha: 0.62),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
