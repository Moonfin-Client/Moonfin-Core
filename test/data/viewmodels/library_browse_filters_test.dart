import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Records what the last page request asked the server for, which is the only
/// thing these tests care about.
class _RecordingItemsApi implements ItemsApi {
  List<String>? filters;
  List<String>? seriesStatus;
  List<String>? genres;
  List<String>? officialRatings;
  List<String>? tags;
  List<int>? years;
  List<String>? videoTypes;
  List<String>? audioLanguages;
  List<String>? subtitleLanguages;
  bool? hasSubtitles;
  bool? hasTrailer;
  bool? hasSpecialFeature;
  bool? isHd;
  bool? is4K;
  bool? is3D;
  List<String>? includeItemTypes;
  List<String>? excludeItemTypes;
  List<String>? genreIds;
  bool? collapseBoxSetItems;
  String? collectionType;

  QueryFilterValues facets = QueryFilterValues.empty;
  int facetRequests = 0;

  @override
  Future<Map<String, dynamic>> getItems({
    bool? serverWide,
    String? parentId,
    List<String>? ids,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    bool? recursive,
    String? searchTerm,
    String? fields,
    List<String>? personIds,
    List<String>? artistIds,
    List<String>? filters,
    List<String>? seriesStatus,
    String? nameStartsWith,
    String? nameLessThan,
    List<String>? genreIds,
    List<String>? genres,
    bool? isFavorite,
    bool? collapseBoxSetItems,
    bool? enableTotalRecordCount,
    String? enableImageTypes,
    int? imageTypeLimit,
    List<String>? tags,
    List<String>? studios,
    DateTime? minPremiereDate,
    String? maxOfficialRating,
    bool? hasParentalRating,
    String? anyProviderIdEquals,
    List<String>? officialRatings,
    List<int>? years,
    List<String>? videoTypes,
    List<String>? audioLanguages,
    List<String>? subtitleLanguages,
    bool? hasSubtitles,
    bool? hasTrailer,
    bool? hasSpecialFeature,
    bool? hasThemeSong,
    bool? hasThemeVideo,
    bool? isHd,
    bool? is4K,
    bool? is3D,
  }) async {
    this.filters = filters;
    this.seriesStatus = seriesStatus;
    this.genres = genres;
    this.officialRatings = officialRatings;
    this.tags = tags;
    this.years = years;
    this.videoTypes = videoTypes;
    this.audioLanguages = audioLanguages;
    this.subtitleLanguages = subtitleLanguages;
    this.hasSubtitles = hasSubtitles;
    this.hasTrailer = hasTrailer;
    this.hasSpecialFeature = hasSpecialFeature;
    this.isHd = isHd;
    this.is4K = is4K;
    this.is3D = is3D;
    this.includeItemTypes = includeItemTypes;
    this.excludeItemTypes = excludeItemTypes;
    this.genreIds = genreIds;
    this.collapseBoxSetItems = collapseBoxSetItems;
    return <String, dynamic>{'TotalRecordCount': 0, 'Items': const []};
  }

