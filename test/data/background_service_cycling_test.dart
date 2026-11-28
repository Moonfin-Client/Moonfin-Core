import 'dart:math';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const urls = [
    'http://server/Items/1/Images/Backdrop/0',
    'http://server/Items/1/Images/Backdrop/1',
    'http://server/Items/1/Images/Backdrop/2',
    'http://server/Items/1/Images/Backdrop/3',
  ];

  group('BackgroundService details cycling', () {
    test('shuffles without replacement across full cycles and avoids boundary repeats', () {
      fakeAsync((async) {
        final service = BackgroundService(
          random: Random(42),
          shuffleDetails: () => true,
          detailsDuration: () => const Duration(seconds: 15),
        );
        final seen = <String?>[];
        final sub = service.backgroundStream.listen(seen.add);

        service.setBackgroundUrls(urls, context: BlurContext.details);
        // Advance through 3 full passes (12 total displays: 1 initial + 11 ticks).
        for (var i = 0; i < 11; i++) {
          async.elapse(const Duration(seconds: 15));
        }

        expect(seen, hasLength(12));
        for (var pass = 0; pass < 3; pass++) {
          final slice = seen.sublist(pass * 4, (pass + 1) * 4);
          expect(slice.toSet(), equals(urls.toSet()));
        }
        // No immediate repeat across cycle boundaries.
        for (var i = 1; i < seen.length; i++) {
          expect(seen[i], isNot(equals(seen[i - 1])));
        }

        sub.cancel();
        service.dispose();
      });
    });

    test('cycles strictly in server order when shuffle is disabled', () {
      fakeAsync((async) {
        final service = BackgroundService(
          random: Random(1),
          shuffleDetails: () => false,
          detailsDuration: () => const Duration(seconds: 5),
        );
        final seen = <String?>[];
        final sub = service.backgroundStream.listen(seen.add);

        service.setBackgroundUrls(urls, context: BlurContext.details);
        for (var i = 0; i < 5; i++) {
          async.elapse(const Duration(seconds: 5));
        }

        expect(seen, [urls[0], urls[1], urls[2], urls[3], urls[0], urls[1]]);

        sub.cancel();
        service.dispose();
      });
    });

    test('uses configured details duration and defaults to 15 seconds', () {
      fakeAsync((async) {
        final service = BackgroundService(
          shuffleDetails: () => false,
        );
        final seen = <String?>[];
        final sub = service.backgroundStream.listen(seen.add);

        service.setBackgroundUrls(urls, context: BlurContext.details);
        async.flushMicrotasks();
        expect(seen, [urls[0]]);

        async.elapse(const Duration(seconds: 14));
        expect(seen, [urls[0]]);

        async.elapse(const Duration(seconds: 1));
        expect(seen, [urls[0], urls[1]]);

        sub.cancel();
        service.dispose();
      });
    });

    test('browsing context ignores details shuffle and keeps 30s server order', () {
      fakeAsync((async) {
        final service = BackgroundService(
          random: Random(7),
          shuffleDetails: () => true,
          detailsDuration: () => const Duration(seconds: 5),
        );
        final seen = <String?>[];
        final sub = service.backgroundStream.listen(seen.add);

        service.setBackgroundUrls(urls, context: BlurContext.browsing);
        async.flushMicrotasks();
        expect(seen, [urls[0]]);

        async.elapse(const Duration(seconds: 29));
        expect(seen, [urls[0]]);

        async.elapse(const Duration(seconds: 1));
        expect(seen, [urls[0], urls[1]]);

        sub.cancel();
        service.dispose();
      });
    });

    test('single backdrop does not schedule cycling', () {
      fakeAsync((async) {
        final service = BackgroundService(
          shuffleDetails: () => true,
          detailsDuration: () => const Duration(seconds: 5),
        );
        final seen = <String?>[];
        final sub = service.backgroundStream.listen(seen.add);

        service.setBackgroundUrls([urls.first], context: BlurContext.details);
        async.elapse(const Duration(minutes: 2));

        expect(seen, [urls.first]);

        sub.cancel();
        service.dispose();
      });
    });
  });

  group('BackgroundService saved UserPreferences', () {
    late UserPreferences prefs;

    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues(<String, Object>{
        'pref_last_server_id': 'srv1',
        'pref_last_user_id': 'usr1',
      });
      final store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
    });

    tearDown(() async {
      await GetIt.instance.reset();
    });

    test('reads saved detailsBackdropShuffle=false from scoped preferences', () async {
      await prefs.set(UserPreferences.detailsBackdropShuffle, false);
      await prefs.set(UserPreferences.detailsBackdropIntervalMs, 5000);

      fakeAsync((async) {
        final service = BackgroundService(random: Random(99));
        final seen = <String?>[];
        final sub = service.backgroundStream.listen(seen.add);

        service.setBackgroundUrls(urls, context: BlurContext.details);
        async.flushMicrotasks();
        for (var i = 0; i < 4; i++) {
          async.elapse(const Duration(seconds: 5));
        }

        expect(seen, [urls[0], urls[1], urls[2], urls[3], urls[0]]);

        sub.cancel();
        service.dispose();
      });
    });

    for (final intervalMs in [5000, 10000, 15000, 30000]) {
      test('honors saved detailsBackdropIntervalMs=$intervalMs', () async {
        await prefs.set(UserPreferences.detailsBackdropShuffle, false);
        await prefs.set(UserPreferences.detailsBackdropIntervalMs, intervalMs);

        fakeAsync((async) {
          final service = BackgroundService();
          final seen = <String?>[];
          final sub = service.backgroundStream.listen(seen.add);

          service.setBackgroundUrls(urls, context: BlurContext.details);
          async.flushMicrotasks();
          expect(seen, [urls[0]]);

          async.elapse(Duration(milliseconds: intervalMs - 1));
          expect(seen, [urls[0]]);

          async.elapse(const Duration(milliseconds: 1));
          expect(seen, [urls[0], urls[1]]);

          sub.cancel();
          service.dispose();
        });
      });
    }

    test('falls back to 15 seconds for an invalid saved interval', () async {
      await prefs.set(UserPreferences.detailsBackdropShuffle, false);
      await prefs.set(UserPreferences.detailsBackdropIntervalMs, 9999);

      fakeAsync((async) {
        final service = BackgroundService();
        final seen = <String?>[];
        final sub = service.backgroundStream.listen(seen.add);

        service.setBackgroundUrls(urls, context: BlurContext.details);
        async.flushMicrotasks();
        expect(seen, [urls[0]]);

        async.elapse(const Duration(seconds: 14));
        expect(seen, [urls[0]]);

        async.elapse(const Duration(seconds: 1));
        expect(seen, [urls[0], urls[1]]);

        sub.cancel();
        service.dispose();
      });
    });
  });
}
