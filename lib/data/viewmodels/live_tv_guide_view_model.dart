import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/settings_save_retry.dart';
import '../repositories/item_mutation_repository.dart';
import '../services/user_data_sync.dart';
import '../models/live_tv_recording_state.dart';
import '../models/series_recording_episodes.dart';

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

  GuideChannel withSyncedUserData() {
    final synced = userDataSync.favoriteFor(id);
    if (synced == null || synced == isFavorite) return this;
    final current = rawData['UserData'];
    return GuideChannel(
      id: id,
      name: name,
      number: number,
      imageTag: imageTag,
      isFavorite: synced,
      rawData: {
        ...rawData,
        'UserData': {if (current is Map) ...current, 'IsFavorite': synced},
      },
    );
  }

  /// [channels] with synced user data applied, or null when none changed.
  static List<GuideChannel>? withSyncedUserDataAll(
    List<GuideChannel> channels,
  ) {
    final updated = [for (final c in channels) c.withSyncedUserData()];
    for (var i = 0; i < updated.length; i++) {
      if (!identical(updated[i], channels[i])) return updated;
    }
    return null;
  }

  factory GuideChannel.fromRawItem(Map<String, dynamic> raw) => GuideChannel(
    id: raw['Id']?.toString() ?? '',
    name: raw['Name'] as String? ?? '',
    number: raw['ChannelNumber'] as String?,
    imageTag: (raw['ImageTags'] as Map?)?['Primary'] as String?,
    isFavorite: ((raw['UserData'] as Map?)?['IsFavorite'] == true),
    rawData: raw,
  );
}

