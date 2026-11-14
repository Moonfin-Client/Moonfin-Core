import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// One library page of two movies, and the user data of any ids asked for.
class _FakeItemsApi implements ItemsApi {
  /// The ids of each user-data request.
  final userDataRequests = <List<String>>[];

  /// Called while a user-data request is out.
  void Function()? duringUserDataRequest;

  /// Makes the next user-data request fail.
  bool failNextUserDataRequest = false;

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
    bool? enableUserData,
    bool? enableImages,
  }) async {
    if (ids != null) {
      userDataRequests.add(ids);
      duringUserDataRequest?.call();
      if (failNextUserDataRequest) {
        failNextUserDataRequest = false;
        throw StateError('offline');
      }
      return <String, dynamic>{
        'Items': [
          for (final id in ids)
            <String, dynamic>{
              'Id': id,
              'UserData': <String, dynamic>{
                'Played': false,
                'PlayCount': userDataRequests.length,
              },
            },
        ],
      };
    }
    return <String, dynamic>{
      'TotalRecordCount': 2,
      'Items': [
        for (final id in ['m1', 'm2'])
          <String, dynamic>{'Id': id, 'Name': id, 'Type': 'Movie'},
      ],
    };
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => <String, dynamic>{'Name': 'Movies', 'CollectionType': 'movies'};

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.itemsApi);

  @override
  final ItemsApi itemsApi;

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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeItemsApi api;
  late LibraryBrowseViewModel vm;

  setUp(() async {
    userDataSync.reset();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    api = _FakeItemsApi();
    vm = LibraryBrowseViewModel(
      libraryId: 'movies',
      client: _FakeClient(api),
      prefs: UserPreferences(store),
      mdbListRepository: _FakeMdbListRepository(),
    );
    await vm.load();
  });

  tearDown(() {
    vm.dispose();
    userDataSync.reset();
  });

  test('a change that arrives while the grid asks the server is asked about '
      'next time, and what the asking brings back is not', () async {
    userDataSync.publish('an-episode', {'Played': true});
    api.duringUserDataRequest = () {
      api.duringUserDataRequest = null;
      userDataSync.publish('another-episode', {'Played': true});
    };

    await vm.syncUserDataIfStale();
    expect(api.userDataRequests, [
      ['m1', 'm2'],
    ]);

    await vm.syncUserDataIfStale();
    expect(api.userDataRequests, hasLength(2));

    // The second answer changed both movies, and that alone asks nothing.
    await vm.syncUserDataIfStale();
    expect(api.userDataRequests, hasLength(2));
  });

  test('a refresh the server did not answer is asked again next time', () async {
    userDataSync.publish('an-episode', {'Played': true});
    api.failNextUserDataRequest = true;

    await vm.syncUserDataIfStale();
    expect(api.userDataRequests, hasLength(1));

    await vm.syncUserDataIfStale();
    expect(api.userDataRequests, hasLength(2));

    await vm.syncUserDataIfStale();
    expect(api.userDataRequests, hasLength(2));
  });
}
