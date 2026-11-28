import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

/// Counts the recordings this app has created, changed or cancelled, so a Live
/// TV surface holding programs from before the change can re-read them.
final liveTvRecordingRevision = ValueNotifier<int>(0);

void notifyLiveTvRecordingsChanged() => liveTvRecordingRevision.value++;

/// Live TV ids can come back with or without dashes depending on the call.
bool sameLiveTvId(Object? a, Object? b) {
  final left = a?.toString().replaceAll('-', '') ?? '';
  final right = b?.toString().replaceAll('-', '') ?? '';
  return left.isNotEmpty && left == right;
}

class LiveTvRecordingState {
  final String? timerId;
  final String? seriesTimerId;
  final bool isRecording;
  final DateTime? nextSeriesRecording;

  const LiveTvRecordingState({
    this.timerId,
    this.seriesTimerId,
    this.isRecording = false,
    this.nextSeriesRecording,
  });

  factory LiveTvRecordingState.fromProgram(
    Map<String, dynamic> program,
    List<dynamic> timers, {
    DateTime? now,
  }) {
    String? id(Object? value) {
      final text = value?.toString();
      return text == null || text.isEmpty ? null : text;
    }

    Map? timer;
    for (final candidate in timers.whereType<Map>()) {
      if (sameLiveTvId(candidate['Id'], program['TimerId']) ||
          sameLiveTvId(candidate['ProgramId'], program['Id'])) {
        final status = candidate['Status']?.toString();
        if (status == 'InProgress') {
          timer = candidate;
          break;
        }
        if (status == 'New') timer ??= candidate;
      }
    }

    final seriesTimerId =
        id(timer?['SeriesTimerId']) ?? id(program['SeriesTimerId']);
    final currentTime = now ?? DateTime.now();
    DateTime? nextSeriesRecording;
    if (seriesTimerId != null) {
      for (final candidate in timers.whereType<Map>()) {
        if (candidate['Status'] != 'New' ||
            !sameLiveTvId(candidate['SeriesTimerId'], seriesTimerId)) {
          continue;
        }
        final start = parseServerDate(candidate['StartDate']);
        if (start != null &&
            start.isAfter(currentTime) &&
            (nextSeriesRecording == null ||
                start.isBefore(nextSeriesRecording))) {
          nextSeriesRecording = start;
        }
      }
    }

    return LiveTvRecordingState(
      timerId: id(timer?['Id']),
      seriesTimerId: seriesTimerId,
      isRecording: timer?['Status'] == 'InProgress',
      nextSeriesRecording: nextSeriesRecording,
    );
  }
}
