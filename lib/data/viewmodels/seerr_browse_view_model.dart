import 'package:flutter/foundation.dart';

import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';

enum SeerrBrowseFilter { all, available, requested }

/// The six states TMDB files a series under, sent to seerr pipe joined the
/// way its own filter panel does.
enum SeerrTvStatus {
  returningSeries(0, 'Returning'),
  planned(1, 'Planned'),
  inProduction(2, 'In Production'),
  ended(3, 'Ended'),
  canceled(4, 'Canceled'),
  pilot(5, 'Pilot');

  const SeerrTvStatus(this.apiValue, this.displayName);

  final int apiValue;
  final String displayName;
}

/// Score floor choices standing in for seerr's rating slider, since a slider
/// is no good to a remote.
enum SeerrMinRating {
  any(null),
  five(5),
  six(6),
  seven(7),
  eight(8),
  nine(9);

  const SeerrMinRating(this.value);

  final int? value;

  String get displayName => this == any ? 'Any' : '$value+';
}

/// Vote count floors, standing in for seerr's vote count slider.
enum SeerrMinVotes {
  any(null),
  fifty(50),
  oneHundred(100),
  twoFifty(250),
  fiveHundred(500),
  oneThousand(1000);

  const SeerrMinVotes(this.value);

  final int? value;

  String get displayName => this == any ? 'Any' : '$value+';
}

/// Runtime windows standing in for seerr's runtime slider, in minutes.
enum SeerrRuntimeFilter {
  any(null, null, 'Any'),
  underHalfHour(null, 30, 'Under 30m'),
  halfToFullHour(30, 60, '30m to 1h'),
  oneToTwoHours(60, 120, '1h to 2h'),
  overTwoHours(120, null, 'Over 2h');

  const SeerrRuntimeFilter(this.gte, this.lte, this.displayName);

  final int? gte;
  final int? lte;
  final String displayName;
}

/// Release windows standing in for seerr's date pickers. Each maps to the
/// first day of its first year through the last day of its last year.
enum SeerrReleaseWindow {
  any(null, null, 'Any'),
  twenties(2020, null, '2020s'),
  tens(2010, 2019, '2010s'),
  aughts(2000, 2009, '2000s'),
  nineties(1990, 1999, '1990s'),
  eighties(1980, 1989, '1980s'),
  older(null, 1979, 'Before 1980');

  const SeerrReleaseWindow(this.fromYear, this.toYear, this.displayName);

  final int? fromYear;
  final int? toYear;
  final String displayName;

  String? get dateGte => fromYear == null ? null : '$fromYear-01-01';
  String? get dateLte => toYear == null ? null : '$toYear-12-31';
}

class SeerrSortOption {
  final String label;
  final String value;
  const SeerrSortOption(this.label, this.value);
}

List<SeerrSortOption> getSortOptionsFor(String mediaType) {
  if (mediaType == 'tv') {
    return const [
      SeerrSortOption('Popularity', 'popularity.desc'),
      SeerrSortOption('Rating', 'vote_average.desc'),
      SeerrSortOption('Release Date', 'first_air_date.desc'),
      SeerrSortOption('Title', 'name.asc'),
    ];
  }
  return const [
    SeerrSortOption('Popularity', 'popularity.desc'),
    SeerrSortOption('Rating', 'vote_average.desc'),
    SeerrSortOption('Release Date', 'primary_release_date.desc'),
    SeerrSortOption('Title', 'original_title.asc'),
    SeerrSortOption('Revenue', 'revenue.desc'),
  ];
}

class SeerrBrowseState {
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final List<SeerrDiscoverItem> items;
  final int currentPage;
  final int totalPages;
  final SeerrSortOption sortBy;
  final SeerrBrowseFilter filter;
  final String letterFilter;
  final Set<int> genreIds;
  final Set<SeerrTvStatus> tvStatuses;
  final String languageCode;
  final SeerrMinRating minRating;
  final SeerrMinVotes minVotes;
  final SeerrRuntimeFilter runtime;
  final SeerrReleaseWindow released;

  const SeerrBrowseState({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.items = const [],
    this.currentPage = 0,
    this.totalPages = 1,
    this.sortBy = const SeerrSortOption('Popularity', 'popularity.desc'),
    this.filter = SeerrBrowseFilter.all,
    this.letterFilter = '',
    this.genreIds = const {},
    this.tvStatuses = const {},
    this.languageCode = '',
    this.minRating = SeerrMinRating.any,
    this.minVotes = SeerrMinVotes.any,
    this.runtime = SeerrRuntimeFilter.any,
    this.released = SeerrReleaseWindow.any,
  });

  bool get canLoadMore => currentPage < totalPages && !isLoadingMore;

