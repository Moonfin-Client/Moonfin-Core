import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../preference/preference_constants.dart';

class GuideChannel {
  final String id;
  final String name;
  final String? number;
  final String? imageTag;
  final bool isFavorite;
  final Map<String, dynamic> rawData;

  const GuideChannel({
    required this.id,
    required this.name,
    this.number,
    this.imageTag,
    this.isFavorite = false,
    required this.rawData,
  });

  factory GuideChannel.fromRawItem(Map<String, dynamic> raw) => GuideChannel(
        id: raw['Id']?.toString() ?? '',
        name: raw['Name'] as String? ?? '',
        number: raw['ChannelNumber'] as String?,
        imageTag: (raw['ImageTags'] as Map?)?['Primary'] as String?,
        isFavorite: ((raw['UserData'] as Map?)?['IsFavorite'] == true),
        rawData: raw,
      );
}

class GuideProgram {
  final String id;
  final String channelId;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String? overview;
  final String? episodeTitle;
  final bool isMovie;
  final bool isSeries;
  final bool isSports;
  final bool isNews;
  final bool isKids;
  final bool isPremiere;
  final bool hasTimer;
  final Map<String, dynamic> rawData;

  const GuideProgram({
    required this.id,
    required this.channelId,
    required this.name,
    required this.startDate,
    required this.endDate,
    this.overview,
    this.episodeTitle,
    this.isMovie = false,
    this.isSeries = false,
    this.isSports = false,
    this.isNews = false,
    this.isKids = false,
    this.isPremiere = false,
    this.hasTimer = false,
    required this.rawData,
  });

  Duration get duration => endDate.difference(startDate);

  bool get isLive {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  double progressAt(DateTime now) {
    if (now.isBefore(startDate)) return 0;
    if (now.isAfter(endDate)) return 1;
    return now.difference(startDate).inSeconds / duration.inSeconds;
  }
}

enum GuideFilter {
  all,
  movies,
  series,
  sports,
  news,
  kids,
  premiere,
  favorites,
}

enum GuideState { loading, ready, error }

class LiveTvGuideViewModel extends ChangeNotifier {
  final MediaServerClient _client;

  static const _defaultGuideWindowHours = 3;
  // Programs only need the synopsis; channel logos come from the separate
  // /LiveTv/Channels fetch, so we don't request ImageTags here.
  static const _fields = 'Overview';

  // Programs are loaded lazily in batches of this many channels as the guide is
  // scrolled, instead of one giant all-channels request (issue #666 timeout).
  static const _programBatchSize = 50;

  int _guideWindowHours = _defaultGuideWindowHours;
  int get guideWindowHours => _guideWindowHours;

  // How many of [_channels] (in order) have had their programs requested.
  int _programsHighWater = 0;

  // Every channel id whose programs have been fetched (ordered scroll batches
  // plus any ensured-loaded set like favorites), so rows can show a placeholder
  // until their programs arrive.
  final Set<String> _programsLoadedIds = <String>{};

  bool _loadingMore = false;

  /// True while more channels remain to lazily load in scroll order.
  bool get hasMorePrograms => _programsHighWater < _channels.length;

  /// How many channels (in list order) have been requested so far.
  int get programsHighWater => _programsHighWater;

  /// Whether a given channel's programs have been fetched yet.
  bool hasProgramsFor(String channelId) =>
      _programsLoadedIds.contains(channelId);

  LiveTvGuideViewModel(this._client, {ChannelSortBy? initialSortBy})
      : _sortBy = initialSortBy ?? ChannelSortBy.number;

  ChannelSortBy _sortBy;
  ChannelSortBy get sortBy => _sortBy;

  void setSortBy(ChannelSortBy value) {
    if (_sortBy == value) return;
    _sortBy = value;
    _channels = List<GuideChannel>.from(_channels)
      ..sort(comparatorFor(value));
    // The lazy-load prefix follows list order, so walk it again from the top.
    // Already-fetched channels are skipped in _loadNextBatch.
    _programsHighWater = 0;
    notifyListeners();
    unawaited(loadMorePrograms());
  }

