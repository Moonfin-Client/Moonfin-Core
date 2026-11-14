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

  Widget buttons(
    _ViewModel vm,
    bool labelsUnderCircles, {
    bool fullWidthPrimary = false,
  }) => MaterialApp(
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
          fullWidthPrimary: fullWidthPrimary,
        ),
      ),
    ),
  );

  Future<_ViewModel> pumpButtons(
    WidgetTester tester, {
    bool labelsUnderCircles = false,
    bool fullWidthPrimary = false,
    bool actionsSettled = true,
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
    when(() => vm.actionsSettled).thenReturn(actionsSettled);
    when(() => vm.searchesYouTubeForTrailer).thenReturn(false);
    when(() => vm.features).thenReturn(const []);

    await tester.pumpWidget(
      buttons(vm, labelsUnderCircles, fullWidthPrimary: fullWidthPrimary),
    );
    return vm;
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

  BoxDecoration nearestDecoration(WidgetTester tester, Finder of) {
    final box = find
        .ancestor(
          of: of,
          matching: find.byWidgetPredicate(
            (w) =>
                (w is AnimatedContainer && w.decoration is BoxDecoration) ||
                (w is Container && w.decoration is BoxDecoration),
          ),
        )
        .first;
    final widget = tester.widget(box);
    return (widget is AnimatedContainer
            ? widget.decoration
            : (widget as Container).decoration)!
        as BoxDecoration;
  }

  // A Play filled with the accent reads as focused when the accent is white,
  // beside the circle that really is, so until it has focus it looks like the
  // circles. Both the labeled pill and the full-width one Stage uses.
  for (final fullWidthPrimary in [false, true]) {
    testWidgets('Play without focus matches the circles '
        '(${fullWidthPrimary ? 'full width' : 'labeled pill'})', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
      await pumpButtons(
        tester,
        labelsUnderCircles: true,
        fullWidthPrimary: fullWidthPrimary,
      );

      final play = nearestDecoration(tester, find.text('Play'));
      final circle = nearestDecoration(tester, find.byIcon(Icons.cast));
      expect(play.color, circle.color);
      expect(play.border!.top.color, circle.border!.top.color);
    });
  }

  // A phone shows no focus, so its Play keeps the accent fill.
  testWidgets('Play on a phone keeps the accent fill', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    await pumpButtons(tester, fullWidthPrimary: true);

    final play = nearestDecoration(tester, find.text('Play'));
    expect(play.color, AppColorScheme.accent);
  });

  // The row waits for the late lookups so a button doesn't pop in after the
  // rest, and nothing in it can be pressed or focused while it's invisible.
  testWidgets('the row stays hidden and untappable until its actions settle', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    await pumpButtons(tester, actionsSettled: false);

    final row = find.byType(DetailActionButtons);
    final opacity = tester.widget<AnimatedOpacity>(
      find.descendant(of: row, matching: find.byType(AnimatedOpacity)).first,
    );
    expect(opacity.opacity, 0);
    final ignore = tester.widget<IgnorePointer>(
      find.descendant(of: row, matching: find.byType(IgnorePointer)).first,
    );
    expect(ignore.ignoring, isTrue);
    // Still laid out, so the content below doesn't move when it fades in.
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
  });

  // OK on a remote mustn't press an invisible Play, and Play still gets the
  // initial focus once the row shows.
  testWidgets('Play takes focus only once the row settles', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    final vm = await pumpButtons(tester, actionsSettled: false);
    await tester.pump();

    bool playFocused() {
      // With nothing focused the route's scope holds focus, and it wraps
      // every button.
      final node = FocusManager.instance.primaryFocus;
      final focused = node?.context;
      if (node is FocusScopeNode || focused == null) return false;
      return find
          .descendant(
            of: find.byElementPredicate((e) => e == focused),
            matching: find.byIcon(Icons.play_arrow),
          )
          .evaluate()
          .isNotEmpty;
    }

    expect(playFocused(), isFalse);

    when(() => vm.actionsSettled).thenReturn(true);
    await tester.pumpWidget(buttons(vm, false));
    await tester.pump();
    expect(playFocused(), isTrue);
  });
}
