import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../services/recording_owners_service.dart';

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

  List<RecordingItem> _myRecordings = const [];

  /// The current user's own finished recordings, newest first. Filled by
  /// [load] when given the user's ids, for the My Recordings row.
  List<RecordingItem> get myRecordings => _myRecordings;

  // The timers the Scheduled in Next 24 Hours row keeps, or null for all.
  Set<String>? _timerFilter;

  // Loads can overlap when the view is switched quickly, so only the newest
  // one fills the rows.
  int _loads = 0;

  RecordingItem? _focusedItem;
  RecordingItem? get focusedItem => _focusedItem;

  void setFocusedItem(RecordingItem item) {
    _focusedItem = item;
    notifyListeners();
  }

  /// Everyone's recordings. With [mine], the user's own recordings are read
  /// too, for [myRecordings].
  Future<void> load({MineIds? mine}) async {
    final load = ++_loads;
    _timerFilter = null;
    _state = RecordingsState.loading;
    notifyListeners();

    try {
      final myFuture = mine == null
          ? Future.value(const <RecordingItem>[])
          : _fetchOwnItems(mine.itemIds);
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
      final my = await myFuture;
      if (load != _loads) return;

      if (mine != null) _myRecordings = my;
      _recentRecordings = results[0];
      _seriesRecordings = results[1];
      _movieRecordings = results[2];
      _sportsRecordings = results[3];
      _kidsRecordings = results[4];
      _state = RecordingsState.ready;
    } catch (_) {
      if (load != _loads) return;
      _state = RecordingsState.error;
    }
    notifyListeners();
  }

  /// Reads only [myRecordings], alongside a [load] already under way.
  Future<void> loadMyRecordings(MineIds mine) async {
    final load = _loads;
    final my = await _fetchOwnItems(mine.itemIds);
    if (load != _loads) return;
    _myRecordings = my;
    notifyListeners();
  }

  /// Only the user's own recordings and timers, every one of them rather than
  /// a filtered page of everyone's, split into the same rows as [load].
  Future<void> loadMine(MineIds ids) async {
    final load = ++_loads;
    _timerFilter = {for (final id in ids.timerIds) _normalizeId(id)};
    _state = RecordingsState.loading;
    notifyListeners();

    try {
      final itemsFuture = _fetchOwnItems(ids.itemIds, rethrowErrors: true);
      final timersFuture = _loadScheduledTimers();
      final items = await itemsFuture;
      await timersFuture;
      if (load != _loads) return;

      bool flag(RecordingItem item, String key) => item.rawData[key] == true;
      bool hasGenre(RecordingItem item, Set<String> genres) {
        final value = item.rawData['Genres'];
        return value is List && value.any((g) => genres.contains('$g'));
      }

      // The server sorts its own rows the same way: an episode is a series
      // recording, a movie a movie, and sports and kids go by genre.
      _myRecordings = items;
      _recentRecordings = items;
      _seriesRecordings = items
          .where((i) => flag(i, 'IsSeries') || i.rawData['Type'] == 'Episode')
          .toList();
      _movieRecordings = items
          .where((i) => flag(i, 'IsMovie') || i.rawData['Type'] == 'Movie')
          .toList();
      _sportsRecordings = items
          .where((i) => flag(i, 'IsSports') || hasGenre(i, const {'Sports'}))
          .toList();
      _kidsRecordings = items
          .where(
            (i) =>
                flag(i, 'IsKids') ||
                hasGenre(i, const {'Kids', 'Children', 'Family'}),
          )
          .toList();
      _state = RecordingsState.ready;
    } catch (_) {
      if (load != _loads) return;
      _state = RecordingsState.error;
    }
    notifyListeners();
  }

  static String _normalizeId(String id) => id.replaceAll('-', '').toLowerCase();

  // How many ids go in one request, so the query string stays short, and
  // how many of those requests run at once.
  static const _idsPerRequest = 50;
  static const _requestsInFlight = 4;

  /// Every item of [ids] the server still has, newest first.
  Future<List<RecordingItem>> _fetchOwnItems(
    Set<String> ids, {
    bool rethrowErrors = false,
  }) async {
    if (ids.isEmpty) return const [];
    final all = ids.toList();
    try {
      final chunks = [
        for (var i = 0; i < all.length; i += _idsPerRequest)
          all.sublist(i, (i + _idsPerRequest).clamp(0, all.length)),
      ];
      final items = <RecordingItem>[];
      var next = 0;
      Future<void> worker() async {
        while (next < chunks.length) {
          final chunk = chunks[next++];
          final page = await _client.itemsApi.getItems(
            ids: chunk,
            fields: 'ImageTags,Overview,Genres,DateCreated',
            sortBy: 'DateCreated',
            sortOrder: 'Descending',
          );
          items.addAll(_parseRecordings(page));
        }
      }

      await Future.wait([
        for (var i = 0; i < _requestsInFlight && i < chunks.length; i++)
          worker(),
      ]);
      DateTime? created(RecordingItem item) =>
          parseServerDate(item.rawData['DateCreated']);
      items.sort((a, b) {
        final ca = created(a);
        final cb = created(b);
        if (ca == null || cb == null) {
          return ca == null ? (cb == null ? 0 : 1) : -1;
        }
        return cb.compareTo(ca);
      });
      return items;
    } catch (_) {
      if (rethrowErrors) rethrow;
      return const [];
    }
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
  /// In the user's own view, [mine] replaces the timers it keeps.
  Future<void> refreshScheduled({MineIds? mine}) async {
    if (mine != null && _timerFilter != null) {
      _timerFilter = {for (final id in mine.timerIds) _normalizeId(id)};
    }
    await _loadScheduledTimers();
    notifyListeners();
  }

  Future<void> _loadScheduledTimers() async {
    try {
      final response = await _client.liveTvApi.getTimers();
      final items = (response['Items'] as List?) ?? [];
      final now = DateTime.now();
      final next24h = now.add(const Duration(days: 1));
      final filter = _timerFilter;

      _scheduledNext24h = items
          .cast<Map<String, dynamic>>()
          .map((json) => TimerItem.fromJson(json))
          .where(
            (t) =>
                t.startDate != null &&
                t.startDate!.isBefore(next24h) &&
                t.isUpcoming(now) &&
                (filter == null || filter.contains(_normalizeId(t.id))),
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
