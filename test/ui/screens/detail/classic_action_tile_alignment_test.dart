import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

class _Sync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Users extends Mock implements UserRepository {}

// Issue #1906: a classic tile whose label takes two lines, like Cancel Request,
// sat higher than the tiles beside it.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  testWidgets('classic tiles line up by their icons when a label wraps', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final vm = _ViewModel();
    when(() => vm.item).thenReturn(
      AggregatedItem(
        id: 'person-1',
        serverId: 'server-1',
        rawData: const {
          'Id': 'person-1',
          'Name': 'Jack Black',
          'Type': 'Person',
        },
      ),
    );
    when(() => vm.supportsPersonFavorites).thenReturn(true);
    when(() => vm.personAccounts).thenReturn(null);

    await tester.pumpWidget(
      MaterialApp(
        // Albanian's Favorite label wraps in an 80 pixel phone tile and its
        // Display label doesn't.
        locale: const Locale('sq'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Center(
            child: DetailActionButtons(
              viewModel: vm,
              itemId: 'person-1',
              onSelectedMediaSourceChanged: (_) {},
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final tiles = find.byWidgetPredicate((w) => w is SizedBox && w.width == 80);
    expect(tiles, findsAtLeastNWidgets(2));
    final rects = [
      for (final e in tiles.evaluate()) tester.getRect(find.byWidget(e.widget)),
    ];

    // The wrapped label makes one tile taller than the rest.
    final heights = rects.map((r) => r.height).toSet();
    expect(heights.length, greaterThan(1));
    expect(rects.map((r) => r.top).toSet(), hasLength(1));
  });
}
