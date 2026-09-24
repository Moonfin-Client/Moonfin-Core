import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/providers/offline_providers.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/downloads/saved_show_screen.dart';
import 'package:moonfin/ui/screens/downloads/widgets/saved_media_row.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

DownloadedItem _episode(
  String id, {
  required int season,
  required int episode,
  String name = '',
  int bytes = 1000,
}) => DownloadedItem(
  itemId: id,
  serverId: 's1',
  type: 'Episode',
  name: name.isEmpty ? id : name,
  localFilePath: '/tmp/$id.mkv',
  metadataJson: '{}',
  downloadStatus: 2,
  downloadProgress: 1.0,
  fileSizeBytes: bytes,
  playbackPositionTicks: 0,
  progressSynced: true,
  qualityPreset: 'original',
  downloadSource: 'manual',
  seriesId: 'bb',
  seasonId: 'bb-s$season',
  seriesName: 'Breaking Bad',
  seasonName: 'Season $season',
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

  Future<void> pumpShow(
    WidgetTester tester,
    List<DownloadedItem> episodes,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          downloadedEpisodesProvider(
            'bb',
          ).overrideWith((_) => Stream.value(episodes)),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const SavedShowScreen(seriesId: 'bb', title: 'Breaking Bad'),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('episodes group into seasons and the first season shows', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpShow(tester, [
      _episode('e1', season: 1, episode: 1, name: 'Pilot'),
      _episode('e2', season: 1, episode: 2, name: "Cat's in the Bag..."),
      _episode('e3', season: 2, episode: 1, name: 'Seven Thirty-Seven'),
    ]);

    expect(find.text(l10n.seasonNumber(1)), findsOneWidget);
    expect(find.text(l10n.seasonNumber(2)), findsOneWidget);

    // Only the selected season's episodes are listed.
    expect(find.byType(SavedMediaRow), findsNWidgets(2));
    expect(find.text('Pilot'), findsOneWidget);
    expect(find.text('Seven Thirty-Seven'), findsNothing);
  });

  testWidgets('switching season swaps the episode list', (tester) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpShow(tester, [
      _episode('e1', season: 1, episode: 1, name: 'Pilot'),
      _episode('e3', season: 2, episode: 1, name: 'Seven Thirty-Seven'),
    ]);

    await tester.tap(find.text(l10n.seasonNumber(2)));
    await tester.pumpAndSettle();

    expect(find.text('Seven Thirty-Seven'), findsOneWidget);
    expect(find.text('Pilot'), findsNothing);
  });

  testWidgets('a show with one season shows no season tabs', (tester) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpShow(tester, [
      _episode('e1', season: 1, episode: 1, name: 'Pilot'),
      _episode('e2', season: 1, episode: 2, name: "Cat's in the Bag..."),
    ]);

    expect(find.text(l10n.seasonNumber(1)), findsNothing);
    expect(find.byType(SavedMediaRow), findsNWidgets(2));
  });

  testWidgets('season zero reads as Specials', (tester) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpShow(tester, [
      _episode('e0', season: 0, episode: 1, name: 'Minisode'),
      _episode('e1', season: 1, episode: 1, name: 'Pilot'),
    ]);

    expect(find.text(l10n.specials), findsOneWidget);
  });

  testWidgets('the header counts every saved episode, not just this season', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpShow(tester, [
      _episode('e1', season: 1, episode: 1),
      _episode('e2', season: 1, episode: 2),
      _episode('e3', season: 2, episode: 1),
    ]);

    expect(
      find.textContaining(l10n.episodeCount(3)),
      findsOneWidget,
      reason: 'the show header summarises the whole show',
    );
  });

  testWidgets('an episode inside its show drops the redundant show name', (
    tester,
  ) async {
    await pumpShow(tester, [
      _episode('e1', season: 1, episode: 1, name: 'Pilot'),
    ]);

    // The show name is already the heading here.
    expect(find.text('S1 E1 • original'), findsOneWidget);
    expect(find.text('Breaking Bad • S1 E1'), findsNothing);
  });
}
