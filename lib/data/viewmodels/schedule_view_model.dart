import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:server_core/server_core.dart';

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

  Future<void> load() async {
    _state = ScheduleState.loading;
    notifyListeners();

    try {
      final response = await _client.liveTvApi.getTimers();
      final items = (response['Items'] as List?) ?? [];
      final now = DateTime.now();

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

        final item = timer.programInfo != null
            ? RecordingItem.fromJson(timer.programInfo!)
            : RecordingItem(
                id: timer.id,
                name: timer.name,
                channelName: timer.channelName,
                startDate: timer.startDate,
                endDate: timer.endDate,
                rawData: timer.rawData,
              );

        grouped.putIfAbsent(dateKey, () => []).add(item);
      }

      final sortedKeys = grouped.keys.toList()..sort();
      _groups = sortedKeys.map((key) {
        final date = dateLabelMap[key]!;
        return ScheduleGroup(
          dateLabel: _friendlyDate(date),
          items: grouped[key]!,
        );
      }).toList();

      _state = ScheduleState.ready;
    } catch (_) {
      _state = ScheduleState.error;
    }
    notifyListeners();
  }

  Future<void> cancelTimer(String timerId) async {
    await _client.liveTvApi.cancelTimer(timerId);
    notifyLiveTvRecordingsChanged();
    for (var i = 0; i < _groups.length; i++) {
      final filtered =
          _groups[i].items.where((item) => item.id != timerId).toList();
      if (filtered.length != _groups[i].items.length) {
        _groups[i] = ScheduleGroup(
          dateLabel: _groups[i].dateLabel,
          items: filtered,
        );
      }
    }
    _groups = _groups.where((g) => g.items.isNotEmpty).toList();
    if (_focusedItem?.id == timerId) _focusedItem = null;
    notifyListeners();
  }

  String _friendlyDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);
    final diff = dateOnly.difference(today).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Tomorrow';
    if (diff == -1) return 'Yesterday';
    return DateFormat('EEE, MMM d').format(date);
  }
}
