import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../util/platform_detection.dart';
import '../../../../../util/idiom/glass_capability.dart';
import '../../../../widgets/focus/glass_focus_halo.dart';

/// Focusable, d-pad friendly tab bar: tabs select on press, left/right move
/// focus between tabs, and left from the first tab calls [onExitLeft].
///
/// Three looks: the default is clean text with an underline under the active
/// tab; [segmented] wraps the tabs in a single rounded surface with the active
/// tab filled; [pill] is the glass sliding-thumb look from the search screen,
/// with a single thumb that tracks the selected tab. Every look keeps the same
/// per-tab focus model, so d-pad navigation is identical across them.
class DetailsTabBar extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final FocusNode Function(int index) focusNodeFor;
  final VoidCallback? onExitLeft;
  final VoidCallback? onExitUp;
  final void Function(int index)? onNavigateDown;
  final bool segmented;
  // Glass sliding-thumb look from the search screen. Takes priority over
  // [segmented] when both are set.
  final bool pill;
  // Wrap the segments onto multiple rows instead of scrolling horizontally.
  // Intended for touch layouts where every tab should stay visible.
  final bool wrap;

  const DetailsTabBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    required this.focusNodeFor,
    this.onExitLeft,
    this.onExitUp,
    this.onNavigateDown,
    this.segmented = false,
    this.pill = false,
    this.wrap = false,
  });

  _DetailsTabItem _buildTabItem(int i, {Key? key}) => _DetailsTabItem(
        key: key,
        label: labels[i],
        isSelected: selectedIndex == i,
        segmented: segmented,
        pill: pill,
        focusNode: focusNodeFor(i),
        onSelect: () => onSelect(i),
        onNavigateDown:
            onNavigateDown != null ? () => onNavigateDown!(i) : null,
        onNavigateUp: onExitUp,
        onNavigateLeft: () {
          if (i > 0) {
            focusNodeFor(i - 1).requestFocus();
            return true;
          }
          if (onExitLeft != null) {
            onExitLeft!();
            return true;
          }
          return false;
        },
        onNavigateRight: () {
          if (i < labels.length - 1) {
            focusNodeFor(i + 1).requestFocus();
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    if (pill) return _PillTabBar(this);

    _DetailsTabItem item(int i) => _buildTabItem(i);

    if (segmented) {
      final container = Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColorScheme.surface.withValues(alpha: 0.55),
          borderRadius: AppRadius.circular(12),
        ),
        child: wrap
            ? Wrap(
                spacing: 3,
                runSpacing: 3,
                children: [for (var i = 0; i < labels.length; i++) item(i)],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [for (var i = 0; i < labels.length; i++) item(i)],
              ),
      );
      if (wrap) return container;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: container,
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < labels.length; i++)
              Padding(
                padding: EdgeInsets.only(
                  right: i < labels.length - 1 ? 20 : 0,
                ),
                child: item(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _DetailsTabItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final bool segmented;
  final bool pill;
  final FocusNode focusNode;
  final VoidCallback onSelect;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateUp;
  // True if the left key was consumed; false to let focus traversal handle it.
  final bool Function() onNavigateLeft;
  final VoidCallback onNavigateRight;

  const _DetailsTabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.segmented,
    this.pill = false,
    required this.focusNode,
    required this.onSelect,
    this.onNavigateDown,
    this.onNavigateUp,
    required this.onNavigateLeft,
    required this.onNavigateRight,
  });

  @override
  State<_DetailsTabItem> createState() => _DetailsTabItemState();
}

class _DetailsTabItemState extends State<_DetailsTabItem> {
  bool _isFocused = false;

