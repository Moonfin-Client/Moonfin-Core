import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/ui/screens/detail/person_links_row.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

class _Sync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Users extends Mock implements UserRepository {}

// Issue #1721: a person page links out to the person's own pages.

AggregatedItem _person({Map<String, String>? ids}) => AggregatedItem(
  id: 'person-1',
  serverId: 'server-1',
  rawData: {
    'Id': 'person-1',
    'Name': 'Jack Black',
    'Type': 'Person',
    'ProviderIds': ids ?? {'Imdb': 'nm0085312', 'Tmdb': '70851'},
  },
);

const TmdbPersonAccounts _jackBlack = (
  imdbId: 'nm0085312',
  homepage: null,
  instagram: 'jackblack',
  twitter: 'jackblack',
  facebook: 'JackBlack',
  tiktok: 'jackblack',
  youtube: '@JablinskiGames',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('personLinksFor', () {
    test('links every account TMDB has, in order', () {
      final links = personLinksFor(_person(), _jackBlack);

      expect(links.map((l) => l.site), [
        PersonSite.imdb,
        PersonSite.tmdb,
        PersonSite.instagram,
        PersonSite.x,
        PersonSite.facebook,
        PersonSite.tiktok,
        PersonSite.youtube,
      ]);
      expect(links.map((l) => l.url), [
        'https://www.imdb.com/name/nm0085312/',
        'https://www.themoviedb.org/person/70851',
        'https://www.instagram.com/jackblack/',
        'https://x.com/jackblack',
        'https://www.facebook.com/JackBlack',
        'https://www.tiktok.com/@jackblack',
        'https://www.youtube.com/@JablinskiGames',
      ]);
      expect(links[2].handle, '@jackblack');
      expect(links[6].handle, '@JablinskiGames');
    });

    test('without the plugin the server ids still give IMDb and TMDB', () {
      final links = personLinksFor(_person(), null);

      expect(links.map((l) => l.site), [PersonSite.imdb, PersonSite.tmdb]);
    });

    test('TMDB fills in an IMDb id the server lacks', () {
      final links = personLinksFor(_person(ids: {'Tmdb': '70851'}), _jackBlack);

      expect(links.first.url, 'https://www.imdb.com/name/nm0085312/');
    });

    test('a channel id and a homepage open where they belong', () {
      final links = personLinksFor(_person(ids: const {}), (
        imdbId: null,
        homepage: 'https://example.com/about',
        instagram: null,
        twitter: null,
        facebook: null,
        tiktok: null,
        youtube: 'UCabcdefghijklmnopqrstuv',
      ));

      expect(links.map((l) => l.url), [
        'https://www.youtube.com/channel/UCabcdefghijklmnopqrstuv',
        'https://example.com/about',
      ]);
      expect(links.last.handle, 'example.com');
    });

    test('drops anything it could not open safely', () {
      final links = personLinksFor(_person(ids: {'Imdb': 'tt1', 'Tmdb': 'x'}), (
        imdbId: null,
        homepage: 'javascript:alert(1)',
        instagram: 'jack/../black',
        twitter: 'jack black',
        facebook: null,
        tiktok: null,
        youtube: null,
      ));

      expect(links, isEmpty);
    });
  });

  group('on the page', () {
    late _ViewModel vm;

    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

      final sync = _Sync();
      when(() => sync.seerrAvailable).thenReturn(true);
      GetIt.instance.registerSingleton<PluginSyncService>(sync);

      final seerrPrefs = _SeerrPrefs();
      when(() => seerrPrefs.labelOrDefault(any())).thenReturn('Seerr');
      GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);

      final users = _Users();
      when(() => users.currentUserStream).thenAnswer((_) => const Stream.empty());
      when(() => users.currentUser).thenReturn(null);
      GetIt.instance.registerSingleton<UserRepository>(users);

      vm = _ViewModel();
      when(() => vm.item).thenReturn(_person());
      when(() => vm.supportsPersonFavorites).thenReturn(true);
      when(() => vm.personAccounts).thenReturn(_jackBlack);
    });

    tearDown(() async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
      await GetIt.instance.reset();
    });

    Widget app(Widget child) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [Locale('en')],
      home: Scaffold(body: Center(child: child)),
    );

    Widget actions() => DetailActionButtons(
      viewModel: vm,
      itemId: 'person-1',
      onSelectedMediaSourceChanged: (_) {},
      modernStyle: true,
      fullWidthPrimary: true,
    );

    // The round tile the circle buttons sit in, label underneath.
    Finder roundTile(String label) => find.ancestor(
      of: find.text(label),
      matching: find.byWidgetPredicate((w) => w is SizedBox && w.width == 66),
    );

    testWidgets('each link names its account in a tooltip', (tester) async {
      await tester.pumpWidget(
        app(PersonLinksRow(item: _person(), accounts: _jackBlack)),
      );

      expect(find.byTooltip('IMDb'), findsOneWidget);
      expect(find.byTooltip('TMDB'), findsOneWidget);
      expect(find.byTooltip('Instagram · @jackblack'), findsOneWidget);
      expect(find.byTooltip('YouTube · @JablinskiGames'), findsOneWidget);
      expect(find.byType(InkWell), findsNWidgets(7));
    });

    testWidgets('switching the links off in Details sections hides them', (
      tester,
    ) async {
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(UserPreferences.hiddenDetailSectionsMobile, 'personLinks');
      await prefs.set(UserPreferences.hiddenDetailSectionsDesktop, 'personLinks');

      await tester.pumpWidget(
        app(PersonLinksRow(item: _person(), accounts: _jackBlack)),
      );

      expect(find.byType(InkWell), findsNothing);
    });

    testWidgets('a person with nothing to link gets no row', (tester) async {
      await tester.pumpWidget(
        app(PersonLinksRow(item: _person(ids: const {}))),
      );

      expect(find.byType(InkWell), findsNothing);
      expect(find.byType(Wrap), findsNothing);
    });

    testWidgets('on a phone Favorite, Display and Seerr are round', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(app(actions()));
      await tester.pump();

      expect(roundTile('Favorite'), findsOneWidget);
      expect(roundTile('Display'), findsOneWidget);
      expect(roundTile('Seerr'), findsOneWidget);
      expect(find.byTooltip('Instagram · @jackblack'), findsOneWidget);
    });

    testWidgets('on desktop Favorite stays the wide button, without Seerr', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(app(actions()));
      await tester.pump();

      expect(roundTile('Favorite'), findsNothing);
      expect(find.text('Seerr'), findsNothing);
      expect(find.byTooltip('IMDb'), findsOneWidget);
    });
  });
}
