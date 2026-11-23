import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'nav_entry.dart';

class _SlotSpec {
  const _SlotSpec(this.dy, this.x, this.scale, this.opacity);

  final double dy;
  final double x;
  final double scale;
  final double opacity;
}

// Per distance from the focus window, in points of a 720 point tall screen.
const _tvSlots = [
  _SlotSpec(0, 40, 1, 1),
  _SlotSpec(74, 30, 0.72, 0.62),
  _SlotSpec(134, 22, 0.56, 0.36),
  _SlotSpec(182, 16, 0.46, 0.16),
];

const _phoneSlots = [
  _SlotSpec(0, 30, 1, 1),
  _SlotSpec(64, 24, 0.74, 0.62),
  _SlotSpec(116, 18, 0.6, 0.38),
  _SlotSpec(158, 14, 0.5, 0.2),
  _SlotSpec(192, 10, 0.42, 0.08),
];

class ReelSlot {
  const ReelSlot({
    required this.absolute,
    required this.entry,
    required this.distance,
    required this.dy,
    required this.x,
    required this.scale,
    required this.opacity,
  });

  /// The position on the endless wheel, which keys the entry's widget so it
  /// glides between slots as the wheel turns.
  final int absolute;

  /// The index into the entries, wrapped around.
  final int entry;
  final int distance;
  final double dy;
  final double x;
  final double scale;
  final double opacity;
}

/// Which entries show around the window and where. A short list shows fewer
/// slots so no entry appears twice.
List<ReelSlot> reelSlots(int center, int count, {bool phone = false}) {
  if (count <= 0) return const [];
  final table = phone ? _phoneSlots : _tvSlots;
  final reach = math.min(table.length - 1, (count - 1) ~/ 2);
  return [
    for (var d = -reach; d <= reach; d++)
      ReelSlot(
        absolute: center + d,
        entry: (center + d) % count,
        distance: d,
        dy: d.sign * table[d.abs()].dy,
        x: table[d.abs()].x,
        scale: table[d.abs()].scale,
        opacity: table[d.abs()].opacity,
      ),
  ];
}

/// The Reel sidebar. At rest it's the current section's icon on the left
/// edge, and open it's a wheel of destinations that turns through a fixed
/// focus window.
class ReelNav extends StatefulWidget {
  const ReelNav({
    super.key,
    required this.entries,
    required this.center,
    required this.open,
    required this.phone,
    required this.onOpen,
    required this.onClose,
    required this.onTurn,
    required this.onSelect,
    required this.openLabel,
    this.hint,
    this.onBack,
  });

  final List<NavEntry> entries;

  /// The entry in the window, on the endless wheel.
  final int center;
  final bool open;
  final bool phone;
  final VoidCallback onOpen;
  final VoidCallback onClose;
  final ValueChanged<int> onTurn;
  final VoidCallback onSelect;
  final String openLabel;
  final String? hint;

  /// Shown beside the phone menu pill on pages that can go back.
  final VoidCallback? onBack;

  @override
  State<ReelNav> createState() => _ReelNavState();
}

class _ReelNavState extends State<ReelNav> {
  double _drag = 0;
  DateTime _lastWheel = DateTime.fromMillisecondsSinceEpoch(0);

  static const _duration = Duration(milliseconds: 250);

  void _onWheel(PointerSignalEvent event) {
    if (event is! PointerScrollEvent || event.scrollDelta.dy == 0) return;
    final now = DateTime.now();
    if (now.difference(_lastWheel) < const Duration(milliseconds: 120)) return;
    _lastWheel = now;
    widget.onTurn(event.scrollDelta.dy > 0 ? 1 : -1);
  }