/// Where a program's artwork lives: the item that carries it, the tag that
/// identifies the image, and whether that tag names the item's Thumb image
/// rather than its Primary one. The two are served by different endpoints.
typedef GuideArtworkSource = ({String itemId, String tag, bool isThumb});

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

  /// Present only when the server matched this program to a recognised
  /// episode or movie. Rare in practice: a live TV program's own item
  /// usually carries no unique art of its own, even when recognised.
  String? get imageTag => (rawData['ImageTags'] as Map?)?['Primary'] as String?;

  String? get seriesId => rawData['SeriesId']?.toString();
  String? get seriesPrimaryImageTag => rawData['SeriesPrimaryImageTag'] as String?;
  String? get parentPrimaryImageItemId =>
      rawData['ParentPrimaryImageItemId']?.toString();
  String? get parentPrimaryImageTag => rawData['ParentPrimaryImageTag'] as String?;
  String? get parentThumbItemId => rawData['ParentThumbItemId']?.toString();
  String? get parentThumbImageTag => rawData['ParentThumbImageTag'] as String?;

  /// The item id and tag for this program's own artwork, preferring (in
  /// order) its own art, the matched series' poster, the parent item's
  /// primary image, and finally the parent's landscape thumb — the same
  /// fallback chain the home screen's "On Now" row already resolves
  /// successfully for this same data, since a live TV program's own item
  /// essentially never carries unique art of its own.
  ///
  /// Only the last branch sets `isThumb`. `ParentThumbImageTag` tags the
  /// parent's Thumb image, so asking for its Primary with that tag serves
  /// the parent's poster where it has one and 404s where it doesn't.
  GuideArtworkSource? get artworkSource {
    if (imageTag case final tag?) {
      return (itemId: id, tag: tag, isThumb: false);
    }
    if (seriesId case final sid?) {
      if (seriesPrimaryImageTag case final tag?) {
        return (itemId: sid, tag: tag, isThumb: false);
      }
    }
    if (parentPrimaryImageItemId case final pid?) {
      if (parentPrimaryImageTag case final tag?) {
        return (itemId: pid, tag: tag, isThumb: false);
      }
    }
    if (parentThumbItemId case final pid?) {
      if (parentThumbImageTag case final tag?) {
        return (itemId: pid, tag: tag, isThumb: true);
      }
    }
    return null;
  }

  double? get communityRating => (rawData['CommunityRating'] as num?)?.toDouble();

  bool get isRepeat => rawData['IsRepeat'] == true;

  /// `S{season}:E{episode}`, matching the quick channel changer's format.
  String? get seasonEpisodeLabel {
    final season = rawData['ParentIndexNumber'];
    final episode = rawData['IndexNumber'];
    return season != null && episode != null ? 'S$season:E$episode' : null;
  }

  /// The episode title and its `(S1:E5)` numbering, with whichever of the two
  /// the program carries. Listings often name an episode without numbering it,
  /// and movies and news carry neither, so the two have to stand on their own.
  /// A title that only repeats the program name is left out. Empty when
  /// there's nothing to show.
  String get episodeLine {
    final title = episodeTitle?.trim() ?? '';
    final label = seasonEpisodeLabel;
    return [
      if (title.isNotEmpty && title != name.trim()) title,
      if (label != null) '($label)',
    ].join(' ');
  }

  /// The name with [episodeLine] after it, for labels that put both on one
  /// line.
  String get titleWithEpisode {
    final episode = episodeLine;
    return episode.isEmpty ? name : '$name \u00B7 $episode';
  }

  /// The program's categories in a fixed order, as the same [GuideFilter]
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

  // The smallest responsive guide span. Wider landscape surfaces replace it
  // through setWindow after GuideLayoutProfile measures their available area.
  static const _defaultGuideWindow = Duration(minutes: 150);
  // OfficialRating, CommunityRating, IsPremiere and IsRepeat need no entry:
  // none of them are ItemFields values, so the server returns them
  // unconditionally.
  // Programs only need the synopsis here because the guide fetch runs with
  // images disabled, so the image-related fields come back empty anyway.
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
  final Set<String> _failedCarouselIds = <String>{};

  // Channel ids with a program request out, the generation it belongs to and
  // when it's done.
  final Map<String, ({int generation, Future<void> done})> _programsPending =
      {};

  (GuideFilter?, int)? _loadingMorePage;
  int _pageGeneration = 0;
  int? _listingsStatePage;
  // If refreshes overlap, don't lose the rows already queued for loading.
  int _reloadDepth = 0;
  int get _requestedPageDepth => max(
    _reloadDepth,
    _isCategory(_filter) ? _categoryHighWater : _programsHighWater,
  );

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
  // Keep the current listings visible while the new window loads.
  GuideFilter? _previousWindowCategory;
  int _categoryRequest = 0;
  bool _categoryFetchInFlight = false;

  // Bumped by every targeted replacement and by every cache reset, so a reply
  // whose window or channel set has since been superseded can be dropped.
  int _programGeneration = 0;
  int _loadGeneration = 0;
  bool _reloadOnEntry = false;

  /// [liveTvRecordingRevision] as of the last complete load, so re-entry can
  /// tell that a recording changed elsewhere since.
  int _loadedRecordingRevision = liveTvRecordingRevision.value;
  bool _atLivePosition = true;

  bool get atLivePosition => _atLivePosition;

  /// True while more channels remain to lazily load in scroll order.
  bool get hasMorePrograms => _isCategory(_filter)
      ? _categoryHighWater < _pageChannels.length
      : _programsHighWater < _pageChannels.length;

  /// How many channels (in list order) have been requested so far.
  int get programsHighWater =>
      _isCategory(_filter) ? _categoryPrograms.length : _programsHighWater;

  bool get listingsAccessDenied =>
      _state == GuideState.error &&
      _listingsStatePage == _pageGeneration &&
      _accessDenied(_error);

  GuideChannelLoadState loadStateFor(String channelId) {
    if (hasProgramsFor(channelId)) return GuideChannelLoadState.loaded;
    return listingsAccessDenied || _failedCarouselIds.contains(channelId)
        ? GuideChannelLoadState.failed
        : GuideChannelLoadState.loading;
  }

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
    _advancePage();
    _sortBy = value;
    _channels = List<GuideChannel>.from(_channels)..sort(comparatorFor(value));
    _updatePageRows();
    // The lazy-load prefix follows list order, so walk it again from the top.
    // Already-fetched channels are skipped in _loadNextBatch.
    _programsHighWater = 0;
    if (_isCategory(_filter) && _categoryLoadedFor != _filter) {
      unawaited(_loadCategoryPrograms());
      return;
    }
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

  Object? _error;
  Object? get error => _error;

  List<GuideChannel> _channels = const [];
  List<GuideChannel> get playbackChannels => _channels;
  bool _usesPlaybackLineup = false;

  /// Use the player's authorized channel list. Keep listings for channels
  /// that remain, and ignore late results for removed channels.
  void usePlaybackLineup(List<GuideChannel> channels) {
    if (_usesPlaybackLineup && identical(_channels, channels)) return;
    _usesPlaybackLineup = true;
    _programGeneration++;
    _channels = channels;
    _updatePageRows();
    final ids = channels.map((channel) => channel.id).toSet();
    _programsByChannel.removeWhere((id, _) => !ids.contains(id));
    _programsLoadedIds.retainAll(ids);
    _failedCarouselIds.retainAll(ids);
  }

  final Map<String, List<GuideProgram>> _programsByChannel = {};

  Map<String, Set<String>> _channelGroups = {};
  Set<String>? _programmeCategories;
  Iterable<GuideFilter> get availableProgrammeCategories => filters.where(
    (filter) =>
        _isCategory(filter) &&
        (_programmeCategories?.contains(filter.name) ?? true),
  );
  bool get supportsGroupPicker => _client.liveTvApi is ChannelGroupApi;
  Map<String, int> _groupCounts = const {};
  int channelCountForGroup(String group) => _groupCounts[group] ?? 0;
  List<String> _availableGroups = const [];
  List<String> get availableGroups => _availableGroups;
  String? _selectedGroup;
  String? get selectedGroup => _selectedGroup;
  String _channelQuery = '';
  List<GuideChannel> _pageChannels = const [];
  int _lineupRequest = 0;
  (String, String?)? _groupAccount;

  // Search the full channel list first, so a match appears even if its
  // guide data hasn't loaded.
  void _updatePageRows() {
    Iterable<GuideChannel> rows = _channels;
    final group = _selectedGroup;
    if (group != null) {
      rows = rows.where(
        (channel) => _channelGroups[channel.id]?.contains(group) == true,
      );
    }
    if (_filter == GuideFilter.favorites) {
      rows = rows.where((channel) => channel.isFavorite);
    }
    if (_channelQuery.isNotEmpty) {
      rows = rows.where(
        (channel) =>
            channel.name.toLowerCase().contains(_channelQuery) ||
            (channel.number?.toLowerCase().contains(_channelQuery) ?? false),
      );
    }
    _pageChannels = identical(rows, _channels) ? _channels : rows.toList();
    _categoryHighWater = 0;
    _advanceCategoryCursor();
  }

  // If favorites change the order while loading, continue with the first
  // channel we haven't checked.
  void _advanceCategoryCursor() {
    while (_categoryHighWater < _pageChannels.length &&
        _categoryQueriedIds.contains(_pageChannels[_categoryHighWater].id)) {
      _categoryHighWater++;
    }
  }

  void setChannelQuery(String text) {
    final query = text.trim().toLowerCase();
    if (_channelQuery == query) return;
    _channelQuery = query;
    _updatePageRows();
    _resetPageCursor();
    if (_isCategory(_filter)) {
      unawaited(_loadCategoryPrograms());
    } else {
      _resetCategory();
      _notifyListeners();
      if (_state == GuideState.ready) unawaited(loadMorePrograms());
    }
  }

  void _advancePage() {
    // Don't carry loading or error states over to the next page.
    if (_listingsStatePage == _pageGeneration) {
      _state = GuideState.ready;
      _error = null;
      _listingsStatePage = null;
    }
    _reloadDepth = 0;
    _pageGeneration++;
  }

  void _resetPageCursor({bool advancePage = true}) {
    if (advancePage) _advancePage();
    _programsHighWater = 0;
    _advanceProgramsCursor();
  }

  void _advanceProgramsCursor() {
    final rows = _pageChannels;
    while (_programsHighWater < rows.length &&
        _programsLoadedIds.contains(rows[_programsHighWater].id)) {
      _programsHighWater++;
    }
  }

  GuideFilter _filter = GuideFilter.all;
  GuideFilter get filter => _filter;

  /// The filters the guide offers
  /// ([FeatureDetector.supportsGuideCategoryFilters]).
  List<GuideFilter> get filters =>
      _client.features.supportsGuideCategoryFilters
      ? GuideFilter.values
      : const [
          GuideFilter.all,
          GuideFilter.movies,
          GuideFilter.series,
          GuideFilter.premiere,
          GuideFilter.favorites,
        ];

  // Seeded from the injected clock in the constructor, so the initial value
  // is testable rather than tied to the real wall clock.
  DateTime _guideDate;
  DateTime get guideDate => _guideDate;

  DateTime _windowStart;
  DateTime get windowStart => _windowStart;

  DateTime _windowEnd;
  DateTime get windowEnd => _windowEnd;

  bool get _showingPreviousCategory => _previousWindowCategory == _filter;

  List<GuideChannel> get filteredChannels {
    if (!_isCategory(_filter)) return _pageChannels;
    if (_categoryLoadedFor != _filter && !_showingPreviousCategory) {
      return const [];
    }
    return _pageChannels
        .where((ch) => _categoryPrograms.containsKey(ch.id))
        .toList();
  }

  List<GuideProgram> programsForChannel(String channelId) {
    if (_isCategory(_filter)) return _categoryPrograms[channelId] ?? const [];
    return _programsByChannel[channelId] ?? const [];
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

  bool _publishingFetchedUserData = false;

  void syncChannelUserData() {
    if (_publishingFetchedUserData) return;
    final updated = GuideChannel.withSyncedUserDataAll(_channels);
    if (updated == null) return;
    if (_sortReadsFavorite) updated.sort(comparatorFor(_sortBy));
    _channels = updated;
    _updateFavoriteRows();
    _notifyListeners();
    if (_filter == GuideFilter.favorites) {
      unawaited(
        ensureProgramsForChannels([
          for (final c in _pageChannels) c.id,
        ]).catchError((Object _) {
          // The row stays unloaded, so reselecting the filter or the next
          // favorite change asks again.
        }),
      );
    }
    if (!_usesPlaybackLineup &&
        _sortReadsFavorite &&
        _state == GuideState.ready) {
      unawaited(loadMorePrograms());
    }
  }

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
      await ItemMutationRepository(
        _client,
      ).setFavorite(channelId, isFavorite: next);
    } catch (_) {
      _applyChannelUpdate(current);
      rethrow;
    }
  }

  /// Only the favorites-first comparator reads [GuideChannel.isFavorite], so a
  /// toggle under any other sort leaves the lineup where the viewer left it.
  bool get _sortReadsFavorite => _sortBy == ChannelSortBy.favoritesFirst;

  void _updateFavoriteRows() {
    _updatePageRows();
    if (_sortReadsFavorite || _filter == GuideFilter.favorites) {
      // Reordering favorites shouldn't restart a program category that's still loading.
      _resetPageCursor(advancePage: !_isCategory(_filter));
    }
  }

  /// Replaces one channel by id and re-sorts when the active sort depends on
  /// what changed. Selection is resolved by id by the screen, so it survives.
  void _applyChannelUpdate(GuideChannel updated) {
    final channels = List<GuideChannel>.from(_channels);
    final at = channels.indexWhere((c) => c.id == updated.id);
    if (at < 0) return;
    channels[at] = updated;
    final resort = _sortReadsFavorite;
    if (resort) channels.sort(comparatorFor(_sortBy));
    _channels = channels;
    _updateFavoriteRows();
    _notifyListeners();
    if (resort || _filter == GuideFilter.favorites) {
      unawaited(loadMorePrograms());
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
    await recordingChanged();
  }

  LiveTvApi get liveTvApi => _client.liveTvApi;

  /// Re-reads the programs in the current window when a recording changed
  /// elsewhere since they loaded.
  Future<void> reloadIfRecordingsChanged() async {
    if (_loadedRecordingRevision == liveTvRecordingRevision.value) return;
    await _refreshRecordingState();
  }

  /// Tells the other Live TV surfaces a recording changed, then shows it here.
  Future<void> recordingChanged() {
    notifyLiveTvRecordingsChanged();
    return _refreshRecordingState();
  }

  /// Re-reads the loaded rows in place, without the guide-wide loading state
  /// that would rebuild the grid and drop the focused cell. A failed refresh
  /// reloads in full.
  Future<void> _refreshRecordingState() async {
    final recordingRevision = liveTvRecordingRevision.value;
    try {
      if (_isCategory(_filter) && !_showingPreviousCategory) {
        await _refreshCategoryRows();
      }
      await _refreshLoadedChannels(_now());
      _loadedRecordingRevision = recordingRevision;
    } catch (error) {
      if (!_accessDenied(error)) await _reloadPrograms();
    }
  }

  /// A category view keeps its own program lists. A recording change doesn't
  /// change which programs belong to the category, so the channels already
  /// shown are fetched again and their lists swapped.
  Future<void> _refreshCategoryRows() async {
    final request = _categoryRequest;
    final filter = _filter;
    final channels = _categoryPrograms.keys
        .map(channelForId)
        .whereType<GuideChannel>()
        .toList();
    final size = _batchSizeFor(filter);
    for (var i = 0; i < channels.length; i += size) {
      final batch = channels.sublist(i, min(i + size, channels.length));
      final fetched = await _fetchPrograms(batch, category: filter);
      if (request != _categoryRequest) return;
      for (final channel in batch) {
        final programs = fetched[channel.id];
        if (programs != null) _categoryPrograms[channel.id] = programs;
      }
    }
    _notifyListeners();
  }

  /// Records the showings of this program's series that [episodes] picks, or
  /// drops the rule if one is already in place.
  Future<void> toggleSeriesRecording(
    GuideProgram program, {
    SeriesRecordingEpisodes? episodes,
  }) async {
    if (program.hasSeriesTimer) {
      final seriesTimerId = program.rawData['SeriesTimerId']?.toString();
      if (seriesTimerId == null || seriesTimerId.isEmpty) {
        throw StateError(
          'SeriesTimerId missing for scheduled series ${program.id}',
        );
      }
      await _client.liveTvApi.cancelSeriesTimer(seriesTimerId);
    } else {
      await _client.liveTvApi.createSeriesTimer(
        program.id,
        settings: episodes?.settings,
      );
    }
    await recordingChanged();
  }

  Future<void> load({
    Duration? window,
    List<String>? initialChannelIds,
    DateTime? windowStart,
    bool livePosition = true,
  }) async {
    final loadGeneration = ++_loadGeneration;
    final recordingRevision = liveTvRecordingRevision.value;
    final lineupRequest = ++_lineupRequest;
    if (window != null) _guideWindow = window;
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
    _listingsStatePage = null;
    _error = null;
    _state = GuideState.loading;
    _notifyListeners();

    int? listingsPage;
    bool current() =>
        !_disposed &&
        loadGeneration == _loadGeneration &&
        (listingsPage == null
            ? lineupRequest == _lineupRequest
            : listingsPage == _pageGeneration);
    try {
      if ((!_usesPlaybackLineup && !await _fetchChannels(lineupRequest)) ||
          _disposed ||
          lineupRequest != _lineupRequest) {
        return;
      }
      if (loadGeneration != _loadGeneration) {
        // The channel list is still valid, but the new date needs its own listings.
        await _reloadPrograms();
        return;
      }

      final initial = loadInitialPrograms(channelIds: initialChannelIds);
      listingsPage = _pageGeneration;
      _listingsStatePage = listingsPage;
      await initial;
      if (!current()) return;
      _listingsStatePage = null;
      if (_isCategory(_filter)) {
        await _loadCategoryPrograms();
      } else {
        _state = GuideState.ready;
      }
      if (loadGeneration == _loadGeneration && _state == GuideState.ready) {
        _reloadOnEntry = false;
        _loadedRecordingRevision = recordingRevision;
      }
    } catch (e) {
      if (!current()) return;
      _error = e;
      _state = GuideState.error;
    }
    _notifyListeners();
  }

  void setGroup(String name) {
    if (_availableGroups.contains(name)) _selectFilter(GuideFilter.all, name);
  }

  void setFilter(GuideFilter value) => _selectFilter(value, null);

  void _selectFilter(GuideFilter value, String? group) {
    if (_filter == value && _selectedGroup == group) return;
    final scopeChanged =
        _selectedGroup != group ||
        _filter == GuideFilter.favorites ||
        value == GuideFilter.favorites;
    _selectedGroup = group;
    _filter = value;
    if (scopeChanged) {
      _updatePageRows();
      _resetPageCursor();
    } else {
      // The channel order can stay the same, but pending requests and errors
      // shouldn't carry over between filters.
      _advancePage();
    }
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
    if (!_isCategory(value) && (scopeChanged || _programsHighWater == 0)) {
      unawaited(loadMorePrograms());
    }
  }

  Future<void> _loadCategoryPrograms() async {
    _resetCategory();
    final request = _categoryRequest;
    _categoryFetchInFlight = true;
    _listingsStatePage = null;
    _error = null;
    _state = GuideState.loading;
    _notifyListeners();
    try {
      await _walkCategory();
      if (request != _categoryRequest) return;
      _categoryLoadedFor = _filter;
      _state = GuideState.ready;
    } catch (e) {
      if (request != _categoryRequest) return;
      _listingsStatePage = _pageGeneration;
      _error = e;
      _state = GuideState.error;
    }
    _categoryFetchInFlight = false;
    _notifyListeners();
  }

  static int _batchSizeFor(GuideFilter? category) =>
      _serverFilteredCategories.contains(category)
      ? _categoryBatchSize
      : _programBatchSize;

  Future<void> _walkCategory() async {
    final request = _categoryRequest;
    final filter = _filter;
    final startRows = _categoryPrograms.length;
    while (_categoryHighWater < _pageChannels.length &&
        _categoryPrograms.length - startRows < _categoryMinRowsPerPage) {
      final size = _batchSizeFor(filter);
      final end = min(_categoryHighWater + size, _pageChannels.length);
      final batch = _pageChannels
          .sublist(_categoryHighWater, end)
          .where((c) => !_categoryQueriedIds.contains(c.id))
          .toList();
      final fetched = await _fetchPrograms(batch, category: filter);
      if (request != _categoryRequest) return;
      _categoryQueriedIds.addAll(batch.map((c) => c.id));
      _advanceCategoryCursor();
      if (fetched.isEmpty) continue;
      _categoryPrograms.addAll(fetched);
      _notifyListeners();
    }
  }

  void _resetCategory({bool keepRows = false}) {
    _previousWindowCategory = keepRows ? _filter : null;
    _categoryFetchInFlight = keepRows;
    if (!keepRows) _categoryPrograms.clear();
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
      if (_showingPreviousCategory && !_categoryFetchInFlight) {
        await _reloadPrograms(keepCategoryRows: true);
      }
      return;
    }

    final ids = _programsLoadedIds.toList();
    final generation = ++_programGeneration;
    _windowStart = start;
    _windowEnd = start.add(_guideWindow);
    _guideDate = start;
    _atLivePosition = livePosition;
    if (_isCategory(_filter)) {
      await _reloadPrograms(keepCategoryRows: true);
      return;
    }
    _resetCategory();
    _notifyListeners();
    if (ids.isEmpty) return;

    final replacements = await _fetchProgramReplacements(
      ids,
      from: start,
      to: _windowEnd,
      generation: generation,
    );
    if (replacements == null || generation != _programGeneration) return;
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

  Future<void> _reloadPrograms({bool keepCategoryRows = false}) async {
    final loadGeneration = ++_loadGeneration;
    final recordingRevision = liveTvRecordingRevision.value;
    final depth = _requestedPageDepth;
    final alreadyShowingPrevious = _showingPreviousCategory;
    final keepRows =
        keepCategoryRows &&
        _state == GuideState.ready &&
        _categoryPrograms.isNotEmpty &&
        (_categoryLoadedFor == _filter || alreadyShowingPrevious);
    _resetPrograms(keepCategoryRows: keepRows);
    _reloadDepth = depth;
    final page = _pageGeneration;
    _listingsStatePage = page;
    _error = null;
    _state = keepRows ? GuideState.ready : GuideState.loading;
    if (!alreadyShowingPrevious || !keepRows) _notifyListeners();

    bool current() =>
        !_disposed &&
        loadGeneration == _loadGeneration &&
        page == _pageGeneration;
    try {
      await _replaceProgramPages(current);
      if (!current()) return;
      _loadedRecordingRevision = recordingRevision;
    } catch (e) {
      if (!current()) return;
      if (keepRows && !_accessDenied(e)) {
        // If a refresh fails, keep the old listings and retry on the next request.
        _categoryFetchInFlight = false;
        return;
      }
      _error = e;
      _state = GuideState.error;
      _notifyListeners();
    }
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
  /// stale forces a full reload. This is the one re-entry path where that is
  /// still correct, since background refresh elsewhere avoids it.
  Future<void> reloadIfStale({Duration? window, DateTime? windowStart}) async {
    if (_reloadOnEntry ||
        _loadedRecordingRevision != liveTvRecordingRevision.value ||
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

  Future<bool> _fetchChannels(int lineupRequest) async {
    final revision = userDataSync.revision;
    final session = userDataSync.session;
    final api = _client.liveTvApi;
    final account = api is ChannelGroupApi
        ? (_client.baseUrl, _client.userId)
        : null;
    if (account != _groupAccount) {
      _groupAccount = account;
      _programmeCategories = null;
      _channelGroups = {};
      _availableGroups = const [];
      _groupCounts = const {};
      _selectedGroup = null;
      _updatePageRows();
    }
    bool current() {
      if (_disposed ||
          lineupRequest != _lineupRequest ||
          session != userDataSync.session) {
        return false;
      }
      if (account != null && account != (_client.baseUrl, _client.userId)) {
        unawaited(load());
        return false;
      }
      return true;
    }

    ChannelGroupLineup? lineup;
    if (api is ChannelGroupApi) {
      try {
        lineup = await (api as ChannelGroupApi).getChannelGroups();
      } catch (error) {
        debugPrint('Live TV channel groups unavailable (${error.runtimeType})');
        if (_accessDenied(error)) {
          lineup = const ChannelGroupLineup({}, endpointAvailable: false);
        }
      }
      if (!current()) return false;
      if (lineup?.endpointAvailable == false) {
        _programmeCategories = null;
        _channelGroups = {};
        _rebuildGroupChoices(complete: true);
      }
    }
    var items = lineup?.channels;
    if (items == null) {
      final response = await _readChannels(lineupRequest);
      if (!current() || response == null) return false;
      items = (response['Items'] as List?)?.cast<Map<String, dynamic>>() ?? [];
    }
    _publishChannels(items, revision);
    if (lineup != null) {
      if (lineup.programmeCategories != null) {
        _programmeCategories = lineup.programmeCategories;
      }
      _applyChannelGroupLineup(lineup);
    } else if (account != null) {
      final visible = _channels.map((channel) => channel.id).toSet();
      _channelGroups.removeWhere((id, _) => !visible.contains(id));
      _rebuildGroupChoices(complete: true);
    } else {
      _updatePageRows();
    }
    return true;
  }

  Future<Map<String, dynamic>?> _readChannels(int request) async {
    final session = userDataSync.session;
    final account = _groupAccount;
    try {
      return await _client.liveTvApi.getChannels(
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        fields: 'ImageTags,UserData',
        enableTotalRecordCount: false,
        userId: _client.userId,
      );
    } on DioException catch (error) {
      if (!_accessDenied(error)) rethrow;
      if (!_disposed &&
          request == _lineupRequest &&
          session == userDataSync.session &&
          (account == null || account == (_client.baseUrl, _client.userId))) {
        // If the server denies access, clear the channels and pending guide requests.
        // Moonbase handles its own permissions.
        _loadGeneration++;
        cancelBoundaryRefresh();
        _channels = const [];
        _programmeCategories = null;
        _channelGroups = {};
        _filter = GuideFilter.all;
        _rebuildGroupChoices(complete: true);
        _resetPrograms();
        _error = error;
        _state = GuideState.error;
        _reloadOnEntry = true;
        _notifyListeners();
      }
      return null;
    }
  }

  void _publishChannels(List<Map<String, dynamic>> items, int revision) {
    final fresh = <String, Map<String, dynamic>>{};
    for (final item in items) {
      final id = item['Id']?.toString();
      final data = item['UserData'];
      if (id != null &&
          data is Map &&
          !userDataSync.favoriteChangePending(id) &&
          userDataSync.revisionFor(id) <= revision) {
        fresh[id] = Map<String, dynamic>.from(data);
      }
    }
    // The lineup below is rebuilt from this data. Syncing the old one first
    // would re-sort it and fetch programs for rows about to be replaced.
    _publishingFetchedUserData = true;
    try {
      userDataSync.publishAll(fresh, replace: true);
    } finally {
      _publishingFetchedUserData = false;
    }
    _channels =
        items
            .map(GuideChannel.fromRawItem)
            .map((channel) => channel.withSyncedUserData())
            .toList()
          ..sort(comparatorFor(_sortBy));
  }

  void _rebuildGroupChoices({required bool complete}) {
    final counts = <String, int>{};
    for (final channel in _channels) {
      for (final group in _channelGroups[channel.id] ?? const <String>{}) {
        counts[group] = (counts[group] ?? 0) + 1;
      }
    }
    final selected = _selectedGroup;
    if (selected != null && !counts.containsKey(selected)) {
      if (complete) {
        _selectedGroup = null;
      } else {
        // The selected group might be missing from a partial tuner response.
        counts[selected] = 0;
      }
    }
    _groupCounts = counts;
    _availableGroups = counts.keys.toList()..sort();
    _updatePageRows();
  }

  /// Reload the pages the viewer had already reached.
  Future<void> _replaceProgramPages(bool Function() current) async {
    while (current()) {
      final page = _pageGeneration;
      final generation = _programGeneration;
      bool samePage() =>
          current() &&
          page == _pageGeneration &&
          generation == _programGeneration;
      final rows = _pageChannels;
      final category = _isCategory(_filter) ? _filter : null;
      final size = _batchSizeFor(category);
      final fetched = <String, List<GuideProgram>>{};
      var end = 0;
      try {
        while (end < rows.length) {
          final start = end;
          end = min(start + size, rows.length);
          fetched.addAll(
            await _fetchPrograms(rows.sublist(start, end), category: category),
          );
          if (!samePage()) break;
          if (end >= _requestedPageDepth &&
              (category == null || fetched.length >= _categoryMinRowsPerPage)) {
            break;
          }
        }
      } catch (error) {
        // Access was denied, so the old listings have already been discarded.
        if (samePage() || (current() && identical(error, _error))) rethrow;
      }
      if (!samePage()) continue;
      final ids = rows.take(end).map((c) => c.id);
      if (category == null) {
        for (final id in ids) {
          _programsByChannel[id] = fetched[id] ?? const [];
        }
        _programsLoadedIds.addAll(ids);
        _programsHighWater = end;
      } else {
        _categoryPrograms
          ..clear()
          ..addAll(fetched);
        _previousWindowCategory = null;
        _categoryFetchInFlight = false;
        _categoryQueriedIds.addAll(ids);
        _advanceCategoryCursor();
        _categoryLoadedFor = category;
      }
      _reloadDepth = 0;
      _listingsStatePage = null;
      _state = GuideState.ready;
      _error = null;
      _notifyListeners();
      return;
    }
  }

  bool _accessDenied(Object? error) =>
      error is DioException &&
      (error.response?.statusCode == 401 || error.response?.statusCode == 403);

  void _applyChannelGroupLineup(ChannelGroupLineup lineup) {
    final unresolved = lineup.unresolvedChannelIds;
    final partial = lineup.partial;
    final updated = <String, Set<String>>{};
    for (final channel in _channels) {
      final id = channel.id;
      final unknown = partial && (unresolved?.contains(id) ?? true);
      final known = lineup.groupsByChannelId[id];
      final groups = unknown && _channelGroups.containsKey(id)
          ? {...?_channelGroups[id], ...?known}
          : known;
      if (groups != null) updated[id] = groups;
    }
    _channelGroups = updated;
    // Keep existing groups for channels the plugin couldn't check.
    // If the response doesn't identify missing channels, keep the selected group.
    _rebuildGroupChoices(complete: !partial || unresolved != null);
  }

  void _resetPrograms({bool keepCategoryRows = false}) {
    _advancePage();
    _programGeneration++;
    _programsByChannel.clear();
    _programsLoadedIds.clear();
    _failedCarouselIds.clear();
    _programsHighWater = 0;
    _processedBoundaries.clear();
    _resetCategory(keepRows: keepCategoryRows);
  }

  Future<void> loadInitialPrograms({List<String>? channelIds}) {
    _resetPrograms();
    return channelIds == null
        ? _loadNextBatch()
        : ensureProgramsForChannels(channelIds);
  }

  /// Loads the next batch of channels (in list order) as the guide is scrolled
  /// toward the loaded edge. No-op once every channel has been requested.
  Future<void> loadMorePrograms() async {
    final generation = _programGeneration;
    final pageGeneration = _pageGeneration;
    final page = _isCategory(_filter)
        ? (_filter, _categoryRequest)
        : (null, pageGeneration);
    if (listingsAccessDenied ||
        _loadingMorePage == page ||
        _categoryFetchInFlight ||
        (_state == GuideState.loading &&
            _listingsStatePage == pageGeneration) ||
        !hasMorePrograms) {
      return;
    }
    if (_showingPreviousCategory) {
      await _reloadPrograms(keepCategoryRows: true);
      return;
    }
    bool current() =>
        !_disposed &&
        generation == _programGeneration &&
        pageGeneration == _pageGeneration;
    _loadingMorePage = page;
    try {
      if (_isCategory(_filter)) {
        await _walkCategory();
      } else {
        await _loadNextBatch();
      }
      if (current() &&
          _listingsStatePage == pageGeneration &&
          _state == GuideState.error) {
        if (_isCategory(_filter)) _categoryLoadedFor = _filter;
        _listingsStatePage = null;
        _error = null;
        _state = GuideState.ready;
      }
    } catch (error) {
      if (current()) {
        // Let the next scroll retry. Notifying now would request the failed page
        // again on every rebuild.
        if (_state == GuideState.ready &&
            _pageChannels.any((channel) => hasProgramsFor(channel.id))) {
          return;
        }
        _listingsStatePage = pageGeneration;
        _error = error;
        _state = GuideState.error;
      }
    } finally {
      if (_loadingMorePage == page) {
        _loadingMorePage = null;
        // If a reload interrupted this batch, continue once the guide is ready.
        if (!_disposed &&
            _state == GuideState.ready &&
            (generation != _programGeneration ||
                pageGeneration != _pageGeneration) &&
            hasMorePrograms) {
          unawaited(loadMorePrograms());
        }
      }
    }
    _notifyListeners();
  }

  Future<void> _loadNextBatch() async {
    final rows = _pageChannels;
    final pageGeneration = _pageGeneration;
    if (_programsHighWater >= rows.length) return;
    final end = min(_programsHighWater + _programBatchSize, rows.length);
    // A re-sort can move already-fetched channels back into the unwalked
    // suffix. Fetching them again would append duplicate programs.
    final batch = rows
        .sublist(_programsHighWater, end)
        .where((c) => !_programsLoadedIds.contains(c.id))
        .toList();
    // A channel whose earlier request failed stays below the mark, so the
    // next pass asks for it again.
    if (await _loadProgramsBatch(batch) &&
        pageGeneration == _pageGeneration &&
        batch.every((c) => _programsLoadedIds.contains(c.id))) {
      _advanceProgramsCursor();
    }
  }

  /// Ensures the given channels' programs are fetched even if they sit past the
  /// scroll high-water mark (e.g. favorites). Loads only the missing ones.
  Future<void> ensureProgramsForChannels(List<String> channelIds) async {
    final lineup = _channels;
    final session = userDataSync.session;
    final load = _loadGeneration;
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
      if (!await _loadProgramsBatch(chunk)) {
        // A card refresh can interrupt its first listing request.
        // Retry once while the same player is still open.
        if (!_usesPlaybackLineup ||
            _disposed ||
            _state != GuideState.ready ||
            load != _loadGeneration ||
            session != userDataSync.session ||
            !identical(lineup, _channels)) {
          return;
        }
        if (!await _loadProgramsBatch(chunk)) return;
      }
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
  /// already held. Without it that case retries immediately and spins.
  @visibleForTesting
  static const noNewCoverageRetry = Duration(minutes: 5);

  /// Backoff after a failed refresh request.
  @visibleForTesting
  static const failureBackoff = Duration(minutes: 1);

  /// Keeps the current program visible when a rolling request starts late.
  @visibleForTesting
  static const rollingRefreshLookback = Duration(minutes: 15);

  /// Default amount of future guide data retained by a rolling refresh.
  @visibleForTesting
  static const rollingRefreshHorizon = _defaultGuideWindow;

  Timer? _boundaryTimer;
  DateTime? _boundaryDueAt;
  Future<void>? _carouselRefreshInFlight;
  bool _boundaryRefreshInFlight = false;
  bool _boundarySchedulingEnabled = false;

  // Boundaries already handled, so one can never be selected twice.
  final Set<DateTime> _processedBoundaries = <DateTime>{};

  /// When the armed refresh will run, or null when nothing is scheduled.
  @visibleForTesting
  DateTime? get boundaryDueAt => _boundaryDueAt;

  /// The earliest cached program start or end that is after now and
  /// unprocessed.
  @visibleForTesting
  DateTime? get nextBoundaryAt => _nextBoundary(_now());

  /// Arms a one-shot refresh on the next unprocessed future program boundary.
  ///
  /// Boundary fetches preserve the guide viewport. Carousel prewarming uses
  /// [refreshCarouselPrograms] for a bounded rolling window instead.
  ///
  /// This view model isn't a lifecycle observer: the surface that owns it must
  /// call this again on app resume, because timers don't fire while suspended.
  void scheduleBoundaryRefresh() {
    if (_disposed) return;
    _boundarySchedulingEnabled = true;
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

  /// Atomically refreshes loaded carousel channels around the current time.
  ///
  /// The bounded range is independent of the guide viewport. Concurrent calls
  /// coalesce, and a failed or stale response preserves the existing cache.
  Future<void> refreshCarouselPrograms() {
    if (_disposed) return Future<void>.value();
    _boundarySchedulingEnabled = true;
    final inFlight = _carouselRefreshInFlight;
    if (inFlight != null) return inFlight;

    late Future<void> tracked;
    tracked = _refreshCarouselPrograms().whenComplete(() {
      if (identical(_carouselRefreshInFlight, tracked)) {
        _carouselRefreshInFlight = null;
      }
    });
    _carouselRefreshInFlight = tracked;
    return tracked;
  }

  /// Stops the boundary refresh. Call when the surface is torn down.
  void cancelBoundaryRefresh() {
    _boundarySchedulingEnabled = false;
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
    _artworkNotifyCoalesce?.cancel();
    _artworkPrefetchQueue.clear();
    _artworkQueued.clear();
    _artworkInFlight.clear();
    _artworkCache.clear();
    _artworkByContentKey.clear();
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
    } catch (error) {
      _boundaryRefreshInFlight = false;
      if (!_accessDenied(error)) _armRetry(failureBackoff);
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

  Future<void> _refreshCarouselPrograms() async {
    final now = _now();
    final ids = _programsLoadedIds.toList();
    if (ids.isEmpty) {
      scheduleBoundaryRefresh();
      return;
    }

    final generation = ++_programGeneration;
    final from = now.subtract(rollingRefreshLookback);
    final to = now.add(rollingRefreshHorizon);

    Map<String, List<GuideProgram>>? replacements;
    try {
      replacements = await _fetchProgramReplacements(
        ids,
        from: from,
        to: to,
        generation: generation,
      );
      if (replacements == null) {
        _rearmBoundaryIfEnabled();
        return;
      }
    } catch (error) {
      if (_boundarySchedulingEnabled && !_accessDenied(error)) {
        _armRetry(failureBackoff);
      }
      return;
    }

    if (_disposed || generation != _programGeneration) {
      _rearmBoundaryIfEnabled();
      return;
    }
    for (final entry in replacements.entries) {
      _programsByChannel[entry.key] = entry.value;
    }
    _processedBoundaries.removeWhere((boundary) => !boundary.isAfter(now));
    _notifyListeners();
    _scheduleAfterRollingRefresh();
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

  void _scheduleAfterRollingRefresh() {
    if (!_boundarySchedulingEnabled) return;
    if (_nextBoundary(_now()) != null) {
      scheduleBoundaryRefresh();
    } else if (_boundaries().isNotEmpty) {
      _armRetry(noNewCoverageRetry);
    } else {
      scheduleBoundaryRefresh();
    }
  }

  void _rearmBoundaryIfEnabled() {
    if (_boundarySchedulingEnabled && !_disposed) scheduleBoundaryRefresh();
  }

  Future<Map<String, List<GuideProgram>>?> _fetchProgramReplacements(
    List<String> ids, {
    required DateTime from,
    required DateTime to,
    required int generation,
  }) async {
    final replacements = <String, List<GuideProgram>>{};
    for (var i = 0; i < ids.length; i += _programBatchSize) {
      final chunk = ids.sublist(i, min(i + _programBatchSize, ids.length));
      final response = await _fetchGuide(channelIds: chunk, from: from, to: to);
      if (_disposed || generation != _programGeneration) return null;
      final parsed = _parsePrograms(response);
      for (final id in chunk) {
        replacements[id] = parsed[id] ?? <GuideProgram>[];
      }
    }
    return replacements;
  }

  Iterable<DateTime> _boundaries() => _programsByChannel.values.expand(
    (programs) => programs.expand((p) => [p.startDate, p.endDate]),
  );

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
  /// the only case a local promotion can't cover.
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
  }) async {
    final generation = _programGeneration;
    final lineup = _lineupRequest;
    final page = _pageGeneration;
    final session = userDataSync.session;
    try {
      return await _client.liveTvApi.getGuide(
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
    } on DioException catch (error) {
      if (_accessDenied(error) &&
          !_disposed &&
          generation == _programGeneration &&
          lineup == _lineupRequest &&
          page == _pageGeneration &&
          session == userDataSync.session &&
          (_groupAccount == null ||
              _groupAccount == (_client.baseUrl, _client.userId))) {
        _discardDeniedListings(channelIds, error);
      }
      rethrow;
    }
  }

  void _discardDeniedListings(List<String> ids, DioException error) {
    _loadGeneration++;
    _programGeneration++;
    _categoryRequest++;
    _categoryFetchInFlight = false;
    _previousWindowCategory = null;
    _categoryLoadedFor = null;
    for (final id in ids) {
      _programsByChannel.remove(id);
      _programsLoadedIds.remove(id);
      _categoryPrograms.remove(id);
      _categoryQueriedIds.remove(id);
    }
    _programsHighWater = 0;
    _categoryHighWater = 0;
    cancelBoundaryRefresh();
    _listingsStatePage = _pageGeneration;
    _reloadOnEntry = true;
    _error = error;
    _state = GuideState.error;
    _notifyListeners();
  }

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
      final program = _programFromRaw(raw);
      if (program == null) continue;
      (byChannel[program.channelId] ??= <GuideProgram>[]).add(program);
    }

    for (final programs in byChannel.values) {
      programs.sort((a, b) => a.startDate.compareTo(b.startDate));
    }
    return byChannel;
  }

  /// Shared by the batch guide parser and the single-program artwork lookup.
  /// Returns null when the raw item is missing what a [GuideProgram] needs.
  GuideProgram? _programFromRaw(Map<String, dynamic> raw) {
    final channelId = raw['ChannelId']?.toString();
    if (channelId == null) return null;

    final start = parseServerDate(raw['StartDate']);
    final end = parseServerDate(raw['EndDate']);
    if (start == null || end == null) return null;

    return GuideProgram(
      id: raw['Id']?.toString() ?? '',
      channelId: channelId,
      name: raw['Name'] as String? ?? '',
      startDate: start.toLocal(),
      endDate: end.toLocal(),
      overview: raw['Overview'] as String?,
      // Some guide sources deliver EpisodeTitle with literal backslash-escaped
      // quotes (`\"Raygun\"`) even though the same program's Overview does
      // not, so this field alone needs unescaping.
      episodeTitle: (raw['EpisodeTitle'] as String?)?.replaceAll(r'\"', '"'),
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
  }

  /// Per-program artwork, keyed by program id. `null` means "looked up and
  /// confirmed there is none" (see [artworkSourceFor]) — a genuine negative
  /// result is cached like a positive one, so a channel the user scrolls
  /// back and forth across never re-issues the same request. A failed
  /// lookup (network/server error) is NOT cached here; see
  /// [_fetchArtworkSource].
  ///
  /// A plain map literal is a [LinkedHashMap], so insertion order survives:
  /// past the cap, [_insertWithCap] drops the oldest entry rather than the
  /// whole cache, so one channel's worth of scrolling never costs every other
  /// channel's already-resolved artwork.
  final Map<String, GuideArtworkSource?> _artworkCache = {};

  /// Well above what one submission can hold, since callers only queue the
  /// rows around the viewport. That headroom is what keeps an eviction from
  /// being re-queued, re-fetched, and evicting something else in turn.
  static const _artworkCacheCap = 2000;

  @visibleForTesting
  static int get artworkCacheCap => _artworkCacheCap;

  /// Secondary cache keyed by content (name + episode title) rather than
  /// program id, so a repeat airing of an already-resolved episode is a cache
  /// hit instead of a fetch. Same cap and eviction as [_artworkCache].
  final Map<String, GuideArtworkSource?> _artworkByContentKey = {};

  /// The key [_artworkByContentKey] is keyed on. `\u0000` separates the two
  /// fields since it cannot appear in either.
  String _contentKeyFor(GuideProgram program) {
    final episode = program.episodeTitle?.trim() ?? '';
    // Without an episode title the name alone would be the whole key, and
    // generic names recur across unrelated channels.
    return episode.isEmpty
        ? '${program.name}\u0000CH\u0000${program.channelId}'
        : '${program.name}\u0000$episode';
  }

  /// Inserts [value] under [key] in [cache], evicting the oldest entry first
  /// once [_artworkCacheCap] is reached.
  void _insertWithCap(
    Map<String, GuideArtworkSource?> cache,
    String key,
    GuideArtworkSource? value,
  ) {
    // Without this, re-inserting a key already present evicts an unrelated
    // entry to make room the map never needed.
    cache.remove(key);
    if (cache.length >= _artworkCacheCap) {
      cache.remove(cache.keys.first);
    }
    cache[key] = value;
  }

  /// In-flight artwork fetches keyed by program id, so concurrent callers for
  /// the same program share one request instead of issuing duplicates.
  final Map<String, Future<GuideArtworkSource?>> _artworkInFlight = {};

  bool hasArtworkResult(String programId) => _artworkCache.containsKey(programId);

  GuideArtworkSource? cachedArtworkFor(String programId) =>
      _artworkCache[programId];

  /// [getGuide] disables images for its whole batch to keep the payload small
  /// (issue #666), so a program's own `ImageTags` never comes back from the
  /// bulk fetch even when the server has one on file — confirmed on a live
  /// server: the same program id carries `ImageTags.Primary` through
  /// `/LiveTv/Programs/Recommended` but not through `/LiveTv/Programs`. This
  /// re-fetches one program, images enabled, to get what the bulk fetch
  /// can't. Safe to call for anything — [queueArtworkPrefetch] and a call
  /// site's own debounced on-focus lookup can both land here for the same
  /// program, and concurrent callers for the same id share a single
  /// in-flight request.
  Future<GuideArtworkSource?> artworkSourceFor(
    GuideProgram program,
  ) {
    // A program that already carries its art needs no lookup. The prefetch
    // path skips these too, so this only catches the on-focus caller.
    if (program.artworkSource case final source?) {
      return Future.value(source);
    }
    if (_artworkCache.containsKey(program.id)) {
      return Future.value(_artworkCache[program.id]);
    }
    final contentKey = _contentKeyFor(program);
    if (_artworkByContentKey.containsKey(contentKey)) {
      final result = _artworkByContentKey[contentKey];
      _insertWithCap(_artworkCache, program.id, result);
      return Future.value(result);
    }
    if (_artworkLookupsDisabled) return Future.value(null);
    final inFlight = _artworkInFlight[program.id];
    if (inFlight != null) return inFlight;

    final future = _fetchArtworkSource(program);
    _artworkInFlight[program.id] = future;
    return future.whenComplete(() => _artworkInFlight.remove(program.id));
  }

  /// Trips after [_artworkFailureLimit] lookups fail in a row and stays
  /// tripped for the life of the view model.
  ///
  /// Failures aren't cached per program, so a server that can't answer
  /// `/LiveTv/Programs/{id}` at all would otherwise be asked again for every
  /// program in the lineup every time the queue is resubmitted. A run that
  /// long is enough to conclude the route isn't going to start working, and
  /// the guide falls back to channel logos.
  bool _artworkLookupsDisabled = false;
  int _artworkConsecutiveFailures = 0;
  static const _artworkFailureLimit = 8;

  @visibleForTesting
  bool get artworkLookupsDisabled => _artworkLookupsDisabled;

  Future<GuideArtworkSource?> _fetchArtworkSource(
    GuideProgram program,
  ) async {
    final GuideArtworkSource? result;
    try {
      final raw = await _client.liveTvApi.getProgram(
        program.id,
        userId: _client.userId,
      );
      result = _programFromRaw(raw)?.artworkSource;
    } catch (_) {
      // A transient network/server failure is not proof there is no
      // artwork. Leave both caches untouched so a later call retries,
      // instead of permanently suppressing this program and every other
      // program sharing its content key. A sustained run is a different
      // thing, and [_artworkLookupsDisabled] catches that.
      _artworkConsecutiveFailures++;
      if (_artworkConsecutiveFailures >= _artworkFailureLimit) {
        _artworkLookupsDisabled = true;
        _artworkPrefetchQueue.clear();
        _artworkQueued.clear();
      }
      return null;
    }
    _artworkConsecutiveFailures = 0;
    _insertWithCap(_artworkCache, program.id, result);
    _insertWithCap(_artworkByContentKey, _contentKeyFor(program), result);
    _scheduleArtworkNotify();
    return result;
  }

  /// Background prefetch, throttled to [_artworkPrefetchConcurrency]
  /// concurrent requests so a big lazily-loaded channel batch can't turn into
  /// exactly the kind of all-at-once load issue #666 was about, just spread
  /// across many small requests instead of one huge one. Cheap to call
  /// often — already-cached or already-queued programs are skipped for the
  /// cost of a couple of lookups. Bounded to [_artworkPrefetchHorizon] ahead
  /// of now; a program beyond that still resolves on demand through
  /// [artworkSourceFor] when the user actually focuses it.
  final Queue<GuideProgram> _artworkPrefetchQueue = Queue<GuideProgram>();
  final Set<String> _artworkQueued = {};
  int _artworkPrefetchActive = 0;
  static const _artworkPrefetchConcurrency = 3;

  /// How far ahead of now the speculative prefetch reaches.
  static const _artworkPrefetchHorizon = Duration(hours: 6);

  /// Queues [programs] for background artwork prefetch. When [replace] is
  /// true, the pending queue is dropped first, so a caller re-submitting for
  /// a new viewport doesn't leave stale, now-off-screen programs queued
  /// ahead of it — only entries not yet dequeued are affected; a fetch
  /// already in flight runs to completion either way and is never
  /// cancelled or double-counted.
  void queueArtworkPrefetch(
    Iterable<GuideProgram> programs, {
    bool replace = false,
  }) {
    if (replace) {
      // Safe to clear both wholesale: _pumpArtworkPrefetch removes an id
      // from _artworkQueued the moment it dequeues it, before the fetch
      // starts, so nothing in-flight is ever tracked in _artworkQueued.
      _artworkPrefetchQueue.clear();
      _artworkQueued.clear();
    }
    if (_artworkLookupsDisabled) return;
    final horizon = _now().add(_artworkPrefetchHorizon);
    for (final program in programs) {
      if (program.startDate.isAfter(horizon)) continue;
      if (program.artworkSource != null) continue;
      if (_artworkCache.containsKey(program.id)) continue;
      if (!_artworkQueued.add(program.id)) continue;
      _artworkPrefetchQueue.add(program);
    }
    _pumpArtworkPrefetch();
  }

  void _pumpArtworkPrefetch() {
    while (!_disposed &&
        _artworkPrefetchActive < _artworkPrefetchConcurrency &&
        _artworkPrefetchQueue.isNotEmpty) {
      final program = _artworkPrefetchQueue.removeFirst();
      _artworkQueued.remove(program.id);
      if (_artworkCache.containsKey(program.id)) continue;
      _artworkPrefetchActive++;
      unawaited(
        artworkSourceFor(program).whenComplete(() {
          _artworkPrefetchActive--;
          if (!_disposed) _pumpArtworkPrefetch();
        }),
      );
    }
  }

  /// A prefetch backlog can resolve dozens of items a second; coalescing
  /// keeps that from rebuilding the whole guide once per item.
  Timer? _artworkNotifyCoalesce;

  void _scheduleArtworkNotify() {
    _artworkNotifyCoalesce ??= Timer(const Duration(milliseconds: 200), () {
      _artworkNotifyCoalesce = null;
      if (!_disposed) _notifyListeners();
    });
  }

  /// Fetches programs for one batch of channels over the current window and
  /// merges them into the cache.
  Future<bool> _loadProgramsBatch(List<GuideChannel> batch) async {
    final generation = _programGeneration;
    final session = userDataSync.session;
    bool current() =>
        !_disposed &&
        generation == _programGeneration &&
        session == userDataSync.session;
    // Two requests out for one channel would append its programs twice, so a
    // channel already asked for waits on that request instead.
    final ids = <String>[];
    final inFlight = <Future<void>>[];
    for (final c in batch) {
      if (_programsLoadedIds.contains(c.id)) continue;
      final pending = _programsPending[c.id];
      if (pending != null && pending.generation == generation) {
        inFlight.add(pending.done);
      } else {
        ids.add(c.id);
      }
    }
    if (ids.isNotEmpty) {
      final done = Completer<void>();
      for (final id in ids) {
        _programsPending[id] = (generation: generation, done: done.future);
      }
      try {
        // A channel can keep playing after its original guide window has passed.
        final now = _usesPlaybackLineup && _state == GuideState.ready
            ? _now()
            : null;
        Future<Map<String, dynamic>?> read() async {
          if (!current()) return null;
          return _fetchGuide(
            channelIds: ids,
            from: now?.subtract(rollingRefreshLookback) ?? _windowStart,
            to: now?.add(rollingRefreshHorizon) ?? _windowEnd,
          );
        }

        // Share the retry between cards waiting for the same listings.
        final response = _usesPlaybackLineup
            ? await retryOnTransientFailure(
                read,
                backoff: const [Duration(milliseconds: 250)],
              )
            : await read();
        if (response == null || !current()) return false;

        final parsed = _parsePrograms(response);
        _failedCarouselIds.removeAll(ids);
        for (final id in ids) {
          // Don't overwrite newer listings if a page refresh finished first.
          if (_programsLoadedIds.add(id)) {
            _programsByChannel[id] = parsed[id] ?? <GuideProgram>[];
          }
        }
      } on DioException catch (error) {
        if (!_usesPlaybackLineup ||
            _accessDenied(error) ||
            error.type == DioExceptionType.cancel) {
          rethrow;
        }
        if (!current()) return false;
        _failedCarouselIds.addAll(ids);
      } finally {
        for (final id in ids) {
          if (_programsPending[id]?.done == done.future) {
            _programsPending.remove(id);
          }
        }
        done.complete();
      }
    }
    await Future.wait(inFlight);
    return generation == _programGeneration;
  }

  void _notifyListeners() {
    if (!_disposed) notifyListeners();
  }
}
