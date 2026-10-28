/// Alignment tags use the chosen edge margin, and middle captions stay centered.
double webSrtVerticalPosition(int alignment, double offset) =>
    switch ((alignment - 1) ~/ 3) {
      0 => 1 - offset,
      1 => 0.5,
      _ => offset,
    };

/// Stable top lane used when the primary is an ASS/SSA or bitmap overlay.
/// The primary offset is the shared base position. The secondary offset is
/// the relative 0...+6% adjustment.
double webOverlaySecondaryTop(double primaryOffset, double secondaryOffset) =>
    (primaryOffset + secondaryOffset).clamp(0.0, 1.0).toDouble();

typedef WebVttHorizontalPlacement = ({
  String align,
  double position,
  String positionAlign,
  double size,
});

typedef WebVttCueBox = ({
  double top,
  double bottom,
  WebVttHorizontalPlacement horizontal,
});

/// Move an automatic cue above overlapping boxes, keeping separate columns level.
/// Without native positionAlign, converting automatic lines to percentages
/// can shift a cue by as much as its full width. Reserve that displacement
/// when deciding whether two captions may safely share a row.
double fitWebAutomaticCue(
  double bottom,
  double height,
  WebVttHorizontalPlacement horizontal,
  List<WebVttCueBox> occupied, {
  bool conservativeHorizontal = false,
}) {
  double left(WebVttHorizontalPlacement box) => box.position - switch (box.positionAlign) {
    'line-left' => 0,
    'line-right' => box.size,
    _ => box.size / 2,
  };
  final cueLeft = left(horizontal);
  final cueRight = cueLeft + horizontal.size;
  final cuePadding = conservativeHorizontal ? horizontal.size : 0.0;
  final blockers = occupied.where((box) {
    final boxLeft = left(box.horizontal);
    final boxPadding = conservativeHorizontal ? box.horizontal.size : 0.0;
    return cueLeft - cuePadding < boxLeft + box.horizontal.size + boxPadding &&
        cueRight + cuePadding > boxLeft - boxPadding;
  }).toList()..sort((a, b) => b.top.compareTo(a.top));
  const gap = 0.002;
  for (final box in blockers) {
    if (bottom > box.top - gap && bottom - height < box.bottom + gap) {
      bottom = box.top - gap;
    }
  }
  return (bottom - height).clamp(0.0, (1 - height).clamp(0.0, 1.0)).toDouble();
}

/// Resolve the primary's physical box before applying it to another language.
/// Older browsers infer the position anchor from alignment, so moving that anchor
/// also requires moving the position to the matching edge of the same box.
WebVttHorizontalPlacement webVttHorizontalPlacement({
  required String align,
  required double? position,
  required String positionAlign,
  required double size,
  required bool rtl,
  required bool supportsPositionAlign,
}) {
  final physicalAlign = switch (align) {
    'start' => rtl ? 'right' : 'left',
    'end' => rtl ? 'left' : 'right',
    _ => align,
  };
  var resolvedPosition =
      position ??
      switch (align) {
        'left' => 0.0,
        'right' => 100.0,
        'start' when !supportsPositionAlign => 0.0,
        'end' when !supportsPositionAlign => 100.0,
        _ => 50.0,
      };
  var anchor = supportsPositionAlign && positionAlign != 'auto'
      ? positionAlign
      : switch (align) {
          'left' => 'line-left',
          'right' => 'line-right',
          'start' => rtl && supportsPositionAlign ? 'line-right' : 'line-left',
          'end' => rtl && supportsPositionAlign ? 'line-left' : 'line-right',
          _ => 'center',
        };
  final maximumSize = switch (anchor) {
    'line-left' => 100 - resolvedPosition,
    'line-right' => resolvedPosition,
    _ =>
      2 * (resolvedPosition <= 50 ? resolvedPosition : 100 - resolvedPosition),
  };
  final resolvedSize = size
      .clamp(0.0, maximumSize.clamp(0.0, 100.0))
      .toDouble();
  if (!supportsPositionAlign) {
    final left =
        resolvedPosition -
        switch (anchor) {
          'line-left' => 0,
          'line-right' => resolvedSize,
          _ => resolvedSize / 2,
        };
    anchor = switch (physicalAlign) {
      'left' => 'line-left',
      'right' => 'line-right',
      _ => 'center',
    };
    resolvedPosition =
        left +
        switch (anchor) {
          'line-left' => 0,
          'line-right' => resolvedSize,
          _ => resolvedSize / 2,
        };
  }
  return (
    align: physicalAlign,
    position: resolvedPosition,
    positionAlign: anchor,
    size: resolvedSize,
  );
}

/// Prefer a free interval on the intended side of the first primary cue.
/// If none fits there, keep the nearest available gap as the fallback.
double fitWebSecondaryGroup(
  double preferredTop,
  double height,
  List<({double top, double bottom})> occupied,
  double gap, {
  required bool preferBelow,
}) {
  final maxTop = (1 - height).clamp(0.0, 1.0).toDouble();
  final preferred = preferredTop.clamp(0.0, maxTop).toDouble();
  final candidates = <double>[
    preferred,
    0,
    maxTop,
    for (final bounds in occupied) ...[
      bounds.top - gap - height,
      bounds.bottom + gap,
    ],
  ];
  double? best;
  bool bestOnPreferredSide = false;
  for (final top in candidates) {
    if (top < 0 ||
        top > maxTop ||
        occupied.any(
          (bounds) =>
              top < bounds.bottom + gap - 0.000001 &&
              top + height > bounds.top - gap + 0.000001,
        )) {
      continue;
    }
    final onPreferredSide =
        occupied.isEmpty ||
        (preferBelow
            ? top >= occupied.first.bottom + gap - 0.000001
            : top + height <= occupied.first.top - gap + 0.000001);
    if (best == null ||
        (onPreferredSide && !bestOnPreferredSide) ||
        (onPreferredSide == bestOnPreferredSide &&
            (top - preferred).abs() < (best - preferred).abs())) {
      best = top;
      bestOnPreferredSide = onPreferredSide;
    }
  }
  return best ?? preferred;
}
