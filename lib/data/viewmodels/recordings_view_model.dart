import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

/// A server date in local time, or null when the server has none.
DateTime? _serverDate(Object? value) => parseServerDate(value)?.toLocal();

class RecordingItem {
  final String id;

  /// The timer that records this, for a scheduled item. Its [id] is the
  /// program's, since the program carries the artwork.
  final String? timerId;
  final String name;
  final String? channelName;
  final String? episodeTitle;
  final String? seriesName;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? overview;
  final Map<String, dynamic>? imageTags;
  final String? parentThumbItemId;
  final String? parentThumbImageTag;
  final String? seriesId;
  final Map<String, dynamic> rawData;

  const RecordingItem({
    required this.id,
    this.timerId,
    required this.name,
    this.channelName,
    this.episodeTitle,
    this.seriesName,
    this.startDate,
    this.endDate,
    this.overview,
    this.imageTags,
    this.parentThumbItemId,
    this.parentThumbImageTag,
    this.seriesId,
    required this.rawData,
  });

  factory RecordingItem.fromJson(
    Map<String, dynamic> json, {
    String? timerId,
  }) {
    return RecordingItem(
      id: json['Id']?.toString() ?? '',
      timerId: timerId,
      name: json['Name'] as String? ?? '',
      channelName: json['ChannelName'] as String?,
      episodeTitle: json['EpisodeTitle'] as String?,
      seriesName: json['SeriesName'] as String?,
      startDate: _serverDate(json['StartDate']),
      endDate: _serverDate(json['EndDate']),
      overview: json['Overview'] as String?,
      imageTags: json['ImageTags'] as Map<String, dynamic>?,
      parentThumbItemId: json['ParentThumbItemId']?.toString(),
      parentThumbImageTag: json['ParentThumbImageTag'] as String?,
      seriesId: json['SeriesId']?.toString(),
      rawData: json,
    );
  }

  /// A scheduled timer, shown as its program when the server includes one.
  factory RecordingItem.fromTimer(TimerItem timer) {
    final program = timer.programInfo;
    if (program != null) {
      return RecordingItem.fromJson(program, timerId: timer.id);
    }
    return RecordingItem(
      id: timer.id,
      timerId: timer.id,
      name: timer.name,
      channelName: timer.channelName,
      startDate: timer.startDate,
      endDate: timer.endDate,
      rawData: timer.rawData,
    );
  }

  String get subtitle {
    final parts = <String>[];
    if (channelName != null && channelName!.isNotEmpty) parts.add(channelName!);
    if (episodeTitle != null && episodeTitle!.isNotEmpty) {
      parts.add(episodeTitle!);
    }
    return parts.join(' \u2022 ');
  }

  String? imageUrl(ImageApi imageApi) {
    if (imageTags != null && imageTags!.containsKey('Thumb')) {
      return imageApi.getBackdropImageUrl(id, maxWidth: 400);
    }
    if (imageTags != null && imageTags!.containsKey('Primary')) {
      return imageApi.getPrimaryImageUrl(
        id,
        maxHeight: 300,
        tag: imageTags!['Primary']?.toString(),
      );
    }
    if (parentThumbItemId != null) {
      return imageApi.getBackdropImageUrl(parentThumbItemId!, maxWidth: 400);
    }
    return null;
  }
}

class TimerItem {
  final String id;
  final String name;
  final String? channelName;
  final String? seriesTimerId;
  final DateTime? startDate;
  final DateTime? endDate;
  final Map<String, dynamic>? programInfo;
  final Map<String, dynamic> rawData;

  const TimerItem({
    required this.id,
    required this.name,
    this.channelName,
    this.seriesTimerId,
    this.startDate,
    this.endDate,
    this.programInfo,
    required this.rawData,
  });

  factory TimerItem.fromJson(Map<String, dynamic> json) {
    return TimerItem(
      id: json['Id']?.toString() ?? '',
      name: json['Name'] as String? ?? '',
      channelName: json['ChannelName'] as String?,
      seriesTimerId: json['SeriesTimerId']?.toString(),
      startDate: _serverDate(json['StartDate']),
      endDate: _serverDate(json['EndDate']),
      programInfo: json['ProgramInfo'] as Map<String, dynamic>?,
      rawData: json,
    );
  }

