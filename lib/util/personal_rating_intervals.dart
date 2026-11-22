import 'dart:math' as math;

import 'package:intl/intl.dart';

import '../preference/preference_constants.dart';

/// Default interval count on the shared 0–10 rating scale:
/// 11 steps = 0.5-star increments (0–5) or whole-number increments (0–10).
const int defaultPersonalRatingIntervals = 11;

const List<int> starsRatingIntervals = [6, 11, 21];
const List<int> numericRatingIntervals = [11, 21, 41];

/// Clamps [configured] to a valid interval count for [style].
int effectivePersonalRatingIntervals(
  PersonalRatingStyle style,
  int configured,
) {
  return switch (style) {
    PersonalRatingStyle.thumbs => defaultPersonalRatingIntervals,
    PersonalRatingStyle.stars => switch (configured) {
      6 => 6,
      21 || 41 => 21,
      _ => 11,
    },
    PersonalRatingStyle.numeric => switch (configured) {
      21 => 21,
      41 => 41,
      _ => 11,
    },
  };
}

/// Step size on the 0–10 server scale for [style] and [intervals].
double personalRatingServerStep(PersonalRatingStyle style, int intervals) {
  final effective = effectivePersonalRatingIntervals(style, intervals);
  return 10.0 / (effective - 1);
}

/// Maximum decimal places shown for [style] and [intervals].
int personalRatingMaxDecimals(PersonalRatingStyle style, int intervals) {
  final effective = effectivePersonalRatingIntervals(style, intervals);
  return switch (style) {
    PersonalRatingStyle.stars => switch (effective) {
      6 => 0,
      11 => 1,
      _ => 2,
    },
    PersonalRatingStyle.numeric => switch (effective) {
      11 => 0,
      21 => 1,
      _ => 2,
    },
    PersonalRatingStyle.thumbs => 0,
  };
}

/// Rounds [value] to [maxDecimals] decimal places and trims trailing zeros.
String formatPersonalRatingNumber(
  double value,
  int maxDecimals, {
  String? locale,
}) {
  final factor = math.pow(10, maxDecimals).toDouble();
  final rounded = (value * factor).round() / factor;
  if (locale != null) {
    final formatter = NumberFormat.decimalPattern(locale)
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = maxDecimals;
    return formatter.format(rounded);
  }
  if (maxDecimals == 0) return rounded.round().toString();
  final fixed = rounded.toStringAsFixed(maxDecimals);
  return fixed.replaceFirst(RegExp(r'\.?0+$'), '');
}

/// Snaps a 0–10 [serverRating] to the nearest grid point for [style] and
/// [intervals] so badges, action labels, and dialogs agree on off-grid values.
double snapPersonalRatingToGrid(
  double serverRating,
  PersonalRatingStyle style,
  int intervals,
) {
  final step = personalRatingServerStep(style, intervals);
  final clamped = serverRating.clamp(0.0, 10.0).toDouble();
  final snapped = ((clamped / step).round() * step).clamp(0.0, 10.0).toDouble();
  return (snapped * 100).round() / 100;
}

/// Formats a 0–10 server rating for badges/rows according to [style] and
/// [intervals], snapping off-grid values to the active interval grid and
/// trimming trailing zeros.
String formatPersonalRatingBadge(
  double serverRating,
  PersonalRatingStyle style,
  int intervals,
) {
  final snapped = snapPersonalRatingToGrid(serverRating, style, intervals);
  final maxDecimals = personalRatingMaxDecimals(style, intervals);
  if (style == PersonalRatingStyle.stars) {
    return '${formatPersonalRatingNumber(snapped / 2, maxDecimals)}/5';
  }
  return formatPersonalRatingNumber(snapped, maxDecimals);
}

/// Formats the compact star action button label (`★★★★`, `★★★★½`, `★★★★¼`, etc.)
/// according to [intervals].
String formatPersonalStarActionLabel(
  double serverRating,
  int intervals,
  String zeroLabel,
) {
  final effective = effectivePersonalRatingIntervals(
    PersonalRatingStyle.stars,
    intervals,
  );
  final snappedStars =
      snapPersonalRatingToGrid(
        serverRating,
        PersonalRatingStyle.stars,
        effective,
      ) /
      2;
  final subdivisions = switch (effective) {
    6 => 1,
    11 => 2,
    _ => 4,
  };
  final snappedUnits = (snappedStars * subdivisions).round();
  if (snappedUnits <= 0) return zeroLabel;
  final full = snappedUnits ~/ subdivisions;
  final remainder = snappedUnits % subdivisions;
  final fractionGlyph = switch ((subdivisions, remainder)) {
    (2, 1) => '½',
    (4, 1) => '¼',
    (4, 2) => '½',
    (4, 3) => '¾',
    _ => '',
  };
  return '${'★' * full}$fractionGlyph';
}

/// Steps [current] (0–10 server scale) down to the previous grid point.
double stepPersonalRatingDown(
  double current,
  PersonalRatingStyle style,
  int intervals,
) {
  final step = personalRatingServerStep(style, intervals);
  final next = ((current / step).ceil() - 1) * step;
  return ((next.clamp(0.0, 10.0)) * 100).round() / 100;
}

/// Steps [current] (0–10 server scale) up to the next grid point.
double stepPersonalRatingUp(
  double current,
  PersonalRatingStyle style,
  int intervals,
) {
  final step = personalRatingServerStep(style, intervals);
  final next = ((current / step).floor() + 1) * step;
  return ((next.clamp(0.0, 10.0)) * 100).round() / 100;
}

/// Maps a tap at [fractionInStar] (0.0–1.0 across star [starIndex], 0..4) to
/// a 0–10 server rating matching [intervals].
double starTapRating(int starIndex, double fractionInStar, int intervals) {
  final effective = effectivePersonalRatingIntervals(
    PersonalRatingStyle.stars,
    intervals,
  );
  final clampedFraction = fractionInStar.clamp(0.0, 0.999999);
  final starFraction = switch (effective) {
    6 => 1.0,
    11 => clampedFraction < 0.5 ? 0.5 : 1.0,
    _ => ((clampedFraction * 4).floor() + 1) * 0.25,
  };
  return ((starIndex + starFraction) * 2.0).clamp(0.0, 10.0).toDouble();
}
