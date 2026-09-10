import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/audiobook_bookmarks_service.dart';
import '../../../data/services/audiobook_notes_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import 'audiobook_time.dart';
import 'chapter.dart';

/// The TV drawer shares a column with the player instead of filling a sheet,
/// so it runs denser: the tab bar fits and more rows show.
bool get _dense => PlatformDetection.isTV;

/// Every TV drawer row is this tall, so the tabs line up.
const double _denseRowHeight = 30.0;
const double _denseRowPitch = _denseRowHeight + 2; // + vertical margins

/// One row of a drawer list on TV.
///
/// A ListTile is taller than 30px whatever you pass it, and its text spills
/// outside the focus rectangle. This is a plain centred Row instead, shared by
/// every tab so the rows match.
class _DenseRow extends StatelessWidget {
  const _DenseRow({
    required this.focused,
    required this.title,
    this.leading,
    this.trailingText,
    this.actions = const [],
    this.titleColor,
    this.bold = false,
    this.highlighted = false,
    this.onTap,
  });

  final bool focused;
  final String title;
  final Widget? leading;
  final String? trailingText;
  final List<Widget> actions;
  final Color? titleColor;
  final bool bold;

  /// The row holds the sub-focus rather than one of its [actions].
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(8);
    return Container(
      height: _denseRowHeight,
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      decoration: BoxDecoration(
        color: highlighted
            ? AppColorScheme.accent.withValues(alpha: 0.12)
            : null,
        border: Border.all(
          color: focused ? AppColorScheme.accent : Colors.transparent,
          width: 2.0,
        ),
        borderRadius: radius,
      ),
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 6)],
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: highlighted ? Colors.white : titleColor,
                    fontWeight: bold || highlighted
                        ? FontWeight.w700
                        : FontWeight.w500,
                  ),
                ),
              ),
              if (trailingText != null) ...[
                const SizedBox(width: 6),
                Text(
                  trailingText!,
                  style: TextStyle(
                    fontFeatures: const [FontFeature.tabularFigures()],
                    fontSize: 11,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
              ...actions,
            ],
          ),
        ),
      ),
    );
  }
}

/// Circled icon sized to sit inside a [_DenseRow].
Widget _denseIcon(IconData icon, Color color, {required bool focused}) {
  return Container(
    width: 22,
    height: 22,
    decoration: BoxDecoration(
      color:
          focused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
      shape: BoxShape.circle,
      border: Border.all(
        color: focused ? Colors.white : Colors.transparent,
        width: 1.5,
      ),
    ),
    child: Icon(icon, size: 13, color: focused ? Colors.white : color),
  );
}

/// Per-row action. An IconButton is 48px by default and would not fit.
Widget _denseAction({
  required IconData icon,
  required bool focused,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 4),
    child: InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: onPressed,
      borderRadius: BorderRadius.circular(11),
      child: _denseIcon(
        icon,
        AppColorScheme.onSurface.withValues(alpha: 0.75),
        focused: focused,
      ),
    ),
  );
}

enum AudiobookDrawerTab { timeline, chapters, bookmarks, notes, queue }

class AudiobookDrawerTabBar extends StatelessWidget {
  const AudiobookDrawerTabBar({
    super.key,
    required this.current,
    required this.onChanged,
    required this.labels,
    required this.tvFocused,
    required this.tvIndex,
    required this.tabs,
  });

  final AudiobookDrawerTab current;
  final ValueChanged<AudiobookDrawerTab> onChanged;
  final Map<AudiobookDrawerTab, String> labels;
  final bool tvFocused;
  final int tvIndex;
  final List<AudiobookDrawerTab> tabs;

  @override
  Widget build(BuildContext context) {
    final bar = Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColorScheme.surface.withValues(alpha: 0.55),
        borderRadius: AppRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < tabs.length; i++)
            AudiobookPillSegment(
              label: labels[tabs[i]] ?? tabs[i].name,
              selected: tabs[i] == current,
              tvFocused: tvFocused && tvIndex == i,
              onTap: () => onChanged(tabs[i]),
            ),
        ],
      ),
    );

    // A d-pad cannot drag a scroll view, so on TV the bar scales down to fit
    // its column. Translations run long here, so a fixed size would not hold.
    if (_dense) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: bar,
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: bar,
    );
  }
}