  void _onDrag(DragUpdateDetails details) {
    _drag += details.delta.dy;
    const step = 56.0;
    while (_drag <= -step) {
      _drag += step;
      widget.onTurn(1);
    }
    while (_drag >= step) {
      _drag -= step;
      widget.onTurn(-1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final s = navStyleScale(size, phone: widget.phone);
    return widget.open ? _buildOpen(size, s) : _buildRest(size, s);
  }

  Widget _buildRest(Size size, double s) {
    final entries = widget.entries;
    final current = entries.isEmpty
        ? null
        : entries[currentNavEntryIndex(entries)];
    if (widget.phone) {
      final top = MediaQuery.paddingOf(context).top;
      return Stack(
        children: [
          Positioned(
            top: top + 8,
            left: 8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Semantics(
                  button: true,
                  label: widget.openLabel,
                  child: GestureDetector(
                    onTap: widget.onOpen,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(10, 0, 9, 0),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (current != null) ...[
                            current.buildIcon(22, Colors.white),
                            const SizedBox(width: 7),
                            Text(
                              current.label,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                          Icon(
                            Icons.unfold_more_rounded,
                            size: 18,
                            color: Colors.white.withValues(alpha: 0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.onBack case final onBack?)
                  navPhoneBackButton(onBack),
              ],
            ),
          ),
        ],
      );
    }

    Widget dot(double alpha) => Container(
      width: 4 * s,
      height: 4 * s,
      margin: EdgeInsets.symmetric(vertical: 3.5 * s),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: alpha),
        shape: BoxShape.circle,
      ),
    );
    return SizedBox(
      width: 72 * s,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            left: 10 * s,
            top: 0,
            bottom: 0,
            width: 48 * s,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dot(0.18),
                dot(0.32),
                dot(0.5),
                Semantics(
                  button: true,
                  label: widget.openLabel,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: widget.onOpen,
                      child: Container(
                        width: 44 * s,
                        height: 44 * s,
                        margin: EdgeInsets.symmetric(vertical: 4 * s),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.14),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: current?.buildIcon(24 * s, Colors.white),
                      ),
                    ),
                  ),
                ),
                dot(0.5),
                dot(0.32),
                dot(0.18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpen(Size size, double s) {
    final phone = widget.phone;
    final entries = widget.entries;
    final windowY = phone ? size.height * 0.6 : size.height / 2;
    final accent = AppColorScheme.accent;
    final slots = reelSlots(widget.center, entries.length, phone: phone);
    final itemHeight = (phone ? 56.0 : 60.0) * s;
    final iconSize = (phone ? 30.0 : 34.0) * s;
    final fontSize = (phone ? 28.0 : 32.0) * s;
    final halfWindow = (phone ? 32.0 : 38.0) * s;
    final topInset = MediaQuery.paddingOf(context).top;

    final items = [
      for (final slot in slots)
        AnimatedPositioned(
          key: ValueKey(slot.absolute),
          duration: _duration,
          curve: Curves.easeOutCubic,
          left: slot.x * s,
          top: windowY + slot.dy * s - itemHeight / 2,
          height: itemHeight,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: slot.distance == 0
                ? widget.onSelect
                : () => widget.onTurn(slot.distance),
            child: AnimatedOpacity(
              duration: _duration,
              opacity: slot.opacity,
              child: AnimatedScale(
                duration: _duration,
                curve: Curves.easeOutCubic,
                scale: slot.scale,
                alignment: Alignment.centerLeft,
                child: _ReelItem(
                  entry: entries[slot.entry],
                  inWindow: slot.distance == 0,
                  iconSize: iconSize,
                  fontSize: fontSize,
                  accent: accent,
                ),
              ),
            ),
          ),
        ),
    ];

    Widget chevron(IconData icon, int delta, double top) => Positioned(
      left: 40 * s,
      top: top,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => widget.onTurn(delta),
          child: Icon(
            icon,
            size: 30 * s,
            color: Colors.white.withValues(alpha: 0.4),
          ),
        ),
      ),
    );

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerSignal: _onWheel,
        child: GestureDetector(
          onVerticalDragUpdate: _onDrag,
          onVerticalDragEnd: (_) => _drag = 0,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: widget.onClose,
                  child: ColoredBox(color: Colors.black.withValues(alpha: 0.3)),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: phone ? size.width : 520 * s,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: phone
                            ? const [
                                Color(0xF708090B),
                                Color(0xE608090B),
                                Color(0x9E08090B),
                              ]
                            : const [
                                Color(0xF508090B),
                                Color(0xE008090B),
                                Color(0x0008090B),
                              ],
                        stops: phone ? const [0, 0.58, 1] : const [0, 0.52, 1],
                      ),
                    ),
                  ),
                ),
              ),
              for (final dy in [-halfWindow, halfWindow])
                Positioned(
                  left: 16 * s,
                  width: (phone ? 300 : 400) * s,
                  top: windowY + dy,
                  height: 1,
                  child: ColoredBox(
                    color: Colors.white.withValues(alpha: 0.16),
                  ),
                ),
              Positioned(
                left: 0,
                top: windowY - 12 * s,
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 24 * s,
                  color: accent,
                ),
              ),
              if (!phone) ...[
                chevron(Icons.expand_less_rounded, -1, windowY - 252 * s),
                chevron(Icons.expand_more_rounded, 1, windowY + 220 * s),
              ],
              ...items,
              if (phone)
                Positioned(
                  top: topInset + 8,
                  right: 12,
                  child: GestureDetector(
                    onTap: widget.onClose,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 22,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ),
                ),
              if (phone && widget.hint != null)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.paddingOf(context).bottom + 34,
                  child: IgnorePointer(
                    child: Text(
                      widget.hint!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReelItem extends StatelessWidget {
  const _ReelItem({
    required this.entry,
    required this.inWindow,
    required this.iconSize,
    required this.fontSize,
    required this.accent,
  });

  final NavEntry entry;
  final bool inWindow;
  final double iconSize;
  final double fontSize;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: Center(child: entry.buildIcon(iconSize, Colors.white)),
        ),
        SizedBox(width: iconSize * 0.47),
        Text(
          entry.label,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: inWindow ? FontWeight.w700 : FontWeight.w600,
            letterSpacing: -0.015 * fontSize,
            decoration: TextDecoration.none,
          ),
        ),
        if (entry.badge > 0) ...[
          SizedBox(width: fontSize * 0.3),
          Container(
            width: fontSize * 0.28,
            height: fontSize * 0.28,
            decoration: const BoxDecoration(
              color: Color(0xFFE53935),
              shape: BoxShape.circle,
            ),
          ),
        ],
        if (entry.current) ...[
          SizedBox(width: fontSize * 0.35),
          Container(
            width: fontSize * 0.28,
            height: fontSize * 0.28,
            decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
          ),
        ],
      ],
    );
  }
}