  Color get _focusColor {
    final activeTheme = ThemeRegistry.active;
    if (activeTheme.id == ThemeRegistry.neonPulseId) {
      return const Color(0xFF00E5FF);
    }
    if (activeTheme.id == ThemeRegistry.moonfinId) {
      return Colors.white;
    }
    return Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant _DetailsTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocusChanged);
      widget.focusNode.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    if (mounted) {
      setState(() {
        _isFocused = widget.focusNode.hasFocus;
      });
    }
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    final isDownOrRepeat = event is KeyDownEvent || event is KeyRepeatEvent;

    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      if (isDownOrRepeat && widget.onNavigateDown != null) {
        widget.onNavigateDown!();
      }
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      if (isDownOrRepeat && widget.onNavigateUp != null) {
        widget.onNavigateUp!();
      }
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (isDownOrRepeat) {
        final handled = widget.onNavigateLeft();
        return handled ? KeyEventResult.handled : KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      if (isDownOrRepeat) {
        widget.onNavigateRight();
      }
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      // Activate on press only so holding select does not reselect on repeat.
      if (event is KeyDownEvent) {
        widget.onSelect();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pill) return _buildPill(context);
    if (widget.segmented) return _buildSegmented(context);

    final textTheme = Theme.of(context).textTheme;
    final accent = AppColorScheme.accent;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.7);

    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: _onKeyEvent,
      child: GestureDetector(
        onTap: widget.onSelect,
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppColorScheme.isPixel
                ? BorderRadius.zero
                : AppRadius.circular(8),
            // Border is ALWAYS present with a fixed width to eliminate visual judder!
            border: Border.all(
              color: _isFocused ? _focusColor : Colors.transparent,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: (widget.isSelected || _isFocused)
                        ? AppColorScheme.onSurface
                        : muted,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                // Underline is ALWAYS present, color is visible when selected or focused
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 3,
                  decoration: BoxDecoration(
                    color: (widget.isSelected || _isFocused)
                        ? accent
                        : Colors.transparent,
                    borderRadius: AppRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // One segment of the glass pill. The selected thumb is drawn behind the whole
  // row by _PillTabBar, so a segment only renders its label plus a focus halo.
  Widget _buildPill(BuildContext context) {
    final glass = GlassCapability.glassLookActive;
    final onSurface = AppColorScheme.onSurface;
    final selected = widget.isSelected;
    final selectedTextColor = glass ? onSurface : AppColorScheme.onAccent;

    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: _onKeyEvent,
      child: GestureDetector(
        onTap: widget.onSelect,
        behavior: HitTestBehavior.opaque,
        child: GlassFocusHalo(
          focused: _isFocused,
          scale: 1.0,
          borderRadius: AppColorScheme.isPixel
              ? BorderRadius.zero
              : BorderRadius.circular(999),
          backgroundColor: Colors.transparent,
          ringColor: _focusColor,
          child: SizedBox(
            height: 38,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppColorScheme.isPixel ? 12 : 15,
                ),
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppColorScheme.isPixel ? 11 : 13,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    color: selected
                        ? selectedTextColor
                        : onSurface.withValues(alpha: 0.75),
                    height: 1.4,
                    fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSegmented(BuildContext context) {
    final apple = PlatformDetection.isApple;
    final accent = AppColorScheme.accent;
    final selected = widget.isSelected;

    final Color bg;
    final Color fg;
    if (selected) {
      if (apple) {
        bg = accent.withValues(alpha: 0.18);
        fg = accent;
      } else {
        bg = accent;
        fg = AppColorScheme.onAccent;
      }
    } else {
      bg = Colors.transparent;
      fg = AppColorScheme.onSurface.withValues(alpha: 0.6);
    }

    final radius = AppColorScheme.isPixel ? BorderRadius.zero : AppRadius.circular(9);

    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: _onKeyEvent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: radius,
          border: _isFocused
              ? Border.all(color: apple ? accent : Colors.white, width: 2)
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: radius,
            splashColor: apple ? Colors.transparent : null,
            highlightColor: apple ? Colors.transparent : null,
            onTap: widget.onSelect,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: fg,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      height: 1.4,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Glass pill container for the [DetailsTabBar] pill look. It measures each
/// segment so a single thumb can slide behind the selected one, scrolls the
/// selection into view, and hugs its content up to the available width. The
/// segments stay individually focusable, so d-pad navigation is unchanged.
class _PillTabBar extends StatefulWidget {
  final DetailsTabBar config;

  const _PillTabBar(this.config);

  @override
  State<_PillTabBar> createState() => _PillTabBarState();
}

class _PillTabBarState extends State<_PillTabBar> {
  List<GlobalKey> _segmentKeys = const [];
  List<double> _widths = const [];

  DetailsTabBar get _config => widget.config;
  List<String> get _labels => _config.labels;

  @override
  void initState() {
    super.initState();
    _rebuildKeys();
    _scheduleMeasure();
  }

  @override
  void didUpdateWidget(covariant _PillTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldLabels = oldWidget.config.labels;
    if (oldLabels.length != _labels.length) {
      _rebuildKeys();
      _widths = const [];
    }
    if (!listEquals(oldLabels, _labels)) {
      _scheduleMeasure();
    }
    if (oldWidget.config.selectedIndex != _config.selectedIndex) {
      _scheduleEnsureVisible();
      _scheduleMeasure();
    }
  }

  void _rebuildKeys() {
    _segmentKeys = [for (var i = 0; i < _labels.length; i++) GlobalKey()];
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
        // Not laid out yet on this frame; retry on the next one.
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
      final i = _config.selectedIndex;
      if (i < 0 || i >= _segmentKeys.length) return;
      final ctx = _segmentKeys[i].currentContext;
      if (ctx == null) return;
      Scrollable.ensureVisible(
        ctx,
        alignment: 0.5,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final glass = GlassCapability.glassLookActive;
    final onSurface = AppColorScheme.onSurface;
    final accent = AppColorScheme.accent;
    final selectedIndex = _config.selectedIndex;
    final thumbColor = glass ? onSurface.withValues(alpha: 0.22) : accent;

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
                borderRadius: AppColorScheme.isPixel
                    ? BorderRadius.zero
                    : AppRadius.circular(999),
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
            for (var i = 0; i < _labels.length; i++)
              _config._buildTabItem(i, key: _segmentKeys[i]),
          ],
        ),
      ],
    );

    final pane = glassPane(
      tier: glass ? GlassSettings.tier : GlassTier.solid,
      fallbackColor: onSurface.withValues(alpha: 0.08),
      cornerRadius: AppColorScheme.isPixel ? 0 : 999,
      sigma: 12,
      context: context,
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        height: 38,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: stack,
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Hug the content when it fits, cap at the available width and let the
        // segments scroll inside when they overflow. The 6px accounts for the
        // pane's all(3) padding.
        final available = constraints.maxWidth;
        if (_widths.isEmpty || !available.isFinite) return pane;
        final content = _widths.fold<double>(0, (sum, w) => sum + w) + 16.0;
        final pillWidth = content < available ? content : available;
        return Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(width: pillWidth, child: pane),
        );
      },
    );
  }
}
