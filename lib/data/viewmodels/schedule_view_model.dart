import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:server_core/server_core.dart';

import '../../util/calendar_days.dart';
import '../models/live_tv_recording_state.dart';
import 'recordings_view_model.dart';

class ScheduleGroup {
  final String dateLabel;
  final List<RecordingItem> items;

  const ScheduleGroup({required this.dateLabel, required this.items});
}

enum ScheduleState { loading, ready, error }

class ScheduleViewModel extends ChangeNotifier {
  final MediaServerClient _client;

  ScheduleViewModel(this._client);

  ImageApi get imageApi => _client.imageApi;

  ScheduleState _state = ScheduleState.loading;
  ScheduleState get state => _state;

  List<ScheduleGroup> _groups = const [];
  List<ScheduleGroup> get groups => _groups;

  RecordingItem? _focusedItem;
  RecordingItem? get focusedItem => _focusedItem;

  void setFocusedItem(RecordingItem item) {
    _focusedItem = item;
    notifyListeners();
  }

  // Reads can overlap and finish in any order, so each is numbered and only
  // one newer than the last applied replaces the list.
  int _reads = 0;
  int _applied = 0;

  Future<void> load() => _read(showLoading: true);

  /// Re-reads the timers without the loading state, so the tiles and the
  /// focused one stay in place. A failed read keeps the last list.
  Future<void> refresh() => _read(showLoading: false);

  Future<void> _read({required bool showLoading}) async {
    final read = ++_reads;
    if (showLoading) {
      _state = ScheduleState.loading;
      notifyListeners();
    }

    try {
      final response = await _client.liveTvApi.getTimers();
      if (read < _applied) return;
      final items = (response['Items'] as List?) ?? [];
      final now = clock.now();

      final timerItems = items
          .cast<Map<String, dynamic>>()
          .map((json) => TimerItem.fromJson(json))
          .where((t) => t.startDate != null && t.isUpcoming(now))
          .toList();

      final grouped = <String, List<RecordingItem>>{};
      final dateLabelMap = <String, DateTime>{};

      for (final timer in timerItems) {
        final date = timer.startDate!;
        final dateKey = DateFormat('yyyy-MM-dd').format(date);
        dateLabelMap.putIfAbsent(dateKey, () => date);

        grouped
            .putIfAbsent(dateKey, () => [])
            .add(RecordingItem.fromTimer(timer));
      }

      final sortedKeys = grouped.keys.toList()..sort();
      _groups = sortedKeys.map((key) {
        final date = dateLabelMap[key]!;
        return ScheduleGroup(
          dateLabel: _friendlyDate(date, now),
          items: grouped[key]!,
        );
      }).toList();

      _applied = read;
      _state = ScheduleState.ready;
    } catch (_) {
      if (showLoading && read > _applied) _state = ScheduleState.error;
    }
    notifyListeners();
  }

  Future<void> cancelTimer(String timerId) async {
    await _client.liveTvApi.cancelTimer(timerId);
    // A read started before the cancel can still return the cancelled timer.
    _applied = ++_reads;
    notifyLiveTvRecordingsChanged();
    for (var i = 0; i < _groups.length; i++) {
      final filtered =
          _groups[i].items.where((item) => item.timerId != timerId).toList();
      if (filtered.length != _groups[i].items.length) {
        _groups[i] = ScheduleGroup(
          dateLabel: _groups[i].dateLabel,
          items: filtered,
        );
      }
    }
    _groups = _groups.where((g) => g.items.isNotEmpty).toList();
    if (_focusedItem?.timerId == timerId) _focusedItem = null;
    notifyListeners();
  }

  String _friendlyDate(DateTime date, DateTime now) {
    final diff = calendarDaysBetween(now, date);

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Tomorrow';
    if (diff == -1) return 'Yesterday';
    return DateFormat('EEE, MMM d').format(date);
  }
}
