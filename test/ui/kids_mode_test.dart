import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/synced_fields.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_buttons.dart';
import 'package:moonfin/util/live_tv_library.dart';
import 'package:moonfin/util/pin_code_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues(<String, Object>{
    'pref_last_server_id': 'srv1',
    'pref_last_user_id': 'usr1',
  });
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

/// The rows Kids Mode is meant to leave standing, spelled out here so the
/// tests fail if the allow list quietly grows.
bool _kidsModeKeeps(HomeSectionType type) =>
    type == HomeSectionType.libraryTilesSmall ||
    type == HomeSectionType.latestMedia ||
    type == HomeSectionType.resume ||
    type == HomeSectionType.nextUp;

Future<PreferenceStore> _store() async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  return store;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('the preference', () {
    test('is off unless it is turned on', () async {
      final prefs = await _prefs();
      expect(prefs.get(UserPreferences.kidsModeEnabled), isFalse);
    });

    test('is stored per server and user', () async {
      final prefs = await _prefs();
      final effective = prefs.getEffectivePreference(
        UserPreferences.kidsModeEnabled,
      );
      // Scoped means the same account on a second device stays normal.
      expect(effective.key, isNot(UserPreferences.kidsModeEnabled.key));
    });

    test('isn\'t synced to the server', () async {
      // Syncing it would put the parent's phone in Kids Mode too.
      expect(
        syncedFields.any((f) => f.pref == UserPreferences.kidsModeEnabled),
        isFalse,
      );
    });
  });

  group('home sections', () {
    Future<UserPreferences> withSections(
      List<HomeSectionConfig> configs, {
      required bool kidsMode,
    }) async {
      final prefs = await _prefs();
      await prefs.setHomeSectionsConfig(configs);
      await prefs.set(UserPreferences.kidsModeEnabled, kidsMode);
      return prefs;
    }

    test('keeps requests and live tv rows when the mode is off', () async {
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.libraryTilesSmall,
          enabled: true,
          order: 0,
        ),
        HomeSectionConfig(
          type: HomeSectionType.liveTv,
          enabled: true,
          order: 1,
        ),
        HomeSectionConfig(
          type: HomeSectionType.seerrTrending,
          enabled: true,
          order: 2,
        ),
      ], kidsMode: false);

      final types = prefs.activeHomeSectionConfigs.map((c) => c.type);
      expect(types, contains(HomeSectionType.liveTv));
      expect(types, contains(HomeSectionType.seerrTrending));
    });

    test('drops requests and live tv rows when the mode is on', () async {
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.libraryTilesSmall,
          enabled: true,
          order: 0,
        ),
        HomeSectionConfig(
          type: HomeSectionType.liveTv,
          enabled: true,
          order: 1,
        ),
        HomeSectionConfig(
          type: HomeSectionType.seerrTrending,
          enabled: true,
          order: 2,
        ),
        HomeSectionConfig(
          type: HomeSectionType.activeRecordings,
          enabled: true,
          order: 3,
        ),
      ], kidsMode: true);

      final types = prefs.activeHomeSectionConfigs.map((c) => c.type);
      expect(types, contains(HomeSectionType.libraryTilesSmall));
      expect(types, isNot(contains(HomeSectionType.liveTv)));
      expect(types, isNot(contains(HomeSectionType.seerrTrending)));
      expect(types, isNot(contains(HomeSectionType.activeRecordings)));
    });

    test('keeps what is part way through being watched', () async {
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.libraryTilesSmall,
          enabled: true,
          order: 0,
        ),
        HomeSectionConfig(
          type: HomeSectionType.resume,
          enabled: true,
          order: 1,
        ),
        HomeSectionConfig(
          type: HomeSectionType.nextUp,
          enabled: true,
          order: 2,
        ),
      ], kidsMode: true);

      final types = prefs.activeHomeSectionConfigs.map((c) => c.type);
      expect(types, contains(HomeSectionType.resume));
      expect(types, contains(HomeSectionType.nextUp));
    });

    test('shows the two as one row whatever the account chose', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.mergeContinueWatchingNextUp, false);

      await prefs.set(UserPreferences.kidsModeEnabled, false);
      expect(prefs.effectiveMergeContinueWatchingNextUp, isFalse);

      await prefs.set(UserPreferences.kidsModeEnabled, true);
      expect(prefs.effectiveMergeContinueWatchingNextUp, isTrue);
    });

    test('leaves the ratings off the screen it lands on', () async {
      final prefs = await _prefs();

      await prefs.set(UserPreferences.kidsModeEnabled, false);
      expect(prefs.effectiveShowDetailRatings, isTrue);

      await prefs.set(UserPreferences.kidsModeEnabled, true);
      expect(prefs.effectiveShowDetailRatings, isFalse);
    });

    test('adds My Media when the user had turned it off', () async {
      // The navbar loses its libraries entry in Kids Mode, so without this
      // there's no way into a library at all.
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.libraryTilesSmall,
          enabled: false,
          order: 0,
        ),
        HomeSectionConfig(type: HomeSectionType.resume, enabled: true, order: 1),
      ], kidsMode: true);

      final types = prefs.activeHomeSectionConfigs.map((c) => c.type);
      expect(types.first, HomeSectionType.libraryTilesSmall);
    });

    test('adds nothing when a library row is already there', () async {
      const sections = [
        HomeSectionConfig(
          type: HomeSectionType.latestMedia,
          enabled: true,
          order: 0,
        ),
        HomeSectionConfig(
          type: HomeSectionType.libraryTilesSmall,
          enabled: true,
          order: 1,
        ),
      ];
      final off = await withSections(sections, kidsMode: false);
      final before = off.activeHomeSectionConfigs.map((c) => c.type).toList();

      final on = await withSections(sections, kidsMode: true);
      final after = on.activeHomeSectionConfigs.map((c) => c.type).toList();

      // A library row is already standing, so nothing is added. It does move
      // to the front, which is the one thing Kids Mode changes about order.
      expect(after.toSet(), before.where(_kidsModeKeeps).toSet());
      expect(after.first, HomeSectionType.libraryTilesSmall);
    });

    test('puts My Media first even when the account had it last', () async {
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.resume,
          enabled: true,
          order: 0,
        ),
        HomeSectionConfig(
          type: HomeSectionType.latestMedia,
          enabled: true,
          order: 1,
        ),
        HomeSectionConfig(
          type: HomeSectionType.libraryTilesSmall,
          enabled: true,
          order: 2,
        ),
      ], kidsMode: true);

      // Saved rows are merged with the defaults, so what follows is not fixed.
      // The point is that the way into the libraries leads whatever order the
      // account gave it.
      final types = prefs.activeHomeSectionConfigs.map((c) => c.type).toList();
      expect(types.first, HomeSectionType.libraryTilesSmall);
      expect(types.skip(1), isNot(contains(HomeSectionType.libraryTilesSmall)));
    });

    test('drops the small library row in favour of the artwork one', () async {
      // A child picks a library by what it looks like, so the row that draws
      // artwork is the one that stays.
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.libraryButtons,
          enabled: true,
          order: 0,
        ),
      ], kidsMode: true);

      final types = prefs.activeHomeSectionConfigs.map((c) => c.type);
      expect(types, isNot(contains(HomeSectionType.libraryButtons)));
      expect(types, contains(HomeSectionType.libraryTilesSmall));
    });

    test('keeps the libraries, the latest and the unfinished', () async {
      // One row of every family the home screen can show.
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.libraryTilesSmall,
          enabled: true,
          order: 0,
        ),
        HomeSectionConfig(
          type: HomeSectionType.latestMedia,
          enabled: true,
          order: 1,
        ),
        HomeSectionConfig(
          type: HomeSectionType.mediaBar,
          enabled: true,
          order: 2,
        ),
        HomeSectionConfig(type: HomeSectionType.resume, enabled: true, order: 3),
        HomeSectionConfig(type: HomeSectionType.nextUp, enabled: true, order: 4),
        HomeSectionConfig(
          type: HomeSectionType.rewatch,
          enabled: true,
          order: 5,
        ),
        HomeSectionConfig(
          type: HomeSectionType.sinceYouWatched1,
          enabled: true,
          order: 6,
        ),
        HomeSectionConfig(
          type: HomeSectionType.seerrShortcuts,
          enabled: true,
          order: 7,
        ),
        HomeSectionConfig(
          type: HomeSectionType.seerrTrending,
          enabled: true,
          order: 8,
        ),
        HomeSectionConfig(
          type: HomeSectionType.imdbTop250Movies,
          enabled: true,
          order: 9,
        ),
        HomeSectionConfig(
          type: HomeSectionType.tmdbTrendingAllWeekly,
          enabled: true,
          order: 10,
        ),
        HomeSectionConfig(
          type: HomeSectionType.radarrCalendar,
          enabled: true,
          order: 11,
        ),
        HomeSectionConfig(
          type: HomeSectionType.sonarrCalendar,
          enabled: true,
          order: 12,
        ),
        HomeSectionConfig(
          type: HomeSectionType.liveTv,
          enabled: true,
          order: 13,
        ),
        HomeSectionConfig(
          type: HomeSectionType.collections,
          enabled: true,
          order: 14,
        ),
        HomeSectionConfig(
          type: HomeSectionType.genres,
          enabled: true,
          order: 15,
        ),
      ], kidsMode: true);

      expect(prefs.activeHomeSectionConfigs.map((c) => c.type), [
        HomeSectionType.libraryTilesSmall,
        HomeSectionType.latestMedia,
        HomeSectionType.resume,
        HomeSectionType.nextUp,
      ]);
    });

    test('hides a row type nobody thought about', () async {
      // The point of an allow list: whatever gets added to the enum next is
      // hidden here until someone decides a child should see it.
      final unlisted = HomeSectionType.values.where(
        (t) => t != HomeSectionType.none && !_kidsModeKeeps(t),
      );

      final prefs = await withSections([
        for (final (i, type) in unlisted.indexed)
          HomeSectionConfig(type: type, enabled: true, order: i),
      ], kidsMode: true);

      // Saved rows are merged with the defaults, so the allowed rows can come
      // back on their own. What must not survive is anything else.
      expect(
        prefs.activeHomeSectionConfigs.map((c) => c.type),
        everyElement(predicate<HomeSectionType>(_kidsModeKeeps)),
      );
    });

    test('doesn\'t rewrite the saved config', () async {
      final prefs = await withSections(const [
        HomeSectionConfig(
          type: HomeSectionType.liveTv,
          enabled: true,
          order: 0,
        ),
      ], kidsMode: true);

      // Filtered on read, so turning the mode off gives the layout back.
      expect(
        prefs.homeSectionsConfig.map((c) => c.type),
        contains(HomeSectionType.liveTv),
      );
      await prefs.set(UserPreferences.kidsModeEnabled, false);
      expect(
        prefs.activeHomeSectionConfigs.map((c) => c.type),
        contains(HomeSectionType.liveTv),
      );
    });
  });

  group('the PIN', () {
    test('is a different code from the sign in PIN', () async {
      final store = await _store();
      await PinCodeUtil(store, 'usr1').setPin('1111');
      await PinCodeUtil.kidsMode(store, 'usr1').setPin('2222');

      expect(PinCodeUtil(store, 'usr1').verifyPin('1111'), isTrue);
      expect(PinCodeUtil.kidsMode(store, 'usr1').verifyPin('1111'), isFalse);
      expect(PinCodeUtil.kidsMode(store, 'usr1').verifyPin('2222'), isTrue);
    });

    test('lets a few wrong guesses through without a wait', () async {
      final pin = PinCodeUtil.kidsMode(await _store(), 'usr1');
      await pin.setPin('2222');
      for (var i = 0; i < 5; i++) {
        expect(await pin.registerFailedAttempt(), Duration.zero);
      }
      expect(pin.isLockedOut, isFalse);
    });

    test('makes the wait grow once the free guesses run out', () async {
      final pin = PinCodeUtil.kidsMode(await _store(), 'usr1');
      await pin.setPin('2222');
      for (var i = 0; i < 5; i++) {
        await pin.registerFailedAttempt();
      }
      final first = await pin.registerFailedAttempt();
      expect(first, greaterThan(Duration.zero));
      expect(await pin.registerFailedAttempt(), greaterThan(first));
      expect(pin.isLockedOut, isTrue);
    });

    test('caps the wait so a parent is never locked out for long', () async {
      final pin = PinCodeUtil.kidsMode(await _store(), 'usr1');
      await pin.setPin('2222');
      Duration last = Duration.zero;
      for (var i = 0; i < 80; i++) {
        last = await pin.registerFailedAttempt();
      }
      expect(last, const Duration(minutes: 15));
    });

    test('refuses the right PIN while locked out', () async {
      final pin = PinCodeUtil.kidsMode(await _store(), 'usr1');
      await pin.setPin('2222');
      for (var i = 0; i < 6; i++) {
        await pin.registerFailedAttempt();
      }
      expect(pin.verifyPin('2222'), isFalse);

      await pin.clearFailedAttempts();
      expect(pin.verifyPin('2222'), isTrue);
    });

    test('is gone once the mode is exited, so the next one gets chosen', () async {
      // Nothing else in the app can change this PIN, so a leftover would leave
      // the mode locked behind a code the next parent never picked.
      final store = await _store();
      final pin = PinCodeUtil.kidsMode(store, 'usr1');
      await pin.setPin('2222');
      expect(pin.isPinEnabled, isTrue);

      await pin.removePin();

      expect(pin.isPinEnabled, isFalse);
      expect(pin.verifyPin('2222'), isFalse);
    });

    test('clearing it leaves the sign in PIN alone', () async {
      final store = await _store();
      final signIn = PinCodeUtil(store, 'usr1');
      await signIn.setPin('1111');
      await PinCodeUtil.kidsMode(store, 'usr1').setPin('2222');

      await PinCodeUtil.kidsMode(store, 'usr1').removePin();

      expect(signIn.isPinEnabled, isTrue);
      expect(signIn.verifyPin('1111'), isTrue);
    });

    test('clearing it drops a lockout that was running', () async {
      final store = await _store();
      final pin = PinCodeUtil.kidsMode(store, 'usr1');
      await pin.setPin('2222');
      for (var i = 0; i < 8; i++) {
        await pin.registerFailedAttempt();
      }
      expect(pin.isLockedOut, isTrue);

      await pin.removePin();
      await pin.setPin('3333');

      expect(pin.isLockedOut, isFalse);
      expect(pin.verifyPin('3333'), isTrue);
    });

    test('forgets past guesses when the PIN is set again', () async {
      final pin = PinCodeUtil.kidsMode(await _store(), 'usr1');
      await pin.setPin('2222');
      for (var i = 0; i < 6; i++) {
        await pin.registerFailedAttempt();
      }
      expect(pin.isLockedOut, isTrue);
      await pin.setPin('3333');
      expect(pin.isLockedOut, isFalse);
    });
  });

  group('the Live TV nav entry', () {
    AggregatedLibrary lib(String id, String type) => AggregatedLibrary(
      id: id,
      name: id,
      collectionType: type,
      serverId: 'srv1',
    );

    final libraries = [
      lib('movies', 'movies'),
      lib('guide', 'livetv'),
      lib('shows', 'tvshows'),
    ];

    List<String> idsOf(List<AggregatedLibrary> libs) =>
        libs.map((l) => l.id).toList();

    test('keeps the library when the guide button is not standing in for it', () {
      expect(
        idsOf(librariesForNav(libraries, false)),
        ['movies', 'guide', 'shows'],
      );
    });

    test('drops the library when the guide button covers it', () {
      expect(idsOf(librariesForNav(libraries, true)), ['movies', 'shows']);
    });

    test('drops the library in Kids Mode even with no button to replace it', () {
      // The button being hidden is what makes this matter: without the flag
      // the tile would quietly become the only way into the guide.
      expect(
        idsOf(librariesForNav(libraries, false, hideLiveTv: true)),
        ['movies', 'shows'],
      );
    });

    test('drops the library in Kids Mode however the server spells the type', () {
      final shouty = [lib('movies', 'movies'), lib('guide', 'LiveTV')];
      expect(
        idsOf(librariesForNav(shouty, false, hideLiveTv: true)),
        ['movies'],
      );
    });

    test('leaves a server with no Live TV library alone', () {
      final none = [lib('movies', 'movies'), lib('shows', 'tvshows')];
      expect(
        idsOf(librariesForNav(none, false, hideLiveTv: true)),
        ['movies', 'shows'],
      );
    });
  });


  group('the details screen style', () {
    Future<UserPreferences> withKidsMode(bool on) async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.kidsModeEnabled, on);
      return prefs;
    }

    test('is Minimalist whatever style the user stored', () async {
      for (final stored in DetailScreenStyle.values) {
        final prefs = await withKidsMode(true);
        await prefs.set(UserPreferences.detailScreenStyle, stored);
        expect(
          prefs.effectiveDetailScreenStyle,
          DetailScreenStyle.minimalist,
          reason: stored.name,
        );
      }
    });

    test('leaves the stored style alone', () async {
      // The profile push reads the raw preference, so a forced value written
      // into the store would follow the account to the parent's own devices.
      final prefs = await withKidsMode(true);
      await prefs.set(UserPreferences.detailScreenStyle, DetailScreenStyle.nouveau);

      expect(
        prefs.get(UserPreferences.detailScreenStyle),
        DetailScreenStyle.nouveau,
      );

      await prefs.set(UserPreferences.kidsModeEnabled, false);
      expect(prefs.effectiveDetailScreenStyle, DetailScreenStyle.nouveau);
    });

    test('every style is still reachable with the mode off', () async {
      final prefs = await withKidsMode(false);
      for (final style in DetailScreenStyle.values) {
        await prefs.set(UserPreferences.detailScreenStyle, style);
        expect(prefs.effectiveDetailScreenStyle, style, reason: style.name);
      }
    });

    test('the toggles go to their minimal state', () async {
      final prefs = await withKidsMode(true);
      // Set each one to the opposite of what Kids Mode should report.
      await prefs.set(UserPreferences.detailExpandedTabs, true);
      await prefs.set(UserPreferences.detailShowTechnicalDetails, true);
      await prefs.set(UserPreferences.detailTrailersExternal, true);
      await prefs.set(UserPreferences.detailUseSeriesThumbnails, true);
      await prefs.set(
        UserPreferences.recommendationSystemSource,
        RecommendationSystemSource.server,
      );
      await prefs.set(
        UserPreferences.recommendationsApplyParentalRatingCap,
        false,
      );

      expect(prefs.effectiveDetailExpandedTabs, isFalse, reason: 'expandedTabs');
      expect(
        prefs.effectiveDetailShowTechnicalDetails,
        isFalse,
        reason: 'technicalDetails',
      );
      expect(
        prefs.effectiveDetailTrailersExternal,
        isFalse,
        reason: 'trailersExternal',
      );
      expect(
        prefs.effectiveDetailUseSeriesThumbnails,
        isFalse,
        reason: 'seriesThumbnails',
      );
      expect(
        prefs.effectiveRecommendationSystemSource,
        RecommendationSystemSource.local,
        reason: 'recommendationSource',
      );
      expect(
        prefs.effectiveRecommendationsApplyParentalRatingCap,
        isTrue,
        reason: 'ratingCap',
      );
    });

    test('hiding the description means forcing its flag on, not off', () async {
      // The preference is named for hiding, so its off state shows the
      // description. Minimal means true here, and this is the one that reads
      // backwards to anyone skimming.
      final prefs = await withKidsMode(true);
      await prefs.set(UserPreferences.hideDetailsMediaDescription, false);

      expect(prefs.get(UserPreferences.hideDetailsMediaDescription), isFalse);
      expect(prefs.effectiveHideDetailsMediaDescription, isTrue);
    });

    test('the toggles come back when the mode goes off', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.detailScreenStyle, DetailScreenStyle.classic);
      await prefs.set(UserPreferences.detailExpandedTabs, true);
      await prefs.set(UserPreferences.detailShowTechnicalDetails, true);
      await prefs.set(UserPreferences.detailTrailersExternal, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescription, false);
      await prefs.set(UserPreferences.detailUseSeriesThumbnails, true);

      await prefs.set(UserPreferences.kidsModeEnabled, true);
      await prefs.set(UserPreferences.kidsModeEnabled, false);

      expect(prefs.effectiveDetailScreenStyle, DetailScreenStyle.classic);
      expect(prefs.effectiveDetailExpandedTabs, isTrue);
      expect(prefs.effectiveDetailShowTechnicalDetails, isTrue);
      expect(prefs.effectiveDetailTrailersExternal, isTrue);
      expect(prefs.effectiveHideDetailsMediaDescription, isFalse);
      expect(prefs.effectiveDetailUseSeriesThumbnails, isTrue);
    });

    test('the style still syncs as the user picked it', () async {
      // syncedFields encodes through the raw getter, so Kids Mode must not be
      // able to reach the outgoing profile.
      final prefs = await withKidsMode(true);
      await prefs.set(UserPreferences.detailScreenStyle, DetailScreenStyle.spotlight);

      final field = syncedFields.firstWhere(
        (f) => f.pref == UserPreferences.detailScreenStyle,
      );
      expect(prefs.get(field.pref), DetailScreenStyle.spotlight);
    });
  });

  group('the details screen buttons', () {
    /// [DetailButton.isOffered] reads the preferences straight out of GetIt,
    /// so Kids Mode only exists for it once they are registered there.
    Future<void> withKidsMode({required bool on}) async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.kidsModeEnabled, on);
      await GetIt.instance.reset();
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
    }

    tearDown(() => GetIt.instance.reset());

    test('Kids Mode offers only the few a child needs', () async {
      await withKidsMode(on: true);

      for (final button in const [
        DetailButton.restart,
        DetailButton.shuffle,
        DetailButton.favorite,
      ]) {
        expect(button.isOffered, isTrue, reason: button.id);
      }
    });

    test('every other button is gone, not just the risky ones', () async {
      // A block list kept the dangerous buttons out but never kept the row
      // short, and the leftovers piled into an overflow menu that handed the
      // whole set back.
      await withKidsMode(on: true);

      const allowed = {
        DetailButton.restart,
        DetailButton.shuffle,
        DetailButton.favorite,
      };
      for (final button in DetailButton.values) {
        if (allowed.contains(button)) continue;
        expect(button.isOffered, isFalse, reason: button.id);
      }
    });

    test('the mode being on is what takes them away, not the device', () async {
      await withKidsMode(on: false);
      expect(DetailButton.admin.isOffered, isTrue);
    });

    test('the row is Restart, Shuffle, Favourite, in that order', () async {
      // The saved arrangement belongs to the parent, so the mode lays its own
      // row out rather than reading theirs.
      expect(DetailButton.kidsModeOrder, const [
        DetailButton.restart,
        DetailButton.shuffle,
        DetailButton.favorite,
      ]);
    });

    test('a button nobody thought about stays out', () async {
      // The point of the allow list: whatever gets added to the enum next is
      // out of Kids Mode until someone decides a child should have it.
      await withKidsMode(on: true);
      expect(DetailButton.watched.isOffered, isFalse);
      expect(DetailButton.audio.isOffered, isFalse);
      expect(DetailButton.version.isOffered, isFalse);
    });

    test('shrugs off preferences it cannot reach rather than hiding everything',
        () async {
      // Widgets can build before the preferences are registered, and a button
      // that vanishes in that window would be worse than one that stays.
      await GetIt.instance.reset();
      expect(DetailButton.admin.isOffered, isTrue);
    });
  });
}
