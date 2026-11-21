import 'dart:async';
import 'dart:convert';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Seerr keeps TMDB's country and release keys inside its camelCase response.
final _movieJson = {
  'id': 121,
  'title': 'The Lord of the Rings: The Two Towers',
  'releases': {
    'results': [
      {
        'iso_3166_1': 'DE',
        'release_dates': [
          {'certification': '12'},
        ],
      },
      {
        'iso_3166_1': 'US',
        'release_dates': [
          {'certification': ''},
          {'certification': '  '},
          {'certification': 'PG-13'},
          {'certification': 'R'},
        ],
      },
    ],
  },
};

final _tvJson = {
  'id': 1396,
  'name': 'Breaking Bad',
  'contentRatings': {
    'results': [
      {'iso_3166_1': 'DE', 'rating': '16'},
      {'iso_3166_1': 'US', 'rating': 'TV-MA'},
    ],
  },
};

class _Seerr extends Fake implements SeerrRepository {
  SeerrUser user = const SeerrUser(id: 1);
  Future<Map<String, dynamic>> settings = Future.value({});

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<Map<String, dynamic>> getPublicSettings() => settings;

  @override
  Future<SeerrUser> getCurrentUser() async => user;

  @override
  Future<(SeerrMovieDetails, bool)> getMovieDetailsWithWatchlist(
    int id,
  ) async => (SeerrMovieDetails.fromJson(_movieJson), false);

  @override
  Future<(SeerrTvDetails, bool)> getTvDetailsWithWatchlist(int id) async =>
      (SeerrTvDetails.fromJson(_tvJson), false);
}

class _Prefs extends Fake implements SeerrPreferences {}

