import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/download_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeOfflineRepository extends Fake implements OfflineRepository {
  @override
  Stream<DownloadedItem?> watchItem(String itemId) => Stream.value(null);
}

class _FakeDownloadService extends ChangeNotifier implements DownloadService {
  @override
  bool isDownloading(String itemId) => false;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

final _movie = AggregatedItem(
  id: 'movie-1',
  serverId: 'server-1',
  rawData: const {
    'Id': 'movie-1',
    'Name': 'Moana',
    'Type': 'Movie',
    'MediaType': 'Video',
  },
);

Future<void> _pump(WidgetTester tester, {bool reorderable = false}) async {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => Scaffold(
          body: TrackTile(
            track: _movie,
            index: 1,
            currentIndex: 0,
            totalCount: 2,
            isPlaylist: true,
            reorderable: reorderable,
            reorderIndex: 0,
            onTap: () {},
          ),
        ),
      ),
      GoRoute(
        path: '/item/:id',
        builder: (_, state) =>
            Scaffold(body: Text('details ${state.pathParameters['id']}')),
      ),
    ],
  );
  await tester.pumpWidget(
    MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final getIt = GetIt.instance;
    getIt.registerSingleton<UserPreferences>(UserPreferences(store));
    getIt.registerSingleton<UserRepository>(UserRepository());
    getIt.registerSingleton<PlaybackManager>(PlaybackManager());
    getIt.registerSingleton<OfflineRepository>(_FakeOfflineRepository());
    getIt.registerSingleton<DownloadService>(_FakeDownloadService());
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('View Details follows Play Next and opens the item', (
    tester,
  ) async {
    await _pump(tester);
    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    final rows = ['Play', 'Play Next', 'View Details', 'Add to Queue'];
    final tops = [for (final row in rows) tester.getTopLeft(find.text(row)).dy];
    expect(tops, orderedEquals([...tops]..sort()));

    await tester.tap(find.text('View Details'));
    await tester.pumpAndSettle();

    expect(find.text('details movie-1'), findsOneWidget);
  });

  testWidgets('a long press opens the menu on a regular row', (tester) async {
    await _pump(tester);
    await tester.longPress(find.text('Moana'));
    await tester.pumpAndSettle();

    expect(find.text('View Details'), findsOneWidget);
  });

  testWidgets('a long press leaves a reorderable row to its drag handle', (
    tester,
  ) async {
    await _pump(tester, reorderable: true);
    await tester.longPress(find.text('Moana'));
    await tester.pumpAndSettle();

    expect(find.text('View Details'), findsNothing);
  });

  testWidgets('a right click opens the menu on a reorderable row', (
    tester,
  ) async {
    await _pump(tester, reorderable: true);
    await tester.tap(find.text('Moana'), buttons: kSecondaryButton);
    await tester.pumpAndSettle();

    expect(find.text('View Details'), findsOneWidget);
  });
}
