import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/live_tv_recording_state.dart';

class SeriesTimerItem {
  final String id;
  final String name;
  final String? channelName;
  final bool? recordAnyChannel;
  final String? dayPattern;
  final Map<String, dynamic> rawData;

  const SeriesTimerItem({
    required this.id,
    required this.name,
    this.channelName,
    this.recordAnyChannel,
    this.dayPattern,
    required this.rawData,
  });

  factory SeriesTimerItem.fromJson(Map<String, dynamic> json) {
    return SeriesTimerItem(
      id: json['Id']?.toString() ?? '',
      name: json['Name'] as String? ?? '',
      channelName: json['ChannelName'] as String?,
      recordAnyChannel: json['RecordAnyChannel'] as bool?,
      dayPattern: json['DayPattern'] as String?,
      rawData: json,
    );
  }

  String get subtitle {
    final parts = <String>[];
    final channelText = (recordAnyChannel == true)
        ? 'All Channels'
        : channelName;
    if (channelText != null && channelText.isNotEmpty) parts.add(channelText);
    if (dayPattern != null && dayPattern!.isNotEmpty) parts.add(dayPattern!);
    return parts.join(' \u2022 ');
  }
}

enum SeriesRecordingsState { loading, ready, error }

class SeriesRecordingsViewModel extends ChangeNotifier {
  final MediaServerClient _client;

  SeriesRecordingsViewModel(this._client);

  SeriesRecordingsState _state = SeriesRecordingsState.loading;
  SeriesRecordingsState get state => _state;

  List<SeriesTimerItem> _seriesTimers = const [];
  List<SeriesTimerItem> get seriesTimers => _seriesTimers;

  SeriesTimerItem? _focusedTimer;
  SeriesTimerItem? get focusedTimer => _focusedTimer;

  void setFocusedTimer(SeriesTimerItem timer) {
    _focusedTimer = timer;
    notifyListeners();
  }

  Future<void> load() async {
    _state = SeriesRecordingsState.loading;
    notifyListeners();

    try {
      final response = await _client.liveTvApi.getSeriesTimers();
      final items = (response['Items'] as List?) ?? [];
      _seriesTimers = items
          .cast<Map<String, dynamic>>()
          .map((json) => SeriesTimerItem.fromJson(json))
          .toList();
      _state = SeriesRecordingsState.ready;
    } catch (_) {
      _state = SeriesRecordingsState.error;
    }
    notifyListeners();
  }

  Future<void> cancelSeriesTimer(String id) async {
    await _client.liveTvApi.cancelSeriesTimer(id);
    notifyLiveTvRecordingsChanged();
    _seriesTimers = _seriesTimers.where((t) => t.id != id).toList();
    if (_focusedTimer?.id == id) _focusedTimer = null;
    notifyListeners();
  }
}