  @override
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  }) async {
    facetRequests++;
    return facets;
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => <String, dynamic>{
    'Name': 'Media',
    'CollectionType': collectionType ?? 'movies',
  };

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.itemsApi, {this.serverType = ServerType.jellyfin});

  @override
  final ItemsApi itemsApi;

  @override
  final ServerType serverType;

  @override
  String get baseUrl => 'http://server';

  @override
  String? get userId => 'user';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeMdbListRepository implements MdbListRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<LibraryBrowseViewModel> _viewModel(
  _RecordingItemsApi api, {
  ServerType serverType = ServerType.jellyfin,
  String libraryId = 'movies',
  String? genreId,
  List<String>? includeItemTypes,
  bool groupCollections = false,
}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);
  if (groupCollections) {
    prefs.set(UserPreferences.groupItemsIntoCollections, true);
  }
  return LibraryBrowseViewModel(
    libraryId: libraryId,
    client: _FakeClient(api, serverType: serverType),
    prefs: prefs,
    mdbListRepository: _FakeMdbListRepository(),
    genreId: genreId,
    includeItemTypes: includeItemTypes,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('in progress asks for the resumable items', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.setPlayedFilter(PlayedStatusFilter.inProgress);

    expect(api.filters, contains('IsResumable'));
  });

  test('unreleased reaches the series status', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.setSeriesFilter(SeriesStatusFilter.unreleased);

    expect(api.seriesStatus, <String>['Unreleased']);
  });

  test('each feature travels as its own flag', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.toggleFeatureFilter(LibraryFeatureFilter.subtitles);
    await vm.toggleFeatureFilter(LibraryFeatureFilter.extras);

    expect(api.hasSubtitles, isTrue);
    expect(api.hasSpecialFeature, isTrue);
    // Nothing was asked of the features left alone.
    expect(api.hasTrailer, isNull);
  });

  test('asking for both SD and HD asks for neither', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.toggleVideoQualityFilter(LibraryVideoQualityFilter.hd);
    expect(api.isHd, isTrue);

    await vm.toggleVideoQualityFilter(LibraryVideoQualityFilter.sd);
    expect(api.isHd, isNull);

    await vm.toggleVideoQualityFilter(LibraryVideoQualityFilter.uhd);
    expect(api.is4K, isTrue);
    expect(api.is3D, isNull);
  });

  test('disc sources travel as the server video types', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.toggleVideoSourceFilter(LibraryVideoSourceFilter.bluray);

    expect(api.videoTypes, <String>['BluRay']);
  });

  test('facet choices reach the query as the values they came from', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.toggleGenreFilter('Drama');
    await vm.toggleOfficialRatingFilter('PG-13');
    await vm.toggleTagFilter('4k-remux');
    await vm.toggleYearFilter('1999');
    await vm.toggleAudioLanguageFilter('jpn');
    await vm.toggleSubtitleLanguageFilter('eng');

    expect(api.genres, <String>['Drama']);
    expect(api.officialRatings, <String>['PG-13']);
    expect(api.tags, <String>['4k-remux']);
    expect(api.years, <int>[1999]);
    expect(api.audioLanguages, <String>['jpn']);
    expect(api.subtitleLanguages, <String>['eng']);
  });

  test('clearing puts every filter back', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.setPlayedFilter(PlayedStatusFilter.watched);
    await vm.toggleFeatureFilter(LibraryFeatureFilter.subtitles);
    await vm.toggleTagFilter('imax');
    expect(vm.hasActiveFilters, isTrue);

    await vm.clearFilters();

    expect(vm.hasActiveFilters, isFalse);
    expect(api.filters, isNull);
    expect(api.hasSubtitles, isNull);
    expect(api.tags, isNull);
  });

  test('the facet values are only read once per browse', () async {
    final api = _RecordingItemsApi()
      ..facets = const QueryFilterValues(
        officialRatings: ['PG'],
        years: [1999],
      );
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.ensureFacetValuesLoaded();
    await vm.ensureFacetValuesLoaded();

    expect(api.facetRequests, 1);
    expect(vm.facetValues.years, <int>[1999]);
  });

  test('Emby hides the two options its items query has no answer for', () async {
    final jellyfin = await _viewModel(_RecordingItemsApi());
    addTearDown(jellyfin.dispose);
    expect(jellyfin.supportsUhdFilter, isTrue);
    expect(jellyfin.supportsUnreleasedSeriesFilter, isTrue);

    final emby = await _viewModel(
      _RecordingItemsApi(),
      serverType: ServerType.emby,
    );
    addTearDown(emby.dispose);
    expect(emby.supportsUhdFilter, isFalse);
    expect(emby.supportsUnreleasedSeriesFilter, isFalse);
  });

  test('global genre browse includes only movies and series and excludes non-root types', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(
      api,
      libraryId: '',
      genreId: 'anime-genre-id',
    );
    addTearDown(vm.dispose);

    await vm.load();

    expect(api.genreIds, ['anime-genre-id']);
    expect(api.includeItemTypes, ['Movie', 'Series']);
    expect(api.excludeItemTypes, ['Playlist', 'Episode', 'Season', 'Folder']);
    expect(api.collapseBoxSetItems, isFalse);
  });

  test('global genre browse with groupCollections includes BoxSet and sets collapseBoxSetItems', () async {
    final api = _RecordingItemsApi();
    final vm = await _viewModel(
      api,
      libraryId: '',
      genreId: 'anime-genre-id',
      groupCollections: true,
    );
    addTearDown(vm.dispose);

    await vm.load();

    expect(api.genreIds, ['anime-genre-id']);
    expect(api.includeItemTypes, ['Movie', 'Series', 'BoxSet']);
    expect(api.excludeItemTypes, ['Playlist', 'Episode', 'Season', 'Folder']);
    expect(api.collapseBoxSetItems, isTrue);
  });

  test('genre browse in music library asks for MusicAlbum', () async {
    final api = _RecordingItemsApi()..collectionType = 'music';
    final vm = await _viewModel(
      api,
      libraryId: 'music-library-id',
      genreId: 'rock-genre-id',
    );
    addTearDown(vm.dispose);

    await vm.load();

    expect(api.genreIds, ['rock-genre-id']);
    expect(api.includeItemTypes, ['MusicAlbum']);
    expect(api.excludeItemTypes, ['Playlist', 'Episode', 'Season', 'Folder']);
  });
}