class AudiobookPillSegment extends StatelessWidget {
  const AudiobookPillSegment({
    super.key,
    required this.label,
    required this.selected,
    required this.tvFocused,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool tvFocused;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final apple = PlatformDetection.isApple;

    final Color bg;
    final Color fg;
    if (selected) {
      if (apple) {
        bg = AppColorScheme.accent.withValues(alpha: 0.18);
        fg = AppColorScheme.accent;
      } else {
        bg = AppColorScheme.accent;
        fg = AppColorScheme.onAccent;
      }
    } else {
      bg = Colors.transparent;
      fg = AppColorScheme.onSurface.withValues(alpha: 0.6);
    }

    final radius = AppRadius.circular(9);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 140),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: radius,
        border: tvFocused
            ? Border.all(color: Colors.white, width: 2.2)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          mouseCursor: SystemMouseCursors.click,
          borderRadius: radius,
          splashColor: apple ? Colors.transparent : null,
          highlightColor: apple ? Colors.transparent : null,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _dense ? 9 : 15,
              vertical: _dense ? 6 : 8,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: _dense ? 11 : 13,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: fg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AudiobookChaptersList extends StatefulWidget {
  const AudiobookChaptersList({
    super.key,
    required this.chapters,
    required this.position,
    required this.onTap,
    required this.tvFocusedIndex,
  });

  final List<Chapter> chapters;
  final Duration position;
  final ValueChanged<Chapter> onTap;
  final int tvFocusedIndex;

  @override
  State<AudiobookChaptersList> createState() => _AudiobookChaptersListState();
}

class _AudiobookChaptersListState extends State<AudiobookChaptersList> {
  late final ScrollController _scrollController = ScrollController();
  double _viewportHeight = 300.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AudiobookChaptersList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tvFocusedIndex != oldWidget.tvFocusedIndex && widget.tvFocusedIndex != -1) {
      _scrollToFocused();
    }
  }

