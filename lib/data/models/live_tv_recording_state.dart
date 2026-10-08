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

    bool sameId(Object? a, Object? b) =>
        id(a) != null &&
        id(b) != null &&
        id(a)!.replaceAll('-', '') == id(b)!.replaceAll('-', '');

    Map? timer;
    for (final candidate in timers.whereType<Map>()) {
      if (sameId(candidate['Id'], program['TimerId']) ||
          sameId(candidate['ProgramId'], program['Id'])) {
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
            !sameId(candidate['SeriesTimerId'], seriesTimerId)) {
          continue;
        }
        final start = DateTime.tryParse(
          candidate['StartDate']?.toString() ?? '',
        );
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
