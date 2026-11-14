import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

class _Sync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Users extends Mock implements UserRepository {}

class _Offline extends Mock implements OfflineRepository {}

class _Playback extends Mock implements PlaybackManager {}

class _Queue extends Mock implements QueueService {}

AggregatedItem _movie({required bool played, Duration? position}) =>
    AggregatedItem(
      id: 'movie-1',
      serverId: 'server-1',
      rawData: {
        'Id': 'movie-1',
        'Name': 'Movie',
        'Type': 'Movie',
        'RunTimeTicks': const Duration(minutes: 90).inMicroseconds * 10,
        'UserData': {
          'Played': played,
          'IsFavorite': false,
          'PlaybackPositionTicks':
              (position ?? Duration.zero).inMicroseconds * 10,
        },
      },
    );

// Marking a title watched clears its resume point, which takes Restart out of
// the row. The button after Watched used to slide under the focus, so the next
// OK on the remote toggled Favorite instead of Watched.
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

  Future<void> run(
    WidgetTester tester, {
    bool modernStyle = false,
    bool nouveauStyle = false,
    int? buttonLimit,
    bool hostNodes = false,
    double? rowWidth,
  }) async {
    // The Modern page hands in its own nodes for the row's right end and the
    // first button of the second line.
    final rightNode = FocusNode(debugLabel: 'actionRowRight');
    final extraFirstNode = FocusNode(debugLabel: 'extraFirstBtn');
    addTearDown(rightNode.dispose);
    addTearDown(extraFirstNode.dispose);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    if (buttonLimit != null) {
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.detailButtonsMaxVisible,
        buttonLimit,
      );
    }

    // Nouveau's Play pill is width capped and also shows the time left, which
    // the test font is too wide to fit unless little time is left.
    var item = _movie(
      played: false,
      position: Duration(minutes: nouveauStyle ? 88 : 20),
    );
    final vm = _ViewModel();
    when(() => vm.item).thenAnswer((_) => item);
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.actionsSettled).thenReturn(true);
    when(() => vm.supportsPersonalRating).thenReturn(false);
    when(() => vm.searchesYouTubeForTrailer).thenReturn(false);
    when(() => vm.features).thenReturn(const []);
    when(() => vm.toggleFavorite()).thenAnswer((_) async {});
    when(() => vm.togglePlayed()).thenAnswer((_) async {
      item = item.isPlayed ? _movie(played: false) : _movie(played: true);
    });

    Widget app() => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [Locale('en')],
      home: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: rowWidth,
            child: DetailActionButtons(
              viewModel: vm,
              itemId: 'movie-1',
              onSelectedMediaSourceChanged: (_) {},
              modernStyle: modernStyle,
              nouveauStyle: nouveauStyle,
              actionRowRightFocusNode: hostNodes ? rightNode : null,
              extraFirstFocusNode: hostNodes ? extraFirstNode : null,
            ),
          ),
        ),
      ),
    );

    final focusedButton = find.byElementPredicate(
      (e) => identical(e, FocusManager.instance.primaryFocus?.context),
    );
    Finder inFocus(Finder matching) =>
        find.descendant(of: focusedButton, matching: matching);

    // A scrolling row animates to the focused button over a few frames.
    Future<void> settle() async {
      for (var i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 60));
      }
    }

    void expectFocusedInView() {
      final viewport = tester.getRect(
        find.descendant(
          of: find.byType(DetailActionButtons),
          matching: find.byType(SingleChildScrollView),
        ),
      );
      // The pill's border leaves the viewport a hair narrower than a button,
      // so the button's middle is what has to be in view.
      final button = tester.getRect(focusedButton);
      expect(
        viewport.left <= button.center.dx && button.center.dx <= viewport.right,
        isTrue,
        reason: 'the focused button is outside the scrolling row',
      );
    }

    await tester.pumpWidget(app());
    // Let the page hand its initial focus to Play first.
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.byIcon(Icons.restart_alt), findsOneWidget);
    // A short row folds Watched into the second line behind More.
    expect(
      find.byIcon(Icons.expand_more),
      buttonLimit == 2 ? findsOneWidget : findsNothing,
    );
    if (buttonLimit == 2) {
      await tester.tap(find.byIcon(Icons.expand_more));
      await tester.pump();
    }

    final watched = find.byIcon(Icons.check_circle_outline);
    expect(watched, findsOneWidget);
    Focus.of(tester.element(watched)).requestFocus();
    await settle();
    expect(inFocus(watched), findsOneWidget);
    if (rowWidth != null) expectFocusedInView();

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    verify(() => vm.togglePlayed()).called(1);
    // The view model notifies the page, which rebuilds the row.
    await tester.pumpWidget(app());
    await settle();
    expect(find.byIcon(Icons.restart_alt), findsNothing);
    expect(inFocus(find.byIcon(Icons.check_circle)), findsOneWidget);
    if (rowWidth != null) expectFocusedInView();

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    verify(() => vm.togglePlayed()).called(1);
    verifyNever(() => vm.toggleFavorite());

    // Restart's node outlives its button, so Left has to skip it and land on
    // Play, and Right comes back to Watched.
    await tester.pumpWidget(app());
    await tester.pump();
    final watchedNode = FocusManager.instance.primaryFocus;
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();
    expect(inFocus(find.byIcon(Icons.play_arrow)), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(FocusManager.instance.primaryFocus, same(watchedNode));
  }

  testWidgets('focus stays on Watched when Restart leaves the row', (
    tester,
  ) async {
    await run(tester);
  });

  testWidgets('focus stays on Watched in the modern row', (tester) async {
    await run(tester, modernStyle: true);
  });

  testWidgets('focus stays on Watched in the scrolling row', (tester) async {
    await run(tester, buttonLimit: -1);
  });

  testWidgets('a scrolling row keeps Watched in view when Restart leaves', (
    tester,
  ) async {
    // One button wide, so Watched is the only one showing when it's pressed.
    await run(tester, buttonLimit: -1, rowWidth: 200);
  });

  testWidgets('focus stays on Watched in the second line', (tester) async {
    await run(tester, buttonLimit: 2);
  });

  testWidgets('focus stays on Watched with the modern page nodes', (
    tester,
  ) async {
    await run(tester, modernStyle: true, hostNodes: true);
  });

  testWidgets('focus stays on Watched in the nouveau row', (tester) async {
    await run(tester, nouveauStyle: true);
  });

  testWidgets(
    'focus follows Watched out of the second line with the modern page nodes',
    (tester) async {
      await run(tester, modernStyle: true, buttonLimit: 2, hostNodes: true);
    },
  );
}
