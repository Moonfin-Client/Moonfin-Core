import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';

/// The letters a library jumps between, `#` first for everything that doesn't
/// start with a letter.
const kAlphabetLetters = [
  '#',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

/// Touch width of [AlphabetScrubRail].
const kAlphabetScrubRailWidth = 24.0;

/// Below this much height per letter the rail draws a condensed set.
const _kMinLetterExtent = 14.0;

const _kBubbleSize = 64.0;

/// The phone alphabet: a narrow rail along the right edge of a grid.
///
/// Touching it picks the letter under the finger and sliding picks each new
/// letter it passes, calling [onLetter] once per change. A magnified copy of
/// the letter floats beside the finger while it's down. When the rail is too
/// short to fit every letter it draws some of them with dots in between, but
/// a touch still lands on the exact letter at that height.
class AlphabetScrubRail extends StatefulWidget {
  const AlphabetScrubRail({
    super.key,
    required this.onLetter,
    this.letters = kAlphabetLetters,
    this.available,
  });

  final ValueChanged<String> onLetter;
  final List<String> letters;

  /// The letters with something under them. The rest are drawn dimmed.
  final Set<String>? available;

  @override
  State<AlphabetScrubRail> createState() => _AlphabetScrubRailState();
}

class _AlphabetScrubRailState extends State<AlphabetScrubRail> {
  int? _pointer;
  int? _scrubIndex;
  // What a screen reader steps from, kept after the finger lifts.
  int _index = 0;
  double _fingerY = 0;
  OverlayEntry? _bubble;

  @override
  void dispose() {
    _removeBubble();
    super.dispose();
  }

  void _onDown(PointerDownEvent event) {
    if (_pointer != null) return;
    _pointer = event.pointer;
    _scrubIndex = null;
    _track(event.localPosition.dy, event.position.dy);
  }

  void _onMove(PointerMoveEvent event) {
    if (event.pointer != _pointer) return;
    _track(event.localPosition.dy, event.position.dy);
  }

  void _onEnd(PointerEvent event) {
    if (event.pointer != _pointer) return;
    _pointer = null;
    _removeBubble();
    setState(() => _scrubIndex = null);
  }

  void _track(double localY, double globalY) {
    final height = context.size?.height ?? 0;
    final count = widget.letters.length;
    final index = height <= 0
        ? 0
        : (localY / height * count).floor().clamp(0, count - 1);
    _fingerY = globalY;
    if (index != _scrubIndex) {
      setState(() {
        _scrubIndex = index;
        _index = index;
      });
      HapticFeedback.selectionClick();
      widget.onLetter(widget.letters[index]);
    }
    _showBubble();
  }

  void _step(int delta) {
    final index = (_index + delta).clamp(0, widget.letters.length - 1);
    if (index == _index) return;
    setState(() => _index = index);
    widget.onLetter(widget.letters[index]);
  }

  void _showBubble() {
    final bubble = _bubble;
    if (bubble != null) {
      bubble.markNeedsBuild();
      return;
    }
    final overlay = Overlay.maybeOf(context);
    if (overlay == null) return;
    overlay.insert(_bubble = OverlayEntry(builder: _buildBubble));
  }

  void _removeBubble() {
    _bubble?.remove();
    _bubble?.dispose();
    _bubble = null;
  }

  Widget _buildBubble(BuildContext overlayContext) {
    final index = _scrubIndex;
    final rail = context.findRenderObject() as RenderBox?;
    final overlay =
        Overlay.maybeOf(context)?.context.findRenderObject() as RenderBox?;
    if (index == null ||
        rail == null ||
        overlay == null ||
        !rail.attached ||
        !overlay.hasSize) {
      return const SizedBox.shrink();
    }
    final railLeft = overlay.globalToLocal(rail.localToGlobal(Offset.zero)).dx;
    final fingerY = overlay.globalToLocal(Offset(0, _fingerY)).dy;
    final padding = MediaQuery.paddingOf(overlayContext);
    final size = overlay.size;
    final top = (fingerY - _kBubbleSize / 2)
        .clamp(
          padding.top,
          math.max(padding.top, size.height - padding.bottom - _kBubbleSize),
        )
        .toDouble();
    final left = (railLeft - _kBubbleSize - 16)
        .clamp(padding.left, math.max(padding.left, size.width - _kBubbleSize))
        .toDouble();
    return Positioned(
      left: left,
      top: top,
      child: IgnorePointer(
        child: ExcludeSemantics(
          child: Container(
            key: const ValueKey('alphabet_scrub_bubble'),
            width: _kBubbleSize,
            height: _kBubbleSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColorScheme.accent,
              shape: BoxShape.circle,
            ),
            child: Text(
              widget.letters[index],
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColorScheme.onAccent,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final letters = widget.letters;
    final count = letters.length;
    return Semantics(
      container: true,
      slider: true,
      label: AppLocalizations.of(context).libraryJumpToLetter,
      value: letters[_index],
      increasedValue: _index < count - 1 ? letters[_index + 1] : null,
      decreasedValue: _index > 0 ? letters[_index - 1] : null,
      onIncrease: _index < count - 1 ? () => _step(1) : null,
      onDecrease: _index > 0 ? () => _step(-1) : null,
      child: ExcludeSemantics(
        child: Listener(
          behavior: HitTestBehavior.opaque,
          onPointerDown: _onDown,
          onPointerMove: _onMove,
          onPointerUp: _onEnd,
          onPointerCancel: _onEnd,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _scrubIndex != null
                  ? AppColorScheme.onSurface.withValues(alpha: 0.08)
                  : Colors.transparent,
              borderRadius: AppRadius.circular(kAlphabetScrubRailWidth / 2),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) =>
                  _buildLetters(constraints.maxHeight),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLetters(double height) {
    final letters = widget.letters;
    final count = letters.length;
    if (!height.isFinite) return const SizedBox.expand();
    final slots = (height / _kMinLetterExtent).floor();
    if (slots < 3) return const SizedBox.expand();

    final idle = AppColorScheme.onSurface.withValues(alpha: 0.7);
    final empty = AppColorScheme.onSurface.withValues(alpha: 0.3);
    Widget letterText(String letter, {bool active = false}) => Text(
      letter,
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        fontSize: 10,
        height: 1,
        fontWeight: active ? FontWeight.w800 : FontWeight.w600,
        color: active
            ? AppColorScheme.accent
            : widget.available?.contains(letter) ?? true
            ? idle
            : empty,
      ),
    );

    final List<Widget> cells;
    if (slots >= count) {
      cells = [
        for (var i = 0; i < count; i++)
          letterText(letters[i], active: i == _scrubIndex),
      ];
    } else {
      // An odd number of cells keeps a letter at both ends, with dots
      // standing in for the letters between them.
      final shown = slots.isOdd ? slots : slots - 1;
      cells = [
        for (var k = 0; k < shown; k++)
          k.isEven
              ? letterText(letters[(k * (count - 1) / (shown - 1)).round()])
              : Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: idle,
                    shape: BoxShape.circle,
                  ),
                ),
      ];
    }
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          for (final cell in cells) Expanded(child: Center(child: cell)),
        ],
      ),
    );
  }
}
