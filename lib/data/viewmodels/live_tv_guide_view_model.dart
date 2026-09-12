import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';

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
  final bool hasSeriesTimer;
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
    this.hasSeriesTimer = false,
    required this.rawData,
  });

  Duration get duration => endDate.difference(startDate);

  /// The broadcast classification (`TV-G`, `TV-14`, ...) when the guide data
  /// carries one.
  String? get officialRating => rawData['OfficialRating'] as String?;

  /// The programme's categories in a fixed order, as the same [GuideFilter]
  /// values the guide's filter chips label, so callers localise them once.
  List<GuideFilter> get categoryTags => [
    if (isMovie) GuideFilter.movies,
    if (isSeries) GuideFilter.series,
    if (isSports) GuideFilter.sports,
    if (isNews) GuideFilter.news,
    if (isKids) GuideFilter.kids,
    if (isPremiere) GuideFilter.premiere,
  ];

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

/// Per-channel program fetch state, distinct from the guide-wide [GuideState].
enum GuideChannelLoadState { loaded, loading, failed }

class LiveTvGuideViewModel extends ChangeNotifier {
  final MediaServerClient _client;
  bool _disposed = false;

  // The smallest responsive guide span; wider landscape surfaces replace it
  // through setWindow after GuideLayoutProfile measures their available area.
  static const _defaultGuideWindow = Duration(minutes: 150);
  // Programs only need the synopsis; channel logos come from the separate
  // /LiveTv/Channels fetch, so we don't request ImageTags here. OfficialRating
  // needs no entry: it is not an ItemFields value and the server returns it
  // unconditionally.
  static const _fields = 'Overview';

  // Programs are loaded lazily in batches of this many channels as the guide is
  // scrolled, instead of one giant all-channels request (issue #666 timeout).
  static const _programBatchSize = 50;

  Duration _guideWindow = _defaultGuideWindow;
  Duration get guideWindow => _guideWindow;

  // How many of [_channels] (in order) have had their programs requested.
  int _programsHighWater = 0;

  // Every channel id whose programs have been fetched (ordered scroll batches
  // plus any ensured-loaded set like favorites), so rows can show a placeholder
  // until their programs arrive.
  final Set<String> _programsLoadedIds = <String>{};

  bool _loadingMore = false;

  // Category filters walk the lineup in larger server-filtered batches so a
  // sparse genre can surface channels beyond the first All-view page.
  static const _categoryBatchSize = 200;
  static const _categoryMinRowsPerPage = 24;
  static const _serverFilteredCategories = {
    GuideFilter.movies,
    GuideFilter.series,
    GuideFilter.sports,
    GuideFilter.news,
    GuideFilter.kids,
  };
  final Map<String, List<GuideProgram>> _categoryPrograms = {};
  int _categoryHighWater = 0;
  final Set<String> _categoryQueriedIds = <String>{};
  GuideFilter? _categoryLoadedFor;
  int _categoryRequest = 0;
  bool _categoryFetchInFlight = false;

  // Bumped by every targeted replacement and by every cache reset, so a reply
  // whose window or channel set has since been superseded can be dropped.
  int _programGeneration = 0;
  int _loadGeneration = 0;
  bool _reloadOnEntry = false;
  bool _atLivePosition = true;

  bool get atLivePosition => _atLivePosition;

  /// True while more channels remain to lazily load in scroll order.
  bool get hasMorePrograms => _isCategory(_filter)
      ? _categoryHighWater < _channels.length
      : _programsHighWater < _channels.length;

  /// How many channels (in list order) have been requested so far.
  int get programsHighWater =>
      _isCategory(_filter) ? _categoryPrograms.length : _programsHighWater;

  /// The fetch state for a single channel's programs. Programs are fetched in
  /// batches whose failure surfaces as the guide-wide [GuideState.error], so
  /// this never reports [GuideChannelLoadState.failed] today.
  GuideChannelLoadState loadStateFor(String channelId) =>
      (_isCategory(_filter)
          ? _categoryPrograms.containsKey(channelId)
          : _programsLoadedIds.contains(channelId))
      ? GuideChannelLoadState.loaded
      : GuideChannelLoadState.loading;

  bool hasProgramsFor(String channelId) => _isCategory(_filter)
      ? _categoryPrograms.containsKey(channelId)
      : _programsLoadedIds.contains(channelId);

