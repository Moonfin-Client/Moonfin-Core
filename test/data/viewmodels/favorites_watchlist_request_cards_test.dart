import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/data/viewmodels/favorites_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _MdbList extends Mock implements MdbListRepository {}

class _Seerr extends Mock implements SeerrRepository {}

SeerrDiscoverPage _page(List<SeerrDiscoverItem> results) =>
    SeerrDiscoverPage(results: results, totalPages: 1, page: 1);

SeerrDiscoverItem _movie(int id, {String? rating}) => SeerrDiscoverItem(
  id: id,
  mediaType: 'movie',
  title: 'Movie $id',
  contentRating: rating,
);

void main() {
  late UserPreferences prefs;
  late _Seerr seerr;
  late FavoritesViewModel vm;

  setUp(() async {
    await GetIt.instance.reset();
    resetParentalFilterCache();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final api = _ItemsApi();
    when(
      () => api.getItems(
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        recursive: any(named: 'recursive'),
        isFavorite: any(named: 'isFavorite'),
        includeItemTypes: any(named: 'includeItemTypes'),
        fields: any(named: 'fields'),
      ),
    ).thenAnswer((_) async => {'Items': <dynamic>[]});
    final client = _Client();
    when(() => client.itemsApi).thenReturn(api);
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenReturn('https://jellyfin.test');

    seerr = _Seerr();
    when(() => seerr.ensureInitialized()).thenAnswer((_) async {});
    when(() => seerr.isAvailable).thenReturn(true);
    when(() => seerr.getMovieDetails(any())).thenThrow(Exception('offline'));
    GetIt.instance.registerLazySingletonAsync<SeerrRepository>(
      () async => seerr,
    );

    vm = FavoritesViewModel(
      client: client,
      prefs: prefs,
      mdbListRepository: _MdbList(),
    );
  });

  tearDown(() async {
    vm.dispose();
    await GetIt.instance.reset();
  });

  List<String> watchlistIds() => [
    for (final item in vm.rowItems[FavoriteTypeFilter.watchlist] ?? const [])
      item.id,
  ];

  test('an unrated request card stays out while a rating is blocked', () async {
    await prefs.set(UserPreferences.blockedParentalRatings, 'R');
    when(() => seerr.getWatchlist(page: any(named: 'page'))).thenAnswer(
      (_) async => _page([
        _movie(1, rating: 'PG'),
        _movie(2, rating: 'R'),
        _movie(3),
      ]),
    );

    await vm.load();

    expect(watchlistIds(), ['1']);
  });

  test('every request card shows when nothing is blocked', () async {
    when(() => seerr.getWatchlist(page: any(named: 'page'))).thenAnswer(
      (_) async => _page([_movie(1, rating: 'PG'), _movie(3)]),
    );

    await vm.load();

    expect(watchlistIds(), ['1', '3']);
  });

  test('a load that finishes after a newer one leaves its rows alone', () async {
    final slow = Completer<SeerrDiscoverPage>();
    var calls = 0;
    when(() => seerr.getWatchlist(page: any(named: 'page'))).thenAnswer(
      (_) => calls++ == 0 ? slow.future : Future.value(_page([_movie(2)])),
    );

    final first = vm.load();
    await pumpEventQueue();
    await vm.load();
    slow.complete(_page([_movie(1)]));
    await first;

    expect(watchlistIds(), ['2']);
    expect(vm.state, FavoritesState.ready);
  });

  test('a reload stops the old batch from starting more detail lookups', () async {
    final held = <Completer<SeerrMovieDetails>>[];
    when(() => seerr.getMovieDetails(any())).thenAnswer((_) {
      final lookup = Completer<SeerrMovieDetails>();
      held.add(lookup);
      return lookup.future;
    });
    var calls = 0;
    when(() => seerr.getWatchlist(page: any(named: 'page'))).thenAnswer(
      (_) async => calls++ == 0
          ? _page([for (var id = 1; id <= 6; id++) _movie(id)])
          : _page(const []),
    );

    await vm.load();
    await pumpEventQueue();
    expect(held, hasLength(3));

    await vm.load();
    for (final lookup in List.of(held)) {
      lookup.completeError(Exception('slow'));
    }
    await pumpEventQueue();

    expect(held, hasLength(3));
  });
}
