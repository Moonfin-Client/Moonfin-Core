import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _ImageApi extends Mock implements ImageApi {}

class _UserViewsApi extends Mock implements UserViewsApi {}

/// Collections served by a fake server that answers after a short delay and
/// remembers which collections it was asked about and how many at once.
class _Server {
  _Server(this.collections, {this.released = const {}, this.watched = const {}});

  final Map<String, List<String>> collections;

  /// Release dates by id. The other titles have none.
  final Map<String, DateTime> released;

  /// Ids left out when the call asks for unplayed titles only.
  final Set<String> watched;
  final asked = <String>{};
  var inFlight = 0;
  var mostInFlight = 0;

  Future<Map<String, dynamic>> answer(Invocation invocation) async {
    final args = invocation.namedArguments;
    final parentId = args[#parentId] as String;
    final ids = collections[parentId]!;
    asked.add(parentId);
    inFlight++;
    if (inFlight > mostInFlight) mostInFlight = inFlight;
    await Future<void>.delayed(const Duration(milliseconds: 20));
    inFlight--;
    if (args[#limit] == 1) {
      return {'Items': const [], 'TotalRecordCount': ids.length};
    }
    final start = args[#startIndex] as int? ?? 0;
    final limit = args[#limit] as int;
    final unplayed = (args[#filters] as List?)?.contains('IsUnplayed') ?? false;
    return {
      'Items': [
        for (final id in ids
            .where((id) => !unplayed || !watched.contains(id))
            .skip(start)
            .take(limit))
          {
            'Id': id,
            'Type': 'Movie',
            'BackdropImageTags': ['b'],
            if (released[id] case final date?)
              'PremiereDate': date.toUtc().toIso8601String(),
          },
      ],
    };
  }
}

void main() {
  tearDown(() => GetIt.instance.reset());

  late List<MediaBarSlideItem> slides;

  Future<List<String>> load(
    _Server server, {
    required int itemCount,
    String source = UserPreferences.mediaBarSourceRandom,
    bool hideWatched = false,
    String? newReleaseKinds,
  }) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.pluginSyncEnabled, false);
    await prefs.set(UserPreferences.mediaBarItemCount, '$itemCount');
    await prefs.set(UserPreferences.mediaBarSourceType, source);
    await prefs.set(UserPreferences.hideWatchedInRecentRows, hideWatched);
    if (newReleaseKinds != null) {
      await prefs.set(UserPreferences.mediaBarNewReleaseKinds, newReleaseKinds);
    }
    await prefs.set(
      UserPreferences.mediaBarCollectionIds,
      server.collections.keys.join(','),
    );

    final views = _UserViewsApi();
    when(() => views.getUserViews()).thenAnswer((_) async => {'Items': []});
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
        minPremiereDate: any(named: 'minPremiereDate'),
        filters: any(named: 'filters'),
      ),
    ).thenAnswer(server.answer);
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
    GetIt.instance.registerSingleton<MediaBarRepository>(repo);
    final state = await repo.loadItems();
    slides = (state as MediaBarReady).items;
    return slides.map((item) => item.itemId).toList();
  }

  Map<String, List<String>> collections(int count, int size) => {
    for (var c = 0; c < count; c++)
      'c$c': [for (var i = 0; i < size; i++) 'c${c}_$i'],
  };

  test('reads a few collections at a time and every one it needs', () async {
    final server = _Server(collections(8, 3));

    final shown = await load(server, itemCount: 30);

    expect(server.mostInFlight, 6);
    expect(server.asked, hasLength(8));
    expect(shown, hasLength(24));
  });

  test('skips the collections it no longer needs', () async {
    final server = _Server(collections(20, 40));

    final shown = await load(server, itemCount: 10);

    expect(server.asked.length, lessThanOrEqualTo(6));
    expect(shown, hasLength(10));
  });

  test('shows a title two collections share only once', () async {
    final shared = [for (var i = 0; i < 5; i++) 'm$i'];
    final server = _Server({'a': shared, 'b': shared});

    final shown = await load(server, itemCount: 10);

    expect(shown.toSet(), shared.toSet());
    expect(shown, hasLength(5));
  });

  test('new releases keep only the movies out within the window', () async {
    final server = _Server(
      {
        'movies': const ['new', 'old', 'undated'],
      },
      released: {
        'new': DateTime.now().subtract(const Duration(days: 10)),
        'old': DateTime.now().subtract(const Duration(days: 400)),
      },
    );

    final shown = await load(
      server,
      itemCount: 10,
      source: UserPreferences.mediaBarSourceNewReleases,
    );

    expect(shown, ['new']);
  });

  test('new releases leave watched movies out when hide watched is on', () async {
    final now = DateTime.now();
    final server = _Server(
      {
        'movies': const ['seen', 'unseen'],
      },
      released: {
        'seen': now.subtract(const Duration(days: 5)),
        'unseen': now.subtract(const Duration(days: 10)),
      },
      watched: {'seen'},
    );

    final shown = await load(
      server,
      itemCount: 10,
      source: UserPreferences.mediaBarSourceNewReleases,
      hideWatched: true,
    );

    expect(shown, ['unseen']);
  });

  // The fake ignores the date floor the way Silo does.
  test('old movies a server sends anyway leave every source asked', () async {
    final old = DateTime.now().subtract(const Duration(days: 400));
    final server = _Server(
      {
        for (var c = 0; c < 8; c++)
          'old$c': [for (var i = 0; i < 12; i++) 'old${c}_$i'],
        'fresh': const ['new'],
      },
      released: {
        for (var c = 0; c < 8; c++)
          for (var i = 0; i < 12; i++) 'old${c}_$i': old,
        'new': DateTime.now().subtract(const Duration(days: 10)),
      },
    );

    final shown = await load(
      server,
      itemCount: 5,
      source: UserPreferences.mediaBarSourceNewReleases,
    );

    expect(server.asked, hasLength(9));
    expect(shown, ['new']);
  });

  test('a movie out within the window gets the new movie label', () async {
    final now = DateTime.now();
    final server = _Server(
      {
        'movies': const ['new', 'old'],
      },
      released: {
        'new': now.subtract(const Duration(days: 10)),
        'old': now.subtract(const Duration(days: 400)),
      },
    );

    await load(server, itemCount: 10);

    expect(
      {for (final slide in slides) slide.itemId: slide.newRelease?.kind},
      {'new': MediaBarNewRelease.newMovie, 'old': null},
    );
  });

  test('no movie is labeled when the movie label is left out', () async {
    final server = _Server(
      {
        'movies': const ['new'],
      },
      released: {'new': DateTime.now().subtract(const Duration(days: 10))},
    );

    await load(
      server,
      itemCount: 10,
      newReleaseKinds: UserPreferences.mediaBarNewSeason,
    );

    expect(slides.single.newRelease, isNull);
  });

  // The server's titles have no air date, so nothing counts as aired lately.
  test('a quiet new release window shows random titles from a later source '
      'when the first has none', () async {
    final server = _Server({
      'empty': const [],
      'full': const ['f0', 'f1', 'f2'],
    });

    final shown = await load(
      server,
      itemCount: 10,
      source: UserPreferences.mediaBarSourceNewReleases,
    );

    expect(shown.toSet(), {'f0', 'f1', 'f2'});
  });
}
