import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
  late _UserLibraryApi userLibraryApi;
  late Map<String, dynamic> itemData;

  setUp(() async {
    await GetIt.instance.reset();
    GetIt.instance.registerSingleton<UserPreferences>(await _prefs());
    client = _Client();
    itemsApi = _ItemsApi();
    userLibraryApi = _UserLibraryApi();
    itemData = {
      'Id': 'movie-1',
      'Type': 'Movie',
      'UserData': {'Rating': 8.0, 'Likes': true},
    };
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibraryApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(
      () => itemsApi.getItem(
        'movie-1',
        mediaSourceId: any(named: 'mediaSourceId'),
      ),
    ).thenAnswer((_) async => Map<String, dynamic>.from(itemData));
    when(
      () => itemsApi.getItem('movie-1'),
    ).thenAnswer((_) async => Map<String, dynamic>.from(itemData));
  });

  tearDown(() => GetIt.instance.reset());

  ItemDetailViewModel createViewModel() => ItemDetailViewModel(
    itemId: 'movie-1',
    client: client,
    mutations: ItemMutationRepository(client),
    mdbListRepository: MdbListRepository(client),
    tmdbRepository: TmdbRepository(client),
  );

  test(
    'numeric rating updates optimistically and reloads after success',
    () async {
      final viewModel = createViewModel();
      await viewModel.load();
      itemData = {
        'Id': 'movie-1',
        'Type': 'Movie',
        'UserData': {'Rating': 9.0, 'Likes': true},
      };
      when(
        () => userLibraryApi.updateNumericUserRating('movie-1', rating: 9),
      ).thenAnswer((_) async {});

      await viewModel.setNumericRating(9);

      expect(viewModel.item?.personalRating, 9);
      verify(
        () => userLibraryApi.updateNumericUserRating('movie-1', rating: 9),
      ).called(1);
    },
  );

  test(
    'numeric rating restores the previous value when saving fails',
    () async {
      final viewModel = createViewModel();
      await viewModel.load();
      final request = Completer<void>();
      when(
        () => userLibraryApi.updateNumericUserRating('movie-1', rating: 9),
      ).thenAnswer((_) => request.future);

      final result = viewModel.setNumericRating(9);
      expect(viewModel.item?.personalRating, 9);
      request.completeError(StateError('network failure'));

      await expectLater(result, throwsStateError);
      expect(viewModel.item?.personalRating, 8);
    },
  );

  test('numeric rating updates the optimistic like state', () async {
    final viewModel = createViewModel();
    await viewModel.load();
    final request = Completer<void>();
    when(
      () => userLibraryApi.updateNumericUserRating('movie-1', rating: 4),
    ).thenAnswer((_) => request.future);

    final result = viewModel.setNumericRating(4);

    expect(viewModel.item?.personalRating, 4);
    expect(viewModel.item?.personalRatingLikes, isFalse);

    request.complete();
    await result;
  });

  test('numeric rating rejects non-finite values', () async {
    final viewModel = createViewModel();
    await viewModel.load();

    await expectLater(viewModel.setNumericRating(double.nan), throwsArgumentError);
    verifyNever(
      () => userLibraryApi.updateNumericUserRating(
        any(),
        rating: any(named: 'rating'),
      ),
    );
  });
}