  bool get hasDiscoverFilters =>
      genreIds.isNotEmpty ||
      tvStatuses.isNotEmpty ||
      languageCode.isNotEmpty ||
      minRating != SeerrMinRating.any ||
      minVotes != SeerrMinVotes.any ||
      runtime != SeerrRuntimeFilter.any ||
      released != SeerrReleaseWindow.any;

  SeerrBrowseState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    List<SeerrDiscoverItem>? items,
    int? currentPage,
    int? totalPages,
    SeerrSortOption? sortBy,
    SeerrBrowseFilter? filter,
    String? letterFilter,
    Set<int>? genreIds,
    Set<SeerrTvStatus>? tvStatuses,
    String? languageCode,
    SeerrMinRating? minRating,
    SeerrMinVotes? minVotes,
    SeerrRuntimeFilter? runtime,
    SeerrReleaseWindow? released,
  }) =>
      SeerrBrowseState(
        isLoading: isLoading ?? this.isLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        error: error,
        items: items ?? this.items,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        sortBy: sortBy ?? this.sortBy,
        filter: filter ?? this.filter,
        letterFilter: letterFilter ?? this.letterFilter,
        genreIds: genreIds ?? this.genreIds,
        tvStatuses: tvStatuses ?? this.tvStatuses,
        languageCode: languageCode ?? this.languageCode,
        minRating: minRating ?? this.minRating,
        minVotes: minVotes ?? this.minVotes,
        runtime: runtime ?? this.runtime,
        released: released ?? this.released,
      );
}

class SeerrBrowseViewModel extends ChangeNotifier {
  /// How many filtered items a load aims for before it stops reading ahead.
  static const _minMatchesPerLoad = 10;

  /// Ceiling on pages read in one go, so a filter that matches almost nothing
  /// cannot walk the whole library.
  static const _maxPagesPerScan = 6;

  final SeerrRepository _repo;
  final String? filterId;
  final String mediaType;
  final String? filterType;

  bool _requestLookupLoaded = false;
  final Map<int, List<SeerrRequest>> _requestsByMediaId = {};
  final Map<int, List<SeerrRequest>> _requestsByTmdbId = {};

  SeerrBrowseState _state = const SeerrBrowseState();
  SeerrBrowseState get state => _state;

  List<SeerrSortOption> get sortOptions => getSortOptionsFor(mediaType);

  SeerrBrowseViewModel(
    this._repo, {
    this.filterId,
    required this.mediaType,
    this.filterType,
  }) {
    _state = SeerrBrowseState(sortBy: sortOptions.first);
  }

  Future<void> load() async {
    _state = SeerrBrowseState(
      isLoading: true,
      sortBy: _state.sortBy,
      filter: _state.filter,
      letterFilter: _state.letterFilter,
      genreIds: _state.genreIds,
      tvStatuses: _state.tvStatuses,
      languageCode: _state.languageCode,
      minRating: _state.minRating,
      minVotes: _state.minVotes,
      runtime: _state.runtime,
      released: _state.released,
    );
    notifyListeners();

    try {
      await _repo.ensureInitialized();
      await _ensureRequestLookup();
      var pageNum = 1;
      final matches = <SeerrDiscoverItem>[];
      late SeerrDiscoverPage lastPage;

      // A letter or availability filter can reject a whole page, so keep
      // reading ahead until there is enough to fill the grid.
      while (matches.length < _minMatchesPerLoad &&
          pageNum <= _maxPagesPerScan) {
        final page = await _fetchPage(pageNum);
        lastPage = page;
        matches.addAll(_applyFilter(_attachRequesters(page.results)));
        if (page.page >= page.totalPages || page.results.isEmpty) {
          break;
        }
        pageNum++;
      }

      _state = _state.copyWith(
        isLoading: false,
        items: matches,
        currentPage: lastPage.page,
        totalPages: lastPage.totalPages,
      );
    } catch (e) {
      _state = _state.copyWith(isLoading: false, error: e.toString());
    }
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (!_state.canLoadMore) return;

    _state = _state.copyWith(isLoadingMore: true);
    notifyListeners();

    try {
      await _ensureRequestLookup();
      final startPage = _state.currentPage + 1;
      var pageNum = startPage;
      final matches = <SeerrDiscoverItem>[];
      late SeerrDiscoverPage lastPage;

      while (matches.length < _minMatchesPerLoad &&
          pageNum < startPage + _maxPagesPerScan) {
        final page = await _fetchPage(pageNum);
        lastPage = page;
        matches.addAll(_applyFilter(_attachRequesters(page.results)));
        if (page.page >= page.totalPages || page.results.isEmpty) {
          break;
        }
        pageNum++;
      }

      _state = _state.copyWith(
        isLoadingMore: false,
        items: [..._state.items, ...matches],
        currentPage: lastPage.page,
        totalPages: lastPage.totalPages,
      );
    } catch (e) {
      _state = _state.copyWith(isLoadingMore: false);
    }
    notifyListeners();
  }

