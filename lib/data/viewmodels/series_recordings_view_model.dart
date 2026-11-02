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

  // Reads can overlap and finish in any order, so each is numbered and only
  // one newer than the last applied replaces the list.
  int _reads = 0;
  int _applied = 0;

  Future<void> load() => _read(showLoading: true);

  /// Re-reads the rules without the loading state, so the tiles and the
  /// focused one stay in place. A failed read keeps the last list.
  Future<void> refresh() => _read(showLoading: false);

  Future<void> _read({required bool showLoading}) async {
    final read = ++_reads;
    if (showLoading) {
      _state = SeriesRecordingsState.loading;
      notifyListeners();
    }

    try {
      final response = await _client.liveTvApi.getSeriesTimers();
      if (read < _applied) return;
      final items = (response['Items'] as List?) ?? [];
      _seriesTimers = items
          .cast<Map<String, dynamic>>()
          .map((json) => SeriesTimerItem.fromJson(json))
          .toList();
      _applied = read;
      _state = SeriesRecordingsState.ready;
    } catch (_) {
      if (showLoading && read > _applied) {
        _state = SeriesRecordingsState.error;
      }
    }
    notifyListeners();
  }

  Future<void> cancelSeriesTimer(String id) async {
    await _client.liveTvApi.cancelSeriesTimer(id);
    // A read started before the cancel can still return the cancelled rule.
    _applied = ++_reads;
    notifyLiveTvRecordingsChanged();
    _seriesTimers = _seriesTimers.where((t) => t.id != id).toList();
    if (_focusedTimer?.id == id) _focusedTimer = null;
    notifyListeners();
  }
}
