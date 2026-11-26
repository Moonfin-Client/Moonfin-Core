import 'package:intl/intl.dart';

import '../preference/preference_constants.dart';

/// How many points the 0 to 10 rating scale is split into. The default of 11
/// rates in half stars or whole numbers.
const int defaultPersonalRatingIntervals = 11;

/// [configured] as one of the counts [style] offers: 6, 11 or 21 for stars and
/// 11, 21 or 41 for numbers.
int effectivePersonalRatingIntervals(
  PersonalRatingStyle style,
  int configured,
) => switch (style) {
  PersonalRatingStyle.thumbs => defaultPersonalRatingIntervals,
  PersonalRatingStyle.stars => switch (configured) {
    6 => 6,
    21 || 41 => 21,
    _ => 11,
  },
  PersonalRatingStyle.numeric => switch (configured) {
    21 || 41 => configured,
    _ => 11,
  },
};

double _step(PersonalRatingStyle style, int intervals) =>
    10 / (effectivePersonalRatingIntervals(style, intervals) - 1);

/// How many decimals one step needs on the scale the rating shows in, which is
/// out of five for stars.
int personalRatingMaxDecimals(PersonalRatingStyle style, int intervals) {
  final step =
      _step(style, intervals) / (style == PersonalRatingStyle.stars ? 2 : 1);
  return step >= 1
      ? 0
      : step >= 0.5
      ? 1
      : 2;
}

/// [value] with at most [maxDecimals] decimals and no trailing zeros.
String formatPersonalRatingNumber(
  double value,
  int maxDecimals, {
  String? locale,
}) => (NumberFormat.decimalPattern(
  locale,
)..maximumFractionDigits = maxDecimals).format(value);

/// [serverRating] moved to the nearest step, so the badge, the button and the
/// dialog agree on a rating saved with finer steps.
double snapPersonalRatingToGrid(
  double serverRating,
  PersonalRatingStyle style,
  int intervals,
) {
  final step = _step(style, intervals);
  return (serverRating.clamp(0.0, 10.0) / step).round() * step;
}

/// A rating out of ten as its badge reads it, out of five for stars.
String formatPersonalRatingBadge(
  double serverRating,
  PersonalRatingStyle style,
  int intervals,
) {
  final snapped = snapPersonalRatingToGrid(serverRating, style, intervals);
  final decimals = personalRatingMaxDecimals(style, intervals);
  return style == PersonalRatingStyle.stars
      ? '${formatPersonalRatingNumber(snapped / 2, decimals)}/5'
      : formatPersonalRatingNumber(snapped, decimals);
}

/// The stars button label, such as ★★★★½, or [zeroLabel] for no stars.
String formatPersonalStarActionLabel(
  double serverRating,
  int intervals,
  String zeroLabel,
) {
  final snapped = snapPersonalRatingToGrid(
    serverRating,
    PersonalRatingStyle.stars,
    intervals,
  );
  final quarters = (snapped * 2).round();
  if (quarters <= 0) return zeroLabel;
  return '${'★' * (quarters ~/ 4)}${const ['', '¼', '½', '¾'][quarters % 4]}';
}

/// The step above [current] on the 0 to 10 scale, or below it when [up] is
/// false.
double stepPersonalRating(
  double current,
  PersonalRatingStyle style,
  int intervals, {
  required bool up,
}) {
  final step = _step(style, intervals);
  final index = up ? (current / step).floor() + 1 : (current / step).ceil() - 1;
  return (index * step).clamp(0.0, 10.0);
}

/// The rating out of ten for a tap [fractionInStar] of the way across star
/// [starIndex], rounded up to the next whole, half or quarter star.
double starTapRating(int starIndex, double fractionInStar, int intervals) {
  final parts = (2 / _step(PersonalRatingStyle.stars, intervals)).round();
  final part = (fractionInStar.clamp(0.0, 0.999) * parts).floor() + 1;
  return (starIndex + part / parts) * 2;
}