  LiveTvGuideViewModel(
    this._client, {
    ChannelSortBy? initialSortBy,
    DateTime Function()? now,
  }) : _sortBy = initialSortBy ?? _savedSortBy(),
       _now = now ?? DateTime.now,
       _guideDate = (now ?? DateTime.now)(),
       _windowStart = (now ?? DateTime.now)(),
       _windowEnd = (now ?? DateTime.now)();

  /// Clock the boundary refresh reads, injectable so tests can advance it.
  final DateTime Function() _now;

  /// The guide's order depends on the active sort, so a caller that passes none
  /// still starts from the saved preference.
  static ChannelSortBy _savedSortBy() =>
      GetIt.instance.isRegistered<UserPreferences>()
      ? GetIt.instance<UserPreferences>().get(
          UserPreferences.liveTvChannelSortBy,
        )
      : ChannelSortBy.number;

  ChannelSortBy _sortBy;
  ChannelSortBy get sortBy => _sortBy;

  void setSortBy(ChannelSortBy value) {
    if (_sortBy == value) return;
    _programGeneration++;
    _sortBy = value;
    _channels = List<GuideChannel>.from(_channels)..sort(comparatorFor(value));
    // The lazy-load prefix follows list order, so walk it again from the top.
    // Already-fetched channels are skipped in _loadNextBatch.
    _programsHighWater = 0;
    _categoryHighWater = 0;
    _categoryRequest++;
    _notifyListeners();
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

  // Seeded from the injected clock in the constructor, so the initial value
  // is testable rather than tied to the real wall clock.
  DateTime _guideDate;
  DateTime get guideDate => _guideDate;

  DateTime _windowStart;
  DateTime get windowStart => _windowStart;

  DateTime _windowEnd;
  DateTime get windowEnd => _windowEnd;

  List<GuideChannel> get filteredChannels {
    if (_filter == GuideFilter.all) return _channels;
    if (_filter == GuideFilter.favorites) {
      return _channels.where((ch) => ch.isFavorite).toList();
    }
    if (_categoryLoadedFor != _filter) return const [];
    return _channels
        .where((ch) => _categoryPrograms.containsKey(ch.id))
        .toList();
  }

  List<GuideProgram> programsForChannel(String channelId) {
    if (_isCategory(_filter)) return _categoryPrograms[channelId] ?? const [];
    final all = _programsByChannel[channelId] ?? [];
    if (_filter == GuideFilter.all || _filter == GuideFilter.favorites) {
      return all;
    }
    return all.where(_matchesFilter).toList();
  }

  /// The raw cached programs for a channel, unfiltered, so a hole can be told
  /// apart as filtered rather than missing.
  List<GuideProgram> unfilteredProgramsForChannel(String channelId) =>
      _programsByChannel[channelId] ?? const [];

  GuideChannel? channelForId(String channelId) {
    for (final channel in _channels) {
      if (channel.id == channelId) return channel;
    }
    return null;
  }

  /// The currently-airing program and the next upcoming one for a channel,
  /// for the mobile Now/Next cards. Derived from the sorted program list.
  ({GuideProgram? now, GuideProgram? next}) nowNextForChannel(
    String channelId,
  ) {
    final programs = programsForChannel(channelId);
    final t = _now();
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

  static bool _isCategory(GuideFilter filter) =>
      filter != GuideFilter.all && filter != GuideFilter.favorites;

  static bool _matches(GuideFilter filter, GuideProgram p) => switch (filter) {
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

    _applyChannelUpdate(updated);

    try {
      if (next) {
        await _client.userLibraryApi.markFavorite(channelId);
      } else {
        await _client.userLibraryApi.unmarkFavorite(channelId);
      }
    } catch (_) {
      _applyChannelUpdate(current);
      rethrow;
    }
  }

  /// Only the favorites-first comparator reads [GuideChannel.isFavorite], so a
  /// toggle under any other sort leaves the lineup where the viewer left it.
  bool get _sortReadsFavorite => _sortBy == ChannelSortBy.favoritesFirst;

  /// Replaces one channel by id and re-sorts when the active sort depends on
  /// what changed. Selection is resolved by id by the screen, so it survives.
  void _applyChannelUpdate(GuideChannel updated) {
    final channels = List<GuideChannel>.from(_channels);
    final at = channels.indexWhere((c) => c.id == updated.id);
    if (at < 0) return;
    channels[at] = updated;
    final resort = _sortReadsFavorite;
    if (resort) {
      channels.sort(comparatorFor(_sortBy));
      // The lazy-load prefix follows list order, so walk it again from the top.
      // Already-fetched channels are skipped in _loadNextBatch.
      _programsHighWater = 0;
    }
    _channels = channels;
    _notifyListeners();
    if (resort) unawaited(loadMorePrograms());
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

  /// Records every showing of this program's series, or drops the rule if one
  /// is already in place.
  Future<void> toggleSeriesRecording(GuideProgram program) async {
    if (program.hasSeriesTimer) {
      final seriesTimerId = program.rawData['SeriesTimerId']?.toString();
      if (seriesTimerId == null || seriesTimerId.isEmpty) {
        throw StateError(
          'SeriesTimerId missing for scheduled series ${program.id}',
        );
      }
      await _client.liveTvApi.cancelSeriesTimer(seriesTimerId);
    } else {
      await _client.liveTvApi.createSeriesTimer(program.id);
    }
    await _reloadPrograms();
  }

  Future<void> load({
    Duration? window,
    List<String>? initialChannelIds,
    DateTime? windowStart,
    bool livePosition = true,
  }) async {
    final loadGeneration = ++_loadGeneration;
    if (window != null) _guideWindow = window;
    _state = GuideState.loading;
    _notifyListeners();

    try {
      if (!await _fetchChannels(loadGeneration)) return;

      _windowStart =
          windowStart ??
          DateTime(
            _guideDate.year,
            _guideDate.month,
            _guideDate.day,
            _now().hour,
          );
      _windowEnd = _windowStart.add(_guideWindow);
      _atLivePosition = livePosition;

      if (initialChannelIds == null) {
        await loadInitialPrograms();
      } else {
        // A targeted open (the carousel) fetches only its neighbourhood; the
        // guide's default still walks the ordered batches.
        _resetPrograms();
        await ensureProgramsForChannels(initialChannelIds);
      }
      if (_isCategory(_filter)) await _walkCategory();
      if (_disposed || loadGeneration != _loadGeneration) return;
      _state = GuideState.ready;
      _reloadOnEntry = false;
    } catch (e) {
      if (_disposed || loadGeneration != _loadGeneration) return;
      _errorMessage = e.toString();
      _state = GuideState.error;
    }
    _notifyListeners();
  }

  void setFilter(GuideFilter value) {
    if (_filter == value) return;
    _filter = value;
    _categoryRequest++;
    if (_categoryFetchInFlight) {
      _categoryFetchInFlight = false;
      _state = GuideState.ready;
    }
    if (_isCategory(value) && _categoryLoadedFor != value) {
      unawaited(_loadCategoryPrograms());
      return;
    }
    _notifyListeners();
    // Favorites can sit anywhere in the lineup, past the lazily-loaded prefix,
    // so make sure their programs are fetched when that filter is selected.
    if (value == GuideFilter.favorites) {
      final favIds = _channels
          .where((c) => c.isFavorite)
          .map((c) => c.id)
          .toList();
      unawaited(ensureProgramsForChannels(favIds));
    }
  }

  Future<void> _loadCategoryPrograms() async {
    _resetCategory();
    final request = _categoryRequest;
    _categoryFetchInFlight = true;
    _state = GuideState.loading;
    _notifyListeners();
    try {
      await _walkCategory();
      if (request != _categoryRequest) return;
      _state = GuideState.ready;
    } catch (e) {
      if (request != _categoryRequest) return;
      _errorMessage = e.toString();
      _state = GuideState.error;
    }
    _categoryFetchInFlight = false;
    _notifyListeners();
  }

  Future<void> _walkCategory({int minHighWater = 0}) async {
    final request = _categoryRequest;
    final filter = _filter;
    _categoryLoadedFor = filter;
    final startRows = _categoryPrograms.length;
    while (_categoryHighWater < _channels.length &&
        (_categoryPrograms.length - startRows < _categoryMinRowsPerPage ||
            _categoryHighWater < minHighWater)) {
      final size = _serverFilteredCategories.contains(filter)
          ? _categoryBatchSize
          : _programBatchSize;
      final end = min(_categoryHighWater + size, _channels.length);
      final batch = _channels
          .sublist(_categoryHighWater, end)
          .where((c) => !_categoryQueriedIds.contains(c.id))
          .toList();
      final fetched = await _fetchPrograms(batch, category: filter);
      if (request != _categoryRequest) return;
      _categoryQueriedIds.addAll(batch.map((c) => c.id));
      _categoryHighWater = end;
      if (fetched.isEmpty) continue;
      _categoryPrograms.addAll(fetched);
      _notifyListeners();
    }
  }

  void _resetCategory() {
    _categoryPrograms.clear();
    _categoryQueriedIds.clear();
    _categoryHighWater = 0;
    _categoryLoadedFor = null;
    _categoryRequest++;
  }

  Future<void> setDate(DateTime date) async {
    _guideDate = date;
    _windowStart = DateTime(date.year, date.month, date.day, _windowStart.hour);
    _windowEnd = _windowStart.add(_guideWindow);
    _atLivePosition = false;
    await _reloadPrograms();
  }

  Future<void> shiftWindow(Duration amount) async {
    _windowStart = _windowStart.add(amount);
    _windowEnd = _windowStart.add(_guideWindow);
    _guideDate = _windowStart;
    _atLivePosition = false;
    await _reloadPrograms();
  }

  /// Moves the time window without entering the guide-wide loading state.
  /// Existing rows stay visible until every requested replacement is ready.
  Future<void> setWindowStart(
    DateTime start, {
    bool livePosition = false,
  }) async {
    if (_disposed) return;
    if (start == _windowStart) {
      _atLivePosition = livePosition;
      return;
    }

    final ids = _programsLoadedIds.toList();
    final generation = ++_programGeneration;
    _windowStart = start;
    _windowEnd = start.add(_guideWindow);
    _guideDate = start;
    _atLivePosition = livePosition;
    _notifyListeners();
    if (ids.isEmpty) return;

    final replacements = <String, List<GuideProgram>>{};
    for (var i = 0; i < ids.length; i += _programBatchSize) {
      final chunk = ids.sublist(i, min(i + _programBatchSize, ids.length));
      final response = await _fetchGuide(
        channelIds: chunk,
        from: _windowStart,
        to: _windowEnd,
      );
      if (_disposed || generation != _programGeneration) return;
      final parsed = _parsePrograms(response);
      for (final id in chunk) {
        replacements[id] = parsed[id] ?? <GuideProgram>[];
      }
    }

    if (_disposed || generation != _programGeneration) return;
    _programsByChannel.addAll(replacements);
    _processedBoundaries.clear();
    _notifyListeners();
  }

  Future<void> setWindow(Duration window) async {
    if (window == _guideWindow) return;
    _guideWindow = window;
    _windowEnd = _windowStart.add(_guideWindow);
    await _reloadPrograms();
  }

  Future<void> _reloadPrograms() async {
    final loadGeneration = ++_loadGeneration;
    _state = GuideState.loading;
    _notifyListeners();

    try {
      // Re-fetch as many channels as were already loaded (at least the first
      // batch) so the user keeps the rows they had scrolled to.
      final target = max(_programsHighWater, _programBatchSize);
      final categoryTarget = _categoryHighWater;
      _resetPrograms();
      if (_isCategory(_filter)) {
        await _walkCategory(minHighWater: categoryTarget);
      } else {
        while (_programsHighWater < target && hasMorePrograms) {
          await _loadNextBatch();
          if (_disposed || loadGeneration != _loadGeneration) return;
        }
      }
      if (_disposed || loadGeneration != _loadGeneration) return;
      _state = GuideState.ready;
    } catch (e) {
      if (_disposed || loadGeneration != _loadGeneration) return;
      _errorMessage = e.toString();
      _state = GuideState.error;
    }
    _notifyListeners();
  }

  Future<void> goToNow({DateTime? windowStart}) async {
    _guideDate = _now();
    await load(
      window: _guideWindow,
      windowStart: windowStart,
      livePosition: true,
    );
  }

  /// Call when the guide becomes visible. A window left open past 30 minutes
  /// stale forces a full reload; this is the one re-entry path where that is
  /// still correct, since background refresh elsewhere avoids it.
  Future<void> reloadIfStale({Duration? window, DateTime? windowStart}) async {
    if (_reloadOnEntry ||
        _windowStart.add(const Duration(minutes: 30)).isBefore(_now())) {
      _guideDate = _now();
      await load(window: window, windowStart: windowStart, livePosition: true);
    }
  }

  /// Call when the guide is left after paging the window ahead or to another
  /// date, so the next entry starts live instead of wherever it wandered to.
  void resetWindowOnExit({DateTime? windowStart}) {
    final now = _now();
    final nextStart =
        windowStart ?? DateTime(now.year, now.month, now.day, now.hour);
    if (_windowStart != nextStart) _reloadOnEntry = true;
    _guideDate = now;
    _windowStart = nextStart;
    _windowEnd = _windowStart.add(_guideWindow);
    _atLivePosition = true;
  }

  Future<bool> _fetchChannels(int loadGeneration) async {
    final response = await _client.liveTvApi.getChannels(
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      fields: 'ImageTags,UserData',
      enableTotalRecordCount: false,
      userId: _client.userId,
    );
    if (_disposed || loadGeneration != _loadGeneration) return false;
    final items = (response['Items'] as List?) ?? [];
    _channels =
        items
            .cast<Map<String, dynamic>>()
            .map(GuideChannel.fromRawItem)
            .toList()
          ..sort(comparatorFor(_sortBy));
    return true;
  }

  void _resetPrograms() {
    _programGeneration++;
    _programsByChannel.clear();
    _programsLoadedIds.clear();
    _programsHighWater = 0;
    _processedBoundaries.clear();
    _resetCategory();
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
    final generation = _programGeneration;
    _loadingMore = true;
    try {
      if (_isCategory(_filter)) {
        await _walkCategory();
      } else {
        await _loadNextBatch();
      }
    } finally {
      _loadingMore = false;
      // A reload owns the first batch until the guide is ready.
      if (!_disposed &&
          _state == GuideState.ready &&
          generation != _programGeneration &&
          hasMorePrograms) {
        unawaited(loadMorePrograms());
      }
    }
    _notifyListeners();
  }

  Future<void> _loadNextBatch() async {
    if (_programsHighWater >= _channels.length) return;
    final end = min(_programsHighWater + _programBatchSize, _channels.length);
    // A re-sort can move already-fetched channels back into the unwalked
    // suffix. Fetching them again would append duplicate programs.
    final batch = _channels
        .sublist(_programsHighWater, end)
        .where((c) => !_programsLoadedIds.contains(c.id))
        .toList();
    if (await _loadProgramsBatch(batch)) {
      _programsHighWater = end;
    }
  }

  /// Ensures the given channels' programs are fetched even if they sit past the
  /// scroll high-water mark (e.g. favorites). Loads only the missing ones.
  Future<void> ensureProgramsForChannels(List<String> channelIds) async {
    final missing = channelIds
        .where((id) => !_programsLoadedIds.contains(id))
        .toList();
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
      if (!await _loadProgramsBatch(chunk)) return;
    }
    _notifyListeners();
  }

  /// Replaces the cached programs for [channelIds] over an explicit [from]-[to]
  /// range. The range is decoupled from the guide viewport so a refresh can
  /// extend coverage past it, and no guide-wide loading state is entered, so
  /// every other row keeps rendering and selection (held by id) survives.
  Future<void> replacePrograms({
    required List<String> channelIds,
    required DateTime from,
    required DateTime to,
  }) async {
    if (channelIds.isEmpty) return;
    final ids = List<String>.from(channelIds);
    final generation = ++_programGeneration;

    final response = await _fetchGuide(channelIds: ids, from: from, to: to);
    // A later replacement or any cache reset supersedes this reply.
    if (generation != _programGeneration) return;

    final parsed = _parsePrograms(response);
    for (final id in ids) {
      _programsByChannel[id] = parsed[id] ?? <GuideProgram>[];
    }
    _programsLoadedIds.addAll(ids);
    _notifyListeners();
  }

  // --- Next-future-boundary refresh -----------------------------------------

  /// Delay before retrying when the server returned nothing beyond the coverage
  /// already held; without it that case retries immediately and spins.
  @visibleForTesting
  static const noNewCoverageRetry = Duration(minutes: 5);

  /// Backoff after a failed refresh request.
  @visibleForTesting
  static const failureBackoff = Duration(minutes: 1);

  Timer? _boundaryTimer;
  DateTime? _boundaryDueAt;
  bool _boundaryRefreshInFlight = false;

  // Boundaries already handled, so one can never be selected twice.
  final Set<DateTime> _processedBoundaries = <DateTime>{};

  /// When the armed refresh will run, or null when nothing is scheduled.
  @visibleForTesting
  DateTime? get boundaryDueAt => _boundaryDueAt;

  /// The earliest cached program end that is after now and unprocessed.
  @visibleForTesting
  DateTime? get nextBoundaryAt => _nextBoundary(_now());

  /// Arms a one-shot refresh on the next unprocessed future program boundary.
  ///
  /// This view model is not a lifecycle observer: the surface that owns it must
  /// call this again on app resume, because timers do not fire while suspended.
  void scheduleBoundaryRefresh() {
    if (_disposed) return;
    _boundaryTimer?.cancel();
    _boundaryTimer = null;
    final now = _now();
    _processedBoundaries.removeWhere(
      (b) => b.isBefore(now.subtract(const Duration(hours: 1))),
    );

    // The armed boundary has passed without firing (suspension, or data that
    // was already expired): refresh once now rather than scheduling in the past.
    final due = _boundaryDueAt;
    if (due != null && !due.isAfter(now)) {
      _boundaryDueAt = null;
      unawaited(handleBoundaryElapsed());
      return;
    }
    _boundaryDueAt = null;

    final next = _nextBoundary(now);
    if (next == null) {
      // A non-empty schedule with no future boundary is already stale. An
      // actually empty schedule has nothing to refresh and falls back to the
      // surface's quarter-hour tick.
      if (_boundaries().isNotEmpty) unawaited(handleBoundaryElapsed());
      return;
    }
    _arm(next.difference(now), next);
  }

  /// Gives an empty or exhausted schedule its quarter-hour fallback refresh.
  /// A real boundary or retry timer already in flight remains authoritative.
  Future<void> refreshAtQuarterHour() async {
    if (_disposed || _boundaryDueAt != null || _boundaryRefreshInFlight) return;
    await handleBoundaryElapsed(forceRefresh: true);
  }

  /// Stops the boundary refresh; call when the surface is torn down.
  void cancelBoundaryRefresh() {
    _boundaryTimer?.cancel();
    _boundaryTimer = null;
    _boundaryDueAt = null;
  }

  @override
  void dispose() {
    _disposed = true;
    _programGeneration++;
    _loadGeneration++;
    cancelBoundaryRefresh();
    super.dispose();
  }

  void _arm(Duration delay, DateTime dueAt) {
    if (_disposed) return;
    _boundaryDueAt = dueAt;
    _boundaryTimer = Timer(delay, () => unawaited(handleBoundaryElapsed()));
  }

  void _armRetry(Duration delay) => _arm(delay, _now().add(delay));

  /// Runs the boundary refresh: promote from cache where the schedule already
  /// covers the new time, request only where coverage must be extended.
  @visibleForTesting
  Future<void> handleBoundaryElapsed({bool forceRefresh = false}) async {
    if (_disposed || _boundaryRefreshInFlight) return;
    _boundaryRefreshInFlight = true;
    _boundaryTimer?.cancel();
    _boundaryTimer = null;
    _boundaryDueAt = null;

    final now = _now();
    for (final boundary in _boundaries()) {
      if (!boundary.isAfter(now)) _processedBoundaries.add(boundary);
    }

    if (!forceRefresh && !_coverageLapsed(now)) {
      // The next program is already cached, so the cells promote in place.
      _boundaryRefreshInFlight = false;
      _notifyListeners();
      scheduleBoundaryRefresh();
      return;
    }

    final before = _coverageEnd();
    try {
      await _refreshLoadedChannels(now);
      if (_disposed) {
        _boundaryRefreshInFlight = false;
        return;
      }
    } catch (_) {
      // Keep the data we hold; a failed refresh must not blank the guide.
      _boundaryRefreshInFlight = false;
      _armRetry(failureBackoff);
      return;
    }

    final after = _coverageEnd();
    if (after == null || (before != null && !after.isAfter(before))) {
      _boundaryRefreshInFlight = false;
      _armRetry(noNewCoverageRetry);
      return;
    }
    _boundaryRefreshInFlight = false;
    scheduleBoundaryRefresh();
  }

  /// Replaces every cached channel over a range that spans the guide viewport,
  /// in batches, so no surface's coverage can shrink to a rolling horizon.
  Future<void> _refreshLoadedChannels(DateTime now) async {
    final ids = _programsLoadedIds.toList();
    if (ids.isEmpty) return;
    final from = _windowStart.isBefore(now) ? _windowStart : now;
    final rolling = now.add(_guideWindow);
    final to = rolling.isAfter(_windowEnd) ? rolling : _windowEnd;

    for (var i = 0; i < ids.length; i += _programBatchSize) {
      await replacePrograms(
        channelIds: ids.sublist(i, min(i + _programBatchSize, ids.length)),
        from: from,
        to: to,
      );
    }
  }

  Iterable<DateTime> _boundaries() =>
      _programsByChannel.values.expand((ps) => ps.map((p) => p.endDate));

  DateTime? _nextBoundary(DateTime now) {
    DateTime? next;
    for (final boundary in _boundaries()) {
      if (!boundary.isAfter(now)) continue;
      if (_processedBoundaries.contains(boundary)) continue;
      if (next == null || boundary.isBefore(next)) next = boundary;
    }
    return next;
  }

  /// The latest program end held for any channel.
  DateTime? _coverageEnd() {
    DateTime? end;
    for (final boundary in _boundaries()) {
      if (end == null || boundary.isAfter(end)) end = boundary;
    }
    return end;
  }

  /// True when some channel with cached programs has run out of them, which is
  /// the only case a local promotion cannot cover.
  bool _coverageLapsed(DateTime now) {
    for (final programs in _programsByChannel.values) {
      if (programs.isEmpty) continue;
      final end = programs
          .map((p) => p.endDate)
          .reduce((a, b) => a.isAfter(b) ? a : b);
      if (!end.isAfter(now)) return true;
    }
    return false;
  }

  /// Requests the guide for one set of channels over one range, with
  /// images/user-data disabled to keep the payload small.
  Future<Map<String, dynamic>> _fetchGuide({
    required List<String> channelIds,
    required DateTime from,
    required DateTime to,
    GuideFilter? category,
  }) => _client.liveTvApi.getGuide(
    startDate: from,
    endDate: to,
    channelIds: channelIds,
    isMovie: category == GuideFilter.movies ? true : null,
    isSeries: category == GuideFilter.series ? true : null,
    isSports: category == GuideFilter.sports ? true : null,
    isNews: category == GuideFilter.news ? true : null,
    isKids: category == GuideFilter.kids ? true : null,
    fields: _fields,
    enableTotalRecordCount: false,
    enableImages: false,
    enableUserData: false,
    userId: _client.userId,
  );

  Future<Map<String, List<GuideProgram>>> _fetchPrograms(
    List<GuideChannel> batch, {
    GuideFilter? category,
  }) async {
    if (batch.isEmpty) return {};
    final response = await _fetchGuide(
      channelIds: batch.map((c) => c.id).toList(),
      from: _windowStart,
      to: _windowEnd,
      category: category,
    );
    final byChannel = _parsePrograms(response);
    if (category != null) {
      byChannel.removeWhere((_, programs) {
        programs.removeWhere((p) => !_matches(category, p));
        return programs.isEmpty;
      });
    }
    return byChannel;
  }

  /// Parses a guide response into start-ordered programs keyed by channel id.
  Map<String, List<GuideProgram>> _parsePrograms(
    Map<String, dynamic> response,
  ) {
    final items = (response['Items'] as List?) ?? [];
    final byChannel = <String, List<GuideProgram>>{};
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
        hasSeriesTimer: raw['SeriesTimerId'] != null,
        rawData: raw,
      );

      (byChannel[channelId] ??= <GuideProgram>[]).add(program);
    }

    for (final programs in byChannel.values) {
      programs.sort((a, b) => a.startDate.compareTo(b.startDate));
    }
    return byChannel;
  }

  /// Fetches programs for one batch of channels over the current window and
  /// merges them into the cache.
  Future<bool> _loadProgramsBatch(List<GuideChannel> batch) async {
    if (batch.isEmpty) return true;
    final generation = _programGeneration;
    final ids = batch.map((c) => c.id).toList();
    final response = await _fetchGuide(
      channelIds: ids,
      from: _windowStart,
      to: _windowEnd,
    );
    if (_disposed || generation != _programGeneration) return false;

    final parsed = _parsePrograms(response);
    for (final id in ids) {
      final programs = parsed[id] ?? <GuideProgram>[];
      final existing = _programsByChannel[id];
      if (existing == null) {
        _programsByChannel[id] = programs;
      } else {
        existing
          ..addAll(programs)
          ..sort((a, b) => a.startDate.compareTo(b.startDate));
      }
    }

    // Mark every requested channel as loaded, even those with no programs, so
    // their rows stop showing the placeholder.
    _programsLoadedIds.addAll(ids);
    return true;
  }

  void _notifyListeners() {
    if (!_disposed) notifyListeners();
  }
}
