import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/playback/external_player_policy.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

AggregatedItem _item(String type) => AggregatedItem(
  id: type,
  serverId: 'server',
  rawData: {'Id': type, 'Type': type, 'MediaType': 'Video'},
);

bool _covers(List<String> types) =>
    ExternalPlayerPolicy.coversQueue(types.map(_item).toList());

void main() {
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
  });

  tearDown(() => debugDefaultTargetPlatformOverride = null);

  test(
    'a channel goes to the external player once the setting is on',
    () async {
      expect(_covers(['TvChannel']), isFalse);
      await prefs.set(UserPreferences.useExternalPlayer, true);
      expect(_covers(['TvChannel']), isTrue);
    },
  );

  test('Live TV only keeps everything else in the built-in player', () async {
    await prefs.set(UserPreferences.useExternalPlayer, true);
    await prefs.set(UserPreferences.externalPlayerLiveTvOnly, true);
    expect(_covers(['TvChannel']), isTrue);
    expect(_covers(['Program']), isTrue);
    expect(_covers(['Movie']), isFalse);
    expect(_covers(['TvChannel', 'Episode']), isFalse);
  });

  test('Live TV only means nothing while the external player is off', () async {
    await prefs.set(UserPreferences.externalPlayerLiveTvOnly, true);
    expect(_covers(['TvChannel']), isFalse);
  });

  test('only Android hands playback to an external player', () async {
    await prefs.set(UserPreferences.useExternalPlayer, true);
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    expect(_covers(['Movie']), isFalse);
  });
}
