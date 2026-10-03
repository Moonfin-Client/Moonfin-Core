import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/skipped_episode_cleanup.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockUserLibraryApi extends Mock implements UserLibraryApi {}

Map<String, dynamic> _episode(
  String id,
  int number,
  Map<String, dynamic> userData, {
  String seriesId = 'series',
}) => {
  'Id': id,
  'Type': 'Episode',
  'SeriesId': seriesId,
  'ParentIndexNumber': 1,
  'IndexNumber': number,
  'UserData': userData,
};

AggregatedItem _item(Map<String, dynamic> raw, {String serverId = 'srv'}) =>
    AggregatedItem(id: raw['Id'] as String, serverId: serverId, rawData: raw);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockClient client;
  late _MockItemsApi itemsApi;
  late _MockUserLibraryApi libraryApi;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    itemsApi = _MockItemsApi();
    libraryApi = _MockUserLibraryApi();
    client = _MockClient();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(libraryApi);
    when(
      () => libraryApi.markPlayed(any(), datePlayed: any(named: 'datePlayed')),
    ).thenAnswer((_) async {});
  });

  tearDown(() => GetIt.instance.reset());

  void seriesEpisodes(String seriesId, List<Map<String, dynamic>> episodes) {
    when(() => itemsApi.getEpisodes(seriesId, fields: any(named: 'fields')))
        .thenAnswer((_) async => {'Items': episodes});
  }

  final leftover = _episode('e10', 10, {
    'PlayedPercentage': 85,
    'LastPlayedDate': '2026-08-23T18:00:00Z',
  });
  final current = _episode('e11', 11, {
    'PlayedPercentage': 20,
    'LastPlayedDate': '2026-08-23T19:00:00Z',
  });

  test('marks the leftover played at its own date and drops it', () async {
    seriesEpisodes('series', [leftover, current]);

    final result = await cleanupSkippedEpisodeEndings(
      resume: [_item(current), _item(leftover)],
      client: client,
    );

    expect(result.map((item) => item.id), ['e11']);
    verify(
      () => libraryApi.markPlayed(
        'e10',
        datePlayed: DateTime.utc(2026, 8, 23, 18),
      ),
    ).called(1);
    verifyNever(
      () => libraryApi.markPlayed('e11', datePlayed: any(named: 'datePlayed')),
    );
  });

  test('skips the series lookup when nothing reaches the threshold', () async {
    final resume = [_item(current)];

    final result = await cleanupSkippedEpisodeEndings(
      resume: resume,
      client: client,
    );

    expect(identical(result, resume), isTrue);
    verifyNever(
      () => itemsApi.getEpisodes(any(), fields: any(named: 'fields')),
    );
  });

  test('keeps candidates when the series lookup fails', () async {
    when(() => itemsApi.getEpisodes('series', fields: any(named: 'fields')))
        .thenThrow(Exception('offline'));
    final resume = [_item(current), _item(leftover)];

    final result = await cleanupSkippedEpisodeEndings(
      resume: resume,
      client: client,
    );

    expect(result.map((item) => item.id), ['e11', 'e10']);
    verifyNever(
      () => libraryApi.markPlayed(any(), datePlayed: any(named: 'datePlayed')),
    );
  });

  test('keeps the leftover on the row when marking it fails', () async {
    seriesEpisodes('series', [leftover, current]);
    when(
      () => libraryApi.markPlayed('e10', datePlayed: any(named: 'datePlayed')),
    ).thenThrow(Exception('500'));

    final result = await cleanupSkippedEpisodeEndings(
      resume: [_item(current), _item(leftover)],
      client: client,
    );

    expect(result.map((item) => item.id), ['e11', 'e10']);
  });

  test('multi-server cleanup only touches the matching server', () async {
    seriesEpisodes('series', [leftover, current]);
    final resume = [
      _item(current, serverId: 'a'),
      _item(leftover, serverId: 'a'),
      _item(leftover, serverId: 'b'),
    ];

    final result = await cleanupSkippedEpisodeEndingsMultiServer(
      resume: resume,
      clientsByServerId: {'a': client},
    );

    expect(result.map((item) => '${item.serverId}:${item.id}'), [
      'a:e11',
      'b:e10',
    ]);
  });
}
