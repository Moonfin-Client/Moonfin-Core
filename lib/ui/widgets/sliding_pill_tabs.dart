import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../util/focus/dpad_keys.dart';
import '../../util/idiom/glass_capability.dart';
import 'focus/glass_focus_halo.dart';

/// Release velocity, in track widths per second, beyond which the pill flicks
/// to the next segment even if it hasn't crossed the halfway point.
const _kFlickVelocity = 0.5;

/// How far ahead, in seconds, a release projects the pill along its velocity.
const _kFlickProjection = 0.3;

/// Pixels per second to the indicator's own velocity units, where its stretch
/// saturates at 10.
const _kJellyVelocityDivisor = 150.0;

/// Past this many pixels from its rest slot the pill counts as travelling and
/// lifts into glass.
const _kTravelThreshold = 4.0;

/// Padding between the pane edge and the segments, which doubles as the room
/// a pressed pill has to swell into.
const _kPanePadding = 5.0;

/// How long the pill takes to settle onto a segment and to reshape its width.
const _kSettleDuration = Duration(milliseconds: 350);

/// Slightly quicker, so the pill reads as glass before it stops moving.
const _kLiftDuration = Duration(milliseconds: 300);

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

  /// Where the pill rests. Follows selectedIndex, but a drag release moves it
  /// first so the pill lands on the segment the finger chose instead of
  /// springing back to the old one until the parent catches up.
  int _restIndex = 0;
  bool _down = false;
  bool _dragging = false;
  double _dragLeft = 0;
  int _dragIndex = 0;

  @override
  void initState() {
    super.initState();
    _restIndex = widget.selectedIndex;
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
      _restIndex = widget.selectedIndex;
    }
    if (!listEquals(oldWidget.labels, widget.labels)) {
      // Text (and thus width) may have changed even at the same count.
      _scheduleMeasure();
    }
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _restIndex = widget.selectedIndex;
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

  double get _trackWidth => _widths.fold<double>(0, (sum, w) => sum + w);

  double _leftOf(int index) {
    var left = 0.0;
    for (var i = 0; i < index && i < _widths.length; i++) {
      left += _widths[i];
    }
    return left;
  }

  int _indexAt(double x) {
    var right = 0.0;
    for (var i = 0; i < _widths.length; i++) {
      right += _widths[i];
      if (x < right) return i;
    }
    return _widths.length - 1;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final x = details.localPosition.dx;
    final index = _indexAt(x);
    final width = _widths[index];
    setState(() {
      _dragging = true;
      _dragIndex = index;
      _dragLeft = (x - width / 2).clamp(0.0, _trackWidth - width);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    final track = _trackWidth;
    final centre = _dragLeft + _widths[_dragIndex] / 2;
    final velocity =
        track > 0 ? details.velocity.pixelsPerSecond.dx / track : 0.0;
    final current = _indexAt(centre);
    var target = current;
    if (velocity.abs() > _kFlickVelocity) {
      final projected =
          (centre + velocity * track * _kFlickProjection).clamp(0.0, track);
      target = _indexAt(projected);
      // A flick always moves at least one segment in its direction.
      final last = _widths.length - 1;
      if (velocity > 0 && target <= current) {
        target = (current + 1).clamp(0, last);
      } else if (velocity < 0 && target >= current) {
        target = (current - 1).clamp(0, last);
      }
    }
    _settle(target);
  }

  void _onDragCancel() {
    if (!_dragging) return;
    _settle(_indexAt(_dragLeft + _widths[_dragIndex] / 2));
  }

  void _settle(int target) {
    setState(() {
      _dragging = false;
      _down = false;
      _restIndex = target;
    });
    if (target != widget.selectedIndex) widget.onChanged(target);
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    final index = widget.selectedIndex;
    if (key.isLeftKey || key.isRightKey) {
      final isRtl = Directionality.of(context) == TextDirection.rtl;
      final movesToNextIndex = key.isRightKey != isRtl;
      if (movesToNextIndex) {
        if (index < widget.labels.length - 1) {
          widget.onChanged(index + 1);
        } else if (isRtl && widget.onExitLeft != null) {
          widget.onExitLeft!();
        }
      } else {
        if (index > 0) {
          widget.onChanged(index - 1);
        } else if (!isRtl && widget.onExitLeft != null) {
          widget.onExitLeft!();
        }
      }
      return KeyEventResult.handled;
    }
    if (event is KeyDownEvent && (key.isUpKey || key.isDownKey)) {
      final handled = widget.onVerticalNavigation?.call(key.isUpKey) ?? false;
      return handled ? KeyEventResult.handled : KeyEventResult.ignored;
    }
    return KeyEventResult.ignored;
  }

  /// The package's jelly pill: it follows a drag, stretches with its velocity
  /// and lifts into glass while pressed or travelling. [labels] is passed
  /// through as the builders' child so the Row isn't rebuilt on every spring
  /// tick.
  Widget _jellyThumb({
    required Widget labels,
    required Color color,
    required double targetLeft,
    required double targetWidth,
  }) {
    return VelocitySpringBuilder(
      value: targetLeft,
      active: _dragging,
      springWhenActive: GlassSpring.interactive(),
      springWhenReleased: GlassSpring.snappy(duration: _kSettleDuration),
      child: labels,
      builder: (context, left, velocity, labels) {
        final travelling = (left - targetLeft).abs() > _kTravelThreshold;
        return SpringBuilder(
          value: _down || travelling ? 1.0 : 0.0,
          spring: GlassSpring.snappy(duration: _kLiftDuration),
          child: labels,
          builder: (context, thickness, labels) => SpringBuilder(
            value: targetWidth,
            spring: GlassSpring.snappy(duration: _kSettleDuration),
            child: labels,
            builder: (context, width, labels) => Stack(
              // The swell reaches past the pill's slot, so a clipping Stack
              // would throw it away.
              clipBehavior: Clip.none,
              children: [
                AnimatedGlassIndicator(
                  velocity: velocity / _kJellyVelocityDivisor,
                  itemCount: widget.labels.length,
                  alignment: Alignment.center,
                  thickness: thickness,
                  quality: GlassSettings.packageQuality,
                  indicatorColor: color,
                  isBackgroundIndicator: false,
                  exactOffset: left,
                  exactWidth: width,
                  // Vertical is bounded by the pane's padding, since the pane
                  // clips and a taller swell would just be cut off. Horizontal
                  // has the whole strip to grow into.
                  expansion: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: _kPanePadding,
                  ),
                ),
                labels!,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final glass = GlassCapability.glassLookActive;
    final jelly = glass && GlassSettings.usePackageRenderer;
    final onSurface = AppColorScheme.onSurface;
    final accent = AppColorScheme.accent;
    final selectedIndex = widget.selectedIndex;

    final thumbColor = glass ? onSurface.withValues(alpha: 0.22) : accent;
    final selectedTextColor = glass ? onSurface : AppColorScheme.onAccent;

    // The thumb only renders once segments are measured, so its first frame is
    // already at the right geometry. Later selection changes animate from
    // there.
    final hasThumb = _restIndex >= 0 && _restIndex < _widths.length;

    final labels = Row(
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
    );

    return Focus(
      focusNode: _node,
      onKeyEvent: _onKeyEvent,
      onFocusChange: (has) => setState(() => _focused = has),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final available = constraints.maxWidth;
          final measured = _widths.isNotEmpty && available.isFinite;
          final content = _trackWidth + _kPanePadding * 2;
          // Unmeasured counts as not fitting, so the first frames clip rather
          // than risk painting segments outside the pane.
          final fits = measured && content <= available;

          Widget stack;
          if (hasThumb && jelly) {
            final targetLeft = _dragging ? _dragLeft : _leftOf(_restIndex);
            final targetWidth =
                _dragging ? _widths[_dragIndex] : _widths[_restIndex];
            stack = _jellyThumb(
              labels: labels,
              color: thumbColor,
              targetLeft: targetLeft,
              targetWidth: targetWidth,
            );
            // A pill that overflows keeps its strip scrollable instead, since
            // a drag can only mean one of the two.
            if (fits) {
              stack = Listener(
                onPointerDown: (_) => setState(() => _down = true),
                onPointerUp: (_) {
                  if (!_dragging) setState(() => _down = false);
                },
                onPointerCancel: (_) {
                  if (!_dragging) setState(() => _down = false);
                },
                child: GestureDetector(
                  onHorizontalDragUpdate: _onDragUpdate,
                  onHorizontalDragEnd: _onDragEnd,
                  onHorizontalDragCancel: _onDragCancel,
                  child: stack,
                ),
              );
            }
          } else {
            stack = Stack(
              children: [
                if (hasThumb)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutCubic,
                    top: 0,
                    bottom: 0,
                    left: _leftOf(_restIndex),
                    width: _widths[_restIndex],
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
                labels,
              ],
            );
          }

          final pane = glassPane(
            tier: glass ? GlassSettings.tier : GlassTier.solid,
            fallbackColor: onSurface.withValues(alpha: 0.08),
            cornerRadius: 999,
            sigma: 12,
            context: context,
            padding: const EdgeInsets.all(_kPanePadding),
            child: SizedBox(
              height: 34,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // Only clip when there is something scrolled out of view to
                // clip. Otherwise it would cut the swell off at the segments.
                clipBehavior: fits ? Clip.none : Clip.hardEdge,
                child: stack,
              ),
            ),
          );

          final framed = GlassFocusHalo(
            focused: _focused,
            scale: 1.0,
            // A press belongs to the segment under the finger, not the whole
            // strip. The jelly thumb gives that response itself.
            pressGrowth: 0,
            borderRadius: BorderRadius.circular(999),
            child: pane,
          );
          if (!measured) return framed;
          // Hug the content when it fits, otherwise cap at the available width
          // and let the segments scroll inside.
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
