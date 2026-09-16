import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockItemsApi itemsApi;
  late _MockClient client;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    itemsApi = _MockItemsApi();
    client = _MockClient();
    when(() => client.itemsApi).thenReturn(itemsApi);
  });

  tearDown(() => GetIt.instance.reset());

  const empty = {'Items': <dynamic>[], 'TotalRecordCount': 0};

  /// The one long argument list both the stub and the check need.
  Future<Map<String, dynamic>> callItems({required bool capture}) =>
      itemsApi.getItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        excludeItemTypes: any(named: 'excludeItemTypes'),
        genreIds: any(named: 'genreIds'),
        filters: any(named: 'filters'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        recursive: any(named: 'recursive'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        isFavorite: any(named: 'isFavorite'),
        fields: capture ? captureAny(named: 'fields') : any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
      );

  Future<Map<String, dynamic>> callResume({required bool capture}) =>
      itemsApi.getResumeItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        mediaTypes: any(named: 'mediaTypes'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        fields: capture ? captureAny(named: 'fields') : any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
      );

  /// Runs the row and hands back the Fields it asked the server for.
  Future<String> fieldsAskedFor(
    Future<void> Function(RowDataSource rows) loadRow, {
    required bool resume,
  }) async {
    when(() => resume ? callResume(capture: false) : callItems(capture: false))
        .thenAnswer((_) async => empty);

    await loadRow(RowDataSource(client));

    final captured = verify(
      () => resume ? callResume(capture: true) : callItems(capture: true),
    ).captured;
    return captured.first as String;
  }

  test('an album row asks for the artist its card prints', () async {
    final fields = await fieldsAskedFor(
      (rows) => rows.loadAudioAlbums('srv1'),
      resume: false,
    );

    expect(fields, contains('Artists'));
    expect(fields, contains('AlbumArtist'));
  });

  // People roughly doubles what these queries cost and no row card reads it,
  // so the rows that do want a cast ask for it themselves.
  test("a row that prints no cast doesn't pay for People", () async {
    final fields = await fieldsAskedFor(
      (rows) => rows.loadAudioAlbums('srv1'),
      resume: false,
    );

    expect(fields, isNot(contains('People')));
  });

  test('an artist row leaves the artist fields off', () async {
    final fields = await fieldsAskedFor(
      (rows) => rows.loadAudioArtists('srv1'),
      resume: false,
    );

    expect(fields, isNot(contains('Artists')));
  });

  test('a resume row for audio asks for the artist', () async {
    final fields = await fieldsAskedFor(
      (rows) => rows.loadResumeAudio('srv1'),
      resume: true,
    );

    expect(fields, contains('Artists'));
  });

  test('a resume row for video leaves the artist fields off', () async {
    final fields = await fieldsAskedFor(
      (rows) => rows.loadResume('srv1'),
      resume: true,
    );

    expect(fields, isNot(contains('Artists')));
  });
}