  void _scrollToFocused() {
    if (!_scrollController.hasClients) return;
    final double itemHeight = _dense ? _denseRowPitch : 44.0;
    final double target = widget.tvFocusedIndex * itemHeight;
    final double currentScroll = _scrollController.offset;
    
    if (target < currentScroll) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    } else if (target + itemHeight > currentScroll + _viewportHeight) {
      _scrollController.animateTo(
        target + itemHeight - _viewportHeight,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.chapters.isEmpty) {
      return _EmptyState(
        text: AppLocalizations.of(context).audiobookNoChapters,
      );
    }
    var current = 0;
    for (var i = 0; i < widget.chapters.length; i++) {
      if (widget.chapters[i].startMs <= widget.position.inMilliseconds) {
        current = i;
      } else {
        break;
      }
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewportHeight = constraints.maxHeight;
        return ListView.builder(
          controller: _scrollController,
          itemCount: widget.chapters.length,
          itemBuilder: (context, index) {
            final c = widget.chapters[index];
            final isCurrent = index == current;
            final isTvFocused = index == widget.tvFocusedIndex;

            if (_dense) {
              return _DenseRow(
                focused: isTvFocused,
                title: c.title,
                bold: isCurrent,
                titleColor: isCurrent ? AppColorScheme.accent : null,
                trailingText:
                    formatAudiobookClock(Duration(milliseconds: c.startMs)),
                onTap: () => widget.onTap(c),
                leading: SizedBox(
                  width: 22,
                  child: Text(
                    '${index + 1}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFeatures: const [FontFeature.tabularFigures()],
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isCurrent
                          ? AppColorScheme.accent
                          : AppColorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              );
            }

            return Container(
              height: 40.0,
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isTvFocused ? AppColorScheme.accent : Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                dense: true,
                onTap: () => widget.onTap(c),
                leading: SizedBox(
                  width: 36,
                  child: Text(
                    '${index + 1}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFeatures: const [FontFeature.tabularFigures()],
                      color: isCurrent
                          ? AppColorScheme.accent
                          : AppColorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                title: Text(
                  c.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isCurrent ? AppColorScheme.accent : null,
                    fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  formatAudiobookClock(Duration(milliseconds: c.startMs)),
                  style: TextStyle(
                    fontFeatures: const [FontFeature.tabularFigures()],
                    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AudiobookBookmarksList extends StatefulWidget {
  const AudiobookBookmarksList({
    super.key,
    required this.item,
    required this.service,
    required this.onJump,
    required this.tvFocusedIndex,
    required this.tvSubIndex,
    this.onExport,
  });

  final AggregatedItem? item;
  final AudiobookBookmarksService service;
  final ValueChanged<AudiobookBookmark> onJump;
  final int tvFocusedIndex;
  final int tvSubIndex;
  final VoidCallback? onExport;

  @override
  State<AudiobookBookmarksList> createState() => _AudiobookBookmarksListState();
}

class _AudiobookBookmarksListState extends State<AudiobookBookmarksList> {
  late final ScrollController _scrollController = ScrollController();
  double _viewportHeight = 300.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AudiobookBookmarksList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tvFocusedIndex != oldWidget.tvFocusedIndex) {
      _scrollToFocused();
    }
  }

  void _scrollToFocused() {
    if (!_scrollController.hasClients) return;
    if (widget.tvFocusedIndex == -1) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
      return;
    }
    final double itemHeight = _dense ? _denseRowPitch : 56.0;
    final double target = widget.tvFocusedIndex * itemHeight;
    final double currentScroll = _scrollController.offset;
    
    if (target < currentScroll) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    } else if (target + itemHeight > currentScroll + _viewportHeight) {
      _scrollController.animateTo(
        target + itemHeight - _viewportHeight,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item == null) return const SizedBox.shrink();
    final apple = PlatformDetection.isApple;
    return StreamBuilder<List<AudiobookBookmark>>(
      stream: widget.service.watch(widget.item!.serverId, widget.item!.id),
      initialData: const [],
      builder: (context, snapshot) {
        final list = snapshot.data ?? const [];
        if (list.isEmpty) {
          return _EmptyState(
            text: AppLocalizations.of(context).audiobookNoBookmarks,
          );
        }
        return Column(
          children: [
            if (!PlatformDetection.isTV && widget.onExport != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: widget.onExport,
                      icon: Icon(apple ? CupertinoIcons.square_arrow_down : Icons.download, size: 16),
                      label: Text(AppLocalizations.of(context).audiobookExportBookmarks, style: const TextStyle(fontSize: 12)),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColorScheme.accent,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  _viewportHeight = constraints.maxHeight;
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final b = list[index];
                      final isTvFocused = index == widget.tvFocusedIndex;
                      final isPlayFocused = isTvFocused && widget.tvSubIndex == 0;
                      final isDeleteFocused = isTvFocused && widget.tvSubIndex == 1;
                      if (_dense) {
                        return _DenseRow(
                          focused: isTvFocused,
                          highlighted: isPlayFocused,
                          title: 'Bookmark ${index + 1}: ${b.label}',
                          trailingText: formatAudiobookClock(
                              Duration(milliseconds: b.positionMs)),
                          onTap: () => widget.onJump(b),
                          leading: _denseIcon(
                            apple ? CupertinoIcons.bookmark_fill : Icons.bookmark,
                            AppColorScheme.accent,
                            focused: isPlayFocused,
                          ),
                          actions: [
                            _denseAction(
                              icon: apple
                                  ? CupertinoIcons.delete
                                  : Icons.delete_outline,
                              focused: isDeleteFocused,
                              onPressed: () => widget.service.removeAt(
                                  widget.item!.serverId,
                                  widget.item!.id,
                                  b.positionMs),
                            ),
                          ],
                        );
                      }

                      return Container(
                        height: 52.0,
                        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isTvFocused ? AppColorScheme.accent : Colors.transparent,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          tileColor: isPlayFocused ? AppColorScheme.accent.withValues(alpha: 0.12) : null,
                          leading: Container(
                            decoration: BoxDecoration(
                              color: isPlayFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isPlayFocused ? Colors.white : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              apple ? CupertinoIcons.bookmark_fill : Icons.bookmark,
                              color: isPlayFocused ? Colors.white : AppColorScheme.accent,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            'Bookmark ${index + 1}: ${b.label}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: isPlayFocused ? Colors.white : null,
                              fontWeight: isPlayFocused ? FontWeight.w700 : null,
                            ),
                          ),
                          subtitle: Text(
                            b.createdAt.toLocal().toString().split('.').first,
                            style: TextStyle(
                              fontSize: 11,
                              color: isPlayFocused ? Colors.white.withValues(alpha: 0.7) : AppColorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: isDeleteFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDeleteFocused ? Colors.white : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                apple ? CupertinoIcons.delete : Icons.delete_outline,
                                size: 20,
                                color: isDeleteFocused ? Colors.white : null,
                              ),
                              onPressed: () =>
                                  widget.service.removeAt(widget.item!.serverId, widget.item!.id, b.positionMs),
                            ),
                          ),
                          onTap: () => widget.onJump(b),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class AudiobookNotesList extends StatefulWidget {
  const AudiobookNotesList({
    super.key,
    required this.item,
    required this.service,
    required this.onJump,
    required this.onEdit,
    required this.tvFocusedIndex,
    required this.tvSubIndex,
    this.onExport,
  });

  final AggregatedItem? item;
  final AudiobookNotesService service;
  final ValueChanged<AudiobookNote> onJump;
  final ValueChanged<AudiobookNote> onEdit;
  final int tvFocusedIndex;
  final int tvSubIndex;
  final VoidCallback? onExport;

  @override
  State<AudiobookNotesList> createState() => _AudiobookNotesListState();
}

class _AudiobookNotesListState extends State<AudiobookNotesList> {
  late final ScrollController _scrollController = ScrollController();
  double _viewportHeight = 300.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AudiobookNotesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tvFocusedIndex != oldWidget.tvFocusedIndex) {
      _scrollToFocused();
    }
  }

  void _scrollToFocused() {
    if (!_scrollController.hasClients) return;
    if (widget.tvFocusedIndex == -1) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
      return;
    }
    final double itemHeight = _dense ? _denseRowPitch : 56.0;
    final double target = widget.tvFocusedIndex * itemHeight;
    final double currentScroll = _scrollController.offset;
    
    if (target < currentScroll) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    } else if (target + itemHeight > currentScroll + _viewportHeight) {
      _scrollController.animateTo(
        target + itemHeight - _viewportHeight,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item == null) return const SizedBox.shrink();
    final apple = PlatformDetection.isApple;
    return StreamBuilder<List<AudiobookNote>>(
      stream: widget.service.watch(widget.item!.serverId, widget.item!.id),
      initialData: const [],
      builder: (context, snapshot) {
        final list = snapshot.data ?? const [];
        if (list.isEmpty) {
          return _EmptyState(
            text: AppLocalizations.of(context).audiobookNoNotes,
          );
        }
        return Column(
          children: [
            if (!PlatformDetection.isTV && widget.onExport != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: widget.onExport,
                      icon: Icon(apple ? CupertinoIcons.square_arrow_down : Icons.download, size: 16),
                      label: Text(AppLocalizations.of(context).audiobookExportNotes, style: const TextStyle(fontSize: 12)),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColorScheme.accent,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  _viewportHeight = constraints.maxHeight;
                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final n = list[index];
                      final isTvFocused = index == widget.tvFocusedIndex;
                      final isPlayFocused = isTvFocused && widget.tvSubIndex == 0;
                      final isEditFocused = isTvFocused && widget.tvSubIndex == 1;
                      final isDeleteFocused = isTvFocused && widget.tvSubIndex == 2;
                      if (_dense) {
                        return _DenseRow(
                          focused: isTvFocused,
                          highlighted: isPlayFocused,
                          title: n.body,
                          trailingText: formatAudiobookClock(
                              Duration(milliseconds: n.positionMs)),
                          onTap: () => widget.onJump(n),
                          leading: _denseIcon(
                            apple
                                ? CupertinoIcons.chat_bubble_text
                                : Icons.note_outlined,
                            AppColorScheme.accent,
                            focused: isPlayFocused,
                          ),
                          actions: [
                            _denseAction(
                              icon: apple
                                  ? CupertinoIcons.pencil
                                  : Icons.edit_outlined,
                              focused: isEditFocused,
                              onPressed: () => widget.onEdit(n),
                            ),
                            _denseAction(
                              icon: apple
                                  ? CupertinoIcons.delete
                                  : Icons.delete_outline,
                              focused: isDeleteFocused,
                              onPressed: () => widget.service.remove(
                                  widget.item!.serverId, widget.item!.id, n.id),
                            ),
                          ],
                        );
                      }

                      return InkWell(
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () => widget.onJump(n),
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 52.0,
                          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isTvFocused ? AppColorScheme.accent : Colors.transparent,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: isPlayFocused ? AppColorScheme.accent.withValues(alpha: 0.12) : null,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isPlayFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isPlayFocused ? Colors.white : Colors.transparent,
                                    width: 1.5,
                                  ),
                                ),
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  apple ? CupertinoIcons.chat_bubble_text : Icons.note_outlined,
                                  color: isPlayFocused ? Colors.white : AppColorScheme.accent,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      formatAudiobookClock(Duration(milliseconds: n.positionMs)),
                                      style: TextStyle(
                                        color: isPlayFocused ? Colors.white : AppColorScheme.accent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      n.body,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: isPlayFocused
                                            ? Colors.white.withValues(alpha: 0.7)
                                            : AppColorScheme.onSurface.withValues(alpha: 0.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isEditFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isEditFocused ? Colors.white : Colors.transparent,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        apple ? CupertinoIcons.pencil : Icons.edit_outlined,
                                        size: 18,
                                        color: isEditFocused ? Colors.white : null,
                                      ),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () => widget.onEdit(n),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isDeleteFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isDeleteFocused ? Colors.white : Colors.transparent,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        apple ? CupertinoIcons.delete : Icons.delete_outline,
                                        size: 18,
                                        color: isDeleteFocused ? Colors.white : null,
                                      ),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () =>
                                          widget.service.remove(widget.item!.serverId, widget.item!.id, n.id),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class AudiobookTimelineList extends StatefulWidget {
  const AudiobookTimelineList({
    super.key,
    required this.events,
    required this.onJump,
    required this.onEditNote,
    required this.onDeleteBookmark,
    required this.onDeleteNote,
    required this.tvFocusedIndex,
    required this.tvSubIndex,
    this.onExport,
  });

  final List<TimelineEvent> events;
  final ValueChanged<TimelineEvent> onJump;
  final ValueChanged<AudiobookNote> onEditNote;
  final ValueChanged<AudiobookBookmark> onDeleteBookmark;
  final ValueChanged<AudiobookNote> onDeleteNote;
  final int tvFocusedIndex;
  final int tvSubIndex;
  final VoidCallback? onExport;

  @override
  State<AudiobookTimelineList> createState() => _AudiobookTimelineListState();
}

class _AudiobookTimelineListState extends State<AudiobookTimelineList> {
  late final ScrollController _scrollController = ScrollController();
  double _viewportHeight = 300.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AudiobookTimelineList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tvFocusedIndex != oldWidget.tvFocusedIndex) {
      _scrollToFocused();
    }
  }

  void _scrollToFocused() {
    if (!_scrollController.hasClients) return;
    if (widget.tvFocusedIndex == -1) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
      return;
    }
    final double itemHeight = _dense ? _denseRowPitch : 56.0;
    final double target = widget.tvFocusedIndex * itemHeight;
    final double currentScroll = _scrollController.offset;
    
    if (target < currentScroll) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    } else if (target + itemHeight > currentScroll + _viewportHeight) {
      _scrollController.animateTo(
        target + itemHeight - _viewportHeight,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.events.isEmpty) {
      return _EmptyState(text: AppLocalizations.of(context).audiobookTimelineEmpty);
    }
    final apple = PlatformDetection.isApple;
    return Column(
      children: [
        if (!PlatformDetection.isTV && widget.onExport != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: widget.onExport,
                  icon: Icon(apple ? CupertinoIcons.square_arrow_down : Icons.download, size: 16),
                  label: Text(AppLocalizations.of(context).audiobookExportAll, style: const TextStyle(fontSize: 12)),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColorScheme.accent,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              _viewportHeight = constraints.maxHeight;
              return ListView.builder(
                controller: _scrollController,
                itemCount: widget.events.length,
                itemBuilder: (context, index) {
                  final e = widget.events[index];
                  final isTvFocused = index == widget.tvFocusedIndex;
                  final isPlayFocused = isTvFocused && widget.tvSubIndex == 0;
                  
                  final showEdit = e.type == TimelineEventType.note;
                  final showDelete = e.type == TimelineEventType.note || e.type == TimelineEventType.bookmark;
                  
                  final isEditFocused = isTvFocused && widget.tvSubIndex == 1 && showEdit;
                  final isDeleteFocused = isTvFocused && 
                      ((e.type == TimelineEventType.note && widget.tvSubIndex == 2) || 
                       (e.type == TimelineEventType.bookmark && widget.tvSubIndex == 1));

                  Color iconColor = AppColorScheme.accent;
                  IconData icon = Icons.bookmark_border;
                  if (e.type == TimelineEventType.bookmark) {
                    icon = apple ? CupertinoIcons.bookmark_fill : Icons.bookmark;
                    iconColor = Colors.orange;
                  } else if (e.type == TimelineEventType.note) {
                    icon = apple ? CupertinoIcons.chat_bubble_text : Icons.note_alt;
                    iconColor = AppColorScheme.accent;
                  } else if (e.type == TimelineEventType.chapter) {
                    icon = Icons.menu_open;
                    iconColor = Colors.teal;
                  }

                  if (_dense) {
                    return _DenseRow(
                      focused: isTvFocused,
                      highlighted: isPlayFocused,
                      title: e.title,
                      trailingText: formatAudiobookClock(
                          Duration(milliseconds: e.positionMs)),
                      onTap: () => widget.onJump(e),
                      leading: _denseIcon(icon, iconColor, focused: isPlayFocused),
                      actions: [
                        if (showEdit)
                          _denseAction(
                            icon: apple
                                ? CupertinoIcons.pencil
                                : Icons.edit_outlined,
                            focused: isEditFocused,
                            onPressed: () => widget
                                .onEditNote(e.originalObject as AudiobookNote),
                          ),
                        if (showDelete)
                          _denseAction(
                            icon: apple
                                ? CupertinoIcons.delete
                                : Icons.delete_outline,
                            focused: isDeleteFocused,
                            onPressed: () {
                              if (e.type == TimelineEventType.note) {
                                widget.onDeleteNote(
                                    e.originalObject as AudiobookNote);
                              } else {
                                widget.onDeleteBookmark(
                                    e.originalObject as AudiobookBookmark);
                              }
                            },
                          ),
                      ],
                    );
                  }

                  return Container(
                    height: 52.0,
                    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isTvFocused ? AppColorScheme.accent : Colors.transparent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      tileColor: isPlayFocused ? AppColorScheme.accent.withValues(alpha: 0.12) : null,
                      leading: Container(
                        decoration: BoxDecoration(
                          color: isPlayFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isPlayFocused ? Colors.white : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          icon,
                          color: isPlayFocused ? Colors.white : iconColor,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        e.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isPlayFocused ? Colors.white : null,
                          fontWeight: isPlayFocused ? FontWeight.w700 : null,
                          fontSize: 13,
                        ),
                      ),
                      subtitle: Text(
                        '${formatAudiobookClock(Duration(milliseconds: e.positionMs))}'
                        '${e.date.millisecondsSinceEpoch > 0 ? ' • ${e.date.toLocal().toString().split('.').first}' : ''}',
                        style: TextStyle(
                          fontSize: 11,
                          color: isPlayFocused ? Colors.white.withValues(alpha: 0.7) : AppColorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                      trailing: (showEdit || showDelete)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (showEdit) ...[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isEditFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isEditFocused ? Colors.white : Colors.transparent,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        apple ? CupertinoIcons.pencil : Icons.edit_outlined,
                                        size: 20,
                                        color: isEditFocused ? Colors.white : null,
                                      ),
                                      onPressed: () => widget.onEditNote(e.originalObject as AudiobookNote),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                                if (showDelete) ...[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isDeleteFocused ? AppColorScheme.accent.withValues(alpha: 0.2) : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isDeleteFocused ? Colors.white : Colors.transparent,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        apple ? CupertinoIcons.delete : Icons.delete_outline,
                                        size: 20,
                                        color: isDeleteFocused ? Colors.white : null,
                                      ),
                                      onPressed: () {
                                        if (e.type == TimelineEventType.note) {
                                          widget.onDeleteNote(e.originalObject as AudiobookNote);
                                        } else {
                                          widget.onDeleteBookmark(e.originalObject as AudiobookBookmark);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ],
                            )
                          : null,
                      onTap: () => widget.onJump(e),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class AudiobookQueueList extends StatefulWidget {
  const AudiobookQueueList({
    super.key,
    required this.queue,
    required this.onPlay,
    required this.tvFocusedIndex,
  });

  final QueueService queue;
  final ValueChanged<int> onPlay;
  final int tvFocusedIndex;

  @override
  State<AudiobookQueueList> createState() => _AudiobookQueueListState();
}

class _AudiobookQueueListState extends State<AudiobookQueueList> {
  late final ScrollController _scrollController = ScrollController();
  double _viewportHeight = 300.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AudiobookQueueList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tvFocusedIndex != oldWidget.tvFocusedIndex) {
      _scrollToFocused();
    }
  }

  void _scrollToFocused() {
    if (!_scrollController.hasClients) return;
    if (widget.tvFocusedIndex == -1) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
      return;
    }
    final double itemHeight = _dense ? _denseRowPitch : 34.0;
    final double target = widget.tvFocusedIndex * itemHeight;
    final double currentScroll = _scrollController.offset;
    
    if (target < currentScroll) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    } else if (target + itemHeight > currentScroll + _viewportHeight) {
      _scrollController.animateTo(
        target + itemHeight - _viewportHeight,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.queue.items;
    final current = widget.queue.currentIndex;
    if (items.isEmpty) {
      return _EmptyState(text: AppLocalizations.of(context).queueIsEmpty);
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewportHeight = constraints.maxHeight;
        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final raw = items[index];
            final item = raw is AggregatedItem ? raw : null;
            final isCurrent = index == current;
            final isTvFocused = index == widget.tvFocusedIndex;
            final titleText = item?.name ?? AppLocalizations.of(context).trackNumber(index + 1);

            // The playing track is marked by its accent title only. A filled
            // background competes with the focus rectangle.
            if (_dense) {
              return _DenseRow(
                focused: isTvFocused,
                title: titleText,
                bold: isCurrent,
                titleColor: isCurrent ? AppColorScheme.accent : null,
                onTap: () => widget.onPlay(index),
                leading: SizedBox(
                  width: 22,
                  child: Text(
                    '${index + 1}.',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFeatures: const [FontFeature.tabularFigures()],
                      fontSize: 11,
                      fontWeight: isCurrent ? FontWeight.bold : null,
                      color: isCurrent
                          ? AppColorScheme.accent
                          : AppColorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              );
            }

            return InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: () => widget.onPlay(index),
              child: Container(
                height: 34.0,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                color: isCurrent
                    ? AppColorScheme.accent.withValues(alpha: 0.08)
                    : Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        '${index + 1}.',
                        style: TextStyle(
                          color: isCurrent
                              ? AppColorScheme.accent
                              : AppColorScheme.onSurface.withValues(alpha: 0.5),
                          fontWeight: isCurrent ? FontWeight.bold : null,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        titleText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isCurrent
                              ? AppColorScheme.accent
                              : AppColorScheme.onSurface,
                          fontWeight: isCurrent ? FontWeight.bold : null,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: AppColorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