  void setSortBy(SeerrSortOption option) {
    if (option.value == _state.sortBy.value) return;
    _state = _state.copyWith(sortBy: option);
    load();
  }

  void setFilter(SeerrBrowseFilter filter) {
    if (filter == _state.filter) return;
    _state = _state.copyWith(filter: filter);
    load();
  }

  void setLetterFilter(String letter) {
    if (letter == _state.letterFilter) return;
    _state = _state.copyWith(letterFilter: letter);
    load();
  }

  void toggleGenre(int genreId) {
    final ids = Set<int>.of(_state.genreIds);
    if (!ids.remove(genreId)) ids.add(genreId);
    _state = _state.copyWith(genreIds: ids);
    load();
  }

  void toggleTvStatus(SeerrTvStatus status) {
    final statuses = Set<SeerrTvStatus>.of(_state.tvStatuses);
    if (!statuses.remove(status)) statuses.add(status);
    _state = _state.copyWith(tvStatuses: statuses);
    load();
  }

  void setLanguage(String code) {
    if (code == _state.languageCode) return;
    _state = _state.copyWith(languageCode: code);
    load();
  }

  void setMinRating(SeerrMinRating value) {
    if (value == _state.minRating) return;
    _state = _state.copyWith(minRating: value);
    load();
  }

  void setMinVotes(SeerrMinVotes value) {
    if (value == _state.minVotes) return;
    _state = _state.copyWith(minVotes: value);
    load();
  }

  void setRuntime(SeerrRuntimeFilter value) {
    if (value == _state.runtime) return;
    _state = _state.copyWith(runtime: value);
    load();
  }

  void setReleased(SeerrReleaseWindow value) {
    if (value == _state.released) return;
    _state = _state.copyWith(released: value);
    load();
  }

  void clearDiscoverFilters() {
    if (!_state.hasDiscoverFilters) return;
    _state = _state.copyWith(
      genreIds: const {},
      tvStatuses: const {},
      languageCode: '',
      minRating: SeerrMinRating.any,
      minVotes: SeerrMinVotes.any,
      runtime: SeerrRuntimeFilter.any,
      released: SeerrReleaseWindow.any,
    );
    load();
  }

  /// The genres and languages the filter dialog offers, read once on first
  /// open. Genres come scoped to the media type this browse shows.
  List<SeerrGenre> _filterGenres = const [];
  List<SeerrGenre> get filterGenres => _filterGenres;

  List<SeerrLanguage> _filterLanguages = const [];
  List<SeerrLanguage> get filterLanguages => _filterLanguages;

  bool _filterOptionsRequested = false;

  Future<void> ensureFilterOptionsLoaded() async {
    if (_filterOptionsRequested) return;
    _filterOptionsRequested = true;
    try {
      final (genres, languages) = await (
        mediaType == 'tv'
            ? _repo.getGenreSliderTv()
            : _repo.getGenreSliderMovies(),
        _repo.getLanguages(),
      ).wait;
      languages.sort((a, b) => a.name.compareTo(b.name));
      _filterGenres = genres;
      _filterLanguages = languages;
      notifyListeners();
    } catch (_) {
      // The dialog just shows the static sections when the lists fail.
    }
  }

  Future<SeerrDiscoverPage> _fetchPage(int page) {
    final id = filterId != null ? int.tryParse(filterId!) : null;
    // A genre this browse was opened on and genres picked in the dialog ride
    // the same parameter, comma joined the way seerr's own panel sends them.
    final genreIds = {
      if (filterType == 'genre' && id != null) id,
      ..._state.genreIds,
    };
    final genre = genreIds.isEmpty ? null : genreIds.join(',');
    final language = _state.languageCode.isEmpty ? null : _state.languageCode;
    final voteAverageGte = _state.minRating.value?.toDouble();
    final voteCountGte = _state.minVotes.value;
    final runtime = _state.runtime;
    final released = _state.released;
    if (mediaType == 'tv') {
      return _repo.discoverTv(
        page: page,
        sortBy: _state.sortBy.value,
        genre: genre,
        network: filterType == 'network' ? id : null,
        keywords: filterType == 'keyword' ? id : null,
        language: language,
        status: _state.tvStatuses.isEmpty
            ? null
            : _state.tvStatuses.map((s) => s.apiValue).join('|'),
        voteAverageGte: voteAverageGte,
        voteCountGte: voteCountGte,
        withRuntimeGte: runtime.gte,
        withRuntimeLte: runtime.lte,
        firstAirDateGte: released.dateGte,
        firstAirDateLte: released.dateLte,
      );
    }
    return _repo.discoverMovies(
      page: page,
      sortBy: _state.sortBy.value,
      genre: genre,
      studio: filterType == 'studio' ? id : null,
      keywords: filterType == 'keyword' ? id : null,
      language: language,
      voteAverageGte: voteAverageGte,
      voteCountGte: voteCountGte,
      withRuntimeGte: runtime.gte,
      withRuntimeLte: runtime.lte,
      primaryReleaseDateGte: released.dateGte,
      primaryReleaseDateLte: released.dateLte,
    );
  }

