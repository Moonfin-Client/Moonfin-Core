import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

class _Sync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Users extends Mock implements UserRepository {}

class _Offline extends Mock implements OfflineRepository {}

class _Playback extends Mock implements PlaybackManager {}

class _Queue extends Mock implements QueueService {}

// A phone held sideways shows Play as a circle beside the others, and touch
// never focuses it, so its label has to sit underneath like theirs.
void main() {
  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final sync = _Sync();
    when(() => sync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    final seerrPrefs = _SeerrPrefs();
    when(() => seerrPrefs.showRequestStatus).thenReturn(false);
    GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);

    final users = _Users();
    when(() => users.currentUserStream).thenAnswer((_) => const Stream.empty());
    GetIt.instance.registerSingleton<UserRepository>(users);

    final offline = _Offline();
    when(() => offline.getItem(any())).thenAnswer((_) async => null);
    GetIt.instance.registerSingleton<OfflineRepository>(offline);

    final queue = _Queue();
    final playback = _Playback();
    when(() => playback.queueService).thenReturn(queue);
    GetIt.instance.registerSingleton<PlaybackManager>(playback);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pumpButtons(
    WidgetTester tester, {
    bool labelsUnderCircles = false,
  }) async {
    final vm = _ViewModel();
    when(() => vm.item).thenReturn(
      AggregatedItem(
        id: 'movie-1',
        serverId: 'server-1',
        rawData: const {'Id': 'movie-1', 'Type': 'Movie'},
      ),
    );
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.supportsPersonalRating).thenReturn(false);
    when(() => vm.searchesYouTubeForTrailer).thenReturn(false);
    when(() => vm.features).thenReturn(const []);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: SingleChildScrollView(
            child: DetailActionButtons(
              viewModel: vm,
              itemId: 'movie-1',
              onSelectedMediaSourceChanged: (_) {},
              modernStyle: true,
              labelsUnderCircles: labelsUnderCircles,
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('Play keeps its label under it on a phone in landscape', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    await pumpButtons(tester);

    final play = find.byIcon(Icons.play_arrow);
    expect(play, findsOneWidget);
    expect(find.text('Play'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('Play')).dy,
      greaterThan(tester.getBottomLeft(play).dy),
    );
  });

  // Neon Pulse colors labels with its accent, which is also the pill's fill.
  testWidgets('Play inside its accent pill uses the accent text color', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    ThemeRegistry.setActiveById(ThemeRegistry.neonPulseId);
    addTearDown(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));
    await pumpButtons(tester, labelsUnderCircles: true);

    final label = tester.widget<Text>(
      find.descendant(
        of: find.byType(MarqueeText),
        matching: find.text('Play'),
      ),
    );
    expect(label.style?.color, AppColorScheme.onAccent);
  });
}
