import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/providers/offline_providers.dart';
import 'package:moonfin/data/services/sync_service.dart';
import 'package:moonfin/di/providers.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/downloads/downloads_home.dart';
import 'package:moonfin/ui/screens/downloads/widgets/saved_media_row.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Only the columns the list reads are filled in.
DownloadedItem _saved(
  String id, {
  String type = 'Movie',
  String? name,
  String? seriesId,
  String? seriesName,
  int? season,
  int? episode,
  int bytes = 1000,
  String metadata = '{}',
  String? localFilePath = '/tmp/saved.mkv',
}) => DownloadedItem(
  itemId: id,
  serverId: 's1',
  type: type,
  name: name ?? id,
  localFilePath: localFilePath,
  metadataJson: metadata,
  downloadStatus: 2,
  downloadProgress: 1.0,
  fileSizeBytes: bytes,
  playbackPositionTicks: 0,
  progressSynced: true,
  qualityPreset: 'original',
  downloadSource: 'manual',
  seriesId: seriesId,
  seriesName: seriesName,
  indexNumber: episode,
  parentIndexNumber: season,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  Future<void> pumpHome(
    WidgetTester tester, {
    required List<DownloadedItem> items,
    Map<String, String> containerArtwork = const {},
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          downloadedCatalogProvider.overrideWith(
            (_) => Stream.value(
              DownloadCatalog(
                items: items,
                containerArtwork: containerArtwork,
              ),
            ),
          ),
          storageUsedProvider.overrideWith((_) => Stream.value(4000)),
          // The header's sync dot would otherwise reach for the whole sync
          // service, which this screen never touches itself.
          syncStateProvider.overrideWithValue(SyncState.idle),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const DownloadsHome(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('a device with only films offers no Shows or Episodes tab', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpHome(
      tester,
      items: [_saved('m1', name: 'Children of Men')],
    );

    expect(find.text(l10n.all), findsOneWidget);
    expect(find.text(l10n.movies), findsOneWidget);
    expect(find.text(l10n.activeDownloads), findsOneWidget);
    expect(find.text(l10n.tvShows), findsNothing);
    expect(find.text(l10n.episodes), findsNothing);
    expect(find.text(l10n.books), findsNothing);
  });

  testWidgets('saved episodes collapse to one row per show in All', (
    tester,
  ) async {
    await pumpHome(
      tester,
      items: [
        _saved('m1', name: 'Children of Men', bytes: 9000),
        _saved(
          'e1',
          type: 'Episode',
          name: 'Pilot',
          seriesId: 'bb',
          seriesName: 'Breaking Bad',
          season: 1,
          episode: 1,
        ),
        _saved(
          'e2',
          type: 'Episode',
          name: "Cat's in the Bag...",
          seriesId: 'bb',
          seriesName: 'Breaking Bad',
          season: 1,
          episode: 2,
        ),
      ],
    );

    expect(find.byType(SavedMediaRow), findsNWidgets(2));
    expect(find.text('Breaking Bad'), findsOneWidget);
    expect(find.text('Children of Men'), findsOneWidget);
    // The episode titles belong on the show's own screen, not in the list.
    expect(find.text('Pilot'), findsNothing);
  });

  testWidgets('the Episodes tab lists every saved episode flat', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpHome(
      tester,
      items: [
        _saved(
          'e1',
          type: 'Episode',
          name: 'Pilot',
          seriesId: 'bb',
          seriesName: 'Breaking Bad',
          season: 1,
          episode: 1,
        ),
        _saved(
          'e2',
          type: 'Episode',
          name: "Cat's in the Bag...",
          seriesId: 'bb',
          seriesName: 'Breaking Bad',
          season: 1,
          episode: 2,
        ),
      ],
    );

    await tester.tap(find.text(l10n.episodes));
    await tester.pumpAndSettle();

    expect(find.byType(SavedMediaRow), findsNWidgets(2));
    expect(find.text('Pilot'), findsOneWidget);
    expect(find.text("Cat's in the Bag..."), findsOneWidget);
    // An episode outside its show has to say which show it belongs to.
    expect(find.text('Breaking Bad • S1 E1'), findsOneWidget);
  });

  testWidgets('a movie row reads year, rating and type off the metadata', (
    tester,
  ) async {
    await pumpHome(
      tester,
      items: [
        _saved(
          'm1',
          name: 'Puss in Boots: The Last Wish',
          metadata:
              '{"Name":"Puss in Boots: The Last Wish","Type":"Movie",'
              '"ProductionYear":2022,"OfficialRating":"PG"}',
        ),
      ],
    );

    expect(find.text('2022 • PG • Movie'), findsOneWidget);
  });

  testWidgets('the empty state shows when nothing is downloaded', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpHome(tester, items: const []);

    expect(find.text(l10n.savedMediaNoDownloads), findsOneWidget);
    expect(find.byType(SavedMediaRow), findsNothing);
  });

  testWidgets('Active Downloads stays available with nothing downloading', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpHome(tester, items: [_saved('m1')]);

    await tester.tap(find.text(l10n.activeDownloads));
    await tester.pumpAndSettle();

    expect(find.text(l10n.savedMediaNoActiveDownloads), findsOneWidget);
  });

  testWidgets('desktop and mobile get a back arrow', (tester) async {
    await pumpHome(tester, items: [_saved('m1')]);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('TV has no back arrow, because the remote already has one', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    await pumpHome(tester, items: [_saved('m1')]);
    // The panel's navigator pops on remote Back, so an arrow would only be one
    // more thing for the d-pad to walk past.
    expect(find.byIcon(Icons.arrow_back), findsNothing);
  });

  testWidgets('the item count rides on the storage line, not the title bar', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpHome(
      tester,
      items: [_saved('m1'), _saved('m2'), _saved('m3')],
    );

    // One line carries both, so a narrow panel never has to ellipsize the
    // title to make room for a chip saying what the strip already says.
    expect(find.textContaining(l10n.savedMediaCount(3)), findsOneWidget);
    expect(find.text(l10n.savedMedia), findsOneWidget);
  });

  testWidgets('a music download gets its own tab rather than only All', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpHome(
      tester,
      items: [_saved('t1', type: 'Audio', name: 'A Track')],
    );

    expect(find.text(l10n.music), findsOneWidget);
    expect(find.text(l10n.movies), findsNothing);
  });
}
