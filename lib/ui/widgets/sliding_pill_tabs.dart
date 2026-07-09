import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../util/focus/dpad_keys.dart';
import '../../util/idiom/glass_capability.dart';
import 'focus/glass_focus_halo.dart';

class SlidingPillTabs extends StatefulWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final FocusNode? focusNode;

  /// Up/down D-pad from the pill; return true when handled.
  final bool Function(bool isUp)? onVerticalNavigation;

  /// Left D-pad from the first segment; e.g. hop to the sidebar.
  final VoidCallback? onExitLeft;

  const SlidingPillTabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.focusNode,
    this.onVerticalNavigation,
    this.onExitLeft,
  });

  @override
  State<SlidingPillTabs> createState() => _SlidingPillTabsState();
}

class _SlidingPillTabsState extends State<SlidingPillTabs> {
  FocusNode? _ownedNode;
  FocusNode get _node =>
      widget.focusNode ??
      (_ownedNode ??= FocusNode(debugLabel: 'SlidingPillTabs'));

  List<GlobalKey> _segmentKeys = const [];
  List<double> _widths = const [];
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _rebuildKeys();
    _scheduleMeasure();
  }

  @override
  void didUpdateWidget(covariant SlidingPillTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.labels.length != widget.labels.length) {
      // Segment count changed, so the keys and measured widths are stale.
      _rebuildKeys();
      _widths = const [];
    }
    if (!listEquals(oldWidget.labels, widget.labels)) {
      // Text (and thus width) may have changed even at the same count.
      _scheduleMeasure();
    }
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _scheduleEnsureVisible();
    }
  }

  @override
  void dispose() {
    _ownedNode?.dispose();
    super.dispose();
  }

  void _rebuildKeys() {
    _segmentKeys = [for (var i = 0; i < widget.labels.length; i++) GlobalKey()];
  }

  void _scheduleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  void _measure() {
    if (!mounted) return;
    final widths = <double>[];
    for (final key in _segmentKeys) {
      final box = key.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) {
        // Not laid out yet on the frame this was scheduled from; retry next.
        _scheduleMeasure();
        return;
      }
      widths.add(box.size.width);
    }
    if (widths.isEmpty || listEquals(widths, _widths)) return;
    setState(() => _widths = widths);
  }

  void _scheduleEnsureVisible() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final ctx = _selectedKey?.currentContext;
      if (ctx == null) return;
      Scrollable.ensureVisible(
        ctx,
        alignment: 0.5,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  GlobalKey? get _selectedKey {
    final i = widget.selectedIndex;
    return (i >= 0 && i < _segmentKeys.length) ? _segmentKeys[i] : null;
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    final index = widget.selectedIndex;
    if (key.isLeftKey) {
      if (index > 0) {
        widget.onChanged(index - 1);
      } else if (widget.onExitLeft != null) {
        widget.onExitLeft!();
      }
      return KeyEventResult.handled;
    }
    if (key.isRightKey) {
      if (index < widget.labels.length - 1) widget.onChanged(index + 1);
      return KeyEventResult.handled;
    }
    if (event is KeyDownEvent && (key.isUpKey || key.isDownKey)) {
      final handled = widget.onVerticalNavigation?.call(key.isUpKey) ?? false;
      return handled ? KeyEventResult.handled : KeyEventResult.ignored;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final glass = GlassCapability.glassLookActive;
    final onSurface = AppColorScheme.onSurface;
    final accent = AppColorScheme.accent;
    final selectedIndex = widget.selectedIndex;

    final thumbColor = glass ? onSurface.withValues(alpha: 0.22) : accent;
    final selectedTextColor = glass ? onSurface : AppColorScheme.onAccent;

    // The thumb only renders once segments are measured, so its first frame is
    // already at the right geometry; later selection changes animate from there.
    final hasThumb = selectedIndex >= 0 && selectedIndex < _widths.length;
    var thumbLeft = 0.0;
    for (var i = 0; i < selectedIndex && i < _widths.length; i++) {
      thumbLeft += _widths[i];
    }

    final stack = Stack(
      children: [
        if (hasThumb)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            top: 0,
            bottom: 0,
            left: thumbLeft,
            width: _widths[selectedIndex],
            child: Container(
              decoration: BoxDecoration(
                color: thumbColor,
                borderRadius: AppRadius.circular(999),
                border: glass
                    ? Border.all(
                        color: onSurface.withValues(alpha: 0.25),
                        width: 0.5,
                      )
                    : null,
              ),
            ),
          ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < widget.labels.length; i++)
              GestureDetector(
                key: _segmentKeys[i],
                behavior: HitTestBehavior.opaque,
                onTap: () => widget.onChanged(i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  child: Text(
                    widget.labels[i],
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: i == selectedIndex
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: i == selectedIndex
                          ? selectedTextColor
                          : onSurface.withValues(alpha: 0.75),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );

    final pane = glassPane(
      tier: glass ? GlassSettings.tier : GlassTier.solid,
      fallbackColor: onSurface.withValues(alpha: 0.08),
      cornerRadius: 999,
      sigma: 12,
      context: context,
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        height: 34,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: stack,
        ),
      ),
    );

    return Focus(
      focusNode: _node,
      onKeyEvent: _onKeyEvent,
      onFocusChange: (has) => setState(() => _focused = has),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final framed = GlassFocusHalo(
            focused: _focused,
            scale: 1.0,
            borderRadius: BorderRadius.circular(999),
            child: pane,
          );
          // Hug the content when it fits; cap at the available width and let the
          // segments scroll inside when it overflows. The 6px accounts for the
          // pane's all(3) padding.
          final available = constraints.maxWidth;
          if (_widths.isEmpty || !available.isFinite) return framed;
          final content = _widths.fold<double>(0, (sum, w) => sum + w) + 6;
          final pillWidth = content < available ? content : available;
          return Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(width: pillWidth, child: framed),
          );
        },
      ),
    );
  }
}
