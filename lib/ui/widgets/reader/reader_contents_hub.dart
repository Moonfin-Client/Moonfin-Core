import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/reader_settings.dart';
import '../../../util/platform_detection.dart';

class ReaderHubEntry {
  final String title;
  final String? trailing;
  final int depth;
  final bool isCurrent;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const ReaderHubEntry({
    required this.title,
    required this.onTap,
    this.trailing,
    this.depth = 0,
    this.isCurrent = false,
    this.onDelete,
  });
}

Future<void> showReaderContentsHub({
  required BuildContext context,
  required Color accent,
  required ReaderThemeColors pageColors,
  required List<ReaderHubEntry> chapters,
  required List<ReaderHubEntry> bookmarks,
  required List<ReaderHubEntry> highlights,
  required bool isPlayed,
  required VoidCallback onToggleRead,
  required VoidCallback onReload,
  String? progressLabel,
  String? extraActionLabel,
  IconData? extraActionIcon,
  VoidCallback? onExtraAction,
}) {
  final surface = pageColors.isDark
      ? Color.alphaBlend(
          Colors.white.withValues(alpha: 0.06),
          pageColors.background,
        )
      : Color.alphaBlend(
          Colors.white.withValues(alpha: 0.7),
          pageColors.background,
        );

  final body = _ContentsHubBody(
    accent: accent,
    surface: surface,
    textColor: pageColors.foreground,
    chapters: chapters,
    bookmarks: bookmarks,
    highlights: highlights,
    isPlayed: isPlayed,
    onToggleRead: onToggleRead,
    onReload: onReload,
    progressLabel: progressLabel,
    extraActionLabel: extraActionLabel,
    extraActionIcon: extraActionIcon,
    onExtraAction: onExtraAction,
  );

  if (PlatformDetection.useDesktopUi) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Contents',
      barrierColor: const Color(0xB3000000),
      transitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (ctx, _, _) {
        final media = MediaQuery.of(ctx);
        final width = (media.size.width * 0.4).clamp(320.0, 460.0);
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: surface,
            child: SizedBox(
              width: width,
              height: media.size.height,
              child: SafeArea(child: body),
            ),
          ),
        );
      },
      transitionBuilder: (ctx, animation, _, child) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
        child: child,
      ),
    );
  }

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (ctx) => FractionallySizedBox(heightFactor: 0.85, child: body),
  );
}

enum _HubTab { chapters, bookmarks, highlights }

class _ContentsHubBody extends StatefulWidget {
  final Color accent;
  final Color surface;
  final Color textColor;
  final List<ReaderHubEntry> chapters;
  final List<ReaderHubEntry> bookmarks;
  final List<ReaderHubEntry> highlights;
  final bool isPlayed;
  final VoidCallback onToggleRead;
  final VoidCallback onReload;
  final String? progressLabel;
  final String? extraActionLabel;
  final IconData? extraActionIcon;
  final VoidCallback? onExtraAction;

  const _ContentsHubBody({
    required this.accent,
    required this.surface,
    required this.textColor,
    required this.chapters,
    required this.bookmarks,
    required this.highlights,
    required this.isPlayed,
    required this.onToggleRead,
    required this.onReload,
    this.progressLabel,
    this.extraActionLabel,
    this.extraActionIcon,
    this.onExtraAction,
  });

  @override
  State<_ContentsHubBody> createState() => _ContentsHubBodyState();
}

class _ContentsHubBodyState extends State<_ContentsHubBody> {
  _HubTab _tab = _HubTab.chapters;
  String _query = '';

  Color get _accent => widget.accent;
  Color get _text => widget.textColor;
  Color get _muted => widget.textColor.withValues(alpha: 0.6);
  Color get _fill => widget.textColor.withValues(alpha: 0.07);

  List<ReaderHubEntry> get _active => switch (_tab) {
    _HubTab.chapters => widget.chapters,
    _HubTab.bookmarks => widget.bookmarks,
    _HubTab.highlights => widget.highlights,
  };

  List<ReaderHubEntry> get _filtered {
    if (_query.trim().isEmpty) return _active;
    final q = _query.toLowerCase();
    return _active.where((e) => e.title.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              _tabChip('Chapters', _HubTab.chapters),
              const SizedBox(width: 8),
              _tabChip('Bookmarks', _HubTab.bookmarks),
              const SizedBox(width: 8),
              _tabChip('Highlights', _HubTab.highlights),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: TextField(
            onChanged: (v) => setState(() => _query = v),
            style: TextStyle(color: _text, fontSize: 14),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search',
              hintStyle: TextStyle(color: _muted),
              prefixIcon: Icon(Icons.search, color: _muted, size: 18),
              filled: true,
              fillColor: _fill,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                borderRadius: AppRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Flexible(child: _list()),
        _footer(),
      ],
    );
  }

  Widget _tabChip(String label, _HubTab tab) {
    final selected = _tab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _tab = tab),
        child: Container(
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? _accent : _fill,
            borderRadius: AppRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : _text,
              fontSize: 12.5,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _list() {
    final items = _filtered;
    if (items.isEmpty) {
      final msg = switch (_tab) {
        _HubTab.chapters => 'No table of contents available',
        _HubTab.bookmarks => 'No bookmarks yet',
        _HubTab.highlights => 'No highlights yet',
      };
      return Padding(
        padding: const EdgeInsets.all(28),
        child: Center(
          child: Text(msg, style: TextStyle(color: _muted)),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: items.length,
      itemBuilder: (context, i) {
        final e = items[i];
        return ListTile(
          dense: true,
          contentPadding: EdgeInsets.fromLTRB(12.0 + e.depth * 14, 0, 8, 0),
          title: Text(
            e.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: e.isCurrent ? _accent : _text,
              fontSize: 14,
              fontWeight: e.isCurrent ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          trailing: e.onDelete != null
              ? IconButton(
                  icon: Icon(Icons.delete_outline, color: _muted, size: 18),
                  onPressed: e.onDelete,
                )
              : (e.trailing != null
                    ? Text(
                        e.trailing!,
                        style: TextStyle(
                          color: e.isCurrent ? _accent : _muted,
                          fontSize: 12,
                        ),
                      )
                    : null),
          onTap: () {
            Navigator.of(context).maybePop();
            e.onTap();
          },
        );
      },
    );
  }

  Widget _footer() {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: _muted.withValues(alpha: 0.18)),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Row(
          children: [
            _footerAction(
              widget.isPlayed ? Icons.check_circle : Icons.check_circle_outline,
              widget.isPlayed ? 'Read' : 'Mark read',
              () {
                Navigator.of(context).maybePop();
                widget.onToggleRead();
              },
            ),
            const SizedBox(width: 18),
            _footerAction(Icons.refresh, 'Reload', () {
              Navigator.of(context).maybePop();
              widget.onReload();
            }),
            if (widget.onExtraAction != null) ...[
              const SizedBox(width: 18),
              _footerAction(
                widget.extraActionIcon ?? Icons.tune,
                widget.extraActionLabel ?? 'More',
                widget.onExtraAction!,
              ),
            ],
            const Spacer(),
            if (widget.progressLabel != null)
              Flexible(
                child: Text(
                  widget.progressLabel!,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: _muted, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _footerAction(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: _text),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: _text, fontSize: 12.5)),
        ],
      ),
    );
  }
}
