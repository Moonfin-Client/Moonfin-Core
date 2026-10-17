import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
  });

  test('adds and removes once, per server', () async {
    await prefs.setDownloadKept('server-a', 'm1', keep: true);
    await prefs.setDownloadKept('server-a', 'm1', keep: true);
    await prefs.setDownloadKept('server-b', 'm2', keep: true);
    expect(prefs.get(UserPreferences.downloadKeptIds), hasLength(2));
    expect(prefs.downloadKeptIdsFor('server-a'), {'m1'});

    await prefs.setDownloadKept('server-a', 'm1', keep: false);
    expect(prefs.isDownloadKept('server-a', 'm1'), isFalse);
    expect(prefs.isDownloadKept('server-b', 'm2'), isTrue);
  });

  test('a server id that prefixes another is not confused with it', () async {
    await prefs.setDownloadKept('server', 'm1', keep: true);
    expect(prefs.downloadKeptIdsFor('server-a'), isEmpty);
  });

  test('forgetting drops that server and item only', () async {
    await prefs.setDownloadKept('server-a', '1', keep: true);
    await prefs.setDownloadKept('server-a', '10', keep: true);
    // Emby ids are plain numbers, so another server can share one.
    await prefs.setDownloadKept('server-b', '1', keep: true);

    await prefs.forgetDownloadKept('server-a', '1');

    expect(prefs.downloadKeptIdsFor('server-a'), {'10'});
    expect(prefs.downloadKeptIdsFor('server-b'), {'1'});
  });
}