class _Client extends Mock implements MediaServerClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('movie rating uses the selected country and first nonblank release', () {
    final movie = SeerrMovieDetails.fromJson(_movieJson);
    final state = SeerrMediaDetailState(movie: movie);
    expect(state.parentalRating, 'PG-13');
    expect(state.copyWith(discoverRegion: 'DE').parentalRating, '12');
    // Do not present a different country's rating as a local certification.
    expect(state.copyWith(discoverRegion: 'FR').parentalRating, isNull);
    expect(state.copyWith(isLoading: true).parentalRating, 'PG-13');
    final roundTrip = SeerrMovieDetails.fromJson(
      jsonDecode(jsonEncode(movie.toJson())) as Map<String, dynamic>,
    );
    expect(SeerrMediaDetailState(movie: roundTrip).parentalRating, 'PG-13');
  });

  test('TV ratings use contentRatings.results and survive serialization', () {
    final tv = SeerrTvDetails.fromJson(_tvJson);
    final state = SeerrMediaDetailState(tv: tv);
    expect(state.parentalRating, 'TV-MA');
    expect(state.copyWith(discoverRegion: 'DE').parentalRating, '16');
    expect(state.copyWith(discoverRegion: 'FR').parentalRating, isNull);
    final roundTrip = SeerrTvDetails.fromJson(
      jsonDecode(jsonEncode(tv.toJson())) as Map<String, dynamic>,
    );
    expect(SeerrMediaDetailState(tv: roundTrip).parentalRating, 'TV-MA');
  });

  test('missing, empty and blank ratings leave the badge absent', () {
    for (final releases in [
      null,
      <String, dynamic>{},
      {'results': <dynamic>[]},
      {
        'results': [
          {'iso_3166_1': 'US'},
          {
            'iso_3166_1': 'US',
            'release_dates': [
              <String, dynamic>{},
              {'certification': ' '},
            ],
          },
        ],
      },
    ]) {
      final movie = SeerrMovieDetails.fromJson({
        ..._movieJson,
        'releases': releases,
      });
      expect(SeerrMediaDetailState(movie: movie).parentalRating, isNull);
    }
    final tv = SeerrTvDetails.fromJson({
      ..._tvJson,
      'contentRatings': {
        'results': [
          {'iso_3166_1': 'US', 'rating': ' '},
        ],
      },
    });
    expect(SeerrMediaDetailState(tv: tv).parentalRating, isNull);
  });

  test('Silo single ratings still reach the detail badge', () {
    expect(
      const SeerrMediaDetailState(
        movie: SeerrMovieDetails(id: 1, title: 'Movie', contentRating: 'PG'),
      ).parentalRating,
      'PG',
    );
    expect(
      const SeerrMediaDetailState(
        tv: SeerrTvDetails(id: 2, contentRating: 'TV-PG'),
      ).parentalRating,
      'TV-PG',
    );
  });

  test('discovery country reads nested user settings and round trips', () {
    final user = SeerrUser.fromJson({
      'id': 1,
      'settings': {'discoverRegion': 'DE', 'streamingRegion': 'US'},
    });
    expect(user.discoverRegion, 'DE');
    expect(SeerrUser.fromJson(user.toJson()).discoverRegion, 'DE');
    expect(SeerrUser.fromJson({'id': 1}).discoverRegion, isNull);
  });

  group('Seerr-only detail metadata', () {
    late _Seerr repo;
    late _Client client;

    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
      repo = _Seerr();
      GetIt.instance.registerLazySingletonAsync<SeerrRepository>(
        () async => repo,
      );
      GetIt.instance.registerSingleton<SeerrPreferences>(_Prefs());
      client = _Client();
    });

    tearDown(() => GetIt.instance.reset());

    ItemDetailViewModel viewModel(String id) {
      final tmdb = TmdbRepository(client);
      return ItemDetailViewModel(
        itemId: id,
        client: client,
        mutations: ItemMutationRepository(client),
        mdbListRepository: MdbListRepository(client, tmdb),
        tmdbRepository: tmdb,
      );
    }

    test('movie metadata gets its rating without a library item', () {
      fakeAsync((async) {
        final vm = viewModel('tmdb:movie:121');
        vm.load();
        async.flushMicrotasks();
        expect(vm.item?.officialRating, 'PG-13');
        expect(vm.item?.serverId, 'seerr');
        vm.dispose();
      });
    });

    test(
      'TV uses the user discovery country over server and streaming country',
      () {
        fakeAsync((async) {
          repo.user = const SeerrUser(
            id: 1,
            discoverRegion: 'DE',
            streamingRegion: 'US',
          );
          repo.settings = Future.value({'discoverRegion': 'US'});
          final vm = viewModel('tmdb:tv:1396');
          vm.load();
          async.flushMicrotasks();
          expect(vm.item?.officialRating, '16');
          vm.dispose();
        });
      },
    );

    test('late server country updates the rating and can remove it', () {
      for (final region in ['DE', 'FR']) {
        fakeAsync((async) {
          final settings = Completer<Map<String, dynamic>>();
          repo.settings = settings.future;
          final vm = viewModel('tmdb:movie:121');
          vm.load();
          async.flushMicrotasks();
          expect(vm.item?.officialRating, 'PG-13');
          settings.complete({
            'discoverRegion': region,
            'streamingRegion': 'US',
          });
          async.flushMicrotasks();
          expect(vm.item?.officialRating, region == 'DE' ? '12' : null);
          vm.dispose();
        });
      }
    });

    test('late server settings do not replace the user discovery country', () {
      fakeAsync((async) {
        final settings = Completer<Map<String, dynamic>>();
        repo.settings = settings.future;
        repo.user = const SeerrUser(id: 1, discoverRegion: 'US');
        final vm = viewModel('tmdb:movie:121');
        vm.load();
        async.flushMicrotasks();
        expect(vm.item?.officialRating, 'PG-13');
        settings.complete({'discoverRegion': 'DE'});
        async.flushMicrotasks();
        expect(vm.item?.officialRating, 'PG-13');
        vm.dispose();
      });
    });

    test('blank country settings fall back to US', () {
      fakeAsync((async) {
        repo.user = const SeerrUser(id: 1, discoverRegion: '');
        repo.settings = Future.value({'discoverRegion': ''});
        final vm = viewModel('tmdb:movie:121');
        vm.load();
        async.flushMicrotasks();
        expect(vm.item?.officialRating, 'PG-13');
        vm.dispose();
      });
    });
  });
}
