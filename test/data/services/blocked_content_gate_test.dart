import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/blocked_content_gate.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

AggregatedItem _episode({String? rating, String? seriesId = 'series-1'}) =>
    AggregatedItem(
      id: 'ep-1',
      serverId: 'srv1',
      rawData: {
        'Id': 'ep-1',
        'Name': 'An episode',
        'Type': 'Episode',
        if (rating != null) 'OfficialRating': rating,
        if (seriesId != null) 'SeriesId': seriesId,
      },
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    resetParentalFilterCache();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    client = _Client();
    itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    await prefs.set(UserPreferences.blockedParentalRatings, 'TV-MA');
  });

  tearDown(() async {
    await GetIt.instance.reset();
    resetParentalFilterCache();
  });

  test('an episode is judged on its own rating when it has one', () async {
    final gate = BlockedContentGate(client, prefs);
    expect(await gate.isBlocked(_episode(rating: 'TV-G')), isFalse);
    verifyNever(() => itemsApi.getItem(any()));
  });

  test('an unrated episode is judged on the series it came from', () async {
    when(() => itemsApi.getItem('series-1')).thenAnswer(
      (_) async => {'Id': 'series-1', 'OfficialRating': 'TV-MA'},
    );
    final gate = BlockedContentGate(client, prefs);

    expect(await gate.isBlocked(_episode()), isTrue);
  });

  test('an observed series saves the lookup', () async {
    final gate = BlockedContentGate(client, prefs);
    gate.observe(
      AggregatedItem(
        id: 'series-1',
        serverId: 'srv1',
        rawData: {'Id': 'series-1', 'Type': 'Series', 'OfficialRating': 'TV-MA'},
      ),
    );

    expect(gate.isBlockedNow(_episode()), isTrue);
    expect(await gate.isBlocked(_episode()), isTrue);
    verifyNever(() => itemsApi.getItem(any()));
  });

  test('a failed lookup fails open rather than blanking the app', () async {
    when(() => itemsApi.getItem('series-1')).thenThrow(Exception('offline'));
    final gate = BlockedContentGate(client, prefs);

    expect(await gate.isBlocked(_episode()), isFalse);
  });

  test('a series once seen blocked stays blocked when the lookup fails', () async {
    // A refusal a dropped connection can undo isn't a refusal. This is the one
    // hole a child could exploit on purpose.
    when(() => itemsApi.getItem('series-1')).thenAnswer(
      (_) async => {'Id': 'series-1', 'OfficialRating': 'TV-MA'},
    );
    final first = BlockedContentGate(client, prefs);
    expect(await first.isBlocked(_episode()), isTrue);

    when(() => itemsApi.getItem('series-1')).thenThrow(Exception('offline'));
    final offline = BlockedContentGate(client, prefs);

    expect(offline.isBlockedNow(_episode()), isTrue);
    expect(await offline.isBlocked(_episode()), isTrue);
  });

  test('unblocking a rating releases the remembered series', () async {
    when(() => itemsApi.getItem('series-1')).thenAnswer(
      (_) async => {'Id': 'series-1', 'OfficialRating': 'TV-MA'},
    );
    expect(await BlockedContentGate(client, prefs).isBlocked(_episode()), isTrue);

    await prefs.set(UserPreferences.blockedParentalRatings, '');
    resetParentalFilterCache();

    expect(await BlockedContentGate(client, prefs).isBlocked(_episode()), isFalse);
  });

  test('an episode with no series at all is left alone', () async {
    final gate = BlockedContentGate(client, prefs);
    expect(await gate.isBlocked(_episode(seriesId: null)), isFalse);
  });
}
