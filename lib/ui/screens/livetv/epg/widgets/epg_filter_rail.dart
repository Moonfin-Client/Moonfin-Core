import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/adaptive/adaptive_glass.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';

/// Horizontal genre filter rail. Focusable pill chips (full d-pad on every
/// platform); on Apple the chips sit inside a frosted segmented-style container
/// with a light selected capsule, on Material they are standalone accent pills.
/// The rail scrolls horizontally so the list can grow past the available width,
/// scrolling the focused chip into view and fading whichever edge is clipped.
class EpgFilterRail extends StatefulWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final bool apple;
  final FocusNode Function(int index) focusNodeFor;
  final VoidCallback? onNavigateDown;

  const EpgFilterRail({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    required this.apple,
    required this.focusNodeFor,
    this.onNavigateDown,
  });

  @override
  State<EpgFilterRail> createState() => _EpgFilterRailState();
}

class _EpgFilterRailState extends State<EpgFilterRail> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _chipKeys = {};
  final Map<FocusNode, VoidCallback> _focusListeners = {};
  bool _clippedStart = false;
  bool _clippedEnd = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateClippedEdges);
    _attachFocusListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateClippedEdges());
  }

  @override
  void didUpdateWidget(EpgFilterRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.labels.length != widget.labels.length ||
        oldWidget.focusNodeFor != widget.focusNodeFor) {
      _detachFocusListeners();
      _attachFocusListeners();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateClippedEdges());
  }

  @override
  void dispose() {
    _detachFocusListeners();
    _scrollController.dispose();
    super.dispose();
  }

  void _attachFocusListeners() {
    for (var i = 0; i < widget.labels.length; i++) {
      final index = i;
      final node = widget.focusNodeFor(index);
      void listener() {
        if (node.hasFocus) _revealChip(index);
      }

      node.addListener(listener);
      _focusListeners[node] = listener;
    }
  }

  void _detachFocusListeners() {
    for (final entry in _focusListeners.entries) {
      entry.key.removeListener(entry.value);
    }
    _focusListeners.clear();
  }

  GlobalKey _chipKey(int index) =>
      _chipKeys.putIfAbsent(index, () => GlobalKey());

  // Scroll after the frame: focus can change mid-build, and scrolling then
  // would fire during layout.
  void _revealChip(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final chipContext = _chipKeys[index]?.currentContext;
      if (chipContext == null) return;
      Scrollable.ensureVisible(
        chipContext,
        alignment: 0.5,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
      );
    });
  }

  void _updateClippedEdges() {
    if (!mounted || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    final start = position.pixels > position.minScrollExtent + 1;
    final end = position.pixels < position.maxScrollExtent - 1;
    if (start != _clippedStart || end != _clippedEnd) {
      setState(() {
        _clippedStart = start;
        _clippedEnd = end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final last = widget.labels.length - 1;
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < widget.labels.length; i++)
          Padding(
            key: _chipKey(i),
            padding: EdgeInsets.only(right: widget.apple ? 2 : 8),
            child: FocusableWrapper(
              focusNode: widget.focusNodeFor(i),
              disableScale: true,
              useBackgroundFocus: true,
              borderRadius: 14,
              onSelect: () => widget.onSelect(i),
              // A null handler at either end leaves the key to the default
              // traversal instead of trapping focus in the rail.
              onNavigateLeft: i > 0
                  ? () => widget.focusNodeFor(i - 1).requestFocus()
                  : null,
              onNavigateRight: i < last
                  ? () => widget.focusNodeFor(i + 1).requestFocus()
                  : null,
              onNavigateDown: widget.onNavigateDown,
              // Rebuild the chip on focus change so the focused-but-unselected
              // pill can show an accent border.
              child: ListenableBuilder(
                listenable: widget.focusNodeFor(i),
                builder: (context, _) =>
                    _chip(context, i, widget.focusNodeFor(i).hasFocus),
              ),
            ),
          ),
      ],
    );

    final scroller = SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: widget.apple
          ? adaptiveGlass(
              context: context,
              cornerRadius: 15,
              blur: 14,
              fallbackColor: AppColorScheme.surface.withValues(alpha: 0.35),
              tint: Colors.white.withValues(alpha: 0.06),
              child: Padding(padding: const EdgeInsets.all(3), child: row),
            )
          : row,
    );

    // The mask stays in the tree in every state so toggling a fade does not
    // rebuild the scroll view and drop its offset.
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          _clippedStart ? Colors.transparent : Colors.white,
          Colors.white,
          Colors.white,
          _clippedEnd ? Colors.transparent : Colors.white,
        ],
        stops: const [0.0, 0.06, 0.94, 1.0],
      ).createShader(Offset.zero & bounds.size),
      child: scroller,
    );
  }

  Widget _chip(BuildContext context, int i, bool focused) {
    final selected = i == widget.selectedIndex;
    final textTheme = Theme.of(context).textTheme;
    final apple = widget.apple;
    final Color bg;
    final Color fg;
    if (selected) {
      bg = apple ? const Color(0xFFF4F8FC) : AppColorScheme.accent;
      fg = const Color(0xFF10242E);
    } else {
      bg = apple
          ? Colors.transparent
          : AppColorScheme.surface.withValues(alpha: 0.55);
      fg = AppColorScheme.onSurface.withValues(alpha: 0.85);
    }
    // A constant-width border avoids layout shift: accent when focused-but-not-
    // selected, faint on Material's idle pills, otherwise transparent.
    final Color borderColor;
    if (focused && !selected) {
      borderColor = AppColorScheme.accent;
    } else if (!apple && !selected) {
      borderColor = AppColorScheme.onSurface.withValues(alpha: 0.12);
    } else {
      borderColor = Colors.transparent;
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.circular(13),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Text(
        widget.labels[i],
        style: textTheme.labelLarge?.copyWith(
          color: fg,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}