  Future<void> _ensureRequestLookup() async {
    if (_requestLookupLoaded) return;
    try {
      final user = await _repo.getCurrentUser();
      const pageSize = 200;
      const maxItems = 1000;
      var offset = 0;

      while (offset < maxItems) {
        final response = await _repo.getRequests(
          requestedBy: user.canViewAllRequests ? null : user.id,
          limit: pageSize,
          offset: offset,
        );

        for (final req in response.results) {
          if (req.status != SeerrRequest.statusPending &&
              req.status != SeerrRequest.statusApproved) {
            continue;
          }

          final media = req.media;
          if (media == null) continue;

          _requestsByMediaId.putIfAbsent(media.id, () => []).add(req);
          final tmdbId = media.tmdbId;
          if (tmdbId != null) {
            _requestsByTmdbId.putIfAbsent(tmdbId, () => []).add(req);
          }
        }

        if (response.results.length < pageSize) {
          break;
        }

        offset += pageSize;
      }
    } catch (_) {
    } finally {
      _requestLookupLoaded = true;
    }
  }

  List<SeerrDiscoverItem> _attachRequesters(List<SeerrDiscoverItem> items) {
    if (_requestsByMediaId.isEmpty && _requestsByTmdbId.isEmpty) {
      return items;
    }

    return items.map((item) {
      final status = item.mediaInfo?.status;
      if (status != 2 && status != 3) {
        return item;
      }

      final mediaInfo = item.mediaInfo;
      if (mediaInfo == null || (mediaInfo.requests?.isNotEmpty ?? false)) {
        return item;
      }

      final byMediaId = mediaInfo.id != null ? _requestsByMediaId[mediaInfo.id!] : null;
      final byTmdbId = mediaInfo.tmdbId != null
          ? _requestsByTmdbId[mediaInfo.tmdbId!]
          : _requestsByTmdbId[item.id];
      final requests = byMediaId ?? byTmdbId;

      if (requests == null || requests.isEmpty) {
        return item;
      }

      return SeerrDiscoverItem(
        id: item.id,
        mediaType: item.mediaType,
        title: item.title,
        name: item.name,
        originalTitle: item.originalTitle,
        originalName: item.originalName,
        posterPath: item.posterPath,
        backdropPath: item.backdropPath,
        overview: item.overview,
        releaseDate: item.releaseDate,
        firstAirDate: item.firstAirDate,
        originalLanguage: item.originalLanguage,
        genreIds: item.genreIds,
        voteAverage: item.voteAverage,
        voteCount: item.voteCount,
        popularity: item.popularity,
        adult: item.adult,
        mediaInfo: SeerrMediaInfo(
          id: mediaInfo.id,
          tmdbId: mediaInfo.tmdbId,
          tvdbId: mediaInfo.tvdbId,
          status: mediaInfo.status,
          status4k: mediaInfo.status4k,
          requests: requests,
        ),
        character: item.character,
        job: item.job,
        department: item.department,
      );
    }).toList();
  }

  List<SeerrDiscoverItem> _applyFilter(List<SeerrDiscoverItem> items) {
    final letterFilter = _state.letterFilter;
    return items.where((item) {
      if (item.isBlacklisted) return false;

      final matchesStatus = switch (_state.filter) {
        SeerrBrowseFilter.available =>
          item.mediaInfo?.status == 4 || item.mediaInfo?.status == 5,
        SeerrBrowseFilter.requested =>
          item.mediaInfo?.status == 2 || item.mediaInfo?.status == 3,
        SeerrBrowseFilter.all => true,
      };

      if (!matchesStatus) {
        return false;
      }

      if (letterFilter.isEmpty) {
        return true;
      }

      final title = item.displayTitle.trim();
      if (title.isEmpty) {
        return false;
      }

      final first = title[0].toUpperCase();
      if (letterFilter == '#') {
        return !RegExp(r'[A-Z]').hasMatch(first);
      }

      return first == letterFilter;
    }).toList();
  }
}
