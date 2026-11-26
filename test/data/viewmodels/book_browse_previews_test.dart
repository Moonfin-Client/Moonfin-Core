import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/viewmodels/book_browse_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

Map<String, dynamic> _book(String id, String author) => {
  'Id': id,
  'Name': id,
  'Type': 'Book',
  'People': [
    {'Name': author, 'Type': 'Author'},
  ],
};

/// Answers the title scan, the artists and the genres, and nothing else.
class _FakeItemsApi extends Fake implements ItemsApi {
  final titles = [
    _book('dune', 'Frank Herbert'),
    _book('children-of-dune', 'Frank Herbert'),
    for (final letter in ['C', 'D', 'E', 'F', 'G'])
      _book('book-$letter', 'Writer $letter'),
    {
      'Id': 'foundation',
      'Name': 'Foundation',
      'Type': 'AudioBook',
      'AlbumArtist': 'Isaac Asimov',
      'Artists': ['Isaac Asimov'],
    },
  ];

  final artists = [
    {'Id': 'asimov', 'Name': 'Isaac Asimov', 'Type': 'MusicArtist'},
    {'Id': 'smith', 'Name': 'Zadie Smith', 'Type': 'MusicArtist'},
  ];

  final genres = [
    for (var i = 1; i <= 8; i++) {'Id': 'g$i', 'Name': 'Genre $i'},
  ];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final named = invocation.namedArguments;
    final limit = named[#limit] as int?;
    final types = named[#includeItemTypes] as List<String>? ?? const [];
    final List<Map<String, dynamic>> source = switch (invocation.memberName) {
      #getArtists => artists,
      #getGenres => genres,
      #getItems
          when named[#filters] == null &&
              named[#isFavorite] == null &&
              types.isNotEmpty =>
        [for (final t in titles) if (types.contains(t['Type'])) t],
      _ => const [],
    };
    return Future.value({
      'Items': limit == null ? source : source.take(limit).toList(),
      'TotalRecordCount': source.length,
    });
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BookBrowseViewModel vm;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final client = _MockClient();
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('user-1');
    when(() => client.itemsApi).thenReturn(_FakeItemsApi());
    when(() => client.imageApi).thenReturn(_MockImageApi());
    vm = BookBrowseViewModel(
      libraryId: 'lib-1',
      dataSource: RowDataSource(client),
      client: client,
      collectionType: 'books',
    );
    await vm.load();
  });

  tearDown(() => GetIt.instance.reset());

  test('the author preview puts artists first and stops at six', () {
    expect(vm.authorPreview.map((a) => a.name), [
      'Isaac Asimov',
      'Zadie Smith',
      'Frank Herbert',
      'Writer C',
      'Writer D',
      'Writer E',
    ]);
  });

  test('each author counts the titles they are on once', () {
    int count(String name) => vm.authorTitleCount(
      AggregatedItem(id: name, serverId: 's', rawData: {'Name': name}),
    );

    expect(count('Frank Herbert'), 2);
    // Named as both album artist and artist on the one audiobook.
    expect(count('isaac asimov'), 1);
    expect(count('Zadie Smith'), 0);
  });

  test('the genre preview is a few genres while the count is all of them', () {
    expect(vm.genrePreview, hasLength(6));
    expect(vm.genreCount, 8);
  });
}
