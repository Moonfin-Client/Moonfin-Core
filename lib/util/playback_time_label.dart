import 'package:flutter/widgets.dart';

import '../l10n/app_localizations.dart';
import '../preference/preference_constants.dart';
import 'clock_format.dart';

/// Formats a duration as `h:mm:ss`, dropping the hour part when it is zero.
String formatPlaybackDuration(Duration value) {
  final total = value.isNegative ? Duration.zero : value;
  final h = total.inHours;
  final m = total.inMinutes.remainder(60);
  final s = total.inSeconds.remainder(60);
  if (h > 0) {
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
  return '$m:${s.toString().padLeft(2, '0')}';
}

/// Wall-clock time the item finishes at, e.g. `Ends at 21:45`.
///
/// A faster [playbackSpeed] brings that time forward, so it feeds into the
/// wait rather than only the media time left.
String formatPlaybackEndsAt(
  BuildContext context, {
  required Duration position,
  required Duration duration,
  required bool use24Hour,
  double playbackSpeed = 1.0,
}) {
  if (duration <= Duration.zero) return '';
  final remainingMedia = duration - position;
  if (remainingMedia <= Duration.zero) return '';
  final speed = playbackSpeed > 0 ? playbackSpeed : 1.0;
  final remainingWall = Duration(
    milliseconds: (remainingMedia.inMilliseconds / speed).round(),
  );
  if (remainingWall <= Duration.zero) return '';
  final time = formatClockTime(
    DateTime.now().add(remainingWall),
    use24Hour: use24Hour,
  );
  return AppLocalizations.of(context).endsAt(time);
}

/// Formats a [PlaybackTimeSlot] into its label.
String formatPlaybackTimeSlot(
  BuildContext context, {
  required PlaybackTimeSlot slot,
  required Duration position,
  required Duration duration,
  required bool use24Hour,
  double playbackSpeed = 1.0,
}) {
  switch (slot) {
    case PlaybackTimeSlot.none:
      return '';
    case PlaybackTimeSlot.elapsed:
      return formatPlaybackDuration(position);
    case PlaybackTimeSlot.totalDuration:
      return formatPlaybackDuration(duration);
    case PlaybackTimeSlot.timeRemaining:
    case PlaybackTimeSlot.endsAt:
      return formatPlaybackTrailingTime(
        context,
        position: position,
        duration: duration,
        mode: slot == PlaybackTimeSlot.timeRemaining
            ? PlaybackTimeDisplay.timeRemaining
            : PlaybackTimeDisplay.endsAt,
        use24Hour: use24Hour,
        playbackSpeed: playbackSpeed,
      );
  }
}

/// Formats the trailing time label for a [PlaybackTimeDisplay] mode.
///
/// Falls back to the total duration whenever the selected mode can't be
/// rendered, for example an unknown duration on a live stream.
String formatPlaybackTrailingTime(
  BuildContext context, {
  required Duration position,
  required Duration duration,
  required PlaybackTimeDisplay mode,
  required bool use24Hour,
  double playbackSpeed = 1.0,
}) {
  switch (mode) {
    case PlaybackTimeDisplay.totalDuration:
      return formatPlaybackDuration(duration);
    case PlaybackTimeDisplay.timeRemaining:
      if (duration <= Duration.zero) {
        return formatPlaybackDuration(duration);
      }
      return '-${formatPlaybackDuration(duration - position)}';
    case PlaybackTimeDisplay.endsAt:
      final label = formatPlaybackEndsAt(
        context,
        position: position,
        duration: duration,
        use24Hour: use24Hour,
        playbackSpeed: playbackSpeed,
      );
      return label.isEmpty ? formatPlaybackDuration(duration) : label;
  }
}
