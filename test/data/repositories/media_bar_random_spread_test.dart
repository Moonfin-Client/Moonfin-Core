import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _ImageApi extends Mock implements ImageApi {}

class _UserViewsApi extends Mock implements UserViewsApi {}

/// A library of [size] movies the server keeps in SortName order, so a slide's
/// index is its alphabetical rank. `m0000` sorts first, `m1999` last.
class _Library {
  _Library(this.size);

  final int size;
  final sorts = <String?>[];

  int rankOf(String id) => int.parse(id.substring(1));

  Future<Map<String, dynamic>> answer(Invocation invocation) async {
    final args = invocation.namedArguments;
    final sortBy = args[#sortBy] as String?;
    sorts.add(sortBy);
    if (args[#limit] == 1 && args[#enableTotalRecordCount] == true) {
      return {'Items': const [], 'TotalRecordCount': size};
    }
    final ranks = [for (var i = 0; i < size; i++) i];
    if (sortBy == 'Random') ranks.shuffle();
    final start = args[#startIndex] as int? ?? 0;
    final limit = args[#limit] as int? ?? size;
    return {
      'Items': [
        for (final rank in ranks.skip(start).take(limit))
          {
            'Id': 'm${rank.toString().padLeft(4, '0')}',
            'Type': 'Movie',
            'BackdropImageTags': const ['b'],
          },
      ],
    };
  }
}

void main() {
  tearDown(() => GetIt.instance.reset());

  Future<(List<String>, List<String?>)> load(_Library library) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.pluginSyncEnabled, false);
    await prefs.set(UserPreferences.mediaBarItemCount, '10');
    await prefs.set(
      UserPreferences.mediaBarSourceType,
      UserPreferences.mediaBarSourceRandom,
    );

    final views = _UserViewsApi();
    when(() => views.getUserViews()).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'lib', 'Name': 'Movies', 'CollectionType': 'movies'},
        ],
      },
    );
    final items = _ItemsApi();
    when(
      () => items.getItems(
        includeItemTypes: any(named: 'includeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        recursive: any(named: 'recursive'),
        parentId: any(named: 'parentId'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        enableImageTypes: any(named: 'enableImageTypes'),
      ),
    ).thenAnswer(library.answer);
    final images = _ImageApi();
    when(
      () => images.getBackdropImageUrl(
        any(),
        tag: any(named: 'tag'),
        maxWidth: any(named: 'maxWidth'),
      ),
    ).thenReturn('backdrop');
    when(
      () => images.getPrimaryImageUrl(
        any(),
        tag: any(named: 'tag'),
        maxWidth: any(named: 'maxWidth'),
      ),
    ).thenReturn('primary');
    final client = _Client();
    when(() => client.userViewsApi).thenReturn(views);
    when(() => client.itemsApi).thenReturn(items);
    when(() => client.imageApi).thenReturn(images);

    final repo = MediaBarRepository(client, prefs);
    await GetIt.instance.reset();
    GetIt.instance.registerSingleton<MediaBarRepository>(repo);
    final state = await repo.loadItems();
    final shown = (state as MediaBarReady).items
        .map((item) => item.itemId)
        .toList();
    return (shown, library.sorts);
  }

  // Issue #2142: the bar picked a random alphabetical window and showed the
  // titles inside it, so a run of sequels arrived together.
  test('slides are spread across the library, not one alphabetical run',
      () async {
    const size = 2000;
    var widest = 0;

    for (var attempt = 0; attempt < 5; attempt++) {
      final library = _Library(size);
      final (shown, _) = await load(library);

      expect(shown, hasLength(10));
      final ranks = shown.map(library.rankOf).toList()..sort();
      final span = ranks.last - ranks.first + 1;
      if (span > widest) widest = span;
    }

    // One window of 40 can never span more than 40 of the 2000 titles. Ten
    // slides drawn from the whole library span most of it.
    expect(
      widest,
      greaterThan(size ~/ 2),
      reason: 'slides came from a $widest-title stretch of $size',
    );
  });

  test('asks the server for a random order', () async {
    final library = _Library(2000);

    final (_, sorts) = await load(library);

    expect(sorts, contains('Random'));
  });
}
