import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/download_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/saved_media_presence.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/left_sidebar.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/ui/widgets/top_toolbar.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeUserRepository extends Fake implements UserRepository {
  @override
  User? get currentUser => null;
  @override
  Stream<User?> get currentUserStream => const Stream.empty();
}

class _FakeUserViewsRepository extends ChangeNotifier
    implements UserViewsRepository {
  @override
  Future<List<AggregatedLibrary>> getUserViews() async => [];
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakePluginSyncService extends ChangeNotifier
    implements PluginSyncService {
  @override
  bool get seerrAvailable => false;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSessionRepository extends Fake implements SessionRepository {
  @override
  String? get activeUserId => null;
}

class _FakeGameLibraryRegistry extends Fake implements GameLibraryRegistry {
  @override
  Future<void> refresh() async {}
}

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();
  @override
  final QueueService queueService = QueueService();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

/// Serves one read of the downloads table.
class _FakeOfflineRepository extends Fake implements OfflineRepository {
  _FakeOfflineRepository(this.rows);

  final List<DownloadedItem> rows;

  @override
  Stream<List<DownloadedItem>> watchItems({
    String? type,
    bool onlyCompleted = false,
  }) => Stream.value(rows);
}

class _FakeDownloadService extends ChangeNotifier implements DownloadService {
  _FakeDownloadService([this._active = const {}]);

  final Map<String, DownloadProgress> _active;

  @override
  Map<String, DownloadProgress> get activeDownloads => _active;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

/// A completed file on disk, which is what the saved media list counts.
DownloadedItem _savedMovie() => DownloadedItem(
  itemId: 'm1',
  serverId: 's1',
  type: 'Movie',
  name: 'A movie',
  localFilePath: '/tmp/a.mkv',
  metadataJson: '{}',
  downloadStatus: 2,
  downloadProgress: 1.0,
  fileSizeBytes: 1000,
  playbackPositionTicks: 0,
  progressSynced: true,
  qualityPreset: 'original',
  downloadSource: 'manual',
);

/// A Series row: complete and carries artwork, but holds no file. The saved
/// media list drops these, so the nav entry has to as well.
DownloadedItem _seriesShell() => DownloadedItem(
  itemId: 'sh1',
  serverId: 's1',
  type: 'Series',
  name: 'A show',
  localFilePath: null,
  metadataJson: '{}',
  downloadStatus: 2,
  downloadProgress: 1.0,
  fileSizeBytes: 0,
  playbackPositionTicks: 0,
  progressSynced: true,
  qualityPreset: 'original',
  downloadSource: 'manual',
  posterPath: '/tmp/poster.jpg',
);

Widget _host(Widget chrome) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: chrome),
);

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final getIt = GetIt.instance;
    getIt.registerSingleton<PreferenceStore>(store);
    getIt.registerSingleton<UserPreferences>(UserPreferences(store));
    getIt.registerSingleton<UserRepository>(_FakeUserRepository());
    getIt.registerSingleton<UserViewsRepository>(_FakeUserViewsRepository());
    getIt.registerSingleton<PluginSyncService>(_FakePluginSyncService());
    getIt.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, _FakeSessionRepository()),
    );
    getIt.registerSingleton<GameLibraryRegistry>(_FakeGameLibraryRegistry());
    getIt.registerSingleton<PlaybackManager>(_FakePlaybackManager());
    getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
  });

  tearDown(() async {
    NavigationLayout.chromeFocusRoots.clear();
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  void registerPresence({
    List<DownloadedItem> rows = const [],
    Map<String, DownloadProgress> active = const {},
  }) {
    GetIt.instance.registerSingleton<SavedMediaPresence>(
      SavedMediaPresence(
        _FakeOfflineRepository(rows),
        _FakeDownloadService(active),
      ),
    );
  }

  final downloads = find.byKey(const ValueKey('toolbar-downloads'));
  final sidebarDownloads = find.byKey(const ValueKey('sidebar-downloads'));

  group('the downloads nav entry', () {
    testWidgets('stays away while nothing is saved', (tester) async {
      registerPresence();
      await tester.pumpWidget(_host(const TopToolbar()));
      await tester.pumpAndSettle();

      expect(downloads, findsNothing);
    });

    testWidgets('appears once something is saved', (tester) async {
      registerPresence(rows: [_savedMovie()]);
      await tester.pumpWidget(_host(const TopToolbar()));
      await tester.pumpAndSettle();

      expect(downloads, findsOneWidget);
    });

    testWidgets('ignores rows that hold no file', (tester) async {
      // Saving an episode writes Series and Season rows that count as
      // complete. On their own they would open an empty screen.
      registerPresence(rows: [_seriesShell()]);
      await tester.pumpWidget(_host(const TopToolbar()));
      await tester.pumpAndSettle();

      expect(downloads, findsNothing);
    });

    testWidgets('appears for a download still running', (tester) async {
      // Nothing has finished, so this is the only way in to watch or cancel.
      registerPresence(
        active: {
          'm1': const DownloadProgress(
            itemId: 'm1',
            fileName: 'a.mkv',
            progress: 0.4,
          ),
        },
      );
      await tester.pumpWidget(_host(const TopToolbar()));
      await tester.pumpAndSettle();

      expect(downloads, findsOneWidget);
    });

    testWidgets('holds off on the sidebar too', (tester) async {
      registerPresence();
      await tester.pumpWidget(_host(const LeftSidebar()));
      await tester.pumpAndSettle();

      expect(sidebarDownloads, findsNothing);
    });

    testWidgets('shows on the sidebar once something is saved', (tester) async {
      registerPresence(rows: [_savedMovie()]);
      await tester.pumpWidget(_host(const LeftSidebar()));
      await tester.pumpAndSettle();

      expect(sidebarDownloads, findsOneWidget);
    });
  });

}