  /// Shared with the single-channel player loader so zapping order always
  /// matches the guide.
  static Comparator<GuideChannel> comparatorFor(ChannelSortBy sortBy) {
    switch (sortBy) {
      case ChannelSortBy.number:
        return _compareByNumber;
      case ChannelSortBy.name:
        return _compareByName;
      case ChannelSortBy.favoritesFirst:
        return (a, b) {
          if (a.isFavorite != b.isFavorite) return a.isFavorite ? -1 : 1;
          return _compareByNumber(a, b);
        };
    }
  }

  static int _compareByName(GuideChannel a, GuideChannel b) =>
      a.name.toLowerCase().compareTo(b.name.toLowerCase());

  // Channel numbers are dot-separated segments ('10.10' airs after '10.2'),
  // so compare segment-wise as ints, not as a double.
  static int _compareByNumber(GuideChannel a, GuideChannel b) {
    final segsA = _numberSegments(a.number);
    final segsB = _numberSegments(b.number);
    if (segsA == null || segsB == null) {
      if (segsA != null) return -1;
      if (segsB != null) return 1;
      return _compareByName(a, b);
    }
    final len = max(segsA.length, segsB.length);
    for (var i = 0; i < len; i++) {
      final va = i < segsA.length ? segsA[i] : 0;
      final vb = i < segsB.length ? segsB[i] : 0;
      if (va != vb) return va.compareTo(vb);
    }
    return _compareByName(a, b);
  }

  static List<int>? _numberSegments(String? number) {
    if (number == null || number.trim().isEmpty) return null;
    final parts = number.trim().split('.');
    final segments = <int>[];
    for (final part in parts) {
      final value = int.tryParse(part);
      if (value == null) return null;
      segments.add(value);
    }
    return segments;
  }

  ImageApi get imageApi => _client.imageApi;

  GuideState _state = GuideState.loading;
  GuideState get state => _state;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<GuideChannel> _channels = const [];

  final Map<String, List<GuideProgram>> _programsByChannel = {};

  GuideFilter _filter = GuideFilter.all;
  GuideFilter get filter => _filter;

  DateTime _guideDate = DateTime.now();
  DateTime get guideDate => _guideDate;

  DateTime _windowStart = DateTime.now();
  DateTime get windowStart => _windowStart;

  DateTime _windowEnd = DateTime.now();
  DateTime get windowEnd => _windowEnd;

  List<GuideChannel> get filteredChannels {
    if (_filter == GuideFilter.all) return _channels;
    if (_filter == GuideFilter.favorites) {
      return _channels.where((ch) => ch.isFavorite).toList();
    }
    return _channels.where((ch) {
      final programs = _programsByChannel[ch.id] ?? [];
      return programs.any((p) => _matchesFilter(p));
    }).toList();
  }

  List<GuideProgram> programsForChannel(String channelId) {
    final all = _programsByChannel[channelId] ?? [];
    if (_filter == GuideFilter.all || _filter == GuideFilter.favorites) {
      return all;
    }
    return all.where(_matchesFilter).toList();
  }

  GuideChannel? channelForId(String channelId) {
    for (final channel in _channels) {
      if (channel.id == channelId) return channel;
    }
    return null;
  }

  /// The currently-airing program and the next upcoming one for a channel,
  /// for the mobile Now/Next cards. Derived from the sorted program list.
  ({GuideProgram? now, GuideProgram? next}) nowNextForChannel(String channelId) {
    final programs = programsForChannel(channelId);
    final t = DateTime.now();
    GuideProgram? now;
    GuideProgram? next;
    for (final p in programs) {
      if (!t.isBefore(p.startDate) && t.isBefore(p.endDate)) {
        now = p;
      } else if (p.startDate.isAfter(t)) {
        next ??= p;
      }
    }
    return (now: now, next: next);
  }

  bool _matchesFilter(GuideProgram p) => switch (_filter) {
    GuideFilter.all => true,
    GuideFilter.movies => p.isMovie,
    GuideFilter.series => p.isSeries,
    GuideFilter.sports => p.isSports,
    GuideFilter.news => p.isNews,
    GuideFilter.kids => p.isKids,
    GuideFilter.premiere => p.isPremiere,
    GuideFilter.favorites => true,
  };

