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
import '../services/plex_live_tv_favorites.dart';
import '../services/plugin_sync_service.dart';
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
    final stateId = channelFavoriteKey(rawData) ?? id;
    final synced = userDataSync.favoriteFor(stateId);
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

  static bool sameStationOrder(List<GuideChannel> a, List<GuideChannel> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id) return false;
    }
    return true;
  }

  /// A rebuild of the original group can refresh station data while the player
  /// is surfing a different group selected in its guide.
  static List<GuideChannel> updatePlayerLineup(
    List<GuideChannel> active,
    List<GuideChannel> incoming, {
    required bool keepGroup,
  }) {
    if (!keepGroup) return [for (final c in incoming) c.withSyncedUserData()];
    final byId = {for (final c in incoming) c.id: c};
    return [for (final c in active) (byId[c.id] ?? c).withSyncedUserData()];
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

  /// Only Emby sends this flag.
  bool get isNew => rawData['IsNew'] == true;

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

typedef GuideFilterChoice = (GuideFilter, String?);

extension GuideFilterChoiceKind on GuideFilterChoice {
  bool get canFavorite =>
      $2 != null || ($1 != GuideFilter.all && $1 != GuideFilter.favorites);
  String get preferenceKey =>
      $2 == null ? 'category:${$1.name}' : 'group:${$2}';
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
  Duration _requestedGuideWindow = _defaultGuideWindow;
  Duration get guideWindow => _guideWindow;

  // How many of [_channels] (in order) have had their programs requested.
  int _programsHighWater = 0;

  // Every channel id whose programs have been fetched (ordered scroll batches
  // plus any ensured-loaded set like favorites), so rows can show a placeholder
  // until their programs arrive.
  final Set<String> _programsLoadedIds = <String>{};
  final Set<String> _failedProgramIds = <String>{};
  // Already-loaded rows keep their programs if a later refresh fails.
  final Set<String> _failedReplacementIds = <String>{};
  final Set<String> _retryingFailedProgramIds = <String>{};
  ({int page, Future<void> task})? _failedProgramsRetry;

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
  // A category may hide channels whose listings failed. Keep these retryable
  // without re-querying the rest of the category on selection.
  final Set<String> _categoryFailedIds = <String>{};
  GuideFilter? _categoryLoadedFor;

  /// Whether the current category has failed listings that need a Retry action.
  bool get hasFailedCategoryListings =>
      _isCategory(_filter) &&
      _categoryLoadedFor == _filter &&
      _categoryFailedIds.isNotEmpty;

  bool get retryingCategoryListings =>
      hasFailedCategoryListings && _categoryFetchInFlight;

  Future<void> retryFailedCategoryListings() => _retryCategoryFailures();
  int _windowRequest = 0;
  int _failedWindowMoveRevision = 0;

  /// Increases only when all channel listings for a requested time failed,
  /// not when the move was cancelled or superseded.
  int get failedWindowMoveRevision => _failedWindowMoveRevision;

  ({
    DateTime start,
    bool paging,
    bool Function() current,
    Completer<bool> settled,
  })? _pendingWindow;
  Completer<bool>? _openingLineup;
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
    if (!listingsAccessDenied && _retryingFailedProgramIds.contains(channelId)) {
      return GuideChannelLoadState.loading;
    }
    return listingsAccessDenied || _failedProgramIds.contains(channelId)
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
       _windowEnd = (now ?? DateTime.now)() {
    if (_client.serverType == ServerType.plex) {
      PlexLiveTvFavorites.favoriteListChanged.addListener(
        _onPlexFavoritesChanged,
      );
    }
  }

  void _onPlexFavoritesChanged() {
    final change = PlexLiveTvFavorites.favoriteListChanged.value;
    if (_disposed ||
        change == null ||
        change.userId != _client.userId ||
        _client.serverType != ServerType.plex) {
      return;
    }
    // Publishing the second PMS catalog updates its synthetic DVR keys.
    try {
      PlexLiveTvFavorites.applyCachedToClient(_client);
      syncChannelUserData();
    } catch (_) {
      // The account's saved token can disappear during a user switch.
      // The next guide load will populate its own favorite state.
    }
  }

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
    _windowRequest++;
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
    // Sorting invalidates any pending category retry. Its old finally block
    // cannot clear this flag once the request generation has changed.
    _categoryFetchInFlight = false;
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
  GuideState get state => _state == GuideState.ready && _awaitingGroupIds
      ? (_promotedError == null ? GuideState.loading : GuideState.error)
      : _state;

  Object? _error;
  Object? get error => _error ?? (_awaitingGroupIds ? _promotedError : null);

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
    _failedProgramIds.retainAll(ids);
    _failedReplacementIds.retainAll(ids);
    _resetPageCursor();
  }

  final Map<String, List<GuideProgram>> _programsByChannel = {};

  Map<String, Set<String>> _channelGroups = {};
  List<ChannelGroupSource> _sources = const [];
  ChannelGroupSource? sourceForGroup(String group) =>
      _sources.where((source) => source.groupId == group).firstOrNull;
  PromotedChannelGroup? _promoted;
  Set<String>? _promotedIds;
  Object? _promotedError;
  Timer? _promotedTimer;
  bool _guideVisible = true;
  bool get isPromotedGroupSelected =>
      _promoted != null && _selectedGroup == _promoted!.name;
  bool get _awaitingGroupIds => isPromotedGroupSelected && _promotedIds == null;
  Set<String>? _programmeCategories;
  Iterable<GuideFilter> get availableProgrammeCategories => filters.where(
    (filter) =>
        _isCategory(filter) &&
        (_programmeCategories?.contains(filter.name) ?? true),
  );
  bool get supportsGroupPicker => _client.liveTvApi is ChannelGroupApi;
  Map<String, int> _groupCounts = const {};
  int? channelCountForGroup(String group) =>
      group == _promoted?.name && _promotedIds == null
      ? null
      : _groupCounts[group] ?? 0;
  List<String> _availableGroups = const [];
  List<String> get availableGroups => _availableGroups;
  List<GuideFilterChoice> availableSavedFilters({
    required bool includeCategories,
  }) {
    final keys = GetIt.instance<UserPreferences>().get(
      UserPreferences.liveTvSavedFilters,
    );
    final categories = {
      if (includeCategories)
        for (final filter in availableProgrammeCategories)
          'category:${filter.name}': filter,
    };
    return [
      for (final key in keys.toSet())
        if (categories[key] case final category?)
          (category, null)
        else if (key.startsWith('group:') &&
            _groupCounts.containsKey(key.substring(6)))
          (GuideFilter.all, key.substring(6)),
    ];
  }

  Future<void> toggleSavedFilter(GuideFilterChoice choice) async {
    if (!choice.canFavorite) return;
    await GetIt.instance<PluginSyncService>().changePinnedGuideFilter(
      _client,
      filter: choice.preferenceKey,
      onLocalChange: _notifyListeners,
    );
    _notifyListeners();
  }

  String? _selectedGroup;
  String? get selectedGroup => _selectedGroup;
  String _channelQuery = '';
  List<GuideChannel> _pageChannels = const [];
  int _lineupRequest = 0;
  (String, String?)? _groupAccount;

  List<String> groupsForChannel(String channelId) {
    final groups = {
      ...?_channelGroups[channelId],
      if (_promotedIds?.contains(channelId) == true) _promoted!.name,
    };
    final selected = _selectedGroup;
    final others = groups.where((group) => group != selected).toList()
      ..sort((a, b) {
        final order = a.toLowerCase().compareTo(b.toLowerCase());
        return order == 0 ? a.compareTo(b) : order;
      });
    return [
      if (selected != null && groups.contains(selected)) selected,
      ...others,
    ];
  }

  // Search the full channel list first, so a match appears even if its
  // guide data hasn't loaded.
  void _updatePageRows() {
    Iterable<GuideChannel> rows = _channels;
    final group = _selectedGroup;
    if (group != null) {
      rows = rows.where(
        (channel) => group == _promoted?.name
            ? _promotedIds?.contains(channel.id) == true
            : _channelGroups[channel.id]?.contains(group) == true,
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
    _windowRequest++;
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
    _retryingFailedProgramIds.clear();
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

  /// The pending time, while its request still belongs to the current guide page.
  DateTime? get pendingWindowStart {
    final move = _pendingWindow;
    return move != null && move.current() ? move.start : null;
  }

  Future<bool>? get pendingWindowResult {
    final move = _pendingWindow;
    return move != null && move.current() ? move.settled.future : null;
  }

  List<GuideChannel> get filteredChannels {
    if (!_isCategory(_filter)) return _pageChannels;
    if (_categoryLoadedFor != _filter) {
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

  bool canRecordChannel(String channelId) =>
      !isPlexFreeTvChannel(_client, channelId);

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
      ).setFavorite(channelId, isFavorite: next, isChannel: true,
          expectedChannelKey: channelFavoriteKey(current.rawData));
    } catch (_) {
      if (identical(channelForId(channelId), updated)) _applyChannelUpdate(current);
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
    if (_listingsStatePage == _pageGeneration) {
      if (!listingsAccessDenied) await _reloadPrograms();
      return;
    }
    final recordingRevision = liveTvRecordingRevision.value;
    try {
      final categoryResult = _isCategory(_filter)
          ? await _refreshCategoryRows(recordingRevision)
          : true;
      if (categoryResult == null ||
          recordingRevision != liveTvRecordingRevision.value) {
        return;
      }
      if (await _refreshLoadedChannels(_now(), includeAll: true) &&
          categoryResult &&
          recordingRevision == liveTvRecordingRevision.value) {
        _loadedRecordingRevision = recordingRevision;
      }
    } catch (error) {
      if (recordingRevision == liveTvRecordingRevision.value &&
          !_accessDenied(error)) {
        await _reloadPrograms();
      }
    }
  }

  /// A category view keeps its own program lists. A recording change doesn't
  /// change which programs belong to the category, so the channels already
  /// shown are fetched again and their lists swapped.
  Future<bool?> _refreshCategoryRows(int recordingRevision) async {
    final request = _categoryRequest;
    final session = userDataSync.session;
    final filter = _filter;
    final channels = {..._categoryPrograms.keys, ..._categoryFailedIds}
        .map(channelForId)
        .whereType<GuideChannel>()
        .toList();
    // Collect everything before publishing, so an older request cannot
    // overwrite badges from a newer recording change halfway through.
    final refreshed = <String, List<GuideProgram>>{};
    final failed = <String>{};
    final succeeded = <String>{};
    final size = _batchSizeFor(filter);
    bool current() =>
        !_disposed &&
        request == _categoryRequest &&
        filter == _filter &&
        session == userDataSync.session &&
        recordingRevision == liveTvRecordingRevision.value;
    for (var i = 0; i < channels.length; i += size) {
      final batch = channels.sublist(i, min(i + size, channels.length));
      final fetched = await _fetchPrograms(batch, category: filter, current: current);
      if (!current()) return null;
      failed.addAll(fetched.failedChannelIds);
      for (final channel in batch) {
        if (fetched.failedChannelIds.contains(channel.id)) continue;
        succeeded.add(channel.id);
        final programs = fetched.programs[channel.id];
        if (programs != null) refreshed[channel.id] = programs;
      }
    }
    if (!current()) return null;
    // A successful empty result means this channel left the category.
    // Only failed requests retain the old entry and can be retried.
    _categoryPrograms.removeWhere((id, _) => succeeded.contains(id));
    _categoryPrograms.addAll(refreshed);
    _categoryFailedIds.removeAll(succeeded);
    _categoryFailedIds.addAll(failed);
    _notifyListeners();
    return failed.isEmpty;
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
    final session = userDataSync.session;
    final lineupRequest = ++_lineupRequest;
    final opening = _usesPlaybackLineup ? null : Completer<bool>();
    _openingLineup?.complete(false);
    _openingLineup = opening;
    // Older listings must not publish under the new time while the lineup loads.
    _resetPrograms();
    if (window != null) _requestedGuideWindow = window;
    _guideWindow = _requestedGuideWindow;
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
      _openingLineup = null;
      if (loadGeneration != _loadGeneration) {
        // The channel list is still valid, but the new date needs its own listings.
        await _reloadPrograms();
        return;
      }

      var move = _pendingWindow;
      if (opening != null && move != null && move.current()) {
        _resetPrograms();
        listingsPage = _pageGeneration;
        _listingsStatePage = listingsPage;
        opening.complete(true);
        // Follow replacements until a move commits or the original time is needed.
        do {
          if (await move!.settled.future) {
            if (loadGeneration == _loadGeneration && session == userDataSync.session) {
              _reloadOnEntry = false;
            }
            return;
          }
          if (!current() || session != userDataSync.session) return;
          move = _pendingWindow;
        } while (move != null && move.current());
      }

      final initial = loadInitialPrograms(channelIds: initialChannelIds);
      listingsPage = _pageGeneration;
      _listingsStatePage = listingsPage;
      await initial;
      if (!current()) return;
      _listingsStatePage = null;
      if (session != userDataSync.session) {
        _reloadOnEntry = true;
        _state = GuideState.ready;
      } else if (_isCategory(_filter)) {
        await _loadCategoryPrograms();
      } else {
        _state = GuideState.ready;
      }
      if (loadGeneration == _loadGeneration &&
          session == userDataSync.session &&
          _state == GuideState.ready) {
        _reloadOnEntry = false;
        if (_failedProgramIds.isEmpty && !hasFailedCategoryListings) {
          _loadedRecordingRevision = recordingRevision;
        }
      }
    } catch (e) {
      if (!current()) return;
      _error = e;
      _state = GuideState.error;
    } finally {
      if (identical(_openingLineup, opening)) _openingLineup = null;
      if (opening != null && !opening.isCompleted) {
        opening.complete(false);
      }
    }
    _notifyListeners();
  }

  void setGroup(String name) => setFilter(GuideFilter.all, group: name);

  void setFilter(GuideFilter value, {String? group, bool clearSearch = false}) {
    if (group != null && !_availableGroups.contains(group)) return;
    final queryChanged = clearSearch && _channelQuery.isNotEmpty;
    if (!queryChanged && _filter == value && _selectedGroup == group) {
      unawaited(refreshPromotedGroup());
      if (_isCategory(value) && _categoryFailedIds.isNotEmpty) {
        unawaited(_retryCategoryFailures());
      }
      if (group != null &&
          _state == GuideState.ready &&
          _failedProgramIds.isNotEmpty &&
          _pageChannels.any((c) => loadStateFor(c.id) == GuideChannelLoadState.failed)) {
        _resetPageCursor();
        unawaited(loadMorePrograms());
      }
      return;
    }
    if (queryChanged) {
      _channelQuery = '';
      _categoryLoadedFor = null;
    }
    _windowRequest++;
    final scopeChanged =
        queryChanged ||
        _selectedGroup != group ||
        _filter == GuideFilter.favorites ||
        value == GuideFilter.favorites;
    _selectedGroup = group;
    _filter = value;
    unawaited(refreshPromotedGroup());
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
    final session = userDataSync.session;
    _categoryFetchInFlight = true;
    _listingsStatePage = null;
    _error = null;
    _state = GuideState.loading;
    _notifyListeners();
    try {
      if (!await _walkCategory()) return;
      if (request != _categoryRequest || session != userDataSync.session) {
        return;
      }
      _categoryLoadedFor = _filter;
      _state = GuideState.ready;
    } catch (e) {
      if (request != _categoryRequest || session != userDataSync.session) {
        return;
      }
      _listingsStatePage = _pageGeneration;
      _error = e;
      _state = GuideState.error;
    } finally {
      // A replaced category owns its own loading state. Only clean up the
      // request that still owns this slot.
      if (!_disposed && request == _categoryRequest) {
        if (session != userDataSync.session) {
          // A session switch can invalidate the walk without starting another
          // load. Discard the old rows and reload on the next guide entry.
          _resetCategory();
          _reloadOnEntry = true;
          if (_state == GuideState.loading) _state = GuideState.ready;
        } else {
          _categoryFetchInFlight = false;
        }
        _notifyListeners();
      }
    }
  }

  /// Look up one channel outside the loaded page of a program category.
  /// A missing match means the channel doesn't belong to this category now.
  Future<bool> ensureCategoryChannel(String channelId) async {
    final category = _filter;
    if (!_isCategory(category) || _categoryLoadedFor != category) return false;
    if (_categoryPrograms.containsKey(channelId)) return true;
    if (_categoryQueriedIds.contains(channelId)) return false;
    final channel = _pageChannels.where((c) => c.id == channelId).firstOrNull;
    if (channel == null) return false;

    final request = _categoryRequest;
    final session = userDataSync.session;
    final recordingRevision = liveTvRecordingRevision.value;
    bool current() =>
        !_disposed &&
        request == _categoryRequest &&
        session == userDataSync.session &&
        category == _filter &&
        recordingRevision == liveTvRecordingRevision.value &&
        _pageChannels.any((c) => c.id == channelId);
    final reply = await _fetchPrograms([channel], category: category, current: current);
    if (!current()) return false;
    if (reply.failedChannelIds.contains(channelId)) return false;
    _categoryQueriedIds.add(channelId);
    _advanceCategoryCursor();
    final matches = reply.programs[channelId];
    if (matches == null) return false;
    _categoryPrograms[channelId] = matches;
    _notifyListeners();
    return true;
  }

  static int _batchSizeFor(GuideFilter? category) =>
      _serverFilteredCategories.contains(category)
      ? _categoryBatchSize
      : _programBatchSize;

  bool _temporaryCategoryFailure(Object error) =>
      !_accessDenied(error) &&
      (error is TimeoutException || isTransientTransportFailure(error));

  Future<bool> _walkCategory({int? recordingRevision}) async {
    final request = _categoryRequest;
    final filter = _filter;
    final session = userDataSync.session;
    bool current() =>
        !_disposed &&
        request == _categoryRequest &&
        filter == _filter &&
        session == userDataSync.session &&
        (recordingRevision == null || recordingRevision == liveTvRecordingRevision.value);
    final startRows = _categoryPrograms.length;
    while (current() &&
        _categoryHighWater < _pageChannels.length &&
        _categoryPrograms.length - startRows < _categoryMinRowsPerPage) {
      final size = _batchSizeFor(filter);
      final end = min(_categoryHighWater + size, _pageChannels.length);
      final batch = _pageChannels
          .sublist(_categoryHighWater, end)
          .where((c) => !_categoryQueriedIds.contains(c.id))
          .toList();
      var transportFailed = false;
      final fetched = await _fetchPrograms(batch, category: filter, current: current).onError<Object>(
        (_, _) {
          transportFailed = true;
          return (
            programs: <String, List<GuideProgram>>{},
            failedChannelIds: batch.map((channel) => channel.id).toSet(),
          );
        },
        test: (error) => !current() || _temporaryCategoryFailure(error),
      );
      if (!current()) return false;
      var failed = fetched.failedChannelIds;
      if (failed.isNotEmpty) {
        try {
          final retry = await _fetchPrograms(
            batch.where((channel) => failed.contains(channel.id)).toList(),
            category: filter,
            current: current,
          );
          if (!current()) return false;
          fetched.programs.addAll(retry.programs);
          failed = retry.failedChannelIds;
          transportFailed = false;
        } catch (error) {
          if (!current()) return false;
          if (!_temporaryCategoryFailure(error)) {
            // Dio wraps JSON decoder errors before the response reaches the guide.
            final cause = error is DioException && error.type == DioExceptionType.unknown
                ? error.error
                : error;
            final malformed = cause is FormatException || cause is TypeError;
            final hasListings = fetched.programs.isNotEmpty || _categoryPrograms.isNotEmpty;
            if (!malformed || !hasListings) rethrow;
            debugPrint('Malformed Live TV category retry (${cause.runtimeType})');
          }
        }
      }
      if (!current()) return false;
      _categoryFailedIds.addAll(failed);
      // Track category failures separately from All Channels. Mark the batch
      // as visited so failed channels don't block pagination; Retry handles them.
      _categoryQueriedIds.addAll(batch.map((c) => c.id));
      _advanceCategoryCursor();
      // Two transport failures on the same batch are enough for this walk.
      if (transportFailed) break;
      if (fetched.programs.isEmpty) continue;
      _categoryPrograms.addAll(fetched.programs);
      _notifyListeners();
    }
    return current();
  }

  /// Selecting the same category again retries only its missing EPG channels.
  /// Failed rows are absent from the category list, so the usual row Retry
  /// control cannot target them.
  Future<void> _retryCategoryFailures() async {
    if (_disposed || _categoryFetchInFlight || _state != GuideState.ready ||
        _categoryFailedIds.isEmpty) {
      return;
    }
    final request = _categoryRequest;
    final session = userDataSync.session;
    final recordingRevision = liveTvRecordingRevision.value;
    final filter = _filter;
    final failed = _categoryFailedIds.toList();
    bool current() =>
        !_disposed &&
        request == _categoryRequest &&
        filter == _filter &&
        session == userDataSync.session &&
        recordingRevision == liveTvRecordingRevision.value;
    _categoryFetchInFlight = true;
    _notifyListeners();
    try {
      final size = _batchSizeFor(filter);
      for (var i = 0; i < failed.length; i += size) {
        final batch = failed
            .skip(i)
            .take(size)
            .map(channelForId)
            .whereType<GuideChannel>()
            .toList();
        if (batch.isEmpty) continue;
        final requested = batch.map((c) => c.id).toSet();
        final reply = await _fetchPrograms(batch, category: filter, current: current).onError<Object>(
          (_, _) => (programs: <String, List<GuideProgram>>{}, failedChannelIds: requested),
          test: _temporaryCategoryFailure,
        );
        if (!current()) return;
        final recovered = requested.difference(reply.failedChannelIds);
        _categoryPrograms.removeWhere((id, _) => recovered.contains(id));
        _categoryFailedIds.removeAll(requested);
        _categoryFailedIds.addAll(reply.failedChannelIds);
        _categoryPrograms.addAll(reply.programs);
        _notifyListeners();
      }
      if (hasMorePrograms && _categoryPrograms.length < _categoryMinRowsPerPage) {
        await _walkCategory(recordingRevision: recordingRevision);
      }
    } catch (_) {
      // Keep the failed IDs for the next explicit selection. An authorization
      // error is handled by _fetchGuide's existing guide-wide error path.
    } finally {
      if (!_disposed && request == _categoryRequest) {
        _categoryFetchInFlight = false;
        _notifyListeners();
      }
    }
  }

  void _resetCategory() {
    _categoryFetchInFlight = false;
    _categoryPrograms.clear();
    _categoryQueriedIds.clear();
    _categoryFailedIds.clear();
    _categoryHighWater = 0;
    _categoryLoadedFor = null;
    _categoryRequest++;
  }

  Future<bool> setDate(DateTime date) => setWindowStart(
    DateTime(date.year, date.month, date.day, _windowStart.hour),
  );

  Future<bool> shiftWindow(Duration amount) =>
      setWindowStart(_windowStart.add(amount));

  /// Publishes the requested time and listings together. A superseded move
  /// returns false; a failed request leaves the displayed window available.
  Future<bool> setWindowStart(
    DateTime start, {
    bool livePosition = false,
    bool paging = false,
  }) async {
    if (_disposed || listingsAccessDenied) return false;
    final pending = _pendingWindow;
    if (paging &&
        pending != null &&
        pending.paging &&
        pending.current() &&
        start != _windowStart &&
        start.isBefore(_windowStart) != pending.start.isBefore(_windowStart)) {
      cancelPendingPage();
      return false;
    }
    if (start == _windowStart && _requestedGuideWindow == _guideWindow) {
      _windowRequest++;
      _finishPendingWindow();
      _atLivePosition = livePosition;
      return true;
    }
    final opening = _openingLineup;
    // Once the lineup is ready, paging can run alongside the opening listings.
    if (_state == GuideState.loading &&
        opening == null &&
        !_categoryFetchInFlight &&
        _listingsStatePage != _pageGeneration) {
      return false;
    }
    // Paging fetches listings and cannot recover a failed channel list.
    if (_state == GuideState.error && _listingsStatePage == null) return false;
    _finishPendingWindow();
    final request = ++_windowRequest;
    final load = _loadGeneration;
    final session = userDataSync.session;
    // A favorite can reorder rows during the move. _replaceProgramPages
    // retries those rows for the same target time.
    bool current() =>
        !_disposed &&
        request == _windowRequest &&
        load == _loadGeneration &&
        session == userDataSync.session;
    final move = (
      start: start,
      paging: paging,
      current: current,
      settled: Completer<bool>(),
    );
    var moved = false;
    _pendingWindow = move;
    try {
      if (opening != null && !await opening.future) return false;
      moved = await _replaceProgramPages(
        current,
        windowStart: start,
        livePosition: livePosition,
      );
      return moved;
    } finally {
      if (_pendingWindow == move) _finishPendingWindow(moved: moved);
    }
  }

  void cancelPendingPage() {
    if (_pendingWindow?.paging != true) return;
    _windowRequest++;
    _finishPendingWindow();
  }

  void _finishPendingWindow({bool moved = false}) {
    _pendingWindow?.settled.complete(moved);
    _pendingWindow = null;
  }

  Future<void> setWindow(Duration window) async {
    _requestedGuideWindow = window;
    // Retry if another request superseded the resize, not if loading failed.
    while (!_disposed &&
        _requestedGuideWindow == window &&
        _guideWindow != window) {
      final pending = pendingWindowResult;
      if (pending != null) {
        await pending;
        continue;
      }
      if (_state != GuideState.ready && !_categoryFetchInFlight) return;
      final request = _windowRequest;
      final moved = await setWindowStart(
        _windowStart,
        livePosition: _atLivePosition,
      );
      if (moved || _windowRequest == request + 1) return;
    }
  }

  Future<void> _reloadPrograms() async {
    final loadGeneration = ++_loadGeneration;
    final depth = _requestedPageDepth;
    _resetPrograms();
    _reloadDepth = depth;
    final page = _pageGeneration;
    _listingsStatePage = page;
    _error = null;
    _state = GuideState.loading;
    _notifyListeners();

    bool current() =>
        !_disposed &&
        loadGeneration == _loadGeneration &&
        page == _pageGeneration;
    try {
      await _replaceProgramPages(current);
    } catch (e) {
      if (!current()) return;
      _error = e;
      _state = GuideState.error;
      _notifyListeners();
    }
  }

  Future<void> goToNow({DateTime? windowStart}) async {
    _guideDate = _now();
    await load(windowStart: windowStart, livePosition: true);
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
    _windowRequest++;
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
      _setGroupSources(const [], null);
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
        lineup = await (api as ChannelGroupApi).getChannelGroups(
          userId: _client.userId,
        );
      } catch (error) {
        if (api is DirectChannelGroupApi) {
          // Emby's group request already fetched the channel lineup.
          // Retrying through getChannels would repeat a failed request.
          if (error is DioException && _accessDenied(error) && current()) {
            _discardDeniedChannelLineup(error);
          }
          rethrow;
        }
        debugPrint('Live TV channel groups unavailable (${error.runtimeType})');
        if (_accessDenied(error)) {
          lineup = const ChannelGroupLineup({}, endpointAvailable: false);
        }
      }
      if (!current()) return false;
      if (lineup?.endpointAvailable == false) {
        _setGroupSources(const [], null);
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
    if (_client.serverType == ServerType.plex) {
      PlexLiveTvFavorites.pruneMissingDvrChannels(_client, lineup);
      // Keep cached favorites visible if Plex Cloud fails. Retry on next open.
      unawaited(PlexLiveTvFavorites.refresh(_client).catchError((Object _) {}));
    }
    if (lineup != null) {
      // Null means the category check was unavailable, not unchanged.
      _programmeCategories = lineup.programmeCategories;
      _applyChannelGroupLineup(lineup);
      if (isPromotedGroupSelected) {
        await refreshPromotedGroup();
        if (!current()) return false;
      }
    } else if (account != null) {
      // The fallback channel reply cannot confirm the previous categories.
      _programmeCategories = null;
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
        _discardDeniedChannelLineup(error);
      }
      return null;
    }
  }

  void _discardDeniedChannelLineup(DioException error) {
    // A denied channel request must discard the previous user's lineup too.
    _loadGeneration++;
    cancelBoundaryRefresh();
    _channels = const [];
    _programmeCategories = null;
    _channelGroups = {};
    _setGroupSources(const [], null);
    _filter = GuideFilter.all;
    _rebuildGroupChoices(complete: true);
    _resetPrograms();
    _error = error;
    _state = GuideState.error;
    _reloadOnEntry = true;
    _notifyListeners();
  }

  void _publishChannels(List<Map<String, dynamic>> items, int revision) {
    final channels = [
      for (final item in items) PlexLiveTvFavorites.applyToItem(_client, item, fromLineup: true),
    ];
    final fresh = <String, Map<String, dynamic>>{};
    for (final item in channels) {
      final id = channelFavoriteKey(item) ?? item['Id']?.toString();
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
        channels
            .map(GuideChannel.fromRawItem)
            .map((channel) => channel.withSyncedUserData())
            .toList()
          ..sort(comparatorFor(_sortBy));
  }

  void _rebuildGroupChoices({required bool complete}) {
    final promoted = _promoted?.name;
    final counts = <String, int>{
      for (final source in _sources) source.groupId: 0,
      ?promoted: 0,
    };
    for (final channel in _channels) {
      for (final group in _channelGroups[channel.id] ?? const <String>{}) {
        counts[group] = (counts[group] ?? 0) + 1;
      }
      if (promoted != null && _promotedIds?.contains(channel.id) == true) {
        counts[promoted] = counts[promoted]! + 1;
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
    final names = counts.keys.toSet();
    _availableGroups = [
      for (final source in _sources)
        if (names.remove(source.groupId)) source.groupId,
      if (promoted != null && names.remove(promoted)) promoted,
      ...(names.toList()..sort()),
    ];
    _updatePageRows();
  }

  /// Reload the pages the viewer had already reached.
  Future<bool> _replaceProgramPages(
    bool Function() current, {
    DateTime? windowStart,
    bool livePosition = false,
  }) async {
    while (current()) {
      final page = _pageGeneration;
      final generation = _programGeneration;
      final recordingRevision = liveTvRecordingRevision.value;
      final from = windowStart ?? _windowStart;
      final span = windowStart == null ? _guideWindow : _requestedGuideWindow;
      final to = from.add(span);
      bool samePage() =>
          current() &&
          page == _pageGeneration &&
          generation == _programGeneration &&
          recordingRevision == liveTvRecordingRevision.value &&
          (windowStart == null || span == _requestedGuideWindow);
      final category = _isCategory(_filter) ? _filter : null;
      // Carry over rows already loaded or requested within the active filter.
      final requestedRows = windowStart != null && category == null
          ? _pageChannels.where((channel) {
              return _programsLoadedIds.contains(channel.id) ||
                  _failedProgramIds.contains(channel.id) ||
                  _programsPending[channel.id]?.generation == generation;
            }).toList()
          : const <GuideChannel>[];
      final rows = requestedRows.isEmpty ? _pageChannels : requestedRows;
      // A focus restore may have fetched a matching category channel far
      // beyond the scroll prefix. Retain those targets across window changes.
      final previouslyShownCategoryRows =
          windowStart != null && category != null && _categoryLoadedFor == category
          ? [
              for (final channel in _pageChannels)
                if (_categoryPrograms.containsKey(channel.id)) channel,
            ]
          : const <GuideChannel>[];
      final size = _batchSizeFor(category);
      final fetched = <String, List<GuideProgram>>{};
      final failed = <String>{};
      var consecutiveTransportFailures = 0;
      bool canFetchMore() => windowStart == null || consecutiveTransportFailures < 2;
      Future<void> fetchBatch(List<GuideChannel> batch) async {
        try {
          final reply = await _fetchPrograms(
            batch,
            category: category,
            current: samePage,
            from: from,
            to: to,
          );
          fetched.addAll(reply.programs);
          failed.addAll(reply.failedChannelIds);
          consecutiveTransportFailures = 0;
        } catch (error) {
          if (!samePage()) return;
          if (_accessDenied(error) ||
              (error is! TimeoutException && !isTransientTransportFailure(error))) {
            rethrow;
          }
          failed.addAll(batch.map((channel) => channel.id));
          consecutiveTransportFailures++;
        }
      }
      var end = 0;
      try {
        while (end < rows.length && canFetchMore()) {
          final start = end;
          end = min(start + size, rows.length);
          await fetchBatch(rows.sublist(start, end));
          if (!samePage()) break;
          if (requestedRows.isEmpty &&
              end >= _requestedPageDepth &&
              (category == null || fetched.length >= _categoryMinRowsPerPage)) {
            break;
          }
        }
        // Previously requested rows beyond the cutoff remain available for Retry.
        failed.addAll(requestedRows.skip(end).map((channel) => channel.id));
        if (windowStart != null && category != null && samePage()) {
          final prefixIds = rows.take(end).map((channel) => channel.id).toSet();
          final extraRows = [
            for (final channel in previouslyShownCategoryRows)
              if (!prefixIds.contains(channel.id)) channel,
          ];
          for (var i = 0; i < extraRows.length; i += size) {
            if (!canFetchMore()) {
              failed.addAll(extraRows.skip(i).map((channel) => channel.id));
              break;
            }
            await fetchBatch(
              extraRows.sublist(i, min(i + size, extraRows.length)),
            );
            if (!samePage()) break;
          }
          // Only the scroll prefix advances _categoryQueriedIds. These
          // independently loaded rows must not change category pagination.
        }
      } catch (error) {
        // Access was denied, so the old listings have already been discarded.
        if (samePage() || (current() && identical(error, _error))) rethrow;
      }
      if (!samePage()) continue;
      final ids = rows.take(end).map((c) => c.id).toSet();
      final requestedIds = {
        ...ids,
        if (windowStart != null && category != null)
          for (final channel in previouslyShownCategoryRows) channel.id,
      };
      // Keep the current listings and time if every channel request failed.
      if (windowStart != null &&
          requestedIds.isNotEmpty &&
          requestedIds.every(failed.contains)) {
        _failedWindowMoveRevision++;
        return false;
      }
      if (windowStart != null) {
        // Invalidate old-window reads and commit without an intermediate notification.
        _resetPrograms();
        _guideWindow = span;
        _windowStart = windowStart;
        _windowEnd = to;
        _guideDate = windowStart;
        _atLivePosition = livePosition;
      }
      if (category == null) {
        _failedProgramIds.removeAll(ids);
        _failedProgramIds.addAll(failed);
        for (final id in ids) {
          if (failed.contains(id)) {
            _programsByChannel.remove(id);
            _programsLoadedIds.remove(id);
          } else {
            _programsByChannel[id] = fetched[id] ?? const [];
            _programsLoadedIds.add(id);
          }
        }
        _advanceProgramsCursor();
      } else {
        fetched.removeWhere((id, _) => failed.contains(id));
        _categoryPrograms
          ..clear()
          ..addAll(fetched);
        _categoryFetchInFlight = false;
        _categoryFailedIds
          ..clear()
          ..addAll(failed);
        _categoryQueriedIds.addAll(ids);
        _advanceCategoryCursor();
        _categoryLoadedFor = category;
      }
      _reloadDepth = 0;
      if (failed.isEmpty && recordingRevision == liveTvRecordingRevision.value) {
        _loadedRecordingRevision = recordingRevision;
      }
      _listingsStatePage = null;
      _state = GuideState.ready;
      _error = null;
      _notifyListeners();
      return true;
    }
    return false;
  }

  bool _accessDenied(Object? error) =>
      error is DioException &&
      (error.response?.statusCode == 401 || error.response?.statusCode == 403);

  void _applyChannelGroupLineup(ChannelGroupLineup lineup) {
    final removedSources = {
      for (final source in _sources)
        if (!lineup.sources.contains(source)) source.groupId,
    };
    _setGroupSources(lineup.sources, lineup.promoted);
    final unresolved = lineup.unresolvedChannelIds;
    final partial = lineup.partial;
    final updated = <String, Set<String>>{};
    for (final channel in _channels) {
      final id = channel.id;
      final unknown = partial && (unresolved?.contains(id) ?? true);
      final known = lineup.groupsByChannelId[id];
      final previous = _channelGroups[id];
      final groups = unknown && previous != null
          ? {...previous.difference(removedSources), ...?known}
          : known;
      if (groups != null) updated[id] = groups;
    }
    _channelGroups = updated;
    // Keep existing groups for channels the plugin couldn't check.
    // If the response doesn't identify missing channels, keep the selected group.
    _rebuildGroupChoices(complete: !partial || unresolved != null);
  }

  void _setGroupSources(
    List<ChannelGroupSource> sources,
    PromotedChannelGroup? promoted,
  ) {
    _sources = sources;
    if (!identical(_promoted, promoted)) {
      _promotedTimer?.cancel();
      _promotedError = null;
    }
    _promoted = promoted;
    _promotedIds = promoted?.channelIds;
  }

  void setGuideVisible(bool visible) {
    if (_guideVisible == visible) return;
    _guideVisible = visible;
    if (visible) {
      scheduleMicrotask(() => unawaited(refreshPromotedGroup()));
    } else {
      _promotedTimer?.cancel();
    }
  }

  /// Refresh Featured only while it's selected and the guide is visible.
  Future<void> refreshPromotedGroup({bool force = false}) async {
    _promotedTimer?.cancel();
    final group = _promoted;
    if (_disposed ||
        !_guideVisible ||
        group == null ||
        group.name != _selectedGroup) {
      return;
    }
    final remaining = group.expiresAt?.difference(_now()) ?? Duration.zero;
    final fresh = !force && remaining > Duration.zero;
    if (!fresh) {
      final session = userDataSync.session;
      final api = _client.liveTvApi;
      if (_awaitingGroupIds && _promotedError != null) {
        _promotedError = null;
        _notifyListeners();
      }
      Object? failure;
      try {
        await group.refresh(_now);
      } catch (error) {
        failure = error;
      }
      if (_disposed ||
          !identical(_promoted, group) ||
          session != userDataSync.session ||
          !identical(api, _client.liveTvApi) ||
          _groupAccount != (_client.baseUrl, _client.userId)) {
        return;
      }
      _promotedError = failure;
    }
    final selected = _selectedGroup == group.name;
    final changed = !setEquals(_promotedIds, group.channelIds);
    if (changed) {
      _promotedIds = group.channelIds;
      _rebuildGroupChoices(complete: true);
      if (selected) {
        // Refresh the page without canceling a pending time-window move.
        _resetPageCursor();
        if (_state == GuideState.ready) unawaited(loadMorePrograms());
      }
    }
    if (selected && _guideVisible) {
      _promotedTimer?.cancel();
      _promotedTimer = Timer(
        fresh ? remaining : PromotedChannelGroup.lifetime,
        () => unawaited(refreshPromotedGroup(force: true)),
      );
    }
    if (!fresh || changed) _notifyListeners();
  }

  void _resetPrograms() {
    _advancePage();
    _programGeneration++;
    _programsByChannel.clear();
    _programsLoadedIds.clear();
    _failedProgramIds.clear();
    _failedReplacementIds.clear();
    _retryingFailedProgramIds.clear();
    _programsHighWater = 0;
    _processedBoundaries.clear();
    _resetCategory();
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
    final session = userDataSync.session;
    bool current() =>
        !_disposed &&
        generation == _programGeneration &&
        pageGeneration == _pageGeneration &&
        session == userDataSync.session;
    final requestedEnd = min(
      _programsHighWater + _programBatchSize,
      _pageChannels.length,
    );
    _loadingMorePage = page;
    try {
      // Fetch the scroll batch for whichever window actually stays on screen.
      var move = _pendingWindow;
      while (move != null && move.current()) {
        await move.settled.future;
        if (!current()) return;
        move = _pendingWindow;
      }
      if (_isCategory(_filter)) {
        if (!await _walkCategory(recordingRevision: liveTvRecordingRevision.value)) return;
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
            hasMorePrograms &&
            (_isCategory(_filter) || _programsHighWater < requestedEnd)) {
          await loadMorePrograms();
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
    // Failed rows remain retryable without blocking later channel batches.
    if (await _loadProgramsBatch(batch) &&
        pageGeneration == _pageGeneration &&
        batch.every((c) =>
            _programsLoadedIds.contains(c.id) ||
            _failedProgramIds.contains(c.id))) {
      _programsHighWater = end;
      _advanceProgramsCursor();
    }
  }

  /// Ensures the given channels' programs are fetched even if they sit past the
  /// scroll high-water mark (e.g. favorites). Loads only the missing ones.
  Future<void> ensureProgramsForChannels(List<String> channelIds) async {
    final session = userDataSync.session;
    final load = _loadGeneration;
    var move = pendingWindowResult;
    while (move != null) {
      await move;
      if (_disposed || load != _loadGeneration || session != userDataSync.session) {
        return;
      }
      move = pendingWindowResult;
    }
    if (_disposed || listingsAccessDenied) return;
    final lineup = _channels;
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

  /// Retries failed listings in the current filter without reloading
  /// the lineup or channels that already have programs.
  Future<void> retryFailedPrograms() {
    final page = _pageGeneration;
    final active = _failedProgramsRetry;
    if (active != null && active.page == page) return active.task;
    if (_disposed || _state != GuideState.ready) return Future<void>.value();
    final failed = filteredChannels
        .where((c) => _failedProgramIds.contains(c.id) && !hasProgramsFor(c.id))
        .toList();
    if (failed.isEmpty) return Future<void>.value();

    final generation = _programGeneration;
    final session = userDataSync.session;
    bool current() =>
        !_disposed &&
        page == _pageGeneration &&
        generation == _programGeneration &&
        session == userDataSync.session;
    final ids = failed.map((c) => c.id).toSet();
    _retryingFailedProgramIds.addAll(ids);
    _notifyListeners();

    Future<void> retry() async {
      try {
        for (var i = 0; i < failed.length; i += _programBatchSize) {
          if (!current()) return;
          final batch = failed.sublist(
            i,
            min(i + _programBatchSize, failed.length),
          );
          try {
            await _loadProgramsBatch(batch);
          } catch (_) {
            // Keep network failures retryable; permission errors already put the
            // whole guide into an error state.
            if (current() && !listingsAccessDenied) {
              _failedProgramIds.addAll(batch.map((c) => c.id));
            }
          } finally {
            if (current()) {
              _retryingFailedProgramIds.removeAll(batch.map((c) => c.id));
              _notifyListeners();
            }
          }
        }
      } finally {
        if (_failedProgramsRetry?.page == page) {
          _retryingFailedProgramIds.removeAll(ids);
          _failedProgramsRetry = null;
          _notifyListeners();
        }
      }
    }

    final task = retry();
    _failedProgramsRetry = (page: page, task: task);
    return task;
  }

  /// Replaces the cached programs for [channelIds] over an explicit [from]-[to]
  /// range. The range is decoupled from the guide viewport so a refresh can
  /// extend coverage past it, and no guide-wide loading state is entered, so
  /// every other row keeps rendering and selection (held by id) survives.
  Future<bool> replacePrograms({
    required List<String> channelIds,
    required DateTime from,
    required DateTime to,
  }) async {
    if (channelIds.isEmpty) return true;
    final generation = ++_programGeneration;
    final session = userDataSync.session;
    final replacements = await _fetchProgramReplacements(
      List.of(channelIds),
      from: from,
      to: to,
      generation: generation,
    );
    if (replacements == null ||
        _disposed ||
        generation != _programGeneration ||
        session != userDataSync.session) {
      return false;
    }
    _programsByChannel.addAll(replacements.programs);
    _programsLoadedIds.addAll(replacements.programs.keys);
    _failedProgramIds.removeAll(replacements.programs.keys);
    _failedReplacementIds.removeAll(channelIds);
    _failedReplacementIds.addAll(replacements.failedChannelIds);
    _notifyListeners();
    if (replacements.failedChannelIds.isNotEmpty &&
        _boundarySchedulingEnabled) {
      _armRetry(failureBackoff);
    }
    return replacements.failedChannelIds.isEmpty;
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
    if (_failedReplacementIds.isNotEmpty) {
      // Keep the earlier failure retry instead of scheduling a later refresh.
      final retryAt = due ?? now.add(failureBackoff);
      _arm(retryAt.difference(now), retryAt);
      return;
    }

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
    PlexLiveTvFavorites.favoriteListChanged.removeListener(
      _onPlexFavoritesChanged,
    );
    _promotedTimer?.cancel();
    _finishPendingWindow();
    _openingLineup?.complete(false);
    _openingLineup = null;

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
    _boundaryTimer?.cancel();
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

    if (!forceRefresh &&
        _failedReplacementIds.isEmpty &&
        !_coverageLapsed(now)) {
      // The next program is already cached, so the cells promote in place.
      _boundaryRefreshInFlight = false;
      _notifyListeners();
      scheduleBoundaryRefresh();
      return;
    }

    final before = _coverageEnd();
    try {
      if (!await _refreshLoadedChannels(now) || _disposed) {
        _boundaryRefreshInFlight = false;
        // A retry is already scheduled for failed channels. Don't replace it.
        if (_boundaryDueAt == null) _rearmBoundaryIfEnabled();
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
    final session = userDataSync.session;
    final from = now.subtract(rollingRefreshLookback);
    final to = now.add(rollingRefreshHorizon);

    ({
      Map<String, List<GuideProgram>> programs,
      Set<String> failedChannelIds,
    })? replacements;
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

    if (_disposed ||
        generation != _programGeneration ||
        session != userDataSync.session) {
      _rearmBoundaryIfEnabled();
      return;
    }
    _programsByChannel.addAll(replacements.programs);
    _failedReplacementIds.removeAll(ids);
    _failedReplacementIds.addAll(replacements.failedChannelIds);
    _processedBoundaries.removeWhere((boundary) => !boundary.isAfter(now));
    _notifyListeners();
    if (_failedReplacementIds.isNotEmpty) {
      if (_boundarySchedulingEnabled) _armRetry(failureBackoff);
    } else {
      _scheduleAfterRollingRefresh();
    }
  }

  /// Replaces every cached channel over a range that spans the guide viewport,
  /// in batches, so no surface's coverage can shrink to a rolling horizon.
  Future<bool> _refreshLoadedChannels(
    DateTime now, {
    bool includeAll = false,
  }) {
    final ids = [
      for (final id in _failedProgramIds.difference(_programsLoadedIds))
        if (includeAll || _failedReplacementIds.contains(id)) id,
      for (final id in _programsLoadedIds)
        if (includeAll ||
            _failedReplacementIds.isEmpty ||
            _failedReplacementIds.contains(id) ||
            (_programsByChannel[id]?.isNotEmpty == true &&
                !_programsByChannel[id]!.any((p) => p.endDate.isAfter(now))))
          id,
    ];
    final from = _windowStart.isBefore(now) ? _windowStart : now;
    final rolling = now.add(_guideWindow);
    final to = rolling.isAfter(_windowEnd) ? rolling : _windowEnd;

    return replacePrograms(channelIds: ids, from: from, to: to);
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

  Future<({
    Map<String, List<GuideProgram>> programs,
    Set<String> failedChannelIds,
  })?> _fetchProgramReplacements(
    List<String> ids, {
    required DateTime from,
    required DateTime to,
    required int generation,
  }) async {
    final session = userDataSync.session;
    final replacements = <String, List<GuideProgram>>{};
    final failed = <String>{};
    for (var i = 0; i < ids.length; i += _programBatchSize) {
      if (_disposed ||
          generation != _programGeneration ||
          session != userDataSync.session) {
        return null;
      }
      final chunk = ids.sublist(i, min(i + _programBatchSize, ids.length));
      final Map<String, dynamic> response;
      try {
        response = await _fetchGuide(channelIds: chunk, from: from, to: to);
      } catch (error) {
        if (session != userDataSync.session ||
            (!_accessDenied(error) && generation != _programGeneration)) {
          return null;
        }
        if (!_accessDenied(error) &&
            (error is TimeoutException || isTransientTransportFailure(error))) {
          // The earlier chunks are still good. Keep this whole batch's old
          // programs and continue with later 50-channel batches.
          failed.addAll(chunk);
          continue;
        }
        rethrow;
      }
      if (_disposed ||
          generation != _programGeneration ||
          session != userDataSync.session) {
        return null;
      }
      // Merge healthy channels; retain cached programs for failed ones.
      final failedInBatch = _failedGuideIds(response);
      failed.addAll(failedInBatch);
      final parsed = _parsePrograms(response);
      for (final id in chunk) {
        if (!failedInBatch.contains(id)) {
          replacements[id] = parsed[id] ?? <GuideProgram>[];
        }
      }
    }
    return (programs: replacements, failedChannelIds: failed);
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
    bool Function()? current,
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
          (current?.call() ?? true) &&
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

  Future<({
    Map<String, List<GuideProgram>> programs,
    Set<String> failedChannelIds,
  })> _fetchPrograms(
    List<GuideChannel> batch, {
    GuideFilter? category,
    DateTime? from,
    DateTime? to,
    bool Function()? current,
  }) async {
    if (batch.isEmpty) {
      return (
        programs: <String, List<GuideProgram>>{},
        failedChannelIds: <String>{},
      );
    }
    final response = await _fetchGuide(
      channelIds: batch.map((c) => c.id).toList(),
      from: from ?? _windowStart,
      to: to ?? _windowEnd,
      category: category,
      current: current,
    );
    final byChannel = _parsePrograms(response);
    final failed = _failedGuideIds(response);
    byChannel.removeWhere((id, _) => failed.contains(id));
    if (category != null) {
      byChannel.removeWhere((_, programs) {
        programs.removeWhere((p) => !_matches(category, p));
        return programs.isEmpty;
      });
    }
    return (programs: byChannel, failedChannelIds: failed);
  }

  Set<String> _failedGuideIds(Map<String, dynamic> response) => {
    for (final id in response['FailedChannelIds'] as List? ?? const [])
      if (id is String) id,
  };

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
        final failed = _failedGuideIds(response);
        _failedProgramIds.removeAll(ids);
        for (final id in ids) {
          if (failed.contains(id)) {
            _failedProgramIds.add(id);
            continue;
          }
          // Don't overwrite newer listings if a page refresh finished first.
          if (_programsLoadedIds.add(id)) {
            _programsByChannel[id] = parsed[id] ?? <GuideProgram>[];
          }
        }
      } catch (error) {
        final transientFailure = !_accessDenied(error) &&
            (error is TimeoutException || isTransientTransportFailure(error)) &&
            (error is! DioException || error.type != DioExceptionType.cancel);
        final carouselFailure = _usesPlaybackLineup &&
            error is DioException &&
            !_accessDenied(error) &&
            error.type != DioExceptionType.cancel;
        if (!transientFailure && !carouselFailure) rethrow;
        if (!current()) return false;
        _failedProgramIds.addAll(ids);
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
