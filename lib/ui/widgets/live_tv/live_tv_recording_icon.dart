import 'package:flutter/material.dart';

/// The recording mark for one airing. A one-off recording is a single red
/// dot. A series rule is the series record icon: red when this airing will
/// record, grey when the rule won't record it, such as a repeat or an
/// episode already in the library.
class LiveTvRecordingIcon extends StatelessWidget {
  static const recordColor = Color(0xFFE0685C);
  static const skippedColor = Color(0xFF9E9E9E);

  /// The airing has a timer of its own, so it will record.
  final bool hasTimer;

  /// The airing belongs to a series rule, whether or not it will record.
  final bool hasSeriesTimer;
  final double size;

  const LiveTvRecordingIcon({
    super.key,
    required this.hasTimer,
    required this.hasSeriesTimer,
    required this.size,
  });

  static bool shows({required bool hasTimer, required bool hasSeriesTimer}) =>
      hasTimer || hasSeriesTimer;

  @override
  Widget build(BuildContext context) {
    return Icon(
      hasSeriesTimer ? Icons.fiber_smart_record : Icons.fiber_manual_record,
      size: size,
      color: hasTimer ? recordColor : skippedColor,
    );
  }
}