  Future<void> toggleChannelFavorite(String channelId) async {
    final index = _channels.indexWhere((c) => c.id == channelId);
    if (index < 0) return;

    final current = _channels[index];
    final next = !current.isFavorite;

    final optimisticRaw = Map<String, dynamic>.from(current.rawData);
    final userData = Map<String, dynamic>.from(
      (optimisticRaw['UserData'] as Map?) ?? const <String, dynamic>{},
    );
    userData['IsFavorite'] = next;
    optimisticRaw['UserData'] = userData;

    final updated = GuideChannel(
      id: current.id,
      name: current.name,
      number: current.number,
      imageTag: current.imageTag,
      isFavorite: next,
      rawData: optimisticRaw,
    );

    final channels = List<GuideChannel>.from(_channels);
    channels[index] = updated;
    _channels = channels;
    notifyListeners();

    try {
      if (next) {
        await _client.userLibraryApi.markFavorite(channelId);
      } else {
        await _client.userLibraryApi.unmarkFavorite(channelId);
      }
    } catch (_) {
      final reverted = List<GuideChannel>.from(_channels);
      reverted[index] = current;
      _channels = reverted;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> toggleProgramRecording(GuideProgram program) async {
    if (program.hasTimer) {
      final timerId = program.rawData['TimerId']?.toString();
      if (timerId == null || timerId.isEmpty) {
        throw StateError('TimerId missing for scheduled program ${program.id}');
      }
      await _client.liveTvApi.cancelTimer(timerId);
    } else {
      await _client.liveTvApi.createTimer(program.id);
    }
    await _reloadPrograms();
  }

  Future<void> load({int? windowHours}) async {
    if (windowHours != null) _guideWindowHours = windowHours;
    _state = GuideState.loading;
    notifyListeners();

    try {
      await _fetchChannels();

      _windowStart = DateTime(
        _guideDate.year,
        _guideDate.month,
        _guideDate.day,
        DateTime.now().hour,
      );
      _windowEnd = _windowStart.add(Duration(hours: _guideWindowHours));

      await loadInitialPrograms();
      _state = GuideState.ready;
    } catch (e) {
      _errorMessage = e.toString();
      _state = GuideState.error;
    }
    notifyListeners();
  }

  void setFilter(GuideFilter value) {
    if (_filter == value) return;
    _filter = value;
    notifyListeners();
    // Favorites can sit anywhere in the lineup, past the lazily-loaded prefix,
    // so make sure their programs are fetched when that filter is selected.
    if (value == GuideFilter.favorites) {
      final favIds =
          _channels.where((c) => c.isFavorite).map((c) => c.id).toList();
      unawaited(ensureProgramsForChannels(favIds));
    }
  }

  Future<void> setDate(DateTime date) async {
    _guideDate = date;
    _windowStart = DateTime(date.year, date.month, date.day, _windowStart.hour);
    _windowEnd = _windowStart.add(Duration(hours: _guideWindowHours));
    await _reloadPrograms();
  }

  Future<void> shiftWindow(int hours) async {
    _windowStart = _windowStart.add(Duration(hours: hours));
    _windowEnd = _windowStart.add(Duration(hours: _guideWindowHours));
    _guideDate = _windowStart;
    await _reloadPrograms();
  }

  Future<void> setWindowHours(int hours) async {
    if (hours == _guideWindowHours) return;
    _guideWindowHours = hours;
    _windowEnd = _windowStart.add(Duration(hours: _guideWindowHours));
    await _reloadPrograms();
  }

  Future<void> _reloadPrograms() async {
    _state = GuideState.loading;
    notifyListeners();

    try {
      // Re-fetch as many channels as were already loaded (at least the first
      // batch) so the user keeps the rows they had scrolled to.
      final target = max(_programsHighWater, _programBatchSize);
      _resetPrograms();
      while (_programsHighWater < target && hasMorePrograms) {
        await _loadNextBatch();
      }
      _state = GuideState.ready;
    } catch (e) {
      _errorMessage = e.toString();
      _state = GuideState.error;
    }
    notifyListeners();
  }

  Future<void> goToNow() async {
    _guideDate = DateTime.now();
    await load(windowHours: _guideWindowHours);
  }

  Future<void> _fetchChannels() async {
    final response = await _client.liveTvApi.getChannels(
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      fields: 'ImageTags,UserData',
      enableTotalRecordCount: false,
      userId: _client.userId,
    );
    final items = (response['Items'] as List?) ?? [];
    _channels = items
        .cast<Map<String, dynamic>>()
        .map(GuideChannel.fromRawItem)
        .toList()
      ..sort(comparatorFor(_sortBy));
  }

  void _resetPrograms() {
    _programsByChannel.clear();
    _programsLoadedIds.clear();
    _programsHighWater = 0;
  }

  /// Clears any cached programs and loads the first batch of channels. Used on
  /// initial guide open and whenever the time window changes.
  Future<void> loadInitialPrograms() async {
    _resetPrograms();
    await _loadNextBatch();
  }

  /// Loads the next batch of channels (in list order) as the guide is scrolled
  /// toward the loaded edge. No-op once every channel has been requested.
  Future<void> loadMorePrograms() async {
    if (_loadingMore || !hasMorePrograms) return;
    _loadingMore = true;
    try {
      await _loadNextBatch();
    } finally {
      _loadingMore = false;
    }
    notifyListeners();
  }

  Future<void> _loadNextBatch() async {
    if (!hasMorePrograms) return;
    final end = min(_programsHighWater + _programBatchSize, _channels.length);
    // A re-sort can move already-fetched channels back into the unwalked
    // suffix. Fetching them again would append duplicate programs.
    final batch = _channels
        .sublist(_programsHighWater, end)
        .where((c) => !_programsLoadedIds.contains(c.id))
        .toList();
    await _loadProgramsBatch(batch);
    _programsHighWater = end;
  }

  /// Ensures the given channels' programs are fetched even if they sit past the
  /// scroll high-water mark (e.g. favorites). Loads only the missing ones.
  Future<void> ensureProgramsForChannels(List<String> channelIds) async {
    final missing =
        channelIds.where((id) => !_programsLoadedIds.contains(id)).toList();
    if (missing.isEmpty) return;
    for (var i = 0; i < missing.length; i += _programBatchSize) {
      final chunkIds = missing.sublist(
        i,
        min(i + _programBatchSize, missing.length),
      );
      final chunk = chunkIds
          .map(channelForId)
          .whereType<GuideChannel>()
          .toList();
      await _loadProgramsBatch(chunk);
    }
    notifyListeners();
  }

  /// Fetches programs for one batch of channels and merges them into the cache
  /// (with images/user-data disabled to keep the payload small).
  Future<void> _loadProgramsBatch(List<GuideChannel> batch) async {
    if (batch.isEmpty) return;
    final ids = batch.map((c) => c.id).toList();
    final response = await _client.liveTvApi.getGuide(
      startDate: _windowStart,
      endDate: _windowEnd,
      channelIds: ids,
      fields: _fields,
      enableTotalRecordCount: false,
      enableImages: false,
      enableUserData: false,
      userId: _client.userId,
    );

    final items = (response['Items'] as List?) ?? [];
    final touched = <String>{};
    for (final raw in items.cast<Map<String, dynamic>>()) {
      final channelId = raw['ChannelId']?.toString();
      if (channelId == null) continue;

      final startStr = raw['StartDate'] as String?;
      final endStr = raw['EndDate'] as String?;
      if (startStr == null || endStr == null) continue;

      final program = GuideProgram(
        id: raw['Id']?.toString() ?? '',
        channelId: channelId,
        name: raw['Name'] as String? ?? '',
        startDate: DateTime.parse(startStr).toLocal(),
        endDate: DateTime.parse(endStr).toLocal(),
        overview: raw['Overview'] as String?,
        episodeTitle: raw['EpisodeTitle'] as String?,
        isMovie: raw['IsMovie'] == true,
        isSeries: raw['IsSeries'] == true,
        isSports: raw['IsSports'] == true,
        isNews: raw['IsNews'] == true,
        isKids: raw['IsKids'] == true,
        isPremiere: raw['IsPremiere'] == true,
        hasTimer: raw['TimerId'] != null,
        rawData: raw,
      );

      (_programsByChannel[channelId] ??= <GuideProgram>[]).add(program);
      touched.add(channelId);
    }

    for (final id in touched) {
      _programsByChannel[id]!.sort((a, b) => a.startDate.compareTo(b.startDate));
    }

    // Mark every requested channel as loaded, even those with no programs, so
    // their rows stop showing the placeholder.
    _programsLoadedIds.addAll(ids);
  }
}