  /// `/LiveTv/Timers` returns every timer the server keeps, including
  /// showings a series rule or the user cancelled and recordings that already
  /// finished or failed. Only the rest will still record.
  bool isUpcoming(DateTime now) {
    final status = rawData['Status']?.toString();
    if (status == 'Cancelled' || status == 'Completed' || status == 'Error') {
      return false;
    }
    final end = endDate;
    return end == null || end.isAfter(now);
  }
}

enum RecordingsState { loading, ready, error }

class RecordingsViewModel extends ChangeNotifier {
  final MediaServerClient _client;

  RecordingsViewModel(this._client);

  ImageApi get imageApi => _client.imageApi;

  RecordingsState _state = RecordingsState.loading;
  RecordingsState get state => _state;

  List<RecordingItem> _recentRecordings = const [];
  List<RecordingItem> get recentRecordings => _recentRecordings;

  List<RecordingItem> _seriesRecordings = const [];
  List<RecordingItem> get seriesRecordings => _seriesRecordings;

  List<RecordingItem> _movieRecordings = const [];
  List<RecordingItem> get movieRecordings => _movieRecordings;

  List<RecordingItem> _sportsRecordings = const [];
  List<RecordingItem> get sportsRecordings => _sportsRecordings;

  List<RecordingItem> _kidsRecordings = const [];
  List<RecordingItem> get kidsRecordings => _kidsRecordings;

  List<RecordingItem> _scheduledNext24h = const [];
  List<RecordingItem> get scheduledNext24h => _scheduledNext24h;

  RecordingItem? _focusedItem;
  RecordingItem? get focusedItem => _focusedItem;

  void setFocusedItem(RecordingItem item) {
    _focusedItem = item;
    notifyListeners();
  }

  Future<void> load() async {
    _state = RecordingsState.loading;
    notifyListeners();

    try {
      final recordingsFuture = Future.wait([
        _fetchRecordings(limit: 40),
        _fetchRecordings(isSeries: true),
        _fetchRecordings(isMovie: true),
        _fetchRecordings(isSports: true),
        _fetchRecordings(isKids: true),
      ]);
      final timersFuture = _loadScheduledTimers();

      final results = await recordingsFuture;
      await timersFuture;

      _recentRecordings = results[0];
      _seriesRecordings = results[1];
      _movieRecordings = results[2];
      _sportsRecordings = results[3];
      _kidsRecordings = results[4];
      _state = RecordingsState.ready;
    } catch (_) {
      _state = RecordingsState.error;
    }
    notifyListeners();
  }

  Future<List<RecordingItem>> _fetchRecordings({
    int limit = 60,
    bool? isSeries,
    bool? isMovie,
    bool? isSports,
    bool? isKids,
  }) async {
    try {
      final response = await _client.liveTvApi.getRecordings(
        limit: limit,
        fields: 'ImageTags,Overview',
        enableImages: true,
        isSeries: isSeries,
        isMovie: isMovie,
        isSports: isSports,
        isKids: isKids,
      );
      return _parseRecordings(response);
    } catch (_) {
      return const [];
    }
  }

  /// Re-reads only the Scheduled in Next 24 Hours row, after a timer changed.
  Future<void> refreshScheduled() async {
    await _loadScheduledTimers();
    notifyListeners();
  }

  Future<void> _loadScheduledTimers() async {
    try {
      final response = await _client.liveTvApi.getTimers();
      final items = (response['Items'] as List?) ?? [];
      final now = DateTime.now();
      final next24h = now.add(const Duration(days: 1));

      _scheduledNext24h = items
          .cast<Map<String, dynamic>>()
          .map((json) => TimerItem.fromJson(json))
          .where(
            (t) =>
                t.startDate != null &&
                t.startDate!.isBefore(next24h) &&
                t.isUpcoming(now),
          )
          .map(RecordingItem.fromTimer)
          .toList();
    } catch (_) {}
  }

  List<RecordingItem> _parseRecordings(Map<String, dynamic> response) {
    final items = (response['Items'] as List?) ?? [];
    return items
        .cast<Map<String, dynamic>>()
        .map((json) => RecordingItem.fromJson(json))
        .toList();
  }
}
